	$(document).ready(function(){
		
		$("a").click(function(){
		$(this).each(function(){
			var pageNum=$(this).attr("href");
			  $.ajax({  
		  	        url:'shxzx_ajax.do',  
		  	        type:'post', 
		  	        data: {
				  		pageNum: pageNum
		  	           },  // 参数text和参数value  
		  	        error:function() {  
		  	          alert(error);  
		  	        },    
		  	        success:function(data) {  
		  	      	var firstNum = pageNum - 2;
			    	var secondNum = pageNum -1;
			    	var thirdNum = pageNum;
			    	var fourthNum = pageNum + 1;
			    	var fifthNum = pageNum + 2;
			    	var prePage = pageNum - 1;
			    	var nextPage = pageNum + 1;
			    	if(pageNum < 4 || data.pages < 6){
			    		firstNum = 1;
				    	secondNum = 2;
				    	thirdNum = 3;
				    	fourthNum = 4;
				    	fifthNum = 5;
			    	}
			    	else if(pageNum > data.pages-2){
			    		firstNum = data.pages-4;
				    	secondNum = data.pages-3;
				    	thirdNum = data.pages-2;
				    	fourthNum = data.pages-1;
				    	fifthNum = data.pages;
			    	}
			    	if(data.isFirstPage){
			    		prePage = 1;
			    	}
			    	if(data.isLastPage ){
			    		nextPage = data.pages;
			    	}
		  	         
		  	      } });  
			  
		})
		})
	})