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
				var result;
				var status = parseInt(data[i].status);
				if(status == 1)
				{
					result = '预约成功';
				}else if(status == 2)
				{
					result = '预约失败';
				}else
				{
					result = '待审核';
				}
				$("#demo").append("<tr><td>"+data[i].subject+"</td><td>"+data[i].orderTime+"</td><td>"+result+"</td></tr>");
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