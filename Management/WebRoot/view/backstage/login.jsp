<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

		<title>My JSP 'index.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--<link rel="stylesheet" type="text/css" href="styles.css">-->
		<script language="JavaScript" src="<%=basePath%>js/front/jquery.min.js" type="text/javascript"></script>
		<link href="<%=basePath%>css/backstage/base.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>css/backstage/login.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
		$(function(){
			var info=$('#info').val();
			var str1="";
		    var str2=" ";
		    var str3=null;
		    var str4=undefined;
			if(info==str1||info==str2||info==str3||info==str4){
			
			}else{
				alert(info);
			}
			})
		
		</script>
		</head>
	<body>
	<input id="info" type="hidden" value="${info}"/>
		<div class="login">
<form action="backstage_login.do" method="post" id="form">
	<div class="logo"></div>
    <div class="login_form">
    	<div class="user">
        	<input class="text_value" value="" name="account" type="text" id="account" placeholder="账号">
            <input class="text_value" value="" name="password" type="password" id="password" placeholder="密码">
        </div>
        <button class="button" id="submit" type="submit">登录</button>
    </div>
    
    <div id="tip"></div>
    <div class="foot">
    Copyright © 2011-2015  All Rights Reserved. More About Us <a href="javascript:void(0)" target="_blank" title="关于我们">@关于我们</a>
    </div>
    </form>
</div>
</body>
</html>
