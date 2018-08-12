<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'rightdiv.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	/* QQ联系 */
#qq-qun-float{
	position: fixed;
	bottom: 50%;
	left: 0px;
	width:100%;
	height:0px;
	background-color: #ddd;
	overflow: visible;
	z-index: 1;
}
#qq-qun-float .box{
	position: relative;
	margin: auto;
	width: 1040px;
	height: 0px;
}
#qq-qun-float .filler{
	position: absolute;
	top: -110px;
	right: -137px;
	height: 220px;
	width: 130px;
	border: 1px solid #ddd;
	background-color: #f9f9f9;
	box-shadow: 4px 4px 5px 0px #ccc;
	border-radius: 3px;
}
#qq-qun-float .filler p{
	padding: 10px 0px;
	line-height: 1.48em;
	text-align: center;
}
#qq-qun-float p.header{
	background-color: #5482c7;
	background: radial-gradient(circle 100px at 65px 0,#85b1f3,#5482c7);
	border-radius: 3px 3px 0px 0px;
}
#qq-qun-float span.btn-close{
	display: block;
	position: absolute;
	right: 0px;
	top: 0px;
	width: 20px;
	height: 20px;
	line-height: 20px;
	font-size: 20px;
	text-align: center;
	color: #eee;
	cursor:pointer;
}
	</style>
  </head>
  
  <body>
<div id="qq-qun-float">
<div class="box">
<div class="filler">
<p class="header">
<img width="60" height="60" src="<%=basePath%>img/kf.png"  alt="健康咨询" /><br />
<span style="font-size: 18px; color: #f9f9f9;">健康咨询</span>
</p>
<p style="font-size: 20px;"><span class="col-green qq-qun-number">QQ:25598946</span></p>
<p style="padding: 0px;">验证消息：<span class="col-red">健康咨询</span></p>
<p>
<a class="qq-qun-link" style="display:inline-block; line-height:0px;" target="_blank" href="tencent://message/?uin=25598946&amp;Site=健康咨询&amp;Menu=yes">>
<img height="22" border="0" src="<%=basePath%>img/zxlogo.png"  alt="健康咨询" title="健康咨询"></a>
</p>
<span class="btn-close" id="btn-close-qq-qun">×</span>
</div>
</div>
</div>
  </body>
</html>
