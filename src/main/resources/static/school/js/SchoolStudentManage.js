
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
        , url: path + '/school/SchoolStudentTable' //数据接口
        , page: true //开启分页
        , id: 'searchTable'
        , limit: 5
        , limits: [5, 10, 15, 20]
        , cols: [[ //表头
            {field: 'id', title: '学员ID', width: 100, sort: true, fixed: 'left', align: 'center'}
            , {field: 'account', title: '学员账号', width: 100, align: 'center',hide:true}
            , {field: 'name', title: '姓名', width: 80,  align: 'center'}
            , {field: 'sex', title: '性别', width: 60, align: 'center'}
            , {field: 'age', title: '年龄', width: 90, sort: true, align: 'center'}
            , {field: 'idNumber', title: '身份证号码', width: 180, align: 'center'}
            , {field: 'phone', title: '联系方式', width: 120, align: 'center'}
            , {field: 'student_state_id', title: '当前状态', width: 130, align: 'center',
                templet: function(d){
                var state;
                if (1==d.student_state_id){
                    return '科目一'
                }else if (2==d.student_state_id){
                    return '科目二'
                }else if(3==d.student_state_id){
                    return '科目三'
                }else if(4==d.student_state_id){
                    return '科目四'
                }else if(5==d.student_state_id){
                    return '待审核'
                }else if(6==d.student_state_id){
                    return '审核不通过'
                }else if(8==d.student_state_id){
                    return '资料不完整'
                }else if(9==d.student_state_id){
                    return '科目一申请考试'
                }else if(10==d.student_state_id){
                    return '科目二申请考试'
                }else if(11==d.student_state_id){
                    return '科目三申请考试'
                }else if(12==d.student_state_id){
                    return '科目四申请考试'
                }
                    return '毕业'
                }}
            , {field: '', title: '操作', toolbar: "#butdiv", width: 380}
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
        if(layEvent === 'update'){ //更新
            var $td = $(this).parents('tr').children('td');
            var id = $td.eq(0).text();//获取点击按钮相对应的id
            var name = $td.eq(2).text();
            var phone = $td.eq(6).text();
            layer.open({
                title:'更改学员信息',
                type: 2,
                area: ['500px', '400px'],
                content:path1+"/school/path/UpdateStudent",//弹出的页面
                success: function (layero, index) {
                    var body = layer.getChildFrame("body", index);//弹出页面的body标签
                    body.find("#id").val(id);//先在原页面获取值后，在设置弹窗的值
                    body.find("#name").val(name);//设置弹窗的值
                    body.find("#phone").val(phone);
                },

            });
        }
        if(layEvent === 'AddStudentImage'){ //上传图片
            var $td = $(this).parents('tr').children('td');
            var id = $td.eq(0).text();//获取点击按钮相对应的id
            layer.open({
                title:'上传图片',
                type: 2,
                area: ['500px', '400px'],
                content:path1+"/school/path/AddStudentImage",//弹出的页面
                success: function (layero, index) {
                    var body = layer.getChildFrame("body", index);//弹出页面的body标签
                    body.find("#id").val(id);//先在原页面获取值后，在设置弹窗的值

                },

            });
        }

        if(layEvent === 'check'){ //查看学时
            var $td = $(this).parents('tr').children('td');
            var id = $td.eq(0).text();//获取点击按钮相对应的id
            layer.open({
                title:'查看学时',
                type: 2,
                area: ['600px', '400px'],
                content:path1+"/school/path/CheckStudyInf?id="+id,//弹出的页面
                success: function (layero, index) {
                    var body = layer.getChildFrame("body", index);//弹出页面的body标签
                    body.find("#id").val(id);//先在原页面获取值后，在设置弹窗的值

                },

            });
        }

        if(layEvent === 'resubmit'){ //重新提交
            var $td = $(this).parents('tr').children('td');
            var id = $td.eq(0).text();//获取点击按钮相对应的id
            $.ajax({
                async:true,
                method : "POST",
                url :path1+'/school/studentResubmit',
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
        if(layEvent === 'StudentMsg'){ //查看学员详情
            var $td = $(this).parents('tr').children('td');
            var id = $td.eq(0).text();//获取点击按钮相对应的id
            console.log("个人详情id="+id)
            layer.open({
                title:'查看个人详情',
                type: 2,
                area: ['600px', '430px'],
                content:path1+"/school/getStudentMsg?id="+id,//弹出的页面
                success: function (layero, index) {
                    var body = layer.getChildFrame("body", index);//弹出页面的body标签
                    body.find("#id").val(id);//先在原页面获取值后，在设置弹窗的值

                },

            });
        }
    });

    $("#add").click(function () {
        layer.open({
            title:'学员注册',
            type: 2,
            area: ['1000px', '425px'],
            content:path+"/school/jumpAddStudent",//弹出的页面
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




