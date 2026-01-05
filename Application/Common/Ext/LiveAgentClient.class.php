<?php
namespace Common\Ext;

/**
 * LiveAgent 客服系统客户端
 * 专注于实时聊天功能
 */
class LiveAgentClient
{
    private $apiUrl;
    private $apiKey;
    private $timeout;
    private $connectTimeout;

    public function __construct()
    {
        $config = C('liveagent');
        $this->apiUrl = $config['API_URL'];
        $this->apiKey = $config['API_KEY'];
        $this->timeout = $config['API_TIMEOUT'];
        $this->connectTimeout = $config['API_CONNECT_TIMEOUT'];
    }

    /**
     * 测试API连接
     * @return array
     */
    public function ping()
    {
        return $this->request('GET', '/ping');
    }

    /**
     * 获取聊天列表
     * @param array $filters 过滤条件
     * @return array
     */
    public function getChats($filters = [])
    {
        $query = $this->buildQuery($filters);
        return $this->request('GET', '/chats' . $query);
    }

    /**
     * 获取聊天详情
     * @param string $chatId 聊天ID
     * @return array
     */
    public function getChat($chatId)
    {
        return $this->request('GET', '/tickets/' . $chatId);
    }

    /**
     * 获取聊天消息
     * @param string $chatId 聊天ID
     * @return array
     */
    public function getChatMessages($chatId)
    {
        return $this->request('GET', '/tickets/' . $chatId . '/messages');
    }

    /**
     * 创建工单（作为聊天会话）
     * @param array $data 数据
     * @return array
     */
    public function createTicket($data)
    {
        return $this->request('POST', '/tickets', $data);
    }

    /**
     * 创建联系人
     * @param array $data 数据
     * @return array
     */
    public function createContact($data)
    {
        return $this->request('POST', '/contacts', $data);
    }

    /**
     * 获取联系人
     * @param string $email 邮箱
     * @return array
     */
    public function getContactByEmail($email)
    {
        $filters = [
            '_filters' => json_encode(['emails' => $email])
        ];
        $query = $this->buildQuery($filters);
        $result = $this->request('GET', '/contacts' . $query);
        
        if (isset($result[0])) {
            return ['code' => 1, 'data' => $result[0]];
        }
        return ['code' => 0, 'msg' => '联系人不存在'];
    }

    /**
     * 获取客服列表
     * @return array
     */
    public function getAgents()
    {
        return $this->request('GET', '/agents');
    }

    /**
     * 获取在线客服
     * @return array
     */
    public function getOnlineAgents()
    {
        $agents = $this->getAgents();
        if (!is_array($agents)) {
            return [];
        }
        
        $online = [];
        foreach ($agents as $agent) {
            if (isset($agent['online_status']) && $agent['online_status'] == 'N') {
                $online[] = $agent;
            }
        }
        return $online;
    }

    /**
     * 获取部门列表
     * @return array
     */
    public function getDepartments()
    {
        return $this->request('GET', '/departments');
    }

    /**
     * 发送HTTP请求
     * @param string $method 请求方法
     * @param string $endpoint 接口路径
     * @param array $data 请求数据
     * @return array
     */
    private function request($method, $endpoint, $data = null)
    {
        $url = $this->apiUrl . $endpoint;
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, $this->timeout);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $this->connectTimeout);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'apikey: ' . $this->apiKey,
            'Content-Type: application/json',
            'Accept: application/json'
        ]);

        switch ($method) {
            case 'POST':
                curl_setopt($ch, CURLOPT_POST, true);
                if ($data) {
                    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
                }
                break;
            case 'PUT':
                curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT');
                if ($data) {
                    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
                }
                break;
            case 'DELETE':
                curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'DELETE');
                break;
        }

        // 记录请求日志
        \Think\Log::write('[LiveAgent] ' . $method . ' ' . $endpoint, 'INFO');

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlError = curl_error($ch);
        curl_close($ch);

        // 处理错误
        if ($response === false) {
            \Think\Log::write('[LiveAgent] CURL错误: ' . $curlError, 'ERROR');
            return ['error' => true, 'message' => 'API请求失败: ' . $curlError];
        }

        // 记录响应
        \Think\Log::write('[LiveAgent] HTTP ' . $httpCode, 'INFO');

        // 解析响应
        $result = json_decode($response, true);
        if (json_last_error() != JSON_ERROR_NONE) {
            \Think\Log::write('[LiveAgent] JSON解析失败: ' . json_last_error_msg(), 'ERROR');
            return ['error' => true, 'message' => 'JSON解析失败'];
        }

        // 处理HTTP错误
        if ($httpCode >= 400) {
            $errorMsg = isset($result['message']) ? $result['message'] : 'HTTP ' . $httpCode;
            \Think\Log::write('[LiveAgent] API错误: ' . $errorMsg, 'ERROR');
            return ['error' => true, 'message' => $errorMsg];
        }

        return $result;
    }

    /**
     * 构建查询字符串
     * @param array $filters 过滤条件
     * @return string
     */
    private function buildQuery($filters)
    {
        if (empty($filters)) {
            return '';
        }
        return '?' . http_build_query($filters);
    }
}

