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
			var isnull = 0;
			$('#tablea').find('input').each(function() {
				var v = $(this).val();
				if (v == '') {
					isnull++;
				}
			})
			if (isnull > 0) {
				layer.msg('信息必须填写完整');
				return;
			}
			var array=new Array();
			
			var o=new Object();
			o.name=$('#ida').val();
			o.arrivalTime=$('#arraya').val();
			o.serviceTime=$('#servicea').val();
			array.push(o);
			
			o=new Object();
			o.name=$('#idb').val();
			o.arrivalTime=$('#arrayb').val();
			o.serviceTime=$('#serviceb').val();
			array.push(o);
			
			o=new Object();
			o.name=$('#idc').val();
			o.arrivalTime=$('#arrayc').val();
			o.serviceTime=$('#servicec').val();
			array.push(o);
			
			o=new Object();
			o.name=$('#idd').val();
			o.arrivalTime=$('#arrayd').val();
			o.serviceTime=$('#serviced').val();
			array.push(o);
			
			o=new Object();
			o.name=$('#ide').val();
			o.arrivalTime=$('#arraye').val();
			o.serviceTime=$('#servicee').val();
			array.push(o);
			
			var jsonstr = $.toJSON(array);
			//var url = '/centermanage/ActiveSeatAction!paycodeAjax.action';
			var url="/jbasicProject/tablefcfs_test.action";
			var param={
				jsonstr:jsonstr
			};
			jQuery.post(url,param,btCallBack,'json');
		})
	})
	

	

	
	function btCallBack(data) {
		var str = data.resultstr;
		var str_array = new Array();
		str_array = str.split(',');
		var i = 0;
		$('#showinfo').text("");
		
		mytime = setInterval(function() {
			showme()
		}, 2000);
		
		function showme() {
		if (i >=str_array.length)
		{
			clearInterval(mytime);
			return;
		}
		var htmlstr = str_array[i] + "</br>"
		layer.msg(str_array[i]);
		$('#showinfo').append(htmlstr);
		i++;
		}
	}

	
</script>
	</head>
	<body>
		<form action="" method="post">
			<input type="hidden" id="hidresult" name='hidresult' value="0"/>
			<div id="news-container">
				<p class="news-biaoti">
					当前位置：算法演示&nbsp;&#62;&nbsp;FCFS算法
				</p>
				<h1 class="biaoTi">
					FCFS算法
				</h1>
				<table id="tablea" width="100%" border="0" class="news4">
					<tbody>
						<tr>
							<td width="5%" class="new3-1">
								任务名称a：
							</td>
							<td width="10%">
								<input class="q" id="ida" name="ida" value="A" />
							</td>
							<td width="5%" class="new3-1">
								到达时间a：
							</td>
							<td width="10%">
								<input class="q" id="arraya" name="arraya"  value="0"  />
							</td>
							<td width="5%" class="new3-1">
								任务运转时间a：
							</td>
							<td width="10%">
								<input class="q" id="servicea" name="servicea" value="6"  />
							</td>
						</tr>
						<tr>
							<td width="5%" class="new3-1">
								任务名称b：
							</td>
							<td width="10%">
								<input class="q" id="idb" name="idb" value="B" />
							</td>
							<td width="5%" class="new3-1">
								到达时间b：
							</td>
							<td width="10%">
								<input class="q" id="arrayb" name="arrayb" value="2"  />
							</td>
							<td width="5%" class="new3-1">
								任务运转时间b：
							</td>
							<td width="10%">
								<input class="q" id="serviceb" name="serviceb" value="50" />
							</td>
						</tr>
						<tr>
							<td width="5%" class="new3-1">
								任务名称c：
							</td>
							<td width="10%">
								<input class="q" id="idc" name="idc" value="C" />
							</td>
							<td width="5%" class="new3-1">
								到达时间c：
							</td>
							<td width="10%">
								<input class="q" id="arrayc" name="arrayc" value="5" />
							</td>
							<td width="5%" class="new3-1">
								任务运转时间c：
							</td>
							<td width="10%">
								<input class="q" id="servicec" name="servicec" value="20"/>
							</td>
						</tr>
						<tr>
							<td width="5%" class="new3-1">
								任务名称d：
							</td>
							<td width="10%">
								<input class="q" id="idd" name="idd" value="D"/>
							</td>
							<td width="5%" class="new3-1">
								到达时间d：
							</td>
							<td width="10%">
								<input class="q" id="arrayd" name="arrayd" value="5" />
							</td>
							<td width="5%" class="new3-1">
								任务运转时间d：
							</td>
							<td width="10%">
								<input class="q" id="serviced" name="serviced" value="10" />
							</td>
						</tr>
						<tr>
						<td width="5%" class="new3-1">
								任务名称e：
							</td>
							<td width="10%">
								<input class="q" id="ide" name="ide" value="E"/>
							</td>
							<td width="5%" class="new3-1">
								到达时间e：
							</td>
							<td width="10%">
								<input class="q" id="arraye" name="arraye" value="12" />
							</td>
							<td width="5%" class="new3-1">
								任务运转时间e：
							</td>
							<td width="10%">
								<input class="q" id="servicee" name="servicee" value="40" />
							</td>
						</tr>
					</tbody>
				</table>
				<div style="margin-left: 20%; margin-top: 30px; width: 30%">
					<input id="btone" class="H" type="button" value="确认" />
				</div>
				<div id="showinfo"></div>
			</div>
		</form>
	</body>
</html>
