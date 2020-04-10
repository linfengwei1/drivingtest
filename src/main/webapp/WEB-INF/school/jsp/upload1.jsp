<%--
  Created by IntelliJ IDEA.
  User: junlong
  Date: 2019-11-16
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
    <%String path = request.getContextPath();%>
<%--    <link rel="stylesheet" type="text/css" href="../js/layui/css/layui.css"/>--%>
    <script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>
<%--<input type="hidden" id="path" value="<%=path%>">--%>
<%--<div class="layui-upload ">--%>
<%--    <button type="button" class="layui-btn" id="test1" >上传图片</button>--%>
<%--    <div class="layui-upload-list">--%>
<%--        <img style="height: 80px;width: 80px;" class="layui-upload-img" id="demo1" >--%>
<%--        <p id="demoText"></p>--%>
<%--    </div>--%>
<%--<div class="layui-upload-drag" id="ongImg">--%>
<%--    <i class="layui-icon"></i>--%>
<%--    <p>点击上传，或将文件拖拽到此处</p>--%>
<%--</div><br>--%>
<%--<button type="button" class="layui-btn layui-btn-radius layui-btn-normal" id="imgSave">上传</button>--%>
<%--</div>--%>
<%--<body>--%>

<%--<button type="button" class="layui-btn" id="test1">--%>
<%--    <i class="layui-icon">&#xe67c;</i>上传图片--%>
<%--</button>--%>

<%--<script>--%>
<%--    layui.use('upload', function(){--%>
<%--        var upload = layui.upload;--%>
<%--        var path = $("#path").val();--%>
<%--        //执行实例--%>
<%--        var uploadInst = upload.render({--%>
<%--            elem: '#test1' //绑定元素--%>
<%--            ,url:path+ '/school/upload1' //上传接口--%>
<%--            ,done: function(res){--%>
<%--                //上传完毕回调--%>
<%--            }--%>
<%--            ,error: function(){--%>
<%--                //请求异常回调--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

<body>
<input type="hidden" id="path" value="<%=path%>">
<div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">
    <div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
</div>
<div class="layui-form" action="" lay-filter="example">
    <div class="layadmin-user-login-box layadmin-user-login-header">
        <h2>文件上传</h2>
    </div>
    <div class="layui-inline" style="width:500px;">
        <hr>
    </div>
    <div class="layadmin-user-login-box layadmin-user-login-header">
        <div class="layui-form-item">
            <label class="layui-form-label">文档标题：</label>
            <div class="layui-input-inline">
                <input type="text" name="title" id="hideBookName" required  lay-verify="title"  autocomplete="off"
                       class="layui-input"style="width: 300px" >
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">文件简介：</label>
            <div class="layui-input-block">
                <textarea name="intro" placeholder="请输入内容" id="intro" required  class="layui-textarea" style="width: 300px"></textarea>
            </div>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <div class="layui-form-item">
                <label class="layui-form-label">下载积分：</label>
                <div class="layui-input-inline">
                    <input type="text"  onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" name="downscore" id="downScore" required  lay-verify="title"  autocomplete="off"
                           class="layui-input"style="width: 300px" >
                </div>
            </div>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <div class="layui-form-item">
                <label class="layui-form-label">选择文件：</label>
                <div class="layui-input-inline">
                    <label type="text" id="fileName"   required  lay-verify="title"  autocomplete="off"
                           class="layui-input"style="width: 200px" ></label>
                </div>
                <div class="layui-upload">
                <button type="button" class="layui-btn layui-btn-normal" id="test8" style="margin-left: 10px;">选择文件</button>
                </div>
            </div>
        </div>
    </div>
    <div class="demoTable">
        <div style="padding-bottom: 10px;">
            <div class="layui-upload">
                <button type="button" class="layui-btn" id="test9" style="margin-left: 160px;">上传</button>
            </div>
        </div>
    </div>
</div>
</body>
</body>
<%--<script src="${pageContext.request.contextPath}/static/school/js/upload1.js" type="text/javascript" charset="UTF-8"></script>--%>
<script>
    layui.use(['upload','jquery','element'], function(){
        var upload = layui.upload;
        //     $=layui.jquery,
        //     element=layui.element;
        // element.init();
        var path =$("#path").val();
        //执行实例
        var uploadInst = upload.render({
            elem: '#test8' //绑定元素
            ,url:  path + '/school/upload1' //上传接口
            ,auto: false//是否自动上传
            ,accept: 'file'
            // ,data : {//要传递的数据
            //     bookName: $("#hideBookName").val(),//用户输入的标题名字
            //     downScore: $("#downScore").val(),//下载分数
            //     intro: $("#intro").val(),//文件简介
            // }
            // ,multiple:true//上传多个文件
            ,bindAction: '#test9'//配合auto: false来使用，auto: true值一选中文件后就执行上传，关闭后需要根据绑定事件
            // ,progress:function (value) {//上传进度回调 value为进度值
            //     element.progress('demo',value+'%')
            // }
            // ,choose: function(obj){  //上传前选择回调方法
            //     obj.preview(function(index, file, result){
            //         //file表示文件信息，result表示文件src地址
            //         $("#fileName").text(file.name)
            //
            //     });
            // }
            // ,before: function(obj){
            //     //预读本地文件示例，不支持ie8
            //     obj.preview(function(index, file, result){
            //         $('#demo1').attr('src', result); //图片链接（base64）
            //     });
            //
            // }
            ,done: function(res){
                if(res.code == 0){
                    //上传完毕回调
                    alert("上传成功！");
                    window.location.reload();
                }
                if(res.code == 1){
                    //上传完毕回调
                    alert("上传异常11111！");
                }
                if(res.code == 2){
                    //上传完毕回调
                    alert("文件类型不匹配！");
                }
                if(res.code == 3){
                    //上传完毕回调
                    alert("文件或其他信息不能为空！");
                }
            }
            ,error: function(){
                //请求异常回调
                alert("上传异常！");
            }
        });
    });
</script>
</body>
</html>
