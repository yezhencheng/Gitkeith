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
		<script type="text/javascript" src="<%=path%>/js/newsedit.js"></script>

	</head>
	<body>
		<form id="newsedit" action="news_edit.do" method="post">
		<input id="hidid" name="hidid" type="hidden" value="${hidid}" />
		 <input id="hid1" type="hidden" value="${isok}" />
		 <input id="hidbig" type="hidden" value="${news.bigid}" />
		  <input id="hidsmall" type="hidden" value="${news.typeid}" />
		  <input id="hidcontent" type="hidden" value="<c:out value="${news.contentutf}"/>"/>
		  
		  
		 
			<div style="margin: 20px 0;"></div>
			<div style="margin-bottom: 20px">
				<table>
					<tr>
						<td style="width: 5%">
							TITLE:
						</td>
						<td style="width: 20%">
							<input id="txttitle" name="txttitle" class="easyui-textbox" data-options="prompt:'输入标题...'"
								style="width: 100%; height: 32px" value=${news.title}>
						</td>
						<td style="width: 5%">
							KEYWORDS:
						</td>
						<td style="width: 20%">
							<input id="txtkeywords" name="txtkeywords" class="easyui-textbox" data-options="prompt:'关键词...'"
								style="width: 100%; height: 32px"  value=${news.keywords}>
						</td>
						<td style="width: 5%">
							description:
						</td>
						<td style="width: 20%">
							<input id="txtdescription"   name="txtdescription" class="easyui-textbox" data-options="prompt:'描述...'"
								style="width: 100%; height: 32px"  value=${news.description}>
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
							 <input id="dplpower1" name='dplpower1' class="easyui-combobox" data-options="valueField:'bigid',textField:'bigname',width:200,modal:true" >  
                            </input>  
					 <input id="dplpower2" name="dplpower2" class="easyui-combobox" data-options="valueField:'smallid',textField:'smallname',width:200,modal:true">  
                            </input>  
				
						</td>
						<td style="width: 5%">
							排序:
						</td>
						<td style="width: 20%">
							<input id="txtpower" name="txtpower" class="easyui-textbox" data-options="prompt:'排序权重...'"
								style="width: 100%; height: 32px" value=${news.power}>
						</td>
							<td>
						<a id="btback" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
					style="width: 100%; height: 32px">退出</a>
						</td>
						
					</tr>
				</table>
			</div>
			<textarea id="content" name="content"   ></textarea>
			<script type="text/javascript">
    var editor = null;
    window.onload = function(){
        editor = CKEDITOR.replace('content',{   
        	filebrowserImageUploadUrl : 'news_picture.do',  
        	language : 'zh-cn',  
        	});
        var ckEditor = CKEDITOR.instances.content;
        ckEditor.setData($('#hidcontent').val());
      
    }
</script>
		</form>
</body>
</html>
