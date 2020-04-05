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
<script src="${pageContext.request.contextPath}/background/js/userchats.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

</head>
<body style="width: 100%;height: 100%">
<div class="layui-container">
	<form class="layui-form" action="${pageContext.request.contextPath}/AdminMainServlet" method="post">

	<input type="hidden" id="path" value="${pageContext.request.contextPath}">
	<input type="hidden" name="method" value="getConsultantData">

	<div class="layui-row" style="height: 39px;">
		<div class="layui-col-xs1 layui-col-xs-offset1">
			<button  id="z" type="button" class="layui-btn">
				 本周
			</button>
		</div>
		<div class="layui-col-xs1 layui-col-xs-offset1">
			<button  id="y" type="button" class="layui-btn">
				 本月
			</button>
		</div>
		<div class="layui-col-xs1 layui-col-xs-offset1">
			<button  id="b" type="button" class="layui-btn">
				 半年
			</button>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs8 layui-col-xs-offset3">
				<label id="count" class="layui-form-label" style="text-align: center; width: 500px"></label>
			</div>
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