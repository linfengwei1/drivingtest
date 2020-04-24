<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-1-5
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%String path=request.getContextPath(); %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/homepage/css/homepage.css">--%>
<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/static/echarts.js" type="text/javascript" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/static/homepage/js/homepage.js" type="text/javascript" charset="utf-8"></script>
<html>
<head>
    <title>机动车驾驶员计时培训系统</title>
</head>
<body>
<div id="header" style="background-color: #f2f4f9;width: 100%;height:5%" align="right">
    <a href="">学员登录</a>
    <a href="">教练登录</a>
    <a href="">驾校登录</a>
    <a href="">交管登录</a>
</div>

<div class="layui-carousel" id="test1">
    <div carousel-item style="text-align :center">
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/home_logo2.jpg" /></div>
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage2.png" /></div>
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage3.jpg" /></div>
    </div>
</div>
<div>
    <div align="center">
<%--        <c:forEach items="${model.noticeList}" var="link">--%>
<%--            <tr style="height: 30px" style="background: #dadada">--%>
<%--                <td onclick="Jump(this)" title="${noticeList.id}">${link.title}</td>--%>
<%--                <td>${link.type}</td>--%>
<%--                <td align="cencer"><fmt:formatDate type="date" pattern="yyyy/MM/dd" dateStyle="medium" timeStyle="medium" value="${link.time}" /></td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
        <p style="font-size: 45px;font-family:黑体">${jumpNwePage.title}</p>
        <p style="font-size: 15px;font-family:宋体;margin-left: 20%;">发布时间：<fmt:formatDate type="date" pattern="yyyy/MM/dd" dateStyle="medium" timeStyle="medium" value="${jumpNwePage.time}" /></p>
        <br>
        <div STYLE="width: 80%;height: 100%;word-wrap: break-word;word-break: break-all" >
            <p style="font-size: 30px;font-family:宋体">${jumpNwePage.content}</p>
        </div>

    </div>
</div>


</body>
</html>

