<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>学员登录</title>
	<%String path = request.getContextPath();%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>

</head>
<body class="layui-layout-body"  style="overflow-y:scroll;overflow-x:scroll">
<div class="untop">
	<ul class="menu">
		<!--        <li class="backbg logo" onclick="location.href='/home/index'"></li>-->
		<li class="title">机动车驾驶员网上理论学习平台</li>

	</ul>
</div>
<div class="layui-layout layui-layout-admin">
	<div class='layui-header header' style="background-color: #1470a3;">
		<ul class="layui-nav">


			<li class="layui-nav-item"><a href="${pageContext.request.contextPath}/student/path/StudentInfo" target="frame_div">首页</a></li>
			<li class="layui-nav-item">
				<a href="javascript:;">理论学习</a>
				<dl class="layui-nav-child">
					<dd><a href="${pageContext.request.contextPath}/student/path/VedioStudy" target="frame_div">科目一</a></dd>
					<dd><a href="${pageContext.request.contextPath}/student/path/VedioStudy" target="frame_div">科目四</a></dd>
				</dl>
			</li>

			<li class="layui-nav-item">
				<a href="javascript:;">在线练习</a>
				<dl class="layui-nav-child">
					<dd><a href="${pageContext.request.contextPath}/student/exercise/1" target="_blank">科目一</a></dd>
					<dd><a href="${pageContext.request.contextPath}/student/exercise/4" target="_blank">科目四</a></dd>
				</dl>
			</li>

			<li class="layui-nav-item">
				<a href="javascript:;">在线打卡</a>
				<dl class="layui-nav-child">
					<dd><a href="${pageContext.request.contextPath}/student/path/FaceSignin?subject=2" target="frame_div">科目二打卡</a></dd>
					<dd><a href="${pageContext.request.contextPath}/student/path/FaceSignin?subject=3" target="frame_div">科目三打卡</a></dd>
					<c:choose>
						<c:when test="${student.identity_state == 0}">
							<dd><a href="${pageContext.request.contextPath}/student/path/FaceImport" target="frame_div">人脸信息录入</a></dd>
						</c:when>
					</c:choose>







				</dl>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;">模拟考试</a>
				<dl class="layui-nav-child">
					<dd><a href="${pageContext.request.contextPath}/student/path/VedioStudy" target="frame_div">科目一</a></dd>
					<dd><a href="${pageContext.request.contextPath}/student/path/VedioStudy" target="frame_div">科目四</a></dd>
				</dl>
			</li>

			<li class="layui-nav-item">
				<a href="">考试信息</a>
			</li>
			<li class="layui-nav-item"><a href="">社区</a></li>
		</ul>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="javascript:;">
					<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
					${student.name}
				</a>
				<dl class="layui-nav-child">
					<dd><a href="">基本资料</a></dd>
					<dd><a href="">安全设置</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item"><a href="">退出</a></li>
		</ul>
	</div>
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md12">
				<iframe name="frame_div" src="${pageContext.request.contextPath}/student/path/StudentInfo" style="width: 1140px;height: 500px;border: none;overflow-y: hidden;overflow-x: hidden;"></iframe>
			</div>
		</div>
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
