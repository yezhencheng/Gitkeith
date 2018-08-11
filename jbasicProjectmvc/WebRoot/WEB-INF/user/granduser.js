$(document).ready(function() {
	var userid=getUrlParam('editid');
	// 页面展示
	PageInit(userid);
	
	
	 // 选中取消checkbox
	 $('#alldiv input[type="checkbox"]').change(function(){
		 showchecked();
	 })
	
	// 保存
	$('#btsave').click(function() {
		$('#hideditid').val(userid);
		var index = parent.layer.getFrameIndex(window.name);
		var url = './user_grandsave.do';
		var params = {
			id : userid,
			roleids:$('#hidpower').val()
		};
		jQuery.post(url, params, user_editCallBack, 'json');
	})
	
	
	
	// 后退
	$('#btback').click(function() {
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	})
})


function showchecked()
{
	var powerids="";
	$('#alldiv input[type="checkbox"]').each(function () {  
        if ($(this).is(':checked')) {  
        	powerids+=$(this).val()+",";  
        }  
    });  
	$('#hidpower').val(powerids);
}

function PageInit(userid)
{
	var url = './user_grandshow.do';
	var params = {
		id : userid,
	};
	$.ajax({
		type : "post",
		url : url,
		data : params,
		async : false,//取消异步
		success : user_showbackCallBack
	});
}
function user_showbackCallBack(data)
{
	$('#txtusername').textbox("setValue", data.userstr.loginname);
	var child='';
	var hidpower='';
	$.each(data.roleinfostr,function(){
		child+="<input type=\"checkbox\" value=\""+this.mainroleid+"\" />";
		child+="<span style=\"color: #0099FF;\">"+this.mainrolename+"</span>";
	
	});
	$('#alldiv').html(child);
	
	$.each(data.choosedstr,function(){
		$('input[value='+this.mainroleid+']').attr('checked','checked');
		hidpower+=this.mainroleid+',';
	})
	$('#hidpower').val(hidpower);
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


