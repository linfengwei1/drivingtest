//
// layui.use(['upload', 'jquery', 'layer','table','laydate'], function () { //导入模块
//         $ = layui.jquery;
//      var form = layui.form;
//     var table = layui.table;
//     var path = $("#path").val();
//
//
//     //第一个实例
//     table.render({
//         elem: '#dataTable'
//        // , height: 280
//         // , url: path + '/school/SchoolAdminTable' //数据接口
// // <<<<<<< Updated upstream
//         , url: path + "/link/findAllLink"//数据接口，显示出连接列表
//         , page: false //开启分页
// // =======
//         // , url: path + "/front/findAllLink"//数据接口，显示出连接列表
//         , url: path + "/link/findAllLink"//数据接口，显示出连接列表
//
//         , page: true //开启分页
// // >>>>>>> Stashed changes
//         , id: 'searchTable'
//         , limit: 5
//         , limits: [5, 10, 15, 20]
//         , cols: [[ //表头
//             {field: 'linkId', title: '连接ID', width: 120, sort: true, fixed: 'left', align: 'center'}
//             , {field: 'linkName', title: '连接名称', width: 100, align: 'center'}
//             , {field: 'linkUrl', title: '连接地址',  sort: true, align: 'center'}
//             , {field: 'linkSort', title: '连接排序', width: 120, sort: true, align: 'center'}
//
//         ]]
//     });
//
//     $('#searchTable .layui-btn').on('click', function () {
//         var type = $(this).data('type');
//         if (type == 'reload') {
//             //执行重载
//             table.reload('searchTable', {
//                 page: {
//                     curr: 1 //重新从第 1 页开始
//                 }
//                 , where: {
// // <<<<<<< Updated upstream
//
// // =======
//                     //  time1: $("#time1").val(),
//                     //  time2: $("#time2").val(),
//                     // // schoolStateId :$("#state option:selected").text(),//状态
//                     //  state :$("#state").val(),
//                     //  name : $("#name").val(),
//                     //  phone : $("#phone").val()
//                     linkId: $("#linkId").val(),
// // >>>>>>> Stashed changes
//                     linkUrl: $("#linkUrl").val(),
//                     linkName: $("#linkName").val(),
//                     linkSort: $("#linkSort").val()
//                 }
//             });
//         }
//     });
//
//
//     //删除
//     //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
//     table.on('tool(test)', function(obj){
//         var data = obj.data; //获得当前行数据
//         var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
//         var path1 = $("#path").val();
//         if(layEvent === 'delete'){ //删除
//             $.ajax({
//                 async:true,
//                 method : "POST",
//                 url :path1+'/school/deleteSchoolAdmin',
//                 data: data,
//                 dataType : "text",
//                 success:function(data){
//                     if ("success"==data){
//                         layer.alert("删除成功",{icon:6},function () {
//                             window.parent.location.reload();
//                         });
//                     }else {
//                         layer.alert("删除失败",{icon:2});
//                     }
//                 },
//                 error:function (err) {
//                     layer.alert("网络繁忙",{icon:2});
//                 }
//             })
//         }
//         if(layEvent === 'update'){ //更新
//             var $td = $(this).parents('tr').children('td');
//             var id = $td.eq(0).text();//获取点击按钮相对应的id
//             var name = $td.eq(2).text();
//             var phone = $td.eq(3).text();
//             layer.open({
//                 title:'更改驾校管理员信息',
//                 type: 2,
//                 area: ['500px', '400px'],
//                 content:path+"/school/path/UpdateSchoolAdmin",//弹出的页面
//                 success: function (layero, index) {
//                     var body = layer.getChildFrame("body", index);//弹出页面的body标签
//                     body.find("#id").val(id);//先在原页面获取值后，在设置弹窗的值
//                     body.find("#name").val(name);//设置弹窗的值
//                     body.find("#phone").val(phone);
//                 },
//
//             });
//         }
//     });
//
//     $("#add").click(function () {
//         layer.open({
//             title:'添加友情链接',
//             type: 2,
//             area: ['700px', '400px'],
//             content: path+"/link/path/AddLink",//弹出添加连接的jsp
//         });
//     })
// });
//
//
//
//

layui.use(['upload', 'jquery', 'layer','table','laydate'], function () { //导入模块
    $ = layui.jquery;
    var form = layui.form;
    var table = layui.table;
    var path = $("#path").val();


    //第一个实例
    table.render({
        elem: '#dataTable'
        // , height: 280
        // , url: path + '/school/SchoolAdminTable' //数据接口
        , url: path + "/link/findAllLink"//数据接口，显示出连接列表,获取数据
        , page: false //开启分页
        , id: 'searchTable'
        , limit: 5
        , limits: [5, 10, 15, 20]
        , cols: [[ //表头
            {field: 'linkId', title: '连接ID', width: 120, sort: true, fixed: 'left', align: 'center'}
            , {field: 'linkName', title: '连接名称', width: 100, align: 'center'}
            , {field: 'linkUrl', title: '连接地址',  sort: true, align: 'center'}
            , {field: 'linkSort', title: '连接排序', width: 120, sort: true, align: 'center'}
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

                    linkUrl: $("#linkUrl").val(),
                    linkName: $("#linkName").val(),
                    linkSort: $("#linkSort").val()
                }
            });
        }
    });


    // //删除
    // //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
    // table.on('tool(test)', function(obj){
    //     var data = obj.data; //获得当前行数据
    //     var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
    //     var path1 = $("#path").val();
    //     if(layEvent === 'delete'){ //删除
    //         $.ajax({
    //             async:true,
    //             method : "POST",
    //             url :path1+'/school/deleteSchoolAdmin',
    //             data: data,
    //             dataType : "text",
    //             success:function(data){
    //                 if ("success"==data){
    //                     layer.alert("删除成功",{icon:6},function () {
    //                         window.parent.location.reload();
    //                     });
    //                 }else {
    //                     layer.alert("删除失败",{icon:2});
    //                 }
    //             },
    //             error:function (err) {
    //                 layer.alert("网络繁忙",{icon:2});
    //             }
    //         })
    //     }
    //     if(layEvent === 'update'){ //更新
    //         var $td = $(this).parents('tr').children('td');
    //         var id = $td.eq(0).text();//获取点击按钮相对应的id
    //         var name = $td.eq(2).text();
    //         var phone = $td.eq(3).text();
    //         layer.open({
    //             title:'更改驾校管理员信息',
    //             type: 2,
    //             area: ['500px', '400px'],
    //             content:path+"/school/path/UpdateSchoolAdmin",//弹出的页面
    //             success: function (layero, index) {
    //                 var body = layer.getChildFrame("body", index);//弹出页面的body标签
    //                 body.find("#id").val(id);//先在原页面获取值后，在设置弹窗的值
    //                 body.find("#name").val(name);//设置弹窗的值
    //                 body.find("#phone").val(phone);
    //             },
    //
    //         });
    //     }
    // });

    $("#add").click(function () {
        layer.open({
            title:'添加友情链接',
            type: 2,
            area: ['700px', '400px'],
            content: path+"/link/path/AddLink",//弹出添加连接的jsp
        });
    })

    // $("#update").click(function () {
    //     layer.open({
    //         title: '更新友情链接',
    //         type: 2,
    //         area: ['700px', '400px'],
    //         content: path+"/link/path/UpdateLink",//弹出更新链接的jsp
    //     })
    // })

    //删除
    //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
    table.on('tool(test)', function(obj){
        var data = obj.data; //获得当前行数据
        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
        var path1 = $("#path").val();
        if(layEvent === 'delete'){ //删除
            $.ajax({
                async:true,
                method : "POST",
                url :path1+'/link/deleteLink',
                data: data,
                dataType : "text",
                success:function(data){
                    if(confirm("您真的要删除该链接吗？")) {
                        if ("success"==data){
                           layer.alert("删除成功",{icon:6},function () {
                               window.parent.location.reload();
                           });
                       } else {
                           layer.alert("删除失败",{icon:2});
                           layer.close();
                           return false;
                        }
                    } else {
                        layer.alert("取消删除友情链接",{icon:2});
                        layer.close();
                        return false;
                    }
                },
                error:function (err) {
                    layer.alert("网络繁忙",{icon:2});
                }
            })
        }
        if(layEvent === 'update'){ //更新
            var $td = $(this).parents('tr').children('td');
            var linkId = $td.eq(0).text();//获取点击按钮相对应的id
            var linkName = $td.eq(1).text();
            var linkUrl = $td.eq(2).text();
            var linkSort = $td.eq(3).text();
            console.log(linkUrl);
            console.log(linkName);
            layer.open({
                title:'更改友情链接信息',
                type: 2,
                area: ['700px', '400px'],
                content:path+"/link/path/UpdateLink",//弹出的页面
                success: function (layero, index) {
                    var body = layer.getChildFrame("body", index);//弹出页面的body标签
                    body.find("#linkId").val(linkId);//先在原页面获取值后，在设置弹窗的值
                    body.find("#LinkName").val(linkName);//设置弹窗的值
                    body.find("#linkUrl").val(linkUrl);
                    body.find("#linkSort").val(linkSort);
                    // console.log( body.find("#linkUrl").val(linkSort));
                    // console.log( body.find("#linkSort").val(linkSort));
                },

            });
        }
    });
});




