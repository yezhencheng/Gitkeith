<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
		<style type="text/css">
.divclass1 {
	height: 100%;
	width: 45%;
	float: left;
}

.divclass2 {
	height: 100%;
	width: 45%;
	float: left;
}
</style>

		<script type="text/javascript">
	$(document).ready(function() {
		$('#bt1').click(function() {
			$('#form1').attr('action', 'jstlform1.do');
			$('#form1').submit();
		})

		$('#bt2').click(function() {
			$('#form1').attr('action', 'jstlform2.do');
			$('#form1').submit();
		})
	})
</script>
	</head>

	<body style="width: 100%">

		<div class="divclass1">
			<form id="form1" action="">
				jstl简单输出： ${contentModel.username}
				<br />
				<c:if test="${contentModel.count>5}" var="info">  
    大于5这个值为：${contentModel.count}
</c:if>
<br />
choose标签的使用方法：
<c:choose>  
    <c:when test="${contentModel.count>60}">  
 		优秀
    </c:when>  
     <c:when test="${contentModel.count<40}">  
   差
    </c:when>  
    <c:otherwise>  
       一般
    </c:otherwise>  
</c:choose>  
<br/>
C标签循环：
 <c:forEach var="item" items="${contentModel.userlist}" >  
 login:  ${item.loginname}  username: ${item.username} <br/>
 </c:forEach>  

<br/> 
forToken主要用来分隔字符串:
<c:forTokens items="${contentModel.username}" delims="," var="item">
${item},

</c:forTokens>
<br/> 


   



			</form>

		</div>
		<div class="divclass2">

		</div>
	</body>
</html>
