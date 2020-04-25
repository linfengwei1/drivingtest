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
    <title>添加违规记录</title>
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
        <%--body{--%>
        <%--    background-image: url(${pageContext.request.contextPath}/static/images/0004w.jpg);--%>
        <%--}--%>
    </style>
</head>
<body>

<input type="hidden" id="path" value="<%=path%>">
<div class="layui-main-login">
    <form class="layui-form" action="" >

        <div style="align-content: center">
            <div class="layui-form-item">
                <label class="layui-form-label">违规时间</label>
                <div class="layui-inline">
                    <%--                    <input class="layui-input" type="date" name="time1" id="datetime" autocomplete="off">--%>
                    <input type="text" class="layui-input" id="test1" name =datetime>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 5%">
                <label class="layui-form-label" >违规人员</label>
                <div class="layui-input-block" style="width: 190px;">
                    <select  name="coach_id" id="coach_id" lay-verify="required">
                        <c:forEach items="${Coach}" begin="" var="ss">
                            <option value="${ss.id}" <c:if test="${coach_id}==${ss.id}">selected="selected"</c:if> >${ss.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">违规内容</label>
                <div class="layui-input-block">
                    <textarea style="width: 300px" name="content" id="content"  class="layui-textarea"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">处罚结果</label>
                <div class="layui-input-inline">
                    <input type="text"  id="result" name="result"  class="layui-input"  >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">账号状态</label>
                <div class="layui-input-block" style="width: 190px;">
                    <select  name="coach_state_id" id="coach_state_id" lay-verify="required">
                        <option value=""></option>
                        <option value="1">启用</option>
                        <option value="2">封停</option>
                        <option value="3">禁止报名</option>
                    </select>
                </div>
            </div>

        </div>
    <div class="layui-input-block">
        <button style="margin-left: 35%;" class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
    </form>
</div>
</body>
    <script>
        layui.use(['form','upload','laydate'], function(){
            var form = layui.form;
            var $ = layui.$,upload = layui.upload;
            var laydate = layui.laydate;
            var path = $("#path").val();
            //执行一个laydate实例
            laydate.render({
                elem: '#test1' //指定元素
                ,type: 'datetime'
            });

            //阻止表单提交
            form.on('submit(formDemo)', function(data){
                return false;//阻止表单跳转
            });

            //监听提交
            form.on('submit(formDemo)', function(data){
                var path = $("#path").val();
                $.ajax({
                    url: path + "/school/AddPunish",
                    async: true,
                    type: "POST",
                    data:  data.field,
                    datatype: "text",
                    success: function (msg) {
                        if (msg == "success") {
                            layer.alert("提交成功",{icon:6},function () {
                                window.parent.location.reload();
                            });
                        } else {
                            layer.alert("提交失败",{icon:2})
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
