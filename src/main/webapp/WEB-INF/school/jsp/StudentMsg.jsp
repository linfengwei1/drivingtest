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
    <title>学员信息</title>

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
                    <span>性别：${student.sex}性</span>
                    <span>年龄：${student.age}岁</span>
                    <span>联系方式：${student.phone}</span>
                    <span>
                        <c:if test="${student.student_state_id==1}">
                            账号状态：科目一学习
                        </c:if>
                        <c:if test="${student.student_state_id==2}">
                            账号状态：科目二学习
                        </c:if>
                        <c:if test="${student.student_state_id==3}">
                            账号状态：科目三学习
                        </c:if>
                        <c:if test="${student.student_state_id==4}">
                            账号状态：科目四学习
                        </c:if>
                        <c:if test="${student.student_state_id==5}">
                            账号状态：待审核
                        </c:if>
                        <c:if test="${student.student_state_id==6}">
                            账号状态：审核不通过
                        </c:if>
                        <c:if test="${student.student_state_id==7}">
                            账号状态：毕业
                        </c:if>
                        <c:if test="${student.student_state_id==8}">
                            账号状态：资料不完整
                        </c:if>
                        <c:if test="${student.student_state_id==9}">
                            账号状态：科目一申请考试
                        </c:if>
                        <c:if test="${student.student_state_id==10}">
                            账号状态：科目二申请考试
                        </c:if>
                        <c:if test="${student.student_state_id==11}">
                            账号状态：科目三申请考试
                        </c:if>
                        <c:if test="${student.student_state_id==12}">
                            账号状态：科目四申请考试
                        </c:if>
                    </span>
                    <span>就读驾校：${student.schoolName}</span>
                    <span>审核结果：${student.audit_results}</span>
                    <a href="javascript:void(0)"><img alt="" class="xueyuan" src="${pageContext.request.contextPath}/static${student.image}"></a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
