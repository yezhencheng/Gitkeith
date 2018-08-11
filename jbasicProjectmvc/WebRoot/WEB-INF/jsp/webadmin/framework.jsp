<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>基础框架</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/easyui1.5/themes/default/easyui.css"></link>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/easyui1.5/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main.css">
		<script type="text/javascript" src="<%=basePath%>/js/easyui1.5/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/js/easyui1.5/jquery.easyui.min.js"></script>
				<script type="text/javascript" src="<%=basePath%>js/layer/layer.js"></script>
		<script type="text/javascript" src="<%=basePath%>/js/publichelper.js"></script>
		<script type="text/javascript" src="<%=basePath%>/js/framework.js"></script>
	</head>

	<body class="easyui-layout">
	<a id="id123" value="xxxx"></a>
		<div data-options="region:'north',border:false" style="height: 60px; background: #B3DFDA;">
			<img alt="" src="<%=basePath%>/images/banner1.jpg" style="width: 100%; height: 100%">
		</div>
		<div id="leftmenu1" data-options="region:'west',split:true,title:'导航菜单'" style="width: 160px;">
			<div class="easyui-accordion" data-options="fit:true,border:false">
				<div title="权限管理" data-options="selected:true">
					<div class="menuli">
						<img src="<%=basePath%>/images/1.png" class="menuliimage">
						<a href="javascript:void(0)" iframeid="iframeid3" way="<%=basePath%>/news_redirect.do">新闻管理</a>
					</div>
					<div class="menuli">
						<img src="<%=basePath%>/images/1.png" class="menuliimage">
						<a href="javascript:void(0)" iframeid="iframeid3" way="<%=basePath%>/news_leibieirect.do">类别管理</a>
					</div>
				</div>
				<div title="系统管理">
					content2
				</div>
				<div title="功能模块">
					content3
				</div>
			</div>
		</div>

		<div data-options="region:'south',border:false" style="height: 30px; background: #A9FACD;">
		</div>
		<div data-options="region:'',title:''">
			<div id="tabs" class="easyui-tabs" style="width: 100%; height: 100%">
			
			</div>
		</div>
	
	</body>
</html>
