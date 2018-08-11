<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
  	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
      <!-- 引入JQuery -->
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <!-- 引入EasyUI -->
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <!-- 引入EasyUI的样式文件-->
    <link rel="stylesheet" href="easyui/themes/default/easyui.css" type="text/css"/>
    <!-- 引入EasyUI的图标样式文件-->
    <link rel="stylesheet" href="easyui/themes/icon.css" type="text/css"/>
     <link rel="stylesheet" href="css/login_normalize.min.css">
     <link href='css/login_style.css' rel='stylesheet' type='text/css'>
</head>

<body>
  <div class="wrapper">
  <form class="login" action="Login_login.action" method="post">
    <p  class="title">Log in</p>
    <input  class="easyui-validatebox" type="text" name="loginusername" placeholder="Username" autofocus/>
    <i class="fa fa-user"></i>
    <input  class="easyui-validatebox" type="password" name="loginpassword" placeholder="Password" />
    <i class="fa fa-key"></i>
    <a href="#">Forgot your password?</a>
    <button type="submit">
      <i class="spinner"></i>
      <span class="state">Log in</span>
    </button>
  </form>
</div>
</body>
</html>