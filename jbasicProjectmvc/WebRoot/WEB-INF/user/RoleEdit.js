var id="";
$(document).ready(function() {
	id=getUrlParam('editid');
	// 进来初始化
	pageinit();
	// 根据ID进行还原
	loadpage(id);
	
	 
	 // 选中取消checkbox
	 $('#divfengqin input[type="checkbox"]').change(function(){
		 showchecked();
	 })
	 
	 // 点击保存
	 $('#btsave').click(function(){
//		 alert($('#hidpower').val());
		 dosave();
	 })
	 
	
	 
	 
	 // 后退
	$('#btback').click(function() {
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
		//window.history.go(-1);
	})
})


function showchecked()
{
	var powerids="";
	var showids="";
	$('#divfengqin input[type="checkbox"]').each(function () {  
        if ($(this).is(':checked')) {  
        	powerids+=$(this).val()+",";  
        	showids+=$(this).next().text()+",";
        }  
    });  
	$('#hidpower').val(powerids);
	$('#alreadydiv').html(showids);
}

function dosave()
{
	if($('#rolename').val()=='')
	{
		layer.alert('角色名不能为空');
		return;
	}
	if($('#content').val()=='')
	{
		layer.alert('备注不能为空');
		return;
	}
	
	var url = './user_roleupdate.do';
	var params={
			roleid:id,
			rolename : $('#rolename').val(),
			content:$('#content').val(),
			hidpower:$('#hidpower').val()
	};
	$.ajax({
		type : "post",
		url : url,
		data : params,
		async : false,//取消异步
		success : function(data){
			if(data.resultcode=='000')
			{
				layer.alert('保存成功');
			}
			else
			{
				layer.alert('保存异常');
			}
		}
	});	
}

// 初始化显示所有角色(由于数据不多)
function pageinit()
{
	var url = './user_rolelist.do';
	var params={
			tableaone : ''
	};
	$.ajax({
		type : "post",
		url : url,
		data : params,
		async : false,//取消异步
		success : function(data){
			// 拼组手风琴控件
		    var html="<div id=\"ca1\" class=\"easyui-accordion\" style=\"width: 100%; height: 300px;\">";
		    var father="";
		    $.each(data,function(){
		    	father+="<div id=\""+this.mainroleid+"\" title=\""+this.mainrolename+"\" data-options=\"iconCls:'icon-ok'\" style=\"overflow: auto; padding: 10px;\">";
		    	var child="";
		    	$.each(this.powerlist,function(){
		    		child+="<input type=\"checkbox\" value=\""+this.powerid+"\" />";
		    		child+="<span style=\"color: #0099FF;\">"+this.powername+"</span>";
		    	})
		    	father+=child;
		    	father+="</div>";
		    })
		    html+=father;
		    html+="</div>"
		    $('#divfengqin').html(html);
		    $.parser.parse($('#divfengqin'));  // 重新渲染
		    
//		    html+="<div id=\"iduser\" title=\"用户管理\" data-options=\"iconCls:'icon-ok'\" style=\"overflow: auto; padding: 10px;\">";
//			html+="<input type=\"checkbox\" value=\"1a\" />";
//			html+="<span style=\"color: #0099FF;\">用户管理</span>";
//			html+="</div>";
//			html+="</div>";
			// 手风琴控件默认关闭 
			//$("#ca1").accordion('getSelected').panel('collapse');
		
		}
	});	
}
function loadpage(id)
{
	var url = './user_roleshow.do';
	var params={
			id : id
	};
	$.ajax({
		type : "post",
		url : url,
		data : params,
		async : false,//取消异步
		success : function(data){
		$('#rolename').textbox("setValue", data.rolemodel.mainrolename);
		$('#content').textbox("setValue", data.rolemodel.content);
		// 选中手风琴控件
		var hidpower='';
		var powerstr='';
		$.each(data.powerlist,function(){
			var powerid=this.powerid;
			$('input[value='+powerid+']').attr('checked','checked');
			hidpower+=powerid+",";
			powerstr+=this.powername+",";
		})
		$('#alreadydiv').html(powerstr);
		$('#hidpower').val(hidpower);
		
		}
	});	
}


