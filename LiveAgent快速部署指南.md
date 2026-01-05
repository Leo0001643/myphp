# LiveAgent 聊天功能快速部署指南

## 🚀 5分钟快速部署

### 第1步：导入数据库表（1分钟）

```bash
# 进入项目目录
cd /Users/leo/Documents/workspan/php-project/168stoneex.com

# 导入数据库表
mysql -u stoneex_com -p3z2D3ss7mw4E4SYf stoneex_com < Database/chat_tables.sql
```

或使用phpMyAdmin导入：
```
1. 打开phpMyAdmin
2. 选择数据库：stoneex_com
3. 点击"导入"
4. 选择文件：Database/chat_tables.sql
5. 点击"执行"
```

---

### 第2步：访问聊天页面（1分钟）

```
URL: http://your-domain.com/index.php/Home/Chat/index
```

**测试流程**：
1. ✅ 确保用户已登录
2. ✅ 访问聊天页面
3. ✅ 查看在线客服数量
4. ✅ 点击"开始对话"
5. ✅ 输入消息并发送
6. ✅ 等待客服回复

---

### 第3步：测试API连接（可选，1分钟）

创建测试文件 `test_liveagent_api.php`：

```php
<?php
define('APP_PATH', './Application/');
define('RUNTIME_PATH', './Runtime/');
require './ThinkPHP/ThinkPHP.php';

// 测试API连接
$client = new \Common\Ext\LiveAgentClient();
$result = $client->ping();

if (isset($result['error'])) {
    echo "❌ API连接失败：" . $result['message'] . "\n";
    exit;
}

echo "✅ API连接成功！\n\n";

// 测试获取客服列表
$agents = $client->getOnlineAgents();
echo "在线客服数量：" . count($agents) . "\n";

// 测试获取部门列表
$departments = $client->getDepartments();
if (is_array($departments)) {
    echo "部门数量：" . count($departments) . "\n";
}

echo "\n✅ 所有测试通过！\n";
```

运行测试：
```bash
php test_liveagent_api.php
```

---

## 📁 已创建文件确认

### 后端文件
```bash
ls -la Application/Common/Conf/liveagent.php
ls -la Application/Common/Ext/LiveAgentClient.class.php
ls -la Application/Home/Controller/ChatController.class.php
```

### 前端文件
```bash
ls -la Application/Home/View/Chat/index.html
```

### 数据库文件
```bash
ls -la Database/chat_tables.sql
```

### 应该看到：
```
✅ liveagent.php (配置文件)
✅ LiveAgentClient.class.php (API客户端)
✅ ChatController.class.php (控制器)
✅ index.html (聊天页面)
✅ chat_tables.sql (数据库)
```

---

## 🔍 功能检查清单

### 数据库检查
```sql
-- 检查表是否创建成功
SHOW TABLES LIKE 'tw_chat%';

-- 应该看到：
-- tw_chat_session
-- tw_chat_message

-- 查看表结构
DESC tw_chat_session;
DESC tw_chat_message;
```

### 文件权限检查
```bash
# 确保Runtime目录可写
chmod -R 777 Runtime/

# 检查权限
ls -la Runtime/
```

### 配置检查
打开 `Application/Common/Conf/liveagent.php` 确认：
```php
✅ 'API_URL' => 'https://168stone.ladesk.com/api/v3'
✅ 'API_KEY' => 'x6euzjxl010660h7moy243v5kaml4k06fmc08mpi04'
```

---

## 🎯 测试场景

### 场景1：首次聊天
```
1. 登录用户账号
2. 访问：/index.php/Home/Chat/index
3. 看到"欢迎使用在线客服"
4. 看到"X 位客服在线"
5. 点击"开始对话"
6. 输入："你好，我想咨询一下"
7. 点击"发送"
8. 消息显示在聊天窗口
9. 等待客服回复
```

### 场景2：消息收发
```
1. 在聊天界面
2. 输入多条消息
3. 按回车键发送
4. 消息自动滚动到底部
5. 每3秒自动刷新
6. 客服回复显示在左侧
```

### 场景3：查看日志
```
1. 打开 Runtime/Logs/Home/
2. 找到今天的日志文件（如：26_01_05.log）
3. 搜索 "[LiveAgent]"
4. 查看API请求和响应日志
```

---

## ⚠️ 常见问题

### 问题1：页面显示"请先登录"
```
原因：用户未登录
解决：先登录用户账号，然后访问聊天页面
```

### 问题2：显示"在线客服数量：0"
```
原因：
1. API连接失败
2. LiveAgent后台没有客服在线

排查：
1. 检查API Key是否正确
2. 运行 test_liveagent_api.php 测试连接
3. 登录LiveAgent后台查看客服状态
```

### 问题3：点击"开始对话"无反应
```
排查步骤：
1. F12打开开发者工具
2. 查看Console是否有错误
3. 查看Network请求是否成功
4. 查看Runtime/Logs/日志
```

### 问题4：数据库表未创建
```
解决：
1. 手动运行SQL文件
2. 检查数据库连接
3. 查看MySQL错误日志
```

### 问题5：消息发送后无回复
```
说明：这是正常的！
原因：需要LiveAgent后台有客服接入才会回复
当前：消息已保存到本地数据库
```

---

## 📊 数据验证

### 验证会话创建
```sql
SELECT * FROM tw_chat_session ORDER BY create_time DESC LIMIT 10;

-- 应该看到：
-- user_id: 用户ID
-- ticket_id: LiveAgent工单ID（不为空）
-- status: active
-- create_time: 创建时间戳
```

### 验证消息保存
```sql
SELECT * FROM tw_chat_message ORDER BY create_time DESC LIMIT 20;

-- 应该看到：
-- session_id: 会话ID
-- message: 消息内容
-- sender_type: user 或 agent
-- create_time: 发送时间戳
```

---

## 🎨 界面预览

### PC端
```
┌─────────────────────────────────────┐
│          在线客服                    │
│      3 位客服在线                    │
├─────────────────────────────────────┤
│                                     │
│  ┌────────────────┐                │
│  │ 你好，需要帮助吗？│ ← 客服         │
│  └────────────────┘                │
│                 ┌────────────────┐ │
│          用户 → │ 我想咨询一下账户│ │
│                 └────────────────┘ │
│                                     │
├─────────────────────────────────────┤
│ [  输入消息...   ]  [ 发送 ]        │
└─────────────────────────────────────┘
```

### 移动端
```
┌──────────────────┐
│    在线客服       │
│   3 位客服在线    │
├──────────────────┤
│  ┌──────────┐    │
│  │你好！    │    │
│  └──────────┘    │
│      ┌──────────┐│
│      │我需要帮助││
│      └──────────┘│
├──────────────────┤
│ [输入...]  [发送]│
└──────────────────┘
```

---

## 🔧 可选优化

### 1. 添加菜单入口
```html
<!-- 在主导航菜单中添加 -->
<li><a href="{:U('Chat/index')}">{:L('在线客服')}</a></li>
```

### 2. 添加浮动按钮
```html
<!-- 在页面右下角添加浮动聊天按钮 -->
<div class="chat-float-btn" onclick="openChat()">
    💬
</div>
<style>
.chat-float-btn {
    position: fixed;
    right: 20px;
    bottom: 20px;
    width: 60px;
    height: 60px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 28px;
    cursor: pointer;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    z-index: 9999;
}
.chat-float-btn:hover {
    transform: scale(1.1);
    box-shadow: 0 6px 16px rgba(0,0,0,0.3);
}
</style>
<script>
function openChat() {
    window.location.href = "{:U('Chat/index')}";
}
</script>
```

### 3. 获取默认部门ID
```
1. 登录LiveAgent后台
2. 进入 Settings → Departments
3. 复制部门ID
4. 更新配置：Application/Common/Conf/liveagent.php
   'DEFAULT_DEPARTMENT_ID' => 'dept_xxxx'
```

---

## 📞 支持

### 查看日志
```bash
tail -f Runtime/Logs/Home/$(date +%y_%m_%d).log | grep LiveAgent
```

### API文档
```
https://168stone.ladesk.com/docs/api/v3/
```

### 数据库管理
```
phpMyAdmin
表：tw_chat_session, tw_chat_message
```

---

## ✅ 部署完成检查

```
□ 数据库表已创建（tw_chat_session, tw_chat_message）
□ 配置文件正确（API_URL, API_KEY）
□ 文件权限正确（Runtime 777）
□ API连接测试通过
□ 页面可访问（/Home/Chat/index）
□ 用户可发送消息
□ 消息保存到数据库
□ 在线客服数显示正常
```

---

## 🎉 部署成功！

访问聊天页面，开始使用LiveAgent实时客服功能！

**URL**: `http://your-domain.com/index.php/Home/Chat/index`

---

**部署指南生成时间**：2026年1月5日  
**预计部署时间**：5分钟  
**难度等级**：⭐⭐☆☆☆（简单）

