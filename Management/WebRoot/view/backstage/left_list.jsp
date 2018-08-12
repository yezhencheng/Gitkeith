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
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backstage/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backstage/css/common.css"/>
<!--框架高度设置-->
<script type="text/javascript">
$(function(){
	$('.sidenav li').click(function(){
		$(this).siblings('li').removeClass('now');
		$(this).addClass('now');
	});
	
	$('.erji li').click(function(){
		$(this).siblings('li').removeClass('now_li');
		$(this).addClass('now_li');
	});
	
	var main_h = $(window).height();
	$('.sidenav').css('height',main_h+'px');
})
</script>
<!--框架高度设置-->
</head>

<body>
<div id="left_ctn">
    <ul class="sidenav">
        <li class="now">
            <div class="nav_m">
                <span><a>账户管理</a></span>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li class="now_li">
                    <span><a href="<%=basePath%>view/backstage/user.jsp" target="main">用户管理</a></span>
                </li>
                <li>
                    <span><a href="" target="main">管理员设置</a></span>
                </li>
            </ul>
        </li>
        <li>
            <div class="nav_m">
                <span><a>公告管理</a></span>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li>
                    <span><a href="zdlb.html" target="main">发布新公告</a></span>
                </li>
                <li>
                    <span><a href="hy_list.html" target="main">管理已发布公告</a></span>
                </li>
            </ul>
        </li>
        <li>
            <div class="nav_m">
                <span><a>科室管理</a></span>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li>
                    <span><a href="lfpz.html" target="main">添加科室</a></span>
                </li>
                <li>
                    <span><a href="fwqkz.html" target="main">删除科室</a></span>
                </li>
            </ul>
        </li>
        <li>
            <div class="nav_m">
                <span><a>专家管理</a></span>
                <i>&nbsp;</i>
            </div>
            <ul class="erji">
                <li>
                    <span><a href="mkzt.html" target="main">添加专家</a></span>
                </li>
                <li>
                    <span><a href="mkkz.html" target="main">删除专家</a></span>
                </li>
                <li>
                    <span><a href="wltj.html" target="main">更新专家资料</a></span>
                </li>
            </ul>
        </li>
            
        <li>
            <div class="nav_m">
                <span><a href="<%=basePath%>view/backstage/login.jsp" target="_blank">退出系统</a></span>
            </div>
        </li>
    </ul>
</div>
</body>
</html>
