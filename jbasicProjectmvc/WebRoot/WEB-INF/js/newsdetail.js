$(document).ready(function() {
	// 页面展示
	PageInit();
		
	

})

function PageInit() {
	// 变色10
	$('#top1 a').eq(0).css("color","#FF6633");
	$('#top1 a').eq(1).css("color","#FEBEF2");
	$('#top1 a').eq(2).css("color","#08c");
	$('#top1 a').eq(3).css("color","#993d00");
	$('#top1 a').eq(4).css("color","#91F2BB");
	// 变图
	
	
	$('#downloaddd img').eq(0).attr("src","templets/new/images/index/icon_qstudio.png");
	$('#downloaddd img').eq(1).attr("src","templets/new/images/index/icon_snake.png");
	$('#downloaddd img').eq(2).attr("src","templets/new/images/index/icon_box.png");
	$('#downloaddd img').eq(3).attr("src","templets/new/images/index/icon_2048.png");
	$('#downloaddd img').eq(4).attr("src","templets/new/images/index/icon_stu.png");
	
	
}
