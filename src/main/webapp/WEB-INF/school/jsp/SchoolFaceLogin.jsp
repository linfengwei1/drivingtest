<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-3-15
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>驾校人脸登录</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
<%--    <script src="${pageContext.request.contextPath}/static/school/js/SchoolLogin.js" type="text/javascript" charset="UTF-8"></script>--%>
    <style>

        body {
            padding: 0;
            margin: 0;
            background-size: 68%;
            overflow-x:hidden;
            overflow-y:hidden;
        }


        /*#video {*/
        /*    margin-top: 51px;*/
        /*    margin-left: -78px;*/
        /*    transform: scaleX(-1);*/
        /*}*/

        /*canvas#canvas {*/
        /*    border: 6px solid white;*/
        /*    box-shadow: 1px 1px 5px #333333;*/
        /*    margin-top: 51px;*/
        /*    z-index: 2;*/
        /*}*/



        .buttons span {
            line-height: 50px;
        }

        #two{
            height: 15%;
            background-color: #f9fdff;
        }
        #one{
            height: 70%;
            background-image: url(${pageContext.request.contextPath}/static/images/bgLogin.jpg);
        }
        .layui-main-login p{
            margin: 0px 0 20px 30px;
            font-size: 18px;
            font-weight: bold;
            color: #666;
        }

    </style>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div id="two">
    <br>
    <h1><span style="color: #42627c; padding-top: 10%;margin-left: 10%">机动车驾驶员培训机构信息互动平台</span></h1>
</div>
<div id="one" >
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md5 layui-col-md-offset2" style="margin-left: 60%;margin-top: 5%">
                <video id="video" width="400px" height="300px"  autoplay="autoplay"></video>
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


</div>
<div align="center">
    <p>
        <a href="#">版权所有：传一科技JX1908</a>
    </p>
    <p>
        <a href="#">技术支持：传一科技JX1908第四小组</a>
    </p>
</div>
</body>
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
        }else if(identity_state == 0) {
            layer.msg('请先录入人脸信息', {icon: 5}, function () {
                location.href = path + "/student/path/FaceImport";
            });
        // }
        }else
        {
            openMedia();
            setTimeout(function () {
                takePhoto();
            },2000);//等待摄像头开启
        }

        function openMedia() {
            var constraints = {
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

            var path = $("#path").val();
            var studentid = $("#studentid").val();
            var subject = $("#subject").val();
            var student_state_id = $("#student_state_id").val();
            setTimeout(function(){
                // $("#import").css("disabled",true);
                //获得Canvas对象
                var video = document.getElementById('video');
                var canvas = document.getElementById('canvas');
                var ctx = canvas.getContext('2d');
                ctx.drawImage(video, 0, 0, 400, 300);
                //toDataURL()获取的数据有images前缀，要split取后面一部分传给后台，后台直接用
                var url = canvas.toDataURL();
                //获取到String类型的image信息
                var imageString = url.split(",")[1];
                console.log(imageString);

                //用ajax做验证 ,判断是否验证成功
                $.ajax({
                    url: path + '/school/faceLogin',
                    type: "POST",
                    async: false,
                    cache: false,
                    data: "imageString="+imageString,
                    success: function (data)
                    {
                        if (data == "success")
                        {

                            layer.msg('登录成功', {icon: 6}, function ()
                            {
                                location.href=path+"/school/path/Manage"
                            });

                        } else if (data == "again")
                        {
                            // $("#import").css("disabled",false);
                            layer.msg('请靠近摄像头', {icon: 5});
                            takePhoto();
                        }
                        else
                        {
                            // $("#import").css("disabled",false);
                            layer.msg('未匹配到人脸信息或未开通人脸登录', {icon: 5});
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
</html>
