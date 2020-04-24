<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-3-14
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学员信息修改</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath()%>/static/jquery-3.4.1.js"></script>
    <script src="<%=request.getContextPath()%>/static/json2.js"></script>
</head>
<body>

<input type="hidden" id="path" value="<%=path%>">
<div class="layui-main-login" >
    <form class="layui-form" action="" onsubmit="return false;">
        <div> <input type="hidden" id="id" name="id"></div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text"  id="name" name="name" required lay-verify="name" placeholder="请在此输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="text" id="phone" name="phone" required lay-verify="phone" placeholder="请输入手机号码" autocomplete="off" class="layui-input">
            </div>
            <span id="err3" style="color: red"></span>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;
        //同时支持多条规则的验证
        form.verify({
            phone: [
                /^1(3|4|5|6|7|8|9)\d{9}$/
                , '请输入正确的手机号码'
            ],
        });
        //监听提交
        form.on('submit(formDemo)', function(data){
            var path = $("#path").val();
            $.ajax({
                url:path+'/school/UpdateStudent',
                type:'post',
                data:data.field,
                success:function(data){
                    if ("error"==data){
                        layer.alert("更新失败",{icon:2});
                    }else if ("success"==data) {
                        layer.alert("更新成功",{icon:6},function () {
                            window.parent.location.reload();
                        });
                    }
                }, error: function () {
                    layer.alert("网络繁忙！")
                }
            });
            return false;
        });
    });
</script>
</html>
