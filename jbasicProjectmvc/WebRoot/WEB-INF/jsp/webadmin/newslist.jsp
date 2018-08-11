<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>新闻管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easyui1.5/themes/default/easyui.css"></link>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easyui1.5/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
		<script type="text/javascript" src="<%=basePath%>js/easyui1.5/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/easyui1.5/jquery.easyui.min.js"></script>
	   <script type="text/javascript" src="<%=basePath%>js/layer/layer.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/publichelper.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/newslist.js"></script>
	</head>

	<body>
		<div style="height: 50px">
			<span style="font-size: 12px;margin-left:40px">标题：</span>
			<input id="txttitle" class="easyui-textbox" data-options="prompt:'输入标题...'" style="width: 10%; height: 32px">
			<a id="bt1" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" style="height: 32px">查询</a>
		</div>
		<table id="dg" class="easyui-datagrid" title="新闻列表" style="width: 100%; height: auto" data-options="
				iconCls: 'icon-edit',
				singleSelect: true,
				pagination:true,
				rownumbers: true,
				toolbar: '#tb',
				striped: true, //奇偶行是否区分,
				method: 'get'
			">
			<thead>
				<tr>
				<th data-options="field:'id', sortable: true, hidden: true">
						主键
				</th>
				<th data-options="field:'title',width:fixWidth(0.1)">
						标题
					</th>
					<th data-options="field:'typename',width:fixWidth(0.1)">
						类别
					</th>
					<th data-options="field:'datetime',width:fixWidth(0.1)">
						时间
					</th>
					<th data-options="field:'used',width:fixWidth(0.1),formatter:formatUsed">
						是否启用
					</th>
					<th data-options="field:'power',width:fixWidth(0.1)">
						排序
					</th>
						<th data-options="field:'point',width:fixWidth(0.1)">
						点击次数
					</th>
					

				</tr>
			</thead>
		</table>
		<div id="tb" style="height: auto">
			<a id="doadd1" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
			<a id="doedit1" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
			<a id="dodelet1" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
			<a id="dorefresh1" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true">刷新</a>
		</div>
	</body>
</html>
