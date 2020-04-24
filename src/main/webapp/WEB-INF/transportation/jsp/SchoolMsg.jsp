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
            <div class="fra_title"><span><b class="backbg ico_usico"></b>驾校信息<a href="javascript:void(0)"></a></span></div>
            <ul class="usio_ul">
                <li class="usio_ul_1">
                    <span>驾校名：${school.name}</span>
                    <span>地址：${school.address}</span>
                    <span>联系方式：${school.phone}</span>
                    <span>驾校介绍：${school.intro}</span>
                    <span>
                        <c:if test="${school.school_state_id==1}">
                            驾校状态：禁止报名
                        </c:if>
                        <c:if test="${school.school_state_id==2}">
                            驾校状态：封停
                        </c:if>
                        <c:if test="${school.school_state_id==3}">
                            驾校状态：启用
                        </c:if>
                        <c:if test="${school.school_state_id==4}">
                            驾校状态：待审核
                        </c:if>
                        <c:if test="${school.school_state_id==5}">
                            驾校状态：审核不通过
                        </c:if>
                    </span>
                    <span>学员数量：${studentNum} 人</span>
                    <span>教练数量：${coachNum} 人</span>
                    <span>教练车持有数：${coachCarNum} 辆</span>
                    <span>审核结果：${school.audit_results}</span>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
