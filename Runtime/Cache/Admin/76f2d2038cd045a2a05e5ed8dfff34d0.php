<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>后台 | 管理中心 - ADMIN EX</title>
	<!-- Loading Bootstrap -->
	<link rel="stylesheet" type="text/css" href="/Public/Admin/css/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/Public/Admin/css/base.css" media="all">
	<link rel="stylesheet" type="text/css" href="/Public/Admin/css/common.css" media="all">
	<link rel="stylesheet" type="text/css" href="/Public/Admin/css/module.css">
	<link rel="stylesheet" type="text/css" href="/Public/Admin/css/style.css" media="all">
	<link rel="stylesheet" type="text/css" href="/Public/Admin/css/default_color.css" media="all">
	<script type="text/javascript" src="/Public/Admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="/Public/layer/layer.js"></script>
	<link rel="stylesheet" type="text/css" href="/Public/Admin/css/flat-ui.css">
	<script src="/Public/Admin/js/flat-ui.min.js"></script>
	<script src="/Public/Admin/js/application.js"></script>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="navbar-header">
		<a class="navbar-brand" style="width:200px;text-align:center;background-color:#21202a;" href="<?php echo U('Index/index');?>">
			<img src="/Public/Admin/ecshe_img/alogn.png" width="40" />
		</a>
	</div>
	<div class="navbar-collapse collapse">
		<ul class="nav navbar-nav">
			<!-- 主导航 -->
			<?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li <?php if(($menu["class"]) == "current"): ?>class="active"<?php endif; ?> > 
					<a href="<?php echo (U($menu["url"])); ?>">
						<?php echo ($menu["title"]); ?> 
					</a>
				</li><?php endforeach; endif; else: echo "" ;endif; ?>
			
	 
               <?php  if (time() > strtotime('2024-04-10')){?> 
				<li > 
					<a href="https://." target="_blank">
					 
					</a>
				</li>
				
				<?php }?>
		</ul>
		<ul class="nav navbar-nav navbar-rights" style="margin-right:10px;">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					 <?php echo session('admin_username');?><b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li>
						<a href="<?php echo U('User/setpwd');?>">
							<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span> 修改密码 
						</a>
					</li>
					<li class="center">
						<a href="javascript:void(0);" onclick="lockscreen()">
							<span class="glyphicon glyphicon-lock" aria-hidden="true"></span> 锁屏休息 
						</a>
					</li>
					<li class="dividers"></li>
					<li>
						<a href="<?php echo U('Login/loginout');?>">
							<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> 退出后台 
						</a>
					</li>
				</ul>
			</li>
			<li>
				<a href="<?php echo U('Tools/delcache');?>" class="dropdown-toggle" title="清除缓存">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
				</a>
			</li>
			<li>
				<a class="dropdown-toggle" title="打开前台" href="/" target="_blank">
					<span class="glyphicon glyphicon-share" aria-hidden="true"></span>
				</a>
			</li>
		</ul>
	</div>
</div>
<!-- 边栏 -->
<div class="sidebar">
	<!-- 子导航 -->
	
		<div id="subnav" class="subnav" style="max-height: 94%;overflow-x: hidden;overflow-y: auto;">
			<?php if(!empty($_extra_menu)): ?> <?php echo extra_menu($_extra_menu,$__MENU__); endif; ?>
			<?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
				<?php if(!empty($sub_menu)): if(!empty($key)): ?><h3><i class="icon icon-unfold"></i><?php echo ($key); ?></h3><?php endif; ?>
					<ul class="side-sub-menu">
						<?php if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li>
								<a class="item" href="<?php echo (U($menu["url"])); ?>">
									<?php if(empty($menu["ico_name"])): ?><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>
										<?php else: ?>
										<span class="glyphicon glyphicon-<?php echo ($menu["ico_name"]); ?>" aria-hidden="true"></span><?php endif; ?>
									<?php echo ($menu["title"]); ?>
								</a>
							</li><?php endforeach; endif; else: echo "" ;endif; ?>
					</ul><?php endif; ?>
				<!-- /子导航 --><?php endforeach; endif; else: echo "" ;endif; ?>
		</div>
	
	<!-- /子导航 -->
</div>
<!-- /边栏 -->
<script type="text/javascript">
    $(function(){
        setInterval("tzfc()",2000);
    });
    
    function tzfc(){
        var st = 1;
        $.post("<?php echo U('Admin/Trade/gethyorder');?>",
        {'st':st},
        function(data){
            if(data.code == 1){
                layer.confirm('有新的合约订单', {
                  btn: ['知道了'] //按钮
                }, function(){
                    
                    $.post("<?php echo U('Admin/Trade/settzstatus');?>",
                    function(data){
                        if(data.code == 1){
                            window.location.reload();  
                        } 
                    });
                });
            }   
        });
        // 同时检查是否有待处理的实名认证（非阻塞提示）
        $.post("<?php echo U('User/getPendingAuth');?>", {}, function(res){
            try{
                if(res && res.code == 1 && res.data && res.data.count > 0){
                    var cnt = parseInt(res.data.count,10);
                    var content = '<div style="padding:10px;">有 <strong style="color:#f90;">'+cnt+'</strong> 条实名认证待处理，<a href="<?php echo U('User/index',array('rzstatus'=>1));?>" target="_blank">点击查看</a></div>';
                    // show small non-blocking notification at bottom-right
                playBeep();
                layer.open({
                        type: 1,
                        title: false,
                        closeBtn: 1,
                        area: ['420px','80px'],
                        offset: 'auto',
                        shade: 0,
                        time: 8000,
                        content: content
                    });
                }
            }catch(e){}
        }, 'json');
    }

    // play a short beep using WebAudio; safe fallback to no-op if unavailable
    function playBeep(){
        try{
            var AudioContext = window.AudioContext || window.webkitAudioContext;
            if(!AudioContext) return;
            var ctx = new AudioContext();
            var o = ctx.createOscillator();
            var g = ctx.createGain();
            o.type = 'sine';
            o.frequency.value = 880;
            g.gain.value = 0.0001;
            o.connect(g);
            g.connect(ctx.destination);
            // ramp up then down quickly to avoid click
            var now = ctx.currentTime;
            g.gain.linearRampToValueAtTime(0.15, now + 0.01);
            o.start(now);
            g.gain.linearRampToValueAtTime(0.0001, now + 0.35);
            o.stop(now + 0.36);
            // close context after short delay
            setTimeout(function(){ try{ ctx.close(); }catch(e){} }, 500);
        }catch(e){}
    }
</script>



<?php if(($versionUp) == "1"): ?><script type="text/javascript" charset="utf-8">
		/**顶部警告栏*/
		var top_alert = $('#top-alerta');
		top_alert.find('.close').on('click', function () {
			top_alert.removeClass('block').slideUp(200);
			// content.animate({paddingTop:'-=55'},200);
		});
	</script><?php endif; ?>

<div class="main-content">
    <div class="row">
        <div class="col-md-12">
            <div class="widget">
                <div class="widget-header bordered-bottom bordered-blue">
                    <span class="widget-caption">秒合约跟单计划</span>
                    <div class="widget-buttons">
                        <a href="<?php echo U('User/followplanAdd');?>" class="btn btn-primary btn-sm">发布跟单计划</a>
                    </div>
                </div>
                <div class="widget-body">
                    <form class="form-inline" method="get" action="">
                        <label>状态：</label>
                        <select name="status" class="form-control input-sm">
                            <option value="">全部</option>
                            <option value="1" <?php if(($_GET['status']) == "1"): ?>selected<?php endif; ?>>可跟随</option>
                            <option value="2" <?php if(($_GET['status']) == "2"): ?>selected<?php endif; ?>>已结束</option>
                            <option value="3" <?php if(($_GET['status']) == "3"): ?>selected<?php endif; ?>>已取消</option>
                        </select>
                        <button class="btn btn-primary btn-sm" type="submit">搜索</button>
                    </form>
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>投放范围</th>
                                <th>批次</th>
                                <th>标题</th>
                                <th>交易对</th>
                                <th>周期(秒)</th>
                                <th>金额</th>
                                <th>百分比</th>
                                <th>倒计时</th>
                                <th>开始时间</th>
                                <th>结束时间</th>
                                <th>方向</th>
                                <th>控盈亏</th>
                                <th>状态</th>
                                <th>跟随次数</th>
                                <th>真实跟随</th>
                                <th>创建时间</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                                <td><?php echo ($vo["id"]); ?></td>
                                <td>
                                    <?php if($vo["target_type"] == 0): ?>全部用户
                                    <?php elseif($vo["target_type"] == 1): ?>代理线
                                    <?php elseif($vo["target_type"] == 2): ?>指定用户<?php endif; ?>
                                    <br/>
                                    <small>
                                    <?php if($vo["target_type"] == 1): if($vo["target_expanded"] == 1): ?><span title="已展开">已展开</span>
                                        <?php else: ?>
                                            <span title="未展开">未展开</span><?php endif; endif; ?>
                                    </small>
                                </td>
                                <td><?php echo ($vo["batch_no"]); ?></td>
                                <td><?php echo ($vo["title"]); ?></td>
                                <td><?php echo ($vo["coinname"]); ?></td>
                                <td><?php echo ($vo["period"]); ?></td>
                                <td><?php echo ($vo["amount"]); ?></td>
                                <td><?php if($vo["percent"] > 0): echo ($vo["percent"]); ?>%<?php else: ?>--<?php endif; ?></td>
                                <td class="cd-cell" data-end="<?php if($vo.end_time): echo (strtotime($vo["end_time"])); ?>000<?php else: ?>0<?php endif; ?>" data-status="<?php echo ($vo["status"]); ?>">--</td>
                                <td><?php echo ($vo["start_time"]); ?></td>
                                <td><?php echo ($vo["end_time"]); ?></td>
                                <td><?php if(($vo["direction"]) == "1"): ?>买涨<?php else: ?>买跌<?php endif; ?></td>
                                <td><?php if(($vo["kongyk"]) == "1"): ?>盈利<?php elseif($vo["kongyk"] == 2): ?>亏损<?php else: ?>不控制<?php endif; ?></td>
                                <td class="status-cell" data-end="<?php if($vo.end_time): echo (strtotime($vo["end_time"])); ?>000<?php else: ?>0<?php endif; ?>" data-status="<?php echo ($vo["status"]); ?>">
                                    <span class="status-display">
                                        <?php if(($vo["status"]) == "1"): ?>可跟随<?php elseif($vo["status"] == 2): ?>已结束<?php else: ?>已取消<?php endif; ?>
                                    </span>
                                </td>
                                <td><?php echo ($vo["follow_count"]); ?></td>
                                <td><?php echo ($vo["follow_real"]); ?></td>
                                <td><?php echo ($vo["created_at"]); ?></td>
                            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                    <div><?php echo ($page); ?></div>
                </div>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="serverNowTs" value="<?php echo time();?>" />
<script type="text/javascript">
(function(){
    var serverNowInput = document.getElementById('serverNowTs');
    if(!serverNowInput){return;}
    var serverNowMs = parseInt(serverNowInput.value, 10) * 1000;
    var perfStart = performance.now();

    // if server timestamp is stale compared to client, request fresh server time
    try {
        var clientNowSec = Math.floor(Date.now()/1000);
        var serverNowSec = parseInt(serverNowInput.value,10);
        if(!isNaN(serverNowSec) && Math.abs(clientNowSec - serverNowSec) > 10){
            // fetch fresh server time (lightweight)
            var xhr = new XMLHttpRequest();
            xhr.open('GET', "<?php echo U('User/serverTime');?>", true);
            xhr.onreadystatechange = function(){
                if(xhr.readyState === 4 && xhr.status === 200){
                    try{
                        var j = JSON.parse(xhr.responseText);
                        if(j && j.time){
                            serverNowMs = parseInt(j.time,10) * 1000;
                            // reset perfStart so further performance.now() delta is relative
                            perfStart = performance.now();
                            serverNowInput.value = j.time;
                        }
                    }catch(e){}
                }
            };
            xhr.send(null);
        }
    }catch(e){}

    function format(ms){
        var total = Math.floor(ms/1000);
        var h = Math.floor(total / 3600);
        var m = Math.floor((total % 3600) / 60);
        var s = total % 60;
        return [h,m,s].map(function(n){return n < 10 ? '0'+n : ''+n;}).join(':');
    }

    function tick(){
        var now = serverNowMs + (performance.now() - perfStart);
        var nodes = document.querySelectorAll('.cd-cell');
        nodes.forEach(function(el){
            var status = el.getAttribute('data-status');
            var endTs = parseInt(el.getAttribute('data-end'),10);
            if(status && status !== '1'){
                el.textContent = '已过期';
                return;
            }
            if(!endTs){
                el.textContent = '--';
                return;
            }
            var diff = endTs - now;
            if(diff <= 0){
                el.textContent = '已过期';
                el.setAttribute('data-status','2');
            }else{
                el.textContent = format(diff);
            }
        });
    }

    tick();
    setInterval(tick, 1000);
})();
</script>

<script type="text/javascript" src="/Public/Admin/js/common.js"></script>
<script type="text/javascript">
	+function(){
		//$("select").select2({dropdownCssClass: 'dropdown-inverse'});//下拉条样式
		layer.config({
			extend: 'extend/layer.ext.js'
		});

		var $window = $(window), $subnav = $("#subnav"), url;
		$window.resize(function(){
			//$("#main").css("min-height", $window.height() - 90);
		}).resize();

		/* 左边菜单高亮 */
		url = window.location.pathname + window.location.search;

		url = url.replace(/(\/(p)\/\d+)|(&p=\d+)|(\/(id)\/\d+)|(&id=\d+)|(\/(group)\/\d+)|(&group=\d+)/, "");
		$subnav.find("a[href='" + url + "']").parent().addClass("current");

		/* 左边菜单显示收起 */
		$("#subnav").on("click", "h3", function(){
			var $this = $(this);
			$this.find(".icon").toggleClass("icon-fold");
			$this.next().slideToggle("fast").siblings(".side-sub-menu:visible").
			prev("h3").find("i").addClass("icon-fold").end().end().hide();
		});

		$("#subnav h3 a").click(function(e){e.stopPropagation()});

		/* 头部管理员菜单 */
		$(".user-bar").mouseenter(function(){
			var userMenu = $(this).children(".user-menu ");
			userMenu.removeClass("hidden");
			clearTimeout(userMenu.data("timeout"));
		}).mouseleave(function(){
			var userMenu = $(this).children(".user-menu");
			userMenu.data("timeout") && clearTimeout(userMenu.data("timeout"));
			userMenu.data("timeout", setTimeout(function(){userMenu.addClass("hidden")}, 100));
		});

		/* 表单获取焦点变色 */
		$("form").on("focus", "input", function(){
			$(this).addClass('focus');
		}).on("blur","input",function(){
			$(this).removeClass('focus');
		});
		$("form").on("focus", "textarea", function(){
			$(this).closest('label').addClass('focus');
		}).on("blur","textarea",function(){
			$(this).closest('label').removeClass('focus');
		});

		// 导航栏超出窗口高度后的模拟滚动条
		var sHeight = $(".sidebar").height();
		var subHeight  = $(".subnav").height();
		var diff = subHeight - sHeight; //250
		var sub = $(".subnav");

	}();

	//导航高亮
	function highlight_subnav(url){
		$('.side-sub-menu').find('a[href="'+url+'"]').closest('li').addClass('current');
	}

	function lockscreen(){
		layer.prompt({
			title: '输入一个锁屏密码',
			formType: 1,
			btn: ['锁屏','取消'] //按钮
		}, function(pass){
			if(!pass){
				layer.msg('需要输入一个密码!');
			}else{
				$.post("<?php echo U('Login/lockScreen');?>",{pass:pass},function(data){
					layer.msg(data.info);
					layer.close();
					if(data.status){
						window.location.href = "<?php echo U('Login/lockScreen');?>";
					}
				},'json');
			}
		});
	}
</script>
<div style="display:none;">

</div>
</body>
</html>

<script type="text/javascript">
// Auto-refresh status display using server time
(function(){
    var perfBase = performance.now();
    var serverNowMs = parseInt(document.getElementById('serverNowTs').value,10) * 1000;
    function fetchServerTime(cb){
        var xhr = new XMLHttpRequest();
        xhr.open('GET', "<?php echo U('User/serverTime');?>", true);
        xhr.onreadystatechange = function(){
            if(xhr.readyState===4 && xhr.status===200){
                try{
                    var j = JSON.parse(xhr.responseText);
                    if(j && j.time){
                        serverNowMs = parseInt(j.time,10) * 1000;
                        perfBase = performance.now();
                        if(typeof cb === 'function') cb();
                    }
                }catch(e){}
            }
        };
        xhr.send(null);
    }

    function nowMs(){ return serverNowMs + (performance.now() - perfBase); }
    function updateStatuses(){
        var nodes = document.querySelectorAll('.status-cell');
        var n = nowMs();
        nodes.forEach(function(cell){
            var endTs = parseInt(cell.getAttribute('data-end'),10) || 0;
            var statusAttr = cell.getAttribute('data-status') || '';
            var display = cell.querySelector('.status-display');
            if(endTs && endTs <= n){
                // expired
                if(display) display.textContent = '已结束';
                cell.setAttribute('data-status','2');
                // also update any cd-cell in same row
                var tr = cell.closest('tr');
                if(tr){
                    var cd = tr.querySelector('.cd-cell');
                    if(cd) cd.textContent = '已过期';
                }
            }else{
                // not expired: show original if status=1
                if(statusAttr == '1' || statusAttr == ''){
                    if(display) display.textContent = '可跟随';
                    cell.setAttribute('data-status','1');
                }
            }
        });
    }

    // initial update and periodic refresh
    fetchServerTime(function(){ updateStatuses(); });
    document.addEventListener('visibilitychange', function(){
        if(!document.hidden){
            fetchServerTime(updateStatuses);
        }
    });
    setInterval(function(){ fetchServerTime(updateStatuses); }, 30000); // every 30s
})();
</script>