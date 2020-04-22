<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/9
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学校表</title>
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
        <label class="layui-form-label">驾校名：</label>
        <div class="layui-input-inline">
            <select name="name" id="school" lay-filter="aihao">
                <option value=""></option>
                <c:forEach items="${schools}" begin="" var="school">
                    <option value="${school.name}" <c:if test="${school}==${school.name}">selected="selected"</c:if> >${school.name}</option>--%>
                </c:forEach>
            </select>
        </div>

        <label class="layui-form-label">状态：</label>
        <div class="layui-input-inline">
            <select name="state" id="type" lay-filter="aihao">
                <option value=""></option>
                <c:forEach items="${stateMap}" begin="" var="ss">
                    <option value="${ss.key}" <c:if test="${type}==${ss.key}">selected="selected"</c:if> >${ss.value}</option>
                </c:forEach>
            </select>
        </div>

        <button class="layui-btn" id="button" lay-submit="" lay-filter="formDemo" data-type="reload" ><i class="layui-icon">&#xe615;</i>搜索</button>

    </div>

</form>

<table id="demo" lay-filter="test"></table>
</body>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">批量审核</button>
    </div>
</script>

<script type="text/html" id="barDemo">

    {{#  if(d.school_state_id == 4){ }}
    <a class="layui-btn layui-btn-xs" lay-event="down"><i class="layui-icon">&#xe63c;</i>文件下载</a>
    <a class="layui-btn layui-btn-xs" lay-event="lookMsg"><i class="layui-icon">&#xe63c;</i>查看信息</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="examine"><i class="layui-icon">&#xe642;</i>审核</a>
    {{#  } else if(d.school_state_id ==3){ }}
    <a class="layui-btn layui-btn-xs" lay-event="down"><i class="layui-icon">&#xe63c;</i>文件下载</a>
    <a class="layui-btn layui-btn-xs" lay-event="lookMsg"><i class="layui-icon">&#xe63c;</i>查看信息</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="stopApply"><i class="layui-icon">&#xe642;</i>禁止报名</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="stopDoing"><i class="layui-icon">&#xe642;</i>封停</a>
    {{#  } else if(d.school_state_id ==1){ }}
    <a class="layui-btn layui-btn-xs" lay-event="down"><i class="layui-icon">&#xe63c;</i>文件下载</a>
    <a class="layui-btn layui-btn-xs" lay-event="lookMsg"><i class="layui-icon">&#xe63c;</i>查看信息</a>
    <a class="layui-btn layui-btn-xs" lay-event="relieveApply"><i class="layui-icon">&#xe63c;</i>解除限制</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="stopDoing"><i class="layui-icon">&#xe642;</i>封停</a>
    {{#  } else{ }}
    <a class="layui-btn layui-btn-xs" lay-event="lookMsg"><i class="layui-icon">&#xe63c;</i>查看信息</a>
    <a class="layui-btn layui-btn-xs" lay-event="down"><i class="layui-icon">&#xe63c;</i>文件下载</a>
    <a class="layui-btn layui-btn-xs" lay-event="relieveDoing"><i class="layui-icon">&#xe63c;</i>解除封停</a>
    {{#  } }}


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
            ,height: 500
            ,id:'testReload'
            ,url: '${pageContext.request.contextPath}/TM/getSchoolTbl' //数据接口
            ,page: true //开启分页
            ,limit:10
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print']
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'},
                {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                ,{field: 'name', title: '驾校名', width:100}
                ,{field: 'phone', title: '联系电话', width:130}
                ,{field: 'address', title: '地址', width:250}
                ,{field: 'admin', title: '负责人', width:50}
                ,{field: 'intro', title: '口号', width:100}
                ,{field: 'school_state_id', title: '状态', width: 100, templet: function(d){
                        var state;
                        if (1==d.school_state_id){
                            return '禁止报名'
                        }else if (2==d.school_state_id){
                            return '封停'
                        }else if(3==d.school_state_id){
                            return '启用'
                        }else if(4==d.school_state_id){
                            return '待审核'
                        }
                            return '审核未通过'
                    }}
                ,{fixed: 'right', width:360, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
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
                        name:$("#school").val(),
                        state:$("#type").val(),
                    }
                });
            }

        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    if(data.length==0){
                        layer.alert("请选取需要批量操作的条目");
                    }else{
                        layer.alert(JSON.stringify(data));
                    }

                    break;
            };
        });

        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if(layEvent === 'stopApply'){
                //do somehing
                layer.prompt({title: '问题：', formType: 2}, function(text, index){
                    layer.close(index);

                    var contentS=text;

                    layer.prompt({title: '处理结果：', formType: 2}, function(text, index){
                        layer.close(index);

                        var result=text;

                        layer.confirm('是否记录处分?', {
                            btn : ['记录','取消'],
                            btn1:function(index){

                                console.log(contentS);
                                console.log(result);
                                console.log(data.id);
                                console.log("禁止");
                                layer.close(index);
                                $.ajax({
                                    async:true,
                                    method : "POST",
                                    url :'${pageContext.request.contextPath}/TM/stopSchool',
                                    data: {"id":data.id,"content":contentS,"result":result,"doing":"禁止"},
                                    dataType:"text" ,
                                    success:function(data){
                                        if ("Success"==data){

                                            layer.alert("处理成功",{icon:6},function () {
                                                //修改信息
                                                window.parent.location.reload();
                                            });
                                        }
                                    }
                                });
                            },
                            btn2:function(index){
                                layer.close(index);
                            }
                        });


                    });

                });


            }else if(layEvent === 'stopDoing'){
                layer.prompt({title: '问题：', formType: 2}, function(text, index){
                    layer.close(index);
                    var contentS=text;
                    layer.prompt({title: '处理结果：', formType: 2}, function(text, index){
                        layer.close(index);

                        var result=text;

                        layer.confirm('是否记录处分?', {
                            btn : ['记录','取消'],
                            btn1:function(index){

                                console.log(contentS);
                                console.log(result);
                                console.log(data.id);
                                console.log("封停");
                                layer.close(index);
                                $.ajax({
                                    async:true,
                                    method : "POST",
                                    url :'${pageContext.request.contextPath}/TM/stopSchool',
                                    data: {"id":data.id,"content":contentS,"result":result,"doing":"封停"},
                                    dataType:"text" ,
                                    success:function(data){
                                        if ("Success"==data){

                                            layer.alert("处理成功",{icon:6},function () {
                                                //修改信息
                                                window.parent.location.reload();
                                            });
                                        }
                                    }
                                });
                            },
                            btn2:function(index){
                                layer.close(index);
                            }
                        });


                    });

                });
            }else if(layEvent === 'relieveApply'){
                layer.confirm('是否解除限制?', {
                    btn : ['解禁','取消'],
                    btn1:function(index){

                        console.log(data.id);
                        console.log("解禁");
                        layer.close(index);
                        $.ajax({
                            async:true,
                            method : "POST",
                            url :'${pageContext.request.contextPath}/TM/stopSchool',
                            data: {"id":data.id,"content":"s","result":"s","doing":"解禁"},
                            dataType:"text" ,
                            success:function(data){
                                if ("Success"==data){

                                    layer.alert("处理成功",{icon:6},function () {
                                        //修改信息
                                        window.parent.location.reload();
                                    });
                                }
                            }
                        });
                    },
                    btn2:function(index){
                        layer.close(index);
                    }
                });
            }else if(layEvent === 'relieveDoing'){
                layer.confirm('是否解除限制?', {
                    btn : ['解封','取消'],
                    btn1:function(index){

                        console.log(data.id);
                        console.log("解封");
                        layer.close(index);
                        $.ajax({
                            async:true,
                            method : "POST",
                            url :'${pageContext.request.contextPath}/TM/stopSchool',
                            data: {"id":data.id,"content":"s","result":"s","doing":"解封"},
                            dataType:"text" ,
                            success:function(data){
                                if ("Success"==data){

                                    layer.alert("处理成功",{icon:6},function () {
                                        //修改信息
                                        window.parent.location.reload();
                                    });
                                }
                            }
                        });
                    },
                    btn2:function(index){
                        layer.close(index);
                    }
                });
            }else if(layEvent === 'lookMsg'){ //查看信息
                console.log(data);

                $.ajax({
                    async:true,
                    method : "POST",
                    url :'${pageContext.request.contextPath}/TM/getSchoolMsg',
                    data: {"id":data.id},
                    dataType : "text",
                    success:function(data){
                        console.log("sss");
                        layer.open({
                            type: 2,
                            title: '查看驾校',
                            shadeClose: true,
                            shade: 0.8,
                            area: ['400px', '500px'],
                            content: "${pageContext.request.contextPath}/TM/path/SchoolMsg",
                            yes: function (index, layero) {

                            }
                        });
                    }
                });

            } else if(layEvent === 'examine'){ //审核通过
                //do something
                console.log(data);
                var sub=JSON.stringify(data);

                //prompt层
                layer.prompt({title: '审核信息', formType: 2}, function(text, index){
                    layer.close(index);

                    layer.confirm('是否通过审核?', {
                        btn : ['通过','不通过'],
                        btn1:function(index){
                            console.log(text);
                            console.log(data.id);
                            console.log("通过");
                            layer.close(index);
                            $.ajax({
                                async:true,
                                method : "POST",
                                url :'${pageContext.request.contextPath}/TM/examineSchool',
                                data: {"id":data.id,"text":text,"doing":"通过"},
                                dataType:"text" ,
                                success:function(data){
                                    if ("Success"==data){

                                        layer.alert("审核成功",{icon:6},function () {
                                            //修改信息
                                            window.parent.location.reload();
                                        });
                                    }
                                }
                            });
                        },
                        btn2:function(index){
                            console.log(text);
                            console.log(data.id);
                            console.log("不通过");
                            $.ajax({
                                async:true,
                                method : "POST",
                                url :'${pageContext.request.contextPath}/TM/examineSchool',
                                data: {"id":data.id,"text":text,"doing":"不通过"},
                                dataType:"text" ,
                                success:function(data){
                                    if ("Success"==data){
                                        layer.alert("审核成功",{icon:6},function () {
                                            //修改信息
                                            window.parent.location.reload();
                                        });
                                    }
                                }
                            });
                        }
                    });

                });

            }else if(layEvent === 'down') {//文件下载
                window.location.href='${pageContext.request.contextPath}/TM/down?id='+data.id;
            }

        });

    });
</script>
</html>
