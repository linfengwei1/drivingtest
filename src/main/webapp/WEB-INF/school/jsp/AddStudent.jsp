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
    <title>学员注册</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/school/js/AddStudent.js" type="text/javascript" charset="UTF-8"></script>
    <style>
        .layui-main-login {
            margin-top: 7%;
            margin-left: 20%;
            padding-left: 5%;
            padding-top: 2%;
            width: 50%;
            background-color: #dadada;
        }
        .layui-layout-body{
            background-image: url(${pageContext.request.contextPath}/static/images/demo-1-bg.jpg);
            overflow:auto; /*这边设置是为了弹出的时候，如果框的大小小于内容，就出现滑动条*/
        }
    </style>
</head>
<body class="layui-layout-body">
<input type="hidden" id="path" value="<%=path%>">
<div class="layui-main-login">
    <form class="layui-form" action=" " onsubmit="return false" >
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
            <span id="err2"></span>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text"  id="name" name="name" required lay-verify="required" placeholder="请在此输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">身份证</label>
            <div class="layui-input-inline">
                <input type="text"   onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" id="idNumber" name="idNumber" required lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男">
                <input type="radio" name="sex" value="女" title="女" checked>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="text" id="phone" name="phone" required lay-verify="required" placeholder="请输入手机号码" autocomplete="off" class="layui-input">
            </div>
            <span id="err3" style="color: red"></span>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-inline">
                <input type="text"   onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" id="age" name="age" required lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
            </div>
        </div>
        <!--************这里是上传图片的代码***************-->
        <!--************这里添加的隐藏的输入框，用来传递images的参数***************-->
        <input type="hidden" name="image" class="image"  >
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
                <button class="layui-btn" lay-submit lay-filter="formDemo" id="OK">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

    </form>
</div>

</body>
</html>
