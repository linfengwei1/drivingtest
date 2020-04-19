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
	var layer = layui.layer;
	var path = $("#path").val();
	var studentId = $("#studentid").val();
	var subject = $("#subject").val();
	var score = 0;
	var errorList = [];
	var wrongList = [];
	var count;
	$(".test_content_nr_main").each(function(index, element) {

		// console.log(element);
		var length = $(this).find('input:radio:checked').length;
		if(length == 0) {//说明这题没做

			$(this).parent().find(".answer").css("display","block");
			var index = $(this).parent().attr("id");
			errorList.push(index);//装进错题
			var wrongId = $(this).children("input:last-child").val();
			wrongList.push(wrongId);
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
				var wrongId = $(this).children("input:last-child").val();
				wrongList.push(wrongId);
			}
		}
	});
	var datas ={
		studentId:parseInt(studentId),
		subject:parseInt(subject),
		wrongList: wrongList
	};
	$.ajax({
		url:path+'/student/addWrongQuestion',
		type:'post',
		contentType:"application/json",
		data: JSON.stringify(datas),
		success:function(data){
			if ("success" == data){
				count = wrongList.length;

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
					,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">本次练习结束！<br>得分：<span style="color: red;font-size: 22px">'+score+'</span><br><br>共计错题'+count+'道，再接再厉哦 ^_^</div>'
				});



			}else {

			}
		},error:function (err) {
			// layer.msg("网络繁忙",function () {
			// 	window.location.reload();
			// });
		}
	});



	findError(errorList);


	$(".layui-btn-lg").attr("disabled",true);
	$(".layui-btn-lg").parent().append("<button type=\"button\" class=\"layui-btn layui-btn-lg\" onclick=\"flush()\">再次练习</button>")


}

function findError(data) {
	for (var i  = 0;i<data.length;i++)
	{


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