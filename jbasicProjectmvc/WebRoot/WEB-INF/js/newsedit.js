$(document).ready(function() {
	   PageInit();
		
		 $('#dplpower1').combobox({  
			 valueField: 'bigid',
	         textField: 'bigname', 
	         url:'./news_showbig.do',
	         onSelect: function (record) {  
	                 var url = './news_showsmall.do?bigid='+record.bigid; 
	                 $('#dplpower2').combobox('reload', url); 
	                 $('#dplpower2').combobox('clear'); 
	             
	         },
		 	 onLoadSuccess:function(){
	    		 $('#dplpower1').combobox('setValues',$('#hidbig').val());
	    		 $('#dplpower2').combobox('setValues',$('#hidsmall').val());
             }
	         
         }); 
		 $('#dplpower2').combobox({  
			 valueField: 'smallid',
	         textField: 'smallname'
	         
		 });  
		 
		// 保存
		$('#btsave').click(function() {
			if($('#txttitle').val()=="")
			{
				layer.alert('TITLE不能为空');// 非阻态延时
				return;
			}
			if($('#txtkeywords').val()=="")
			{
				layer.alert('keyword不能为空');// 非阻态延时
				return;
			}
			if($('#txtdescription').val()=="")
			{
				layer.alert('description不能为空');// 非阻态延时
				return;
			}
			if($('#dplpower2').combobox("getValue")=="")
			{
				layer.alert('请选择小分类');// 非阻态延时
				return;
			}
			$('#newsedit').submit();//news_save
		})
		
		$('#btback').click(function(){
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
			
		})
	})

function PageInit() {
	if($('#hid1').val()=="saveok")
	{
		layer.alert('保存成功');// 非阻态延时
	}
	if($('#hid1').val()=="updateok")
	{
		parent.showlater("修改成功");
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
		
	}
}
