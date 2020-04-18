$(function () {
	layui.use(['layer','jquery','util'], function () {
		var layer = layui.layer;
		var path = $("#path").val();
		var studentId = $("#studentid").val();
		var timer2;

		$(".layui-btn-lg").on("click",function () {


			var index1 =layer.msg('你确定交卷吗？', {
				time: 0 //不自动关闭
				,btn: ['确定', '取消']
				,yes: function(index){
					layer.close(index1);
					puhshPaper(layer);
					clearTimeout(timer2);
				}
			});
		})

		var util = layui.util;
		//示例
		var serverTime = new Date().getTime() //假设为结束日期   3600000
			,endTime = new Date().getTime()+300000; //假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的

		util.countdown(endTime, serverTime, function(date, serverTime, timer){
			timer2 = timer;
			var str = date[1] + ':' +  date[2] + ':' + date[3];
			layui.$('#daojishi').html('考试倒计时：'+ str);
			if(date[3] == 00 && date[2] == 00 && date[1] == 00 )
			{
				layer.msg('时间到自动交卷',{icon: 5},function () {
					clearTimeout(timer);
					puhshPaper(layer);
				});
			}
		});
	});




})


function puhshPaper(layer) {
	var score = 0;
	var path = $("#path").val();
	var studentId = $("#studentid").val();
	var subject = $("#subject").val();
	var score;
	var testReplies = [];
	$(".test_content_nr_main").each(function(index, element) {

		// console.log(element);
		var length = $(this).find('input:radio:checked').length;
		if(length == 0) {//说明这题没做



		}else {

			var questionid = $(this).find(".questionid").val();
			console.log('正确答案是'+questionid);
			var select = $(this).find('input:radio:checked').val();

			var testReply ={
				id: questionid,
				answer: select
			};
			testReplies.push(testReply);
		}
	});

	var datas ={
		studentId:parseInt(studentId),
		subject:parseInt(subject),
		testReplieslist: testReplies
	};
	$.ajax({
		url:path+'/student/getTestScore',
		type:'post',
		contentType:"application/json",
		data: JSON.stringify(datas),
		success:function(data){
			$(".layui-btn-lg").attr("disabled",true);
			if (null != data){
				score = data;
				layer.open({
					type: 1
					,title: false //不显示标题栏
					,closeBtn: false
					,area: '300px;'
					,shade: 0.8
					,anim:1
					,id: 'LAY_layuipro' //设定一个id，防止重复弹出
					,closeBtn: 1
					,btnAlign: 'c'
					,moveType: 1 //拖拽模式，0或者1
					,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">本次练习结束！<br>得分：<span style="color: red;font-size: 22px">'+score+'</span></div>'
				});


			}else {

			}
		},error:function (err) {
			// layer.msg("网络繁忙",function () {
			// 	window.location.reload();
			// });
		}
	});


	// layer.alert('本次得分：'+score, {icon: 6,title:'考试结束'});
	// $(".layui-btn-lg").attr("disabled",true);
	// $(".layui-btn-lg").parent().append("<button type=\"button\" class=\"layui-btn layui-btn-lg\" onclick=\"flush()\">再次练习</button>")



}
function flush() {
	window.location.reload();
}