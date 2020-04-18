<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/9
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>预约详情</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <style>
        .layui-layout-body{
            overflow:auto; /*这边设置是为了弹出的时候，如果框的大小小于内容，就出现滑动条*/
        }
    </style>

</head>
<body class="layui-layout-body">
<div> <input type="hidden" id="id" name="id"></div>
<div class="df_bd" style="margin-left: 61px">
    <div class="bgl">
        <div class="usio">
            <div class="fra_title"><span><b class="backbg ico_usico"></b>个人信息<a href="javascript:void(0)"></a></span></div>
            <ul class="usio_ul">
                <li class="usio_ul_1">
                    <span>姓名：${student.name}</span>
                    <span>车型：C1</span>
                    <span>年龄：${student.age}岁</span>
                    <span>联系方式：${student.phone}</span>
                    <span>预约时间：${student.schoolName}</span>
                    <span>预约科目：${student.schoolName}</span>
                    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="q" ><i class="layui-icon">&#xe605;</i>申请考试</button>
                    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="w" ><i class="layui-icon">&#x1006;</i>驳回申请</button>
                    <a href="javascript:void(0)"><img alt="" class="xueyuan" src="${pageContext.request.contextPath}/static/${student.image}"></a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
