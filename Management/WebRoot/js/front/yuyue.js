$(document).ready(function() {
	var id=$('#id').val();
	if("ture"==id){
		layer.msg('预约成功');
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭
	}
	$('#bt1').click(function() {
		$('form').submit();		
	})
	$('#bt0').click(function() {
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭
	})
})