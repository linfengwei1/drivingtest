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
    <title>车辆管理</title>
    <%String path = request.getContextPath(); %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" action="" onsubmit="return false" >
    <div class="layadmin-user-login-box layadmin-user-login-header" style="background-color: #dadada">
        <h2 style="margin-left: 43%">车辆管理</h2>
    </div>
    <div class="layui-fluid" id="searchTable" style="margin-top: 1%;">
        <div class="layui-form-item">
            <div style="padding-bottom: 10px;">
                <div class="layui-upload">
                    <div style="float: left">
                        <label class="layui-form-label" >教练姓名</label>
                        <div class="layui-input-inline" style="width: 190px">
                            <input class="layui-input" name="name" id="name" autocomplete="off">
                        </div>
                    </div>
                    <div style="float: left;margin-left: 2%">
                        <label class="layui-form-label" >车牌号码</label>
                        <div class="layui-inline" style="width: 190px">
                            <input class="layui-input" name="carNumber" id="carNumber" autocomplete="off">
                        </div>
                    </div>
                    <div style="float: left;margin-left: 2%">
                        <label class="layui-form-label">状态</label>
                        <div class="layui-input-block" style="width: 190px;">
                            <select  name="carState" id="carState">
                                <option value=""></option>
                                <option value="审核通过">审核通过</option>
                                <option value="待审核">待审核</option>
                                <option value="审核失败">审核失败</option>
                            </select>
                        </div>
                    </div>
                    <div style="clear: left;margin-left: 30%;padding-top: 1% ">
                        <button class="layui-btn layui-btn-normal" id="button" lay-submit="" lay-filter="formDemo" data-type="reload" ><i class="layui-icon">&#xe615;</i>搜索</button>
                        <button type="button"  class="layui-btn layui-btn-normal" id="add"><i class="layui-icon">&#xe654;</i>添加车辆</button>
                        <button type="button"  class="layui-btn layui-btn-normal" id="in"><i class="layui-icon">&#xe654;</i>EXCEL导入</button>
                        <a style="color: #1E9FFF;margin-left: 2%;" href="${pageContext.request.contextPath}/school/downTemplate?name=教练车模板">教练车模板下载</a>
                    </div>
                    </div>
            </div>
        </div>
    </div>
    <table id="dataTable" lay-filter="test"></table>


</form>
</body>
<script type="text/html" id="barDemo">

    {{#  if(d.carState == '审核失败'){ }}
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="update" ><i class="layui-icon">&#xe642;</i>人员分配</button>
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="resubmit" ><i class="layui-icon">&#xe642;</i>重新审核</button>

    {{# } if(d.carState == '信息不完整'){ }}
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="AddCarImage" ><i class="layui-icon">&#xe642;</i>图片上传</button>
    {{# } if(d.carState == '审核通过'){ }}
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="update" ><i class="layui-icon">&#xe642;</i>人员分配</button>
    {{# } if(d.carState == '待审核'){ }}
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>
    {{#  } }}


</script>



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
            , url: path + '/school/SchoolCarTable' //数据接口
            , page: true //开启分页
            , id: 'searchTable'
            , limit: 5
            , limits: [5, 10, 15, 20]
            , cols: [[ //表头
                {field: 'id', title: '车辆ID', width: 120, sort: true, fixed: 'left', align: 'center'}
                ,{field:'picture', title: '车辆图片',width:200,templet:'<div><img src="${pageContext.request.contextPath}/static{{d.picture}}" onclick="previewImg(this)"></div>'}
                , {field: 'carNumber', title: '车辆车牌号', width: 120, align: 'center'}
                , {field: 'coach_id', title: '教练id', width: 120, align: 'center',hide:true}
                , {field: 'coachName', title: '所属教练员', width: 120,  align: 'center'}
                , {field: 'carState', title: '当前状态', width: 130, align: 'center'}
                , {field: '', title: '操作', toolbar: "#barDemo", width: 300, align: 'center'}
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
                        carNumber: $("#carNumber").val(),
                        state :$("#carState").val(),
                        name : $("#name").val(),
                    }
                });
            }
        });


        //删除
        //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        table.on('tool(test)', function(obj){
            var data = obj.data; //获得当前行数据
            // console.log("删除1="+data.id)
            // var addTypeInf =JSON.stringify(data)
            // console.log("删除="+addTypeInf)
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var path1 = $("#path").val();
            if(layEvent === 'delete'){ //删除
                layer.confirm('您确定要删除吗?', {icon: 3, title:'提示'}, function(index){
                    $.ajax({
                        async:true,
                        method : "POST",
                        url :path1+'/school/deleteCar',
                        data:"id="+data.id,
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
                var id = $td.eq(0).text();//车辆id
                var carNumber = $td.eq(1).text();//车牌号
                var cid = $td.eq(2).text();//教练id
                var name = $td.eq(3).text();//教练名
                console.log(cid)
                layer.open({
                    title:'车辆人员变更',
                    type: 2,
                    area: ['500px', '400px'],
                    content:path1+"/school//findCoach",//弹出的页面
                    success: function (layero, index) {
                        var body = layer.getChildFrame("body", index);//弹出页面的body标签
                        body.find("#id").val(id);//先在原页面获取值后，在设置弹窗的值
                        body.find("#carNumber").val(carNumber);//设置弹窗的值
                        var iframe = layero.find('iframe')[0].contentWindow;//新iframe窗口的对象
                        body.find("#coach_id").val(cid);
                        iframe.layui.form.render('select');//对页面中的下拉框重新渲染
                    },

                });
            }

            if(layEvent === 'resubmit'){ //重新提交
                var $td = $(this).parents('tr').children('td');
                var id = $td.eq(0).text();//获取点击按钮相对应的id
                $.ajax({
                    async:true,
                    method : "POST",
                    url :path1+'/school/carResubmit',
                    data: "id="+id,
                    dataType : "text",
                    success:function(data){
                        if ("success"==data){
                            layer.alert("提交成功",{icon:6},function () {
                                window.parent.location.reload();
                            });
                        }else {
                            layer.alert("提交失败",{icon:2});
                        }
                    },
                    error:function (err) {
                        layer.alert("网络繁忙",{icon:2});
                    }
                })

            }


            if(layEvent === 'AddCarImage'){ //上传图片
                var $td = $(this).parents('tr').children('td');
                var id = $td.eq(0).text();//获取点击按钮相对应的id
                layer.open({
                    title:'上传图片',
                    type: 2,
                    area: ['500px', '400px'],
                    content:path1+"/school/path/AddCarImage",//弹出的页面
                    success: function (layero, index) {
                        var body = layer.getChildFrame("body", index);//弹出页面的body标签
                        body.find("#id").val(id);//先在原页面获取值后，在设置弹窗的值

                    },

                });
            }
        });

        $("#add").click(function () {
            layer.open({
                title:'车辆添加',
                type: 2,
                area: ['600px', '425px'],
                content:path+"/school/JumpAddCar",//弹出的页面
            });
        })

        $("#in").click(function () {
            layer.open({
                title:'文件导入车辆信息',
                type: 2,
                area: ['500px', '400px'],
                content:path+"/school/path/AddCarByExcel",//弹出的页面
            });
        })



    });
    function previewImg(obj) {
        var img = new Image();
        img.src = obj.src;
        //var height = img.height + 50; // 原图片大小
        //var width = img.width; //原图片大小
        var imgHtml = "<img src='" + obj.src + "' width='500' height='550px'/>";
        //弹出层
        layer.open({
            type: 1,
            shade: 0.8,
            offset: '200px',
            area: [400 + 'px',400+'px'],  // area: [width + 'px',height+'px']  //原图显示
            shadeClose:true,
            scrollbar: false,
            resize:false,
            title: "车辆预览", //不显示标题
            content: imgHtml, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
            cancel: function () {
                //layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构', { time: 5000, icon: 6 });
            }
        });
    }

</script>
</html>
