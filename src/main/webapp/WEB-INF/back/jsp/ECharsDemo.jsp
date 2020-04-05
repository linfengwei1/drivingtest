<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>EChars插件使用案例</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/echarts.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/json2.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/background/js/Statistics.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

</head>
<body style="width: 100%;height: 100%">
<div class="layui-container">
	<form class="layui-form" action="${pageContext.request.contextPath}/AdminMainServlet" method="post">

	<input type="hidden" id="path" value="${pageContext.request.contextPath}">
	<input type="hidden" name="method" value="getConsultantData">
	<div class="layui-row">
		<div class="layui-col-xs6">
			<div class="layui-form-item">
				<label class="layui-form-label">预约日期：</label>
				<div class="layui-input-block">
					<input  type="text" class="layui-input" name="startdate" id="qBeginTime" <c:if test="${not empty param.startdate}">value="${param.startdate}"</c:if> placeholder="请选择时间">
				</div>
			</div>
		</div>
		<div class="layui-col-xs6">
			<div class="layui-form-item">
				<label class="layui-form-label" style="text-align: center;width: 200px;">至</label>
				<div class="layui-input-block">
					<input  type="text" class="layui-input" name="enddate" id="qEndTime" <c:if test="${not empty param.enddate}">value="${param.enddate}"</c:if> placeholder="请选择时间">
				</div>
			</div>
		</div>
	</div>
	<div class="layui-row" style="height: 39px;">
		<div class="layui-col-xs3 layui-col-xs-offset3">
			<label id="count" class="layui-form-label" style="text-align: center; width: 500px"></label>
		</div>
		<div class="layui-col-xs1 layui-col-xs-offset10">
			<button  id="s" type="button" class="layui-btn">
				<i class="layui-icon">&#xe615;</i> 搜索
			</button>
		</div>
	</div>
		<div id="echarts_div" style="width: 100%;height: 400px"></div>
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