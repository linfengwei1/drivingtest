layui.use(['upload','jquery','element'], function(){
    var upload = layui.upload,
        $=layui.jquery,
        element=layui.element;
    element.init();
    var path =$("#path").val();
    //执行实例
    var uploadInst = upload.render({
        elem: '#test8' //绑定元素
        ,url: path+'/user/upload1' //上传接口
        ,auto: false//是否自动上传
        ,accept: 'images'
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

