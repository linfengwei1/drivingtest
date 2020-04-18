<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/16
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>驾校违规管理</title>
    <%String path = request.getContextPath(); %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" action="" onsubmit="return false" >
    <div class="layadmin-user-login-box layadmin-user-login-header" style="background-color: #dadada">
        <h2 style="margin-left: 43%">驾校违规处理记录</h2>
    </div>
    <div class="layui-fluid" id="searchTable" style="margin-top: 1%;">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <div style="padding-bottom: 10px;">
                <div class="layui-upload">
                    <div style="float: left;">
                        <label class="layui-form-label" >违规时间</label>
                        <div class="layui-inline">
                            <input type="text" class="layui-input" id="time1" name =time1>
                        </div>
                        至：
                        <div class="layui-inline" style="clear: left">
                            <input type="text" class="layui-input" id="time2" name =time2>
                        </div>
                        <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="formDemo" data-type="reload"><i class="layui-icon">&#xe615;</i>搜索</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-anim layui-anim-scale" style="clear: left">
        <table id="dataTable" lay-filter="test"></table>
    </div>
    <script type="text/html" id="butdiv">
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>
    </script>

</form>

</body>
<script>

    layui.use(['upload', 'jquery', 'layer','table','laydate'], function () { //导入模块
        $ = layui.jquery;
        var form = layui.form;
        var table = layui.table;
        var path = $("#path").val();
        var laydate = layui.laydate;
        laydate.render({
            elem: '#time1' //指定元素
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#time2' //指定元素
            ,type: 'datetime'
        });

        //阻止表单提交
        form.on('submit(formDemo)', function(data){
            return false;//阻止表单跳转
        });

        //第一个实例
        table.render({
            elem: '#dataTable'
            , height: 280
            , url: path + '/TM/punishTable' //数据接口
            , page: true //开启分页
            , id: 'searchTable'
            ,toolbar: 'true' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            , limit: 5
            , limits: [5, 10, 15, 20]
            , cols: [[ //表头
                {field: 'id', title: 'ID', width: 120, sort: true, fixed: 'left', align: 'center',hide:true}
                , {field: 'school_name', title: '违规驾校', width: 120, sort: true, align: 'center'}
                , {field: 'content', title: '违规内容', width: 180, sort: true, align: 'center'}
                , {field: 'result', title: '处罚结果', width: 120, sort: true, align: 'center'}
                , {field: 'datetime', title: '违规时间', width: 200, sort: true,align: 'center',templet: "<div>{{layui.util.toDateString(d.datetime, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
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
                    }
                });
            }

        });


        //删除
        //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        table.on('tool(test)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var path1 = $("#path").val();
            if(layEvent === 'delete'){ //删除
                layer.confirm('您确定要删除吗?', {icon: 3, title:'提示'}, function(index){
                    $.ajax({
                        async:true,
                        method : "POST",
                        url :path1+'/TM/deletePunish',
                        data: "id="+data.id,
                        dataType : "text",
                        success:function(data){
                            if ("Success"==data){
                                layer.alert("删除成功",{icon:6},function () {
                                    window.parent.location.reload();
                                });
                            }else {
                                layer.alert("删除失败",{icon:2});
                            }
                        },
                        error:function (err) {
                            layer.alert("网络繁忙",{icon:2});
                        }
                    })
                })

            }

        });

    });


</script>
</html>
