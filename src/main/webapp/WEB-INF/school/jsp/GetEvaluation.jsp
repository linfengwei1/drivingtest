<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-4-12
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>驾校评价</title>
    <%String path = request.getContextPath(); %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" onsubmit="return false" >
<div style="clear: left;padding-top: 10px;margin-left: 25%">
    <label class="layui-form-label" >评价时间</label>
    <div class="layui-inline">
        <input class="layui-input" type="date" name="time1" id="time1" autocomplete="off">
    </div>
    至：
    <div class="layui-inline" style="clear: left">
        <input class="layui-input" type="date" name="time2"  id="time2"autocomplete="off">
    </div>
    <button id="button" class="layui-btn layui-btn-normal" lay-submit="" lay-filter="formDemo" data-type="reload"><i class="layui-icon">&#xe615;</i>搜索</button>
</div>
    <div class="layui-anim layui-anim-scale" style="clear: left">
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


        //第一个实例
        table.render({
            elem: '#dataTable'
            , height: 450
            , url: path + '/school/getEvaluation' //数据接口
            , page: true //开启分页
            , id: 'searchTable'
            , limit: 10
            , limits: [5, 10, 15, 20]
            , cols: [[ //表头
                  {field: 'id', title: 'ID', width: 120, sort: true, fixed: 'left', align: 'center'}
                , {field: 'content', title: '评价内容', width: 800, align: 'center'}
                , {field: 'time', title: '评价时间', width: 200, sort: true,align: 'center',templet: "<div>{{layui.util.toDateString(d.time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
            ]]
        });

        $('#button').on('click', function () {
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
                    }
                });
            }
        });


    });

</script>
</html>
