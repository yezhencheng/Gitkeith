$(document).ready(function() {
	// 页面展示
		PageInit();

		$("#dplpower1").combobox( {
			onChange : function(n, o) {
				var bigid = $('#dplpower1').combobox("getValue")
				dplpowerchange(bigid);
			}
		});

		// 保存
		$('#btsave').click(function() {
			if($('#txttitle').val()=="")
			{
				layer.alert('TITLE不能为空');// 非阻态延时
				return;
			}
			if($('#txtkeywords').val()=="")
			{
				layer.alert('keyword不能为空');// 非阻态延时
				return;
			}
			if($('#txtdescription').val()=="")
			{
				layer.alert('description不能为空');// 非阻态延时
				return;
			}
			if($('#dplpower2').combobox("getValue")=="--请选择--")
			{
				layer.alert('请选择小分类');// 非阻态延时
				return;
			}
			$('#newsadd').submit();//news_save
		})
		
		$('#btback').click(function(){
			window.location.href="news_redirect.do";
			
		})

	})

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
