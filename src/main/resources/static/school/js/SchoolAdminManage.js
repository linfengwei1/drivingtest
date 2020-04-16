
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
            , {field: 'account', title: '管理员账号', width: 100, align: 'center'}
            , {field: 'name', title: '管理员昵称', width: 180, sort: true, align: 'center'}
            , {field: 'phone', title: '联系方式', width: 120, sort: true, align: 'center'}
            , {field: 'time', title: '创建时间', width: 160, sort: true,align: 'center',templet: "<div>{{layui.util.toDateString(d.time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
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




