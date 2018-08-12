	$(document).ready(function(){
		   var info=$('#info').val();
		   var str1="";
		   var str2=" ";
		   var str3=null;
		   var str4=undefined;
			if(info==str1||info==str2||info==str3||info==str4){
			
			}else{
				alert(info);
			}
			var url=window.location.href;
			if(url=='http://localhost:8080/Management/'){
			window.location.href='publicinit.do';
				}
			
		$("#btreg").click(function(){
		    var iWidth=720;                          //弹出窗口的宽度; 
	        var iHeight=600;                         //弹出窗口的高度; 
			var iTop=( window.screen.availHeight -30 -iHeight)/2; //获得窗口的垂直位置  
			var iLeft=(window.screen.availWidth - 10 -iWidth)/2; //获得窗口的水平位置 
			window.open ("view/front/reg.jsp", "newwindow", 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no');
			  });
		
		$("#btlogin").click(function()
			 {
		      $('form').submit();
			});
		$("#btlogout").click(function()
				 {	
						window.location.href='logout.do';
						//window.history.back(-1);//返回上一页
				 });
		
	});