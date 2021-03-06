
layui.use(['upload', 'jquery', 'layer','table','laydate'], function () { //导入模块
    $ = layui.jquery;
    var form = layui.form;
    var table = layui.table;
    var path = $("#path").val();


    //第一个实例
    table.render({
        elem: '#dataTable'
        , height: 280
        , url: path + '/coach/CoachStudentTable' //数据接口
        , page: true //开启分页
        , id: 'searchTable'
        , limit: 5
        , limits: [5, 10, 15, 20]
        , cols: [[
            {field: 'id', title: '学员ID', width: 120, sort: true, fixed: 'left', align: 'center'}
            , {field: 'account', title: '学员账号', width: 100, align: 'center'}
            , {field: 'name', title: '姓名', width: 100,  align: 'center'}
            , {field: 'sex', title: '性别', width: 80, align: 'center'}
            , {field: 'age', title: '年龄', width: 90, sort: true, align: 'center'}
            , {field: 'idNumber', title: '身份证号码', width: 180, sort: true, align: 'center'}
            // , {field: 'idNumber', title: '当前学时', width: 180, sort: true, align: 'center'}
            , {field: 'phone', title: '联系方式', width: 120, align: 'center'}
            , {field: 'student_state_id', title: '当前阶段', width: 130, align: 'center',
                templet: function(d){
                    console.log("student_state_id:"+d.state);
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
                    } else if(9==d.student_state_id){
                        return '科目一申请考试'
                    }else if(10==d.student_state_id){
                        return '科目二申请考试'
                    }else if(11==d.student_state_id){
                        return '科目三申请考试'
                    }else if(12==d.student_state_id){
                        return '科目四申请考试'
                    }else if(13==d.student_state_id){
                        return '科目一考试中'
                    }else if(14==d.student_state_id){
                        return '科目二考试中'
                    }else if(15==d.student_state_id){
                        return '科目三考试中'
                    }else if(16==d.student_state_id){
                        return '科目四考试中'
                    }
                    return '毕业'
                }}
            , {field: 'time', title: '当前阶段学时', width: 120, align: 'center'}
            , {field: 'oneScore', title: '科目一成绩', width: 120, align: 'center',templet: function(d){
                    if (0 == d.oneScore){
                        return '暂无'
                    }else
                    {
                        return d.oneScore;
                    }
                }}
            , {field: 'twoScore', title: '科目二成绩', width: 120, align: 'center',templet: function(d){
                    if (0 == d.twoScore){
                        return '暂无'
                    }else
                    {
                        return d.twoScore;
                    }
                }}
            , {field: 'threeScore', title: '科目三成绩', width: 120, align: 'center',templet: function(d){
                    if (0 == d.threeScore){
                        return '暂无'
                    }else
                    {
                        return d.threeScore;
                    }
                }}
            , {field: 'fourScore', title: '科目四成绩', width: 120, align: 'center',templet: function(d){
                    if (0 == d.fourScore){
                        return '暂无'
                    }else
                    {
                        return d.fourScore;
                    }
                }}
            // , {field: '', title: '操作', toolbar: "#butdiv", width: 250, align: 'center'}
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




