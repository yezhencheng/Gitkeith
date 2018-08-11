$(document).ready(function() {  
	// 进来初始化
	pageinit();
	// 点击添加(如果有没保存的行，先执行保存)
	$('#doadd1').click(function() {
		var pagenumber = $('#dg').datagrid("options").pageNumber;// 缓存一下当前页,layer回调用
		var pagesize=$('#dg').datagrid("options").pageSize;
		window.parent.layer.open( {
			type : 2,
			title : '角色添加',
			shadeClose : true,
			shade : 0.8,
			area : [ '80%', '90%' ],
			content : 'user/RoleAdd.jsp?pagenumber='+pagenumber+'&pagesize='+pagesize // iframe的url
		});
	})
	// 点击编辑
	$('#doedit1').click(function(){
		var row = $('#dg').datagrid('getSelected');
		if (row != null) {
			var rowid = row.mainroleid;
			window.parent.layer.open( {
				type : 2,
				title : '角色编辑',
				shadeClose : true,
				shade : 0.8,
				area : [ '80%', '90%' ],
				content : 'user/RoleEdit.jsp?editid=' + rowid
					});
		} else {
			$.messager.alert('提示', "至少选择一行");
		}
	})
	// 点击删除
	$('#dodelet1').click(function() {
		var row = $('#dg').datagrid('getSelected');
		if (row != null) {
			var rowid = row.mainroleid;
			deleteconfirm1(rowid);
		} else {
			$.messager.alert('提示', '至少选择一行');
		}
	})
	// 点击刷新
	$('#dorefresh1').click(function() {
		pageinit();
	})
})



// 初始化显示所有角色(由于数据不多)
function pageinit()
{
	var pagenumber = $('#dg').datagrid("options").pageNumber;
	var pagesize=$('#dg').datagrid("options").pageSize;
	querylist(pagenumber,pagesize);
}

//刷新列表
function querylist(pagenumber,pagesize) {
	var url = './user_rolelistinfo.do';
	var params = {
		pagenumber:pagenumber,
		pagesize:pagesize
	};
	jQuery.post(url, params, rolelistCallBack, 'json');
}

function rolelistCallBack(data)
{
	var datasource = {
			total : data.datacount,// 通过他计算总计多少页(控件自动算)
			rows : data.datalist   // 本页数据
		};
	var p = $('#dg').datagrid('getPager');
	$("#dg").datagrid('loadData', datasource);
}


function deleteconfirm1(mainroleid) {
	$.messager.confirm('删除', '你确认删除吗?', function(r) {
		if (r) {	
			var url = './user_deleterole.do';
			var params = {
				id:mainroleid
			};
			jQuery.post(url, params, deleteCallBack, 'json');
			
		}
	});
}
function deleteCallBack(data)
{
	if(data.resultcode=='000')
	{
		layer.alert('删除成功');
		// 刷新页面
		pageinit();
	}else
	{
		layer.alert('保存失败');
	}
}













