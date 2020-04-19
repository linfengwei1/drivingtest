<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>学员人脸录入</title>
	<%String path = request.getContextPath();%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
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
<%--<div class="layui-row">--%>
<%--	<div class="layui-col-md7 layui-col-md-offset5" style="margin-top: 10px">--%>
		<button type="button" id="import" onclick="takePhoto()" class="layui-btn layui-btn-lg layui-btn-normal">点击录入人脸信息</button>
<%--	</div>--%>

<%--</div>--%>
<div class="layui-container">
	<div class="layui-row">
		<div class="layui-col-md5 layui-col-md-offset2">
			<video id="video" width="400px" height="300px" autoplay="autoplay"></video>
		</div>
		<div class="layui-col-md3">
			<canvas id="canvas" width="400px" height="300px"></canvas>
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
		var video = document.getElementById('video');
		var promise = navigator.mediaDevices.getUserMedia(constraints);
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
		var video = document.getElementById('video');
		var canvas = document.getElementById('canvas');
		var ctx = canvas.getContext('2d');
		//拍照存放的位置
		ctx.drawImage(video, 0, 0, 400, 300);
		//toDataURL()获取的数据有images前缀，要split取后面一部分传给后台，后台直接用
		var url = canvas.toDataURL();
		//获取到String类型的image信息
		var imageString = url.split(",")[1];
		console.log(imageString);

		//用ajax做验证 ,判断是否验证成功
		$.ajax({
			url: path + '/school/faceAdd',
			type: "POST",
			async: false,
			cache: false,
			data:  "imageString="+imageString,
			success: function (data) {
				if (data == "success") {
					$("#import").css("disabled",true);
					layer.msg('录入成功', {icon: 6}, function () {
						// parent.location.href = path + "/school/faceAdd";
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
	//addEventListener()方法，即为事件监听；可以使用removeEventListener()方法来移除事件的监听。
	//语法：element.addEventListener(event,function,useCapture);
	//其中第一个参数是事件的类型（如“click”或“mousedown”）
	// 第二个参数是事件触发后调用的函数。
	// 第三个参数是个布尔值用于描述事件是冒泡还是捕获。该参数是可选的。
	// 注意：不要使用“on”前缀。例如，使用“click”,而不是使用“onclick”.
	// 键盘监听,点击回车或空格会执行拍照的功能,但是并不行，可能是在我的jsp存在表单提交，会变成刷新页面
	// 把整个代码拷到一个单独的html中运行,点击回车或空格是可以进行拍照截图的
	window.addEventListener('keyup', function(e) {
		//e.keyCode === 13表示回车,32表示空格
		if (e.keyCode === 13 || e.keyCode === 32) {
			takePhoto();
		}
	});
</script>
</body>
</html>
