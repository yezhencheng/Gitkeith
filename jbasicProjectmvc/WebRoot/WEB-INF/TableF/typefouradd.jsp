<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>服务类型添加</title>
		<link href="css/01-1-0-0.css" rel="stylesheet" />
		<link href="css/diBu.css" rel="stylesheet" />
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
		<script>
		$(document).ready(function() {
		if ($('#hidresult').val() =="success") {
			alert('添加成功');
			return;
		}
	})
		</script>
	</head>
	<body>
		<form action="tablef_addtype.action" method="post">
			<input type="hidden" id="hidresult" name='hidresult' value="0"/>
			<div id="news-container">
				<p class="news-biaoti">
					当前位置：首页&nbsp;&#62;&nbsp;订单管理&nbsp;&#62;&nbsp;服务类型添加
				</p>
				<h1 class="biaoTi">
					服务类型添加
				</h1>
				<table width="80%" border="0" class="news4">
					<tbody>
						<tr>
							<td width="50%" class="new3-1">
								服务套餐名称：
							</td>
							<td width="50%">
								<input class="q" id="onetext" name="onetext" />
							</td>
						</tr>
					</tbody>
				</table>
				<div style="margin-left: 20%; margin-top: 30px; width: 30%">
					<input class="H" type="submit" value="添加" />
				</div>
				<br/>
					<table id="table1" width="65%" height="90" border="1" class="yhgl">
					<tbody>
						<tr>
							<th width="40%">
								服务类型添加
								</td>
								<th width="40%">
								操作
								</td>
						</tr>
						<s:iterator value="typeinfo_list" id="fe">
							<tr>
								<td>
									<s:property value="#fe.onetext" />
								</td>
								<td>
									<a href="tablef_deletetype.action?id=<s:property value="#fe.onevalue"/>">删除</a>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</form>
	</body>
</html>
