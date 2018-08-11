<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>广告管理</title>
		<link href="css/01-1-0-0.css" rel="stylesheet" />
		<link href="css/diBu.css" rel="stylesheet" />
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
		<script>
	$(document).ready(function() {
		if ($('#hidresult').val() == "error001") {
			alert('2次密码不一致');
			return;
		}
		if ($('#hidresult').val() == "success") {
			alert('添加成功');
			return;
		}
	})
</script>
	</head>
	<body>
		<form action="tableb_add.action" enctype="multipart/form-data" method="post">
			<input type="hidden" id="hidresult" name="hidresult" value="0" />
			<div id="news-container">
				<p class="news-biaoti">
					当前位置：首页&nbsp;&#62;&nbsp;广告管理&nbsp;&#62;&nbsp;广告添加
				</p>
				<h1 class="biaoTi">
					广告添加
				</h1>
				<table width="28%" border="0" class="news4">
					<tbody>
						<tr>
							<td width="21%" class="new3-1">
								标题：
							</td>
							<td width="79%">
								<input class="q" id="tablebone" name="tablebone" />
							</td>
						</tr>
						<tr>
							<td width="21%" class="new3-1">
								内容：
							</td>
							<td width="79%">
								<textarea rows="5" cols="30" id="tablebtwo" name="tablebtwo"></textarea>
							</td>
						</tr>
						<tr>
							<td width="21%" class="new3-1">
								图片：
							</td>
							<td width="79%">
							   	<input type="file" name="upload" size="50" />
							</td>
						</tr>
						<tr>
							<td class="new3-1">
								分类
							</td>
							<td>
								<select style="" id="onevalue" name="onevalue">
									<s:iterator value="#request.typeinfo_list" id="db">
										<option value="${db.onevalue}" <s:if test="%{onevalue==#db.onevalue}">selected=selected</s:if>>
											${db.onetext}
										</option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<tr>
							<td width="21%" class="new3-1">
								联系方式：
							</td>
							<td width="79%">
								<input type="text" id="tablebthree" name="tablethree" />
							</td>
						</tr>
					</tbody>
				</table>
				<div style="margin-left: 20%; margin-top: 30px; width: 30%">
					<input class="H" type="submit" value="确认" />
				</div>
			</div>
		</form>
	</body>
</html>
