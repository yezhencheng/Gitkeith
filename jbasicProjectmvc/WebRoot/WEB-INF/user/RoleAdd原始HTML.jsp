<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>角色添加</title>
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
		<script type="text/javascript" src="<%=basePath%>user/PowerAdd.js"></script>
	</head>

	<body style="width: 100%; height: 400px">
		<div class="easyui-panel" title="角色添加" style="width: 100% padding :     5px 5px">
			<div style="margin: 20px 0;"></div>
			<div style="margin-bottom: 20px">
				<div>
					<span>角色名:</span>
				</div>
				<input class="easyui-textbox" data-options="prompt:'输入角色名...'" style="width: 100%; height: 32px">
			</div>
			<div>
				<div>
					<span>描述:</span>
				</div>
				<input class="easyui-textbox" data-options="prompt:'输入角色描述...'" style="width: 100%; height: 32px">
			</div>

			<div>
				<h3 style="color: #0099FF;">
					已经有的权限：
				</h3>
				权限A,权限B
			</div>
			<h3 style="color: #0099FF;">
					授权：
			</h3>
			
			<div id="ca1" class="easyui-accordion" style="width: 100%; height: 300px;">
				<div id="iduser" title="用户管理" data-options="iconCls:'icon-ok'" style="overflow: auto; padding: 10px;">
					<input type="checkbox" value="1a" />
					<span style="color: #0099FF;">用户管理</span>
					<input type="checkbox"  value="2a"/>
					<span style="color: #0099FF;"> 权限管理 </span>
					<input type="checkbox" value="3a" />
					<span style="color: #0099FF;" > 功能A </span>
				</div>
				<div  id="sysuser" title="系统管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
					<input type="checkbox" value="1b" />
					<span style="color: #0099FF;" >用户管理B</span>
					<input type="checkbox" value="2b"/>
					<span style="color: #0099FF;">权限管理B</span>
					<input type="checkbox" value="3b"/>
					<span style="color: #0099FF;">功能B</span>
				</div>
			</div>
			<div style="padding: 10px;">
			</div>
			<div>
				<a id="btsave" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" style="width: 40%; height: 32px">保存</a>
				<a id="btback" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" style="width: 40%; height: 32px">返回</a>
			</div>
		</div>
	</body>
</html>
