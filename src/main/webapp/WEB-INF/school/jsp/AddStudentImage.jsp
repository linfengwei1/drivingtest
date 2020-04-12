<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-3-13
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传图片</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <style>
        .layui-main-login {
            margin-top: 7%;
            margin-left: 20%;
            padding-left: 5%;
            padding-top: 2%;
            width: 50%;
            background-color: #dadada;
        }
        <%--.layui-layout-body{--%>
        <%--    background-image: url(${pageContext.request.contextPath}/static/images/demo-1-bg.jpg);--%>
        <%--    overflow:auto; /*这边设置是为了弹出的时候，如果框的大小小于内容，就出现滑动条*/--%>
        <%--}--%>
    </style>
</head>
<body class="layui-layout-body">
<input type="hidden" id="path" value="<%=path%>">
<div class="layui-main-login">
    <form class="layui-form" action=" " onsubmit="return false" >
        <div> <input type="hidden" id="id" name="id"></div>
        <!--************这里是上传图片的代码***************-->
        <!--************这里添加的隐藏的输入框，用来传递images的参数***************-->
<%--        <input type="hidden" name="image" class="image"  >--%>
        <div class="layui-form-item">
            <label class="layui-form-label ">照片:</label>
            <div class="layui-upload">
                <button type="button" class="layui-btn" id="test1">上传图片</button>
                <div class="layui-upload-list">
                    <img class="layui-upload-img" id="demo1" style="width: 100px;height: 80px">
                    <p id="demoText"></p>
                </div>
            </div>
        </div>
        <!--************上面里是上传图片的代码***************-->
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo" id="OK">立即上传</button>
            </div>
        </div>

    </form>
</div>

</body>
<script>
    layui.use(['form','upload','element'], function() {
        var form = layui.form;
        var $ = layui.jquery
            , upload = layui.upload,
            element = layui.element;
        var path = $("#path").val();

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: path + '/school/AddStudentImage/'
            , accept: 'images'
            , auto: false//是否自动上传
            , size: 50000
            , bindAction: '#OK'
            // ,data : {//要传递的数据
            //     id: $("#id").val(),
            // }
            , before: function (obj) {

                this.data = {//要传递的数据
                    id: $("#id").val(),
                }
                console.log("上传id1111="+$("#id").val())
                obj.preview(function (index, file, result) {

                    $('#demo1').attr('src', result);
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
                var demoText = $('#demoText');
                demoText.html('<span style="color: #4cae4c;">上传成功</span>');
                layer.alert("上传成功",{icon:6},function () {
                    window.parent.location.reload();
                });
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    })
</script>
</html>
