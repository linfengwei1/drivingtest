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
	<script src="${pageContext.request.contextPath}/background/js/ManageUser.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<div id="top_div">
	<input type="hidden" id="myid" value="${admin.clerkid}">
	<div id="option_div">
		<form action="${pageContext.request.contextPath}/ManageUsersServlet" method="post">
			<input type="hidden" name="method" value="usersInfoPage">
			<input type="hidden" name="curPage" value="1">
			<label>姓名：</label>
			<input type="text" name="account"  value="${param.account}" placeholder="请输入用户账号"/>
			<label>状态：</label>
			<select name="status">
				<option value="0" >暂无</option>
				<option value="1" <c:if test="${param.status =='1' }">selected="selected" </c:if>>启用</option>
				<option value="2" <c:if test="${param.status =='2' }">selected="selected" </c:if>>禁用</option>
				<option value="3" <c:if test="${param.status =='3' }">selected="selected" </c:if>>已删除</option>
			</select>

			<div id="br_row" style="margin-left: 600px;">
				<button  type="submit" class="layui-btn">
					<i class="layui-icon">&#xe615;</i> 搜索
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
			<td colspan="6" style="color: #20B2AA; text-align: center" >用户信息</td>

		</tr>
		<tr style="color: white; background-color: #808080;">
			<th>用户名</th>
			<th>性别</th>
			<th>年龄</th>
			<th>手机</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		<c:if test="${not empty userPageBean.list}">
			<c:forEach items="${userPageBean.list}" var="g">
				<tr><td>${g.account}</td>
					<td>${g.sex}</td>
					<td>${g.age}</td>
					<td>${g.phonenum}</td>
					<td><c:choose>
						<c:when test="${g.status==1}">
							启用
						</c:when>
						<c:when test="${g.status==2}">
							禁用
						</c:when>
						<c:otherwise>
							已删除
						</c:otherwise>
					</c:choose></td>
					<td>
						<div class="layui-btn-group">
							<input type="hidden" value="${g.userid}">
							<button type="button" class="layui-btn ayui-btn-1" >${g.status==1?'禁用':'启用'}</button>
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
				   href="${pageContext.request.contextPath}/ManageUsersServlet?method=usersInfoPage&curPage=1&account=${param.account}&status=${param.status}">首页</a>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/ManageUsersServlet?method=usersInfoPage&curPage=${userPageBean.prePageNum}&account=${param.account}&status=${param.status}">上一页</a>
				<c:forEach begin="${userPageBean.startPage}" end="${userPageBean.endPage}" var="p">
					<c:choose>
						<c:when test="${curPage == p}">
							<a class="layui-btn layui-btn-warm" href="${pageContext.request.contextPath}/ManageUsersServlet?method=usersInfoPage&curPage=${p}&account=${param.account}&status=${param.status}">${p}</a>
						</c:when>
						<c:otherwise>
							<a class="layui-btn" href="${pageContext.request.contextPath}/ManageUsersServlet?method=usersInfoPage&curPage=${p}&account=${param.account}&status=${param.status}">${p}</a>
						</c:otherwise>
					</c:choose>

				</c:forEach>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/ManageUsersServlet?method=usersInfoPage&curPage=${userPageBean.nextPageNum}&account=${param.account}&status=${param.status}">下一页</a>
				<a class="layui-btn"
				   href="${pageContext.request.contextPath}/ManageUsersServlet?method=usersInfoPage&curPage=${userPageBean.totalPageNum}&account=${param.account}&status=${param.status}" >尾页</a>
			</td>
		</tr>
	</table>



</div>
<input type="hidden" id="url" value="${pageContext.request.contextPath}">
</body>
</html>

