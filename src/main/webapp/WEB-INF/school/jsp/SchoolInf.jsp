<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-3-14
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>驾校信息</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/json2.js" type="text/javascript" charset="utf-8"></script>
    <style>
        .layui-form-item{
            margin-left: 30%;
        }
        .layui-form-label{
            color: #ff1000;
        }
        .layui-input{
            width: 150px;
        }
        body{
            background-image: url(${pageContext.request.contextPath}/static/images/0004w.jpg);
        }
    </style>
</head>
<body>

<input type="hidden" id="path" value="<%=path%>">
<div class="layui-main-login">
    <form class="layui-form" action="" onsubmit="return false;">
        <c:forEach items="${List}" begin="" var="ss">
        <div style="align-content: center">
            <div class="layui-form-item" style="margin-top: 5%">
                <label class="layui-form-label" >驾校名</label>
                <div class="layui-input-inline">
                    <input readonly="readonly" type="text"  id="name" name="name"  class="layui-input" value="${ss.name}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系方式</label>
                <div class="layui-input-inline">
                    <input type="text"  id="phone" name="phone"  class="layui-input" value="${ss.phone}" >
                </div>
                <span id="err3" style="color: red"></span>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">驾校地址</label>
                <div class="layui-input-inline">
                    <input type="text" id ="address" name="address" class="layui-input" value="${ss.address}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">驾校负责人</label>
                <div class="layui-input-inline">
                    <input type="text" id="admin" name="admin"  class="layui-input" value="${ss.admin}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">简介</label>
                <div class="layui-input-block">
                    <textarea style="width: 300px" name="intro" id="intro"  class="layui-textarea">${ss.intro}</textarea>
                </div>
            </div>
        </div>
            </c:forEach>
    <div class="layui-input-block">
        <button style="margin-left: 40%;" class="layui-btn" lay-submit lay-filter="formDemo">立即修改</button>
    </div>
</div>
    </form>
</div>
</body>
    <script>
        layui.use(['form','upload'], function(){
            var form = layui.form;
            var $ = layui.$,upload = layui.upload;
            var path = $("#path").val();


            $("#phone").blur(function (){
                var UserPhone3=$("#phone").val();;
                var r_UserPhone3 = /^1(3|4|5|6|7|8|9)\d{9}$/;
                if (!r_UserPhone3.test(UserPhone3)){
                    $("#err3").html("请输入正确的手机号码！");
                }else {
                    $("#err3").text("");
                }
            })

            //监听提交
            form.on('submit(formDemo)', function(data){
                var path = $("#path").val();
                $.ajax({
                    url: path + "/school/updateSchoolInf",
                    async: true,
                    type: "POST",
                    data:  data.field,
                    datatype: "text",
                    beforeSend:function () {
                        if ("请输入正确的手机号码！"==$("#err3").html()){
                            layer.alert("请输入正确的手机号码",{icon:2})
                            return false;
                        }

                    },
                    success: function (msg) {
                        if (msg == "success") {
                            layer.alert("修改成功",{icon:6},function () {
                                window.parent.location.reload();
                            });
                        } else {
                            layer.alert("修改失败",{icon:2})
                        }
                    },
                    error: function () {
                        layer.alert("网络繁忙！")
                    }
                });
                return false;
            });
        });
    </script>
</html>
