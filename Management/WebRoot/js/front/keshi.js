$(document).ready(function() {
		// 点击查询
		$('#bt1').click(function() {
			var pagenumber = $('#dg').datagrid("options").pageNumber;
			var pagesize=$('#dg').datagrid("options").pageSize;
			querylist(pagenumber,pagesize);
		})
		
		// 点击编辑
		$('#doadd1').click(function() {
			var row = $('#dg').datagrid('getSelected');
			if (row != null) {
				var rowid = row.id;
				window.parent.layer.open( {
					type : 2,
					title : '预约',
					shadeClose : true,
					shade : 0.8,
					area : [ '30%', '50%' ],
					content : 'shxzx_yuyue.do?zjid=' + rowid	
				});
			} else {
				$.messager.alert('提示', "至少选择一行");
			}
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
	

// 弹出层回调函数
function layerback(pagenumber,pagesize) {
	alert('layerdo');
	querylist(pagenumber,pagesize);
}
// 刷新列表
function querylist(pagenumber,pagesize){
	var url = 'shxzx_ajax.do';
	var params = {
		username:$('#username').val(),
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


//图片展示
function showImg(value, row, index){
	var url="img/kszj/";
	if(row.img){
		return "<img style='width:80px;height:100px;align:center;' border='1' src='"+url+row.img+"' />";
	}
}

