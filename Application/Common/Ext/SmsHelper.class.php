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
    private $appId;
    private $secret;
    
    public function __construct()
    {
        // 加载短信配置
        $config = include APP_PATH . 'Common/Conf/sms.php';
        $this->apiUrl = $config['SMS_API_URL'];
        $this->apiKey = $config['SMS_API_KEY'];
        $this->appId = $config['SMS_APP_ID'];
        $this->secret = $config['SMS_SECRET'];
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
            $maxLimit = 5; // 每日最大发送次数
            
            if ($sendCount >= $maxLimit) {
                \Think\Log::write('[短信限制] 手机号：' . $mobile . ' 今日已发送' . $sendCount . '次', 'WARN');
                return ['code' => 0, 'msg' => '今日发送次数已达上限（' . $maxLimit . '次），请明天再试'];
            }
            
            // 2. 准备短信内容
            $template = '您的验证码是：{code}，5分钟内有效，请勿泄露给他人。';
            $content = str_replace('{code}', $code, $template);
            
            // 3. 解析手机号（去除空格和加号）
            $cleanMobile = str_replace([' ', '+'], '', $mobile);
            
            // 4. 构建请求参数
            $timestamp = time();
            $params = [
                'appId' => $this->appId,
                'mobile' => $cleanMobile,
                'content' => $content,
                'timestamp' => $timestamp,
            ];
            
            // 5. 生成签名
            $sign = $this->generateSign($params);
            $params['sign'] = $sign;
            $params['apiKey'] = $this->apiKey;
            
            // 6. 记录请求日志
            \Think\Log::write('[短信发送] 请求参数：' . json_encode([
                'mobile' => $mobile,
                'content' => $content,
                'timestamp' => $timestamp,
                'sign' => $sign
            ]), 'INFO');
            
            // 7. 发送HTTP请求
            $result = $this->httpPost($this->apiUrl, $params);
            
            // 8. 记录响应日志
            \Think\Log::write('[短信发送] 响应结果：' . json_encode($result), 'INFO');
            
            // 9. 解析结果（根据onbuka平台返回格式）
            if ($result && isset($result['code'])) {
                // 成功的情况：code = 0 或 code = 200
                if ($result['code'] == 0 || $result['code'] == 200 || $result['code'] === '0') {
                    // 发送成功，更新限制计数
                    S($limitKey, $sendCount + 1, 86400); // 24小时过期
                    
                    return [
                        'code' => 1, 
                        'msg' => '验证码发送成功',
                        'data' => $result
                    ];
                } else {
                    // 发送失败
                    $errMsg = isset($result['message']) ? $result['message'] : (isset($result['msg']) ? $result['msg'] : '短信发送失败');
                    \Think\Log::write('[短信发送失败] ' . $errMsg . '，返回数据：' . json_encode($result), 'ERROR');
                    
                    return [
                        'code' => 0, 
                        'msg' => $errMsg,
                        'data' => $result
                    ];
                }
            } else {
                \Think\Log::write('[短信发送失败] 返回数据格式错误：' . json_encode($result), 'ERROR');
                return ['code' => 0, 'msg' => '短信平台返回数据异常'];
            }
            
        } catch (\Exception $e) {
            \Think\Log::write('[短信发送异常] ' . $e->getMessage(), 'ERROR');
            return ['code' => 0, 'msg' => '短信发送异常：' . $e->getMessage()];
        }
    }
    
    /**
     * 生成签名（MD5方式）
     * 签名规则：按key排序后拼接 key=value&key=value&secret=SECRET，然后MD5大写
     */
    private function generateSign($params)
    {
        // 1. 按key排序
        ksort($params);
        
        // 2. 拼接字符串 key1=value1&key2=value2
        $signStr = '';
        foreach ($params as $key => $value) {
            if ($key != 'sign' && $key != 'apiKey') { // 排除sign和apiKey本身
                $signStr .= $key . '=' . $value . '&';
            }
        }
        
        // 3. 追加secret
        $signStr .= 'secret=' . $this->secret;
        
        // 4. MD5加密并转大写
        $sign = strtoupper(md5($signStr));
        
        // 记录签名字符串（调试用）
        if (APP_DEBUG) {
            \Think\Log::write('[短信签名] 签名字符串：' . $signStr . ' => ' . $sign, 'DEBUG');
        }
        
        return $sign;
    }
    
    /**
     * HTTP POST请求
     */
    private function httpPost($url, $data)
    {
        $ch = curl_init();
        
        // 设置请求选项
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10); // 10秒超时
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5); // 5秒连接超时
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // 不验证SSL证书
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/x-www-form-urlencoded',
            'User-Agent: Mozilla/5.0 (compatible; SmsHelper/1.0)'
        ]);
        
        // 执行请求
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlError = curl_error($ch);
        curl_close($ch);
        
        // 检查HTTP状态码
        if ($httpCode != 200) {
            \Think\Log::write('[HTTP错误] 状态码：' . $httpCode . '，错误：' . $curlError, 'ERROR');
            return ['code' => -1, 'message' => 'HTTP请求失败，状态码：' . $httpCode];
        }
        
        // 检查响应内容
        if (empty($response)) {
            \Think\Log::write('[HTTP错误] 响应为空', 'ERROR');
            return ['code' => -1, 'message' => '短信平台无响应'];
        }
        
        // 解析JSON
        $result = json_decode($response, true);
        if (json_last_error() != JSON_ERROR_NONE) {
            \Think\Log::write('[JSON解析错误] 原始响应：' . $response, 'ERROR');
            return ['code' => -1, 'message' => 'JSON解析失败：' . json_last_error_msg()];
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
            return ['code' => 0, 'msg' => '手机号不能为空'];
        }
        
        // 去除空格
        $mobile = trim($mobile);
        
        // 检查格式：必须包含国际区号
        if (!preg_match('/^\+\d{1,4}\s\d{5,15}$/', $mobile)) {
            return ['code' => 0, 'msg' => '手机号格式错误，格式：+86 13800138000'];
        }
        
        return ['code' => 1, 'msg' => '格式正确'];
    }
}
?>

