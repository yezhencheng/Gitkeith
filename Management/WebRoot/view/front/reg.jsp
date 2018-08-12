<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'reg.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script language="JavaScript" src="<%=basePath%>js/front/jquery.min.js" type="text/javascript"></script>
		<script language="JavaScript" src="<%=basePath%>js/front/reg.js" type="text/javascript"></script>
		<!-- <link rel="stylesheet" type="text/css" href="styles.css"> -->
		<link href="<%=basePath%>css/front/public.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/front/reg.css" rel="stylesheet" type="text/css" />

	</head>

	<body>
	<input id="info" type="hidden" value="${info}"/>
	 <div class="header">
        <div class="desc">欢迎注册</div>
    </div>
     <div class="container">
		<form action="reg.do">
	<div class="register">
    		<!--用户名-->
    		<div class="register-box">
    			<!--表单项-->
    			<div class="box default">
    				<label for="userName">用&nbsp;户&nbsp;名</label>
    				<input name="username" type="text" id="userName" placeholder="请输入您的姓名" />
    				<i></i>
    			</div>
    			<!--提示信息-->
    			<div class="tip">
    				<i></i>
    				<span></span>
    			</div>
    		</div>
    		<!--设置密码-->
    		<div class="register-box">
    			<!--表单项-->
    			<div class="box default">
    				<label for="pwd">设 置 密 码</label>
    				<input name="password"  type="password" id="pwd" placeholder="建议至少两种字符组合" />
    				<i></i>
    			</div>
    			<!--提示信息-->
    			<div class="tip">
    				<i></i>
    				<span></span>
    			</div>
    		</div>
    		<!--确认密码-->
    		<div class="register-box">
    			<!--表单项-->
    			<div class="box default">
    				<label for="pwd2">确 认 密 码</label>
    				<input type="password" id="pwd2" placeholder="请再次输入密码" />
    				<i></i>
    			</div>
    			<!--提示信息-->
    			<div class="tip">
    				<i></i>
    				<span></span>
    			</div>
    		</div>
			<!--设置密码-->
    		<div class="register-box">
    			<!--设置邮箱-->
    			<div class="box default">
    				<label for="email">联 系 邮 箱 </label>
    				<input name="mail"  type="text" id="email" placeholder="请输入您的邮箱" />
    				<i></i>
    			</div>
    			<!--提示信息-->
    			<div class="tip">
    				<i></i>
    				<span></span>
    			</div>
    		</div>
    		<!--设置邮箱手机-->
    		<div class="register-box">
    			<!--表单项-->
    			<div class="box default">
    				<label for="mobile">手 机 号 码</label>
    				<input name="phone"  type="text" id="mobile" placeholder="请输入您的手机号" />
    				<i></i>
    			</div>
    			<!--提示信息-->
    			<div class="tip">
    				<i></i>
    				<span></span>
    			</div>
    		</div>
    		 <!--注册协议-->
    		<div class="register-box xieyi">
    			<!--表单项-->
    			<div class="box default">
    				<input type="checkbox" id="ck" />
    				<span>我已阅读并同意<a href="javascript:void(0)">《用户注册协议》</a></span>
    			</div>
    			<!--提示信息-->
    			<div class="tip">
    				<i></i>
    				<span></span>
    			</div>
    		</div>
    		<!--注册-->
    		<button id="btn">注册</button>
    	</div>
		</form>
		</div>
	</body>
</html>
