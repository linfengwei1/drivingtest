<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/10
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
    <meta charset="utf-8">
    <title>修改题目</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">题目：</label>
        <div class="layui-input-inline">
            <input type="hidden" name="id" value="${subject.id}" class="layui-input">
            <input type="text" name="question" value="${subject.question}"  required  lay-verify="required" placeholder="请输入题目" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">答案A：</label>
        <div class="layui-input-inline">
            <input type="text" name="item1" value="${subject.item1}" required lay-verify="required" placeholder="请输入答案" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">答案B：</label>
        <div class="layui-input-inline">
            <input type="text" name="item2" value="${subject.item2}" required lay-verify="required" placeholder="请输入答案" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">答案C：</label>
        <div class="layui-input-inline">
            <input type="text" name="item3" value="${subject.item3}" required lay-verify="required" placeholder="请输入答案" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">答案D：</label>
        <div class="layui-input-inline">
            <input type="text" name="item4" value="${subject.item4}" required lay-verify="required" placeholder="请输入答案" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">正确答案：</label>
        <div class="layui-input-inline">
            <input type="text" name="answer" value="${subject.answer}"  required  lay-verify="required" placeholder="请输入正确答案" autocomplete="off" class="layui-input">
            <p>请输入1,2,3,4对应A,B,C,D。多选请按顺序输入</p>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图片地址：</label>
        <div class="layui-input-inline">
            <input type="text" name="url" value="${subject.url}" required lay-verify="required" placeholder="请输入图片地址" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">题目类型</label>
        <div class="layui-input-block">
            <input type="radio" name="type" value="1" title="单项选择" <c:if test="${subject.type=='1'}">checked</c:if> >
            <input type="radio" name="type" value="2" title="判断对错" <c:if test="${subject.type=='2'}">checked</c:if> >
            <input type="radio" name="type" value="3" title="多项选择" <c:if test="${subject.type=='3'}">checked</c:if> >
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</body>

<script>


    //Demo
    layui.use(['form','jquery'], function(){
        var form = layui.form,
            $=layui.jquery;


        //监听提交
        form.on('submit(formDemo)', function(data){

            console.log(data.field);

            var sub=JSON.stringify(data.field);

            $.ajax({
                //相应路劲
                url:"${pageContext.request.contextPath}/TM/updateSubject",
                //是否异步提交
                async:true,
                //请求类型
                type:"post",
                //数据名
                data:{"sub":sub,"who":"f"},
                //数据类型:文本
                datatype:"text",
                //返回成功消息
                success:function (msg) {
                    layer.alert("修改成功",{icon:6},function (index) {
                        //回调
                        layer.close(layer.index);
                        parent.location.reload(); // 父页面刷新
                    });

                },
                //返回失败消息
                error:function () {
                }
            });

            return false;
        });
    });
</script>
</html>
