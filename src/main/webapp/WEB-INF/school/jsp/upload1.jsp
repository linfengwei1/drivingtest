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
    <title>驾校申请</title>
    <%String path = request.getContextPath();%>
    <script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>

    <style>
        .layui-form-label{
            margin-left: 35%;
            color: red;
        }
        body{
            background-image: url(${pageContext.request.contextPath}/static/images/demo-1-bg.jpg);
            /*overflow:auto; !*这边设置是为了弹出的时候，如果框的大小小于内容，就出现滑动条*!*/
        }
    </style>

</head>

<body>
<input type="hidden" id="path" value="<%=path%>">
<div align="center">

</div>

    <div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">
        <div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
    </div>
    <div class="layui-form" action="" lay-filter="example">
        <div class="layadmin-user-login-box layadmin-user-login-header" style="margin-left: 50%;">
            <h2 style="color: red">驾校申请</h2>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline" style="width: 190px">
                <input  type="text" id="account" name="account" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
            </div>
            <span id="err1" style="color: red"></span>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码框</label>
            <div class="layui-input-inline">
                <input type="password" id="pwd"  name="pwd" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>

            <span id="err5" style="color: red"></span>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">重复输入</label>
            <div class="layui-input-inline">
                <input type="password"  id="rpassword" name="rpassword" required lay-verify="required" placeholder="请在此输入密码" autocomplete="off" class="layui-input">
            </div>
            <span id="err2" style="color: red"></span>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <div class="layui-form-item">
                <label class="layui-form-label">驾校名称：</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" id="name" required  lay-verify="title"  autocomplete="off"
                           class="layui-input"style="width: 300px" >
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">驾校简介：</label>
                <div class="layui-input-block">
                    <textarea name="intro" placeholder="请输入内容" id="intro" required  class="layui-textarea" style="width: 300px"></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">驾校法人：</label>
                <div class="layui-input-block">
                    <input type="text" name="admin" id="admin" required  lay-verify="title"  autocomplete="off"
                           class="layui-input"style="width: 300px" >
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">驾校地址：</label>
                <div class="layui-input-block">
                    <input type="text" name="address" id="address" required  lay-verify="title"  autocomplete="off"
                           class="layui-input"style="width: 300px" >
                </div>
            </div>
            <div class="layadmin-user-login-box layadmin-user-login-header">
                <div class="layui-form-item">
                    <label class="layui-form-label">联系方式：</label>
                    <div class="layui-input-inline">
                        <input type="text"  onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" name="phone" id="phone" required  lay-verify="title"  autocomplete="off"
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
                    <button type="button" class="layui-btn" id="test9" style="margin-left: 50%;">上传</button>
                </div>
            </div>
        </div>
    </div>


</body>
<script>


    $("#account").blur(function (){
        //获取用户名的值
        var UserName3=$("#account").val();
        //定义正则表达式
        var r_UserName3 = /^[\u4E00-\u9FA5A-Za-z0-9_]{2,18}$/;//6-8个字符
        //判断值是否符合正则表达式的规则
        if (!r_UserName3.test(UserName3)){
            $("#err1").html("正确用户名为2到18位中文、下划线、字母和数字组成");
        }else {
            $.ajax({
                url:  "${pageContext.request.contextPath}/school/CheckAccount",
                async: true,
                type: "post",
                data: "name=" + $("#account").val(),
                datatype: "text",
                success: function (msg) {
                    if (msg == 1111) {
                        $("#err1").html("√");
                    } else  {
                        $("#err1").html("用户名已经被注册");
                        return false;
                    }
                },
                error: function () {
                    alert("网络繁忙");
                }
            })
        }
    })

    $("#pwd").blur(function (){
        var  UserPaw3=$("#pwd").val()
        var  r_UserPaw3 =/^[A-Za-z0-9_]{6,8}$/;//(正确的密码为6到8位下划线、字母和数字组成)
        //判断值是否符合正则表达式的规则
        if (!r_UserPaw3.test(UserPaw3)){
            $("#err5").html("正确的密码为6到8位下划线、字母和数字组成！");
        }else {
            $("#err5").html("√");
        }
    })

    $("#rpassword").blur(function (){
        var paw =$("#pwd").val()
        var rpaw =$("#rpassword").val()
        if (paw!=rpaw){
            $("#err2").html("两次密码输入不一致");
        }else {
            $("#err2").html("√");
        }
    })

    layui.use(['upload','jquery','element'], function(){
        var upload = layui.upload;
            $=layui.jquery,
            element=layui.element;
        element.init();
        var path =$("#path").val();




        //执行实例
        var uploadInst = upload.render({
            elem: '#test8' //绑定元素
            ,url:  path + '/school/upload1' //上传接口
            ,auto: false//是否自动上传
            ,accept: 'file'
            ,bindAction: '#test9'//配合auto: false来使用，auto: true值一选中文件后就执行上传，关闭后需要根据绑定事件
            ,progress:function (value) {//上传进度回调 value为进度值
                element.progress('demo',value+'%')
            },before: function(obj){
                this.data = {//要传递的数据
                    name: $("#name").val(),//驾校名
                    intro: $("#intro").val(),//简介
                    admin: $("#admin").val(),//法人
                    address: $("#address").val(),//地址
                    phone: $("#phone").val(),//联系方式
                    Account:$("#err1").text(),//获取账号是否被注册
                    pwd: $("#err5").html(),//判断没什么是否符合
                    rpwd:$("#err2").html(),
                }

            }
            ,choose: function(obj){  //上传前选择回调方法
                obj.preview(function(index, file, result){
                    //file表示文件信息，result表示文件src地址
                    $("#fileName").text(file.name)

                });
            }
            ,done: function(res){
                if(res.code == 0){
                    //上传完毕回调
                    alert("上传成功！");
                    window.location.reload();
                }
                if(res.code == 1){
                    //上传完毕回调
                    alert("只接收doc和xlsx文件");
                }
                if(res.code == 2){
                    //上传完毕回调
                    alert("请填写正确的手机号码！");
                }
                if(res.code == 3){
                    //上传完毕回调
                    alert("文件或其他信息不能为空！");
                }
                if(res.code == 4){
                    //上传完毕回调
                    alert("请输入正确的账号密码！");
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
