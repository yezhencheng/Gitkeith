<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     


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
		<meta charset="gb2312" />
		<title>${newsmodel.title}</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="${newsmodel.keywords}">
		<meta name="description" content="${newsmodel.description}"/>
		<link href="<%=basePath%>templets/new/style/common.css"  rel="stylesheet" media="screen" type="text/css" />
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/newsdetail.js"></script>
		<link  href="<%=basePath%>css/zenburn.css" rel="stylesheet" media="screen" type="text/css" ></link>
		<script type="text/javascript" src="<%=basePath%>js/highlight.pack.js"></script>
		<script type="text/javascript">hljs.initHighlightingOnLoad();</script>  
	</head>
	<body>
	
		<c:import url="head.jsp"></c:import>  
	<div id="main" class="clearfix">
	<div style="width:140px;height:90px;"><a href="html/baoming.html"  target="_blank"><img src="upload/ads/fudaoban.jpg"  alt="JAVA淘淘网辅导班"></a></div>

<div id="position" class="clearfix"><a href="webmain/news_index.do" >首页</a><span>&nbsp;&nbsp;/&nbsp;&nbsp;</span><a href="webmain/news_biglei.do?bigid=${newsmodel.bigid}" >${newsmodel.bigname}</a><span>&nbsp;&nbsp;/&nbsp;&nbsp;</span>${newsmodel.smallname}<span>&nbsp;&nbsp;/&nbsp;&nbsp;</span></div>
<div id="main" class="clearfix sidebar-on-right">
<div id="article" class="article">
<h1>${newsmodel.title}</h1>

<div class="art-info clearfix">
<c:if test="${not empty upmodel}">
<a href="webmain/news_detail.do?newsid=${upmodel}"><span class="left paging-btn paging-pre">&lt;上一节</span></a>
</c:if>
<c:if test="${not empty downmodel}">
<a href="webmain/news_detail.do?newsid=${downmodel}"><span class="left paging-btn paging-next">下一节&gt;</span></a>
</c:if>
<dl class="follow-us left hover-none"></dl>
</div>
<div class="ad-art-body-top">

</div>
<div id="ad-arc-top-diy"></div>
<div id="art-body">
${newsmodel.contentutf}

</div>
<div id="ad-arc-bottom-diy"></div>
<div id="ad-bottom-weixin" class="clearfix">
<div class="left" style="width: 535px;">

</div>
<div class="right" style="width: 150px;">

</div>
</div>
<div class="art-info clearfix">
<dl class="follow-us left hover-none"></dl>
</div>
</div>
<div id="sidebar" class="sidebar">

<dl class="arc-list arc-c">
<dt class="clearfix"><h4><span>本站精品教程</span></h4></dt>
<c:forEach items="${yuedupaihang}" var="obj"  varStatus="status">       
<dd><a href="webmain/news_detail.do?newsid=${obj.newsid}">${obj.title }</a></dd> 
</c:forEach>   



</dl>
<div class="sticker-sidebar">
<p style="margin-bottom:8px; padding-bottom: 8px;border-bottom: 1px dashed #aaa;">
<a class="col-link" href="html/baoming.html"  target="_blank">你还在自学JAVA吗？来吧,十年大神亲自带你飞!</a>
</p>
<p>
站长QQ：<b class="col-green qq-qun-number">650460457</b><br />
验证消息：JAVA淘淘网（<span class="col-red">记得填写哦</span>）<br />
<span style="display:inline-block; line-height:26px; vertical-align:top;">一键聊天：</span>
<a class="qq-qun-link" style="display:inline-block; line-height:0px;" target="_blank" href="#"><img height="22" border="0" src="http://wpa.qq.com/pa?p=1:6526558:1"  alt="JAVA淘淘网交流群" title="JAVA淘淘网交流群"></a>
</p>
</div>
<div id="weixin-sidebar">


</div>

</div>
</div>
</div>

	
	<c:import url="foot.jsp"></c:import>  

</body>
</html>
