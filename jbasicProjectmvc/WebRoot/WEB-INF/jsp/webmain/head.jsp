<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<div id="topbar-wrap">
<div id="topbar" class="clearfix">
<ul id="nav-top" class="left clearfix hover-none">
<li><a href="webmain/news_biglei.do?bigid=B20180516092948" >编程软件下载/编译器下载</a></li>
</ul>

<div class="right clearfix" id="user-info"></div>
</div>
</div>
<div id="header_wrap" class="clearfix">
<div id="header" class="hover-none">
<a id="logo" class="left" href="webmain/news_index.do" ><img src="<%=basePath%>templets/new/images/logo.jpg"  alt="JAVA淘淘网"></a>
<ul id="nav-main" class="left clearfix">
<li><a href="webmain/news_index.do" >首页</a></li>
<li><a href="webmain/news_biglei.do?bigid=20180503" >JAVA教程</a></li>
<li><a href="webmain/news_biglei.do?bigid=B20180524094321" >数据库教程</a></li>
<li><a href="webmain/news_biglei.do?bigid=B20180515141959" >前端教程</a></li>
<li><a href="webmain/news_biglei.do?bigid=B20180524105757" >项目实战</a></li>
<li><a href="http://www.baidu.com/"  target="_blank">读者评价</a></li>
</ul>
</div>
</div>
<div id="position" class="clearfix"></div>

