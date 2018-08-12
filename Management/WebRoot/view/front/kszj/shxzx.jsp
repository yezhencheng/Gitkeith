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
		<script src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
		<script src="<%=basePath%>layer/layer.js"></script>
		<link href="<%=basePath%>easyui/themes/default/easyui.css" rel="stylesheet" />
		<script src="<%=basePath%>js/front/keshi.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/backstage/publichelper.js"></script>
		<style type="text/css">
		.Wrappers{
		height:500px;
		width:972px;
		margin: 16px auto;
		position:relative;
		}
		</style>
</head>

<body>
	<jsp:include flush="true" page="../inctop.jsp"></jsp:include>
	<div class="Wrappers">
	<div style="height: 50px">
			<span style="font-size: 12px;margin-left:40px">用户名：</span>
			<input id="username" class="easyui-textbox" data-options="prompt:'输入用户名...'" style="width: 10%; height: 32px">
			<a id="bt1" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" style="height: 32px">查询</a>
			<a id="doadd1" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">预约</a>	
		</div>
		<table id="dg" class="easyui-datagrid" title="用户列表" style="width: 100%; height: auto" data-options="
				pageSize: 3, 
        		pageList: [1,3,5],
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
				<th data-options="field:'id', sortable: true, hidden: true,align:'center'">
						主键
				</th>
				<th data-options="field:'img',width:fixWidth(0.1),align:'center',formatter:showImg">
						
					</th>
					<th data-options="field:'zhuanjia',align:'center',width:fixWidth(0.1)">
						姓名
					</th>
					<th data-options="field:'zhicheng',align:'center',width:fixWidth(0.1)">
						职称
					</th>
					<th data-options="field:'txt',align:'center',width:fixWidth(0.4)">
						简介
					</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="shxzx" items="${list}">
			<tr> 
			<td>${shxzx.id}</td>
			<td><img src="<%=basePath%>img/kszj/${shxzx.img}" style="width:200px,hight:100px;"></td>
			<td>${shxzx.zhuanjia}</td>
			<td>${shxzx.zhicheng}</td>
			<td>${shxzx.txt}</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	</body>
</html>
