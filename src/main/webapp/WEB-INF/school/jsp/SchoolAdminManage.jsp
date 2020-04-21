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
    <title>驾校管理员管理</title>
    <%String path = request.getContextPath(); %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<%--    <script src="${pageContext.request.contextPath}/static/school/js/SchoolAdminManage.js" type="text/javascript" charset="UTF-8"></script>--%>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" onsubmit="return false" >
    <div class="layadmin-user-login-box layadmin-user-login-header" style="background-color: #dadada">
        <h2 style="margin-left: 43%">管理员管理</h2>
    </div>
    <div class="layui-fluid" id="searchTable" style="margin-top: 1%;">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <div style="padding-bottom: 10px;">
                <div class="layui-upload">
                    <div style="float: left;margin-left: 12%">
                        <label class="layui-form-label">状态</label>
                        <div class="layui-input-block" style="width: 190px;">
                            <select  name="state" id="state" >
                                <option value=""></option>
                                <option value="3">启用</option>
                                <option value="2">封停</option>
                                <option value="1">禁止报名</option>
                            </select>
                        </div>
                    </div>

                    <div style="float: left">
                        <label class="layui-form-label" >姓名</label>
                        <div class="layui-input-block" style="width: 190px">
                            <input class="layui-input" name="name" id="name" autocomplete="off">
                        </div>
                    </div>
                    <div style="float: left">
                        <label class="layui-form-label" >联系方式</label>
                        <div class="layui-input-block" style="width: 190px">
                            <input class="layui-input" name="phone" id="phone" autocomplete="off">
                        </div>
                    </div>
                    <div style="clear: left;padding-top: 10px;margin-left: 25%">
                        <label class="layui-form-label" >创建时间</label>
                        <div class="layui-inline">
                            <input class="layui-input" type="date" name="time1" id="time1" autocomplete="off">
                        </div>
                        至：
                        <div class="layui-inline" style="clear: left">
                            <input class="layui-input" type="date" name="time2"  id="time2"autocomplete="off">
                        </div>
<%--                        <button class="layui-btn layui-btn-normal" id="button" lay-submit="" lay-filter="formDemo" data-type="reload" ><i class="layui-icon">&#xe615;</i>搜索</button>--%>
                        <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="formDemo" data-type="reload"><i class="layui-icon">&#xe615;</i>搜索</button>
                        <button type="button"  class="layui-btn layui-btn-normal" id="add"><i class="layui-icon">&#xe654;</i>添加管理员</button>
                    </div>
                    </div>
            </div>
        </div>
    </div>

    <div class="layui-anim layui-anim-scale">
        <table id="dataTable" lay-filter="test"></table>
    </div>
    <script type="text/html" id="butdiv">
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="update" ><i class="layui-icon">&#xe642;</i>更新</button>
    </script>

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
                            // schoolStateId :$("#state option:selected").text(),//状态
                            state :$("#state").val(),
                            name : $("#name").val(),
                            phone : $("#phone").val()
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
                            url :path1+'/school/deleteSchoolAdmin',
                            data: data,
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
                if(layEvent === 'update'){ //更新
                    var $td = $(this).parents('tr').children('td');
                    var id = $td.eq(0).text();//获取点击按钮相对应的id
                    var name = $td.eq(2).text();
                    var phone = $td.eq(3).text();
                    layer.open({
                        title:'更改驾校管理员信息',
                        type: 2,
                        area: ['500px', '400px'],
                        content:path+"/school/path/UpdateSchoolAdmin",//弹出的页面
                        success: function (layero, index) {
                            var body = layer.getChildFrame("body", index);//弹出页面的body标签
                            body.find("#id").val(id);//先在原页面获取值后，在设置弹窗的值
                            body.find("#name").val(name);//设置弹窗的值
                            body.find("#phone").val(phone);
                        },

                    });
                }
            });

            $("#add").click(function () {
                layer.open({
                    title:'添加驾校管理员信息',
                    type: 2,
                    area: ['700px', '400px'],
                    content:path+"/school/path/AddSchoolAdmin",//弹出的页面
                });
            })
        });
    </script>
</html>
