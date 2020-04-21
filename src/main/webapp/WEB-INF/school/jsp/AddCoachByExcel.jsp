<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-4-9
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>文件导入教练信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/json2.js" type="text/javascript" charset="utf-8"></script>
</head>
<style>

</style>
<body>

<form >
   <div align="center">
       <h1>文件导入教练信息</h1>
       <p>支持上传的文档格式为：.XLSX</p>
   </div>

    <div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">
        <div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
    </div>
    <div class="layui-form" action="" lay-filter="example">
        <div class="layadmin-user-login-box layadmin-user-login-header">
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
</form>
</body>
<script>
    layui.use(['upload','jquery','element'], function(){
        var upload = layui.upload;
            $=layui.jquery,
            element=layui.element;
        element.init();
        var path =$("#path").val();
        //执行实例
        var uploadInst = upload.render({
            elem: '#test8' //绑定元素
            ,url:  '${pageContext.request.contextPath}/school/AddCoachByExcel' //上传接口
            ,auto: false//是否自动上传
            ,accept: 'file'
            ,bindAction: '#test9'//配合auto: false来使用，auto: true值一选中文件后就执行上传，关闭后需要根据绑定事件
            ,progress:function (value) {//上传进度回调 value为进度值
                element.progress('demo',value+'%')
            }
            ,choose: function(obj){  //上传前选择回调方法
                obj.preview(function(index, file, result){
                    //file表示文件信息，result表示文件src地址
                    $("#fileName").text(file.name)

                });
            }
            ,done: function(res){
                console.log(res)
                if(res.code == 0){
                    //上传完毕回调
                    alert("上传成功！");
                    window.location.reload();
                }
                if(res.code == 1){
                    //上传完毕回调
                    alert("上传异常！");
                }
                if(res.code == 2){
                    //上传完毕回调
                    alert("文件类型不匹配！");
                }
                if(res.code == 3){
                    //上传完毕回调
                    alert("导入的数据为空！");
                }
                if(res.code == 4){
                    //上传完毕回调
                    var nameArr = [];
                    for (var i = 0;i<res.data.length;i++){
                        nameArr.push(res.data[i].account);
                    }
                    alert(nameArr+"账号已经被注册,请全部重新导入");
                }
            }
        });
    });
</script>
</html>
