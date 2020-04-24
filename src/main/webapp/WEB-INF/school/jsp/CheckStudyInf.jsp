<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-3-14
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查看学时</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath()%>/static/jquery-3.4.1.js"></script>
    <script src="<%=request.getContextPath()%>/static/json2.js"></script>
    <style>
        .layui-input-inline {
            width: 100px;
        }
        .layui-layout-body{
            background-image: url(${pageContext.request.contextPath}/static/images/a.jpg);
            overflow:auto; /*这边设置是为了弹出的时候，如果框的大小小于内容，就出现滑动条*/
        }
    </style>
</head>
<body class="layui-layout-body">

<input type="hidden" id="path" value="<%=path%>">
<div class="layui-main-login" >
    <form class="layui-form" action="" onsubmit="return false;">

        <div> <input type="hidden" id="id" name="id"></div>
        <div class="layui-anim layui-anim-scale" style="clear: left">
            <table id="dataTable" lay-filter="test"></table>
            <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="q" ><i class="layui-icon">&#xe605;</i>申请考试</button>
            <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="w" ><i class="layui-icon">&#x1006;</i>驳回申请</button>
        </div>
    </form>
</div>
</body>
<script>
    layui.use(['upload', 'jquery', 'layer','table','laydate'], function () { //导入模块
        $ = layui.jquery;
        var form = layui.form;
        var table = layui.table;
        var path = $("#path").val();


        //第一个实例
        table.render({
            elem: '#dataTable'
            , height: 280
            , url: path + "/school/findStudyTime" //数据接口
            , page: true //开启分页
            , where: {id: $("#id").val()}
            , limit: 5
            , limits: [5, 10, 15, 20]
            , cols: [[ //表头
                {field: 'id', title: 'id', width: 120, sort: true, fixed: 'left', align: 'center'}
                , {field: 'subject_id', title: '科目', width: 100, align: 'center',
                        templet: function(d){
                            if (1==d.subject_id){
                                return '科目一'
                            }else if (2==d.subject_id){
                                return '科目二'
                            }else if (3==d.subject_id){
                                return '科目三'
                            }
                            return '科目四'
                        }}
                , {field: 'time', title: '学时', width: 180, sort: true, align: 'center'}
                , {field: 'score', title: '分数', width: 120, sort: true, align: 'center'}
            ]]
        });

    });
</script>
</html>
