<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/19
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="UTF-8">
	<title>预约列表</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/background/js/ToOrder.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body style="height: 100%;">
<div class="layui-container" style="margin-top: 20px">
	<form class="layui-form" action="">


		<div class="layui-row">
			<div class="layui-col-md12">
				<div class="layui-inline">
					<label class="layui-form-label">可预约时间:</label>
					<div class="layui-input-inline">
						<input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
					</div>
				</div>
			</div>
		</div>
		<div id="btn" class="layui-row layui-col-space2" style="margin-left: 110px">
			<div class="layui-col-xs2" style="width: 90px">
				<button type="button" data-status = "0"  class="layui-btn layui-btn-primary">08:00</button>
			</div>
			<div class="layui-col-xs2" style="width: 90px">
				<button type="button" data-status = "0"  class="layui-btn layui-btn-primary">09:00</button>
			</div>
			<div class="layui-col-xs2" style="width: 90px">
				<button type="button" data-status = "0"  class="layui-btn layui-btn-primary">10:00</button>
			</div>
			<div class="layui-col-xs2" style="width: 90px">
				<button type="button" data-status = "0"  class="layui-btn layui-btn-primary">11:00</button>
			</div>
			<div class="layui-col-xs2" style="width: 90px">
				<button type="button" data-status = "0"  class="layui-btn layui-btn-primary">12:00</button>
			</div>
			<div class="layui-col-xs2" style="width: 90px">
				<button type="button" data-status = "0"  class="layui-btn layui-btn-primary">13:00</button>
			</div>
			<div class="layui-col-xs2" style="width: 90px">
				<button type="button" data-status = "0"  class="layui-btn layui-btn-primary">14:00</button>
			</div>
			<div class="layui-col-xs2" style="width: 90px">
				<button type="button" data-status = "0"  class="layui-btn layui-btn-primary">15:00</button>
			</div>
			<div class="layui-col-xs2" style="width: 90px">
				<button type="button" data-status = "0" class="layui-btn layui-btn-primary">16:00</button>
			</div>
			<div class="layui-col-xs2" style="width: 90px">
				<button type="button" data-status = "0"  class="layui-btn layui-btn-primary">17:00</button>
			</div>
			<div class="layui-col-xs2" style="width: 90px">
				<button type="button" data-status = "0"  class="layui-btn layui-btn-primary">18:00</button>
			</div>
			<div class="layui-col-xs2" style="width: 90px">
				<button type="button" data-status = "0"  class="layui-btn layui-btn-primary">19:00</button>
			</div>

		</div>

		<div class="layui-row">
			<div class="layui-col-xs1 layui-col-xs-offset5">
				<button  id="tj" type="button" class="layui-btn">
					<i class="layui-icon"></i> 提交
				</button>
			</div>
		</div>
		<input type="hidden" id="consultant" value="${admin.clerkid}">
		<input type="hidden" id="url" value="${pageContext.request.contextPath}">

	</form>
</div>
</body>
</html>
