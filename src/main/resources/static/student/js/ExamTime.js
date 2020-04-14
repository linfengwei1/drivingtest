$(function () {
	layui.use(['table','layer'], function(){
	var layer = layui.layer;
	var path = $("#path").val();
	var studentId = $("#studentid").val();
	$.ajax({
		url:path+'/student/getOrderTime',
		type:'post',
		data: {studentId:studentId},
		dateType:"json",
		success:function(data){
			console.log(data);
			if(data == null)
			{
				layer.msg('暂无考试安排'+data,{icon: 6});
				return;
			}
			for (var i= 0; i <data.length; i++)
			{

				$("#demo").append("<tr><td>"+data[i].subject+"</td><td>"+data[i].orderTime+"</td></tr>");
			}

		},error:function (err) {

		}
	});
});

	function renderTime(date) {
		var dateee = new Date(date).toJSON();
		return new Date(+new Date(dateee) + 8 * 3600 * 1000).toISOString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '')
	}
})