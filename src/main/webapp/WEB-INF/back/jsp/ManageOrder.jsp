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
	<script src="${pageContext.request.contextPath}/background/js/ManageOrder.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<div class="layui-container">
	<h1 style="margin-left: 40%;">预约管理</h1>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
	</fieldset>
	<div class="layui-row">
	<form class="layui-form" action="${pageContext.request.contextPath}/OrderManageServlet" method="post">
		<input type="hidden" name="method" value="getOrderRecord">
		<input type="hidden" name="curPage" value="1">
		<div class="layui-row" style="height: 39px;">
			<div class="layui-col-xs4">
				<div class="layui-form-item">
					<label class="layui-form-label">预约日期：</label>
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
					<label class="layui-form-label">咨询师：</label>
					<div class="layui-input-block">
						<input  type="text" class="layui-input" name="consultantname" id="consultantname" <c:if test="${not empty param.consultantname}">value="${param.consultantname}"</c:if> placeholder="请选输入咨询师名字">
					</div>
				</div>
			</div>
			<div class="layui-col-xs4">
				<div class="layui-form-item">
					<label class="layui-form-label" style="text-align: center;">用户:</label>
					<div class="layui-input-block">
						<input  type="text" class="layui-input" name="account" id="account" <c:if test="${not empty param.account}">value="${param.account}"</c:if> placeholder="请输入用户名">
					</div>
				</div>
			</div>
		</div>

		<div class="layui-row" style="height: 39px;">
			<div class="layui-col-xs1 layui-col-xs-offset10">
				<button  type="submit" class="layui-btn">
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
			<th>预约时间</th>
			<th>心理咨询师</th>
			<th>领域</th>
			<th>用户</th>
			<th>完成时间</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		<c:if test="${not empty orderRecordpageBean.list}">
			<c:forEach items="${orderRecordpageBean.list}" var="g">
				<tr><td><fmt:formatDate value="${g.time}" type="date" dateStyle="long"/><fmt:formatDate value="${g.time}" type="time" timeStyle="default"/></td>
				<td>${g.consultant}</td>
				<td>${g.field}</td>
				<td>${g.account}</td>
				<td><fmt:formatDate value="${g.opttime}" type="both" /></td>
				<td><c:choose>
					<c:when test="${g.statusid==1}">
						已预约
					</c:when>
					<c:when test="${g.statusid==2}">
						预约失败,用户余额不足
					</c:when>
					<c:when test="${g.statusid==3}">
						已确认
					</c:when>
					<c:when test="${g.statusid==4}">
						已诊断
					</c:when>
					<c:when test="${g.statusid==5}">
						已评价
					</c:when>
					<c:when test="${g.statusid==6}">
						被终止
					</c:when>
				</c:choose></td>
				<td>
					<c:choose>
						<c:when test="${g.statusid==1}">
							<div class="layui-btn-group">
								<input type="hidden" value="${g.userid}">
								<input type="hidden" value="${g.consultantid}">
								<input type="hidden" value="${g.id}">
								<button type="button" class="layui-btn ayui-btn-1" >查看详情</button>
								<button type="button" 	class="layui-btn layui-btn-warm">终止预约</button>
							</div>
						</c:when>

						<c:otherwise>
							<div class="layui-btn-group">
								<input type="hidden" value="${g.userid}">
								<input type="hidden" value="${g.consultantid}">
								<input type="hidden" value="${g.id}">
								<button type="button" class="layui-btn ayui-btn-1" >查看详情</button>
							</div>
						</c:otherwise>

					</c:choose>
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
				   href="${pageContext.request.contextPath}/OrderManageServlet?method=getOrderRecord&curPage=1&startdate=${param.startdate}&enddate=${param.enddate}&consultantname=${param.consultantname}&account=${param.account}">首页</a>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/OrderManageServlet?method=getOrderRecord&curPage=${orderRecordpageBean.prePageNum}&startdate=${param.startdate}&enddate=${param.enddate}&consultantname=${param.consultantname}&account=${param.account}">上一页</a>
				<c:if test="${not empty orderRecordpageBean.list}">
					<c:forEach begin="${orderRecordpageBean.startPage}" end="${orderRecordpageBean.endPage}" var="p">
						<c:choose>
							<c:when test="${curPage == p}">
								<a class="layui-btn layui-btn-warm" href="${pageContext.request.contextPath}/OrderManageServlet?method=getOrderRecord&curPage=${p}&startdate=${param.startdate}&enddate=${param.enddate}&consultantname=${param.consultantname}&account=${param.account}">${p}</a>
							</c:when>
							<c:otherwise>
								<a class="layui-btn" href="${pageContext.request.contextPath}/OrderManageServlet?method=getOrderRecord&curPage=${p}&startdate=${param.startdate}&enddate=${param.enddate}&consultantname=${param.consultantname}&account=${param.account}">${p}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/OrderManageServlet?method=getOrderRecord&curPage=${orderRecordpageBean.nextPageNum}&startdate=${param.startdate}&enddate=${param.enddate}&consultantname=${param.consultantname}&account=${param.account}">下一页</a>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/OrderManageServlet?method=getOrderRecord&curPage=${orderRecordpageBean.totalPageNum}&startdate=${param.startdate}&enddate=${param.enddate}&consultantname=${param.consultantname}&account=${param.account}" >尾页</a>
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
