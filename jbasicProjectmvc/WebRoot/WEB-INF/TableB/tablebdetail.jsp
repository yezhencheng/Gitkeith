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
		<title>求购信息</title>
		<link href="css/01-1-0-0.css" rel="stylesheet" />
		<link href="css/diBu.css" rel="stylesheet" />
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
		<script>
		
		</script>
	</head>
	<body>
		<form action="tablea_add.action" method="post">
			<input type="hidden" id="hidresult" value="0" />
			<div id="news-container">
				<p class="news-biaoti">
					当前位置：首页&nbsp;&#62;&nbsp;会员管理&nbsp;&#62;&nbsp;广告明细
				</p>
				<h1 class="biaoTi">
					广告明细
				</h1>
				<table width="28%" border="0" class="news4">
					<tbody>
						<tr>
							<td width="40%" class="new3-1">
								标题：
							</td>
							<td width="60%">
								<s:property value="#request.tablebinfo_model.tablebone" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<img alt="" src=<%=basePath%><s:property value="#request.tablebinfo_model.imagepath"/> width="200px" height="100px">
							</td>
						</tr>

						<tr>
							<td width="50%" class="new3-1">
								内容：
							</td>
							<td width="79%">
								<s:property value="#request.tablebinfo_model.tablebtwo" />
							</td>
						</tr>
						<tr>
							<td width="21%" class="new3-1">
								联系方式：
							</td>
							<td width="79%">
								<s:property value="#request.tablebinfo_model.tablebthree" />
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
