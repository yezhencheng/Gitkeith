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
		<script type="text/javascript">
		$(document).ready(function() {
			$('#bt1').click(function(){
				$('#form1').submit();//news_save
			})
		})
		</script>
	</head>

	<body class="easyui-layout">
		<form id="form1" action="news_loginqir.do">
		<input id="bt1" type="button" value="登陆">
		</form>
	</body>
</html>
