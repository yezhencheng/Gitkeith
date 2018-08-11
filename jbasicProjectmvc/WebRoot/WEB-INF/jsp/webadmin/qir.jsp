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
		<title>淘淘网</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="<%=basePath%>css/adminlogin.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=basePath%>js/easyui1.5/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/layer/layer.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			if($('#hid1').val()=="loginerror")
			{
				layer.alert('账号密码错误');
				
			}
		})
		</script>
		
	</head>
	
<body>
<div class="login_box">
   <input id="hid1" type="hidden" value=${isok} />
      <div class="login_l_img"><img src="<%=basePath%>/images/login-img.png" /></div>
      <div class="login">
          <div class="login_logo"><a href="#"><img src="<%=basePath%>/images/login_logo.png" /></a></div>
          <div class="login_name">
               <p>后台管理系统</p>
          </div>
          <form action="news_qirlogin.do" method="post">
              <input name="username" type="text"  value="用户名" onfocus="this.value=''" onblur="if(this.value==''){this.value='用户名'}">
              <span id="password_text" onclick="this.style.display='none';document.getElementById('password').style.display='block';document.getElementById('password').focus().select();" >密码</span>
<input name="password" type="password" id="password" style="display:none;" onblur="if(this.value==''){document.getElementById('password_text').style.display='block';this.style.display='none'};"/>
              <input value="登录" style="width:100%;" type="submit">
          </form>
      </div>
      <div class="copyright">淘淘网版权所有©2016-2020 技术支持电话：000-00000000</div>
</div>
</body>
</html>
