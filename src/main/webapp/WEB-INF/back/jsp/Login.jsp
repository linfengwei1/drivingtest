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
	<link rel="stylesheet" href="<%= path+"/background/css/login.css"%>">
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/ajaxUtil.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/background/js/login.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body>
<div id="loginBox">
	<form id="form_login" name="form_login" action="<%= path+"/logincheck"%>" method="post" >
		<input type="hidden" name="operation" value="login">
		<div class="title" >
			心理咨询系统
		   后台管理员登录
		</div>

		<div class="form_div">
			<img class="form_img" src="<%= path+"/background/img/loginIco.png"%>" style="opacity: 0.3;"/>
			<input type="text" id="uname" class="form_input" placeholder="请输入工号" name="username" tabindex="1">
			<span  id="prompt_uname" ></span>
		</div>
		<div class="form_tips"></div>
		<div class="form_div">
			<img class="form_img" src="<%= path+"/background/img/login_pwd.png"%>" style="opacity: 0.3;"/>
			<input id="password"  type="password" class="form_input text"maxlength="20"  name="password" placeholder="输入密码" tabindex="2"  />
			<span id="prompt_pwd" ></span>
		</div>
		<div class="form_tips">

		</div>
		<div class="form_div">
			<input id="checkcode" class="form_input text" maxlength="20" name="checkcode" placeholder="请输入验证码" tabindex="2" style="padding-left: 0px;width: 140px;">
		</div>
		<img id="img" title="点击更换验证码" src="/psychological/VerifyCodeServlet" style=" width:160px; height:40px;/*! float: left; */padding-top: 20px;padding-bottom: 20px;position: relative;right: 60px;">
		<span id="changecode" style="color: white; cursor: pointer;">看不清楚换一张</span>
		<input type="hidden" id="ip_url" value="${pageContext.request.contextPath}">
		<div class="form_btns">
			<input  type="button" class="btn" id="btn_Login" tabindex="3" value="登录"/>
		</div>





	</form>
</div>
</body>
</html>
