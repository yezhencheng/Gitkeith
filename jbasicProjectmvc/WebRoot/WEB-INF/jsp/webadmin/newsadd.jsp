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
		<script type="text/javascript" src="<%=path%>/js/newsadd.js"></script>

	</head>
	<body>
		<form id="newsadd" action="news_save.do" method="post">
		 <input id="hid1" type="hidden" value="${isok}" />
			<div style="margin: 20px 0;"></div>
			<div style="margin-bottom: 20px">
				<table>
					<tr>
						<td style="width: 5%">
							TITLE:
						</td>
						<td style="width: 20%">
							<input id="txttitle" name="txttitle" class="easyui-textbox" data-options="prompt:'输入标题...'"
								style="width: 100%; height: 32px">
						</td>
						<td style="width: 5%">
							KEYWORDS:
						</td>
						<td style="width: 20%">
							<input id="txtkeywords" name="txtkeywords" class="easyui-textbox" data-options="prompt:'关键词...'"
								style="width: 100%; height: 32px">
						</td>
						<td style="width: 5%">
							description:
						</td>
						<td style="width: 20%">
							<input id="txtdescription"   name="txtdescription" class="easyui-textbox" data-options="prompt:'描述...'"
								style="width: 100%; height: 32px">
						</td>
						<td>
						<a id="btsave" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
					style="width: 100%; height: 32px">保存</a>
						</td>
					</tr>
					<tr>
					<td style="width: 5%">
							分类:
						</td>
						<td style="width: 20%" colspan="3">
								<input id="dplpower1" name="dplpower1" class="easyui-combobox"
				data-options="editable:false,valueField:'bigid', textField:'bigname'" style="width: 45%;"
				value="--请选择--">
				<input id="dplpower2" name="dplpower2" class="easyui-combobox"
				data-options="editable:false,valueField:'smallid', textField:'smallname'" style="width: 45%;"
				value="--请选择--">
						</td>
						<td style="width: 5%">
							排序:
						</td>
						<td style="width: 20%">
							<input id="txtpower" name="txtpower" class="easyui-textbox" data-options="prompt:'排序权重...'"
								style="width: 100%; height: 32px">
						</td>
							<td>
						<a id="btback" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
					style="width: 100%; height: 32px">退出</a>
						</td>
						
					</tr>
				</table>
			</div>
			<textarea id="content" name="content"></textarea>
			<script type="text/javascript">
    var editor = null;
    window.onload = function(){
        editor = CKEDITOR.replace('content',{   
        	filebrowserImageUploadUrl : 'news_picture.do',  
        	language : 'zh-cn',  
        	});
    }
</script>
		</form>
	</body>
</html>
