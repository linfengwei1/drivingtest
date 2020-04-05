<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/12
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/background/js/addquestion.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<div class="layui-container">
	<h1 style="margin-left: 40%;"><c:choose>
		<c:when test="${fieldid=='1'}">
			职场领域
		</c:when>
		<c:when test="${fieldid=='2'}">
			家庭领域
		</c:when>
		<c:when test="${fieldid=='3'}">
			社会领域
		</c:when>

	</c:choose></td></h1>
	<form class="layui-form" action="">
		<div class="layui-row">
			<div class="layui-col-xs5">
				<div class="layui-form-item">
					<label class="layui-form-label">问题</label>
					<div class="layui-input-block">

						<c:forEach items="${map}" var="m">
							<input type="text" value="${m.key}" id="question" required  lay-verify="required" placeholder="请输入问题" autocomplete="off" class="layui-input">
						</c:forEach>
					</div>
				</div>
			</div>

		</div>

		<c:forEach items="${map}" var="m">
			<c:forEach items="${m.value}" var="v" varStatus="status">
				<div class="layui-col-xs5">
					<div class="layui-form-item">
						<label class="layui-form-label">选项</label>
						<div class="layui-input-block">
							<input type="hidden"  id="s${status.index+1}id" required  lay-verify="required" value="${v.questionid}" autocomplete="off" class="layui-input">
							<input type="text"  id="s${status.index+1}" required  lay-verify="required" value="${v.content}" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-col-xs4">
					<div class="layui-form-item">
						<label class="layui-form-label">分值</label>
						<div class="layui-input-block">
							<input type="number"  id="s${status.index+1}v" required  lay-verify="required" value="${v.value}" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
			</div>

			</c:forEach>
		</c:forEach>


	</form>
</div>
<input type="hidden" id="fieldid" value="${fieldid}">
<script>
	//Demo
	layui.use('form', function(){
		var form = layui.form;
		form.render();
	});
</script>
</body>
</html>
