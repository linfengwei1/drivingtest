$(function () {
	layui.use(['table','layer'], function(){
	var layer = layui.layer;
	var path = $("#path").val();
	var studentId = $("#studentid").val();
	$.ajax({
		url:path+'/student/getMyScore',
		type:'post',
		data: {studentId:studentId},
		dateType:"json",
		success:function(data){
			console.log(data);
			if(data == null)
			{
				layer.msg('暂无成绩'+data,{icon: 6});
				return;
			}
			for (var i= 0; i <data.length; i++)
			{

				$("#demo").append("<tr><td>"+data[i].examId+"</td><td>"+data[i].subject+"</td><td>"+data[i].examTime.substring(0,10)+"</td><td>"+data[i].score+"</td></tr>");
			}

		},error:function (err) {

		}
	});
});
})