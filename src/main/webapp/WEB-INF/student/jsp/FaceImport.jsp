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
<input type="hidden" id="subject" value="1">
<input type="hidden" id="choice" value="${questionList.choice}">
<input type="hidden" id="judge" value="${questionList.judge}">
<div>
</div>

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
			<button type="button" id="import" onclick="takePhoto()" class="layui-btn layui-btn-lg layui-btn-normal">点击录入人脸信息</button>
		</div>
	</div>
</div>

<script>

	openMedia();
	var mediaStreamTrack = null; // 视频对象(全局)
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
	//获得Canvas对象
	layui.use(['layer'], function () {
		var layer = layui.layer;
		var path = $("#path").val();
		var studentid = $("#studentid").val();
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
			url: path + '/student/importFace',
			type: "POST",
			async: false,
			cache: false,
			data: {"face": face, "studentid": studentid},
			success: function (data) {
				if (data == "success") {
					$("#import").css("disabled",true);
					layer.msg('录入成功', {icon: 6}, function () {
						parent.location.href = path + "/student/reload";
					});

				} else if (data == "error") {
					layer.msg('未检测到人脸,请重新录入', {icon: 5});
				} else {
					layer.msg('网络错误', {icon: 5});
				}

			},
			error: function (msg) {
				console.log(msg);
			}
		});
	})
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
</script>
</body>
</html>
