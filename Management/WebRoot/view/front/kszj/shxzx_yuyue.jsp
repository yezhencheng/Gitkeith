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
		<script language="javascript" type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<script language="javascript" type="text/javascript" src="<%=basePath%>js/front/yuyue.js"></script> 
</head>

<body>
	<form  action="yuyue.do" method="post"  accept-charset="UTF-8">
	<input type="hidden"  id="id" value="${id}"/>
	<table>
	<tr>
	<td>科室:</td>
	<td><input type="text"  value="市呼吸中心"  readonly = "readonly"/></td>
	</tr>
	<tr>
	<td>专家:</td>
	<td><input type="text"  name="zhuanjia" value="${zjs.zhuanjia}"  readonly = "readonly"/></td>
	</tr>
	<tr>
	<td>职称:</td>
	<td><input type="text" name="zhicheng" value="${zjs.zhicheng}"  readonly = "readonly"/></td>
	</tr>
	<tr>
	<td>预约时间：</td>
	<td> <input type="text" name="time"  id="d241" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="Wdate" />
	</td>
	</tr>
	</table>
	  描述：<br/>
	 <textarea name="txt" rows="7" cols="38"></textarea><br/>
	 <button id="bt1" type="button" class="easyui-linkbutton" >预约</button>	
	 <button id="bt0" type="button" class="easyui-linkbutton" >取消</button>
	  </form>
	</body>
</html>
