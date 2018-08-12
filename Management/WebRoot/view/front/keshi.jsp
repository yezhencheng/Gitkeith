<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'keshi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="JavaScript" src="<%=basePath%>js/front/jquery.min.js" type="text/javascript"></script>
	<script language="JavaScript" src="<%=basePath%>js/front/public.js" type="text/javascript"></script>
	<link href="<%=basePath%>css/front/public.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/front/keshi.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
    <jsp:include flush="true" page="inctop.jsp"></jsp:include>
    
    <div class="ksjs">
		<ul >
		<c:forEach var="keshilist" items="${list}">
		<li>
		<a href="${keshilist.url}.do"><td>${keshilist.keshi}</td></a>
		</li>
		</c:forEach>
		</ul>
		</div>
  </body>
</html>
