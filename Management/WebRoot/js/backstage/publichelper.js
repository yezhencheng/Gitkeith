// easyui计算列宽度百分比
function fixWidth(percent)  
{  
  //var w=$('#frameworkdiv1').css('width').replace('px','');//这里写死了tabsid
  var w=document.body.clientWidth-20;
  var value=w*percent;
  return value; 
}

//获取url中的参数
function getUrlParam(name) {
 var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
 var r = window.location.search.substr(1).match(reg); //匹配目标参数
 if (r != null) return unescape(r[2]); return null; //返回参数值
}
