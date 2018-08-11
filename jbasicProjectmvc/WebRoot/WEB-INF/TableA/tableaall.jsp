<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>xxxxxxxxxxxx</title>
		<link href="css/01-1-0-0.css" rel="stylesheet" />
		<link href="css/diBu.css" rel="stylesheet" />
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/js/jquery.json-2.2.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/js/layer/layer.js"></script>
		<script>
	$(document).ready(function() {
		$('#btone').click(function() {
			//var jsonstr = $.toJSON(array);
			//var url = '/centermanage/ActiveSeatAction!paycodeAjax.action';
			var jsonstr="";
			var url="/jbasicProject/tablefcfs_showall.action";
			var param={
				jsonstr:jsonstr
			};
			jQuery.post(url,param,btCallBack,'json');
		})
	})
	

	

	
	function btCallBack(data) {
		$('#fcfs').append(data.resultone);
		$('#sjf').append(data.resulttwo);
		$('#lz').append(data.resultthree);
		$('#fc').append(data.resultfour);
		$('#gy').append(data.resultfive);
	}

	
</script>
	</head>
	<body>
		<form action="" method="post">
			<input type="hidden" id="hidresult" name='hidresult' value="0"/>
			<div id="news-container">
				<p class="news-biaoti">
					当前位置：算法演示&nbsp;&#62;&nbsp;显示所有结果
				</p>
				<h1 class="biaoTi">
					显示所有结果
				</h1>
				<table width="100%">
					<tr>
						<td>
							FCFS算法
						</td>
					</tr>
					<tr>
						<td id="fcfs"></td>
					</tr>
					<tr>
						<td>
							SJF算法
						</td>
					</tr>
					<tr>
						<td id="sjf"></td>
					</tr>
					<tr>
						<td>
							轮转算法
						</td>
					</tr>
					<tr>
						<td id="lz"></td>
					</tr>
					<tr>
						<td>
							反馈队列算法
						</td>
					</tr>
					<tr>
						<td id="fc"></td>
					</tr>
					<tr>
						<td>
							高优先级算法
						</td>
					</tr>
					<tr>
						<td id="gy"></td>
					</tr>

				</table>

				<div style="margin-left: 20%; margin-top: 30px; width: 30%">
					<input id="btone" class="H" type="button" value="显示" />
				</div>
				<div id="showinfo"></div>
			</div>
		</form>
	</body>
</html>
