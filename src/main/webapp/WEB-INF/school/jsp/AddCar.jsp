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
    <title>添加车辆</title>
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
            <label class="layui-form-label">车牌号码</label>
            <div class="layui-input-inline">
                <input type="text"  id="carNumber" name="carNumber" required lay-verify="carNumber"  autocomplete="off" class="layui-input">
            </div>
            <span id="err1" style="color: red"></span>
        </div>
        <!--************这里是上传图片的代码***************-->
        <!--************这里添加的隐藏的输入框，用来传递images的参数***************-->
        <input type="hidden" name="image" class="image"  >
        <div class="layui-form-item">
            <label class="layui-form-label ">照片:</label>
            <div class="layui-upload">
                <button type="button" class="layui-btn" id="test1">上传图片</button>
                <div class="layui-upload-list">
                    <img class="layui-upload-img" id="demo1" style="width: 100px;height: 80px;margin-left: 18%;">
                    <p id="demoText"></p>
                </div>
            </div>
        </div>
        <!--************上面里是上传图片的代码***************-->
        <div class="layui-form-item">
            <label class="layui-form-label">教练名</label>
            <div class="layui-input-block" style="width: 190px;">
                <select  name="coach_id" id="coach_id" lay-verify="required">
                    <c:forEach items="${Coach}" begin="" var="ss">
                        <option value="${ss.id}" <c:if test="${coach_id}==${ss.id}">selected="selected"</c:if> >${ss.name}</option>
                    </c:forEach>
                </select>
            </div>
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
        var path = $("#path").val();
        $("#carNumber").blur(function (){
            //获取用户名的值
            var UserName3=$("#carNumber").val();
            //定义正则表达式
            var regExp = /(^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$)/
            //判断值是否符合正则表达式的规则
            if (!regExp.test(UserName3)){
                $("#err1").html("请输入正确的车牌号码");
            }else {
                $.ajax({
                    url: path + "/school/CheckCarNumber",
                    async: true,
                    type: "post",
                    data: "name=" + $("#carNumber").val(),
                    datatype: "text",
                    success: function (msg) {
                        if (msg == 1111) {
                            $("#err1").html("√");
                        } else  {
                            $("#err1").html("该车牌号已经被注册");
                            return false;
                        }
                    },
                    error: function () {
                        alert("网络繁忙");
                    }
                })
            }
        })
        //监听提交
        form.on('submit(formDemo)', function(data){

            $.ajax({
                url:path+'/school/addCar',
                type:'post',
                data:data.field,
                beforeSend:function () {
                    if ("该车牌号已经被注册"==$("#err1").text()){
                        layer.alert("该车牌号已经被注册",{icon:2})
                        return false;
                    }
                    if ("请输入正确的车牌号码"==$("#err1").text()){
                        layer.alert("请输入正确的车牌号码",{icon:2})
                        return false;
                    }
                },
                success:function(data){
                    if ("error"==data){
                        layer.alert("添加失败",{icon:2});
                    }else if ("success"==data) {
                        layer.alert("添加成功",{icon:6},function () {
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
