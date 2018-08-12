<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<title>My JSP 'inctop.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--<link rel="stylesheet" type="text/css" href="styles.css">-->
		<link href="<%=basePath%>css/front/public.css" rel="stylesheet" type="text/css" />
    	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/front/inctop.css">
		<script language="JavaScript" src="<%=basePath%>js/front/public.js" type="text/javascript"></script>
  </head>
  
  <body>
	 <div class="Wrap">
			<div class="Menu">
					<ul>
						   <li> <a id="index" href="javascript:void(0)">首页</a></li>
						   <li> <a id="keshi" href="javascript:void(0)" >科室专家</a></li>
						   <li> <a  href="javascript:void(0)">我的信息</a></li>
						   <li><a id="message" href="javascript:void(0)">留言板</a></li>
						   <li> <a id="backstage" target="_blank" href="javascript:void(0)">进入后台</a></li>
					 </ul>
			</div>
        </div>	
        <!--  弹出QQ聊天
        <a target="_bank" href="http://wpa.qq.com/msgrd?v=3&uin=25598946&site=qq&menu=yes">
		 <img border="0" src="http://wpa.qq.com/pa?p=2:25598946:52" alt="在线咨询" title="在线咨询"/></a>
		 -->
  </body>
</html>
