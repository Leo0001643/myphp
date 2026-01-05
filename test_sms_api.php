<?php
/**
 * onbuka.com 短信API测试（严格按照官方Demo）
 * PHP 5.6兼容版本
 */

header('content-type:text/html;charset=utf8');

echo "=== onbuka.com 短信API测试（官方Demo格式，PHP 5.6） ===\n\n";

// ⚠️ 重要：请替换为您真实的配置
$apiKey = "JN85gvcv";           // 请确认是否正确
$apiSecret = "KJ1kPhA7";        // 请确认是否正确
$appId = "cs_2fii8n";           // 请确认是否正确（这个最可能有问题）

$url = "https://api.onbuka.com/v3/sendSms";

echo "1. 配置信息：\n";
echo "API Key: " . $apiKey . "\n";
echo "API Secret: " . substr($apiSecret, 0, 4) . "****\n";
echo "App ID: " . $appId . "\n";
echo "API URL: " . $url . "\n\n";

// 生成签名（严格按照Demo）
$timeStamp = time();
$sign = md5($apiKey . $apiSecret . $timeStamp);

echo "2. 签名信息：\n";
echo "时间戳: " . $timeStamp . "\n";
echo "签名字符串: " . $apiKey . $apiSecret . $timeStamp . "\n";
echo "签名结果: " . $sign . "\n\n";

// 构建请求数据（严格按照Demo）
$dataArr = array();
$dataArr['appId'] = $appId;
$dataArr['numbers'] = '8613800138000';  // 测试手机号
$dataArr['content'] = 'hello world';
$dataArr['senderId'] = '';
$dataArr['orderId'] = '';

$data = json_encode($dataArr);

echo "3. 请求数据：\n";
echo $data . "\n\n";

// 构建Headers（严格按照Demo，注意冒号后面没有空格）
$headers = array(
    'Content-Type:application/json;charset=UTF-8',
    "Sign:$sign",
    "Timestamp:$timeStamp",
    "Api-Key:$apiKey"
);

echo "4. 请求Headers：\n";
foreach ($headers as $header) {
    echo $header . "\n";
}
echo "\n";

// 发送请求（严格按照Demo）
echo "5. 发送请求...\n";
$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 600);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);

$output = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$curlError = curl_error($ch);
curl_close($ch);

echo "6. 响应结果：\n";
echo "HTTP状态码: " . $httpCode . "\n";

if ($curlError) {
    echo "CURL错误: " . $curlError . "\n";
}

echo "原始响应:\n";
var_dump($output);
echo "\n\n";

// 解析JSON
if ($output) {
    $result = json_decode($output, true);
    if (json_last_error() == JSON_ERROR_NONE) {
        echo "解析后的JSON:\n";
        print_r($result);
        echo "\n";
        
        // 判断结果
        if (isset($result['status'])) {
            if ($result['status'] == '-1') {
                echo "❌ 认证失败！\n";
                echo "错误原因: " . (isset($result['reason']) ? $result['reason'] : '未知') . "\n\n";
                
                echo "⚠️ 可能的问题：\n";
                echo "1. App ID 不正确（最常见）\n";
                echo "   当前使用: " . $appId . "\n";
                echo "   请登录 onbuka.com 后台确认真实的 App ID\n\n";
                
                echo "2. API Key 或 API Secret 不正确\n";
                echo "   API Key: " . $apiKey . "\n";
                echo "   API Secret: " . substr($apiSecret, 0, 4) . "****\n";
                echo "   请从后台确认这些配置\n\n";
                
                echo "3. 账号状态问题\n";
                echo "   检查账号是否已激活\n";
                echo "   检查是否有余额\n";
                
            } else if ($result['status'] == '1' || $result['status'] == '0') {
                echo "✅ 测试成功！短信API工作正常。\n";
            } else {
                echo "⚠️ 未知状态: " . $result['status'] . "\n";
            }
        } else {
            echo "⚠️ 响应格式未知\n";
        }
    } else {
        echo "❌ JSON解析失败: " . json_last_error_msg() . "\n";
    }
}

echo "\n=== 测试完成 ===\n\n";

echo "📝 下一步：\n";
echo "1. 如果显示 'Authentication error'，请登录 onbuka.com 后台\n";
echo "2. 查找 API 设置 或 应用管理\n";
echo "3. 确认真实的 App ID、API Key、API Secret\n";
echo "4. 更新配置文件：Application/Common/Conf/sms.php\n";
echo "5. 清除缓存：rm -rf Runtime/Cache/*\n";
echo "6. 重新测试\n";
?>
