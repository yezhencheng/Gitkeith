<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--<link rel="stylesheet" type="text/css" href="styles.css">-->
	</head>
	<body>
		<form  method="post" action="User_list.action">
		用户名：<input  name="username"/><br/>
		密  &nbsp 码：<input name="password"/>
		<input type="submit" value="查询"/>
	
		<table id="table1" width="65%" height="90" border="1" class="yhgl">
					<tbody>
						<tr>
							<th width="27%">
								用户名
								</td>
									<th width="21%">
										密码
										</td>
						</tr>
						<s:iterator value="#request.user_list" id="fe">
							<tr>
								<td>
									${fe.username}
								</td>
								<td>
									${fe.password}
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
		</form>
	</body>
</html>