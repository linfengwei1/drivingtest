<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/21
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>Title</title>
	<meta charset="UTF-8">
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/background/js/Dealinfo.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<div class="layui-container">
	<div class="layui-row">
		<div class="layui-col-xs4">
			<div class="layui-form-item">
				<label class="layui-form-label">余额：</label>
				<label class="layui-form-label" style="text-align: left; color: grey">${admin.balance}元</label>
			</div>
		</div>
	</div>



</div>
<div id="center_div">
	<table class="layui-table"  lay-filter="test" id="demo" lay-size="sm" >
		<tr>
			<td colspan="6" style="color: #20B2AA; text-align: center" >收支明细 </td>

		</tr>
		<tr style="color: white; background-color: #808080;">
			<th>发生时间</th>
			<th>客户姓名</th>
			<th>咨询/预约</th>
			<th>金额（元）</th>

		</tr>
		<c:if test="${not empty deallist}">
			<c:forEach items="${deallist}" var="g">
				<tr><td><fmt:formatDate value="${g.dealtime}" type="date" dateStyle="long"/><fmt:formatDate value="${g.dealtime}" type="time" timeStyle="default"/></td>
				<td>${g.account}</td>
				<td>预约</td>
				<td>${g.price}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>
<div style="margin-left: 50%">
	<button  id="return" type="button" class="layui-btn layui-btn-lg layui-btn-normal">
		<i class="layui-icon">&#xe65c;</i> 返回
	</button>
	<input type="hidden" id="url" value="${pageContext.request.contextPath}">
</div>

</body>
</html>
