<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/8
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>科目四题库管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<form class="layui-form" action=""  >
    <div class="layui-form-item">
        <label class="layui-form-label">题目：</label>
        <div class="layui-input-inline">
            <input type="text"  id="question" name="question" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" value="${userName}">
        </div>

        <label class="layui-form-label">题型：</label>
        <div class="layui-input-inline">
            <select name="type" id="type" lay-filter="aihao">
                <option value=""></option>
                <option value="1" <c:if test="${type}==1">selected="selected"</c:if> >单项选择</option>
                <option value="2" <c:if test="${type}==2">selected="selected"</c:if> >判断对错</option>
                <option value="3" <c:if test="${type}==3">selected="selected"</c:if> >多项选择</option>
            </select>
        </div>

        <button class="layui-btn" id="button" lay-submit="" lay-filter="formDemo" data-type="reload" >查询</button>

    </div>

</form>

<table id="demo" lay-filter="test"></table>
</body>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use(['table','laydate','form','jquery'], function(){
        var table = layui.table,
            laydate=layui.laydate,
            form=layui.form,
            $=layui.jquery;
        //表格实例
        table.render({
            elem: '#demo'
            ,height: 470
            ,id:'testReload'
            ,url: '${pageContext.request.contextPath}/TM/getFourthSubject' //数据接口
            ,page: true //开启分页
            ,limit:10
            ,cols: [[ //表头
                {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                ,{field: 'question', title: '问题', width:400}
                ,{field: 'item1', title: '选项A', width:150}
                ,{field: 'item2', title: '选项B', width:150}
                ,{field: 'item3', title: '选项C', width:150}
                ,{field: 'item4', title: '选项D', width:150}
                ,{field: 'url', title: '图片路径', width: 177}
                ,{fixed: 'right', width:150, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]]
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
                        question:$("#question").val(),
                        type:$("#type").val(),
                    }
                });
            }

        });


        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if(layEvent === 'detail'){ //查看
                //do somehing
            } else if(layEvent === 'del'){ //删除
                layer.confirm('确定删除数据?', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);

                    var sub=JSON.stringify(data);

                    //向服务端发送删除指令
                    $.ajax({
                        //相应路劲
                        url:"${pageContext.request.contextPath}/TM/deleteSubject",
                        //是否异步提交
                        async:true,
                        //请求类型
                        type:"post",
                        //数据名
                        data:{"sub":sub,"who":"f"},
                        //数据类型:文本
                        datatype:"text",
                        //返回成功消息
                        success:function (msg) {
                            layer.alert("删除成功",{icon:6});
                        },
                        //返回失败消息
                        error:function () {
                        }
                    });

                });
            } else if(layEvent === 'edit'){ //编辑
                //do something
                console.log(data);

                var sub=JSON.stringify(data);

                $.ajax({
                    //相应路劲
                    url:"${pageContext.request.contextPath}/TM/getSubjectMsg",
                    //是否异步提交
                    async:true,
                    //请求类型
                    type:"post",
                    //数据名
                    data:{"sub":sub,"who":"f"},
                    //数据类型:文本
                    datatype:"text",
                    //返回成功消息
                    success:function (msg) {
                        layer.open({
                            type: 2,
                            title: '修改',
                            shadeClose: true,
                            shade: 0.8,
                            area: ['700px', '500px'],
                            content: "${pageContext.request.contextPath}/TM/path/ModifyFourthSubject",
                            yes: function (index, layero) {

                            }
                        });
                    },
                    //返回失败消息
                    error:function () {
                    }
                });
            }
        });

    });
</script>


</html>
