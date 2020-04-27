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

				if(data[i].subject_id == 1)
				{
					$(".tmio").find(".layui-table").append("<tr><td>科目一</td><td><div class='layui-progress' lay-showpercent='true'><div class='layui-progress-bar'  lay-percent='"+data[i].time+"/3'></div></div></td><td>"+result+"</td></tr>")
				}else if(data[i].subject_id == 2)
				{
					$(".tmio").find(".layui-table").append("<tr><td>科目二</td><td><div class='layui-progress' lay-showpercent='true'><div class='layui-progress-bar layui-bg-orange'  lay-percent='"+data[i].time+"/3'></div></div></td><td>"+result+"</td></tr>")
				}else if(data[i].subject_id == 3)
				{
					$(".tmio").find(".layui-table").append("<tr><td>科目三</td><td><div class='layui-progress' lay-showpercent='true'><div class='layui-progress-bar layui-bg-blue'  lay-percent='"+data[i].time+"/3'></div></div></td><td>"+result+"</td></tr>")
				}else if(data[i].subject_id == 4)
				{
					$(".tmio").find(".layui-table").append("<tr><td>科目四</td><td><div class='layui-progress' lay-showpercent='true'><div class='layui-progress-bar layui-bg-green'  lay-percent='"+data[i].time+"/3'></div></div></td><td>"+result+"</td></tr>")
				}


			}
			layui.use('element', function(){
				var element = layui.element;
			});
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