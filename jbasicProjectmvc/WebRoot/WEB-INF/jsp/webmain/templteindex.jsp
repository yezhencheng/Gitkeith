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
		<meta charset="gb2312" />
		<title>java淘淘网：java程序设计门户网站(入门教程、编程软件)</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="JAVA自学,JAVA教程,编程">
		<meta name="description" content="java淘淘网是中国领先的JAVA程序设计专业网站，提供java入门经典教程、java编译器、java中文手册，java编程技巧，java考试试题等，是学习、自学java程序设计的好帮手。" />
		<link href="<%=basePath%>templets/new/style/index.css"  rel="stylesheet" media="screen" type="text/css" />
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
    	<script src="<%=basePath%>templets/new/script/index.js"  type="text/javascript"></script>
		<script type="text/javascript" src="<%=basePath%>js/easyui1.5/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=path%>/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="<%=path%>/js/index.js"></script>

	</head>
	<body>
		<c:import url="head.jsp"></c:import>  
<div id="main" class="clearfix">
<div style="width:140px;height:90px;"><a href="html/baoming.html"  target="_blank"><img src="upload/ads/fudaoban.jpg"  alt="JAVA淘淘网辅导班"></a></div>
<div id="part-top" class="clearfix">
<div id="top-left" class="left">
<dl class="list host-software hover-none">
<dt>javaXXX网出品</dt>
<c:forEach var="tmodel" items="${downloadjiaocheng}">

<dd id="downloaddd" class="clearfix">
<a class="left icon" href="html/2955.html"  target="_blank" title="${tmodel.title}">
<img src="templets/new/images/index/icon_qstudio.png"  alt="${tmodel.title}">
</a>
<p class="left info">
<a href="news_detail.do?newsid=${tmodel.newsid}"  target="_blank" title="${tmodel.title}">${tmodel.title}</a><br />
<span>${tmodel.keywords}</span>
</p>
<span class="right time">${tmodel.datetimef}</span>
</dd>
</c:forEach>



</dl>
</div>
<dl id="top1" class="list left arc-list hot-arc">
<dt>最近更新 TOP10</dt>
<c:forEach var="tmodel" items="${zuijingengxin}">
<dd class="clearfix">
<a style="color: #C52CC3;" class="left" href="news_detail.do?newsid=${tmodel.newsid}"  target="_blank">${tmodel.title}</a>
<span class="right">${tmodel.datetimef}</span>
</dd>
</c:forEach>
</dl>
<div class="left" style="border-top: 3px solid #D33428;">
<div class="tab clearfix">
<ul class="title-list clearfix">
<li class="this" tabindex="1">精品教程</li>
<li tabindex="2">阅读排行</li>
</ul>
<ul class="cont-list">
<li class="this" tabindex="1">
<ul>
<c:forEach var="tmodel" items="${jingpingjiaocheng}">
<li><a href="news_detail.do?newsid=${tmodel.newsid}">${tmodel.title}</a></li>
</c:forEach>
</ul>
</li>
<li tabindex="2">
<ul>
<c:forEach var="tmodel" items="${yuedupaihang}">
<li><a href="news_detail.do?newsid=${tmodel.newsid}" target="_blank" title="${tmodel.title}">${tmodel.title}</a></li>
</c:forEach>
</ul>
</li>
</ul>
</div>
</div>
</div>
<div id="part-left" class="left" class="clearfix">
<table class="course-contents">
<caption class="clearfix hover-none">
<a class="left title" href="news_biglei.do?bigid=20180503"  target="_blank">JAVA编程入门教程</a>
<a class="right more" href="news_biglei.do?bigid=20180503"  target="_blank" title="JAVA编程入门教程">查看更多&gt;&gt;</a>
</caption>

<c:forEach items="${javajiaocheng}" var="obj"  varStatus="status">       
     <c:if test="${status.count eq 1 || (status.count-1) % 4 eq 0}">      
      <tr>      
     </c:if>      
     	<td><a href="news_detail.do?newsid=${obj.newsid}""  target="_blank" title="${obj.title }">${obj.title } </a></td>
      <c:if test="${status.count % 4 eq 0 || status.count eq 4}">      
      </tr>      
      </c:if>      
  </c:forEach>  
  <c:if test="${fn:length(javajiaocheng)%4!=0}">
		</tr>      
	</c:if>
   
</table>
<table class="course-contents">
<caption class="clearfix hover-none">
<a class="left title" href="news_biglei.do?bigid=B20180515141959"  target="_blank">前端教程</a>
<a class="right more" href="news_biglei.do?bigid=B20180515141959"  target="_blank" title="HTML入门教程">查看更多&gt;&gt;</a>
</caption>

<c:forEach items="${htmljiaocheng}" var="obj"  varStatus="status">       
     <c:if test="${status.count eq 1 || (status.count-1) % 4 eq 0}">      
      <tr>      
     </c:if>      
     	<td><a href="u/c18/index.htm"  target="_blank" title="${obj.title }">${obj.title } </a></td>
      <c:if test="${status.count % 4 eq 0 || status.count eq 4}">      
      </tr>      
      </c:if>      
</c:forEach>  
<c:if test="${fn:length(htmljiaocheng)%4!=0}">
		</tr>      
	</c:if> 
</table>


<dl class="list left">
<dt><a href="news_biglei.do?bigid=B20180516101945"  target="_blank">JAVA技巧总结</a></dt>

<c:forEach var="tmodel" items="${javajiqiao}">
<dd class="clearfix">
<a class="left" href="news_detail.do?newsid=${tmodel.newsid}"  target="_blank" title="${tmodel.title}">${tmodel.title}</a>
<span class="right">${tmodel.datetimef}</span>
</dd>
</c:forEach>
</dl>
<dl class="list right">
<dt><a href="news_biglei.do?bigid=B20180516111455"  target="_blank">常用JAVA框架配置</a></dt>
<c:forEach var="tmodel" items="${javakuangjia}">
<dd class="clearfix">
<a class="left" href="news_detail.do?newsid=${tmodel.newsid}"  target="_blank" title="${tmodel.title}">${tmodel.title}</a>
<span class="right">${tmodel.datetimef}</span>
</dd>
</c:forEach>

</dl>
</div>
<div id="part-right" class="right">
<div id="weixin-sidebar">
<img width="250" src="templets/new/images/erweima_biancheng_sidebar.png-v=3.993.png"  alt="站长二维码" />
<p><span class="col-green">站长QQ</span>，一个分享编程知识的JAVA大神，跟着<a href="about/author/index.htm"  style="color:#08C;" target="_blank">站长</a>一起学习。</p>
</div>
<dl class="list">
<dt>友情链接</dt>
<dd><a href="http://www.baidu.com/"  target='_blank'>百度</a> </dd><dd><a href="http://www.csdn.net/"  target='_blank'>CSDN博客</a> </dd><dd><a href="http://www.runoob.com/java/java-basic-syntax.html"  target='_blank'>runoob网</a> </dd>
</dl>
</div>
</div>


	<c:import url="foot.jsp"></c:import>  
</body>
</html>
