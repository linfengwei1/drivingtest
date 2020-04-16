<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>学员人脸录入</title>
	<%String path = request.getContextPath();%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">--%>
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
<%--	<script src="${pageContext.request.contextPath}/static/student/js/jquery-3.0.0.min.js" type="text/javascript" charset="UTF-8"></script>--%>

	<style type="text/css">
		.barrager{width:800px;background:#fff;margin:0 auto;height:390px;overflow:hidden;position:relative;}
		.barrager div{position:absolute;}
		.addBarrager{border:1px solid #d5d5d5;height:75px;width:800px;margin:0 auto 30px;-webkit-border-radius: 20px;-moz-border-radius:20px;border-radius: 20px;}
		.addBarrager input{height:38px;margin-top:20px;margin-left:2%;width:70%;text-indent:30px;border:none;line-height:38px;font-size:20px;}
		.addBarrager .submit{height:38px;background:#fff;font-size:20px;font-family: "微软雅黑";width:25%;margin-top:20px;border-left:1px solid #d5d5d5;}

	</style>
</head>
<body>
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<input type="hidden" id="studentid" value="${student.id}">
<input type="hidden" id="coach_id" value="${student.coach_id}">
<div class="barrager">

</div>

<div class="addBarrager clearfix">
	<input type="text" maxlength="20" autocomplete="off" class="fl barVal" placeholder="描述你对${student.coach.name}的印象 限20个字">
	<button class="submit fr">发布</button>
</div>
<script type="text/javascript">

	var path = $("#path").val();
	var studentid = $("#studentid").val();
	var coachId = $("#coach_id").val();
	// 用ajax获取所有评论
	$.ajax({
		url:path+'/student/getAllEvaForCoach',
		type:'post',
		async:false,
		data: {coachId:coachId},
		dateType:"json",
		success:function(data){
			console.log(data);

			for (var i= 0; i <data.length; i++)
			{
				$(".barrager").append("<div><span>"+data[i].content+"</span></div>")
			}

		},error:function (err) {

		}
	});


	$(function () {
		$(".barrager").barrager()
	});
	(function () {
		var Barrager = function (ele,options) {
			var defaults = {
				color:["#ff9999","#35d2f4","#9ee353","#9d77ff","#4785d9","#ff9333","#5bdea8","#51befc"],
				wrap:ele
			};
			this.settings = $.extend({},defaults,options||{});
			this._init();
			this.bindEven();
		};
		Barrager.prototype = {
			_init:function () {
				var item = $(this.settings.wrap).find("div");
				for(var i = 0;i<item.length;i++){
					item.eq(i).css({
						top:this.getReandomTop()+"px",
						color:this.getReandomColor(),
						fontSize:this.getReandomSize()+"px"
					});
					item.eq(i).css({
						right:-item.eq(i).width()
					})
				}
				this.randomTime(0);
			},
			bindEven:function () {
				var _this = this;
				$(".addBarrager .submit").on('click',function () {
					_this._click(_this);
				});
			},
			getReandomColor:function () {
				var max = this.settings.color.length;
				var randomNum = Math.floor(Math.random()*max);
				return this.settings.color[randomNum];
			},
			getReandomTop:function () {
				var top = (Math.random()*450).toFixed(1);
				return top;
			},
			getReandomSize:function () {
				var size = (12+Math.random()*28);
				return size;
			},
			getReandomTime:function () {
				var time = Math.floor((8+Math.random()*10));
				return time*1000;
			},
			randomTime:function (n) {
				var obj = $(this.settings.wrap).find("div");
				var _this = this;
				var len = obj.length;
				if(n>=len){
					n=0;
				}
				setTimeout(function () {
					n++;
					_this.randomTime(n)
				},1000);
				var item = obj.eq(n),_w = item.outerWidth(!0);
				item.animate({
					left:-_w
				},_this.getReandomTime(),"linear",function () {
					item.css({right:-_w,left:""});
					_this.randomTime(n)
				});
			},
			_click:function (obj) {
				var _this = obj;
				var _val = $(".barVal");
				if(_val.val() == ""){
					alert("请描述你对TA的印象！");
					return false;
				}

				$.ajax({
					url:path+'/student/addEvaForCoach',
					type:'post',
					data: {coachId:coachId,content:_val.val()},
					dateType:"json",
					success:function(data){

						if(data == "success")
						{
							$(_this.settings.wrap).append("<div><span class='new'>"+_val.val()+"</span></div>");
							_this._init();
							_val.val("");
						}

					},error:function (err) {

					}
				});





			}
		};
		$.fn.barrager = function (opt) {
			var bger = new Barrager(this,opt);
		}
	})(jQuery);
</script>


</body>
</html>