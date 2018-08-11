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
<li><a href="compiler/index.htm" >编程软件下载/编译器下载</a></li>
</ul>
<ul id="ad-link-top" class="left hover-none" style="display: none">
<li class="sub-menu" style="color: #D33428;">&nbsp;&nbsp;java辅导班<span class="icon">&nbsp;&nbsp;&nbsp;&nbsp;</span>
<ul>
<li><a href=""  target="_blank">普通班(XXXX)</a></li>
<li><a href=""  target="_blank">进阶班(XXXXX)</a></li>
</ul>
</li>

<li style="color: #D33428;">站长QQ：<span class="qq-qun-number">6526558</span></li>
</ul>
<div class="right clearfix" id="user-info"></div>
</div>
</div>
<div id="header_wrap" class="clearfix">
<div id="header" class="hover-none">
<a id="logo" class="left" href="index.jsp" ><img src="templets/new/images/logo.jpg"  alt="JAVA淘淘网"></a>
<ul id="nav-main" class="left clearfix">
<li><a href="news_index.do" >首页</a></li>
<li><a href="news_biglei.do?bigid=20180503" >JAVA教程</a></li>
<li><a href="news_biglei.do?bigid=B20180524094321" >数据库教程</a></li>
<li><a href="news_biglei.do?bigid=B20180515141959" >前端教程</a></li>
<li><a href="news_biglei.do?bigid=B20180524105757" >项目实战</a></li>
<li class="bubble"><a href="http://www.baidu.com/"  style="color: #D33428;" target="_blank">VIP会员</a><span class="hot">&nbsp;</span></li>
<li class="bubble"><a href="http://www.baidu.com/"  style="color: #009300;" target="_blank">辅导班</a><span class="sale">&nbsp;</span></li>
<li><a href="http://www.baidu.com/"  target="_blank">读者评价</a></li>
</ul>
</div>
</div>
<div id="position" class="clearfix"></div>

