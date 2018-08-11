<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
		<title>java淘淘网：java程序设计门户网站(入门教程、编程软件)</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="JAVA自学,JAVA教程,编程">
		<meta name="description" content="java淘淘网是中国领先的JAVA程序设计专业网站，提供java入门经典教程、java编译器、java中文手册，java编程技巧，java考试试题等，是学习、自学java程序设计的好帮手。" />
	</head>
	<body>
	<jsp:forward page="webmain/news_index.do">
	<jsp:param value="xxx" name="xxx"/>
	</jsp:forward>
	</body>
</html>
