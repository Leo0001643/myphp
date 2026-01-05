# onbuka.com 短信API修复说明

## ✅ 问题已修复！

根据官方Demo，我们之前的实现方式完全错误。现已按照官方标准修复。

---

## 🔧 关键修复点

### 修复1：API配置更新

**文件**: `Application/Common/Conf/sms.php`

```php
// ✅ 修复后的配置
'SMS_API_KEY' => 'JN85gvcv',
'SMS_API_SECRET' => 'KJ1kPhA7',
'SMS_APP_ID' => 'cs_2fii8n',  // 从46BShokC改为cs_2fii8n
```

---

### 修复2：请求格式改为JSON

**之前（错误）**：
```php
// ❌ 使用 application/x-www-form-urlencoded
curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
```

**现在（正确）**：
```php
// ✅ 使用 application/json
$jsonData = json_encode($dataArr);
curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonData);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Content-Type: application/json;charset=UTF-8',
    'Sign: ' . $sign,
    'Timestamp: ' . $timestamp,
    'Api-Key: ' . $apiKey
]);
```

---

### 修复3：签名生成方式

**之前（错误）**：
```php
// ❌ 参数排序拼接
$signStr = 'appId=xxx&content=xxx&mobile=xxx&timestamp=xxx&secret=xxx';
$sign = strtoupper(md5($signStr));
```

**现在（正确）**：
```php
// ✅ 简单拼接
$sign = md5($apiKey . $apiSecret . $timestamp);
```

---

### 修复4：请求参数格式

**之前（错误）**：
```php
$params = [
    'appId' => $appId,
    'mobile' => $mobile,
    'content' => $content,
    'timestamp' => $timestamp,
    'sign' => $sign,
    'apiKey' => $apiKey
];
```

**现在（正确）**：
```php
$dataArr = [
    'appId' => $appId,
    'numbers' => $mobile,    // 字段名是numbers，不是mobile
    'content' => $content,
    'senderId' => '',
    'orderId' => ''
];
// sign和apiKey放在Header里，不在body
```

---

## 📊 对比表

| 项目 | 错误实现 | 正确实现（官方Demo） |
|------|----------|---------------------|
| **Content-Type** | application/x-www-form-urlencoded | application/json |
| **签名位置** | URL参数 | Header: Sign |
| **API Key位置** | URL参数 | Header: Api-Key |
| **时间戳位置** | URL参数 | Header: Timestamp |
| **签名算法** | 复杂的参数拼接 | md5(apiKey+apiSecret+timestamp) |
| **手机号字段** | mobile | numbers |
| **请求体格式** | URL编码 | JSON |

---

## 🧪 测试步骤

### 1. 运行测试脚本
```bash
cd /www/wwwroot/168stoneex.com
php test_sms_api.php
```

### 2. 查看输出
脚本会显示：
- ✅ 配置信息
- ✅ 签名生成过程
- ✅ 请求数据（JSON格式）
- ✅ 请求Headers
- ✅ HTTP响应
- ✅ 解析结果

### 3. 测试前端功能
```
1. 清除缓存：rm -rf Runtime/Cache/*
2. 访问注册页面
3. 选择手机注册
4. 输入手机号：+86 13800138000
5. 点击"获取验证码"
6. 应该收到短信验证码 ✅
```

---

## 📝 完整的API调用示例

### PHP代码（按官方Demo）
```php
<?php
$apiKey = "JN85gvcv";
$apiSecret = "KJ1kPhA7";
$appId = "cs_2fii8n";
$url = "https://api.onbuka.com/v3/sendSms";

// 1. 生成签名
$timeStamp = time();
$sign = md5($apiKey . $apiSecret . $timeStamp);

// 2. 构建请求数据（JSON）
$dataArr = array(
    'appId' => $appId,
    'numbers' => '8613800138000',
    'content' => '您的验证码是：123456，5分钟内有效',
    'senderId' => '',
    'orderId' => ''
);
$data = json_encode($dataArr);

// 3. 构建Headers
$headers = array(
    'Content-Type: application/json;charset=UTF-8',
    'Sign: ' . $sign,
    'Timestamp: ' . $timeStamp,
    'Api-Key: ' . $apiKey
);

// 4. 发送请求
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);

$output = curl_exec($ch);
curl_close($ch);

// 5. 解析结果
$result = json_decode($output, true);
print_r($result);
?>
```

---

## ✅ 已修复的文件

### 1. sms.php - 配置文件
```
✅ API_KEY: JN85gvcv
✅ API_SECRET: KJ1kPhA7  
✅ APP_ID: cs_2fii8n (已更正)
✅ 移除了不需要的配置项
```

### 2. SmsHelper.class.php - 核心类
```
✅ 改用JSON格式发送
✅ 签名算法修正为：md5(apiKey+secret+timestamp)
✅ Header正确设置：Sign, Timestamp, Api-Key
✅ 参数字段改为：numbers（不是mobile）
✅ 移除了旧的generateSign方法
✅ 新增httpPostJson方法
```

---

## 🎯 预期结果

### 成功响应示例
```json
{
  "code": 0,
  "message": "success",
  "data": {
    "messageId": "xxx",
    "status": "sent"
  }
}
```

### 失败响应示例
```json
{
  "code": 1001,
  "message": "invalid api key"
}
```

---

## 🚀 立即测试

### 方式1：运行测试脚本
```bash
php /www/wwwroot/168stoneex.com/test_sms_api.php
```

### 方式2：在注册页面测试
```
1. 访问：https://168stoneex.com/index.php/Home/Login/register
2. 选择手机注册
3. 输入手机号
4. 点击获取验证码
5. 查看是否收到短信
```

---

## 📞 检查清单

```
✅ API配置已更新（App ID改为cs_2fii8n）
✅ 请求格式改为JSON
✅ Headers正确设置（Sign, Timestamp, Api-Key）
✅ 签名算法已修正
✅ 参数字段已修正（numbers）
✅ PHP 5.6兼容性已保持
✅ 错误处理完整
✅ 日志记录详细
```

---

## 💡 重要说明

1. **App ID已更正**：从 `46BShokC` 改为 `cs_2fii8n`
2. **完全按照官方Demo实现**
3. **保持了PHP 5.6兼容性**
4. **保留了完整的错误处理和日志**

---

**修复时间**：2026年1月5日  
**状态**：✅ 完成，等待测试验证  
**参考**：onbuka.com 官方Demo

