<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			$('#form1').attr('action', 'getform.do');
			$('#form1').submit();
		})

		$('#bt2').click(function() {
			$('#form1').attr('action', 'setform.do');
			$('#form1').submit();
		})
	})
</script>
	</head>

	<body style="width: 100%">

		<div class="divclass1">
			<form:form id="form1" modelAttribute="contentModel" method="post" action="getform.do">     
  	input 标签：<form:input path="username" />
				<br />
  	密码框：           <form:password path="password" />
				<br />
	checkbox:			<form:checkbox path="checkboxone" />
				<br />
				<form:checkbox path="checkarray" value="arrayItem 路人甲" />arrayItem 路人甲
        <form:checkbox path="checkarray" value="arrayItem 路人乙" />arrayItem 路人乙
        <form:checkbox path="checkarray" value="arrayItem 路人丙" />arrayItem 路人丙
        <form:checkbox path="checkarray" value="arrayItem 路人丁" />arrayItem 路人丁
        <br />
        	 绑定Array的checkboxs 标签：<br />
				<form:checkboxes path="selectarray" items="${contentModel.checkarray}" />
				<br />
绑定Array的checkboxs 标签(key,text不同的)：<br />
				<form:checkboxes path="selectc" items="${contentModel.choosemap}"  />
				<br />
				  绑定Map的radiobuttons 标签：<br/>
        <form:radiobuttons path="selectid" items="${contentModel.choosemap}"/><br/>

  用form:option绑定items的select 标签：<br/>
        <form:select path="selectid">  
            <option/>请选择人员
            <form:options items="${contentModel.choosemap}"/>  
        </form:select><br/>

				<input id="bt1" type="button" value="输出页面的值" />
				<input id="bt2" type="button" value="重置页面的值" />
			</form:form>
		</div>
		<div class="divclass2">
			input 标签值：${username}
			<br />
			密码框:${password}
			<br />
			文本框是否选中：${checkboxone}
			<br />
			多文本框选择值：${checkarray}
			<br />
			<br />
			这行是设定值，所以此处无值
			<br />
			<br />
			获取多项选择值：${choosearray}
				<br />
				<br />
		         获取radio的值：${selectid}		
		         <br />
				<br />
				获取select的值：这里不写了 就是那个selectid
		         

		</div>
	</body>
</html>
