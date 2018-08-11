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
		<title>用户登录</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
				<script type="text/javascript" src="<%=basePath%>js/easyui1.5/jquery.min.js"></script>
		<script>
		$(document).ready(function() {
			$('#bt1').click(function() {

						$("#if1").contents().find("#TANGRAM__PSP_3__userName)'.val('123456');
				
			})
		})
		</script>
	</head>
	<body>
	<input id="bt1" type="button" value="测试"/>
	<iframe id="if1" src="https://passport.baidu.com/v2/?reg&tpl=tb&u=https://tieba.baidu.com/#" width="100%" height="500px">
	
	
	</iframe>
		
	</body>
</html>
