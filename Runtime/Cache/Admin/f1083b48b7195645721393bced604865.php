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
                    <span class="widget-caption">发布秒合约跟单计划</span>
                </div>
                <div class="widget-body">
                    <form class="form-horizontal" method="post" action="<?php echo U('User/followplanAdd');?>">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">交易对</label>
                            <div class="col-sm-4">
                                <select name="coinname" class="form-control" required>
                                    <?php if(is_array($coinlist)): $i = 0; $__LIST__ = $coinlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["show"]); ?>"><?php echo ($vo["show"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label">周期(分钟)</label>
                            <div class="col-sm-4">
                                <select name="period" class="form-control" required>
                                    <?php if(is_array($time_arr)): $i = 0; $__LIST__ = $time_arr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$t): $mod = ($i % 2 );++$i;?><option value="<?php echo ($t); ?>"><?php echo ($t); ?> 分钟</option><?php endforeach; endif; else: echo "" ;endif; ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">投放范围</label>
                            <div class="col-sm-10">
                                <label class="radio-inline"><input type="radio" name="target_type" value="0" checked /> 全部用户</label>
                                <label class="radio-inline"><input type="radio" name="target_type" value="1" /> 代理线（包含 N 代）</label>
                                <label class="radio-inline"><input type="radio" name="target_type" value="2" /> 指定用户</label>

                                <div id="target-agent-box" style="margin-top:10px;display:none;">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <input type="text" name="target_agent" class="form-control" placeholder="请输入代理账号或ID" />
                                        </div>
                                        <div class="col-sm-2">
                                            <input type="number" min="1" max="10" name="target_depth" class="form-control" value="3" />
                                        </div>
                                        <div class="col-sm-4">
                                            <span class="help-block">深度 N（例如填写3表示包含代理下 1-3 代）</span>
                                        </div>
                                    </div>
                                </div>

                                <div id="target-users-box" style="margin-top:10px;display:none;">
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <textarea name="target_users" rows="3" class="form-control" placeholder="输入用户ID，逗号分隔，或使用下方快捷选择"></textarea>
                                        </div>
                                        <div class="col-sm-8" style="margin-top:8px;">
                                            <input type="text" name="target_usernames" class="form-control" placeholder="或输入会员账号（username），逗号分隔，支持账号或ID混合输入" />
                                        </div>
                                        <div class="col-sm-4">
                                            <button type="button" class="btn btn-default" onclick="openUserSelector()">快捷选择用户</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                <!-- 用户选择弹窗 -->
                <div id="userSelectorModal" style="display:none;">
                    <div class="modal-backdrop" style="position:fixed;left:0;top:0;right:0;bottom:0;background:rgba(0,0,0,0.5);z-index:9998;"></div>
                    <div style="position:fixed;left:50%;top:50%;transform:translate(-50%,-50%);width:80%;max-width:900px;background:#fff;z-index:9999;border-radius:6px;overflow:hidden;">
                        <div style="padding:12px;border-bottom:1px solid #eee;">
                            <div style="display:flex;gap:8px;align-items:center;">
                                <input type="text" id="userSelectorKw" class="form-control" placeholder="搜索用户名或ID" style="flex:1;">
                                <button type="button" class="btn btn-primary" id="userSelectorSearch">搜索</button>
                                <button type="button" class="btn btn-default" id="userSelectorClose">关闭</button>
                            </div>
                        </div>
                        <div style="padding:12px;max-height:420px;overflow:auto;">
                            <table class="table table-bordered table-condensed" id="userSelectorTable">
                                <thead>
                                    <tr>
                                        <th style="width:40px;"><input type="checkbox" id="userSelectorCheckAll" /></th>
                                        <th>ID</th>
                                        <th>用户名</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                        <div style="padding:12px;border-top:1px solid #eee;display:flex;justify-content:space-between;align-items:center;">
                            <div>
                                <button type="button" class="btn btn-default" id="userSelectorPrev">上一页</button>
                                <button type="button" class="btn btn-default" id="userSelectorNext">下一页</button>
                                <span id="userSelectorPager" style="margin-left:8px;"></span>
                            </div>
                            <div>
                        <button type="button" class="btn btn-primary" id="userSelectorConfirm">添加到目标列表</button>
                        <span style="margin-left:12px;" id="userSelectorSelectedSummary"></span>
                            </div>
                        </div>
                    </div>
                </div>
                        <script type="text/javascript">
                            $('input[name=target_type]').change(function(){
                                var v = $(this).val();
                                if(v == '1'){
                                    $('#target-agent-box').show();
                                    $('#target-users-box').hide();
                                }else if(v == '2'){
                                    $('#target-agent-box').hide();
                                    $('#target-users-box').show();
                                }else{
                                    $('#target-agent-box').hide();
                                    $('#target-users-box').hide();
                                }
                            });
                            function openUserSelector(){
                                $('#userSelectorModal').show();
                                userSelectorLoad(1);
                            }
                            $('#userSelectorClose').click(function(){
                                $('#userSelectorModal').hide();
                            });

                            var userSelectorPage = 1;
                            function userSelectorLoad(page){
                                page = parseInt(page) || 1;
                                userSelectorPage = page;
                                var kw = $('#userSelectorKw').val();
                                $.get("<?php echo U('User/ajaxUserList');?>", {page: page, kw: kw}, function(res){
                                    if(res.code == 1){
                                        var tbody = $('#userSelectorTable tbody');
                                        tbody.empty();
                                        $.each(res.data.list, function(i, u){
                                            var row = '<tr><td><input type="checkbox" class="userSelectorCb" data-id="'+u.id+'" data-username="'+u.username+'"></td>'
                                                +'<td>'+u.id+'</td><td>'+u.username+'</td></tr>';
                                            tbody.append(row);
                                        });
                                        $('#userSelectorPager').text('第 '+res.data.page+' / '+res.data.pages+' 页');
                                    }else{
                                        alert(res.msg || '无用户');
                                    }
                                }, 'json');
                            }

                            $('#userSelectorSearch').click(function(){ userSelectorLoad(1); });
                            $('#userSelectorPrev').click(function(){ if(userSelectorPage>1) userSelectorLoad(userSelectorPage-1); });
                            $('#userSelectorNext').click(function(){ userSelectorLoad(userSelectorPage+1); });
                            $('#userSelectorCheckAll').change(function(){
                                $('.userSelectorCb').prop('checked', $(this).prop('checked'));
                            });
                            $('#userSelectorConfirm').click(function(){
                                var ids = [];
                                var usernames = [];
                                $('.userSelectorCb:checked').each(function(){
                                    ids.push($(this).data('id'));
                                    usernames.push($(this).data('username'));
                                });
                                if(ids.length == 0){
                                    alert('请先选择用户');return;
                                }
                                // append ids to textarea[name=target_users]
                                var curIds = $('textarea[name=target_users]').val();
                                var newIds = ids.join(',');
                                if(curIds && curIds.trim()!=''){
                                    curIds = curIds + ',' + newIds;
                                }else{
                                    curIds = newIds;
                                }
                                // normalize commas
                                curIds = curIds.split(',').map(function(s){ return s.trim(); }).filter(function(s){ return s !== ''; }).join(',');
                                $('textarea[name=target_users]').val(curIds);

                                // append usernames to input[name=target_usernames]
                                var curNames = $('input[name=target_usernames]').val();
                                var newNames = usernames.join(',');
                                if(curNames && curNames.trim()!=''){
                                    curNames = curNames + ',' + newNames;
                                }else{
                                    curNames = newNames;
                                }
                                curNames = curNames.split(',').map(function(s){ return s.trim(); }).filter(function(s){ return s !== ''; }).join(',');
                                $('input[name=target_usernames]').val(curNames);

                                $('#userSelectorModal').hide();
                                updateSelectedSummary();
                            });
                            // show selected count summary
                            function updateSelectedSummary(){
                                var cur = $('textarea[name=target_users]').val();
                                if(!cur || cur.trim()==''){
                                    $('#userSelectorSelectedSummary').text('');
                                    return;
                                }
                                var parts = $.grep(cur.split(','), function(n){ return $.trim(n) !== ''; });
                                $('#userSelectorSelectedSummary').text('已选 '+ parts.length +' 位');
                            }
                            // when modal opens, refresh selected summary
                            $('#userSelectorModal').on('show', function(){ updateSelectedSummary(); });
                            // also update on page load
                            $(function(){ updateSelectedSummary(); });
                        </script>
                            <label class="col-sm-2 control-label">开始时间</label>
                            <div class="col-sm-4">
                                <input type="text" name="start_time" class="form-control" value="<?php echo ($now); ?>" />
                                <span class="help-block">为空则默认当前时间</span>
                            </div>
                            <label class="col-sm-2 control-label">生成条数</label>
                            <div class="col-sm-4">
                                <input type="number" min="1" max="20" name="rows" id="rows" class="form-control" value="1" />
                                <span class="help-block">自动按周期顺延开始时间</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">计划明细</label>
                            <div class="col-sm-10">
                                <table class="table table-bordered" id="plan-table">
                                    <thead>
                                        <tr>
                                            <th width="40%">标题</th>
                                            <th width="15%">方向</th>
                                            <th width="15%">控盈亏</th>
                                            <th width="15%">固定金额</th>
                                            <th width="15%">占用余额百分比</th>
                                            <th width="10%">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="text" name="row_title[]" class="form-control" placeholder="计划标题" /></td>
                                            <td>
                                                <select name="row_direction[]" class="form-control">
                                                    <option value="1">买涨</option>
                                                    <option value="2">买跌</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select name="row_kongyk[]" class="form-control">
                                                    <option value="0">不控制</option>
                                                    <option value="1">盈利</option>
                                                    <option value="2">亏损</option>
                                                </select>
                                            </td>
                                            <td><input type="number" min="0" step="0.00000001" name="row_amount[]" class="form-control" placeholder="金额(USDT，可为空)" /></td>
                                            <td><input type="number" min="0" max="100" step="0.01" name="row_percent[]" class="form-control" placeholder="占余额百分比(0-100，可为空)" /></td>
                                            <td><button type="button" class="btn btn-danger btn-sm" onclick="removeRow(this)">删除</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button type="button" class="btn btn-info btn-sm" onclick="addRow()">添加一行</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <label style="margin-right:12px;"><input type="checkbox" name="async_expand" value="1" /> 异步展开代理用户（若代理线用户量大，建议勾选）</label>
                                <button type="submit" class="btn btn-primary">确认生成</button>
                                <a href="<?php echo U('User/followplan');?>" class="btn btn-default">返回列表</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
function addRow(){
    var tpl = `<tr>
        <td><input type="text" name="row_title[]" class="form-control" placeholder="计划标题" /></td>
        <td>
            <select name="row_direction[]" class="form-control">
                <option value="1">买涨</option>
                <option value="2">买跌</option>
            </select>
        </td>
        <td>
            <select name="row_kongyk[]" class="form-control">
                <option value="0">不控制</option>
                <option value="1">盈利</option>
                <option value="2">亏损</option>
            </select>
        </td>
        <td><input type="number" min="0" step="0.00000001" name="row_amount[]" class="form-control" placeholder="金额(USDT，可为空)" /></td>
        <td><input type="number" min="0" max="100" step="0.01" name="row_percent[]" class="form-control" placeholder="占余额百分比(0-100，可为空)" /></td>
        <td><button type="button" class="btn btn-danger btn-sm" onclick="removeRow(this)">删除</button></td>
    </tr>`;
    $('#plan-table tbody').append(tpl);
}
function removeRow(btn){
    var $tr = $(btn).closest('tr');
    if($('#plan-table tbody tr').length <= 1){
        alert('至少保留一条计划');
        return;
    }
    $tr.remove();
}
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