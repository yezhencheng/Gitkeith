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
		<title>广告管理</title>
		<link href="css/01-1-0-0.css" rel="stylesheet" />
		<link href="css/diBu.css" rel="stylesheet" />
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>layer/layer.js"></script>
		<script>
	$(document).ready(function() {
		$('#table1 a').click(function() {
			var id = $(this).attr('value');
			layer.open( {
				type : 2,
				title : '广告详细页',
				shadeClose : true,
				shade : 0.8,
				area : [ '800px', '90%' ],
				content : 'tableb_detaillist.action?id=' + id
			});
		})

	})
</script>

	</head>
	<body>
		<form id="formid" action="tableb_list.action" method="post">
			<div id="news-container">
				<p class="news-biaoti">
					当前位置：首页&nbsp;&#62;&nbsp;会员管理&nbsp;&#62;&nbsp;广告列表
				</p>
				<h1 class="biaoTi">
					广告列表
				</h1>
				<ul class="wenben">
					<li class="B">

					</li>
					<li>
						标题：
						<input class="q" id="tablebone" name="tablebone" value="${tablebone}" />
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
								标题
								</td>
								<th width="23%">
									照片
									</td>
									<th width="23%">
										简介
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
						<s:iterator value="tablebinfo_list" id="fe">
							<tr>
								<td>
									${fe.tablebone}
								</td>
								<td>
									<img alt="" src="<%=basePath%>${fe.imagepath}" width="100%" height="70px">
								</td>
								<td>
									${fe.tablebtwo}
								</td>
								<td>
									${fe.username}
								</td>
								<td>
									${fe.addtime}
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
