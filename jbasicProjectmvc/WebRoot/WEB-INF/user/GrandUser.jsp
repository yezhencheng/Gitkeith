<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>用户授权</title>
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
		<script type="text/javascript" src="<%=basePath%>user/granduser.js"></script>
	</head>

	<body style="width:400px;height:400px">
    <input type="hidden" id="hideditid" value=""/>
       <input type="hidden" id="hidpower" value=""/>
	<div class="easyui-panel" title="用户信息" style="width:400px;padding:5px 5px">
		<div style="margin: 20px 0;"></div>
			<div style="margin-bottom: 20px">
				<div>
				<span>用户名:</span>
				</div>
				<input id="txtusername" class="easyui-textbox" data-options="prompt:'输入用户名...'" style="width: 100%; height: 32px">
			</div>
			<div style="margin-bottom: 20px">
				<div>
					<span>角色:</span>
					<div id="alldiv">
					
					</div>
					
				</div>
			</div>
			
			<div>
				<a id="btsave" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" style="width: 40%; height: 32px">保存</a>
				<a id="btback" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" style="width: 40%; height: 32px">返回</a>
			</div>
</div>
	</body>
</html>
