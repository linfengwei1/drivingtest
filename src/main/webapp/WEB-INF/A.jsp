<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-4-7
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>登录页面跳转集合</title>
</head>
<body>
    <a href="<%=request.getContextPath()%>/school/path/SchoolLogin" ><li>学校登录</li></a>
    <a href="<%=request.getContextPath()%>/student/path/StudentLogin" ><li>学员登录</li></a>
    <a href="<%=request.getContextPath()%>/TM/login" ><li>运管登录</li></a>
    <a href="<%=request.getContextPath()%>/link/path/Welcome" ><li>首页</li></a>
    <a href="<%=request.getContextPath()%>/link/path/SchoolApple" ><li>文件上传</li></a>
</body>
</html>
