<%@ page import="com.great.entity.Coach" %><%--
  Created by IntelliJ IDEA.
  User: 49897
  Date: 2020/3/9
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>教练后台管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <%
        String path = request.getContextPath();
    %>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">教练后台管理</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    <% Coach coach = (Coach)session.getAttribute("coach"); String name = coach.getName();Integer id = coach.getId();%>
                    欢迎<%=name %>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">个人中心</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/coach/path/changepwd" onclick="changeUrl(this)">修改密码</a></dd>
                    </dl>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/coach/path/CoachStudentManage" onclick="changeUrl(this)">学员信息</a></dd>
                    </dl>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">个人信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">业务查看</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/coach/path/CoachStudentEvaluation" onclick="changeUrl(this)">查看学员信息</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <iframe id="ifram_div_iframe" style="width: 100%;height: 100%;" name="ifram_div_ifram" src="${pageContext.request.contextPath}/coach/path/CoachInf"></iframe>
        <%--        <div style="padding: 15px;">内容主体区域</div>--%>
    </div>

    <div class="layui-footer">
        <p>
            <a href="#">版权所有：传一科技JX1908</a>
        </p>
        <p>
            <a href="#">技术支持：传一科技JX1908第四小组</a>
        </p>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

    function changeUrl(node) {
        //获取跳转路径
        console.log(node.title);
        document.getElementById("ifram_div_iframe").src=node.title;
    }
</script>

</body>
</html>

