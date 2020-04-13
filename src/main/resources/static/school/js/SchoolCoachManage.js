
layui.use(['upload', 'jquery', 'layer','table','laydate'], function () { //导入模块
        $ = layui.jquery;
     var form = layui.form;
    var table = layui.table;
    var path = $("#path").val();


    //第一个实例
    table.render({
        elem: '#dataTable'
        , height: 280
        , url: path + '/school/SchoolCoachTable' //数据接口
        , page: true //开启分页
        , id: 'searchTable'
        , limit: 5
        , limits: [5, 10, 15, 20]
        , cols: [[ //表头
            {field: 'id', title: '教练ID', width: 120, sort: true, fixed: 'left', align: 'center',hide:true}
            , {field: 'account', title: '教练账号', width: 100, align: 'center'}
            , {field: 'name', title: '姓名', width: 80,  align: 'center'}
            , {field: 'sex', title: '性别', width: 80, align: 'center'}
            , {field: 'age', title: '年龄', width: 90, sort: true, align: 'center'}
            , {field: 'idnumber', title: '身份证号码', width: 180, sort: true, align: 'center'}
            , {field: 'phone', title: '联系方式', width: 120, align: 'center'}
            , {field: 'coach_state_id', title: '当前状态', width: 130, align: 'center',
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
            , {field: '', title: '操作', toolbar: "#butdiv", width: 300, align: 'center'}
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
                    url :path1+'/school/deleteCount',
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
            var phone = $td.eq(6).text();
            layer.open({
                title:'更改教练信息',
                type: 2,
                area: ['500px', '400px'],
                content:path+"/school/path/UpdateCoach",//弹出的页面
                success: function (layero, index) {
                    var body = layer.getChildFrame("body", index);//弹出页面的body标签
                    body.find("#id").val(id);//先在原页面获取值后，在设置弹窗的值
                    body.find("#name").val(name);//设置弹窗的值
                    body.find("#phone").val(phone);
                },

            });
        }

        if(layEvent === 'resubmit'){ //重新提交
            var $td = $(this).parents('tr').children('td');
            var id = $td.eq(0).text();//获取点击按钮相对应的id
            $.ajax({
                async:true,
                method : "POST",
                url :path1+'/school/coachResubmit',
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
        if(layEvent === 'CoachMsg'){ //查看教练详情
            var $td = $(this).parents('tr').children('td');
            var id = $td.eq(0).text();//获取点击按钮相对应的id
            alert(1)
            console.log("个人详情id="+id)
            layer.open({
                title:'查看个人详情',
                type: 2,
                area: ['600px', '430px'],
                content:path1+"/school/getCoachMsg?id="+id,//弹出的页面
                success: function (layero, index) {
                    var body = layer.getChildFrame("body", index);//弹出页面的body标签
                    body.find("#id").val(id);//先在原页面获取值后，在设置弹窗的值

                },

            });
        }


        if(layEvent === 'AddCoachImage'){ //上传图片
            var $td = $(this).parents('tr').children('td');
            var id = $td.eq(0).text();//获取点击按钮相对应的id
            layer.open({
                title:'上传图片',
                type: 2,
                area: ['500px', '400px'],
                content:path1+"/school/path/AddCoachImage",//弹出的页面
                success: function (layero, index) {
                    var body = layer.getChildFrame("body", index);//弹出页面的body标签
                    body.find("#id").val(id);//先在原页面获取值后，在设置弹窗的值

                },

            });
        }

    });

    $("#add").click(function () {
        layer.open({
            title:'教练申请',
            type: 2,
            area: ['1000px', '425px'],
            content:path+"/school/path/AddCoach",//弹出的页面
        });
    })

    $("#out").click(function () {
        window.location.href =path+"/school/export";
        // layer.confirm('您确定要导出吗?', {icon: 3, title:'提示'}, function(index){
        //     $.ajax({
        //         async:true,
        //         method : "POST",
        //         url :path+"/school/export",
        //         dataType : "text",
        //         success:function(data){
        //             if ("success"==data){
        //                 layer.alert("导出成功",{icon:6},function () {
        //                     window.parent.location.reload();
        //                 });
        //             }else {
        //                 layer.alert("导出失败",{icon:2});
        //             }
        //         },
        //         error:function (err) {
        //             layer.alert("网络繁忙",{icon:2});
        //         }
        //     })
        // })
    })
});




