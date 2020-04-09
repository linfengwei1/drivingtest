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
	<title>学员登录</title>
	<%String path = request.getContextPath();%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>

</head>
<body class="layui-layout-body"  style="overflow-y:scroll;overflow-x:scroll">
<div class="untop">
	<ul class="menu">
		<!--        <li class="backbg logo" onclick="location.href='/home/index'"></li>-->
		<li class="title">机动车驾驶员网上理论学习平台</li>

	</ul>
</div>
<div class="layui-layout layui-layout-admin">
	<div class='layui-header header' style="background-color: #1470a3;">
		<ul class="layui-nav">


			<li class="layui-nav-item"><a href="${pageContext.request.contextPath}/student/StudentInfo" target="frame_div">首页</a></li>
			<li class="layui-nav-item">
				<a href="javascript:;">理论学习</a>
				<dl class="layui-nav-child">
					<dd><a href="${pageContext.request.contextPath}/student/VedioStudy" target="frame_div">科目一</a></dd>
					<dd><a href="${pageContext.request.contextPath}/student/VedioStudy" target="frame_div">科目四</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;">模拟考试</a>
				<dl class="layui-nav-child">
					<dd><a href="${pageContext.request.contextPath}/student/VedioStudy" target="frame_div">科目一</a></dd>
					<dd><a href="${pageContext.request.contextPath}/student/VedioStudy" target="frame_div">科目四</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item">
				<a href="">考试信息</a>
			</li>
			<li class="layui-nav-item"><a href="">社区</a></li>
		</ul>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="javascript:;">
					<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
					峰采
				</a>
				<dl class="layui-nav-child">
					<dd><a href="">基本资料</a></dd>
					<dd><a href="">安全设置</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item"><a href="">退出</a></li>
		</ul>
	</div>

<%--	<div style="height: 60%;width: 100%">--%>
<%--		<iframe  name="frame_div" src="${pageContext.request.contextPath}/student/StudentInfo"  style="width: 100%;height: 100%"></iframe>--%>
<%--	</div>--%>

	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md12">

				<iframe name="frame_div" src="${pageContext.request.contextPath}/student/StudentInfo" style="width: 1140px;height: 500px;border: none;overflow-y: hidden;overflow-x: hidden;"></iframe>


<%--				<iframe  name="frame_div" src="${pageContext.request.contextPath}/student/StudentInfo" style="width: 1140px;"></iframe>--%>
			</div>
		</div>
	</div>
<script>
	//JavaScript代码区域
	layui.use('element', function(){
		var element = layui.element;

	});
</script>
</body>
</html>
