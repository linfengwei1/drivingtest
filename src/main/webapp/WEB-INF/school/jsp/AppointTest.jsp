<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/17
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<html>
<head>
    <title>考试预约</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <style>
        .layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
            top: 50%;
            transform: translateY(-50%);
        }
    </style>
</head>
<body>
<form class="layui-form" action=""  >
    <div class="layui-form-item">

        <div style="float: left">
            <label class="layui-form-label" >学员姓名</label>
            <div class="layui-input-block" style="width: 190px">
                <input class="layui-input" name="name" id="name" autocomplete="off">
            </div>
        </div>
        <div style="float: left">
            <label class="layui-form-label" >教练姓名</label>
            <div class="layui-input-block" style="width: 190px">
                <input class="layui-input" name="coachName" id="coachName" autocomplete="off">
            </div>
        </div>


        <button class="layui-btn" id="button" lay-submit="" lay-filter="formDemo" data-type="reload" ><i class="layui-icon">&#xe615;</i>搜索</button>

    </div>

</form>

<table id="demo" lay-filter="test"></table>
</body>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">批量批准</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCancelData">批量驳回</button>
    </div>
</script>


<script type="text/html" id="barDemo">

    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="doTest"><i class="layui-icon">&#xe642;</i>批准</a>

    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="noTest"><i class="layui-icon">&#xe642;</i>驳回</a>

</script>

<script>
    layui.use(['table','laydate','form','jquery','layer'], function(){
        var table = layui.table,
            form=layui.form,
            $=layui.jquery;
        var layer = layui.layer;
        //表格实例
        table.render({
            elem: '#demo'
            ,height: 500
            ,id:'testReload'
            ,url: '${pageContext.request.contextPath}/school/getAppointTbl' //数据接口
            ,page: true //开启分页
            ,limit:10
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print']
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'studentName', title: '姓名', width:100}
                ,{field: 'studentSex', title: '性别', width:50}
                ,{field: 'studentAge', title: '年龄', width:50}
                ,{field: 'studentPhone', title: '联系电话', width:150}
                ,{field: 'subjectName', title: '预约科目', width:150}
                ,{field: 'dateTime', title: '预约考试时间', width:200}
                ,{field: 'coachName', title: '所属教练', width:150}
                ,{fixed: 'right', width:200, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]]

        });

        //表头左侧工具条
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            var data = checkStatus.data;
            switch(obj.event){
                case 'getCheckData':
                    if(data.length==0){
                        layer.alert("请选取需要批量操作的条目");
                    }else{
                        layer.confirm('您确定要批准吗?', {icon: 3, title:'提示'}, function(index){
                            layer.alert(JSON.stringify(data));
                            $.ajax({
                                async:true,
                                method : "POST",
                                url :'${pageContext.request.contextPath}/school/batchProcessing',
                                data: "data="+JSON.stringify(data),
                                dataType : "text",
                                success:function(data){
                                    if ("error"==data){
                                        layer.alert("审核失败",{icon:2});
                                    }else if ("success"==data) {
                                        layer.alert("审核成功",{icon:6},function () {
                                            // window.parent.location.reload();
                                            var _body = window.parent;//拿到iframe的上一级也就是body
                                            var _iframe1 = _body.document.getElementById('ifram_div_iframe');//通过id获取iframe
                                            _iframe1.contentWindow.location.reload(true);//只刷新当前iframe
                                        });
                                    }
                                }, error: function () {
                                    layer.alert("网络繁忙！")
                                }
                            });
                        })

                    }
                    break;
                case 'getCancelData':
                    if(data.length === 0){
                        layer.alert('请选取需要批量操作的条目');
                    } else {
                        layer.confirm('您确定要驳回吗?', {icon: 3, title:'提示'}, function(index){
                            $.ajax({
                                async:true,
                                method : "POST",
                                url :'${pageContext.request.contextPath}/school/batchRejected',
                                data: "data="+JSON.stringify(data),
                                dataType : "text",
                                success:function(data){
                                    if ("error"==data){
                                        layer.alert("驳回失败",{icon:2});
                                    }else if ("success"==data) {
                                        layer.alert("驳回成功",{icon:6},function () {
                                            //ifram_div_iframe
                                            window.parent.location.reload();
                                            var _body = window.parent;
                                            var _iframe1 = _body.document.getElementById('ifram_div_iframe');
                                            _iframe1.contentWindow.location.reload(true);

                                        });
                                    }
                                }, error: function () {
                                    layer.alert("网络繁忙！")
                                }
                            });
                        })

                    }
                    break;
            };
        });


        //阻止表单提交
        form.on('submit(formDemo)', function(data){
            return false;//阻止表单跳转
        });

        //表格数据重载
        $('#button').on('click',function () {

            var type=$(this).data('type');

            if(type == 'reload'){

                table.reload('testReload',{
                    page:{
                        curr:1
                    }
                    ,where:{
                        name:$("#name").val(),
                        coachName:$("#coachName").val()
                    }
                });
            }

        });

        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if(layEvent === 'doTest'){
                console.log(data.id);
                layer.confirm('您确定要批准吗?', {icon: 3, title:'提示'}, function(index){
                    $.ajax({
                        async:true,
                        method : "POST",
                        url :'${pageContext.request.contextPath}/school/auditAppoint',
                        data: {"id":data.id,"doing":"批准","name":data.subjectName,"studentId":data.studentId},
                        dataType : "text",
                        success:function(data){

                            layer.alert("批准成功",{icon:6},function () {
                                //修改信息
                                // window.parent.location.reload();
                                var _body = window.parent;//拿到iframe的上一级也就是body
                                var _iframe1 = _body.document.getElementById('ifram_div_iframe');//通过id获取iframe
                                _iframe1.contentWindow.location.reload(true);//只刷新当前iframe
                            });

                        }
                    });
                })


            } else {

                console.log(data.id);
                layer.confirm('您确定要驳回吗?', {icon: 3, title:'提示'}, function(index){
                    $.ajax({
                        async:true,
                        method : "POST",
                        url :'${pageContext.request.contextPath}/school/auditAppoint',
                        data: {"id":data.id,"doing":"驳回","name":data.subjectName,"studentId":data.studentId},
                        dataType : "text",
                        success:function(data){

                            layer.alert("驳回成功",{icon:6},function () {
                                //修改信息
                                // window.parent.location.reload();
                                var _body = window.parent;//拿到iframe的上一级也就是body
                                var _iframe1 = _body.document.getElementById('ifram_div_iframe');//通过id获取iframe
                                _iframe1.contentWindow.location.reload(true);//只刷新当前iframe
                            });

                        }
                    });
                })


            }
        })
    });
</script>
</html>
