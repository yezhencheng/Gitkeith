<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<title>My JSP 'index.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--<link rel="stylesheet" type="text/css" href="styles.css">-->
		<script language="JavaScript" src="<%=basePath%>js/front/jquery.min.js" type="text/javascript"></script>
		<script language="JavaScript" src="<%=basePath%>js/front/public.js" type="text/javascript"></script>
		<script language="javascript" type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<script language="JavaScript" src="<%=basePath%>js/front/login.js" type="text/javascript"></script>
		<link href="<%=basePath%>css/front/public.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/front/incbody.css" rel="stylesheet" type="text/css" />
		</head>
	<body>
		<jsp:include flush="true" page="inctop.jsp"></jsp:include>
		
	
		<div class="Wrappers">
		<!--用户登录 -->
		<form action="login.do" >
		<input id="userslog" type="hidden" value="${username}"/>
		<input id="info" type="hidden" value="${info}"/>
		<div class="login">
		<div>用户登录</div><br/>
		<c:choose>
		<c:when test="${empty username}">
		用户名：<input type="text" id="username" name="username"/><br/><br/>
		密&nbsp;码：<input type="password" id="password"  name="password"/><br/>
		<input type="hidden" value="${info}" id="info"/>
		<button id="btreg" type="button">注册</button>
		<button id="btlogin">登录</button>
		</c:when>
		<c:otherwise>
		欢迎您：<input type="text" id="username" name="username" value="${username}"  style="border:none;"/>
		<div id="timer">
		<script type="text/javascript">
		//非动态显示
		//document.getElementById('time1').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
		//动态显示
		setInterval("document.getElementById('timer').innerHTML='当前时间：'+new Date().toLocaleTimeString();",1000);
		</script>
		</div> <button id="btlogout" type="button">退出</button>
		</c:otherwise>
		</c:choose>
		</div>
		</form>
		<!--公告 -->
		<div class="public">
		<div>公告 </div>
		<c:forEach var="publicinit" items="${list}">
		<tr>
		<a  href="javascript:void(0)"><td>${publicinit.title}</td></a>
		</tr>
		</c:forEach>
		</div>
		<!--日历 -->
		<div  class="date">
		<div id="div1"></div>
		<script>
		WdatePicker({eCont:'div1',onpicked:function(dp){alert('你选择的日期是:'+dp.cal.getDateStr())}})
		</script>
		</div>
		<!--简介 -->
		<div class="brief">
		<div>医院简介</div>
		<img alt="医院简介" src="img/brief.png">
		</div>
		</div>
		<c:import url="rightdiv.jsp"></c:import>  
	</body>
</html>
