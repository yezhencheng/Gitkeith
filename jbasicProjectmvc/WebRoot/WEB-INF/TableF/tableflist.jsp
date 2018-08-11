<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
		<script type="text/javascript" src="<%=basePath%>layer/layer.js"></script>
		<script>
	$(document).ready(function() {
		$('#table1 a').click(function(){
			var id = $(this).attr('value');
			layer.open({
				type : 2,
				title : '保养服务详细页',
				shadeClose : true,
				shade : 0.8,
				area : [ '800px', '90%' ],
				content : 'tablef_detaillist.action?id=' + id
					});
		})
	})
</script>

	</head>
	<body>
		<form id="formid" action="tablef_list.action" method="post">
			<div id="news-container">
				<p class="news-biaoti">
					当前位置：首页&nbsp;&#62;&nbsp;订单管理&nbsp;&#62;&nbsp;保养服务
				</p>
				<h1 class="biaoTi">
					保养服务列表
				</h1>
				<ul class="wenben">
					<li class="B">

					</li>
					<li>
						套餐名：
						<input class="q" id="tablefone" name="tablefone" value="${tablefone}" />
					</li>
					<li>
						发布人:
						<input class="q" id="username" name="username" value="${username}" />
					</li>
					<li class="B">
						<input class="H" type="submit" value="搜索" />
					</li>
					<li class=""></li>
				</ul>
				<table id="table1" width="65%" height="90" border="1" class="yhgl">
					<tbody>
						<tr>
							<th width="27%">
								保养服务套餐名
								</td>
								<th width="23%">
									服务项目
									</td>
									<th width="21%">
										发布人
										</td>
										<th width="21%">
											发布时间
											</td>
										<th width="29%">
											操作
											</td>
						</tr>
						<s:iterator value="tablefinfo_list" id="fe">
							<tr>
								<td>
									<s:property value="#fe.tablefone" />
								</td>
								<td>
									<s:property value="#fe.tableftwo" />
								</td>
								<td>
									<s:property value="#fe.username" />
								</td>
								<td>
									<s:property value="#fe.addtime" />
								</td>
								<td>
									<a value=<s:property value="#fe.id"/>>详情</a>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</form>
	</body>
</html>
