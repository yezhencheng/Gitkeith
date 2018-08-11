<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户登录</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="refresh" content="0;url=news_edit.do"/>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
				<script type="text/javascript" src="<%=basePath%>js/socket.io.js"></script>
						<script type="text/javascript" src="<%=basePath%>js/moment.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>

		
		<script type="text/javascript">
	$(document).ready(function() {
		$('#form1').submit();
	})

</script>


	</head>
	<body>
		<form id="form1" action="news_edit.do" method="post">
			
		</form>
	</body>
</html>
