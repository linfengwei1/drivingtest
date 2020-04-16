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
	var errorList = [];

	$(".test_content_nr_main").each(function(index, element) {

		// console.log(element);
		var length = $(this).find('input:radio:checked').length;
		if(length == 0) {//说明这题没做

			$(this).parent().find(".answer").css("display","block");
			var index = $(this).parent().attr("id");
			errorList.push(index);//装进错题

		}else {

			var correct = $(this).find(".correct").val();
			console.log('正确答案是'+correct);
			var select = $(this).find('input:radio:checked').val();
			if(select == correct)//如果这道题做对了+1分
			{
				score++;
			}else {
				$(this).parent().find(".answer").css("display","block");
				var index = $(this).parent().attr("id");
				errorList.push(index);//装进错题
			}
		}
	});

	layer.alert('本次得分：'+score, {icon: 6,title:'考试结束'});
	$(".layui-btn-lg").attr("disabled",true);
	$(".layui-btn-lg").parent().append("<button type=\"button\" class=\"layui-btn layui-btn-lg\" onclick=\"flush()\">再次练习</button>")

	findError(errorList);

	// $("input[type='radio']").each(function(index, element) {
	// 	var select = $(this).val();
	// 	var answer = $(this).parent().parent().children().eq(0).val();
	//
	// 	if($(this).is(":checked"))
	// 	{
	// 		if(select == answer)//如果这道题做对了+1分
	// 		{
	// 			score++;
	// 		}
	// 	}
	//
	// });

	// var div_par = $(this).parent().parent().parent().parent();
	// var answerDiv = div_par.children('.answer');
	// answerDiv.css("display","block");
	// $(".answer").css("display","block");
	//
	// layer.alert('本次得分：'+score, {icon: 6,title:'考试结束'});
	// $(".layui-btn-lg").attr("disabled",true);
	// $(".layui-btn-lg").parent().append("<button type=\"button\" class=\"layui-btn layui-btn-lg\" onclick=\"flush()\">再次练习</button>")
}

function findError(data) {
	for (var i  = 0;i<data.length;i++)
	{
		// $("#q1").find("li").each(function (index, element) {
		//
		// 	if($(element).find("a").attr("herf") == data[i])
		// 	{
		// 		$(element).css("background","red");
		// 		$(element).css("color","white");
		// 	}
		// })
		// $("#q2").find("li").each(function (index, element) {
		//
		// 	if($(element).find("a").attr("herf") == data[i])
		// 	{
		// 		$(element).css("background","red");
		// 		$(element).css("color","white");
		// 	}
		// })


		$("#q1 li a").each(function(){


			var str = "#"+data[i];
			if($(this).attr("href") == str)
			{
				$(this).css("color","white");
				$(this).css("background","red");
			}
		});
		$("#q2 li a").each(function(){
			var str = "#"+data[i];
			if($(this).attr("href") == str)
			{
				$(this).css("color","white");
				$(this).css("background","red");
			}
		});

		// $each($('#q2 li a'),function(index,img){
		// 	var oldSrc = $(this).attr('href');
		// 	if(oldSrc == data[i])
		// 	{
		// 		$(this).css("color","white");
		// 		$(this).css("background","red");
		// 	}
		// });


	}
}
function flush() {
	window.location.reload();
}