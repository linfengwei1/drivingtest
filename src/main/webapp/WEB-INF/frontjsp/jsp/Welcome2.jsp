<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-1-5
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%String path=request.getContextPath(); %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/homepage/css/homepage.css">--%>
<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/static/echarts.js" type="text/javascript" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/static/homepage/js/homepage.js" type="text/javascript" charset="utf-8"></script>
<html>
<head>
    <title>查看更多</title>
</head>
<body>
<div id="header" style="background-color: #f2f4f9;width: 100%;height:5%" align="right">
    <a href="${pageContext.request.contextPath}/student/path/StudentLogin">学员登录</a>
    <a href="${pageContext.request.contextPath}/coach/login">教练登录</a>
    <a href="${pageContext.request.contextPath}/school/path/SchoolLogin">驾校登录</a>
    <a href="${pageContext.request.contextPath}/TM/login" style="margin-right: 10%;">交管登录</a>
</div>

<div class="layui-carousel" id="test1">
    <div carousel-item style="text-align :center">
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/home_logo2.jpg" /></div>
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage2.png" /></div>
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage3.jpg" /></div>
    </div>
</div>

<form class="layui-form" onsubmit="return false" >

    <div class="layui-form-item" style="background-color: #dadada">
        <label class="layui-form-label" style="margin-top: 1%;margin-left: 15%;">标题：</label>
        <div class="layui-input-inline" style="margin-top: 1%;">
            <input type="text"  id="title" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" value="${userName}">
        </div>

        <label class="layui-form-label"style="margin-top: 1%" >发布时间</label>
        <div class="layui-inline" style="margin-top: 1%">
            <input class="layui-input" type="date" name="time1" id="time1" autocomplete="off">
        </div>
        至：
        <div class="layui-inline" style="margin-top: 1%" >
            <input class="layui-input" type="date" name="time2"  id="time2"autocomplete="off">
        </div>

        <button class="layui-btn" id="button" lay-submit="" lay-filter="formDemo" data-type="reload" style="margin-top: 1%" ><i class="layui-icon">&#xe615;</i>查询</button>
    </div>



    <div class="layui-anim layui-anim-scale">
        <table id="dataTable" lay-filter="test"></table>
    </div>


</form>




</body>

<script>

    layui.use(['upload', 'jquery', 'layer','table','laydate'], function () { //导入模块
        $ = layui.jquery;
        var form = layui.form;
        var table = layui.table;
        var path = $("#path").val();

//阻止表单提交
        form.on('submit(formDemo)', function(data){
            return false;//阻止表单跳转
        });

        //第一个实例
        table.render({
            elem: '#dataTable'
            , height: 280
            , url: path + '/school/SchoolAdminTable' //数据接口
            , page: true //开启分页
            , id: 'searchTable'
            , limit: 5
            , limits: [5, 10, 15, 20]
            , cols: [[ //表头
                {field: 'id', title: '管理员ID', width: 120, sort: true, fixed: 'left', align: 'center'}
                , {field: 'account', title: '管理员账号', width: 100, align: 'center',hide:true}
                , {field: 'name', title: '管理员昵称', width: 180, sort: true, align: 'center'}
                , {field: 'phone', title: '联系方式', width: 120, sort: true, align: 'center'}
                , {field: 'time', title: '创建时间', width: 180, sort: true,align: 'center',templet: "<div>{{layui.util.toDateString(d.time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
                , {field: 'school_state_id', title: '当前状态', width: 130, sort: true, align: 'center',
                    templet: function(d){
                        var state;
                        if (1==d.school_state_id){
                            return '禁止报名'
                        }else if (2==d.school_state_id){
                            return '封停'
                        }
                        return '启用'
                    }}
                , {field: '', title: '操作', toolbar: "#butdiv", width: 200, align: 'center'}
            ]]
        });

        $('#searchTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            if (type == 'reload') {
                //执行重载
                table.reload('searchTable', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        time1: $("#time1").val(),
                        time2: $("#time2").val(),
                        title : $("#title").val(),
                    }
                });
            }
        });

    });
</script>
</html>

