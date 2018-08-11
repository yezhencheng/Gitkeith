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
		<title>保养服务</title>
		<link href="css/01-1-0-0.css" rel="stylesheet" />
		<link href="css/diBu.css" rel="stylesheet" />
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
		<script>
		
		</script>
	</head>
	<body>
		<form action="tablef_add.action" method="post">
			<input type="hidden" id="hidresult" value="0"/>
			<div id="news-container">
				<p class="news-biaoti">
					当前位置：首页&nbsp;&#62;&nbsp;订单管理&nbsp;&#62;&nbsp;保养服务详情
				</p>
				<h1 class="biaoTi">
					保养服务详情
				</h1>
				<table width="28%" border="0" class="news4">
					<tbody>
						<tr>
							<td width="21%" class="new3-1">
								服务套餐名称：
							</td>
							<td width="79%">
								<s:property value="#request.tablefinfo_model.tablefone"/>
							</td>
						</tr>
						<tr>
							<td width="50%" class="new3-1">
								服务项目：
							</td>
							<td width="79%">
								<s:property value="#request.tablefinfo_model.tableftwo"/>
							</td>
						</tr>
						<tr>
							<td width="21%" class="new3-1">
								服务公司信息：
							</td>
							<td width="79%">
								<s:property value="#request.tablefinfo_model.tablefthree"/>
							</td>
						</tr>
						<tr>
						</tr>
					</tbody>
				</table>
				<div style="margin-left: 20%; margin-top: 30px; width: 30%">
				</div>
			</div>
		</form>
	</body>
</html>
