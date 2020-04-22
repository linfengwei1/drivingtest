$(function () {
	layui.use(['layer','form','laydate'], function(){
		var form = layui.form;
		var layer = layui.layer;
		var $ = layui.jquery;
		var path = $("#path").val();
		//监听提交
		//但是，如果你的HTML是动态生成的，自动渲染就会失效
		form.render();
		var laydate = layui.laydate;
		var week = new Date().getDay();//得到当前星期
		//执行一个laydate实例
		laydate.render({
			elem: '#test1', //指定元素
			format: 'yyyy-MM-dd',
			showBottom: false,
			min: 1, //时间从今天开始
			max: 13-week, //到下一周最后一天
			done: function(value){//更换时间时候

				var schoolId = $("#schoolid").val();
				console.log(schoolId);
				console.log(value); //得到日期生成的值，如：2017-08-18
				$("#timeinput").val(value);

				console.log("发送获取预约时间请求");
				$.ajax({
					type:"Post",
					async:true,
					url:path+"/coach/getOrderTimeBydate",
					data:{data:value,schoolId:schoolId},
					dataType:"text",
					success:function (msg) {
						if(msg == "success")
						{
							$(".timec").attr("disabled",false);
						}else
						{
							layer.msg('暂无考试安排');
							$(".timec").attr("disabled",true);
						}
						form.render();



					},
					error: function (msg) {
						alert(msg);
					}
				});
			}
		});


		$(".layui-btn").on("click",function () {
			var checkbox=[];

			$("[name = stdcheckbox]:checkbox").each(function(i){
				if ($(this).prop("checked") == true){
					checkbox.push($(this).val());
				}
			});


			var data = $("#test1").val();
			var subject = $("#subject option:selected").val();
			var time= $('input:radio[name="time"]:checked').val();

			var datas ={
				subject:subject,
				time:data+' '+time,
				studentIds:checkbox
			};

			console.log(datas);
			if(datas.subject == 0)
			{
				layer.msg('请选择科目', {icon: 5});
				return;
			}else if(datas.time == 0)
			{
				layer.msg('请选择考试时间', {icon: 5});
				return;
			}else if(datas.data == "")
			{
				layer.msg('请选择考试日期', {icon: 5});
				return;
			}else if(datas.studentIds.length == 0)
			{
				layer.msg('请选学员', {icon: 5});
				return;
			}



			var index1 =layer.msg('你确提交预约申请吗？', {
				time: 0 //不自动关闭
				,btn: ['确定', '取消']
				,yes: function(index){
					layer.close(index1);

					$.ajax({
						url:path+'/coach/toOrder',
						type:'post',
						contentType:"application/json",
						data: JSON.stringify(datas),
						success:function(data){
							if ("success" == data){
								layer.msg('预约成功', {icon: 6, shade: 0.3},function () {
									window.location.reload();
								})
							}else {
								layer.msg('预约失败', {icon: 5});
							}
						},error:function (err) {
							// layer.msg("网络繁忙",function () {
							// 	window.location.reload();
							// });
						}
					});
				}
			});
		})

		form.on('select(subject)', function(data){//角色重新选择后
			console.log(typeof data.value); //得到被选中的值
			var coachId = $("#coachid").val();

			$("#student").empty();//先清空
			form.render('select');
			var subject = data.value;
			if(subject != 0)
			{
				console.log("发送了"+path);
				$.ajax({
					type:"Post",
					async:true,
					url:path+"/coach/getStudentBySubject",
					data:{subject:subject,coachId:coachId},
					dateType:"json",
					success:function (msg) {
						var obj = msg;
						console.log(obj);
						if(obj.length == 0)
						{
							layer.msg('未找到符合要求的学员', {icon: 2});
							return;
						}
						$.each(obj, function (i, item) {
							console.log(item.name);
							$("#student").append("<input type='checkbox' name='stdcheckbox' title='"+item.name+"' value='"+item.id+"'>");
						});
						form.render('select');
						form.render();
					},
					error: function (msg) {
						alert(msg);
					}
				});
			}else
			{

				$("#student").empty();//先清空
				form.render('select');
				form.render();
			}
		});

	});
})



