<%--
  Created by IntelliJ IDEA.
  User: 49897
  Date: 2020/3/9
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>教练后台管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <%
        String path = request.getContextPath();
    %>
</head>
<body class="layui-layout-body">
<div class="df_bd" style="margin-left: 61px">
    <div class="bgl">
        <div class="usio">
            <div class="fra_title"><span><b class="backbg ico_usico"></b>教练信息<a href="javascript:void(0)"></a></span></div>
            <ul class="usio_ul">
                <li class="usio_ul_1">
                    <span>姓名：${coach.name}</span>
                    <span>车型：C1</span>
                    <span>性别：${coach.sex}性</span>
                    <span>年龄：${coach.age}岁</span>
                    <span>联系方式：${coach.phone}</span>
                    <span>身份证号：${coach.idnumber}</span>
                    <span>
                        <c:if test="${coach.coach_state_id==1}">
                            账号状态：启用
                        </c:if>
                        <c:if test="${coach.coach_state_id==2}">
                            账号状态：封停
                        </c:if>
                        <c:if test="${coach.coach_state_id==3}">
                            账号状态：禁止报名
                        </c:if>
                        <c:if test="${coach.coach_state_id==4}">
                            账号状态：运管待审核
                        </c:if>
                        <c:if test="${coach.coach_state_id==5}">
                            账号状态：运管审核不通过
                        </c:if>
                    </span>
<%--                    <span>就职驾校：${coach.schoolName}</span>--%>
<%--                    <span>审核结果：${coach.audit_results}</span>--%>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>

