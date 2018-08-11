$(document).ready(function(){
	// 点击左侧菜单弹出tabs
	$('#leftmenu1').find('a').click(function(){
		var url=$(this).attr('way');
		var tabsname=$(this).html();
		var iframeid1=$(this).attr('iframeid');
		tianjia(tabsname,url,iframeid1);
	})
})



function buildIframe(url,tabsname,iframeid1)
{
var iframeurl="<div  title='"+tabsname+"' style='padding: 1px' data-options='closable:true'>"+
	"<iframe id='"+iframeid1+"' class='aa' name='"+iframeid1+"' scrolling='auto' frameborder='0'  src='"+url+"' style='width:100%;height:100%;'>"+
	"</iframe></div>";
	return iframeurl;
}
function tianjia(title, url, iframeid1) {
    if (!$("#tabs").tabs('exists', title)) {
        var allTabs = $("#tabs").tabs("tabs");
        $("#tabs").tabs('add', {
            title: title,
            content:  buildIframe(url,title,iframeid1),
            closable: true
         });

    } else {
        $("#tabs").tabs('select', title);
    }
}

function showlater(message)
{
	layer.alert(message);// 非阻态延时
}
