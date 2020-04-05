<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/12
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="${pageContext.request.contextPath}/js/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo" style="width:30%;font-size: 22px;text-align: left;text-indent: 20px;">文档分享平台</div>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="">
					<img src="${pageContext.request.contextPath}/front/img/self.png" class="layui-nav-img">
				</a>
				<dl class="layui-nav-child">
					<dd><a href="">基本资料</a></dd>
					<dd><a href="">安全设置</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item"><a href="">退了</a></li>
		</ul>
	</div>

	<div class="layui-side layui-bg-black">
		<div class="layui-side-scroll">
			<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
			<ul class="layui-nav layui-nav-tree"  lay-filter="test">
				<li class="layui-nav-item">
					<a href="${pageContext.request.contextPath}/front/jsp/UserList.jsp" target="frame_div">用户列表</a>
				</li>
				<li class="layui-nav-item">
					<a href="${pageContext.request.contextPath}/front/jsp/Upload.jsp" target="frame_div">上传文件</a>
				</li>

			</ul>
		</div>
	</div>

	<div class="layui-body">
		<!-- 内容主体区域 -->
		<iframe name="frame_div" id="frame_div" src="${pageContext.request.contextPath}/front/jsp/UserList.jsp"  style="width: 95%;height: 95%; border: none;margin-left: 39px;"></iframe>
	</div>

	<div class="layui-footer">
		<!-- 底部固定区域 -->
		© layui.com - 底部固定区域
	</div>
</div>

<script>
	//JavaScript代码区域
	layui.use('element', function(){
		var element = layui.element;

	});
</script>
</body>
</html>
