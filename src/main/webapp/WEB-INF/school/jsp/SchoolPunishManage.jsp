<%--
  Created by IntelliJ IDEA.
  User: Mr.Fan
  Date: 2020-3-10
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>教练违规处理</title>
    <%String path = request.getContextPath(); %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" action="" onsubmit="return false" >
    <div class="layadmin-user-login-box layadmin-user-login-header" style="background-color: #dadada">
        <h2 style="margin-left: 43%">违规处理</h2>
    </div>
    <div class="layui-fluid" id="searchTable" style="margin-top: 1%;">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <div style="padding-bottom: 10px;">
                <div class="layui-upload">
                    <div style="float: left">
                        <label class="layui-form-label" >违规人员</label>
                        <div class="layui-input-block" style="width: 190px">
                            <input class="layui-input" name="name" id="name" autocomplete="off">
                        </div>
                    </div>
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
                        <button type="button"  class="layui-btn layui-btn-normal" id="add"><i class="layui-icon">&#xe654;</i>添加记录</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-anim layui-anim-scale" style="clear: left">
        <table id="dataTable" lay-filter="test"></table>
    </div>
    <script type="text/html" id="butdiv">

        {{#  if(d.coach_state_id == '2'){ }}
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="employ" ><i class="layui-icon">&#xe640;</i>启用</button>

        {{# } if(d.coach_state_id == '1'){ }}
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>

        {{# } if(d.coach_state_id > '3'){ }}
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>


        {{# } if(d.coach_state_id == '3'){ }}
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="employ" ><i class="layui-icon">&#xe642;</i>启用</button>
        {{#  } }}


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
                , url: path + '/school/PunishTable' //数据接口
                , page: true //开启分页
                , id: 'searchTable'
                ,toolbar: 'true' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                , limit: 5
                , limits: [5, 10, 15, 20]
                , cols: [[ //表头
                    {field: 'id', title: 'ID', width: 120, sort: true, fixed: 'left', align: 'center',hide:true}
                    , {field: 'coach_id', title: '教练id', width: 130, sort: true, align: 'center',hide:true}
                    , {field: 'name', title: '违规人员', width: 100, align: 'center'}
                    , {field: 'content', title: '违规内容', width: 180, sort: true, align: 'center'}
                    , {field: 'result', title: '处罚结果', width: 120, sort: true, align: 'center'}
                    , {field: 'coach_state_id', title: '账号状态', width: 180, sort: true, align: 'center',
                        templet: function(d){
                            if (1==d.coach_state_id){
                                return '启用'
                            }else if (2==d.coach_state_id){
                                return '封停'
                            }else if(3==d.coach_state_id){
                                return '禁止报名'
                            }else if(4==d.coach_state_id){
                                return '运管待审核'
                            }else if(5==d.coach_state_id){
                                return '信息不完整'
                            }
                            return '运管审核不通过'
                        }}
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
                            name : $("#name").val(),
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
                            url :path1+'/school/deletePunish',
                            data: "id="+data.id,
                            dataType : "text",
                            success:function(data){
                                if ("success"==data){
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

                if(layEvent === 'employ'){ //启用
                    $.ajax({
                        async:true,
                        method : "POST",
                        url :path1+'/school/employPunish',
                        data: data,
                        dataType : "text",
                        success:function(data){
                            if ("success"==data){
                                layer.alert("启用成功",{icon:6},function () {
                                    window.parent.location.reload();
                                });
                            }else {
                                layer.alert("启用失败",{icon:2});
                            }
                        },
                        error:function (err) {
                            layer.alert("网络繁忙",{icon:2});
                        }
                    })
                }


            });

            $("#add").click(function () {
                layer.open({
                    title:'添加违规记录',
                    type: 2,
                    area: ['1000px', '400px'],
                    content:path+"/school/jumpPunish",//弹出的页面
                });
            })

        });






    </script>
</html>
