# 短信API调试指南

## 🐛 问题描述

返回错误：
```json
{
  "code": 0,
  "info": "短信平台返回数据异常"
}
```

这表示：
1. ✅ 代码已执行到短信发送逻辑
2. ❌ 短信平台API返回的数据格式异常

---

## 🔍 可能的原因

### 原因1：API配置错误
```php
'SMS_API_URL' => 'https://api.onbuka.com/v3/sendSms',
'SMS_API_KEY' => 'JN85gvcv',
'SMS_APP_ID' => '46BShokC',
'SMS_SECRET' => 'KJ1kPhA7',
```

**检查点**：
- API URL是否正确？
- API Key是否有效？
- App ID是否正确？
- Secret是否匹配？

---

### 原因2：签名生成错误

签名规则：
```
appId=XXX&content=XXX&mobile=XXX&timestamp=XXX&secret=XXX
然后MD5并转大写
```

**可能问题**：
- 参数顺序不对
- secret拼接位置错误
- 编码问题

---

### 原因3：API返回格式与预期不符

代码预期返回格式：
```json
{
  "code": 0,  // 或 200 表示成功
  "message": "...",
  "data": {...}
}
```

实际返回可能是：
```json
{
  "status": "success",
  "result": {...}
}
```

---

## 🧪 调试步骤

### 步骤1：运行测试脚本

```bash
cd /www/wwwroot/168stoneex.com
php test_sms_api.php
```

这会：
1. 显示完整的请求参数
2. 显示签名字符串
3. 显示原始HTTP响应
4. 显示解析后的JSON

---

### 步骤2：查看详细日志

在服务器上查看Runtime日志：

```bash
# 查看今天的日志
tail -100 /www/wwwroot/168stoneex.com/Runtime/Logs/Home/$(date +%y_%m_%d).log | grep -A 10 "短信"

# 或查看所有短信相关日志
grep -r "短信\|SMS\|LiveAgent" /www/wwwroot/168stoneex.com/Runtime/Logs/
```

---

### 步骤3：检查API文档

访问onbuka.com文档：
```
https://api.onbuka.com/docs
或
https://api.onbuka.com/v3/docs
```

确认：
1. 正确的API端点
2. 请求参数格式
3. 签名生成方法
4. 响应数据格式

---

## 🔧 临时调试方案

### 方案A：添加详细日志

修改 `SmsHelper.class.php` 的 `httpPost` 方法，在第77行后添加：

```php
// 8. 记录响应日志
\Think\Log::write('[短信发送] 响应结果：' . json_encode($result), 'INFO');

// 添加这些调试日志：
\Think\Log::write('[短信调试] HTTP状态码：' . $httpCode, 'DEBUG');
\Think\Log::write('[短信调试] 原始响应：' . $response, 'DEBUG');
\Think\Log::write('[短信调试] JSON错误：' . json_last_error_msg(), 'DEBUG');
```

---

### 方案B：返回更多信息

修改 `SmsHelper.class.php` 第102-104行：

```php
} else {
    \Think\Log::write('[短信发送失败] 返回数据格式错误：' . json_encode($result), 'ERROR');
    
    // 返回更详细的错误信息
    return array(
        'code' => 0, 
        'msg' => '短信平台返回数据异常',
        'debug' => array(
            'response' => $result,
            'expected' => 'code字段',
            'actual' => isset($result) ? array_keys($result) : 'null'
        )
    );
}
```

---

## 📝 常见API返回格式

### onbuka.com可能的返回格式

#### 格式1：标准格式
```json
{
  "code": 0,
  "message": "success",
  "data": {...}
}
```

#### 格式2：简化格式
```json
{
  "status": "ok",
  "msgid": "123456"
}
```

#### 格式3：错误格式
```json
{
  "error": "invalid_key",
  "message": "API Key无效"
}
```

---

## 🛠️ 修复建议

### 建议1：兼容多种响应格式

修改 `SmsHelper.class.php` 第79-105行：

```php
// 9. 解析结果（兼容多种格式）
if ($result) {
    // 格式1: {"code": 0}
    if (isset($result['code'])) {
        if ($result['code'] == 0 || $result['code'] == 200 || $result['code'] === '0') {
            S($limitKey, $sendCount + 1, 86400);
            return array(
                'code' => 1, 
                'msg' => '验证码发送成功',
                'data' => $result
            );
        } else {
            $errMsg = isset($result['message']) ? $result['message'] : (isset($result['msg']) ? $result['msg'] : '短信发送失败');
            \Think\Log::write('[短信发送失败] ' . $errMsg, 'ERROR');
            return array('code' => 0, 'msg' => $errMsg, 'data' => $result);
        }
    }
    // 格式2: {"status": "ok"}
    else if (isset($result['status']) && ($result['status'] == 'ok' || $result['status'] == 'success')) {
        S($limitKey, $sendCount + 1, 86400);
        return array('code' => 1, 'msg' => '验证码发送成功', 'data' => $result);
    }
    // 格式3: {"error": "..."}
    else if (isset($result['error'])) {
        $errMsg = isset($result['message']) ? $result['message'] : $result['error'];
        \Think\Log::write('[短信发送失败] ' . $errMsg, 'ERROR');
        return array('code' => 0, 'msg' => $errMsg, 'data' => $result);
    }
    // 未知格式
    else {
        \Think\Log::write('[短信平台] 未知响应格式：' . json_encode($result), 'WARN');
        return array('code' => 0, 'msg' => '短信平台返回未知格式', 'data' => $result);
    }
} else {
    return array('code' => 0, 'msg' => '短信平台无响应');
}
```

---

### 建议2：联系短信平台技术支持

提供以下信息给onbuka.com技术支持：

```
1. API Key: JN85gvcv
2. App ID: 46BShokC
3. 测试手机号: +86 13800138000
4. 错误信息: 返回数据格式异常
5. 请求的签名字符串
6. 完整的HTTP响应
```

---

## 🚀 快速测试

### 1. 运行测试脚本
```bash
cd /www/wwwroot/168stoneex.com
php test_sms_api.php
```

### 2. 查看输出
脚本会显示：
- ✅ 请求参数
- ✅ 签名字符串
- ✅ HTTP状态码
- ✅ 原始响应
- ✅ 解析结果

### 3. 根据输出调整
- 如果HTTP状态码不是200 → API地址或网络问题
- 如果响应为空 → 防火墙或网络问题
- 如果响应格式不对 → 需要调整解析逻辑

---

## 📞 下一步

1. ⭐ **运行测试脚本** `php test_sms_api.php`
2. 将完整输出发给我
3. 我会根据实际返回格式调整代码

---

**创建时间**：2026年1月5日  
**状态**：等待测试结果

