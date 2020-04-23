<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/15
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/static/coach/js/ToOrder.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<input type="hidden" id="coachid" value="${coach.id}">
<input type="hidden" id="schoolid" value="${coach.school_id}">
<div class="layui-container">
	<form class="layui-form" action="">
		<div class="layui-row">
			<div class="layui-col-md5">
				<label class="layui-form-label">预约科目:</label>
				<div class="layui-input-block">
					<select  id="subject" name="subject" lay-verify="required" lay-filter="subject" placeholder="请选择领域">
						<%--						<option value="0">请选择</option>--%>
						<option value="0">未选择</option>
						<option value="1">科目一</option>
						<option value="2">科目二</option>
						<option value="3">科目三</option>
						<option value="4">科目四</option>
					</select>
				</div>
			</div>



			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-inline">
						<label class="layui-form-label">选择日期:</label>
						<div class="layui-input-inline">
							<input  type="text" class="layui-input" id="test1" placeholder="请选择时间">
							<input  type="hidden" id="timeinput">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-form-item">
						<label class="layui-form-label">可选时间:</label>
						<div class="layui-input-block">
							<input type="radio" disabled class="timec" name="time" value="09:00" title="上午09:00">
							<input type="radio" disabled class="timec" name="time" value="15:00" title="下午15:00">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-inline">
						<label class="layui-form-label">可选学生:</label>
						<div class="layui-form-item">
							<div class="layui-input-block" id="student">
							</div>
						</div>
						<div class="layui-input-inline">
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="layui-row">
			<div class="layui-col-md4 layui-col-md-offset7">
				<button type="button" class="layui-btn">确认预约</button>
			</div>
		</div>

		<div class="layui-row">
			<div class="layui-col-md4 layui-col-md-offset7">
				<span style="color: grey">预约人数不能超过5名</span>
			</div>
		</div>
	</form>
</div>

</body>
</html>
