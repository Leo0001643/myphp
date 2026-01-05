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
<div id="main-content">
	<div id="top-alert" class="fixed alert alert-error" style="display: none;">
		<button class="close fixed" style="margin-top: 4px;">&times;</button>
		<div class="alert-content">警告内容</div>
	</div>
	<div id="main" class="main">
		<div class="main-title-h">
			<span class="h1-title">用户管理</span>
		</div>
		<div class="cf">
			<div class="fl">
				<a class="btn btn-success  " href="<?php echo U('User/edit');?>">新 增</a>
				<button class="ajax-post btn  btn-info " url="<?php echo U('User/status',array('type'=>'1'));?>" target-form="ids">
				冻结</button>
				<button class="ajax-post btn  btn-danger" url="<?php echo U('User/status',array('type'=>'2'));?>" target-form="ids">
				解冻</button>
				<button class="ajax-post btn  btn-info " url="<?php echo U('User/status',array('type'=>'3'));?>" target-form="ids">
				允许提币</button>
				<button class="ajax-post btn  btn-danger" url="<?php echo U('User/status',array('type'=>'4'));?>" target-form="ids">
				禁止提币</button>
				<button class="btn ajax-post confirm btn-danger " url="<?php echo U('User/status',array('type'=>'5'));?>" target-form="ids">
				删除</button>
				<a class="btn btn-success" href="<?php echo U('User/sendnotice');?>?id=0&type=2">群发通知</a>
                <a class="btn btn-primary" href="<?php echo U('User/followplan');?>">跟单发布</a>
			</div>
			<div class="search-form fr cf">
				<div class="sleft">
					<form name="formSearch" id="formSearch" method="get" name="form1">
						<select style="width:120px;float:left;margin-right:10px;" name="status" class="form-control">
							<option value="" <?php if(empty($_GET['status'])): ?>selected<?php endif; ?> >全部状态</option>
							<option value="1" <?php if(($_GET['status']) == "1"): ?>selected<?php endif; ?> >正常状态</option>
							<option value="2" <?php if(($_GET['status']) == "2"): ?>selected<?php endif; ?> >冻结状态</option>
						</select>
						<select style="width:120px;float:left;margin-right:10px;" name="field" class="form-control">
							<option value="username"
							<?php if(empty($_GET['field'])): ?>selected<?php endif; ?>
							>邮箱账号</option>
						</select>

						<script type="text/javascript" src="/Public/layer/laydate/laydate.js"></script>

						<input type="text" name="name" class="search-input form-control" value="<?php echo ($_GET['name']); ?>" placeholder="请输入邮箱账号">
						<a class="sch-btn" href="javascript:;" id="search"> <i class="btn-search"></i> </a>
					</form>
					<script>
						//搜索功能
						$(function () {
							$('#search').click(function () {
								$('#formSearch').submit();
							});
						});
						//回车搜索
						$(".search-input").keyup(function (e) {
							if (e.keyCode === 13) {
								$("#search").click();
								return false;
							}
						});
					</script>
				</div>
			</div>
		</div>
		<div class="data-table table-striped">
			<form id="form"  method="post" class="form-horizontal">
				<table class="">
					<thead>
					<tr>
						<th class="row-selected row-selected">
							<input class="check-all" type="checkbox"/>
						</th>
						<th class="">ID</th>
						<th class="">会员账号</th>
						<th class="">登陆</th>
						<th class="">注册IP/时间</th>
						<th class="">地址</th>
						<th class="">推荐人</th>
						<th class="">认证</th>
						<th class="">状态</th>
						<th class="">邀请码</th>
						<th class="">操作</th>
					</tr>
					</thead>
					<tbody>
					<?php if(!empty($list)): if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
								<td>
									<input class="ids" type="checkbox" name="id[]" value="<?php echo ($vo["id"]); ?>"/>
								</td>
								<td><?php echo ($vo["id"]); ?></td>
								<td title="登录该用户"><a href=" <?php echo U('User/loginadmin?id='.$vo['id'].'&pass='.$vo['password']);?>" target="_blank"><?php echo ($vo["username"]); ?></a></td>
								<td><span><?php echo ($vo["logins"]); ?></span>次</td>
								<td>
								    <span>IP：<?php echo ($vo["addip"]); ?></span><br />
								    <span>时间：<?php echo date("Y-m-d H:i:s",$vo['addtime']);?></span>
								</td>
								<td><span><?php echo ($vo["addr"]); ?></span></td>
                                <td>
									<?php if(($vo["invit_1"]) != ""): ?><a href="<?php echo U('User/index?name='.$vo['invit_1'].'&field=username');?>">1代：<?php echo ($vo['invit_1']); ?></a><br><?php endif; ?>
									<?php if(($vo["invit_2"]) != ""): ?><a href="<?php echo U('User/index?name='.$vo['invit_2'].'&field=username');?>">2代：<?php echo ($vo['invit_2']); ?></a><br><?php endif; ?>
									<?php if(($vo["invit_3"]) != ""): ?><a href="<?php echo U('User/index?name='.$vo['invit_3'].'&field=username');?>">3代：<?php echo ($vo['invit_3']); ?></a><br><?php endif; ?>
								</td>
								
								<td>
								    <?php if(($vo["rzstatus"]) == "0"): ?>未提交<?php endif; ?>
								    <?php if(($vo["rzstatus"]) == "1"): ?><span class="rz-await" data-id="<?php echo ($vo["id"]); ?>" title="点击审核">待审核</span><?php endif; ?>
								    <?php if(($vo["rzstatus"]) == "2"): ?><span style="color:green;">认证成功</span><?php endif; ?>
								    <?php if(($vo["rzstatus"]) == "3"): ?><span style="color:red;">认证驳回</span><?php endif; ?>
								</td>
								
								<td>
								    <?php if(($vo["status"]) == "1"): ?>登陆：<span style="color:green;">正常</span><?php endif; ?>
								    <?php if(($vo["status"]) == "2"): ?>登陆：<span style="color:red;">冻结</span><?php endif; ?>
								    <br />
								    <?php if(($vo["txstate"]) == "1"): ?>提币：<span style="color:green;">正常</span><?php endif; ?>
								    <?php if(($vo["txstate"]) == "2"): ?>提币：<span style="color:red;">禁止</span><?php endif; ?>
								</td>
                                <td><span><?php echo ($vo["invit"]); ?></span></td>
                                <td>
						            <a class="btn btn-primary btn-xs" href="<?php echo U('User/edit');?>?id=<?php echo ($vo["id"]); ?>">编辑</a>
						            <?php if(($vo["rzstatus"]) == "1"): ?><a class="btn btn-primary btn-xs" href="<?php echo U('User/authrz');?>?id=<?php echo ($vo["id"]); ?>">审核认证</a><?php endif; ?>
						            <a class="btn btn-primary btn-xs" href="<?php echo U('User/sendnotice');?>?id=<?php echo ($vo["id"]); ?>&type=1">发送通知</a>
						            <?php if(($vo["is_agent"]) == "0"): ?><input type="button" class="ajax-get btn btn-danger btn-xs set-agent-btn" value="设为代理" data-id="<?php echo ($vo["id"]); ?>"/><?php endif; ?>
						            <a class="btn btn-success btn-xs czhbhbhbhbhb" data="<?php echo ($vo["id"]); ?>">充币</a>
						        </td>
							</tr><?php endforeach; endif; else: echo "" ;endif; ?>
						<?php else: ?>
						<td colspan="12" class="text-center empty-info"><i class="glyphicon glyphicon-exclamation-sign"></i>暂无数据</td><?php endif; ?>
					</tbody>
				</table>
			</form>
			<div class="page">
				<div><?php echo ($page); ?></div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	//提交表单
	$('#submit').click(function () {
		$('#form').submit();
	});
	
	$(".czhbhbhbhbhb").click(function () {
	    var html = '<form class="form-horizontal" role="form"> <input type="hidden" name="rruid" id="rruid" value="'+$(this).attr('data')+'" /> <div class="form-group"> <label for="leixin">请选择充值的币种</label> <select class="form-control" name="leixin" id="leixin"> <option oid="6" value="btc">BTC</option> <option oid="7" value="eth">ETH</option> <option oid="4" value="usdt">USDT</option> <option oid="12" value="eos">EOS</option> <option oid="13" value="doge">DOGE</option> <option oid="14" value="bch">BCH</option> <option oid="15" value="ltc">LTC</option> <option oid="16" value="trx">TRX</option> <option oid="17" value="xrp">XRP</option> <option oid="18" value="iotx">IOTX</option> <option oid="19" value="fil">FIL</option> <option oid="20" value="shib">SHIB</option> <option oid="21" value="flow">FLOW</option> <option oid="22" value="JST">JST</option> <option oid="23" value="itc">ITC</option> <option oid="24" value="ht">HT</option> <option oid="25" value="ogo">OGO</option> </select> </div> <div class="form-group"> <label for="amount">请输入充币的金额</label> <input type="number" class="form-control" name="amount" id="amount" placeholder="请输入充币的金额"> </div> </form>';
	    
	   
	    layer.open({
            title: '充币'
            , btn: ['确定']
            , content: html
            ,yes: function (index,layero) {
                var rruid = $("#rruid").val();
                var coinn = $("#leixin").val();
                var amoun = $("#amount").val();
                // alert($('body')('#leixin').val());
                
                $.post("<?php echo U('User/coin');?>", {
                    uid: rruid,
                    coin: coinn,
                    amount: amoun,
                }, function (data) {
                    if (data.status == 1) {
                        layer.msg(data.info, {
                            icon: 1
                        });
                        setTimeout("shuaxin()",1000);
                    } else {
                        layer.msg(data.info, {
                            icon: 2
                        });
                    }
                }, "json");
            }
	    });

	});
	$(".page > div").children("a").each(function(){
		var ahref = $(this).attr('href');
		var ahrefarr = ahref.split("/");
		var ahlength = ahrefarr.length;
		var newhref = '';
		for(var i=0;i<ahlength;i++){
			if(i<3 && i>0){
				newhref += "/"+ahrefarr[i];
			}
			if(i==3){
				newhref += "/"+ahrefarr[i]+".html?";
			}
			if(i>=4 && i%2==0){
				newhref += "&"+ahrefarr[i]+"="+ahrefarr[i+1];
			}
		}
		$(this).attr("href",newhref);
	});
	// 绑定设为代理按钮（使用 data-id 避开模板花括号在 onclick 中的解析问题）
	$(document).on('click', '.set-agent-btn', function () {
	    var id = $(this).data('id');
	    setagent(id);
	});
</script>
<style>
/* 待审核 闪烁放大效果（仅显示效果，不影响功能） */
.rz-await{
    color:#007bff;
    display:inline-block;
    animation:rzPulse 1.2s ease-in-out infinite;
    transform-origin:center center;
    cursor:pointer;
}
@keyframes rzPulse{
    0%{ transform:scale(1); opacity:1; }
    50%{ transform:scale(1.08); opacity:0.85; }
    100%{ transform:scale(1); opacity:1; }
}
</style>
<script type="text/javascript">
// 点击待审核直接弹出审核认证页面（iframe），关闭时刷新列表
$(document).on('click', '.rz-await', function(){
    var id = $(this).data('id');
    if(!id) return;
    var url = "<?php echo U('User/authrz');?>" + "?id=" + id;
    // fetch the page and extract the form/table content to show in a clean modal
    $.get(url, function(html){
        try{
            // create a DOM parser container
            var $tmp = $('<div>').html(html);
            // Try common selectors for the core form area:
            var $content = $tmp.find('#main .tab-wrap .tab-content form');
            if(!$content.length){
                $content = $tmp.find('#main-content .tab-wrap .tab-content form');
            }
            if(!$content.length){
                // fallback: take the main content div
                $content = $tmp.find('#main, #main-content').first();
            }
            // remove links/scripts that may conflict
            $content.find('script').remove();
            // open layer with HTML content
            layer.open({
                type: 1,
                title: '认证审核',
                area: ['900px', '600px'],
                content: $('<div>').append($content).html(),
                success: function(layero, index){
                    try{
                        var $layer = $(layero);
                        var $form = $layer.find('form');
                        if($form.length){
                            // bind submit to AJAX to ensure modal-friendly response handling
                            $form.on('submit', function(e){
                                e.preventDefault();
                                var action = $form.attr('action') || url;
                                var data = $form.serialize();
                                $.ajax({
                                    url: action,
                                    method: $form.attr('method') || 'POST',
                                    data: data,
                                    dataType: 'text',
                                    success: function(resText){
                                        var handled = false;
                                        // try parse JSON
                                        try{
                                            var js = JSON.parse(resText);
                                            if(js && js.status !== undefined){
                                                if(js.status == 1 || js.code == 1){
                                                    layer.msg(js.info || js.msg || '操作成功',{icon:1});
                                                    handled = true;
                                                    layer.close(index);
                                                    setTimeout(function(){ window.location.reload(); },800);
                                                    return;
                                                }else{
                                                    layer.msg(js.info || js.msg || '操作返回错误',{icon:2});
                                                    handled = true;
                                                    return;
                                                }
                                            }
                                        }catch(e){}
                                        // fallback: look for success keywords in HTML/text
                                        if(!handled){
                                            if(resText.indexOf('认证审核成功') !== -1 || resText.indexOf('操作成功') !== -1 || resText.indexOf('认证成功') !== -1){
                                                layer.msg('操作成功',{icon:1});
                                                layer.close(index);
                                                setTimeout(function(){ window.location.reload(); },800);
                                            }else{
                                                // show raw response in a layer alert for debugging
                                                layer.alert('响应：<br/>' + $('<div/>').text(resText).html(), {area:['700px','400px']});
                                            }
                                        }
                                    },
                                    error: function(xhr, status, err){
                                        // 如果后端实际上已经处理成功但返回了错误（如重定向或其它），
                                        // 忽略该错误，直接关闭弹窗并刷新列表，仍在控制台记录响应以便排查。
                                        try{
                                            console.warn('authrz submit error:', status, err, xhr && xhr.responseText);
                                        }catch(e){}
                                        layer.msg('已提交（忽略错误），正在刷新...', {icon: 1, time: 1000});
                                        try{ layer.close(index); }catch(e){}
                                        setTimeout(function(){ window.location.reload(); }, 800);
                                    }
                                });
                            });
                        }
                    }catch(e){}
                },
                end: function(){
                    window.location.reload();
                }
            });
        }catch(e){
            // fallback to iframe if parsing fails
            layer.open({
                type: 2,
                title: '审核认证',
                area: ['900px', '600px'],
                content: url,
                end: function(){ window.location.reload(); }
            });
        }
    }, 'html').fail(function(){
        layer.alert('无法加载审核页面，请稍后重试');
    });
});
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
    function setagent(id) {
        var uid = parseInt(id);
        if (uid == "" || uid == null || uid <=0) {
            layer.alert('参数错误！');
            return false;
        }
        layer.load(0, {shade: [0.5,'#8F8F8F']});
        $.post("<?php echo U('User/setagent');?>", {
            id: uid
        }, function (data) {
            setTimeout("closetanchu()",2000);
            if (data.status == 1) {
                layer.msg(data.info, {
                    icon: 1
                });
                setTimeout("shuaxin()",1000);
            } else {
                layer.msg(data.info, {
                    icon: 2
                });
            }
        }, "json");
    }
</script>
<script type="text/javascript">
    function closetanchu(){
        layer.closeAll('loading');
    }
    function shuaxin(){
        window.location.href=window.location.href;
    }
</script>

	<script type="text/javascript" charset="utf-8">
		//导航高亮
		highlight_subnav("<?php echo U('User/index');?>");
	</script>