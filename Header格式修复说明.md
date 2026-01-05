# 关键修复：Header格式问题

## 🔍 发现的问题

官方Demo的Header格式：
```php
// ✅ 冒号后面没有空格
'Content-Type:application/json;charset=UTF-8'
"Sign:$sign"
"Timestamp:$timeStamp"
"Api-Key:$apiKey"
```

我们之前的格式：
```php
// ❌ 冒号后面有空格
'Content-Type: application/json;charset=UTF-8'
'Sign: ' . $sign
'Timestamp: ' . $timestamp
'Api-Key: ' . $this->apiKey
```

**这可能导致认证失败！**

---

## ✅ 已修复

已更新 `SmsHelper.class.php` 的 `httpPostJson` 方法，Headers格式改为：

```php
$headers = array(
    'Content-Type:application/json;charset=UTF-8',  // 无空格
    'Sign:' . $sign,                                 // 无空格
    'Timestamp:' . $timestamp,                       // 无空格
    'Api-Key:' . $this->apiKey                      // 无空格
);
```

---

## 🧪 测试步骤

### 1. 清除缓存
```bash
rm -rf /www/wwwroot/168stoneex.com/Runtime/Cache/*
```

### 2. 运行测试脚本
```bash
php /www/wwwroot/168stoneex.com/test_sms_api.php
```

### 3. 在页面测试
1. 清除浏览器缓存
2. 访问注册页面
3. 点击获取验证码
4. 查看响应

---

## ⚠️ 如果仍然认证失败

请确认配置是否正确：

### Demo中的占位符：
```php
$apiKey = "your api key";      // ← 需要替换
$apiSecret = "your api secret"; // ← 需要替换
$appId = "your appid";          // ← 需要替换
```

### 您需要的真实配置：
登录 onbuka.com 后台，找到：
1. **App ID** （应用ID）- 最关键
2. **API Key** （API密钥）
3. **API Secret** （密钥）

然后更新 `Application/Common/Conf/sms.php`：

```php
return array(
    'SMS_API_URL' => 'https://api.onbuka.com/v3/sendSms',
    'SMS_API_KEY' => '您的真实API Key',
    'SMS_API_SECRET' => '您的真实API Secret',
    'SMS_APP_ID' => '您的真实App ID',
    // ...
);
```

---

## 📋 修复清单

```
✅ Header格式改为无空格（符合官方Demo）
✅ PHP 5.6兼容性保持
✅ 测试脚本已更新
✅ 添加详细的错误提示
⏳ 等待确认真实的API配置
```

---

**关键提示**：
1. Header格式已修复（冒号后无空格）
2. 如果仍然认证失败，99%是配置不对
3. 请务必从onbuka后台获取真实配置

---

**更新时间**：2026年1月5日  
**状态**：✅ Header格式已修复，等待测试

