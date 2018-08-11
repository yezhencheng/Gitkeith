$(document).ready(function() {
	var pagenumber=getUrlParam('pagenumber');
	var pagesize=getUrlParam('pagesize');
	pageinit();
	// 保存一级菜单
	$('#bt1').click(function() {
		var index = parent.layer.getFrameIndex(window.name);
		dosave1();
		
	})
	// 保存二级菜单
	$('#bt2').click(function(){
		dosave2();
	})
	
	// 点击删除
	$('#dodelet1').click(function(){
		var row = $('#dg').datagrid('getSelected');
		if (row != null) {
			var rowid = row.id;
			deleteconfirm1(rowid);
		} else {
			$.messager.alert('提示', '至少选择一行');
		}
	})
	
	
	
	// 点击刷新
		$('#dorefresh1').click(function() {
			var pagenumber = $('#dg').datagrid("options").pageNumber;
			var pagesize=$('#dg').datagrid("options").pageSize;
			querylist(pagenumber,pagesize);
		})
		
		// 点击编辑
		$('#doedit1').click(function() {
			var row = $('#dg').datagrid('getSelected');
			if (row != null) {
				var rowid = row.id;
				window.parent.layer.open( {
					type : 2,
					title : '权限编辑',
					shadeClose : true,
					shade : 0.8,
					area : [ '450px', '90%' ],
					content : 'user/PowerEdit.jsp?editid=' + rowid
						});
			} else {
				$.messager.alert('提示', "至少选择一行");
			}
		})
		
		
	
	// 后退
	$('#btback').click(function() {
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
		// window.history.go(-1);
	})
	
})

function deleteconfirm1(rowid)
{
	$.messager.confirm('删除', '你确认删除吗?', function(r) {
		if (r) {
			var url = './user_deletepower.do';
			var params = {
				id : rowid
			};
			jQuery.post(url, params, user_deletepowerCallBack, 'json');
		}
	});
}

function user_deletepowerCallBack(data)
{
	if(data.resultcode=='000')
	{
		layer.alert('删除成功');
		// 刷新页面
		var pagenumber = $('#dg').datagrid("options").pageNumber;
		var pagesize=$('#dg').datagrid("options").pageSize;
		querylist(pagenumber,pagesize);
	}else
	{
		layer.alert('删除失败');
	}
}



function dosave1()
{
	if($('#txtpowername1').val()=="")
	{
		layer.alert('权限名不能为空');
		return;
	}
	
	var url = './user_power1save.do';
	var params = {
		powername: $('#txtpowername1').val()
	};
	jQuery.post(url, params, User_power1save, 'json');
}

function dosave2()
{
	if($('#txtpowername2').val()=="")
	{
		layer.alert('二级名称不能为空');
		return;
	}
	if($('#txtactionurl').val()=="")
	{
		layer.alert('actionurl不能为空');
		return;
	}
	if($('#dplpower1').combobox("getValue")=='--请选择所属分类--')
	{
		layer.alert('必须选择一级分类');
		return;
	}
	if($('#dplpower1').combobox("getValue")=="0")// 一级菜单根节点不可以当成二级菜单主节点
	{
		layer.alert('根节点不能作为二级菜单');
		return;
	}
	
	var url = './user_power2save.do';
	var params = {
		powerid : $('#dplpower1').combobox("getValue"),
		powername:$('#txtpowername2').val(),
		urlaction:$('#txtactionurl').val()
	};
	jQuery.post(url, params, user_power2saveCallback, 'json');
}

function User_power1save(data)
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
function user_power2saveCallback(data)
{
	if(data.resultcode=='000')
	{
		layer.alert('保存成功');// 非阻态延时
		pageinit();
	}else if(data.resultcode=='001')
	{
		layer.alert('二级编码已经存在');// 非阻态延时
	}
	else
	{
		layer.alert('保存错误');// 非阻态延时
	}
}

function pageinit()
{
	$('#txtpowername1').textbox("setValue", "");
	$('#txtpowername2').textbox("setValue", "");
	$('#txtactionurl').textbox("setValue", "");
	bindcombolx();
	var pagenumber = $('#dg').datagrid("options").pageNumber;
	var pagesize=$('#dg').datagrid("options").pageSize;
	querylist(pagenumber,pagesize);
	
}

// 刷新列表
function querylist(pagenumber,pagesize) {
	var url = './user_powerlist.do';
	var params = {
			pagenumber:pagenumber,
			pagesize:pagesize
	};
	jQuery.post(url, params, paycodeAjaxCallBack, 'json');
}
function paycodeAjaxCallBack(data) {
	// alert(data);
	
	var datasource = {
			total : data.datacount,// 通过他计算总计多少页(控件自动算)
			rows : data.datalist   // 本页数据
		};
	var p = $('#dg').datagrid('getPager');
	$("#dg").datagrid('loadData', datasource);
}






function bindcombolx()
{
	var url = './user_showleiyi.do';
	var params = {
	};
	jQuery.post(url, params, bindcombolxCallBack, 'json');

}
function bindcombolxCallBack(data)
{
	var cdata,json;
	cdata = [];
	// json = '[{"powerid":"年计划","powername":"年计划","selected":true}]';
	// cdata = $.parseJSON(data);
	$("#dplpower1").combobox("loadData", data); 
}


