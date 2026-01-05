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
		$allow_action=array("index","edit","status","admin","adminEdit","adminStatus","updateRules","log","logEdit","logStatus","qianbao","qianbaoEdit","qianbaoStatus","coin","coinEdit","coinFreeze","coinLog","setpwd","amountlog","loginadmin","billdel","sendnotice","upsendnotice","noticelist","noticedel","authrz","upanthrz","online","onlinelist","sendonline","uponline","setagent","agent","cancelagent","role","followplan","followplanAdd","ajaxUserList","serverTime","getPendingAuth");
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

    // 后台 AJAX：分页获取用户列表（用于快速选择）
    public function ajaxUserList(){
        $page = max(1, intval(I('get.page',1)));
        $kw = trim(I('get.kw','','htmlspecialchars'));
        $where = array();
        if($kw !== ''){
            if(is_numeric($kw)){
                $where['id'] = intval($kw);
            }else{
                $where['_complex'] = array(
                    'username' => array('like', "%$kw%"),
                    'email' => array('like', "%$kw%"),
                    '_logic' => 'OR'
                );
            }
        }
        $per = 15;
        $count = M('User')->where($where)->count();
        $pages = ceil($count / $per);
        $list = M('User')->where($where)->field('id,username')->order('id desc')->limit(($page-1)*$per, $per)->select();
        $this->ajaxReturn(['code'=>1,'data'=>['list'=>$list,'page'=>$page,'pages'=>$pages,'count'=>$count]]);
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
	        $result = M("user")->where($where)->save(array('status'=>1));
			break;
		case 2:
		    //解封
	        $result = M("user")->where($where)->save(array('status'=>2));
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
		$where = array();
		if ($field && $name) {
			$where[$field] = $name;
		}
		if ($status) {
			$where['status'] = $status;
		}

		$count = M('User')->where($where)->count();
		$Page = new \Think\Page($count, 50);
		$show = $Page->show();

		$list = M('User')->where($where)->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->field("id,username")->select();

        
        
        foreach($list as $key=>$vo){
            $map['uid'] = $vo['id'];
            $map['state'] = array('eq',0);
            $list[$key]['nor'] = M("online")->where($map)->count();
        }
        
        $new_arr = array_column($list, 'nor');
        array_multisort($new_arr, SORT_DESC, $list);
        foreach($list as $k=>$v){
            if($v['nor'] == 0){
                unset($list[$k]);
            }
        }
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
    	     
    	     $data = [
               	'uid' => $uid,
                'username' => $info['username'],
                'num' => $amount,
                'coinname' => $coin,
                'afternum' => $afternum,
                'type' => 17,
                'addtime' => time(),
                'st' => 1,
                'remark' => '充币'
    	     ];
    	     
    	     $re = M('bill')->add($data);
            
            if($re){
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
    
    // 秒合约跟单计划列表
    public function followplan(){
        // mark expired plans server-side before listing (keep DB consistent)
        $now = date("Y-m-d H:i:s");
        M("hy_follow_plan")->where(array('status'=>1,'end_time'=>array('lt',$now)))->save(array('status'=>2,'updated_at'=>$now));

        $where = array();
        if(I('get.status') !== '' && I('get.status') !== null){
            $where['status'] = intval(I('get.status'));
        }
        $count = M("hy_follow_plan")->where($where)->count();
        $Page = new \Think\Page($count, 15);
        $show = $Page->show();
        $list = M("hy_follow_plan")->where($where)->order("id desc")->limit($Page->firstRow . ',' . $Page->listRows)->select();
        foreach($list as $k=>$v){
            $list[$k]['follow_real'] = M("hy_follow_log")->where(array('plan_id'=>$v['id']))->count();
        }
        $this->assign('list',$list);
        $this->assign('page',$show);
        $this->display();
    }

    // 批量展开 pending 的 follow plan targets（可由 cron 调用）
    public function expandPendingFollowPlanTargets(){
        $plans = M('hy_follow_plan')->where(array('target_type'=>1,'target_expanded'=>0))->select();
        if(empty($plans)){
            $this->ajaxReturn(['code'=>1,'msg'=>'no pending']);
        }
        foreach($plans as $p){
            $this->expandFollowPlanTarget($p['id']);
        }
        $this->ajaxReturn(['code'=>1,'msg'=>'done']);
    }

    // 展开单个计划的 target（将 agent/depth 展开为具体用户 id 列表）
    public function expandFollowPlanTarget($id = null){
        $id = intval($id ? $id : I('get.id',0));
        if($id <= 0){
            return false;
        }
        $plan = M('hy_follow_plan')->where(array('id'=>$id))->find();
        if(empty($plan) || $plan['target_type'] != 1){
            return false;
        }
        $tv = $plan['target_value'];
        $parsed = json_decode($tv, true);
        if(!$parsed || !isset($parsed['agent'])) return false;
        $agent = $parsed['agent'];
        $depth = isset($parsed['depth']) ? intval($parsed['depth']) : 3;
        $agentId = 0;
        if(is_numeric($agent)){
            $agentId = intval($agent);
        }else{
            $agentId = intval(M('user')->where(array('username'=>$agent))->getField('id'));
        }
        if(!$agentId) return false;
        $userIds = array();
        if($depth > 0 && $depth <= 3){
            for($d=1;$d<=$depth;$d++){
                $tmp = M('user')->where(array('invit_'.$d => $agentId))->getField('id',true);
                if(!empty($tmp)){
                    $userIds = array_merge($userIds, $tmp);
                }
            }
        }else{
            $userFields = M('user')->getDbFields();
            if(in_array('path',$userFields)){
                $list = M('user')->where("FIND_IN_SET(".$agentId.", path)")->field('id')->select();
                foreach($list as $it){
                    $userIds[] = intval($it['id']);
                }
            }else{
                for($d=1;$d<=3;$d++){
                    $tmp = M('user')->where(array('invit_'.$d => $agentId))->getField('id',true);
                    if(!empty($tmp)){
                        $userIds = array_merge($userIds, $tmp);
                    }
                }
            }
        }
        $userIds = array_unique($userIds);
        $targetValue = implode(',', $userIds);
        M('hy_follow_plan')->where(array('id'=>$id))->save(array('target_value'=>$targetValue,'target_expanded'=>1,'updated_at'=>date("Y-m-d H:i:s")));
        return true;
    }

    // 返回当前服务器时间（秒），供前端同步使用
    public function serverTime(){
        $this->ajaxReturn(['time'=>time()]);
    }

    // 后台：返回是否存在待审核的实名认证数量
    public function getPendingAuth(){
        $count = M('user')->where(array('rzstatus'=>1))->count();
        if($count > 0){
            $this->ajaxReturn(array('code'=>1,'data'=>array('count'=>intval($count))));
        }else{
            $this->ajaxReturn(array('code'=>1,'data'=>array('count'=>0)));
        }
    }

    // 发布/批量生成秒合约跟单计划
    public function followplanAdd(){
        // 确保使用北京时间生成开始/结束时间
        date_default_timezone_set('Asia/Shanghai');
        if(IS_POST){
            // ensure DB has target fields
            $DbFields = M("hy_follow_plan")->getDbFields();
            if (!in_array('target_type', $DbFields)) {
                M()->execute("ALTER TABLE `tw_hy_follow_plan` ADD COLUMN `target_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '目标类型 0=全部 1=代理线 2=指定用户' AFTER `follow_count`;");
            }
            if (!in_array('target_value', $DbFields)) {
                M()->execute("ALTER TABLE `tw_hy_follow_plan` ADD COLUMN `target_value` varchar(1000) NOT NULL DEFAULT '' COMMENT '目标值 JSON或逗号列表' AFTER `target_type`;");
            }
            if (!in_array('target_expanded', $DbFields)) {
                M()->execute("ALTER TABLE `tw_hy_follow_plan` ADD COLUMN `target_expanded` tinyint(1) NOT NULL DEFAULT 1 COMMENT '目标是否已展开为具体用户id列表' AFTER `target_value`;");
            }
            $coin = trim(I('post.coinname','','htmlspecialchars'));
            $periodMin = intval(I('post.period'));
            $startTime = trim(I('post.start_time'));
            $rows = intval(I('post.rows'));
            $rowTitles = I('post.row_title');
            $rowDirections = I('post.row_direction');
            $rowAmounts = I('post.row_amount');
            $rowPercents = I('post.row_percent');
            $rowKongyk = I('post.row_kongyk');
            if($coin == ''){
                $this->error("请选择交易对");
            }
            if($periodMin <= 0){
                $this->error("请选择周期");
            }
            $periodSec = $periodMin * 60;
            if($startTime == ''){
                $startTime = date("Y-m-d H:i:s");
            }
            $startInt = strtotime($startTime);
            if($startInt <= 0){
                $startInt = time();
                $startTime = date("Y-m-d H:i:s",$startInt);
            }
            if($rows <= 0){
                $rows = is_array($rowTitles) ? count($rowTitles) : 0;
            }
            if($rows <= 0){
                $this->error("请至少生成一条计划");
            }
            $batchNo = "FP".date("YmdHis").mt_rand(100,999);
            // 默认金额/百分比取第一行非空
            $defaultAmount = 0;
            $defaultPercent = 0;
            if(is_array($rowAmounts) && count($rowAmounts)>0){
                foreach($rowAmounts as $av){
                    if(trim($av) !== ''){
                        $defaultAmount = floatval($av);
                        break;
                    }
                }
            }
            if(is_array($rowPercents) && count($rowPercents)>0){
                foreach($rowPercents as $pv){
                    if(trim($pv) !== ''){
                        $defaultPercent = floatval($pv);
                        break;
                    }
                }
            }
            // collect target settings (same for all generated rows)
            $targetType = intval(I('post.target_type',0));
            $targetAgent = trim(I('post.target_agent','','htmlspecialchars'));
            $targetDepth = intval(I('post.target_depth',0));
            $targetUsers = trim(I('post.target_users','','htmlspecialchars'));

            // normalize and expand target_value:
            // - for agent line (1): expand to actual user id list (comma-separated)
            // - for specified users (2): accept ids or usernames, resolve to ids and store comma-separated ids
            $targetValue = '';
            if($targetType == 1){
                // if admin requested async expand, store JSON and mark not expanded
                $async = intval(I('post.async_expand',0));
                if($async){
                    $targetValue = json_encode(array('agent'=>$targetAgent,'depth'=>$targetDepth));
                    $targetExpandedFlag = 0;
                }else{
                    $agentId = 0;
                    if($targetAgent !== ''){
                        if(is_numeric($targetAgent)){
                            $agentId = intval($targetAgent);
                        }else{
                            $agentId = intval(M('user')->where(array('username'=>$targetAgent))->getField('id'));
                        }
                    }
                    $userIds = array();
                    if($agentId > 0){
                        // if depth <=3, use invit_1..invit_3 directly for performance
                        if($targetDepth > 0 && $targetDepth <= 3){
                            for($d=1;$d<=$targetDepth;$d++){
                                $tmp = M('user')->where(array('invit_'.$d => $agentId))->getField('id',true);
                                if(!empty($tmp)){
                                    $userIds = array_merge($userIds, $tmp);
                                }
                            }
                        }else{
                            // try to use path if available, fallback to invit_1..invit_3
                            $userFields = M('user')->getDbFields();
                            if(in_array('path',$userFields)){
                                $list = M('user')->where("FIND_IN_SET(".$agentId.", path)")->field('id')->select();
                                foreach($list as $it){
                                    $userIds[] = intval($it['id']);
                                }
                            }else{
                                for($d=1;$d<=3;$d++){
                                    $tmp = M('user')->where(array('invit_'.$d => $agentId))->getField('id',true);
                                    if(!empty($tmp)){
                                        $userIds = array_merge($userIds, $tmp);
                                    }
                                }
                            }
                        }
                    }
                    $userIds = array_unique($userIds);
                    $targetValue = implode(',', $userIds);
                    $targetExpandedFlag = 1;
                }
            }elseif($targetType == 2){
                $parts = array_filter(array_map('trim', explode(',', $targetUsers)));
                $ids = array();
                foreach($parts as $p){
                    if($p === '') continue;
                    if(is_numeric($p)){
                        $ids[] = intval($p);
                    }else{
                        $id = M('user')->where(array('username'=>$p))->getField('id');
                        if($id) $ids[] = intval($id);
                    }
                }
                $ids = array_unique($ids);
                $targetValue = implode(',', $ids);
                $targetExpandedFlag = 1;
            }else{
                $targetExpandedFlag = 1;
            }

            for($i=0;$i<$rows;$i++){
                $title = isset($rowTitles[$i]) && trim($rowTitles[$i]) != '' ? trim($rowTitles[$i]) : (isset($rowTitles[0]) ? trim($rowTitles[0]) : $coin."计划");
                $direction = isset($rowDirections[$i]) && intval($rowDirections[$i]) > 0 ? intval($rowDirections[$i]) : (isset($rowDirections[0]) ? intval($rowDirections[0]) : 1);
                if(!in_array($direction,array(1,2))){
                    $direction = 1;
                }
                $kongyk = isset($rowKongyk[$i]) ? intval($rowKongyk[$i]) : 0;
                if(!in_array($kongyk,array(0,1,2))){
                    $kongyk = 0;
                }
                $amount = isset($rowAmounts[$i]) && trim($rowAmounts[$i]) !== '' ? floatval($rowAmounts[$i]) : $defaultAmount;
                $percent = isset($rowPercents[$i]) && trim($rowPercents[$i]) !== '' ? floatval($rowPercents[$i]) : $defaultPercent;
                if($amount <= 0){
                    $amount = 0;
                }
                if($percent < 0){
                    $percent = 0;
                }
                if($percent > 100){
                    $percent = 100;
                }
                $start_at = date("Y-m-d H:i:s", $startInt + $i * $periodSec);
                $end_at = date("Y-m-d H:i:s", strtotime($start_at) + $periodSec);
                $data = array(
                    'batch_no' => $batchNo,
                    'title' => $title,
                    'coinname' => $coin,
                    'amount' => $amount,
                    'percent' => $percent,
                    'period' => $periodSec,
                    'start_time' => $start_at,
                    'end_time' => $end_at,
                    'direction' => $direction,
                    'kongyk' => $kongyk,
                    'target_type' => $targetType,
                    'target_value' => $targetValue,
                    'target_expanded' => isset($targetExpandedFlag) ? intval($targetExpandedFlag) : 1,
                    'status' => 1,
                    'follow_count' => 0,
                    'created_at' => date("Y-m-d H:i:s"),
                    'updated_at' => date("Y-m-d H:i:s"),
                );
                M("hy_follow_plan")->add($data);
            }
            $this->success("生成成功",U('User/followplan'));
        }else{
            $hyset = M("hysetting")->where(array('id'=>1))->field("hy_time")->find();
            $time_arr = explode(',',$hyset['hy_time']);
            $this->assign("time_arr",$time_arr);
            $coinlist = M("ctmarket")->where(array('status'=>1))->field("coinname")->select();
            foreach($coinlist as $k=>$v){
                $coinlist[$k]['show'] = strtoupper($v['coinname'])."/USDT";
            }
            $this->assign("coinlist",$coinlist);
            $this->assign("now",date("Y-m-d H:i:s"));
            $this->display();
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
	
	
}
?>