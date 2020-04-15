$(function () {
	var path = $("#path").val();
	var studentId = $("#studentid").val();
	$.ajax({
		url:path+'/student/getStudyCondition',
		type:'post',
		data: {studentId:studentId},
		dateType:"json",
		success:function(data){
			console.log(data);
			for (var i= 0; i <data.length; i++)
			{
				console.log(data[i].time);
				var surplusTime = 3-parseInt(data[i].time);
				var score = parseInt(data[i].score);
				var result = '未通过';
				if(score != null && score >= 90)
				{
					result = '已通过';
				}
				$("#edittd").find("tbody").append("<tr><td>第"+data[i].subject_id+"阶段</td><td>3学时</td><td>-</td><td>"+data[i].time+"学时</td><td>=</td><td>"+surplusTime+"</td><td>"+result+"</td></tr>")
			}

		},error:function (err) {

		}
	});
})