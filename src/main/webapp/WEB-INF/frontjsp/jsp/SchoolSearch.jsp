<%--
  Created by IntelliJ IDEA.
  User: HUAWEI
  Date: 2020/4/13
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>驾校查询</title>
<%
    String path = request.getContextPath();
%>
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/static/layui/layui.js"
        type="text/javascript" charset="utf-8"></script>
<script
        src="${pageContext.request.contextPath}/static/link/SchoolSearch.js"
        type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" action="" onsubmit="return false;">
    <div class="layadmin-user-login-box layadmin-user-login-header"
         style="background-color: #dadada">
        <h2 style="margin-left: 43%">驾校查询</h2>
    </div>
    <form class="layui-form" action=""  >
        <div class="layui-form-item">
            <label class="layui-form-label">驾校名：</label>
            <div class="layui-input-inline">
                <select name="name" id="school" lay-filter="aihao">
                    <option value=""></option>
                    <c:forEach items="${schools}" begin="" var="school">
                        <option value="${school.name}" <c:if test="${school}==${school.name}">selected="selected"</c:if> >${school.name}</option>--%>
                    </c:forEach>
                </select>
            </div>

            <label class="layui-form-label">状态：</label>
            <div class="layui-input-inline">
                <select name="state" id="type" lay-filter="aihao">
                    <option value=""></option>
                    <c:forEach items="${stateMap}" begin="" var="ss">
                        <option value="${ss.key}" <c:if test="${type}==${ss.key}">selected="selected"</c:if> >${ss.value}</option>
                    </c:forEach>
                </select>
            </div>

            <button class="layui-btn" id="button" lay-submit="" lay-filter="formDemo" data-type="reload" ><i class="layui-icon">&#xe615;</i>搜索</button>

        </div>

    </form>
    <div class="layui-anim layui-anim-scale">

        <table id="dataTable" lay-filter="test"></table>
    </div>
    <script type="text/html" id="butdiv">
<%--        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>--%>
<%--        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="update" ><i class="layui-icon">&#xe642;</i>更新</button>--%>
        {{#  if(d.school_state_id == 4){ }}
        <a class="layui-btn layui-btn-xs" lay-event="lookMsg"><i class="layui-icon">&#xe63c;</i>查看信息</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="examine"><i class="layui-icon">&#xe642;</i>审核</a>
        {{#  } else { }}
        <a class="layui-btn layui-btn-xs" lay-event="lookMsg"><i class="layui-icon">&#xe63c;</i>查看信息</a>
        {{#  } }}

    </script>

</form>


</body>
</html>
