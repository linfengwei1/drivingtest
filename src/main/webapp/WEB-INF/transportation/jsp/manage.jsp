<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/9
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>机动车驾驶员计时培训系统后台</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">运管门户</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
<%--            <li class="layui-nav-item"><a href="">控制台</a></li>--%>
<%--            <li class="layui-nav-item"><a href="">商品管理</a></li>--%>
<%--            <li class="layui-nav-item"><a href="">用户</a></li>--%>
<%--            <li class="layui-nav-item">--%>
<%--                <a href="javascript:;">其它系统</a>--%>
<%--                <dl class="layui-nav-child">--%>
<%--                    <dd><a href="">邮件管理</a></dd>--%>
<%--                    <dd><a href="">消息管理</a></dd>--%>
<%--                    <dd><a href="">授权管理</a></dd>--%>
<%--                </dl>--%>
<%--            </li>--%>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${transportation.name}
                </a>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/TM/deleteAdmin">退出登录</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">

            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-shrink="all" lay-filter="test">
                <li class="layui-nav-item">
                <a class="" href="javascript:;">驾校管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/" onclick="changeUrl(this)">驾校审核</a></dd>
                    <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/" onclick="changeUrl(this)">驾校查看</a></dd>
                    <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/" onclick="changeUrl(this)">驾校违规处罚</a></dd>
                    <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/" onclick="changeUrl(this)">教练查询</a></dd>
                </dl>
                </li>

                <li class="layui-nav-item">
                    <a class="" href="javascript:;">学员管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/" onclick="changeUrl(this)">学员信息</a></dd>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/" onclick="changeUrl(this)">审批</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">统计报表</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/" onclick="changeUrl(this)">学员人数统计</a></dd>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/" onclick="changeUrl(this)">科目考试人数统计</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">题库管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/OneSubject" onclick="changeUrl(this)">科目一题库管理</a></dd>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/FourthSubject" onclick="changeUrl(this)">科目四题库管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">其他</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/" onclick="changeUrl(this)">通知公告发布</a></dd>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/" onclick="changeUrl(this)">日志查看</a></dd>
                    </dl>
                </li>
            </ul>

        </div>
    </div>

    <div class="layui-body">
        <iframe id="ifram_div_iframe" style="width: 100%;height: 100%;" name="ifram_div_ifram" src="${pageContext.request.contextPath}/TM/path/userTbl"></iframe>
<%--        <div style="padding: 15px;">内容主体区域</div>--%>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © cykjgroup.com
    </div>
</div>
<script>
    //JavaScript代码区域
    layui.use(['element','jquery'], function(){
        var element = layui.element
            ,$=layui.jquery;
    });


    function changeUrl(node) {
        //获取跳转路径
        console.log(node.title);
        document.getElementById("ifram_div_iframe").src=node.title;
    }
</script>
</body>
</html>
