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
	<title>测试列表</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/background/js/TestReport.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<div class="layui-container">
	<h1 style="margin-left: 40%;">评测报告</h1>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
	</fieldset>
	<div class="layui-row">
	<form class="layui-form" action="${pageContext.request.contextPath}/ManageUsersServlet" method="post">
		<input type="hidden" name="method" value="getTestReportByPage">
		<input type="hidden" name="curPage" value="1">
		<div class="layui-row" style="height: 39px;">
			<div class="layui-col-xs4">
				<div class="layui-form-item">
					<label class="layui-form-label">评估日期：</label>
					<div class="layui-input-block">
						<input  type="text" class="layui-input" name="startdate" id="qBeginTime" <c:if test="${not empty param.startdate}">value="${param.startdate}"</c:if> placeholder="请选择时间">
					</div>
				</div>
			</div>
			<div class="layui-col-xs4">
				<div class="layui-form-item">
					<label class="layui-form-label" style="text-align: center;">至</label>
					<div class="layui-input-block">
						<input  type="text" class="layui-input" name="enddate" id="qEndTime" <c:if test="${not empty param.enddate}">value="${param.enddate}"</c:if> placeholder="请选择时间">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-row" style="height: 39px;">
			<div class="layui-col-xs4">
				<div class="layui-form-item">
					<label class="layui-form-label">得分：</label>
					<div class="layui-input-block">
						<input  type="number" lay-verify="number" class="layui-input" name="startscore" id="startscore" <c:if test="${not empty param.startscore}">value="${param.startscore}"</c:if> placeholder="请选输入分值">
					</div>
				</div>
			</div>
			<div class="layui-col-xs4">
				<div class="layui-form-item">
					<label class="layui-form-label" style="text-align: center;">至</label>
					<div class="layui-input-block">
						<input  type="number" lay-verify="number" class="layui-input" name="endscore" id="endscore" <c:if test="${not empty param.endscore}">value="${param.endscore}"</c:if> placeholder="请选输入分值">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-row" style="height: 39px;">
			<div class="layui-col-xs1 layui-col-xs-offset10">
				<button  type="submit" id="serch" class="layui-btn">
					<i class="layui-icon">&#xe615;</i> 搜索
				</button>
			</div>
		</div>
	</form>
</div>
<div id="center_div">
	<table class="layui-table"  lay-filter="test" id="demo" lay-size="sm">
		<tr>
			<td colspan="6" style="color: #20B2AA; text-align: center" >预约信息</td>
		</tr>
		<tr style="color: white; background-color: #808080;">
			<th>评估日期</th>
			<th>用户</th>
			<th>领域</th>
			<th>得分</th>
			<th>操作</th>
		</tr>
		<c:if test="${not empty testReportpageBean.list}">
			<c:forEach items="${testReportpageBean.list}" var="g">
				<tr><td><fmt:formatDate value="${g.time}" type="date" dateStyle="long"/><fmt:formatDate value="${g.time}" type="time" timeStyle="default"/></td>
				<td>${g.account}</td>
				<td>${g.name}</td>
				<td>${g.score}</td>
				<td>
					<div class="layui-btn-group">
						<input type="hidden" value="${g.testid}">
						<button type="button" class="layui-btn ayui-btn-1" >查看详情</button>
					</div>
				</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>
<div id="bottom_div">
	<table class="" align="center">
		<tr>
			<td>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/ManageUsersServlet?method=getTestReportByPage&curPage=1&startdate=${param.startdate}&enddate=${param.enddate}&startscore=${param.startscore}&endscore=${param.endscore}">首页</a>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/ManageUsersServlet?method=getTestReportByPage&curPage=${testReportpageBean.prePageNum}&startdate=${param.startdate}&enddate=${param.enddate}&startscore=${param.startscore}&endscore=${param.endscore}">上一页</a>
				<c:if test="${not empty testReportpageBean.list}">
					<c:forEach begin="${testReportpageBean.startPage}" end="${testReportpageBean.endPage}" var="p">
						<c:choose>
							<c:when test="${curPage == p}">
								<a class="layui-btn layui-btn-warm" href="${pageContext.request.contextPath}/ManageUsersServlet?method=getTestReportByPage&curPage=${p}&startdate=${param.startdate}&enddate=${param.enddate}&startscore=${param.startscore}&endscore=${param.endscore}">${p}</a>
							</c:when>
							<c:otherwise>
								<a class="layui-btn" href="${pageContext.request.contextPath}/ManageUsersServlet?method=getTestReportByPage&curPage=${p}&startdate=${param.startdate}&enddate=${param.enddate}&startscore=${param.startscore}&endscore=${param.endscore}">${p}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/ManageUsersServlet?method=getTestReportByPage&curPage=${testReportpageBean.nextPageNum}&startdate=${param.startdate}&enddate=${param.enddate}&startscore=${param.startscore}&endscore=${param.endscore}">下一页</a>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/ManageUsersServlet?method=getTestReportByPage&curPage=${testReportpageBean.totalPageNum}&startdate=${param.startdate}&enddate=${param.enddate}&startscore=${param.startscore}&endscore=${param.endscore}" >尾页</a>
			</td>
		</tr>
	</table>

</div>
<input type="hidden" id="url" value="${pageContext.request.contextPath}">
<script>
	//Demo
	layui.use('form', function(){
		var form = layui.form;
		//监听提交
		//但是，如果你的HTML是动态生成的，自动渲染就会失效
		form.render();
		form.render('select');
	});
</script>
</body>
</html>
