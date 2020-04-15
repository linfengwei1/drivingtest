<%--
  Created by IntelliJ IDEA.
  User: HUAWEI
  Date: 2020/4/15
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>驾校查询页面</title>
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
<div class="layui-main-login">
    <form class="layui-form" action=" " onsubmit="return false">
        <%--		<div class="layadmin-user-login-box layadmin-user-login-header"--%>
        <%--			 style="background-color: #dadada">--%>
        <h2 style="margin-left: 43%">驾校查询</h2>
            <div class="layui-fluid" id="searchTable" style="margin-top: 1%;">
                <%--添加友情链接按钮--%>
                <div style="clear: left; padding-top: 10px; margin-left: 25%">

                    <button type="button" class="layui-btn layui-btn-normal" id="add">
                        <i class="layui-icon">&#xe654;</i>添加驾校信息
                    </button>
                </div>

            </div>

            <div class="layui-anim layui-anim-scale">
                <table id="dataTable" lay-filter="test"></table>
            </div>
        <%--		</div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">驾校ID</label>--%>
<%--            <div class="layui-input-inline" style="width: 190px">--%>
<%--                <input type="text" id="id" name="id" required--%>
<%--                       lay-verify="required" placeholder="" autocomplete="off"--%>
<%--                       class="layui-input">--%>
<%--            </div>--%>
<%--&lt;%&ndash;            <span id="err1" style="color: red"></span>&ndash;%&gt;--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">驾校名称</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text" id="name" name="name" required--%>
<%--                       lay-verify="required" placeholder="驾校名称" autocomplete="off"--%>
<%--                       class="layui-input">--%>
<%--            </div>--%>
<%--&lt;%&ndash;            <span id="err5" style="color: red"></span>&ndash;%&gt;--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">联系电话</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text" id="phone" name="phone" required--%>
<%--                       lay-verify="required" placeholder="联系电话" autocomplete="off"--%>
<%--                       class="layui-input">--%>
<%--            </div>--%>
<%--&lt;%&ndash;            <span id="err2"></span>&ndash;%&gt;--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">地址</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text" id="address" name="address" required--%>
<%--                       lay-verify="required" placeholder="地址" autocomplete="off"--%>
<%--                       class="layui-input">--%>
<%--            </div>--%>
<%--&lt;%&ndash;            <span id="err2"></span>&ndash;%&gt;--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">负责人</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text" id="admin" name="admin" required--%>
<%--                       lay-verify="required" placeholder="负责人" autocomplete="off"--%>
<%--                       class="layui-input">--%>
<%--            </div>--%>
<%--&lt;%&ndash;            <span id="err2"></span>&ndash;%&gt;--%>
<%--        </div>--%>

<%--            <div class="layui-form-item">--%>
<%--                <label class="layui-form-label">驾校简介</label>--%>
<%--                <div class="layui-input-inline">--%>
<%--                    <input type="text" id="intro" name="intro" required--%>
<%--                           lay-verify="required" placeholder="驾校简介" autocomplete="off"--%>
<%--                           class="layui-input">--%>
<%--                </div>--%>
<%--&lt;%&ndash;                <span id="err2"></span>&ndash;%&gt;--%>
<%--            </div>--%>

<%--            <div class="layui-form-item">--%>
<%--                <label class="layui-form-label">驾校状态</label>--%>
<%--                <div class="layui-input-inline">--%>
<%--                    <input type="text" id="school_state_id" name="school_state_id" required--%>
<%--                           lay-verify="required" placeholder="驾校状态" autocomplete="off"--%>
<%--                           class="layui-input">--%>
<%--                </div>--%>
<%--&lt;%&ndash;                <span id="err2"></span>&ndash;%&gt;--%>
<%--            </div>--%>
<%--            <div class="layui-form-item">--%>
<%--                <label class="layui-form-label">驾校信息</label>--%>
<%--                <div class="layui-input-inline">--%>
<%--                    <input type="text" id="information" name="information" required--%>
<%--                           lay-verify="required" placeholder="驾校信息" autocomplete="off"--%>
<%--                           class="layui-input">--%>
<%--                </div>--%>
<%--                &lt;%&ndash;                <span id="err2"></span>&ndash;%&gt;--%>
<%--            </div>--%>
<%--            <div class="layui-form-item">--%>
<%--                <label class="layui-form-label">审核结果</label>--%>
<%--                <div class="layui-input-inline">--%>
<%--                    <input type="text" id="audit_results" name="audit_results" required--%>
<%--                           lay-verify="required" placeholder="审核结果" autocomplete="off"--%>
<%--                           class="layui-input">--%>
<%--                </div>--%>
<%--                &lt;%&ndash;                <span id="err2"></span>&ndash;%&gt;--%>
<%--            </div>--%>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>

                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
