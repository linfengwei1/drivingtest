<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/3
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<% String path_1 = request.getContextPath();%>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
	<%--	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="utf-8"></script>--%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/background/css/goodsmanage.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/background/js/ManageAdmin.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<div id="top_div">
	<input type="hidden" id="myid" value="${admin.clerkid}">
	<div id="option_div">
		<form action="${pageContext.request.contextPath}/AdminMainServlet" method="post">
			<input type="hidden" name="method" value="adminInfoPage">
			<input type="hidden" name="curPage" value="1">
			<label>姓名：</label>
			<input type="text" name="name"  value="${param.name}" placeholder="请后台人员姓名"/>
			<label>状态：</label>
			<select name="status">
				<option value="0" >暂无</option>
				<option value="1" <c:if test="${param.status =='1' }">selected="selected" </c:if>>启用</option>
				<option value="2" <c:if test="${param.status =='2' }">selected="selected" </c:if>>禁用</option>
				<option value="3" <c:if test="${param.status =='3' }">selected="selected" </c:if>>已删除</option>
			</select>
			<label>职称：</label>
			<select name="title">
				<option value="0">暂无</option>
				<option value="教授" <c:if test="${param.title =='教授' }">selected="selected" </c:if>>教授</option>
				<option value="副教授" <c:if test="${param.title =='副教授' }">selected="selected" </c:if>>副教授</option>
			</select>
			<div id="br_row" style="margin-left: 600px;">
				<button  type="submit" class="layui-btn">
					<i class="layui-icon">&#xe66f;</i> 搜索
				</button>
				<button id="addadmin" type="button" class="layui-btn">
					<i class="layui-icon">&#xe608;</i> 添加
				</button>

			</div>
<%--			<input class="layui-btn" type="submit" class="btn" value="搜索" />--%>
		</form>
		<div>
		</div>




	</div>





</div>
<div id="center_div">
	<table class="layui-table"  lay-filter="test" id="demo" lay-size="sm">
		<tr>
			<td colspan="5" style="color: #20B2AA; text-align: center" >后台人员信息</td>

		</tr>
		<tr style="color: white; background-color: #808080;">
			<th>姓名</th>
			<th>职称</th>
			<th>院校</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		<c:if test="${not empty pageBean.list}">
			<c:forEach items="${pageBean.list}" var="g">
				<tr><td>${g.name}</td>
					<td>${g.title}</td>
					<td>${g.background}</td>
					<td><c:choose>
						<c:when test="${g.statusid==1}">
							启用
						</c:when>
						<c:when test="${g.statusid==2}">
							禁用
						</c:when>
						<c:otherwise>
							已删除
						</c:otherwise>
					</c:choose></td>
					<td>
						<div class="layui-btn-group">
							<input type="hidden" value="${g.clerkid}">
							<button type="button" class="layui-btn ayui-btn-1" >${g.statusid==1?'禁用':'启用'}</button>
							<button type="button" 	class="layui-btn layui-btn-danger">删除</button>
							<button type="button" class="layui-btn layui-btn-normal">重置密码</button>
						</div>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>
<div id="bottom_div">
	<%--	<div id="pageoption_div">--%>
	<%--		<button  type="button" style="width: 80px;height: 35px;">上一页</button>--%>
	<%--		<label>1/3</label>--%>
	<%--		<button  type="button" style="width: 80px;height: 35px;">下一页</button>--%>
	<%--	</div>--%>
	<table class="" align="center">
		<tr>
			<td>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/AdminMainServlet?method=adminInfoPage&curPage=1&name=${param.name}&status=${param.status}&title=${param.title}">首页</a>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/AdminMainServlet?method=adminInfoPage&curPage=${pageBean.prePageNum}&name=${param.name}&status=${param.status}&title=${param.title}">上一页</a>
			<c:if test="${not empty pageBean.list}">
				<c:forEach begin="${pageBean.startPage}" end="${pageBean.endPage}" var="p">

<%--					<% String path_1 = request.getContextPath();%>--%>
					<c:choose>
						<c:when test="${curPage == p}">
							<a class="layui-btn layui-btn-warm" href="${pageContext.request.contextPath}/AdminMainServlet?method=adminInfoPage&curPage=${p}&name=${param.name}&status=${param.status}&title=${param.title}">${p}</a>
						</c:when>
						<c:otherwise>
							<a class="layui-btn" href="${pageContext.request.contextPath}/AdminMainServlet?method=adminInfoPage&curPage=${p}&name=${param.name}&status=${param.status}&title=${param.title}">${p}</a>
						</c:otherwise>
					</c:choose>

				</c:forEach>
			</c:if>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/AdminMainServlet?method=adminInfoPage&curPage=${pageBean.nextPageNum}&name=${param.name}&status=${param.status}&title=${param.title}">下一页</a>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/AdminMainServlet?method=adminInfoPage&curPage=${pageBean.totalPageNum}&name=${param.name}&status=${param.status}&title=${param.title}" >尾页</a>
			</td>
		</tr>
	</table>



</div>
<input type="hidden" id="url" value="${pageContext.request.contextPath}">
</body>
</html>

