<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/18
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>我要预约</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/ToOrder.css" charset="UTF-8">

	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/layui/layui.all.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" charset="UTF-8">

</head>
<body>
<div class="layui-container">
	<form class="layui-form" action="">
		<h1 style="margin-left: 50%;">预约详情</h1>
		<div class="layui-row">
			<div class="layui-col-xs4">
				<label class="layui-form-label" style="width: 80px;text-align: right">咨询人：</label>
				<label class="layui-form-label" style="width: 100px;text-align: left;color: grey">${orderRecord.account}</label>
			</div>
			<div class="layui-col-xs4">
				<label class="layui-form-label" style="width: 80px;text-align: right">领域：</label>
				<label class="layui-form-label" style="width: 100px;text-align: left;color: grey">${orderRecord.field}</label>
			</div>
			<div class="layui-col-xs4">
				<label class="layui-form-label" style="width: 80px;text-align: right">咨询时间：</label>
				<label class="layui-form-label" style="width: 100px;text-align: left;color: grey"><fmt:formatDate value="${orderRecord.time}" type="both" /></label>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs4">
				<label class="layui-form-label" style="width: 80px;text-align: right">预约状态：</label>
				<label class="layui-form-label" style="width: 100px;text-align: left;color: grey">
					<c:choose>
						<c:when test="${orderRecord.statusid==1}">
							已预约
						</c:when>
						<c:when test="${orderRecord.statusid==2}">
							预约失败
						</c:when>
						<c:when test="${orderRecord.statusid==3}">
							已确认
						</c:when>
						<c:when test="${orderRecord.statusid==4}">
							已诊断
						</c:when>
						<c:when test="${orderRecord.statusid==5}">
							已评价
						</c:when>
						<c:when test="${orderRecord.statusid==6}">
							被终止
						</c:when>
						</c:choose>
						</label>
			</div>
			<div class="layui-col-xs4">
				<label class="layui-form-label" style="width: 80px;text-align: right">费用：</label>
				<label class="layui-form-label" style="width: 100px;text-align: left;color: grey">${orderRecord.price}</label>
			</div>
			<div class="layui-col-xs4">
				<label class="layui-form-label" style="width: 80px;text-align: right">咨询师：</label>
				<label class="layui-form-label" style="width: 100px;text-align: left;color: grey">${orderRecord.consultant}</label>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12">
				<label class="layui-form-label">问题描述：</label>
				<div class="layui-input-block">
					<p style="color: grey;margin-top: 9px;">${orderRecord.des}<p>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12">
				<label class="layui-form-label">诊断答复：</label>
				<div class="layui-input-block">
					<p style="color: grey;margin-top: 9px;"><c:choose><c:when test="${not empty orderRecord.replycontent}">${orderRecord.replycontent}</c:when><c:otherwise>未回复</c:otherwise></c:choose><p>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12">
				<label class="layui-form-label" style="width: 80px;text-align: right">答复时间：</label>
				<label class="layui-form-label" style="width: 400px;text-align: left;color: grey">
				 <c:if test="${not empty orderRecord.replytime}"><fmt:formatDate value="${orderRecord.replytime}" type="both" /></c:if>
				</label>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12">
				<label class="layui-form-label">评价内容：</label>
				<div class="layui-input-block">
					<p style="color: grey;margin-top: 9px;"><c:choose><c:when test="${not empty orderRecord.appraise}">${orderRecord.appraise}</c:when><c:otherwise>未评价</c:otherwise></c:choose></p>
				</div>
			</div>
		</div>
	</form>
</div>
</body>
</html>
