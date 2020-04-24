function getStudentState(subject) {

	layui.use(['layer'], function () {
	var studentId = $("#studentid").val();
	var path = $("#path").val();
	console.log(path);
	$.ajax({
		url:path+'/student/getStudentState',
		type:'post',
		data: {studentId:studentId,subject:subject},
		success:function(data){
			if ("success"==data){

				window.open(path+"/student/testOl/"+subject);
			}else {
				layer.msg('你当前不能参加该考试',{icon: 6});
			}
		},error:function (err) {
			// layer.msg("网络繁忙",function () {
			// 	window.location.reload();
			// });
		}
	});

	})
}