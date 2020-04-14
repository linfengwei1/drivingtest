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
<div class="df_bd">
<div class="bgl">
	<div class="usio">
		<div class="fra_title"><span><b class="backbg ico_usico"></b>个人信息<a href="javascript:void(0)"></a></span></div>
		<ul class="usio_ul">
			<li class="usio_ul_1">
				<span>姓名：${student.name}</span>
				<span>车型：C1</span>
				<span>网络学员：<b class="yes">是</b></span>
				<span>卡号：${student.phone}</span>
				<a href="javascript:void(0)"><img alt="" class="xueyuan" src="${pageContext.request.contextPath}/static/student/images/self.png"></a>
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
		<div class="fra_title"><span><b class="backbg ico_time"></b>学时信息<a href="javascript:void(0)"></a></span></div>
		<div class="tmio">
			<table class="tmio_tb">
				<tbody><tr>
					<td class="tmio_td">
						<div class="backbg tmio_ca">
							<div class="tmio_carbg" getw="1.00" style="width: 70px;">
								<div class="tmio_car"></div>
								<div class="backbg tmio_card"></div>
							</div>
						</div>
						<div id="edittd">
							<table>
								<tbody><tr>
									<th>学习阶段</th>
									<th>需要总学时</th>
									<th>-</th>
									<th>已完成学时</th>
									<th>=</th>
									<th>未完成学时</th>
									<th>状态</th>
								</tr>

<%--								<tr>--%>
<%--									<td>第二部分</td>--%>
<%--									<td>12学时</td>--%>
<%--									<td>-</td>--%>
<%--									<td>12学时</td>--%>
<%--									<td>=</td>--%>
<%--									<td>0分钟</td>--%>
<%--									<td>通过</td>--%>
<%--								</tr>--%>
<%--								<tr>--%>
<%--									<td>第三部分</td>--%>
<%--									<td>12学时</td>--%>
<%--									<td>-</td>--%>
<%--									<td>12学时</td>--%>
<%--									<td>=</td>--%>
<%--									<td>0分钟</td>--%>
<%--									<td>通过</td>--%>
<%--								</tr>--%>
<%--								<tr>--%>
<%--									<td>第四部分</td>--%>
<%--									<td>10学时</td>--%>
<%--									<td>-</td>--%>
<%--									<td>16学时</td>--%>
<%--									<td>=</td>--%>
<%--									<td>0分钟</td>--%>
<%--									<td>通过</td>--%>
<%--								</tr>--%>
								</tbody></table>
						</div>
					</td>
				</tr>
				</tbody></table>
		</div>
		<span style="font-size:12px;color:#808080;display:none;">❄第一部分教室有效学时最多为四学时，第四部分教室有效学时最多为二学时</span>
	</div>
</div>
</div>
</body>
</html>
