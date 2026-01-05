# 短信调试 - 前端查看API响应

## 📝 修改说明

已修改 `LoginController.class.php` 在调试模式（`APP_DEBUG = true`）下返回完整的API响应。

---

## 🧪 测试步骤

### 1. 确认调试模式已开启

检查 `index.php` 第35行：
```php
define('APP_DEBUG', true);  // 确保是true
```

### 2. 清除缓存
```bash
rm -rf /www/wwwroot/168stoneex.com/Runtime/Cache/*
```

### 3. 测试发送短信

1. 打开浏览器开发者工具（F12）
2. 切换到 **Network（网络）** 标签
3. 访问注册页面
4. 输入手机号，点击"获取验证码"
5. 在Network中找到 `sendMobileSms` 请求
6. 查看 **Response（响应）**

---

## 📊 预期看到的响应

### 如果成功：
```json
{
  "code": 1,
  "info": "验证码发送成功",
  "msg": "123456",
  "mobile": "+86 13800138000"
}
```

### 如果失败（现在会显示详细信息）：
```json
{
  "code": 0,
  "info": "短信发送失败",
  "debug_data": {
    "code": 1001,
    "message": "invalid api key",
    "具体错误": "这里会显示onbuka返回的完整错误"
  }
}
```

---

## 🔍 常见错误代码对照

根据onbuka.com可能返回的错误：

| 错误代码 | 含义 | 解决方案 |
|---------|------|---------|
| 1001 | API Key无效 | 检查API Key是否正确 |
| 1002 | 签名错误 | 检查API Secret |
| 1003 | 余额不足 | 充值账户 |
| 1004 | 手机号格式错误 | 调整手机号格式 |
| 1005 | 内容被拒 | 修改短信内容 |
| 1006 | senderId未设置 | 在后台申请senderId |
| 1007 | 超过发送频率 | 等待后重试 |

---

## 🎯 根据错误调整

### 如果是手机号格式错误（1004）

修改 `SmsHelper.class.php` 第49行：

```php
// 当前（去除+和空格）
$cleanMobile = str_replace(array(' ', '+'), '', $mobile);

// 尝试1：只去空格
$cleanMobile = str_replace(' ', '', $mobile);

// 尝试2：保持原样
$cleanMobile = $mobile;

// 尝试3：只要数字
$cleanMobile = preg_replace('/[^0-9]/', '', $mobile);
```

### 如果是senderId问题（1006）

修改 `SmsHelper.class.php` 第56行：

```php
$dataArr = array(
    'appId' => $this->appId,
    'numbers' => $cleanMobile,
    'content' => $content,
    'senderId' => 'YourSenderID', // 从onbuka后台获取
    'orderId' => uniqid(), // 生成唯一订单号
);
```

### 如果是内容问题（1005）

修改 `sms.php` 的模板，使用更简单的内容：

```php
'SMS_TEMPLATE' => 'Code: {code}',
```

---

## 💡 替代方案

### 方案A：使用curl命令测试

在服务器上直接测试API：

```bash
curl -X POST https://api.onbuka.com/v3/sendSms \
  -H "Content-Type: application/json;charset=UTF-8" \
  -H "Sign: $(echo -n 'JN85gvcvKJ1kPhA7'$(date +%s) | md5sum | cut -d' ' -f1)" \
  -H "Timestamp: $(date +%s)" \
  -H "Api-Key: JN85gvcv" \
  -d '{
    "appId": "cs_2fii8n",
    "numbers": "8613800138000",
    "content": "Test message",
    "senderId": "",
    "orderId": ""
  }'
```

### 方案B：浏览器直接运行测试

创建一个简单的测试页面 `sms_test.html`：

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>短信测试</title>
</head>
<body>
    <h1>短信API测试</h1>
    <button onclick="testSms()">测试发送短信</button>
    <pre id="result"></pre>
    
    <script src="/Public/Home/static/js/jquery-3.3.1.min.js"></script>
    <script>
    function testSms() {
        $.post('/index.php/Home/Login/sendMobileSms', {
            mobile: '+86 13800138000',
            type: 2
        }, function(res) {
            document.getElementById('result').textContent = JSON.stringify(res, null, 2);
        });
    }
    </script>
</body>
</html>
```

上传到网站根目录，访问 `https://168stoneex.com/sms_test.html`

---

## ✅ 下一步

1. **清除缓存**
2. **打开F12开发者工具**
3. **点击获取验证码**
4. **查看Network响应中的 `debug_data` 字段**
5. **将完整的响应发给我**

这样我就能看到API返回的具体错误，然后精确修复！🔧

---

**更新时间**：2026年1月5日  
**状态**：等待前端响应数据

