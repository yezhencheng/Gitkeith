<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<%@ include file="checkUser.jsp"%>
		<title>My JSP 'checkUser.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--<link rel="stylesheet" type="text/css" href="styles.css">-->

		<link rel="stylesheet" type="text/css" href="css/easyui.css">
		<link href="css/main.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
		<script type="text/javascript" src="js/jquery-Slider.js"></script>
	</head>
	<body>
		<form action="login_login.action" method="post">
			<input type="hidden" id="hidout" value="0">
			<div class="panel layout-panel layout-panel-north"
				style="left: 0px; top: 0px; width: 100%;">

				<div region="north" border="true"
					class="cs-north panel-body panel-body-noheader layout-body"
					title="" style="width: 80% px; height: 70px;">
					<div class="header">
						<div class="lineOne">
							<div class="logo">
								<h1 style="color: #FFFFFF">
									云计算知识管理系统
								</h1>
								<font color="white "><em id="time"></em>
								</font>
							</div>
							<div class="info">
								<div class="user_name">
									当前用户：${sessionScope.username.username}
								</div>
								<div class="sysmenu">
									<ul>
										<li class="message">
											<a href="###">消息1</a>
										</li>

										<li class="website">
											<a href="###">管理员</a>
										</li>
										<li class="logout">
											<a href="###">退出</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- header end -->
			<div class="panel layout-panel layout-panel-west layout-split-west"
				style="float: left; width: 120px; position: relative;">
				<div region="west" border="true" split="true"
					class="cs-west panel-body panel-body-noheader layout-body" title=""
					style="width: 120px;" id="leftmenu">
					<div class="leftMenu"
						style="width: 110px; margin-right: 9px; height: 100%;"
						id="leftMenu">
						<div class="lmenuPrev">
							<a href="javascript:;" id="btnDown">向下</a>
						</div>
						<div class="lmenu fl">
							<ul>
								<li id="parent1" class="parentMenu">
									<a style="cursor: pointer">
										<div class="cover"></div>
										<div topvalue="2" topname="" class="text">
											用户管理
										</div> </a>
									<div id="1" class="secondFloat secondFLoat1"
										style="display: none;">
										<div class="second">
											<ul>
												<li>
													<a style="cursor: pointer; font: 17px" class="title" src="">用户管理</a>
													<ul>
														<li>


															<a onclick=OpenWindow(this); style="cursor: pointer"
																index="3" src="<%=basePath%>User_list.action"
																class="cs-navi-tab">用户列表 </a>
														</li>
														<li>


															<a onclick=OpenWindow(this); style="cursor: pointer"
																index="4" src="<%=basePath%>User_useraddfirst.action"
																class="cs-navi-tab">用户添加 </a>
														</li>
														<li>


															<a onclick=OpenWindow(this); style="cursor: pointer"
																index="4"
																src="<%=basePath%>user_showpasswordform.action"
																class="cs-navi-tab">修改密码 </a>
														</li>
														<li>


															<a onclick=OpenWindow(this); style="cursor: pointer"
																index="4" src="<%=basePath%>user_showchangepower.action"
																class="cs-navi-tab">权限分配 </a>
														</li>
													</ul>
												</li>
											</ul>
										</div>
										<!-- second -->
									</div>
								</li>

								<li id="parent2" class="parentMenu">
									<a style="cursor: pointer">
										<div class="cover"></div> <!--<div class="icon">
      		<img src="images/menu_05.gif">
      </div>
      <div index="tfun2" style="display:none;" class="newFunction"></div>-->
										<div topvalue="2" topname="" class="text">
											设备管理
										</div> </a>
									<div id="2" class="secondFloat secondFLoat2"
										style="display: none;">
										<div class="second">
											<ul>
												<li>
													<div class="title">
														设备管理
													</div>
													<ul>
														<li>
															<div class="newFunction"
																style="margin-top: 10px; * margin-left: -20px; display: none;"
																index="tfun28"></div>


															<a onclick=OpenWindow(this); style="cursor: pointer"
																index="28" src="tableb_addformfirstload.action"
																class="cs-navi-tab">添加设备 </a>
														</li>
														<li>
															<div class="newFunction"
																style="margin-top: 10px; * margin-left: -20px; display: none;"
																index="tfun29"></div>


															<a onclick=OpenWindow(this); style="cursor: pointer"
																index="29" src="tableb_list.action" class="cs-navi-tab">设备列表
															</a>
														</li>
													</ul>
												</li>
											</ul>
										</div>
										<!-- second -->
									</div>
								</li>
							</ul>
						</div>
						<div class="lmenuNext">
							<a href="javascript:;" id="btnUp">向上</a>
						</div>
					</div>
				</div>
			</div>
			<!--右侧content内容-->
			<div class="panel layout-panel layout-panel-center"
				style="margin-left: 120px;">
				<div id="mainPanle" region="center" border="true" title=""
					class="panel-body panel-body-noheader layout-body panel-noscroll">
					<div id="tabs" class="easyui-tabs tabs-container" fit="true"
						border="false">

					</div>
				</div>
			</div>

			<script>
var index = 0;
$(function() {
	$(".lmenu").Scroll();
	$(".sysmenu .msglist").hide();

	$(".sysmenu .message").mouseover(function() {
		if ($(".sysmenu .msglist ul>li").length > 0) {
			$(".sysmenu .msglist").show();
		}
		;
	});

	$(".sysmenu .message").mouseout(function() {
		$(".sysmenu .msglist").hide();
	});
});

function reloadTabGrid(title) {
	if ($("#tabs").tabs('exists', title)) {
		$('#tabs').tabs('select', title);
		window.top.reload_Abnormal_Monitor.call();
	}
}
//时间设置
function currentTime() {
	var d = new Date(), str = '';
	str += d.getFullYear() + '年';
	str += d.getMonth() + 1 + '月';
	str += d.getDate() + '日';
	str += d.getHours() + '时';
	str += d.getMinutes() + '分';
	str += d.getSeconds() + '秒';
	return str;
}

setInterval(function() {
	$('#time').html(currentTime)
}, 1000);
</script>
		</form>
	</body>
</html>
