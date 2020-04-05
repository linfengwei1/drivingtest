<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/3
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>用户登录</title>
	<% String path = request.getContextPath();%>
	<link rel="stylesheet" href="<%= path+"/front/css/login.css"%>">
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/front/js/login.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/js/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
</head>
<body>


<div id="loginBox">
	<form class="layui-form" action="${pageContext.request.contextPath}/user/login" method="post" >


		<div class="layui-form-item">
			<label class="layui-form-label">账号</label>
			<div class="layui-input-block">
				<input type="text" name="uname" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-block">
				<input type="password" name="pwd" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">验证码</label>
			<div class="layui-input-block">
				<input type="text" name="code" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item" style="margin-left: 100px;">
		<img alt="" src="${pageContext.request.contextPath}/CheckCodeServlet" border='1' onclick="this.src='${pageContext.request.contextPath}/CheckCodeServlet?'+Math.random();" id = "code">
		<a href="JavaScript:void(0)" onclick="document.getElementById('code').src='${pageContext.request.contextPath}/CheckCodeServlet?'+Math.random();">看不清,换一张</a>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即登录</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<button id="reg"  class="layui-btn layui-btn-warm">注册</button>
	<input type="hidden" id="path" value="${pageContext.request.contextPath}">
</div>
</body>
</html>
