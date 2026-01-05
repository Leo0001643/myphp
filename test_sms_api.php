<?php
/**
 * onbuka.com 短信API测试脚本（按官方Demo修正）
 */

header('content-type:text/html;charset=utf8');

echo "=== onbuka.com 短信API测试（官方Demo格式） ===\n\n";

// 配置信息
$apiKey = "JN85gvcv";
$apiSecret = "KJ1kPhA7";
$appId = "cs_2fii8n";
$url = "https://api.onbuka.com/v3/sendSms";

echo "1. 配置信息：\n";
echo "API Key: " . $apiKey . "\n";
echo "API Secret: " . substr($apiSecret, 0, 4) . "****\n";
echo "App ID: " . $appId . "\n";
echo "API URL: " . $url . "\n\n";

// 生成签名
$timeStamp = time();
$sign = md5($apiKey . $apiSecret . $timeStamp);

echo "2. 签名信息：\n";
echo "时间戳: " . $timeStamp . "\n";
echo "签名字符串: " . $apiKey . $apiSecret . $timeStamp . "\n";
echo "签名结果: " . $sign . "\n\n";

// 构建请求数据
$dataArr = array(
    'appId' => $appId,
    'numbers' => '8613800138000',  // 测试手机号
    'content' => '您的验证码是：123456，5分钟内有效，请勿泄露给他人。',
    'senderId' => '',
    'orderId' => ''
);

$data = json_encode($dataArr);

echo "3. 请求数据：\n";
echo $data . "\n\n";

// 构建Headers
$headers = array(
    'Content-Type: application/json;charset=UTF-8',
    'Sign: ' . $sign,
    'Timestamp: ' . $timeStamp,
    'Api-Key: ' . $apiKey
);

echo "4. 请求Headers：\n";
foreach ($headers as $header) {
    echo $header . "\n";
}
echo "\n";

// 发送请求
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
        
        // 判断成功或失败
        if (isset($result['code'])) {
            if ($result['code'] == 0 || $result['code'] == 200) {
                echo "✅ 测试成功！短信API调用正常。\n";
            } else {
                echo "❌ 测试失败！错误代码: " . $result['code'] . "\n";
                if (isset($result['message'])) {
                    echo "错误信息: " . $result['message'] . "\n";
                }
            }
        } else if (isset($result['status'])) {
            if ($result['status'] == 'success' || $result['status'] == 'ok') {
                echo "✅ 测试成功！短信API调用正常。\n";
            } else {
                echo "❌ 测试失败！状态: " . $result['status'] . "\n";
            }
        } else {
            echo "⚠️ 响应格式未知\n";
        }
    } else {
        echo "❌ JSON解析失败: " . json_last_error_msg() . "\n";
    }
}

echo "\n=== 测试完成 ===\n";
?>
