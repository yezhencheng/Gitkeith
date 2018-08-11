$(document).ready(function() {
	var pagenumber=getUrlParam('pagenumber');
	var pagesize=getUrlParam('pagesize');
	pageinit();
	// 保存
	$('#btsave').click(function() {
	
		var index = parent.layer.getFrameIndex(window.name);
		// 调用父页面的方法，iframeid1是父页面左侧菜单的id，
		//layerback为iframe1里面的函数
		dosave();
		
//		window.parent.iframeid1.window.layerback(pagenumber,pagesize); 
//		parent.layer.close(index);
	})
	// 后退
	$('#btback').click(function() {
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
		//window.history.go(-1);
	})
	
})

function dosave()
{
	var url = './user_save.do';
	var params = {
		loginname : $('#txtusername').val(),
		password: $('#txtpassword').val(),
		mobileno: $('#txtmobileno').val(),
		qq: $('#txtqq').val()
	};
	jQuery.post(url, params, User_saveCallBack, 'json');
}

function User_saveCallBack(data)
{
	if(data.resultcode=='000')
	{
		layer.alert('保存成功');// 非阻态延时
		pageinit();
	}else if(data.resultcode=='001')
	{
		layer.alert('用户已经存在');// 非阻态延时
	}
	else
	{
		layer.alert('保存错误');// 非阻态延时
	}
}

function pageinit()
{
	$('#txtusername').textbox("setValue", "");
	$('#txtpassword').textbox("setValue", "");
	$('#txtmobileno').textbox("setValue", "");
	$('#qq').textbox("setValue", "");
}


