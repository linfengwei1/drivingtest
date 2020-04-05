<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
	<meta charset="UTF-8">
	<title>用户登录</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/front/js/login.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/js/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
</head>
<body>

<form action="${pageContext.request.contextPath}/admin/tologin" method="POST">
	<input type="text" name="uname" >
	<input type="password" name="pwd" >
	<button type="submit" style="width: 100px;height: 50px">登录</button>
</form>
</body>
</html>
