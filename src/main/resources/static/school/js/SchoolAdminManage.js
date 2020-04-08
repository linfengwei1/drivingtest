
layui.use(['upload', 'jquery', 'layer','table','laydate'], function () { //导入模块
        $ = layui.jquery;
     var form = layui.form;
    var table = layui.table;
    var path = $("#path").val();


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
            , {field: 'time', title: '创建时间', width: 160, sort: true,align: 'center'}
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
        var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
        var path1 = $("#path").val();
        if(layEvent === 'delete'){ //查看
            $.ajax({
                async:true,
                method : "POST",
                url :path1+'/user/deleteDocumentInf',
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
                }
            })
        }
    });
});




