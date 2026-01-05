<?php
namespace Mobile\Controller;

/**
 * 移动端在线客服聊天控制器
 */
class ChatController extends MobileController
{
    /**
     * 聊天主页
     */
    public function index()
    {
        // 检查用户登录
        $userId = session('userId');
        if (!$userId) {
            $this->error(L('请先登录'), U('Login/index'));
            return;
        }

        // 获取用户信息
        $user = M('user')->where(['id' => $userId])->find();
        if (!$user) {
            $this->error(L('用户不存在'));
            return;
        }

        // 获取用户的聊天历史
        $chatHistory = M('chat_session')->where(['user_id' => $userId])
            ->order('create_time DESC')
            ->limit(10)
            ->select();

        $this->assign('user', $user);
        $this->assign('chatHistory', $chatHistory);
        $this->display();
    }

    /**
     * 获取在线客服数量
     */
    public function getOnlineAgents()
    {
        if ($_POST) {
            try {
                $client = new \Common\Ext\LiveAgentClient();
                $agents = $client->getOnlineAgents();
                
                $this->ajaxReturn([
                    'code' => 1,
                    'count' => count($agents),
                    'agents' => $agents
                ]);
            } catch (\Exception $e) {
                \Think\Log::write('[Chat] 获取在线客服失败: ' . $e->getMessage(), 'ERROR');
                $this->ajaxReturn([
                    'code' => 0,
                    'info' => '获取在线客服失败'
                ]);
            }
        }
    }

    /**
     * 开始聊天（创建聊天会话）
     */
    public function startChat()
    {
        if ($_POST) {
            $userId = session('userId');
            if (!$userId) {
                $this->ajaxReturn(['code' => 0, 'info' => L('请先登录')]);
            }

            // 获取用户信息
            $user = M('user')->where(['id' => $userId])->find();
            if (!$user) {
                $this->ajaxReturn(['code' => 0, 'info' => L('用户不存在')]);
            }

            $message = trim(I('post.message', ''));
            if (empty($message)) {
                $this->ajaxReturn(['code' => 0, 'info' => L('请输入消息内容')]);
            }

            try {
                $client = new \Common\Ext\LiveAgentClient();

                // 1. 检查或创建联系人
                $contactResult = $client->getContactByEmail($user['username']);
                
                if ($contactResult['code'] == 0) {
                    // 创建新联系人
                    $contactData = [
                        'firstname' => $user['username'],
                        'emails' => [$user['username']],
                        'system_name' => $user['username'],
                    ];
                    
                    $contact = $client->createContact($contactData);
                    if (isset($contact['error'])) {
                        throw new \Exception('创建联系人失败: ' . $contact['message']);
                    }
                    $contactId = $contact['id'];
                } else {
                    $contactId = $contactResult['data']['id'];
                }

                // 2. 创建聊天工单
                $ticketData = [
                    'useridentifier' => $user['username'],
                    'subject' => '在线咨询',
                    'recipient' => $user['username'],
                    'recipient_name' => $user['username'],
                    'message' => $message,
                    'status' => 'N',
                    'do_not_send_mail' => 'Y',
                ];

                // 如果有默认部门，添加部门ID
                $deptId = C('liveagent.DEFAULT_DEPARTMENT_ID');
                if ($deptId) {
                    $ticketData['departmentid'] = $deptId;
                }

                $ticket = $client->createTicket($ticketData);
                
                if (isset($ticket['error'])) {
                    throw new \Exception('创建聊天失败: ' . $ticket['message']);
                }

                // 3. 保存到本地数据库
                $sessionId = M('chat_session')->add(array(
                    'user_id' => $userId,
                    'ticket_id' => $ticket['id'],
                    'ticket_code' => isset($ticket['code']) ? $ticket['code'] : '',
                    'contact_id' => $contactId,
                    'status' => 'active',
                    'create_time' => time(),
                    'update_time' => time(),
                ));

                if (!$sessionId) {
                    \Think\Log::write('[Chat] 保存会话失败', 'ERROR');
                }

                // 4. 保存消息记录
                M('chat_message')->add([
                    'session_id' => $sessionId,
                    'user_id' => $userId,
                    'message' => $message,
                    'sender_type' => 'user',
                    'create_time' => time(),
                ]);

                $this->ajaxReturn(array(
                    'code' => 1,
                    'info' => '聊天已开始',
                    'session_id' => $sessionId,
                    'ticket_id' => $ticket['id'],
                    'ticket_code' => isset($ticket['code']) ? $ticket['code'] : '',
                ));

            } catch (\Exception $e) {
                \Think\Log::write('[Chat] 开始聊天失败: ' . $e->getMessage(), 'ERROR');
                $this->ajaxReturn([
                    'code' => 0,
                    'info' => '聊天启动失败，请稍后重试'
                ]);
            }
        }
    }

    /**
     * 获取聊天消息
     */
    public function getMessages()
    {
        if ($_POST) {
            $sessionId = I('post.session_id', 0, 'intval');
            $userId = session('userId');

            if (!$userId) {
                $this->ajaxReturn(['code' => 0, 'info' => L('请先登录')]);
            }

            if (!$sessionId) {
                $this->ajaxReturn(['code' => 0, 'info' => '会话ID不能为空']);
            }

            // 验证会话所有权
            $session = M('chat_session')->where([
                'id' => $sessionId,
                'user_id' => $userId
            ])->find();

            if (!$session) {
                $this->ajaxReturn(['code' => 0, 'info' => '会话不存在']);
            }

            try {
                $client = new \Common\Ext\LiveAgentClient();
                
                // 从LiveAgent获取消息
                $messages = $client->getChatMessages($session['ticket_id']);
                
                if (isset($messages['error'])) {
                    throw new \Exception($messages['message']);
                }

                // 处理消息格式
                $formattedMessages = $this->formatMessages($messages);

                // 同步到本地数据库（后台任务，不影响返回）
                $this->syncMessagesToLocal($sessionId, $formattedMessages);

                $this->ajaxReturn([
                    'code' => 1,
                    'messages' => $formattedMessages,
                    'count' => count($formattedMessages)
                ]);

            } catch (\Exception $e) {
                \Think\Log::write('[Chat] 获取消息失败: ' . $e->getMessage(), 'ERROR');
                
                // 失败时返回本地缓存的消息
                $localMessages = M('chat_message')->where(['session_id' => $sessionId])
                    ->order('create_time ASC')
                    ->select();
                
                $this->ajaxReturn([
                    'code' => 1,
                    'messages' => $localMessages,
                    'count' => count($localMessages),
                    'from_cache' => true
                ]);
            }
        }
    }

    /**
     * 发送消息
     */
    public function sendMessage()
    {
        if ($_POST) {
            $sessionId = I('post.session_id', 0, 'intval');
            $message = trim(I('post.message', ''));
            $userId = session('userId');

            if (!$userId) {
                $this->ajaxReturn(['code' => 0, 'info' => L('请先登录')]);
            }

            if (empty($message)) {
                $this->ajaxReturn(['code' => 0, 'info' => '消息内容不能为空']);
            }

            // 验证会话
            $session = M('chat_session')->where([
                'id' => $sessionId,
                'user_id' => $userId
            ])->find();

            if (!$session) {
                $this->ajaxReturn(['code' => 0, 'info' => '会话不存在']);
            }

            try {
                // 保存到本地
                M('chat_message')->add([
                    'session_id' => $sessionId,
                    'user_id' => $userId,
                    'message' => $message,
                    'sender_type' => 'user',
                    'create_time' => time(),
                ]);

                // 更新会话时间
                M('chat_session')->where(['id' => $sessionId])->save([
                    'update_time' => time()
                ]);

                $this->ajaxReturn([
                    'code' => 1,
                    'info' => '消息已发送'
                ]);

            } catch (\Exception $e) {
                \Think\Log::write('[Chat] 发送消息失败: ' . $e->getMessage(), 'ERROR');
                $this->ajaxReturn([
                    'code' => 0,
                    'info' => '消息发送失败'
                ]);
            }
        }
    }

    /**
     * 格式化消息
     */
    private function formatMessages($messages)
    {
        $formatted = [];
        
        if (!is_array($messages)) {
            return $formatted;
        }

        foreach ($messages as $group) {
            if (isset($group['messages']) && is_array($group['messages'])) {
                foreach ($group['messages'] as $msg) {
                    if (in_array($msg['type'], ['M', 'Y', 'I'])) {
                        $formatted[] = array(
                            'id' => $msg['id'],
                            'message' => $msg['message'],
                            'sender_type' => isset($msg['userid']) ? 'agent' : 'user',
                            'create_time' => strtotime($msg['datecreated']),
                            'format' => isset($msg['format']) ? $msg['format'] : 'T',
                        );
                    }
                }
            }
        }

        return $formatted;
    }

    /**
     * 同步消息到本地数据库
     */
    private function syncMessagesToLocal($sessionId, $messages)
    {
        try {
            foreach ($messages as $msg) {
                $exists = M('chat_message')->where([
                    'session_id' => $sessionId,
                    'message' => $msg['message'],
                    'create_time' => $msg['create_time']
                ])->find();

                if (!$exists) {
                    M('chat_message')->add([
                        'session_id' => $sessionId,
                        'user_id' => 0,
                        'message' => $msg['message'],
                        'sender_type' => $msg['sender_type'],
                        'create_time' => $msg['create_time'],
                    ]);
                }
            }
        } catch (\Exception $e) {
            \Think\Log::write('[Chat] 同步消息失败: ' . $e->getMessage(), 'ERROR');
        }
    }
}

