<%--<%@ page import="com.javabean.GoodsInfo" %>--%>
<%@ page import="java.util.List" %>
<%@ page import="com.javabean.Menu" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/3
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
<%--	<% String path = request.getContextPath();%>--%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/background/css/manage.css">

	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/background/js/manage.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div id="top_div">
	<div id="title"><h2>心理咨询台管理系统</h2></div>
	<div id="top_div_exit"><a href="">关闭</a></div>
	<div id="top_div_name"><a href="">欢迎${admin.name}</a></div>
	<div id="top_div_help"><a href="">服务热线</a></div>
</div>
<div id="bottom_div">
	<div id="left_div">

		<c:forEach items="${menumap}" var="m">
			<div  class="menutitle" >
				<h3 style = "text-align: center">${m.key}</h3>
				<ul class="left_div_menu" style="display: none">
					<c:forEach items="${m.value}" var="s">
						<li onclick = "change(this)" title="${pageContext.request.contextPath}/${s.url}">${s.name}</li>

					</c:forEach>
				</ul>
			</div>

		</c:forEach>

		<div class="menutitle">
			<h3 onclick="">注销</h3>
		</div>
	</div>
	<div id="right_div">
		<iframe id="frame_div" src=""  ></iframe>
<%--		<%= path+"/background/jsp/GoodManage.jsp"%>--%>
	</div>


</div>
</body>
</html>
