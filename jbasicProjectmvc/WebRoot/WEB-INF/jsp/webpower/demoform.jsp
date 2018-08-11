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
/* Table Head */
#table-5 thead th {
	background-color: rgb(156, 186, 95);
	color: #fff;
	border-bottom-width: 0;
}

/* Column Style */
#table-5 td {
	color: #000;
}

/* Heading and Column Style */
#table-5 tr,#table-5 th {
	border-width: 1px;
	border-style: solid;
	border-color: rgb(156, 186, 95);
}

/* Padding and font style */
#table-5 td,#table-5 th {
	padding: 5px 10px;
	font-size: 12px;
	font-family: Verdana;
	font-weight: bold;
}

.divclass1 {
	width: 80%;
}
</style>

		<script type="text/javascript">
	$(document).ready(function() {
		$('#bt1').click(function() {
			$('#form1').attr('action', 'demofind.do');
			$('#form1').submit();
		})

		$('#bt2').click(function() {
			$('#form1').attr('action', 'demosession.do');
			$('#form1').submit();
		})

		$('#bt3').click(function() {
			$('#form1').attr('action', 'demojson.do');
			$('#form1').submit();
		})
	})
</script>
	</head>

	<body style="width: 100%">

		<div class="divclass1">
			<form id="form1" method="post">
				姓名：
				<input type="text" name="username" value="${pageview.username}" />
				<div style="width: 10px"></div>
				性别:
				<input type="radio" name="sex" value="-1" <c:if test="${pageview.sex==-1}">checked="true"</c:if>/>全部
				<input type="radio" name="sex" value="1" <c:if test="${pageview.sex==1}">checked="true"</c:if> />男
				<input type="radio" name="sex" value="0" <c:if test="${pageview.sex==0}">checked="true"</c:if>/>女
				<br/>
				学校名称:
				<select name="school">
					<option value="清华大学" <c:if test="${pageview.school=='清华大学'}">selected='selected' </c:if>>清华大学</option>
					<option value="北京小学" <c:if test="${pageview.school=='北京小学'}">selected='selected' </c:if>>北京小学</option>
					<option value="上海小学" <c:if test="${pageview.school=='上海小学'}">selected='selected' </c:if>>上海小学</option>
				</select>
				你本次选择的是：
				${pageview.school}
				<br/>
				你的SESSSION:
				${sessionScope.sessionmodel.username}
				
				<br>
				<br>
				<input id="bt1" type="button" value="查询" />
				<input id="bt2" type="button" value="C标签存取Session" />
				<input id="bt3" type="button" value="返回JSON" />
				<br />

				<table id="table-5" style="width: 80%">
					<thead>
						<th>
							姓名
						</th>
						<th>
							年龄
						</th>
						<th>
							性别
						</th>
						<th>
							学校
						</th>
					</thead>
					<c:forEach items="${formModel}" var="item">
						<tr>
							<td>
								${item.username}
							</td>
							<td>
								${item.age}
							</td>
							<td>
							<c:if test="${item.sex==1}">
								男
								</c:if>
						      <c:if test="${item.sex==0}">
								女
								</c:if>
							</td>
							<td>
								${item.school}
							</td>
						</tr>
					</c:forEach>
				</table>
		</div>
		</form>

		<div class="divclass2">

		</div>
	</body>
</html>
