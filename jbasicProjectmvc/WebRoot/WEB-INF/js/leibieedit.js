$(document).ready(function() {
		$('#btaddsmall').click(function() {
			if($('#txtsmallname').val()=="")
			{
				layer.alert('小类名不能为空');// 非阻态延时
				return;
			}
			var url = './news_smalledit.do';
			var params = {
					id:$('#hid1').val(),
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
		layer.alert('修改成功');
		clean();
	}else
	{
		layer.alert('修改失败');
	}
}




function clean()
{

	$('#txtsmallname').textbox('setValue','');
}

