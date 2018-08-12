<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<script type="text/javascript" src="<%=basePath%>ckeditor/ckeditor.js"></script>		
		<link href="<%=basePath%>css/front/public.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/front/msg.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="<%=basePath%>js/front/msg.js" type="text/javascript"></script>
		</head>
	<body>
		<jsp:include flush="true" page="inctop.jsp"></jsp:include>
		<input id="info" type="hidden" value="${info}"/>
		<div id="msg">
            <form action="message_form.do" method="post">
            <textarea id="content" name="content"></textarea>
			<script type="text/javascript">
			    var editor = null;
			    window.onload = function(){
			        editor = CKEDITOR.replace('content',{   
			        	filebrowserImageUploadUrl : 'message_form.do',  
			        	language : 'zh-cn',  
			        	});
			     }
			 </script>       
           <button type="button">留言</button>
            </form>  
        </div>
		
	</body>
</html>
