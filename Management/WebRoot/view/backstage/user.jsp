<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

		<title>My JSP 'index.jsp' starting pag</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--<link rel="stylesheet" type="text/css" href="styles.css">-->
		<script language="JavaScript" src="<%=basePath%>js/front/jquery.min.js" type="text/javascript"></script>
		<script language="JavaScript" src="<%=basePath%>easyui/jquery.easyui.min.js" type="text/javascript"></script>
		<link href="<%=basePath%>easyui/themes/default/easyui.css" rel="stylesheet" />
		<script type="text/javascript" src="<%=basePath%>layer/layer.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/backstage/user.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/backstage/publichelper.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backstage/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backstage/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/backstage/css/thems.css"/>
</head>

<body>
<div style="height: 50px">
			<span style="font-size: 12px;margin-left:40px">用户名：</span>
			<input id="username" class="easyui-textbox" data-options="prompt:'输入用户名...'" style="width: 10%; height: 32px">
			<a id="bt1" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" style="height: 32px">查询</a>
		</div>
		<table id="dg" class="easyui-datagrid" title="用户列表" style="width: 100%; height: auto" data-options="
				pageSize: 2, 
        		pageList: [1,2,5],
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
				<th data-options="field:'username',width:fixWidth(0.1)">
						用户名
					</th>
					<th data-options="field:'sex',width:fixWidth(0.1)">
						性别
					</th>
					<th data-options="field:'birthday',width:fixWidth(0.2)">
						出生年月
					</th>
					<th data-options="field:'phone',width:fixWidth(0.1)">
						预留电话
					</th>
					<th data-options="field:'regtime',width:fixWidth(0.2)">
						注册日期
					</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="user" items="${list}">
			<tr> 
			<td>${user.username}</td>
			<td>${user.sex}</td>
			<td>${user.birthday}</td>
			<td>${user.phone}</td>
			<td>${user.regtime}</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<div id="tb" style="height: auto">
			<a id="doadd1" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
			<a id="doedit1" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
			<a id="dodelet1" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
			<a id="dorefresh1" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true">刷新</a>
		</div>
	</body>
</html>
