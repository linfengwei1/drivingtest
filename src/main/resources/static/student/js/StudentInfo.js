$(function () {
	var path = $("#path").val();
	var studentId = $("#studentid").val();
	var status = $("#status").val();
	$.ajax({
		url:path+'/student/getStudyCondition',
		type:'post',
		data: {studentId:studentId,status:status},
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
			var nowStage;
			if(data[0].score < 90)
			{
				nowStage = '当前所处阶段：科目一';
			}else if(data[1].score < 90)
			{
				nowStage = '当前所处阶段：科目二';
			}else if(data[2].score < 90)
			{
				nowStage = '当前所处阶段：科目三';
			}else if(data[3].score < 90)
			{
				nowStage = '当前所处阶段：科目四';
			}else
			{
				nowStage = '当前所处阶段：毕业';
			}
			$("#stage").text(nowStage);

		},error:function (err) {

		}
	});
})