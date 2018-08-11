$(document).ready(function() {
	var userid=getUrlParam('editid');
	// 页面展示
	PageInit(userid);
	
	// 保存
	$('#btsave').click(function() {
		$('#hideditid').val(userid);
		var index = parent.layer.getFrameIndex(window.name);
		var url = './user_edit.do';
		var params = {
			id : userid,
			loginname:$('#txtusername').val(),
			mobileno:$('#txtmobileno').val(),
			qq:$('#txtqq').val()
		};
		jQuery.post(url, params, user_editCallBack, 'json');
	})
	
	
	
	// 后退
	$('#btback').click(function() {
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
		//window.history.go(-1);
	})
})

function PageInit(userid)
{
	var url = './user_show.do';
	var params = {
		id : userid,
	};
	jQuery.post(url, params, user_showbackCallBack, 'json');
}
function user_showbackCallBack(data)
{
	$('#txtusername').textbox("setValue", data.loginname);
	$('#txtmobileno').textbox("setValue", data.mobileno);
	$('#txtqq').textbox("setValue", data.qq);
}

function user_editCallBack(data)
{
	if(data.resultcode=='000')
	{
	layer.alert('修改成功');
	setTimeout(function () { 
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
    }, 2000);
	
	}else
	{
		layer.alert('修改异常');
	}
}


