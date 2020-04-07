<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/3
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--	<meta charset="UTF-8">--%>
<%--	<title>用户登录</title>--%>
<%--	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>--%>
<%--	<script src="${pageContext.request.contextPath}/static/student/js/login.js" type="text/javascript" charset="UTF-8"></script>--%>
<%--	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>--%>
<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">--%>
<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/login.css">--%>
<%--</head>--%>
<%--<body>--%>


<%--<div id="loginBox">--%>
<%--	<form class="layui-form" action="${pageContext.request.contextPath}/student/login" method="post" >--%>

<%--		<div class="layui-form-item" style="margin-right: 20px;margin-top: 10px">--%>
<%--			<label class="layui-form-label">账号</label>--%>
<%--			<div class="layui-input-block">--%>
<%--				<input type="text" name="account" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="layui-form-item"  style="margin-right: 20px">--%>
<%--			<label class="layui-form-label">密码</label>--%>
<%--			<div class="layui-input-block">--%>
<%--				<input type="password" name="pwd" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="layui-form-item"  style="margin-right: 20px">--%>
<%--			<label class="layui-form-label">验证码</label>--%>
<%--			<div class="layui-input-block">--%>
<%--				<input type="text" name="code" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="layui-form-item" style="margin-left: 100px;">--%>
<%--		<img alt="" src="${pageContext.request.contextPath}/checkcode" border='1' onclick="this.src='${pageContext.request.contextPath}/CheckCodeServlet?'+Math.random();" id = "code">--%>
<%--		<a href="JavaScript:void(0)" onclick="document.getElementById('code').src='${pageContext.request.contextPath}/CheckCodeServlet?'+Math.random();">看不清,换一张</a>--%>
<%--		</div>--%>
<%--		<div class="layui-form-item">--%>
<%--			<div class="layui-input-block">--%>
<%--				<button class="layui-btn" lay-submit lay-filter="formDemo">立即登录</button>--%>
<%--				<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</form>--%>
<%--	<input type="hidden" id="path" value="${pageContext.request.contextPath}">--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>



<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-3-15
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>驾校登录</title>
	<%String path = request.getContextPath();%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/school/js/SchoolLogin.js" type="text/javascript" charset="UTF-8"></script>
	<style>
		.layui-main-login {
			padding: 2%;
			width:30%;
			background-color: #ffffff;
			float: right;
			margin:50px 100px 0 0 ;
		}
		#two{
			height: 15%;
			background-color: #f9fdff;
		}
		#one{
			height: 70%;
			background-image: url(${pageContext.request.contextPath}/static/images/bgLogin.jpg);
		}

	</style>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div id="two">
	<br>
	<h1><span style="color: #42627c; padding-top: 10%;margin-left: 10%">机动车驾驶员培训机构信息互动平台</span></h1>
</div>
<div id="one">
	<div class="layui-main-login" >
		<form class="layui-form" action="" onsubmit="false">
			<div class="layui-form-item">
				<label class="layui-form-label">账号框</label>
				<div class="layui-input-block" style="width: 190px">
					<input style="background-color: #f7f8fa" type="text" name="account" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码框</label>
				<div class="layui-input-inline">
					<input style="background-color: #f7f8fa" type="password" name="pwd" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">验证码</label>
				<div class="layui-input-block" style="width: 190px">
					<input style="background-color: #f7f8fa" type="text" name="rePass" required  lay-verify="required" placeholder="不区分大小写" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<img id="passPhoto"  style="padding-left: 110px;" src="<%=request.getContextPath()%>/school/CheckCodeServlet" onclick="refreshCode()">
				<a  style=" font-size:12px;color: red" onclick="refreshCode()" >看不清?点图片刷新</a>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<%--走ajax提交--%>
					<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
					<%--走表单提交--%>
					<%--                <button type="submit" class="layui-btn" lay-submit >立即提交</button>--%>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
			<%--            <div id="p21">--%>
			<%--                <a id="p5" href="<%=request.getContextPath()%>/user/path/register" style="color: red;padding-left: 60%;">立即注册新账户</a>--%>
			<%--            </div>--%>
		</form>
	</div>
</div>
<div align="center">
	<p>
		<a href="#">版权所有：传一科技JX1908</a>
	</p>
	<p>
		<a href="#">技术支持：传一科技JX1908第四小组</a>
	</p>
</div>
</body>
</html>
