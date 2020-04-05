<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/12
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<%--	<script src="${pageContext.request.contextPath}/layui/layui.all.js" type="text/javascript" charset="utf-8"></script>--%>
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/background/js/AddAdmin.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<div style="margin-right: 51px;">


	<form class="layui-form" action="">
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-block">
				<input type="text" id="name" name="name" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">登录账号</label>
			<div class="layui-input-block">
				<input type="text" id="account" name="account" required  lay-verify="required" placeholder="请输入6-15位的字母数字组合" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-block">
				<input type="password" id="pwd" name="pwd" required  lay-verify="required" placeholder="请输入6-15位的字母数字组合" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-block">
				<input type="password" id="ensurepwd" name="ensurepwd" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">选择角色</label>
			<div class="layui-input-block">
				<select  id="roleid" name="roleid" lay-verify="required" lay-filter="roleid">
					<option value="1">系统管理员</option>
					<option value="2">咨询师</option>
					<option value="3">经理</option>
				</select>
			</div>
		</div>
		<div id="fielddiv" class="layui-form-item" style="display: none">
			<label class="layui-form-label">选择领域</label>
			<div class="layui-input-block">
<%--				<select  id="field" name="field" lay-verify="required" lay-filter="field">--%>
<%--					<option value="1">职场</option>--%>
<%--					<option value="2">家庭</option>--%>
<%--					<option value="3">社会</option>--%>
<%--				</select>--%>
				<input type="checkbox" value="1" name="field" title="职场" checked>
				<input type="checkbox" value="2" name="field" title="家庭">
				<input type="checkbox" value="3" name="field" title="社会">

			</div>
		</div>
		<div id="pricediv" class="layui-form-item" style="display: none">
			<label class="layui-form-label">输入费用(元)</label>
			<div class="layui-input-block">
				<input type="text" id="price" lay-filter="price" name="price" required  lay-verify="required" placeholder="请输入咨询费用/次" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div id="titlediv" class="layui-form-item" style="display: none">
			<label class="layui-form-label">选择职称</label>
			<div class="layui-input-block">
				<select  id="title" name="title" lay-verify="required" lay-filter="title">
					<option value="初级咨询师">初级咨询师</option>
					<option value="高级咨询师">高级咨询师</option>
					<option value="教授">教授</option>
					<option value="副教授">副教授</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">状态</label>
			<div class="layui-input-block">
				<select  id="status" name="status" lay-verify="required">
					<option value="1" selected = "selected">启用</option>
					<option value="2">禁用</option>
				</select>
			</div>
		</div>




		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">教育背景(毕业院校)</label>
			<div class="layui-input-block">
				<textarea id="des" name="des" placeholder="请输入内容" class="layui-textarea"></textarea>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">简介</label>
			<div class="layui-input-block">
				<textarea id="des1" name="des1" placeholder="请输入内容，不超过500字" class="layui-textarea"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<!--			<div class="layui-input-block">-->
			<!--				<button id="confirm" type="button" class="layui-btn">确认提交</button>-->
			<!--				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>-->
			<!--				<button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
			<!--			</div>-->
		</div>
	</form>
</div>
<script>
	//Demo
	layui.use('form', function(){
		var form = layui.form;
		//监听提交
		//但是，如果你的HTML是动态生成的，自动渲染就会失效
		form.render();

	});
</script>

</body>
</html>
