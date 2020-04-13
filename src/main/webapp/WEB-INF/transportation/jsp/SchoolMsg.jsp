<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/12
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学校信息页</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
</head>
<body class="layui-layout-body">
<div class="df_bd" style="margin-left: 61px">
    <div class="bgl">
        <div class="usio">
            <div class="fra_title"><span><b class="backbg ico_usico"></b>个人信息<a href="javascript:void(0)"></a></span></div>
            <ul class="usio_ul">
                <li class="usio_ul_1">
                    <span>驾校名：${school.name}</span>
                    <span>地址：C1</span>
                    <span>联系方式：${student.phone}</span>
                    <span>驾校介绍：${student.sex}性</span>
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
                    </span>
                    <span>学员数量：${student.schoolName}</span>
                    <span>教练数量：${student.schoolName}</span>
                    <span>教练车持有数：${student.audit_results}</span>
                    <span>审核结果：${student.audit_results}</span>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
