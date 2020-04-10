// layui.use(['upload','element','jquery'], function(){
//     var $ = layui.jquery
//         ,upload = layui.upload,
//         element = layui.element;
//     var path = $("#path").val();
//     //普通图片上传
//     var pid=$(" input[ name='pid1' ] ").val()
//     var uploadInst = upload.render({
//         elem: '#test1'
//         ,url:path+ 'school/upload1'
//         ,before: function(obj){
//             //预读本地文件示例，不支持ie8
//             obj.preview(function(index, file, result){
//                 $('#demo1').attr('src', result); //图片链接（base64） 用来显示返回的文件
//             });
//         }
//         ,done: function(res){
//             //如果上传失败
//             if(res.code > 0){
//                 return layer.msg('上传失败');
//             }else {
//                 return layer.msg('上传成功');
//             }
//             //上传成功
//         }
//         // ,error: function(){
//         //     //演示失败状态，并实现重传
//         //     var demoText = $('#demoText');
//         //     demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
//         //     demoText.find('.demo-reload').on('click', function(){
//         //         uploadInst.upload();
//         //     });
//         // }
//     });
// });


// layui.use('upload', function() {
//     var path = $("#path").val();
//     var upload = layui.upload;
//
//     upload.render({
//
//         elem: '#ongImg',
//
//         url: path+ 'school/upload1',
//
//         auto: false,    //是否自动上传
//
//         accept: 'images',   //指定允许上传的文件类型
//
//         bindAction: '#imgSave',  //指向一个按钮触发上传
//
//         //选择文件后的回调函数
//
//         choose: function(obj){
//
//             //将每次选择的文件追加到文件队列
//
//             var files = obj.pushFile();
//
//             //预读本地文件，如果是多文件，则会遍历。
//
//             obj.preview(function(index, file, result){
//
//                 console.log(index); //得到文件索引
//
//                 console.log(file); //得到文件对象
//
//                 console.log(result); //得到文件base64编码，比如图片
//
//                 //图片插入到选择框中，
//
//                 $("#ongImg").html("<img src = '"+result+"' width='200px;' />");
//
//             });
//
//         },
//
//         //上传完成后回调，res为服务器端返回的数据
//
//         done: function(res){
//
//             //关闭loading
//
//             layer.close(index);
//
//         }
//
//     });
//
// });


layui.use(['upload','jquery','element'], function(){
    var upload = layui.upload,
        $=layui.jquery,
        element=layui.element;
    element.init();
    var path =$("#path").val()
    //执行实例
    var uploadInst = upload.render({
        elem: '#test8' //绑定元素
        ,url:  path+ '/school/upload1' //上传接口
        ,auto: false//是否自动上传
        ,accept: 'file'
        ,data : {//要传递的数据
            bookName: $("#hideBookName").val(),//用户输入的标题名字
            downScore: $("#downScore").val(),//下载分数
            intro: $("#intro").val(),//文件简介
        }
        ,multiple:true//上传多个文件
        ,bindAction: '#test9'//配合auto: false来使用，auto: true值一选中文件后就执行上传，关闭后需要根据绑定事件
        ,progress:function (value) {//上传进度回调 value为进度值
            element.progress('demo',value+'%')
        }
        // ,choose: function(obj){  //上传前选择回调方法
        //     obj.preview(function(index, file, result){
        //         //file表示文件信息，result表示文件src地址
        //         $("#fileName").text(file.name)
        //
        //     });
        // }
        ,before: function(obj){
            //预读本地文件示例，不支持ie8
            obj.preview(function(index, file, result){
                $('#demo1').attr('src', result); //图片链接（base64）
            });

        }
        ,done: function(res){
            if(res.code == 0){
                //上传完毕回调
                alert("上传成功！");
                window.location.reload();
            }
            if(res.code == 1){
                //上传完毕回调
                alert("上传异常11111！");
            }
            if(res.code == 2){
                //上传完毕回调
                alert("文件类型不匹配！");
            }
            if(res.code == 3){
                //上传完毕回调
                alert("文件或其他信息不能为空！");
            }
        }
        ,error: function(){
            //请求异常回调
            alert("上传异常！");
        }
    });
});

