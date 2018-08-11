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

		<title>模块管理</title>

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
		<script type="text/javascript" src="<%=basePath%>user/PowerList.js"></script>
	</head>

	<body>
		<div style="height: 100px">
			<span style="font-size: 12px">一级模块：</span>
			<input id="txtpowername1" class="easyui-textbox" data-options="prompt:'输入一级模块名称'"
				style="width: 10%; height: 32px">
			<a id="bt1" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search"
				style="height: 32px">添加</a>
			<div style="margin-top: 10px"></div>
			<span style="font-size: 12px;">二级模块名称：</span>
			<input id="dplpower1" name="dplpower1" class="easyui-combobox"
				data-options="editable:false,valueField:'powerid', textField:'powername'" style="width: 30%;"
				value="--请选择所属模块--">
			<input id="txtpowername2" class="easyui-textbox" data-options="prompt:'输入二级模块名称'"
				style="width: 10%; height: 32px; margin-left: 20px">
			<input id="txtactionurl" class="easyui-textbox" data-options="prompt:'输入二级模块action'"
				style="width: 10%; height: 32px; margin-left: 20px">
			<a id="bt2" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search"
				style="height: 32px">添加</a>
		</div>
		<table id="dg" class="easyui-datagrid" title="模块列表" style="width: 100%; height: auto"
			data-options="
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
					<th data-options="field:'id',title:'id',width:fixWidth(0.1)">
						id
					</th>
					<th data-options="field:'powerid',title:'powerid',width:fixWidth(0.1)">
						模块编码
					</th>
					<th data-options="field:'powername',title:'powername',width:fixWidth(0.2)">
						模块名称
					</th>
					<th data-options="field:'powerfather',title:'powerfather',width:fixWidth(0.1)">
						父模块编码
					</th>
					<th data-options="field:'powerfathername',title:'powerfathername',width:fixWidth(0.1)">
						所属父模块名称
					</th>
					<th data-options="field:'mokuaijibie',title:'mokuaijibie',width:fixWidth(0.1)">
						模块级别
					</th>
					<th data-options="field:'urlaction',title:'urlaction',width:fixWidth(0.4)">
						urlaction
					</th>
				</tr>
			</thead>
		</table>
		<div id="tb" style="height: auto">
			<a id="doedit1" href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true">修改</a>
			<a id="dodelet1" href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-remove',plain:true">删除</a>
			<a id="dorefresh1" href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-undo',plain:true">刷新</a>
		</div>
	</body>
</html>
