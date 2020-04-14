<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-3-13
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
	<title>添加友情链接</title>
	<%
		String path = request.getContextPath();
	%>
	<link rel="stylesheet"
		  href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/static/layui/layui.js"
			type="text/javascript" charset="utf-8"></script>
	<script
			src="${pageContext.request.contextPath}/static/link/AddLink.js"
			type="text/javascript" charset="UTF-8"></script>
	<style>
		.layui-main-login {
			margin-top: 7%;
			margin-left: 20%;
			padding-left: 5%;
			padding-top: 2%;
			width: 50%;
		}

		.layui-layout-body {
			overflow: auto; /*这边设置是为了弹出的时候，如果框的大小小于内容，就出现滑动条*/
		}
	</style>
</head>
<body class="layui-layout-body">
<input type="hidden" id="path" value="<%=path%>">
<div class="layui-main-login">
	<form class="layui-form" action=" " onsubmit="return false">
<%--		<div class="layadmin-user-login-box layadmin-user-login-header"--%>
<%--			 style="background-color: #dadada">--%>
			<h2 style="margin-left: 43%">添加友情链接</h2>
<%--		</div>--%>
		<div class="layui-form-item">
			<label class="layui-form-label">连接地址</label>
			<div class="layui-input-inline" style="width: 190px">
				<input type="text" id="linkUrl" name="linkUrl" required
					   lay-verify="required" placeholder="请输入连接地址" autocomplete="off"
					   class="layui-input">
			</div>
			<span id="err1" style="color: red"></span>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">连接名称</label>
			<div class="layui-input-inline">
				<input type="text" id="linkName" name="linkName" required
					   lay-verify="required" placeholder="请输入连接名称" autocomplete="off"
					   class="layui-input">
			</div>

			<span id="err5" style="color: red"></span>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">连接排序</label>
			<div class="layui-input-inline">
				<input type="text" id="linkSort" name="linkSort" required
					   lay-verify="required" placeholder="请输入连接排序的顺序" autocomplete="off"
					   class="layui-input">
			</div>
			<span id="err2"></span>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>

				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</div>

</body>
</html>
