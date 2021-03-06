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
                    ${Transportation.name}
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
                <a class="" href="javascript:;"><i class="layui-icon">&#xe68e;</i>     驾校管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/gASN" onclick="changeUrl(this)">驾校查看</a></dd>
                    <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/SchoolViolationManage" onclick="changeUrl(this)">驾校违规记录</a></dd>
                    <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/gASC" onclick="changeUrl(this)">教练查询</a></dd>
                    <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/gASB" onclick="changeUrl(this)">教练车查询</a></dd>
                </dl>
                </li>

                <li class="layui-nav-item">
                    <a class="" href="javascript:;"><i class="layui-icon">&#xe770;</i>     学员管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/gASA" onclick="changeUrl(this)">学员信息</a></dd>
<%--                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/gASA" onclick="changeUrl(this)">成绩管理</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;"><i class="layui-icon">&#xe60a;</i>     考试管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/getAT" onclick="changeUrl(this)">考试审批</a></dd>
<%--                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/" onclick="changeUrl(this)">各阶段考试人数配置</a></dd>--%>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/gSGH" onclick="changeUrl(this)">考试时间配置</a></dd>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/AddScoreByExcel" onclick="changeUrl(this)">导入成绩</a></dd>

                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a class="" href="javascript:;"><i class="layui-icon">&#xe629;</i>     统计报表</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/SchoolStudentView" onclick="changeUrl(this)">驾校学员人数统计</a></dd>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/StudentScoreView" onclick="changeUrl(this)">科目人数统计</a></dd>
<%--                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/" onclick="changeUrl(this)">成绩分布</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;"><i class="layui-icon">&#xe705;</i>     题库管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/OneSubject" onclick="changeUrl(this)">科目一题库管理</a></dd>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/FourthSubject" onclick="changeUrl(this)">科目四题库管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;"><i class="layui-icon">&#xe716;</i>     其他</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/link/path/LinkManage" onclick="changeUrl(this)">友情连接管理</a></dd>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/TM/path/NoticeManagement" onclick="changeUrl(this)">通知公告发布</a></dd>
                        <dd><a href="javascript:void(0);"  title="${pageContext.request.contextPath}/school/path/SchoolLogManage" onclick="changeUrl(this)">日志查看</a></dd>
                    </dl>
                </li>
            </ul>

        </div>
    </div>

    <div class="layui-body">
        <iframe id="ifram_div_iframe" style="width: 100%;height: 100%;" name="ifram_div_ifram" src="${pageContext.request.contextPath}/TM/path/welcome"></iframe>
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
