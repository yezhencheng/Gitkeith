$(document).ready(function() {
		// 页面展示
		PageInit();

		// 保存
		$('#btbigadd').click(function() {
			if($('#txtbigname').val()=="")
			{
				layer.alert('类名不能为空');// 非阻态延时
				return;
			}
			var url = './news_addbig.do';
			var params = {bigname:$('#txtbigname').val()};
			$.ajax( {
				type : "post",
				url : url,
				data : params,
				async : false,// 取消异步
				success : addbigCallBack
			});
		})
		
		$('#btaddsmall').click(function() {
			if($('#txtsmallname').val()=="")
			{
				layer.alert('小类名不能为空');// 非阻态延时
				return;
			}
			if($('#dplpower1').combobox("getValue")=='--请选择--'||$('#dplpower1').combobox("getValue")=='')
			{
				layer.alert('请选择大类');// 非阻态延时
				return;
			}
			var url = './news_addsmall.do';
			var params = {
					bigid:$('#dplpower1').combobox("getValue"),
					smallname:$('#txtsmallname').val()
					};
			$.ajax( {
				type : "post",
				url : url,
				data : params,
				async : false,// 取消异步
				success : addsmallCallBack
			});
		})
		
		$('#btback').click(function(){
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
			
		})

	})
	
function addbigCallBack(data)
{
	if(data.resultcode=='000')
	{
		layer.alert('添加成功');
		clean();
		var url = './news_showbig.do';
		var params = {};
		$.ajax( {
			type : "post",
			url : url,
			data : params,
			async : false,// 取消异步
			success : showbigCallBack
		});
	}else
	{
		layer.alert('添加失败');
	}
}
function addsmallCallBack(data)
{
	if(data.resultcode=='000')
	{
		layer.alert('添加成功');
		clean();
	}else
	{
		layer.alert('添加失败');
	}
}




function clean()
{
	$('#txtbigname').textbox('setValue','');
	$('#txtsmallname').textbox('setValue','');
}

function PageInit() {
	if($('#hid1').val()=="saveok")
	{
		layer.alert('保存成功');// 非阻态延时
	}
	
	var url = './news_showbig.do';
	var params = {};
	$.ajax( {
		type : "post",
		url : url,
		data : params,
		async : false,// 取消异步
		success : showbigCallBack
	});
}
function showbigCallBack(data) {
	$("#dplpower1").combobox("loadData", data);
}

function dplpowerchange(bigid) {
	var url = './news_showsmall.do';
	var params = {
		bigid : bigid
	};
	$.ajax( {
		type : "post",
		url : url,
		data : params,
		async : false,// 取消异步
		success : showsmallCallBack
	});
}

function showsmallCallBack(data) {
	$("#dplpower2").combobox("loadData", data);
}
