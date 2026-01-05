<?php
namespace Common\Ext;

/**
 * 短信发送辅助类 - onbuka.com 短信平台
 * API文档：https://api.onbuka.com/
 */
class SmsHelper
{
    private $apiUrl;
    private $apiKey;
    private $apiSecret;
    private $appId;
    
    public function __construct()
    {
        // 加载短信配置
        $config = include APP_PATH . 'Common/Conf/sms.php';
        $this->apiUrl = $config['SMS_API_URL'];
        $this->apiKey = $config['SMS_API_KEY'];
        $this->apiSecret = $config['SMS_API_SECRET'];
        $this->appId = $config['SMS_APP_ID'];
    }
    
    /**
     * 发送短信验证码
     * @param string $mobile 手机号（带国际区号，如：+86 13800138000 或 +1 2025551234）
     * @param string $code 验证码
     * @return array ['code' => 1成功/0失败, 'msg' => '提示信息', 'data' => 详细数据]
     */
    public function sendVerifyCode($mobile, $code)
    {
        try {
            // 1. 检查频率限制（每个手机号每天最多5次）
            $limitKey = 'sms_limit_' . md5($mobile);
            $sendCount = (int)S($limitKey);
            $maxLimit = 5;
            
            if ($sendCount >= $maxLimit) {
                \Think\Log::write('[短信限制] 手机号：' . $mobile . ' 今日已发送' . $sendCount . '次', 'WARN');
                return array('code' => 0, 'msg' => '今日发送次数已达上限（' . $maxLimit . '次），请明天再试');
            }
            
            // 2. 准备短信内容
            $template = '您的验证码是：{code}，5分钟内有效，请勿泄露给他人。';
            $content = str_replace('{code}', $code, $template);
            
            // 3. 解析手机号（去除空格和加号）
            $cleanMobile = str_replace(array(' ', '+'), '', $mobile);
            
            // 4. 生成签名（根据官方Demo）
            $timestamp = time();
            $sign = md5($this->apiKey . $this->apiSecret . $timestamp);
            
            // 5. 构建请求数据（JSON格式）
            $dataArr = array(
                'appId' => $this->appId,
                'numbers' => $cleanMobile,
                'content' => $content,
                'senderId' => '',
                'orderId' => '',
            );
            
            $jsonData = json_encode($dataArr);
            
            // 6. 记录请求日志
            \Think\Log::write('[短信发送] 请求参数：' . $jsonData, 'INFO');
            \Think\Log::write('[短信签名] Timestamp:' . $timestamp . ', Sign:' . $sign, 'INFO');
            
            // 7. 发送HTTP请求
            $result = $this->httpPostJson($this->apiUrl, $jsonData, $sign, $timestamp);
            
            // 8. 记录响应日志
            \Think\Log::write('[短信发送] 响应结果：' . json_encode($result), 'INFO');
            
            // 9. 解析结果
            if ($result && is_array($result)) {
                // 检查是否成功（根据onbuka返回格式调整）
                if (isset($result['code']) && ($result['code'] == 0 || $result['code'] == 200 || $result['code'] == '0')) {
                    // 发送成功
                    S($limitKey, $sendCount + 1, 86400);
                    return array(
                        'code' => 1, 
                        'msg' => '验证码发送成功',
                        'data' => $result
                    );
                } else if (isset($result['status']) && $result['status'] == 'success') {
                    // 另一种成功格式
                    S($limitKey, $sendCount + 1, 86400);
                    return array(
                        'code' => 1, 
                        'msg' => '验证码发送成功',
                        'data' => $result
                    );
                } else {
                    // 发送失败
                    $errMsg = isset($result['message']) ? $result['message'] : (isset($result['msg']) ? $result['msg'] : '短信发送失败');
                    \Think\Log::write('[短信发送失败] ' . $errMsg . '，返回数据：' . json_encode($result), 'ERROR');
                    return array(
                        'code' => 0, 
                        'msg' => $errMsg,
                        'data' => $result
                    );
                }
            } else {
                \Think\Log::write('[短信发送失败] 返回数据格式错误', 'ERROR');
                return array('code' => 0, 'msg' => '短信平台返回数据异常');
            }
            
        } catch (\Exception $e) {
            \Think\Log::write('[短信发送异常] ' . $e->getMessage(), 'ERROR');
            return array('code' => 0, 'msg' => '短信发送异常：' . $e->getMessage());
        }
    }
    
    /**
     * HTTP POST请求（JSON格式，带特殊Header）
     * @param string $url API地址
     * @param string $jsonData JSON数据
     * @param string $sign 签名
     * @param int $timestamp 时间戳
     * @return array
     */
    private function httpPostJson($url, $jsonData, $sign, $timestamp)
    {
        $ch = curl_init();
        
        // 构建Headers（按照官方Demo）
        $headers = array(
            'Content-Type: application/json;charset=UTF-8',
            'Sign: ' . $sign,
            'Timestamp: ' . $timestamp,
            'Api-Key: ' . $this->apiKey
        );
        
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonData);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        
        // 执行请求
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlError = curl_error($ch);
        curl_close($ch);
        
        // 检查HTTP状态码
        if ($httpCode != 200) {
            \Think\Log::write('[HTTP错误] 状态码：' . $httpCode . '，错误：' . $curlError, 'ERROR');
            return array('code' => -1, 'message' => 'HTTP请求失败，状态码：' . $httpCode);
        }
        
        // 检查响应内容
        if (empty($response)) {
            \Think\Log::write('[HTTP错误] 响应为空', 'ERROR');
            return array('code' => -1, 'message' => '短信平台无响应');
        }
        
        // 记录原始响应
        \Think\Log::write('[短信响应] 原始数据：' . $response, 'DEBUG');
        
        // 解析JSON
        $result = json_decode($response, true);
        if (json_last_error() != JSON_ERROR_NONE) {
            \Think\Log::write('[JSON解析错误] ' . json_last_error_msg() . '，原始响应：' . $response, 'ERROR');
            return array('code' => -1, 'message' => 'JSON解析失败：' . json_last_error_msg());
        }
        
        return $result;
    }
    
    /**
     * 验证手机号格式（基础验证）
     * @param string $mobile 手机号（格式：+86 13800138000）
     * @return array ['code' => 1通过/0不通过, 'msg' => '提示信息']
     */
    public static function validateMobile($mobile)
    {
        if (empty($mobile)) {
            return array('code' => 0, 'msg' => '手机号不能为空');
        }
        
        // 去除空格
        $mobile = trim($mobile);
        
        // 检查格式：必须包含国际区号
        if (!preg_match('/^\+\d{1,4}\s\d{5,15}$/', $mobile)) {
            return array('code' => 0, 'msg' => '手机号格式错误，格式：+86 13800138000');
        }
        
        return array('code' => 1, 'msg' => '格式正确');
    }
}
?>
