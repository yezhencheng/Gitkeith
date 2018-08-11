$(document).ready(function() {
		// 点击查询
		$('#bt1').click(function() {
			var pagenumber = $('#dg').datagrid("options").pageNumber;
			var pagesize=$('#dg').datagrid("options").pageSize;
			querylist(pagenumber,pagesize);
		})
		// 点击大类
		$('#doadd1').click(function() {
			window.parent.layer.open( {
				type : 2,
				title : '大类添加',
				shadeClose : true,
				shade : 0.8,
				area : [ '100%', '100%' ],
				content : 'news_addtyperedirect.do'
			});
		})	
		
		// 点击编辑
		$('#doedit1').click(function() {
			var row = $('#dg').datagrid('getSelected');
			if (row != null) {
				var rowid = row.id;
				window.parent.layer.open( {
					type : 2,
					title : '类别编辑',
					shadeClose : true,
					shade : 0.8,
					area : [ '100%', '100%' ],
					content : 'news_editleibie.do?editid=' + rowid	
				});
			} else {
				$.messager.alert('提示', "至少选择一行");
			}
		})
		// 点击删除
		$('#dodelet1').click(function() {
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
		// 翻页事件
		var p = $('#dg').datagrid('getPager'); 
        $(p).pagination({ 
        	onSelectPage:function(pageNumber,pageSize){
        	    $('#dg').datagrid("options").pageNumber=pageNumber;// 必须加,否则在点击查询按钮的时候pagenumber不是最新的
        		querylist(pageNumber,pageSize);
        	},
        	beforePageText: '第',// 页数文本框前显示的汉字
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        }); 
	})
	
	
	


// val此列的值，row当前行，index当前索引
function formatOper(val,row,index){  
    return '<a href="javascript:void(0)" onclick="GrandUser('+index+')">授权</a>';  
}

//val此列的值，row当前行，index当前索引
function formatUsed(val,row,index){  
	 if(val=='0'){
         return "启用";
     }else
     {
    	 return "停用";
     }
}

function GrandUser(index)
{
	$('#dg').datagrid('selectRow',index);// 关键在这里  
	var row = $('#dg').datagrid('getSelected');  
	window.parent.layer.open( {
		type : 2,
		title : '用户授权',
		shadeClose : true,
		shade : 0.8,
		area : [ '450px', '90%' ],
		content : 'user/GrandUser.jsp?editid=' + row.id
	});
}






// 弹出层回调函数
function layerback(pagenumber,pagesize) {
	alert('layerdo');
	querylist(pagenumber,pagesize);
}
// 刷新列表
function querylist(pagenumber,pagesize) {
	var url = './news_leibielist.do';
	var params = {
		smallname : $('#txtsmallname').val(),
		pagenumber:pagenumber,
		pagesize:pagesize
	};
	jQuery.post(url, params, paycodeAjaxCallBack, 'json');
}

function paycodeAjaxCallBack(data) {	
	var datasource = {
			total : data.datacount,// 通过他计算总计多少页(控件自动算)
			rows : data.datalist   // 本页数据
		};
	var p = $('#dg').datagrid('getPager');
	$("#dg").datagrid('loadData', datasource);
}

function deleteItem(id) {
	var url = './tablea_deleteitem.action';
	var params = {
		id : 'id'
	};
	jQuery.post(url, param, deleteItemAjaxCallBack, 'json');
}

function deleteItemAjaxCallBack(data) {
	if (data.result) {
		querylist();
	}
}

function deleteconfirm1(rowid) {
	$.messager.confirm('删除', '你确认删除吗?', function(r) {
		if (r) {
			var url = './news_deleteleibie.do';
			var params = {
				id : rowid
			};
			jQuery.post(url, params, user_deleteCallBack, 'json');
		}
	});
}
function user_deleteCallBack(data)
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
