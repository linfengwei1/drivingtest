<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>学员登录</title>
	<%String path = request.getContextPath();%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/static/student/js/ExamScore.js" type="text/javascript" charset="utf-8"></script>


</head>
<body class="layui-layout-body">
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<input type="hidden" id="studentid" value="${student.id}">
<div class="df_bd">

<div class="bgr" style="margin-right: 110px">
	<div class="usti">
		<div class="fra_title"><span><b class="backbg ico_time"></b>考试成绩表<a href="javascript:void(0)"></a></span></div>
		<div class="tmio">
				<table class="layui-table"  lay-filter="test" id="demo" lay-size="lg">
					<tr>
						<td colspan="4" style="color: #20B2AA; text-align: center" >考试成绩表</td>
					</tr>
					<tr style="color: white; background-color: #808080;">
						<th>考试科目</th>
						<th>考试时间</th>
						<th>分数</th>
					</tr>
				</table>
		</div>
	</div>
</div>
</div>
</body>
</html>
