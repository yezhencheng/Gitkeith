$(document).ready(function() {
	var id=getUrlParam('editid');
//	$('#hideditid').val(userid);
	BindPower();
	
	PageInit(id);
	
	// 保存
	$('#btsave').click(function() {
		var index = parent.layer.getFrameIndex(window.name);
		var url = './user_poweredit.do';
		var params = {
			id : id,
			powerid:$('#txtpowerid').val(),
			powername:$('#txtpowername').val(),
			urlaction:$('#txturlaction').val(),
			powerfather:$('#dplpower1').combobox("getValue")
		};
		jQuery.post(url, params, user_powereditCallBack, 'json');
	})
	
	
	
	
	
	// 后退
	$('#btback').click(function() {
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
		//window.history.go(-1);
	})
})

function  BindPower()
{
	var url = './user_showleiyi.do';
	var params = {
	};
	$.ajax({ 
       type: "post", 
       url: url, 
       async:false, // 同步阻态false，异步true
       data: params,
       success: bindcombolxCallBack
	});
}
function bindcombolxCallBack(data)
{
	var cdata,json;
	cdata = [];
	$("#dplpower1").combobox("loadData", data); 
}


function PageInit(powerid)
{
	var url = './user_showpower.do';
	var params = {
		id : powerid,
	};
	jQuery.post(url, params, user_showpowerCallBack, 'json');
}
function user_showpowerCallBack(data)
{
	$('#txtpowerid').textbox("setValue", data.powerid);
	$('#txtpowername').textbox("setValue", data.powername);
	$('#txturlaction').textbox("setValue", data.urlaction);
	$('#dplpower1').combobox('select',data.powerfather);
}

function user_powereditCallBack(data)
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


