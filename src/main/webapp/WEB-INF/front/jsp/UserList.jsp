<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/19
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>预约列表</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/back/js/userlist.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body style="height: 100%;">
<div class="layui-container">
	<form action="${pageContext.request.contextPath}/ManageUsersServlet" method="post">
		<input type="hidden" name="method" value="usersInfoPage">
		<input type="hidden" name="curPage" value="1">
		<label>姓名：</label>
		<input type="text" id="uname" name="uname"  value="${param.account}" placeholder="请输入用户姓名"/>


		<div id="br_row" style="margin-left: 600px;">
			<button  type="button" class="layui-btn" id="serch">
				<i class="layui-icon">&#xe615;</i> 搜索
			</button>

		</div>
		<%--			<input class="layui-btn" type="submit" class="btn" value="搜索" />--%>
	</form>
</div>
<div id="center_div">
	<table id="demo" lay-filter="test"></table>
</div>
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<input type="hidden" id="path" value="${pageContext.request.contextPath}">

</body>
</html>
