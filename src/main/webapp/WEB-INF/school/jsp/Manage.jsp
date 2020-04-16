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
    <title>驾校后台管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">驾校门户</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${transportation.name}
                </a>
            </li>
            <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/school/deleteAdmin">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-shrink="all" lay-filter="test">
                <li class="layui-nav-item">
                <a class="" href="javascript:;">教练管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/school/path/SchoolCoachManage" onclick="changeUrl(this)">教练基本信息</a></dd>
                    <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/school/path/SchoolPunishManage" onclick="changeUrl(this)">教练违规处理</a></dd>
                </dl>
                </li>

                <li class="layui-nav-item">
                    <a class="" href="javascript:;">管理员管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/school/path/SchoolAdminManage" onclick="changeUrl(this)">管理员信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">学员管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/school/getStudentState" onclick="changeUrl(this)">学员信息</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">教练车管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/school/path/SchoolCarManage" onclick="changeUrl(this)">教练车信息</a></dd>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/school/path/upload1" onclick="changeUrl(this)">上传测试</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">统计报表</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/school/path/Statistics" onclick="changeUrl(this)">科目考试人数统计</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">其他</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/school/getSchoolInf" onclick="changeUrl(this)">驾校中心</a></dd>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/school/path/GetEvaluation" onclick="changeUrl(this)">查看评价</a></dd>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/school/path/" onclick="changeUrl(this)">消息查看</a></dd>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/school/path/SchoolLogManage" onclick="changeUrl(this)">日志查看</a></dd>
                    </dl>
                </li>
            </ul>

        </div>
    </div>

    <div class="layui-body">
        <iframe id="ifram_div_iframe" style="width: 100%;height: 100%;" name="ifram_div_ifram" src=""></iframe>
<%--&lt;%&ndash;        <div style="padding: 15px;">内容主体区域</div>&ndash;%&gt;${pageContext.request.contextPath}/school/path/SchoolCoachManage--%>
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
