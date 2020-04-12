<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>友情链接管理</title>
<%
	String path = request.getContextPath();
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/static/layui/layui.js"
	type="text/javascript" charset="utf-8"></script>
<script
	src="${pageContext.request.contextPath}/static/link/LinkManage.js"
	type="text/javascript" charset="UTF-8"></script>
</head>
<body>
	<input type="hidden" id="path" value="<%=path%>">
	<form class="layui-form" action="" onsubmit="return false;">
		<div class="layadmin-user-login-box layadmin-user-login-header"
			style="background-color: #dadada">
			<h2 style="margin-left: 43%">友情链接管理</h2>
		</div>
		<div class="layui-fluid" id="searchTable" style="margin-top: 1%;">
			<%--添加友情链接按钮--%>
			<div style="clear: left; padding-top: 10px; margin-left: 25%">

				<button type="button" class="layui-btn layui-btn-normal" id="add">
					<i class="layui-icon">&#xe654;</i>添加友情链接
				</button>

<%--				<button type="button" class="layui-btn layui-btn-warm" id="update">--%>
<%--					<i class="layui-icon">&#xe642;</i>更新友情链接--%>
<%--				</button>--%>

<%--				<button type="button" class="layui-btn layui-btn-danger" id="delete">--%>
<%--					<i class="layui-icon">&#xe640;</i>删除友情链接--%>
<%--				</button>--%>
			</div>
<%--			&lt;%&ndash;更新友情链接按钮&ndash;%&gt;--%>
<%--			<div style="clear: left; padding-top: 0px; margin-left: 55%">--%>

<%--				<button type="button" class="layui-btn layui-btn-warm" id="update">--%>
<%--					<i class="layui-icon">&#xe642;</i>更新友情链接--%>
<%--				</button>--%>
<%--			</div>--%>
<%--			&lt;%&ndash;删除友情链接按钮&ndash;%&gt;--%>
<%--			<div style="clear: left; padding-top: 0px; margin-left: 85%">--%>

<%--				<button type="button" class="layui-btn layui-btn-danger" id="delete">--%>
<%--					<i class="layui-icon">&#xe640;</i>删除友情链接--%>
<%--				</button>--%>
<%--			</div>--%>

		</div>
		<div class="layui-anim layui-anim-scale">

			<table id="dataTable" lay-filter="test"></table>
		</div>
		<script type="text/html" id="butdiv">
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="update" ><i class="layui-icon">&#xe642;</i>更新</button>
    </script>

	</form>

</body>
</html>
