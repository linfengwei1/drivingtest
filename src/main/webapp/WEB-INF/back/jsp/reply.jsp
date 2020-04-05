<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/19
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Title</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body>
<div class="layui-container">
	<form class="layui-form" action="">
		<div class="layui-row">
			<div class="layui-col-xs2">
				<div class="layui-form-item">
					<label class="layui-form-label">咨询人：</label>
				</div>
			</div>
			<div class="layui-col-xs2">
				<div class="layui-form-item">
					<label class="layui-form-label" style="color: grey;text-align: left">${orderRecord.account}</label>
				</div>
			</div>
			<div class="layui-col-xs2">
				<div class="layui-form-item">
					<label class="layui-form-label">领域：</label>
				</div>
			</div>
			<div class="layui-col-xs2">
				<div class="layui-form-item">
					<label class="layui-form-label" style="color: grey;text-align: left">${orderRecord.field}</label>
				</div>
			</div>
			<div class="layui-col-xs2">
				<div class="layui-form-item">
					<label class="layui-form-label">预约时间：</label>
				</div>
			</div>
			<div class="layui-col-xs2">
				<div class="layui-form-item">
					<label class="layui-form-label" style="color: grey;width: 190px; text-align: left"><fmt:formatDate value="${orderRecord.time}" type="both" /></label>
				</div>
			</div>
		</div>

		<div class="layui-row">
			<div class="layui-col-xs2">
				<div class="layui-form-item">
					<label class="layui-form-label" style="text-align: left">问题描述：</label>
				</div>
			</div>
		</div>
		<div class="layui-row" style="margin-top: 0px">
			<div class="layui-col-xs10 layui-col-xs-offset2">
				<p style="color: grey;text-align: left">${orderRecord.des}</p>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs2">
				<div class="layui-form-item">
					<label class="layui-form-label" style="text-align: left">我的答复：</label>
				</div>
			</div>
		</div>

		<div class="layui-row" style="margin-top: 0px">
			<div class="layui-col-xs10">
				<div class="layui-input-block">
					<textarea id="reply" name="des1" placeholder="请输入内容，不超过5000字" class="layui-textarea"></textarea>
				</div>
			</div>
		</div>
	</form>
</div>
</body>
</html>
