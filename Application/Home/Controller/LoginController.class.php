<?php

namespace Home\Controller;

class LoginController extends HomeController
{
	protected function _initialize()
	{
		parent::_initialize();	$allow_action=array("index","register","upregister","getcodesss","loginsubmit","loginout","findpwd","findpaypwd","webreg","loption","setlang","lhelp","sendcode","findsendcode","resetpwd","sendMobileSms");
		if(!in_array(ACTION_NAME,$allow_action)){
			$this->error(L("非法操作"));
		}
	}
	
	
    
	//未登陆状态的选项页面
	public function loption(){


		$this->display();
	}

	//未登陆状态的设置语言
	public function setlang(){

		$this->display();
	}

	//帮助中心
	public function lhelp(){
		$uid = userid();
		$this->assign('uid',$uid);
		$this->display();
	}

	
	// 用户协议
	public function webreg()
	{
		$this->display();
	}
	
	public function index()
	{
	    $uid = userid();
	    if($uid >= 1){
	       $this->redirect("Index/index"); 
	    }
		$this->display();
	}

	//注册页面
	public function register(){

		$qrcode = I("get.qr");
		if($qrcode != ''){
			$this->assign('qrcode',$qrcode);
		}

		$this->display();
	}


    //提交重置密码
    public function resetpwd($email=null,$ecode=null,$lpwd=null){
//         if (checkstr($email) || checkstr($lpwd) || checkstr($ecode)) {
// 			$this->ajaxReturn(['code'=>0,'info'=>L('您输入的信息有误')]);
// 		}
		if($email == ''){
		    $this->ajaxReturn(['code'=>0,'info'=>L('请输入邮箱')]);
		}
		if($ecode == ''){
		    $this->ajaxReturn(['code'=>0,'info'=>L('请输入邮箱验证码')]);
		}
		if($lpwd == ''){
		    $this->ajaxReturn(['code'=>0,'info'=>L('请输入密码')]);
		}
//		$findcode = session("findcode");
//		if($findcode != $ecode){
//		    $this->ajaxReturn(['code'=>0,'info'=>L('邮箱验证码错误')]);
//		}
		
		$uinfo = M("user")->where(array('username'=>$email))->field("id,username")->find();
		if(empty($uinfo)){
		    $this->ajaxReturn(['code'=>0,'info'=>L('邮箱未注册')]);
		}
		
		$password = md5($lpwd);
		$result = M("user")->where(array('username'=>$email))->save(array('password'=>$password));
		if($result){
		    $data['uid'] = $uinfo['id'];
		    $data['account'] = $uinfo['username'];
		    $data['title'] = L('重置密码');
		    $data['content'] = L('登陆密码重置成功');
		    $data['addtime'] = date("Y-m-d H:i:s",time());
		    $data['status'] = 1;
		    M("notice")->add($data);
		    $this->ajaxReturn(['code'=>1,'info'=>L('登陆密码重置成功')]);
		}else{
		    $this->ajaxReturn(['code'=>0,'info'=>L('密码重置失败')]);
		}
		
    }
    
	// 登录提交处理
	public function loginsubmit($email=null,$lpwd=null,$vcode=null){
 	    if (checkstr($email) || checkstr($lpwd)) { // 移除对 $vcode 的 checkstr 校验
 			$this->ajaxReturn(['code'=>0,'info'=>L('您输入的信息有误')]);
 		}

        // 移除验证码校验逻辑
        // if (!check_verify(strtoupper($vcode),'1')) {
        //     $this->ajaxReturn(['code'=>0,'info'=>L('图形验证码错误!')]);
        // }
		
		$user = M('User')->where(array('username' => $email))->find();
		if(empty($user)){
			$this->ajaxReturn(['code'=>0,'info'=> L('用户不存在')]);
		}
		if (md5($lpwd) != $user['password']){
			$this->ajaxReturn(['code'=>0,'info'=> L('登录密码错误')]);
		}
		
		if (isset($user['status']) && $user['status'] != 1) {
			$this->ajaxReturn(['code'=>0,'info'=> L('你的账号已冻结请联系管理员')]);
		}
		//增加登陆次数
		$incre = M("user")->where(array('id' => $user['id']))->setInc('logins', 1);
		
		//新增登陆记录
		$data['userid'] = $user['id'];
		$data['type'] = L('登录');
		$data['remark'] = L('邮箱登录');
		$data['addtime'] = time();
		$data['addip'] = get_client_ip();
		$data['addr'] = get_city_ip();
		$data['status'] = 1;
		$dre = M("user_log")->add($data);
		
		if($incre && $dre){
		    $lgdata['lgtime'] = date("Y-m-d",time());
		    $lgdata['loginip'] = get_client_ip();
		    $lgdata['loginaddr'] = get_city_ip();
		    $lgdata['logintime'] = date("Y-m-d H:i:s",time());
	    	M("user")->where(array('id' => $user['id']))->save($lgdata);
		    session('userId', $user['id']);
			session('userName', $user['username']);
			$this->ajaxReturn(['code'=>1,'info'=>L('登录成功')]);
		}else{
		    $this->ajaxReturn(['code'=>0,'info'=>L('登录失败')]);
		}
	}
    
    function GetRandStr($len) {
		$chars = array("1", "2","3", "4", "5", "6", "7", "8", "9");
		$charsLen = count($chars) - 1;
		shuffle($chars);
		$output = "";
		for ($i=0; $i<$len; $i++){
			$output .= $chars[mt_rand(0, $charsLen)];
		}
		return $output;
	}
    
    public function getcodesss($email, $type){
        if($_POST){
            $code = $this->GetRandStr(6);
            if($type == 1){
                $title = 'login password recovery';
                
                $message = '<div style="background: #1f253a; width: 100%; color: #93a1c2; padding: 20px">'
                    .'<div style="width: 60%; margin-left: 10%">'
                    .'<h2 style="color: #fff">Login Password Recovery</h2>'
                    .'<div style="color: #93a1c2">Dear users, Hello!</div>'
                    .'<div style="color: #93a1c2">We have received a request to reset the login password. Please use the following verification code to complete the reset login password:</div>'
                    .'<div style="margin-top: 20px;height: 100px;background-color: #0f121d;width: 100%;color: #1373e8;font-size: 30px;line-height: 100px;text-align: center;font-weight: 600;">'
                    .$code
                    .'</div><div style="color: #93a1c2">Verification code valid time: 30 minutes.</div>'
                    .'<div style="color: #93a1c2"><h4>Security Tips:</h4>'
                    .'<ol><li>Do not provide verification codes to anyone, including customer service.</li>'
                    .'<li>If there is no request to reset the login password, please contact customer service immediately for follow-up.</li>'
                    .'<li>Recently, scams have occurred frequently. Scammers induce users to log in to fake websites to steal passwords and verification codes on the grounds of abnormal/risky/thawed accounts, etc.</li>'
                    .'<li>Before logging in, please be sure to confirm that the domain name in the address bar is your trusted domain name, beware of fraud!</li>'
                    .'<li>If you do not operate it yourself or have doubts about the domain name, please contact customer service in time.</li></ol>'
                    .'<h4>Thank you for choosing MEXC Cion</h4>'
                    .'<p>If you have any questions and suggestions, please contact our customer service team</p>'
                    .'<p>f4332106@gmail.com</p></div></div></div>';
            }
            if($type == 2){
                $title = 'loginAccount Activation';
                $message = '<div style="background: #1f253a; width: 100%; color: #93a1c2; padding: 20px"><div style="width: 60%; margin-left: 10%"><h2 style="color: #fff">Account Activation</h2>'
                    .'<div style="color: #93a1c2">Dear users, welcome to MEXC Cion,Your verification code is:</div>'
                    .'<div style="margin-top: 20px;height: 100px;background-color: #0f121d;width: 100%;color: #1373e8;font-size: 30px;line-height: 100px;text-align: center;font-weight: 600;">'
                    .$code
                    ."</div><h4>Security Tips:</h4><ol><li>Don't tell anyone your password and secondary verification code.</li>"
                    ."<li>Don't call any customer service person who claims to be MEXC Cion.</li></ol><h4>MEXC Cion Team</h4>"
                    ."<p>System mail,please do not reply.</p></div></div>";
            }
            
            $emailAddress = $email;
            require(__DIR__."/extend/PHPMailer/SendEmail.php");
            $result = \SendEmail1::SendEmail($title,$message,$emailAddress);
            if($result['code'] == 1){
                // 保存验证码到session
                session('regcode', $code);
                $this->ajaxReturn(['code'=>1,'info'=>L('发送成功'),'msg'=>$code,'email'=>$email]);
            }else{
                $this->ajaxReturn(['code'=>0,'info'=>L('发送失败')]);
            }
        }
    }
    
    // public function getcodesss($email, $type){
    //     if($_POST){
    //         $code = $this->GetRandStr(6);
    //         if($type == 1){
    //             $title = 'login password recovery';
    //             $message = '<p>login password recovery</p>'
    //                 .'<p>Dear users, Hello!</p>'
    //                 .'<p>We have received a request to reset the login password. Please use the following verification code to complete the reset login password:</p>'
    //                 .$code
    //                 .'<p>Verification code valid time: 30 minutes.</p>'
    //                 .'<p>Do not provide verification codes to anyone, including customer service.</p>'
    //                 .'<p>If there is no request to reset the login password, please contact customer service immediately for follow-up.</p>'
    //                 .'<p>Recently, scams have occurred frequently. Scammers induce users to log in to fake websites to steal passwords and verification codes on the grounds of abnormal/risky/thawed accounts, etc.! Before logging in, please be sure to confirm that the domain name in the address bar is your trusted domain name, beware of fraud! If you do not operate it yourself or have doubts about the domain name, please contact customer service in time.</p>'
    //                 .'<p>Thank you for choosing MEXC Cion</p>'
    //                 .'<p>If you have any questions and suggestions, please contact our customer service team</p>'
    //                 .'<p>ServiceMEXC Cion@163.com</p>'
    //             ;
    //         }
    //         if($type == 2){
    //             $title = 'loginAccount Activation';
    //             $message = '<p>loginAccount Activation</p>'
    //                 .'<p>Dear users, welcome to MEXC Cion,Your verification code is:</p>'
    //                 .$code
    //                 .'<p>Security Tips:</p>'
    //                 ."<p>1.Don't tell anyone your password and secondary verification code.</p>"
    //                 ."<p>2.Don't call any customer service person who claims to be MEXC Cion.</p>"
    //                 .'<p>MEXC Cion Team</p>'
    //                 .'<p>System mail,please do not reply.</p>'
    //             ;
    //         }
            
    //         $emailAddress = $email;
    //         require(__DIR__."/extend/PHPMailer/SendEmail.php");
    //         $result = \SendEmail1::SendEmail($title,$message,$emailAddress);
    //         if($result['code'] == 1){
    // 			$this->ajaxReturn(['code'=>1,'info'=>L('发送成功'),'msg'=>$code,'email'=>$email]);
    // 		}else{
    // 		    $this->ajaxReturn(['code'=>0,'info'=>L('发送失败')]);
    // 		}
    //     }
    //     }
    
    /**
     * 发送手机短信验证码
     * @param string $mobile 手机号（格式：+86 13800138000）
     * @param int $type 类型 1=找回密码 2=注册
     */
    public function sendMobileSms($mobile, $type)
    {
        if ($_POST) {
            // 1. 验证手机号
            if (empty($mobile)) {
                $this->ajaxReturn(['code' => 0, 'info' => L('请输入手机号')]);
            }
            
            // 验证手机号格式
            $validateResult = \Common\Ext\SmsHelper::validateMobile($mobile);
            if ($validateResult['code'] != 1) {
                $this->ajaxReturn(['code' => 0, 'info' => $validateResult['msg']]);
            }
            
            // 2. 检查IP频率限制（每个IP每小时最多10次）
            $clientIp = get_client_ip();
            $ipLimitKey = 'sms_ip_' . md5($clientIp);
            $ipCount = (int)S($ipLimitKey);
            if ($ipCount >= 10) {
                $this->ajaxReturn(['code' => 0, 'info' => L('发送过于频繁，请稍后再试')]);
            }
            
            // 3. 检查手机号是否已注册（注册场景）
            if ($type == 2) { // 注册
                $exists = M('user')->where(['username' => $mobile])->find();
                if ($exists) {
                    $this->ajaxReturn(['code' => 0, 'info' => L('手机号已注册')]);
                }
            } else if ($type == 1) { // 找回密码
                $exists = M('user')->where(['username' => $mobile])->find();
                if (!$exists) {
                    $this->ajaxReturn(['code' => 0, 'info' => L('手机号未注册')]);
                }
            }
            
            // 4. 生成6位数字验证码
            $code = $this->GetRandStr(6);
            
            // 5. 调用短信发送类
            $smsHelper = new \Common\Ext\SmsHelper();
            $result = $smsHelper->sendVerifyCode($mobile, $code);
            
            if ($result['code'] == 1) {
                // 6. 发送成功，保存验证码到Session（5分钟有效）
                $sessionKey = $type == 1 ? 'findcode_mobile' : 'regcode_mobile';
                session($sessionKey, $code);
                session($sessionKey . '_mobile', $mobile);
                session($sessionKey . '_expire', time() + 300); // 5分钟过期
                
                // 更新IP限制计数
                S($ipLimitKey, $ipCount + 1, 3600); // 1小时过期
                
                $this->ajaxReturn([
                    'code' => 1, 
                    'info' => L('验证码发送成功'),
                    'msg' => APP_DEBUG ? $code : '', // 调试模式返回验证码
                    'mobile' => $mobile
                ]);
            } else {
                $this->ajaxReturn(['code' => 0, 'info' => $result['msg']]);
            }
        } else {
            $this->ajaxReturn(['code' => 0, 'info' => L('非法请求')]);
        }
    }
    
    /**
     * 验证手机验证码
     * @param string $mobile 手机号
     * @param string $code 验证码
     * @param int $type 类型 1=找回密码 2=注册
     * @return array ['code' => 1通过/0不通过, 'msg' => '提示信息']
     */
    private function checkMobileSms($mobile, $code, $type = 2)
    {
        $sessionKey = $type == 1 ? 'findcode_mobile' : 'regcode_mobile';
        
        // 检查验证码是否过期
        $expireTime = session($sessionKey . '_expire');
        if (!$expireTime || time() > $expireTime) {
            return ['code' => 0, 'msg' => L('验证码已过期，请重新获取')];
        }
        
        // 检查手机号是否匹配
        $sessionMobile = session($sessionKey . '_mobile');
        if ($sessionMobile != $mobile) {
            return ['code' => 0, 'msg' => L('手机号不匹配')];
        }
        
        // 检查验证码是否正确
        $sessionCode = session($sessionKey);
        if ($sessionCode != $code) {
            return ['code' => 0, 'msg' => L('验证码错误')];
        }
        
        // 验证成功后立即清除session，防止重复使用
        session($sessionKey, null);
        session($sessionKey . '_mobile', null);
        session($sessionKey . '_expire', null);
        
        return ['code' => 1, 'msg' => '验证成功'];
    }
    
	//注册处理程序
	public function upregister($account,$lpwd,$invit,$type){
		if($_POST){
 			/*if(checkstr($account) || checkstr($ecode) || checkstr($lpwd) || checkstr($invit)){
 				$this->ajaxReturn(['code'=>0,'info'=>L('您输入的信息有误')]);
 			}*/
 			
 			if(checkstr($account) || checkstr($lpwd) || checkstr($invit)){
 				$this->ajaxReturn(['code'=>0,'info'=>L('您输入的信息有误')]);
 			}
           $area_code = '';
			if ($type == 1) {
               $pos = strpos($account, ' ');
               if (!$pos) {
                   $this->ajaxReturn(['code'=>0,'info'=>L('您输入的信息有误')]);
               }
               $area_code = substr($account , 0 , $pos);
               $mobileNumber = substr($account, $pos + 1);
               // 手机注册时，保存完整手机号
               $fullMobile = $account;
           } else {
               $mobileNumber = $account;
               $fullMobile = $account;
           }
           
			$checkus = M('User')->where(array('username' => $fullMobile))->find();
			if(!empty($checkus)){
				$this->ajaxReturn(['code'=>0,'info'=>L('用户名已存在')]);
			}

		// 验证邮箱验证码 - 根据注册类型验证
		$ecode = I('post.ecode');
		if($ecode == ''){
			$this->ajaxReturn(['code'=>0,'info'=>L('请输入验证码')]);
		}
		
		// 验证验证码（区分手机和邮箱）
		if ($type == 1) { 
			// 手机注册：验证手机短信验证码
			$checkResult = $this->checkMobileSms($fullMobile, $ecode, 2);
			if ($checkResult['code'] != 1) {
				$this->ajaxReturn(['code' => 0, 'info' => $checkResult['msg']]);
			}
			// Session已在checkMobileSms中清除
		} else if ($type == 2) { 
			// 邮箱注册：保持原有逻辑（已注释）
			// $secode = session('regcode');
			// if($secode != $ecode){
			// 	$this->ajaxReturn(['code'=>0,'info'=>L('验证码错误')]);
			// }
		}

			if($lpwd == ''){
				$this->ajaxReturn(['code'=>0,'info'=>L('请输入密码')]);
			}
			
			if($invit == ''){
			 //   $this->ajaxReturn(['code'=>0,'info'=>L('请输入邀请码')]);
			}
            $config = M("config")->where(array('id'=>1))->field("tymoney")->find();
			if($invit != 0 || $invit != ''){
				$inv_user = M('User')->where(array('invit' => $invit))->field("id,username,invit_1,invit_2,path")->find();
				if(empty($inv_user)){
					$this->ajaxReturn(['code'=>0,'info'=>L('推荐人不存在')]);
				}
				$invit_1 = $inv_user['id'];
				$invit_2 = $inv_user['invit_1'];
				$invit_3 = $inv_user['invit_2'];
				$path = $inv_user['path'].','.$inv_user['id'];
			}else{
				$invit_1 = 0;
				$invit_2 = 0;
				$invit_3 = 0;
				$path = '';
			}

			for (; true; ) {
				$myinvit = tradenoa();
				if (!M('User')->where(array('invit' => $myinvit))->find()) {
					break;
				}
			}

			$mo = M();
			$mo->execute('set autocommit=0');
			$mo->execute('lock tables tw_user write , tw_user_coin write ');
			$rs = array();
			$rs[] = $mo->table('tw_user')->add(
				array(
				'username' => $fullMobile,
				'password' => md5($lpwd),
				'money' => $config['tymoney'],
				'invit' => $myinvit,
				'invit_1' => $invit_1,
				'invit_2' => $invit_2,
				'invit_3' => $invit_3,
				'type' => $type,
				'area_code' => $area_code,
				'path'=>$path,
				'addip' => get_client_ip(),
				'addr' => get_city_ip(),
				'addtime' => time(), 
				'status' => 1,
				'txstate' => 1,
				));
		
			$user_coin = array('userid' => $rs[0]);
			// 创建用户数字资产档案
			$rs[] = $mo->table('tw_user_coin')->add($user_coin);
			if (check_arr($rs)) {
				$mo->execute('commit');
				$mo->execute('unlock tables');			
				session('regcode', null); //初始化动态验证码			
				$user = $mo->table('tw_user')->where(array('id'=>$rs[0]))->find();
				$this->ajaxReturn(['code'=>1,'info'=>L('注册成功')]);
			} else {
		    	$mo->execute('rollback');
		    	$this->ajaxReturn(['code'=>0,'info'=>L('注册失败')]);
			}

		}else{
			$this->ajaxReturn(['code'=>0,'info'=>L('网络错误')]);
		}
	}

    public function findsendcode($email,$vcode){
//         if(checkstr($email) || checkstr($vcode)) {
// 			$this->ajaxReturn(['code'=>0,'info'=>L('您输入的信息有误')]);
// 		}
		$email =  I('post.email');
		$vcode =  I('post.vcode');

		if (!check_verify(strtoupper($vcode),'1')) {
			$this->ajaxReturn(['code'=>0,'info'=>L('图形验证码错误')]);
		}
		if($email == ''){
			$this->ajaxReturn(['code'=>0,'info'=>L('请输入邮箱')]);
		}
		$uinfo = M("user")->where(array('username'=>$email))->find();
		if(empty($uinfo)){
		    $this->ajaxReturn(['code'=>0,'info'=>L('邮箱未注册')]);
		}
		$code = rand(10000,99999);
		$result = $this->emailsend($code,$email);

		if($result){

			session('findcode',$code);

			$this->ajaxReturn(['code'=>1,'info'=>L('验证码发送成功')]);
		}else{
			$this->ajaxReturn(['code'=>0,'info'=>L('验证码发送失败')]);
		}
    }

	//邮箱发送验证码
	public function sendcode($email,$vcode){
		if($_POST){
// 			if(checkstr($email) || checkstr($vcode)) {
// 				$this->ajaxReturn(['code'=>0,'info'=>L('您输入的信息有误')]);
// 			}
			$email =  I('post.email');
			$vcode =  I('post.vcode');

			if (!check_verify(strtoupper($vcode),'1')) {
				$this->ajaxReturn(['code'=>0,'info'=>L('图形验证码错误')]);
			}

			if($email == ''){
				$this->ajaxReturn(['code'=>0,'info'=>L('请输入邮箱')]);
			}

			$uinfo = M("user")->where(array('username'=>$email))->find();
			if(!empty($uinfo)){
				$this->ajaxReturn(['code'=>0,'info'=>L('账号已存在')]);
			}
			$code = rand(10000,99999);
			$result = $this->emailsend($code,$email);

			if($result){

				session('regcode',$code);

				$this->ajaxReturn(['code'=>1,'info'=>L('验证码发送成功')]);
			}else{
				$this->ajaxReturn(['code'=>0,'info'=>L('验证码发送失败')]);
			}

		}else{
			$this->ajaxReturn(['code'=>0,'info'=>L('网络错误')]);
		}
		
	}

	//邮件发送验证码
	public function emailsend($desc_content, $toemail){	
	    
	    $config = $clist = M("config")->where(array('id'=>1))->field("smsemail,emailcode,smstemple")->find();
	    $smsemail = "f4332106@gmail.com";
	    $emailcode = trim($config['emailcode']);
	    $smstemple = trim($config['smstemple']);
		Vendor('PHPMailer.src.PHPMailer');
		Vendor('PHPMailer.src.SMTP');
		$mail = new \PHPMailer();
		$mail->SMTPDebug = 0;
		$mail->isSMTP();        
		//$mail->CharSet = "utf8";
		$mail->Host = "smtp.gmail.com";
		//$mail->SMTPAuth = true;
		$mail->Username = $smsemail; //@qq.com此账号仅供测试使用
		$mail->Password = "666888ok";
		//$mail->SMTPSecure = "ssl";
		$mail->Port = 465;
		$mail->CharSet = 'UTF-8';
		$mail->setFrom($smsemail,"Verification Code");
		$mail->addAddress($toemail,'');
		$mail->addReplyTo($smsemail,"Reply");
		$mail->Subject = L('Verification Code');
		$mail->Body = $smstemple.":".$desc_content;	
		if(!$mail->send()){  
			return 0;
		}else{
			return 1;
		}
		
	}



	public function loginout()
	{
		session(null);
		redirect('/');
	}
	
	// 找回密码页面
	public function findpwd(){
		$this->display();
	}

	// 找回交易密码
	public function findpaypwd(){

		$this->display();
	}

}
?>