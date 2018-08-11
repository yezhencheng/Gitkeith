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
		<title></title>
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
		$('#sendlink').click(function(){
			$('#tabledone').focus();
		})
	})</script>

	</head>
	<body>
		<form id="formid" action="tabled_add.action" method="post">
			<div id="news-container">
				<p class="news-biaoti">
					当前位置：首页&nbsp;&#62;&nbsp;论坛管理&nbsp;&#62;&nbsp;论坛
				</p>
				<h1 class="biaoTi">
					论坛
				</h1>
				<ul class="wenben">
					<li class="B">
						<input id="sendlink" class="H" type="button" value="发贴" />
					</li>
					<li class=""></li>
				</ul>
				<table id="table1" width="65%" height="90" border="1" class="yhgl">
					<tbody>
						<tr>
							<th width="50%">
								标题
								</td>
							<th width="10%">
								版块
								</td>
							<th width="21%">
								时间
								</td>
						</tr>
						<s:iterator value="tabledinfo_list" var="fe">
							<tr>
								<td>
									<a onclick=OpenWindow(this) src="tabled_detail.action?id=<s:property value='${fe.id}'/>">${fe.tabledone}</a>
								</td>
								<td>
									${fe.onetext}
								</td>
								<td>
									${fe.addtime}
								</td>
							</tr>
						</s:iterator>
						<tr>
							<td>
								<a href="javascript:void(0)">地球为什么是圆的？</a>
							</td>
							<td>
								地球版块
							</td>
							<td>
								2016-01-06
							</td>
						</tr>
						<tr>
							<td>
								xxxxxxxxxxxx
							</td>
							<td>
								xxxxxxxxxxxxxxxxx
							</td>
							<td>
								2016-01-06
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<textarea rows="10" cols="50" name="tabledone" id="tabledone"></textarea>
				<input class="H" type="submit" value="发布" />
			</div>
		</form>
	</body>
</html>
