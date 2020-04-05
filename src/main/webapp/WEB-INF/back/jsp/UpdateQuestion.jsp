<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/22
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Title</title>
	<meta charset="UTF-8">
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/background/js/Updatequestion.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>

<div class="layui-header">
	<h1 style="margin-left: 43%">在线评估</h1>
</div>

<div class="layui-container">

	<form class="layui-form" action="">

		<div class="layui-row">
			<div class="layui-col-xs4 layui-col-xs-offset3">
				<label class="layui-form-label">咨询领域</label>
				<div class="layui-input-block">
					<select  id="field" name="field" lay-verify="required" lay-filter="field" placeholder="请选择领域">
						<option value="0">请选择</option>
						<option value="1" <c:if test="${param.fieldid =='1'}">selected="selected" </c:if>>职场</option>
						<option value="2" <c:if test="${param.fieldid =='2'}">selected="selected" </c:if>>家庭</option>
						<option value="3" <c:if test="${param.fieldid =='3'}">selected="selected" </c:if>>社交</option>
					</select>
					<button  id="add" type="button" class="layui-btn add"><i class="layui-icon">&#xe654;</i>增加</button>
				</div>
			</div>
		</div>

		<input type="hidden" id="fieldid" value="${fieldid}">
		<table class="layui-table"  lay-filter="test" id="demo" lay-size="sm" >
			<c:forEach items="${map}" var="m">
				<tr>
					<td>${m.key}</td>
				</tr>
				<tr>
					<td>
						<c:forEach items="${m.value}" var="s">
							<input type="radio" name="${s.parentid}" value="${s.value}" title="${s.content}">
							<input type="hidden"  value="${s.parentid}">
						</c:forEach>
						<button  id="update" type="button" class="layui-btn update"><i class="layui-icon">&#xe716;</i>修改</button><button  id="update" type="button" class="layui-btn del"><i class="layui-icon">&#xe640;</i>删除</button>
					</td>
				</tr>
			</c:forEach>
		</table>

	</form>
	<input type="hidden" id="url" value="${pageContext.request.contextPath}">

</div>
<script>
	//JavaScript代码区域
	layui.use('form', function(){
		var form = layui.form;
		form.render();
	});
</script>

</body>
</html>
