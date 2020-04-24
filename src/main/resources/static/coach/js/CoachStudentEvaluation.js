
layui.use(['upload', 'jquery', 'layer','table','laydate'], function () { //导入模块
    $ = layui.jquery;
    var form = layui.form;
    var table = layui.table;
    var path = $("#path").val();


    //第一个实例
    table.render({
        elem: '#dataTable'
        , height: 280
        , url: path + '/coach/CoachStudentEvaluationTable' //数据接口
        , page: true //开启分页
        , id: 'searchTable'
        , limit: 5
        , limits: [5, 10, 15, 20]
        , cols: [[
            {field: 'id', title: '学员ID', width: 120, sort: true, fixed: 'left', align: 'center'}
            , {field: 'content', title: '学员评论', width: 1500, align: 'center'}
            , {field: 'time', title: '时间', width: 400,  align: 'center'}
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
                    idnumber: $("#idnumber").val(),
                    sex: $("#sex").val(),
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
                    url :path1+'/school/deleteStudent',
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

    });

    $("#add").click(function () {
        layer.open({
            title:'学员注册',
            type: 2,
            area: ['1000px', '425px'],
            content:path+"/school/path/AddStudent",//弹出的页面
        });
    })

    $("#in").click(function () {
        layer.open({
            title:'文件导入学员信息',
            type: 2,
            area: ['500px', '400px'],
            content:path+"/school/path/AddStudentInf",//弹出的页面
        });
    })
});




