<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="gb2312" />
		<title>网站地图</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link href="<%=basePath%>css/stylehtml.css" rel="stylesheet" media="screen"
			type="text/css" />
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
		<script src="<%=basePath%>templets/new/script/index.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=basePath%>js/easyui1.5/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=path%>/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="<%=path%>/js/newsdetail.js"></script>
	</head>
	<body>
		<div id="topbar-wrap" class="clearfix">
<div id="topbar">
<a class="left" style="margin-top: 11px;" href="../index.jsp" ></a>
<ul id="nav-top" class="left clearfix hover-none">
<li><a href="<%=basePath%>index.jsp" >网站首页</a></li>
<li><a href="<%=basePath%>/html/author.html"  class="this">关于作者</a></li>
<li><a href="<%=basePath%>/html/luxian.html" >JAVA自学路线</a></li>
<li><a href="<%=basePath%>/html/duzhepingjia.htm" >读者评价</a></li>
</ul>
</div>
</div>

<div id="main">
<h1>网站地图</h1>
<p style="font-size: 20px; line-height: 1.8em; text-align: center;">
</p>
<c:forEach items="${biglist}" var="obj" varStatus="status">
<p style="font-size: 20px; line-height: 1.8em; text-align: center;">
<a href="webmain/news_biglei.do?bigid=${obj.bigid}"  target="_blank">${obj.bigname}</a>
</p>
</c:forEach>
</div>
	</body>
</html>
