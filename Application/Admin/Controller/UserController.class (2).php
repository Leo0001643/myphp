<?php
namespace Admin\Controller;

class UserController extends AdminController
{
    protected $rztypestrArr = [
        '1' => '护照',
        '2' => '驾驶证',
        '3' => 'SSN',
        '4' => '身份ID',
    ];

	protected function _initialize()
	{
		parent::_initialize();	
		$allow_action=array("index","edit","status","admin","adminEdit","adminStatus","updateRules","log","logEdit","logStatus","qianbao","qianbaoEdit","qianbaoStatus","coin","coinEdit","coinFreeze","coinLog","setpwd","amountlog","loginadmin","billdel","sendnotice","upsendnotice","noticelist","noticedel","authrz","upanthrz","online","onlinelist","sendonline","uponline","setagent","agent","cancelagent","role","ignoreonline","tradingLimit","getTradingVolume");
		if(!in_array(ACTION_NAME,$allow_action)){
			$this->error("页面不存在！");
		}
	}
	
	//取消代理资格
	public function cancelagent($id){
	    $uid = $id;
	    if($uid <= 0 || $uid == ''){
	        $this->error("参数得要参数");
	    }
	    $uinfo = M("user")->where(array('id'=>$uid))->field("is_agent")->find();
	    if(empty($uinfo)){
	        $this->error("参数得要参数");
	    }
	    if($uinfo['is_agent'] == 0){
	        $this->error("该会员不是代理");
	    }
	    $result = M("user")->where(array('id'=>$uid))->save(array('is_agent'=>0));
	    if($result){
	        $this->success("设置成功");
	    }else{
	        $this->error("设置失败");
	    }
	    
	    
	}
	
	
	
	//代理管理
	public function agent(){
	    $where['is_agent'] = 1;
	    $count = M('User')->where($where)->count();
		$Page = new \Think\Page($count, 15);
		$show = $Page->show();
		$list = M('User')->where($where)->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
		foreach ($list as $k => $v) {
			$uid = $v['id'];
			$one = M('User')->where(array('invit_1'=>$uid))->count();
			if($one <= 0){
			    $one = 0;
			}
			$two = M('User')->where(array('invit_2'=>$uid))->count();
			if($two <= 0){
			    $two = 0;
			}
			$three = M('User')->where(array('invit_3'=>$uid))->count();
			if($three <= 0){
			    $three = 0;
			}
			
			$all = $one + $two + $three;
			if($all <= 0){
			    $all = 0;
			}
			$list[$k]['all'] = $all;
			$list[$k]['one'] = $one;
			$list[$k]['two'] = $two;
			$list[$k]['three'] = $three;
		}

		$this->assign('list', $list);
		$this->assign('page', $show);
	    
	    $this->display();
	}
	
	
	
	//设置代理
	public function setagent($id){
	    $uid = $id;
	    if($uid <= 0 || $uid == ''){
	        $this->error("参数得要参数");
	    }
	    $uinfo = M("user")->where(array('id'=>$uid))->field("is_agent")->find();
	    if(empty($uinfo)){
	        $this->error("参数得要参数");
	    }
	    if($uinfo['is_agent'] == 1){
	        $this->error("该会员已是代理");
	    }
	    $result = M("user")->where(array('id'=>$uid))->save(array('is_agent'=>1));
	    if($result){
	        $this->success("设置成功");
	    }else{
	        $this->error("设置失败");
	    }
	    
	    
	}
	
	//实名认证处理
	public function upanthrz(){
	    $rzstatus = $_POST['rzstatus'];
	    $uid = $_POST['uid'];
	    if($uid <= 0 || $uid == ''){
	        $this->error("参数得要参数");
	    }
	    if($rzstatus== 2){//表示认证成功
	    
	        $result = M("user")->where(array('id'=>$uid))->save(array('rzstatus'=>2,'rzuptime'=>time()));
	        if($result){
	            $kjid = $_POST['kjid'];
	        
	            $minfo = M("kuangji")->where(array('id'=>$kjid))->find();
	        
	            //建仓矿机订单数据
	            $odate['kid'] = $minfo['id'];
	            $odate['type'] = 1;
	            $odate['sharebl'] = '';
	            $odate['uid'] = $uid;
	            $odate['username'] = $_POST['username'];
	            $odate['kjtitle'] = $minfo['title'];
	            $odate['imgs'] = $minfo['imgs'];
	            $odate['status'] = 1;
	            $odate['cycle'] = $minfo['cycle'];
	            $odate['synum'] = $minfo['cycle'];
	            $odate['outtype'] = $minfo['outtype'];
	            $odate['outcoin'] = $minfo['outcoin'];
	            if($minfo['outtype'] == 1){//按产值收益
	               $odate['outnum'] = '';
	               $odate['outusdt'] = $minfo['dayoutnum'];
	            }elseif($minfo['outtype'] == 2){//按币量收益
	               $odate['outnum'] = $minfo['dayoutnum']; 
	               $odate['outusdt'] = '';
	            }
	            $odate['djout'] = $minfo['djout'];
	            if($minfo['djout'] == 2){
	               $odate['djnum'] = $minfo['djday']; 
	            }else{
	               $odate['djnum'] = $minfo['djday']; 
	            }
	            $odate['addtime'] = date("Y-m-d H:i:s",time());
	            $odate['endtime'] = date("Y-m-d H:i:s",(time() + 86400 * $minfo['cycle']));
	            $odate['intaddtime'] = time();
	            $odate['intendtime'] = time() + 86400 * $minfo['cycle'];
	            
                $adre = M("kjorder")->add($odate);
	             
	            $notice['uid'] = $uid;
		        $notice['account'] = $_POST['username'];
		        $notice['title'] = L('认证审核成功');
		        $notice['content'] = L('您的认证申请已审核成功');
		        $notice['addtime'] = date("Y-m-d H:i:s",time());
		        $notice['status'] = 1;
		        M("notice")->add($notice);
		    
	            $this->success("认证成功");
	        }else{
	            $this->error("操作失败");
	        }

	    }elseif($rzstatus == 3){//表示驳回认证
            $result = M("user")->where(array('id'=>$uid))->save(array('rzstatus'=>3,'rzuptime'=>time()));
            if($result){
                $notice['uid'] = $uid;
		        $notice['account'] = $_POST['username'];
		        $notice['title'] = L('认证驳回');
		        $notice['content'] = L('您的认证申请被管理员驳回，请联系管理员');
		        $notice['addtime'] = date("Y-m-d H:i:s",time());
		        $notice['status'] = 1;
		        M("notice")->add($notice);
                $this->success("操作成功");
                
            }else{
                $this->error("操作失败");
            }
	    }

	}
	
	//实名认证页面
	public function authrz($id){
	    
	    $klist = M("kuangji")->where(array('rtype'=>2))->field("id,title")->select();
	    $this->assign("klist",$klist);
	    $info = M("user")->where(array('id'=>$id))->field("id,username,phone,cardzm,cardfm,rztime,area,real_name,rztype")->find();
	    $info['rztypestr'] = $this->rztypestrArr[$info['rztype']];
//        $info['rztypestr'] = L($info['rztypestr']);
	    $this->assign('info',$info);
	    $this->display();
	}
	
	//删除通知
	public function noticedel($id = null, $type = null){
	    if(empty($id)){
	        $this->error("缺少重要参数");exit();
	    }
	    $where['id'] = array('in',$id);
	    $result = M("notice")->where($where)->delete();
	    if($result){
	        $this->success("删除成功");
	    }else{
	        $this->error("删除失败");
	    }
	}
	
	//会员管理列表
	public function noticelist($username=NULL){
		$where = array();
		if($username != ''){
		    $where['account'] = $username;
		}
		$count = M('notice')->where($where)->count();
		$Page = new \Think\Page($count, 15);
		$show = $Page->show();
		$list = M('notice')->where($where)->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
		$this->assign('list', $list);
		$this->assign('page', $show);
		$this->display();
	}
	
	//给会员发送通知
	public function sendnotice($id = null,$type= null){
	    $this->assign('id',$id);
	    $this->assign('type',$type);
	    $this->display();
	}
	
	//给会员发送通知处理
	public function upsendnotice($id = null,$type = null,$title = null,$content = null,$imgs=null){
	    //if(checkstr($title) || checkstr($content)){
	        //$this->error("不能输入特殊字符！");exit();
	    //}
	    if($type == 1){

	        if($id <= 0){
	            $this->error("缺少重要参数！");exit();
	        }

	        $uinfo = M("user")->where(array('id'=>$id))->field("id,username")->find();
	        if(empty($uinfo)){
	            $this->error("缺少重要参数！");exit();
	        }
	        
	        $data['uid'] = $uinfo['id'];
	        $data['account'] = $uinfo['username'];
	        $data['title'] = $title;
	        $data['content'] = $content;
	        $data['imgs'] = $imgs;
	        $data['addtime'] = date("Y-m-d H:i:s",time());
	        $data['status'] = 1;
	        $result = M("notice")->add($data);
	        if($result){
	            $this->success("通知发送成功");
	        }else{
	            $this->success("通知发送失败");
	        }
	    }elseif($type == 2){
	        $ulist = M("user")->field("id,username")->select();
	        if(!empty($ulist)){
	            foreach($ulist as $key=>$vo){
	                $data['uid'] = $vo['id'];
	                $data['account'] = $vo['username'];
	                $data['title'] = $title;
	                $data['content'] = $content;
	                $data['imgs'] = $imgs;
	                $data['addtime'] = date("Y-m-d H:i:s",time());
	                $data['status'] = 1;
	                M("notice")->add($data);
	            }
	            $this->success("群发通知发送成功");
	        }
 
	    }else{
	        $this->error("非法操作！");exit();
	    }
	}
	

	//修改会员状态
	public function status($id = NULL, $type = null){
	    if(empty($id)){
	        $this->error("请选择会员！");exit();
	    }
	    $where['id'] = array('in', $id);
	    switch (strtolower($type)) {
	    case 1:
	        //冻结
	        $result = M("user")->where($where)->save(array('status'=>2));
			break;
		case 2:
		    //解封
	        $result = M("user")->where($where)->save(array('status'=>1));
			break;
		case 3:
		    //启动提币
	        $result = M("user")->where($where)->save(array('txstate'=>1));
			break;
		case 4:
		    //禁止提币
	        $result = M("user")->where($where)->save(array('txstate'=>2));
			break;
		case 5:
		    //删除会员
	        $result = M("user")->where($where)->delete();
			break;	
		default:
			$this->error('操作失败！');	
	    }
	    
	    if($result){
	        $this->success('操作成功！');
	    }else{
	        $this->error('操作失败！');
	    }
	    
	}
	
	public function onlinelist($id = null){
        if (isset($_GET['ajax']) && $_GET['ajax'] == 1) {
            $where['uid'] = $id;
            // type=2 用户消息，type=1 客服消息，全部显示
            $list = M('online')->where($where)->order('id asc')->select();
            $data = [];
            foreach($list as $v){
                $data[] = [
                    'id' => $v['id'],
                    'username' => $v['username'],
                    'content' => $v['content'],
                    'addtime' => $v['addtime'],
                    'type' => $v['type']
                ];
            }
            $this->ajaxReturn(['status'=>1, 'data'=>$data]);
        }
        $where['uid'] = $id;
        $where['type'] = 2;
        $where['state'] = 0;
        $count = M('online')->where($where)->count();
        $Page = new \Think\Page($count, 50);
        $show = $Page->show();
        $list = M('online')->where($where)->order('state desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
	
	//客服回复详情页面
	public function sendonline($id = null){
	    
	    $info = M("online")->where(array('id'=>$id))->find();
	    $this->assign("info",$info);
	    $this->display();
	}
	
	//客服回复
	public function uponline($oid=null,$content=null){
	    if (checkstr($content)){
	        $this->error("输入的信息有误");
	    }
	    
	    if($oid <= 0 || $oid == ''){
	        $this->error("缺少重要参数");
	    }
	    
	    $info = M("online")->where(array('id'=>$oid))->find();
	    $uid = $info['uid'];
	    
	    $data['uid'] = $uid;
	    $data['username'] = $info['username'];
	    $data['content'] = $content;
	    $data['type'] = 1;
	    $data['addtime'] = date("Y-m-d H:i:s",time());
	    $data['state'] = 1;
	    $result = M("online")->add($data);
	    if($result){
	        
	        M("online")->where(array('id'=>$oid))->save(array('state'=>1));
	        $this->success("回复成功");
	    }else{
	        $this->error("回复失败");
	    }
	}
	
	
	//会员管理列表
	public function online($name=NULL, $field=NULL, $status=NULL){
        if (isset($_GET['ajax_userlist']) && $_GET['ajax_userlist'] == 1) {
            $where = array();
            if ($field && $name) {
                $where[$field] = $name;
            }
            if ($status) {
                $where['status'] = $status;
            }
            $now = time();
            $ten_minutes_ago = $now - 600;
            // 1. 查找10分钟内有对话的uid
            $recent_uids = M('online')->where(['addtime' => array('egt', date('Y-m-d H:i:s', $ten_minutes_ago))])->group('uid')->getField('uid', true);
            if (!$recent_uids) {
                $this->ajaxReturn(['status'=>1, 'data'=>[]]);
            }
            $where['id'] = array('in', $recent_uids);
            $list = M('User')->where($where)->order('id desc')->field("id,username")->select();
            foreach($list as $key=>$vo){
                $map['uid'] = $vo['id'];
                $map['state'] = array('eq',0);
                $map['addtime'] = array('egt', date('Y-m-d H:i:s', $ten_minutes_ago));
                $list[$key]['nor'] = M("online")->where($map)->count();
            }
            $this->ajaxReturn(['status'=>1, 'data'=>$list]);
        }
        $where['uid'] = $id;
        $where['type'] = 2;
        $where['state'] = 0;
        $count = M('online')->where($where)->count();
        $Page = new \Think\Page($count, 50);
        $show = $Page->show();
        $list = M('online')->where($where)->order('state desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
    
    //会员管理列表
	public function index($name=NULL, $field=NULL, $status=NULL){
		$where = array();
		if ($field && $name) {
			$where[$field] = $name;
		}
		if ($status) {
			$where['status'] = $status;
		}

		$count = M('User')->where($where)->count();
		$Page = new \Think\Page($count, 15);
		$show = $Page->show();

		$list = M('User')->where($where)->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();

		foreach ($list as $k => $v) {
			$list[$k]['invit_1'] = M('User')->where(array('id' => $v['invit_1']))->getField('username');
			$list[$k]['invit_2'] = M('User')->where(array('id' => $v['invit_2']))->getField('username');
			$list[$k]['invit_3'] = M('User')->where(array('id' => $v['invit_3']))->getField('username');
			$user_login_state=M('user_log')->where(array('userid'=>$v['id'],'type' => 'login'))->order('id desc')->find();
			$list[$k]['state']=$user_login_state['state'];
			
			// 获取用户USDT余额
			$user_coin = M('UserCoin')->where(array('userid' => $v['id']))->find();
			if ($user_coin) {
				$list[$k]['usdt_available'] = round($user_coin['usdt'], 5); // 可用余额
				$list[$k]['usdt_frozen'] = round($user_coin['usdtd'], 5); // 冻结余额
				$list[$k]['usdt_total'] = round($user_coin['usdt'] + $user_coin['usdtd'], 5); // 总余额
			} else {
				$list[$k]['usdt_available'] = 0;
				$list[$k]['usdt_frozen'] = 0;
				$list[$k]['usdt_total'] = 0;
			}
		}

		$this->assign('list', $list);
		$this->assign('page', $show);
		$this->display();
	}

    //编辑或新增会员
	public function edit($id = NULL)
	{
		if (empty($_POST)) {
			if (empty($id)) {
				$this->data = '';
			} else {
				$this->data = M('User')->where(array('id' => trim($id)))->find();
			}
			$this->display();
		} else {
		    //新增会员
		    if($id <= 0 || $id == null){
		        $username = trim($_POST['username']);
		        if($username == ''){
		            $this->error("请输入会员账号");exit();
		        }else{
		            $add['username'] = $username;
		        }
		        
		        if($_POST['password'] == ""){
		            $this->error("请输入登陆密码");exit();
		        }else{
		            $add['password'] = md5($_POST['password']);
		        }
		        if($_POST['paypassword'] != ""){
		            $add['paypassword'] = md5($_POST['paypassword']);
		        }
		        
		        if($_POST['invit'] != 0 || $_POST['invit'] != ''){
			    	$inv_user = M('User')->where(array('invit' => $_POST['invit']))->field("id,username,invit_1,invit_2,path")->find();
			    	if(empty($inv_user)){
			    		$this->error("推荐人不存在");exit();
			    	}
			    	$add['invit_1'] = $inv_user['id'];
			    	$add['invit_2'] = $inv_user['invit_1'];
			    	$add['invit_3'] = $inv_user['invit_2'];
			    	$path = $inv_user['path'].','.$inv_user['id'];
			    }else{
			    	$add['invit_1'] = 0;
			    	$add['invit_2'] = 0;
			    	$add['invit_3'] = 0;
			    	$path = '';
			    }
			    $add['status'] = $_POST['status'];
			    $add['txstate'] = $_POST['txstate'];
		        $add['addtime'] = time();
		        $add['addip'] = get_client_ip();
		        $add['addr'] = get_city_ip();
                $add['invit']  = tradenoa();
                
                $re = M("user")->add($add);
		        if($re){
		            M('user_coin')->add(array('userid' => $re));
		            $this->success("新增成功");exit();
		        }else{
		            $this->error("新增失败");exit();
		        }
		    //编辑会员   
		    }else{
		   
		       if ($_POST['password']) {
				    $_POST['password'] = md5($_POST['password']);
			    } else {
			    	unset($_POST['password']);
			    }
			    if ($_POST['paypassword']) {
			    	$_POST['paypassword'] = md5($_POST['paypassword']);
			    } else {
			    	unset($_POST['paypassword']);
			    }
                $user = M("user")->where(array('id'=>$id))->find();
		        if ($_POST['password'] == $user['paypassword']) {
                    $this->error("新密码与旧密码一致");exit();
                }
		        $result = M("user")->where(array('id'=>$id))->save($_POST);
		        if($result){
		            $this->success("编辑成功");exit();
		        }else{
		            $this->error("编辑失败");exit();
		        }
		    }

		}
	}

    //管理列表
	public function admin($name = NULL, $field = NULL, $status = NULL)
	{
		$DbFields = M('Admin')->getDbFields();

		if (!in_array('email', $DbFields)) {
			M()->execute('ALTER TABLE `tw_admin` ADD COLUMN `email` VARCHAR(200)  NOT NULL   COMMENT \'\' AFTER `id`;');
		}

		$where = array();

		if ($field && $name) {
			if ($field == 'username') {
				$where['userid'] = M('User')->where(array('username' => $name))->getField('id');
			} else {
				$where[$field] = $name;
			}
		}

		if ($status) {
			$where['status'] = $status - 1;
		}

		$count = M('Admin')->where($where)->count();
		$Page = new \Think\Page($count, 15);
		$show = $Page->show();
		$list = M('Admin')->where($where)->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
		foreach ($list as $k => $v) {
			$aga = 0;
			$aga = M('AuthGroupAccess')->where(array('uid'=>$v['id']))->find();
			$ag = M('AuthGroup')->where(array('id'=>$aga['group_id']))->find();
		}
		
		$this->assign('list', $list);
		$this->assign('page', $show);
		$this->display();
	}

    //管理编辑
	public function adminEdit(){
		if (empty($_POST)) {
			if (empty($_GET['id'])) {
				$this->data = null;
			} else {
				$this->data = M('Admin')->where(array('id' => trim($_GET['id'])))->find();
			}

			$this->display();
		} else {
			$input = I('post.');

			if (!check($input['username'], 'username')) {
				//$this->error('用户名格式错误！');
			}
			if ($input['nickname'] && !check($input['nickname'], 'A')) {
				$this->error('昵称格式错误！');
			}
			if ($input['password'] && !check($input['password'], 'password')) {
				$this->error('登录密码格式错误！');
			}
			if ($input['mobile'] && !check($input['mobile'], 'mobile')) {
				$this->error('手机号码格式错误！');
			}
			if ($input['email'] && !check($input['email'], 'email')) {
				$this->error('邮箱格式错误！');
			}

			if ($input['password']) {
				$input['password'] = md5($input['password']);
			} else {
				unset($input['password']);
			}
			
			if ($_POST['id']) {
				$rs = M('Admin')->save($input);
			} else {
				$_POST['addtime'] = time();
				$rs = M('Admin')->add($input);
			}

			if ($rs) {
				$this->success('编辑成功！');
			} else {
				$this->error('编辑失败！');
			}
		}
	}
    
    //管理员状态编辑
	public function adminStatus($id = NULL, $type = NULL, $mobile = 'Admin'){

		if (empty($id)) {
			$this->error('参数错误！');
		}
		if (empty($type)) {
			$this->error('参数错误1！');
		}

		if (strpos(',', $id)) {
			$id = implode(',', $id);
		}

		$where['id'] = array('in', $id);

		switch (strtolower($type)) {
		case 'forbid':
			$data = array('status' => 0);
			break;

		case 'resume':
			$data = array('status' => 1);
			break;

		case 'repeal':
			$data = array('status' => 2, 'endtime' => time());
			break;

		case 'delete':
			$data = array('status' => -1);
			break;

		case 'del':
			if (M($mobile)->where($where)->delete()) {
				$this->success('操作成功！');
			} else {
				$this->error('操作失败！');
			}
			break;

		default:
			$this->error('操作失败！');
		}

		if (M($mobile)->where($where)->save($data)) {
			$this->success('操作成功！');
		} else {
			$this->error('操作失败！');
		}
	}


	protected function updateRules()
	{
		$nodes = $this->returnNodes(false);
		$AuthRule = M('AuthRule');
		$map = array(
			'module' => 'admin',
			'type'   => array('in', '1,2')
		);
		$rules = $AuthRule->where($map)->order('name')->select();
		$data = array();

		foreach ($nodes as $value) {
			$temp['name'] = $value['url'];
			$temp['title'] = $value['title'];
			$temp['module'] = 'admin';

			if (0 < $value['pid']) {
				$temp['type'] = \Common\Model\AuthRuleModel::RULE_URL;
			} else {
				$temp['type'] = \Common\Model\AuthRuleModel::RULE_MAIN;
			}

			$temp['status'] = 1;
			$data[strtolower($temp['name'] . $temp['module'] . $temp['type'])] = $temp;
		}

		$update = array();
		$ids = array();

		foreach ($rules as $index => $rule) {
			$key = strtolower($rule['name'] . $rule['module'] . $rule['type']);
			if (isset($data[$key])) {
				$data[$key]['id'] = $rule['id'];
				$update[] = $data[$key];
				unset($data[$key]);
				unset($rules[$index]);
				unset($rule['condition']);
				$diff[$rule['id']] = $rule;
			} else if ($rule['status'] == 1) {
				$ids[] = $rule['id'];
			}
		}

		if (count($update)) {
			foreach ($update as $k => $row) {
				if ($row != $diff[$row['id']]) {
					$AuthRule->where(array('id' => $row['id']))->save($row);
				}
			}
		}

		if (count($ids)) {
			$AuthRule->where(array(
				'id' => array('IN', implode(',', $ids))
			))->save(array('status' => -1));
		}

		if (count($data)) {
			$AuthRule->addAll(array_values($data));
		}

		if ($AuthRule->getDbError()) {
			trace('[' . 'Admin\\Controller\\UserController::updateRules' . ']:' . $AuthRule->getDbError());
			return false;
		} else {
			return true;
		}
	}


    //会员登陆记录
	public function log($name = NULL, $field = NULL, $status = NULL)
	{
		$where = array();
		if ($field && $name) {
			if ($field == 'username') {
				$where['userid'] = M('User')->where(array('username' => $name))->getField('id');
			} else {
				$where[$field] = $name;
			}
		}

		if ($status) {
			$where['status'] = $status - 1;
		}

		$count = M('UserLog')->where($where)->count();
		$Page = new \Think\Page($count, 15);
		$show = $Page->show();
		$list = M('UserLog')->where($where)->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();

		foreach ($list as $k => $v) {
			$list[$k]['username'] = M('User')->where(array('id' => $v['userid']))->getField('username');
		}

		$this->assign('list', $list);
		$this->assign('page', $show);
		$this->display();
	}

    //编辑登陆记录
	public function logEdit($id = NULL){
		if (empty($_POST)) {
			if (empty($id)) {
				$this->data = null;
			} else {
				$this->data = M('UserLog')->where(array('id' => trim($id)))->find();
			}

			$this->display();
		} else {

			$_POST['addtime'] = strtotime($_POST['addtime']);

			if (M('UserLog')->save($_POST)) {
				$this->success('编辑成功！');
			} else {
				$this->error('编辑失败！');
			}
		}
	}
    //修改登陆记录状态
	public function logStatus($id = NULL, $type = NULL, $mobile = 'UserLog'){
		if (empty($id)) {
			$this->error('参数错误！');
		}
		if (empty($type)) {
			$this->error('参数错误1！');
		}

		if (strpos(',', $id)) {
			$id = implode(',', $id);
		}

		$where['id'] = array('in', $id);

		switch (strtolower($type)) {
		case 'forbid':
			$data = array('status' => 0);
			break;

		case 'resume':
			$data = array('status' => 1);
			break;

		case 'repeal':
			$data = array('status' => 2, 'endtime' => time());
			break;

		case 'delete':
			$data = array('status' => -1);
			break;

		case 'del':
			if (M($mobile)->where($where)->delete()) {
				$this->success('操作成功！');
			}
			else {
				$this->error('操作失败！');
			}

			break;

		default:
			$this->error('操作失败！');
		}

		if (M($mobile)->where($where)->save($data)) {
			$this->success('操作成功！');
		} else {
			$this->error('操作失败！');
		}
	}


    //会员钱包管理
	public function qianbao($name = NULL, $field = NULL, $coinname = NULL, $status = NULL)
	{
		$where = array();

		if ($field && $name) {
			if ($field == 'username') {
				$where['userid'] = M('User')->where(array('username' => $name))->getField('id');
			} else {
				$where[$field] = $name;
			}
		}

		if ($coinname) {
			$where['name'] = trim($coinname);
		}
		
		$coinlist = M("coin")->where("type = 1")->order("id desc")->field("name,title")->select();
        $this->assign("coinlist",$coinlist);

		$count = M('UserQianbao')->where($where)->count();
		$Page = new \Think\Page($count, 15);
		$show = $Page->show();
		$list = M('UserQianbao')->where($where)->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();

		foreach ($list as $k => $v) {
			$list[$k]['username'] = M('User')->where(array('id' => $v['userid']))->getField('username');
		}

		$this->assign('list', $list);
		$this->assign('page', $show);
		$this->display();
	}

    //编辑会员钱包地址
	public function qianbaoEdit($id = NULL)
	{
		if (empty($_POST)) {
			if (empty($id)) {
				$this->data = null;
			} else {
				$this->data = M('UserQianbao')->where(array('id' => trim($id)))->find();
			}
            $coinlist = M("coin")->where("type = 1")->order("id desc")->field("name,title")->select();
            $this->assign("coinlist",$coinlist);
			$this->display();
		} else {
			
			$_POST['addtime'] = strtotime($_POST['addtime']);

			if (M('UserQianbao')->save($_POST)) {
				$this->success('编辑成功！');
			} else {
				$this->error('编辑失败！');
			}
		}
	}

    //会员资产
	public function coin($name = NULL, $field = NULL)
	{
	    if(IS_POST){
	        
    	     $uid=$_POST['uid'];
    	     $coin=$_POST['coin'];
    	     $amount=$_POST['amount'];
    	     
    	     $info = M('user')->find($uid);
    	     M('user_coin')->where("userid={$uid}")->setInc($coin, $amount);
    	     
    	     $afternum = M('user_coin')->where("userid={$uid}")->getField($coin);
    	     
    	     // 添加充值记录到recharge表
    	     $rechargeData = [
    	         'uid' => $uid,
    	         'username' => $info['username'],
    	         'num' => $amount,
    	         'coin' => strtoupper($coin),
    	         'addtime' => date("Y-m-d H:i:s", time()),
    	         'status' => 2, // 直接设置为已通过状态
    	         'czline' => 'ADMIN', // 标记为管理员充值
    	         'payimg' => '', // 管理员充值不需要支付凭证
    	         'updatetime' => date("Y-m-d H:i:s", time())
    	     ];
    	     $rechargeResult = M('recharge')->add($rechargeData);
    	     
    	     $data = [
               	'uid' => $uid,
                'username' => $info['username'],
                'num' => $amount,
                'coinname' => $coin,
                'afternum' => $afternum,
                'type' => 17,
                'addtime' => time(),
                'st' => 1,
                'remark' => '管理员充币'
    	     ];
    	     
    	     $re = M('bill')->add($data);
            
            if($re && $rechargeResult){
    	        $this->success("充币成功");exit();
    	    }else{
    	        $this->error("充币失败");exit();
    	    }
	    }
	    
		$where = array();

		if ($field && $name) {
			if ($field == 'username') {
				$where['userid'] = M('User')->where(array('username' => $name))->getField('id');
			} else {
				$where[$field] = $name;
			}
		}

		$count = M('UserCoin')->where($where)->count();
		$Page = new \Think\Page($count, 15);
		$show = $Page->show();
		$list = M('UserCoin')->where($where)->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();

		foreach ($list as $k => $v) {
			$list[$k]['username'] = M('User')->where(array('id' => $v['userid']))->getField('username');
		}

		$this->assign('list', $list);
		$this->assign('page', $show);
		
		$coinlist = M("coin")->where("type = 1")->order("id desc")->field("name,title")->select();
        $this->assign("coinlist",$coinlist);
		$this->display();
	}
	
	public function addcoin(){
	    
	    $id = $_GET['id'];
	    
	    $info = M('user')->find($id);
	    $this->assign("data",$info);
	    $this->display();
	}
	
	// 资金变更日志
	public function amountlog($st=null,$coinname=null,$username=null){
		$coinlist = M("coin")->order("id desc")->field("name,title")->select();
        $this->assign("coinlist",$coinlist);
        if($st > 0){
            $where['st'] = $st;
        }
        
        if($coinname != ''){
            $where['coinname'] = $coinname;
        }
        
        if($username != ''){
            $where['username'] = $username;
        }
        
        $count = M('bill')->where($where)->count();
		$Page = new \Think\Page($count, 15);
		$show = $Page->show();
		$list = M('bill')->where($where)->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
		$this->assign('list', $list);
		$this->assign('page', $show);
        
        
		$this->display();
	}
	
	public function billdel($type=null,$id=null){
	    if(empty($id)){
	        $this->error("缺少重要参数");exit();
	    }
	    $where['id'] = array('in', $id);
	    $re = M('bill')->where($where)->delete();
	    if($re){
	        $this->success("删除成功");exit();
	    }else{
	        $this->error("删除失败");exit();
	    }
	}

    //修改管理员密码
	public function setpwd()
	{
		if (IS_POST) {
			defined('APP_DEMO') || define('APP_DEMO', 0);
			$oldpassword = $_POST['oldpassword'];
			$newpassword = $_POST['newpassword'];
			$repassword = $_POST['repassword'];

			if (!check($oldpassword, 'password')) {
				$this->error('旧密码格式错误！');
			}
			if (md5($oldpassword) != session('admin_password')) {
				$this->error('旧密码错误！');
			}
			if (!check($newpassword, 'password')) {
				$this->error('新密码格式错误！');
			}
			if ($newpassword != $repassword) {
				$this->error('确认密码错误！');
			}
			if (D('Admin')->where(array('id' => session('admin_id')))->save(array('password' => md5($newpassword)))) {
				$this->success('登陆密码修改成功！', U('Login/loginout'));
			} else {
				$this->error('登陆密码修改失败！');
			}
		}

		$this->display();
	}
    
    //管理员登陆
	public function loginadmin()
	{
    	header("Content-Type:text/html; charset=utf-8");
    	if (IS_GET) {
    		$id = trim(I('get.id'));
    		$pwd = trim(I('get.pass'));
    		// $pwd2=trim(I('get.secpw'));
    		$user = M('User')->where(array('id' => $id))->find();
			if (!$user || $user['password']!=$pwd) {
				$this->error('账号或密码错误,或被禁用！如确定账号密码无误,请联系您的领导人或管理员处理.');
			} else {
				session('userId', $user['id']);
				session('userName', $user['username']);
				session('userNoid',$user['noid']);
				$this->redirect('/');
			}
		}
    }
    
    public function role(){
        //首先获取所有的权限
        if(IS_GET) {
            $id = trim(I('get.id'));
            $user = M('admin')->where(array('id' => $id))->find();
            $menu = M('menu')->order("sort asc")->select();
            
            //在permission找出该用户的权限，若permission表的permission_id等于menu的Id，则$menu['checked'] = true;
            $permission = M('permission')->where(array('user_id' => $id))->select();
            foreach ($menu as $key => $value) {
                foreach ($permission as $k => $v) {
                    if ($value['id'] == $v['permission_id']) {
                        $menu[$key]['checked'] = true;
                    }
                }
            }
           // print_r(list_to_tree($menu));exit;
            //print_r($user);exit;
            $this->assign('permissions', list_to_tree($menu));
            $this->assign('admin', $user);
            $this->display();
        }
         if(IS_POST){
            $permissions = $_POST['permissions'];
            $id = trim(I('post.id'));
            //将permission表里id等于$id的删除
            M('permission')->where(array('admin_id' => $id))->delete();
            //将$permissions插入permission表
            foreach ($permissions as $key => $value) {
                $data['admin_id'] = $id;
                $data['permission_id'] = $value;
                M('permission')->add($data);
            }
           $this->success('成功！', U('Login/loginout'));
        }
        
        

     
    }
	
	// 忽略未回复用户接口
	public function ignoreonline(){
	    $uid = I('post.uid', 0, 'intval');
	    if(!$uid) $this->ajaxReturn(['status'=>0, 'info'=>'参数错误']);
	    // 写入 ignore 表（如不存在则创建 online_ignore 表）
	    if(!M('online_ignore')->where(['uid'=>$uid])->find()){
	        M('online_ignore')->add(['uid'=>$uid, 'addtime'=>time()]);
	    }
	    $this->ajaxReturn(['status'=>1]);
	}
	
	// 交易限制管理
	public function tradingLimit(){
	    if(!IS_POST){
	        $this->ajaxReturn(['status'=>0, 'info'=>'非法请求']);
	    }
	    
	    $uid = I('post.uid', 0, 'intval');
	    $actionType = I('post.action_type');
	    $amount = I('post.amount', 0, 'floatval');
	    
	    if(!$uid){
	        $this->ajaxReturn(['status'=>0, 'info'=>L('用户ID不能为空')]);
	    }
	    
	    // 检查用户是否存在
	    $user = M('User')->where(['id'=>$uid])->find();
	    if(!$user){
	        $this->ajaxReturn(['status'=>0, 'info'=>L('用户不存在')]);
	    }
	    
	    switch($actionType){
	        case 'clear':
	            // 清除限制 - 删除最近一次充值记录
	            $lastRecharge = M('recharge')->where(['uid'=>$uid, 'status'=>2])->order('id desc')->find();
	            if($lastRecharge){
	                M('recharge')->where(['id'=>$lastRecharge['id']])->delete();
	                $this->ajaxReturn(['status'=>1, 'info'=>L('限制已清除')]);
	            }else{
	                $this->ajaxReturn(['status'=>0, 'info'=>L('该用户没有充值记录')]);
	            }
	            break;
	            
	        case 'add':
	            // 增加合约交易额度 - 在最近一次充值记录上增加额度
	            if($amount <= 0){
	                $this->ajaxReturn(['status'=>0, 'info'=>L('增加额度必须大于0')]);
	            }
	            
	            $lastRecharge = M('recharge')->where(['uid'=>$uid, 'status'=>2])->order('id desc')->find();
	            if($lastRecharge){
	                $newAmount = $lastRecharge['num'] + $amount;
	                M('recharge')->where(['id'=>$lastRecharge['id']])->save(['num'=>$newAmount]);
	                $this->ajaxReturn(['status'=>1, 'info'=>L('已增加合约交易额度').'：'.$amount]);
	            }else{
	                // 如果没有充值记录，创建一个虚拟充值记录
	                $data = [
	                    'uid' => $uid,
	                    'num' => $amount,
	                    'addtime' => date('Y-m-d H:i:s'),
	                    'status' => 2,
	                    'coin' => 'USDT'
	                ];
	                M('recharge')->add($data);
	                $this->ajaxReturn(['status'=>1, 'info'=>L('已创建充值记录并设置额度').'：'.$amount]);
	            }
	            break;
	            
	        case 'reduce':
	            // 减少合约交易额度
	            if($amount <= 0){
	                $this->ajaxReturn(['status'=>0, 'info'=>L('减少额度必须大于0')]);
	            }
	            
	            $lastRecharge = M('recharge')->where(['uid'=>$uid, 'status'=>2])->order('id desc')->find();
	            if($lastRecharge){
	                $newAmount = $lastRecharge['num'] - $amount;
	                if($newAmount < 0) $newAmount = 0;
	                M('recharge')->where(['id'=>$lastRecharge['id']])->save(['num'=>$newAmount]);
	                $this->ajaxReturn(['status'=>1, 'info'=>L('已减少合约交易额度').'：'.$amount]);
	            }else{
	                $this->ajaxReturn(['status'=>0, 'info'=>L('该用户没有充值记录')]);
	            }
	            break;
	            
	        default:
	            $this->ajaxReturn(['status'=>0, 'info'=>L('无效的操作类型')]);
	    }
	}
	
	// 获取用户交易量信息
	public function getTradingVolume(){
	    if(!IS_POST){
	        $this->ajaxReturn(['status'=>0, 'info'=>'非法请求']);
	    }
	    
	    $uid = I('post.uid', 0, 'intval');
	    if(!$uid){
	        $this->ajaxReturn(['status'=>0, 'info'=>L('用户ID不能为空')]);
	    }
	    
	    // 检查用户是否存在
	    $user = M('User')->where(['id'=>$uid])->find();
	    if(!$user){
	        $this->ajaxReturn(['status'=>0, 'info'=>L('用户不存在')]);
	    }
	    
	    // 获取最近一次有效的充值记录（状态为2）
	    $lastRecharge = M('recharge')->where(['uid'=>$uid, 'status'=>2])->order('id desc')->find();
	    
	    if(!$lastRecharge){
	        // 没有充值记录
	        $this->ajaxReturn([
	            'status' => 1,
	            'recharge_amount' => '0.00',
	            'trading_volume' => '0.00',
	            'remaining_volume' => '0.00'
	        ]);
	    }
	    
	    $rechargeAmount = $lastRecharge['num'];
	    $rechargeTime = $lastRecharge['addtime'];
	    
	    // 获取最近一次提现记录的时间
	    $lastWithdraw = M('myzc')->where([
	        'userid' => $uid,
	        'status' => 2  // 提现成功状态
	    ])->order('addtime desc')->find();
	    
	    $startTime = $rechargeTime; // 默认从充值时间开始
	    
	    if($lastWithdraw && $lastWithdraw['addtime'] > $rechargeTime){
	        // 如果最近一次提现在充值之后，则从提现时间开始计算
	        $startTime = $lastWithdraw['addtime'];
	    }
	    
	    // 统计从开始时间后的合约交易总额
	    $tradingVolume = M("hyorder")->where(array(
	        'uid' => $uid,
	        'addtime' => array('gt', $startTime),
	        'status' => array('in', '1,2,3') // 已成交/有效订单
	    ))->sum('num');
	    
	    if(!$tradingVolume){
	        $tradingVolume = 0;
	    }
	    
	    $remainingVolume = $rechargeAmount - $tradingVolume;
	    if($remainingVolume < 0){
	        $remainingVolume = 0;
	    }
	    
	    $this->ajaxReturn([
	        'status' => 1,
	        'recharge_amount' => number_format($rechargeAmount, 2),
	        'trading_volume' => number_format($tradingVolume, 2),
	        'remaining_volume' => number_format($remainingVolume, 2)
	    ]);
	}
	
	
}
?>