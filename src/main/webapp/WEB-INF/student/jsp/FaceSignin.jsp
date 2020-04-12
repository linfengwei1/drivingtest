<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--	<title>学员人脸录入</title>--%>
<%--	<%String path = request.getContextPath();%>--%>

<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">--%>
<%--&lt;%&ndash;	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">&ndash;%&gt;--%>
<%--	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>--%>
<%--	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>--%>

<%--	<style>--%>
<%--		body {--%>
<%--			padding: 0;--%>
<%--			margin: 0;--%>
<%--			background-color: #9E9E9E;--%>
<%--			background-size: 68%;--%>
<%--		}--%>

<%--		#app {--%>
<%--			text-align: center;--%>
<%--		}--%>

<%--		#tv {--%>
<%--			margin: 0 auto;--%>
<%--			background-size: 112% 100%;--%>
<%--			padding: 135px;--%>
<%--			background-position-y: -30px;--%>
<%--			background-position-x: -20px;--%>
<%--			width: 300px;--%>
<%--			height: 344px;--%>
<%--			background-repeat: no-repeat;--%>
<%--			display: inline-block;--%>
<%--		}--%>

<%--		#photo {--%>
<%--			width: 400px;--%>
<%--			height: 300px;--%>
<%--			display: inline-block;--%>
<%--		}--%>

<%--		#photo:after {--%>
<%--			position: absolute;--%>
<%--			color: #d6d6d6;--%>
<%--			font-size: 18px;--%>
<%--			text-align: center;--%>
<%--			line-height: 20px;--%>
<%--			vertical-align: middle;--%>
<%--			width: 400px;--%>
<%--			padding-top: 82px;--%>
<%--			font-weight: bolder;--%>
<%--			white-space: pre;--%>
<%--		}--%>

<%--		#video {--%>
<%--			margin-top: 51px;--%>
<%--			margin-left: -78px;--%>
<%--			transform: scaleX(-1);--%>
<%--		}--%>

<%--		canvas#canvas {--%>
<%--			border: 6px solid white;--%>
<%--			box-shadow: 1px 1px 5px #333333;--%>
<%--			z-index: 2;--%>
<%--		}--%>

<%--		.buttons {--%>
<%--			position: relative;--%>
<%--			right: -535px;--%>
<%--			width: 60px;--%>
<%--			border: 1px solid #eee;--%>
<%--			box-sizing: border-box;--%>
<%--			padding: 5px 13px;--%>
<%--			border-radius: 5px;--%>
<%--			cursor: pointer;--%>
<%--			background-color: #252020;--%>
<%--			color: #eee;--%>
<%--			font-weight: bold;--%>
<%--			height: 100px;--%>
<%--			font-size: 14px;--%>
<%--			bottom: 23px;--%>
<%--			display: inline-block;--%>
<%--			box-shadow: 5px 10px 15px 2px rgb(0, 0, 0);--%>
<%--			user-select: none;--%>
<%--		}--%>
<%--		.buttons:hover{--%>
<%--			box-shadow: 5px 10px 15px 2px rgba(0, 0, 0,0);--%>
<%--		}--%>
<%--		.buttons:active{--%>
<%--			box-shadow: inset 0px 0px 3px 2px rgb(140, 137, 137);--%>
<%--		}--%>

<%--		.buttons span {--%>
<%--			line-height: 50px;--%>
<%--		}--%>
<%--	</style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<input type="hidden" id="path" value="${pageContext.request.contextPath}">--%>
<%--<input type="hidden" id="studentid" value="${student.id}">--%>
<%--<input type="hidden" id="subject" value="1">--%>
<%--<input type="hidden" id="choice" value="${questionList.choice}">--%>
<%--<input type="hidden" id="judge" value="${questionList.judge}">--%>
<%--<div id="app">--%>
<%--	<div class="buttons" onclick="takePhoto()"><span>截图拍照</span></div>--%>
<%--	<!--  <button onclick="takePhoto()">截图拍照</button> -->--%>
<%--	<div id='tv'>--%>
<%--		<video id="video" width="400px" height="300px" autoplay="autoplay"></video>--%>
<%--	</div>--%>
<%--	<div id="photo">--%>
<%--		<canvas id="canvas" width="400px" height="300px"></canvas>--%>
<%--	</div>--%>
<%--</div>--%>
<%--<script>--%>
<%--	var path = $("#path").val();--%>
<%--	var studentid = $("#studentid").val();--%>
<%--	openMedia();--%>
<%--	var mediaStreamTrack = null; // 视频对象(全局)--%>
<%--	function openMedia() {--%>
<%--		let constraints = {--%>
<%--			video: { width: 400, height: 300 },--%>
<%--			audio: false--%>
<%--		};--%>
<%--		//获得video摄像头--%>
<%--		let video = document.getElementById('video');--%>
<%--		let promise = navigator.mediaDevices.getUserMedia(constraints);--%>
<%--		promise.then((mediaStream) => {--%>
<%--			mediaStreamTrack = typeof mediaStream.stop === 'function' ? mediaStream : mediaStream.getTracks()[1];--%>
<%--		video.srcObject = mediaStream;--%>
<%--		video.play();--%>
<%--	});--%>
<%--	}--%>

<%--	// 拍照--%>
<%--	function takePhoto() {--%>
<%--		//获得Canvas对象--%>
<%--		let video = document.getElementById('video');--%>
<%--		let canvas = document.getElementById('canvas');--%>
<%--		let ctx = canvas.getContext('2d');--%>
<%--		ctx.drawImage(video, 0, 0, 400, 300);--%>
<%--		//toDataURL()获取的数据有images前缀，要split取后面一部分传给后台，后台直接用--%>
<%--		var url = canvas.toDataURL();--%>
<%--		//获取到String类型的image信息--%>
<%--		var face = url.split(",")[1];--%>
<%--		console.log(face);--%>

<%--		//用ajax做验证 ,判断是否验证成功--%>
<%--		$.ajax({--%>
<%--			url: path+'/student/faceCheck',--%>
<%--			type:"POST",--%>
<%--			async: false,--%>
<%--			cache: false,--%>
<%--			data: {"face":face,"studentid":studentid},--%>
<%--			success: function(data) {--%>

<%--			},--%>
<%--			error:function(msg) {--%>
<%--				console.log(msg);--%>
<%--			}--%>
<%--		});--%>



<%--	}--%>

<%--	// 关闭摄像头--%>
<%--	function closeMedia() {--%>
<%--		mediaStreamTrack.stop();--%>
<%--	}--%>

<%--	window.addEventListener('keyup', function(e) {--%>
<%--		if (e.keyCode === 13 || e.keyCode === 32) {--%>
<%--			takePhoto();--%>
<%--		}--%>
<%--	});--%>

<%--</script>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>学员人脸录入</title>
	<%String path = request.getContextPath();%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">--%>
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>

	<style>
		body {
			padding: 0;
			margin: 0;
			background-size: 68%;
			overflow-x:hidden;
			overflow-y:hidden;
		}

		#app {

		}

		#tv {
			margin: 0 auto;
			background-size: 112% 100%;
			padding: 135px;
			background-position-y: -30px;
			background-position-x: -20px;
			width: 300px;
			height: 344px;
			background-repeat: no-repeat;
			display: inline-block;
		}

		#photo {
			width: 400px;
			height: 300px;
			display: inline-block;
		}

		#photo:after {
			position: absolute;
			color: #d6d6d6;
			font-size: 18px;
			text-align: center;
			line-height: 20px;
			vertical-align: middle;
			width: 400px;
			padding-top: 82px;
			font-weight: bolder;
			white-space: pre;
		}

		#video {
			margin-top: 51px;
			margin-left: -78px;
			transform: scaleX(-1);
		}

		canvas#canvas {
			border: 6px solid white;
			box-shadow: 1px 1px 5px #333333;
			margin-top: 51px;
			z-index: 2;
		}

		.buttons {
			position: relative;
			right: -535px;
			width: 60px;
			border: 1px solid #eee;
			box-sizing: border-box;
			padding: 5px 13px;
			border-radius: 5px;
			cursor: pointer;
			background-color: #252020;
			color: #eee;
			font-weight: bold;
			height: 100px;
			font-size: 14px;
			bottom: 23px;
			display: inline-block;
			box-shadow: 5px 10px 15px 2px rgb(0, 0, 0);
			user-select: none;
		}
		.buttons:hover{
			box-shadow: 5px 10px 15px 2px rgba(0, 0, 0,0);
		}
		.buttons:active{
			box-shadow: inset 0px 0px 3px 2px rgb(140, 137, 137);
		}

		.buttons span {
			line-height: 50px;
		}
	</style>
</head>
<body>

<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<input type="hidden" id="studentid" value="${student.id}">
<input type="hidden" id="student_state_id" value="${student.student_state_id}">
<input type="hidden" id="subject" value="${param.subject}">
<input type="hidden" id="identity_state" value="${student.identity_state}">
<div>
</div>
<h2>科目${param.subject}人脸打卡</h2>
<div class="layui-container">
	<div class="layui-row">
		<div class="layui-col-md5 layui-col-md-offset2">
			<video id="video" width="400px" height="300px" autoplay="autoplay"></video>
		</div>
		<div class="layui-col-md3">
			<canvas id="canvas" width="400px" height="300px"></canvas>
		</div>
	</div>
	<div class="layui-row">
		<div class="layui-col-md7 layui-col-md-offset5" style="margin-top: 10px">
<%--			<button type="button" id="import" onclick="takePhoto()" class="layui-btn layui-btn-lg layui-btn-normal">点击人脸打卡</button>--%>
		</div>
	</div>
</div>

<script>
	layui.use(['layer'], function () {
	var layer = layui.layer;
	var subject = $("#subject").val();
	var path = $("#path").val();
	var student_state_id = $("#student_state_id").val();
	var identity_state = $("#identity_state").val();

	var mediaStreamTrack = null; // 视频对象(全局)


	if(student_state_id != subject)
	{
		layer.msg('您当前不处于科目'+subject+'暂时无法打卡', {icon: 5});
	}else if(identity_state == 0)
	{
		layer.msg('请先录入人脸信息', {icon: 5},function () {
			location.href=path+"/student/path/FaceImport";
		});

	}else
	{
		openMedia();
		setTimeout(function () {
			takePhoto();
		},2000);//等待摄像头开启
	}

	function openMedia() {
		let constraints = {
			video: { width: 400, height: 300 },
			audio: false
		};
		//获得video摄像头
		let video = document.getElementById('video');
		let promise = navigator.mediaDevices.getUserMedia(constraints);
		promise.then((mediaStream) => {
			mediaStreamTrack = typeof mediaStream.stop === 'function' ? mediaStream : mediaStream.getTracks()[1];
		video.srcObject = mediaStream;
		video.play();
	});
	}
	// 拍照
	function takePhoto() {

		var path = $("#path").val();
		var studentid = $("#studentid").val();
		var subject = $("#subject").val();
		var student_state_id = $("#student_state_id").val();
		setTimeout(function(){
			// $("#import").css("disabled",true);
			//获得Canvas对象
			let video = document.getElementById('video');
			let canvas = document.getElementById('canvas');
			let ctx = canvas.getContext('2d');
			ctx.drawImage(video, 0, 0, 400, 300);
			//toDataURL()获取的数据有images前缀，要split取后面一部分传给后台，后台直接用
			var url = canvas.toDataURL();
			//获取到String类型的image信息
			var face = url.split(",")[1];
			console.log(face);

			//用ajax做验证 ,判断是否验证成功
			$.ajax({
				url: path + '/student/faceCheck',
				type: "POST",
				async: false,
				cache: false,
				data: {"face": face, "studentid": studentid,"subject":subject},
				success: function (data)
				{
					if (data == "success")
					{

						layer.msg('打卡成功', {icon: 6}, function ()
						{
							parent.location.href = path + "/student/reload";
						});

					} else if (data == "again")
					{
						// $("#import").css("disabled",false);
						layer.msg('请靠近摄像头', {icon: 5});
						takePhoto();
					} else if(data == "full")
					{
						// $("#import").css("disabled",false);
						layer.msg('您已经完成该阶段所有学时，无需打卡', {icon: 6});
					} else if(data == "repeat")
					{
						layer.msg('您今天已经打过卡了哦，不需要重复打卡', {icon: 6});
					}else
					{
						// $("#import").css("disabled",false);
						layer.msg('未匹配到人脸信息', {icon: 5});
						takePhoto();
					}


				},
				error: function (msg) {
					// $("#import").css("disabled",false);
					console.log(msg);
				}
			});



		},2000);

	}




	// 关闭摄像头
	function closeMedia() {
		mediaStreamTrack.stop();
	}

	window.addEventListener('keyup', function(e) {
		if (e.keyCode === 13 || e.keyCode === 32) {
			takePhoto();
		}
	});
})
</script>
</body>
</html>
