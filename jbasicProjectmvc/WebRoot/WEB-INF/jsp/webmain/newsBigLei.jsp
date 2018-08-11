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
		<title>${newsmodel.title}</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="${biglist[0].bigname}">
		<meta name="description" content="${biglist[0].bigname}" />
		<link href="<%=basePath%>templets/new/style/common.css" rel="stylesheet" media="screen"
			type="text/css" />
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
		<script src="<%=basePath%>templets/new/script/index.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=basePath%>js/easyui1.5/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=path%>/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="<%=path%>/js/newsdetail.js"></script>

	</head>
	<body>
		<c:import url="head.jsp"></c:import>
		<div id="position" class="clearfix">
			<a href="webmain/news_index.do" >首页</a><span>&nbsp;&nbsp;/&nbsp;&nbsp;</span><span>${biglist[0].bigname}</span>
		</div>
		<div id="main" class="clearfix sidebar-on-right">
			<div id="article" class="article">
				<h1>
					
				</h1>
				<div class="art-info clearfix">
					<dl class="follow-us left hover-none"></dl>
				</div>
				<div id="ad-arc-top-diy"></div>
				<div id="art-body" class="clearfix">
					<div id="art-list-index">
						<c:forEach items="${biglist}" var="obj" varStatus="status">
							<c:if test="${status.count eq 1 || (status.count-1) % 3 eq 0}">
								<div class="clearfix">
							</c:if>
							<c:choose>
								<c:when test="${status.count eq 3 || status.count % 3 eq 0}">
									<dl class="right0">
								</c:when>
								<c:otherwise>
									<dl>
								</c:otherwise>
							</c:choose>
							<dt>
								<a>${obj.smallname}</a>
							</dt>
							<c:forEach items="${obj.newslist}" var="model">
								<dd>
									<a href="webmain/news_detail.do?newsid=${model.newsid}">${model.title}</a>
								</dd>

							</c:forEach>
							</dl>
							<c:if test="${status.count eq 3 || status.count % 3 eq 0}">
					</div>
					</c:if>
					</c:forEach>
					<c:if test="${fn:length(biglist)%3!=0}">
				</div>
				</c:if>

			</div>
		</div>

		<div class="art-info clearfix">
			<dl class="follow-us left hover-none"></dl>
		</div>
		</div>
		<div id="sidebar" class="sidebar">


			<dl class="arc-list arc-c">
				<dt class="clearfix">
					<h4>
						<span>本站精品教程</span>
					</h4>
				</dt>
				<c:forEach var="tmodel" items="${jingpingjiaocheng}">
					<dd>
						<a href="webmain/news_detail.do?newsid=${tmodel.newsid}">${tmodel.title}</a>
					</dd>
				</c:forEach>
			</dl>



			<div class="sticker-sidebar">
				<p style="margin-bottom: 8px; padding-bottom: 8px; border-bottom: 1px dashed #aaa;">
					<a class="col-link" href="html/baoming.html" target="_blank">你还在自学JAVA吗？来吧,十年大神亲自带你飞!</a>
				</p>
				<p>
					站长：
					<b class="col-green qq-qun-number">6526558</b>
					<br />
					验证消息：JAVA淘淘网（
					<span class="col-red">记得填写哦</span>）
					<br />
					<span style="display: inline-block; line-height: 26px; vertical-align: top;">一键加群：</span>
					<a class="qq-qun-link" style="display:inline-block; line-height:0px;" target="_blank" href="tencent://message/?uin=6526558&Site=&Menu-=yes">
<img height="22" border="0" src="http://wpa.qq.com/pa?p=1:6526558:1"  alt="JAVA淘淘网站长" title="JAVA淘淘站长"></a>
				</p>
			</div>
			<div id="weixin-sidebar" style=" height: 600px">
			扫码加站长QQ一起学习

				<img width="250" height="250" src="images/QQ.png"  alt="站长二维码" />
		
				扫码加站长微信一起学习
		
<img width="250" height="250" src="images/WEIXIN.png"  alt="站长二维码" />
		
			</div>

		</div>
		</div>



		<c:import url="foot.jsp"></c:import>

	</body>
</html>
