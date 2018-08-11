<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     


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
		<title>XXXXXX</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easyui1.5/themes/default/easyui.css"></link>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easyui1.5/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
		<script type="text/javascript" src="<%=basePath%>js/easyui1.5/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/easyui1.5/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>layer/layer.js"></script>
		<script type="text/javascript" src="<%=path%>/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="<%=path%>/js/leibieadd.js"></script>

	</head>
	<body>
		<form id="newsadd" action="news_save.do" method="post">
		 <input id="hid1" type="hidden" value="${isok}" />
			<div style="margin: 20px 0;"></div>
			<div style="margin-bottom: 20px">
				<table>
					<tr>
						<td style="width: 10%">
							大类:
						</td>
						<td style="width: 20%">
							<input id="txtbigname" name="txtbigname" class="easyui-textbox" data-options="prompt:'大类...'"
								style="width: 100%; height: 32px">
						</td>
						<td style="width: 10%">
							描述:
						</td>
						<td style="width: 20%">
							<input id="txttypecontent" name="txttypecontent" class="easyui-textbox" data-options="prompt:'描述...'"
								style="width: 100%; height: 32px">
						</td>
						<td style="width: 20%">
							<a id="btbigadd" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
							style="width: 200px; height: 32px">添加大类</a>
						</td>
				    </tr>
				    <tr>
						<td style="width: 10%">
							所属大类:
						</td>
						<td style="width: 20%">
							<input id="dplpower1" name="dplpower1" class="easyui-combobox"
				data-options="editable:false,valueField:'bigid', textField:'bigname'" style="width: 100%;"
				value="--请选择--">
						</td>
						<td style="width: 5%">
							小类名称:
						</td>
						<td style="width: 20%">
							<input id="txtsmallname"   name="txtsmallname" class="easyui-textbox" data-options="prompt:'描述...'"
								style="width: 100%; height: 32px">
						</td>
						<td>
						<a id="btaddsmall" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
					style="width: 200px; height: 32px">添加小类</a>
						<a id="btback" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
					style="width: 200px; height: 32px">关闭</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>
