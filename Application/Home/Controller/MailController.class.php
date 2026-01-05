<?php

namespace Home\Controller;

class MailController extends \Think\Controller
{
    
    public function sendcode(){
        
        $to = "954148945@qq.com";
        $subject = "盼图网";
        $message = "<h1>登录验证码</h1>";
        $from = "serve.okx@yahoo.com";
        $headers = "From: $from";
        if(mail($to,$subject,$message,$headers)){
            echo "发送成功";
        }else{
            echo "发送失败";
        }
       /* // 引入PHPMailer的核心文件
        require_once("src/PHPMailer.php");
        require_once("src/SMTP.php");
        $ret = rand(1000,9999);
        $mail = new PHPMailer(true);
        $mail->CharSet = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码

        //$mail->Encoding = "base64"; //编码方式
        
        $mail->SMTPDebug = 0; // SMTP调试功能 0=关闭 1 = 错误和消息 2 = 消息
        
        $mail->isSMTP(); // Set mailer to use SMTP
        
        $mail->SMTPAuth = true; // 启用 SMTP 验证功能
        
        $mail->SMTPSecure = 'ssl'; // Enable TLS encryption, `ssl` also accepted
        
        $mail->Host = 'ssl://smtp.gmail.com:465'; // Specify main and backup SMTP servers
        
        //$mail->Port = 25; // SMTP服务器的端口号
        
        $mail->Username = 'amgokx@gmail.com'; // SMTP username
        
        $mail->Password = '666888ok'; // SMTP password
        
        
        $mail->setFrom('amgokx@gmail.com', 'OKX');

        $mail->Subject = "来自OKX的验证码"; //标题
        
        $mail->Body = "您的验证码为：".$ret."Your Verifycode Of UUUHO is:".$ret; //内容
        
        $mail->IsHTML(true); //是否启用html
        
        $mail->AddAddress('2192517155@qq.com'); //收件用户
        
        $mail->send();*/
    }
}