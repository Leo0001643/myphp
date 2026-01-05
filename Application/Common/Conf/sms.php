<?php
// onbuka.com 短信配置
return array(
    // API配置
    'SMS_API_URL' => 'https://api.onbuka.com/v3/sendSms',
    'SMS_API_KEY' => 'JN85gvcv',
    'SMS_API_SECRET' => 'KJ1kPhA7',
    'SMS_APP_ID' => '46BShokC',

    // 短信模板
    'SMS_TEMPLATE' => '您的验证码是：{code}，5分钟内有效，请勿泄露给他人。',

    // 验证码设置
    'SMS_CODE_LENGTH' => 6,     // 验证码长度
    'SMS_CODE_EXPIRE' => 300,   // 验证码过期时间(秒)
    'SMS_SEND_LIMIT' => 5,      // 每日发送限制次数
);
?>
