<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>学员登录</title>
	<%String path = request.getContextPath();%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/static/student/js/StudentInfo.js" type="text/javascript" charset="utf-8"></script>


</head>
<body class="layui-layout-body">
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<input type="hidden" id="studentid" value="${student.id}">
<input type="hidden" id="status" value="${student.student_state_id}">
<div class="df_bd">
<div class="bgl">
	<div class="usio">
		<div class="fra_title"><span><b class="backbg ico_usico"></b><i class="layui-icon">&#xe66f;</i> 个人信息<a href="javascript:void(0)"></a></span></div>
		<ul class="usio_ul">
			<li class="usio_ul_1">
				<span>姓名：${student.name}</span>
				<span>账号：${student.account}</span>
				<span>驾校：${student.school.name}</span>
				<span>教练：${student.coach.name}</span>
				<span id="stage"></span>
				<a href="javascript:void(0)"><img alt="" class="xueyuan" src="${pageContext.request.contextPath}/static${student.image}"></a>
			</li>
<%--			<li class="usio_ul_2">--%>
<%--				<a class="backbg usio_ul_2_1" href="/home/userInfo"></a>--%>
<%--				<a class="backbg usio_ul_2_2" href="/home/Repass"></a>--%>
<%--				<a class="backbg usio_ul_2_3" href="/study/index"></a>--%>
<%--			</li>--%>
		</ul>
	</div>
</div>
<div class="bgr">
	<div class="usti">
		<div class="fra_title"><span><b class="backbg ico_time"></b><i class="layui-icon">&#xe60e;</i>学时信息<a href="javascript:void(0)"></a></span></div>
		<div class="tmio">
			<table class="layui-table"  lay-filter="test" id="demo" lay-size="lg">
				<tr style="color: white; background-color: #808080;">
					<th>学习阶段</th>
					<th>学时进度</th>
					<th>考试状态</th>
				</tr>
				</table>
		</div>
		<div class="backbg tmio_ca" style="border: grey">
			<div class="tmio_carbg" style="width: 690px;">
				<div id="d1" style="width: 10px; float: left; /*! border: medium none green; */background-color: white;height: 25px;"></div>
				<div style="float: left;/*! border: red; */height: 26px;width: 76px;" class="">
					<img alt=""  style="width: 75px;height: 25px" src="${pageContext.request.contextPath}/static/student/images/car.gif">
				</div>
			</div>
		</div>
		<span style="font-size:12px;color:#808080;display:none;">❄第一部分教室有效学时最多为3学时，第四部分教室有效学时最多为3学时</span>
	</div>

</div>

</div>

<%--<div>--%>



<%--	<table class="layui-table"  lay-filter="test" id="demo" lay-size="sm">--%>
<%--		<tr style="color: white; background-color: #808080;">--%>
<%--			<th>学习阶段</th>--%>
<%--			<th>学时完成进度</th>--%>
<%--		</tr>--%>
<%--		<tr>--%>
<%--			<td>--%>
<%--				科目一--%>
<%--			</td>--%>
<%--			<td>--%>
<%--				<div class="layui-progress layui-progress-big" lay-showpercent="true">--%>
<%--					<div class="layui-progress-bar layui-bg-black"  lay-percent="1/3"></div>--%>
<%--				</div>--%>
<%--			</td>--%>
<%--		</tr>--%>
<%--		<tr>--%>
<%--			<td>--%>
<%--				科目二--%>
<%--			</td>--%>
<%--			<td>--%>
<%--				<div class="layui-progress layui-progress-big" lay-showpercent="true">--%>
<%--					<div class="layui-progress-bar layui-bg-black"  lay-percent="1/3"></div>--%>
<%--				</div>--%>
<%--			</td>--%>
<%--		</tr>--%>
<%--		<tr>--%>
<%--			<td>--%>
<%--				科目三--%>
<%--			</td>--%>
<%--			<td>--%>
<%--				<div class="layui-progress layui-progress-big" lay-showpercent="true">--%>
<%--					<div class="layui-progress-bar layui-bg-black"  lay-percent="1/3"></div>--%>
<%--				</div>--%>
<%--			</td>--%>
<%--		</tr>--%>
<%--		<tr>--%>
<%--			<td>--%>
<%--				科目四--%>
<%--			</td>--%>
<%--			<td>--%>
<%--				<div class="layui-progress layui-progress-big" lay-showpercent="true">--%>
<%--					<div class="layui-progress-bar layui-bg-black"  lay-percent="1/3"></div>--%>
<%--				</div>--%>
<%--			</td>--%>
<%--		</tr>--%>
<%--	</table>--%>
<%--</div>--%>

<script>
	$("#d1").animate({width:"580px"},2000);

</script>
</body>
</html>
