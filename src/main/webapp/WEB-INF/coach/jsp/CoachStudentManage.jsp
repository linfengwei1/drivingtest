<%--
  Created by IntelliJ IDEA.
  User: Mr.Fan
  Date: 2020-3-10
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学员管理</title>
    <%String path = request.getContextPath(); %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/coach/js/CoachStudentManage.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" action="" onsubmit="return false;">
    <div class="layadmin-user-login-box layadmin-user-login-header" style="background-color: #dadada">
        <h2 style="margin-left: 43%">学员管理</h2>
    </div>
    <div class="layui-fluid" id="searchTable" style="margin-top: 1%;">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <div style="padding-bottom: 10px;">
                <div class="layui-upload">
                    <div style="float: left;margin-left: 12%">
                        <label class="layui-form-label">状态</label>
                        <div class="layui-input-block" style="width: 190px;">
                            <select  name="state" id="state" lay-verify="required">
                                <option value=""></option>
                                <option value="1">科目一</option>
                                <option value="2">科目二</option>
                                <option value="3">科目三</option>
                                <option value="4">科目四</option>
                                <option value="5">待审核</option>
                                <option value="6">审核不通过</option>
                                <option value="7">毕业</option>
                                <option value="9">科目一申请考试</option>
                                <option value="10">科目二申请考试</option>
                                <option value="11">科目三申请考试</option>
                                <option value="12">科目四申请考试</option>
                                <option value="13">科目一考试中</option>
                                <option value="14">科目二考试中</option>
                                <option value="15">科目三考试中</option>
                                <option value="16">科目四考试中</option>
                            </select>
                        </div>
                    </div>

                    <div style="float: left">
                        <label class="layui-form-label" >姓名</label>
                        <div class="layui-input-block" style="width: 190px">
                            <input class="layui-input" name="name" id="name" autocomplete="off">
                        </div>
                    </div>
                    <div style="float: left">
                        <label class="layui-form-label" >联系方式</label>
                        <div class="layui-input-block" style="width: 190px">
                            <input class="layui-input" name="phone" id="phone" autocomplete="off">
                        </div>
                    </div>
                    <div style="float: left;margin-left: 12%">
                        <label class="layui-form-label" >身份证号码</label>
                        <div class="layui-input-block" style="width: 190px">
                            <input class="layui-input" name="idnumber" id="idnumber" autocomplete="off">
                        </div>
                    </div>
                    <div style="float: left;">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block" style="width: 190px;">
                            <select  name="state" id="sex" lay-verify="required">
                                <option value=""></option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div style="float: left;margin-left: 3% ">
                        <button type="button"  class="layui-btn layui-btn-normal" data-type="reload"><i class="layui-icon">&#xe615;</i>搜索</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-anim layui-anim-scale" style="clear: left">
        <table id="dataTable" lay-filter="test"></table>
    </div>
    <script type="text/html" id="butdiv">
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>预约考试</button>
    </script>

</form>

</body>
</html>
