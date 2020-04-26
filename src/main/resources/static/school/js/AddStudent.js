layui.use(['form','upload','element'], function(){
    var form = layui.form;
    var $ = layui.jquery
        ,upload = layui.upload,
        element = layui.element;
    var path = $("#path").val();

    //普通图片上传
    var uploadInst = upload.render({
        elem: '#test1'
        ,url: path+'/school/uploadImg/'
        ,accept:'images'
        ,size:50000
        // ,auto: false//是否自动上传
        // ,bindAction: '#OK'
        ,before: function(obj){

            obj.preview(function(index, file, result){

                $('#demo1').attr('src', result);
            });
        }
        ,done: function(res){
            //如果上传失败
            if(res.code > 0){
                return layer.msg('上传失败');
            }
            //上传成功
            var demoText = $('#demoText');
            demoText.html('<span style="color: #4cae4c;">上传成功</span>');

            var fileupload = $(".image");
            fileupload.attr("value",res.data.src);
            console.log(fileupload.attr("value"));
        }
        ,error: function(){
            //演示失败状态，并实现重传
            var demoText = $('#demoText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function(){
                uploadInst.upload();
            });
        }
    });




    $("#account").blur(function (){
        //获取用户名的值
        var UserName3=$("#account").val();
        //定义正则表达式
        var r_UserName3 = /^[\u4E00-\u9FA5A-Za-z0-9_]{2,18}$/;//6-8个字符
        //判断值是否符合正则表达式的规则
        if (!r_UserName3.test(UserName3)){
            $("#err1").html("正确用户名为2到18位中文、下划线、字母和数字组成");
        }else {
            $.ajax({
                url: path + "/school/CheckStudentAccount",
                async: true,
                type: "post",
                data: "name=" + $("#account").val(),
                datatype: "text",
                success: function (msg) {
                    if (msg == 1111) {
                        $("#err1").html("√");
                    } else  {
                        $("#err1").html("用户名已经被注册");
                        return false;
                    }
                },
                error: function () {
                    alert("网络繁忙");
                }
            })
        }
    })

    $("#pwd").blur(function (){
        var  UserPaw3=$("#pwd").val()
        var  r_UserPaw3 =/^[A-Za-z0-9_]{6,8}$/;//(正确的密码为6到8位下划线、字母和数字组成)
        //判断值是否符合正则表达式的规则
        if (!r_UserPaw3.test(UserPaw3)){
            $("#err5").html("正确的密码为6到8位下划线、字母和数字组成！");
        }else {
            $("#err5").html("√");
        }
    })

    $("#rpassword").blur(function (){
        var paw =$("#pwd").val()
        var rpaw =$("#rpassword").val()
            if (paw!=rpaw){
                $("#err2").html("两次密码输入不一致");
            }else {
                $("#err2").html("√");
            }
    })

    $("#phone").blur(function (){
        var UserPhone3=$("#phone").val();;
        var r_UserPhone3 = /^1(3|4|5|6|7|8|9)\d{9}$/;
        if (!r_UserPhone3.test(UserPhone3)){
            $("#err3").html("请输入正确的手机号码！");
        }else {
            $("#err3").text("√");
        }
    })

    //监听提交
    form.on('submit(formDemo)', function(data){
        var path = $("#path").val();
        // var a =JSON.stringify(data.field)
        var fileupload = $(".image");
        console.log("返回的路径="+fileupload.attr("value"))

        $.ajax({
            url: path + "/school/addStudent",
            async: true,
            type: "POST",
            data:  data.field,
            datatype: "text",
            beforeSend:function () {
                if ("用户名已经被注册"==$("#err1").text()){
                    layer.alert("用户名已经被注册",{icon:2})
                    return false;
                }
                if ("正确用户名为2到18位中文、下划线、字母和数字组成"==$("#err1").text()){
                    layer.alert("请输入正确的账号格式",{icon:2})
                    return false;
                }
                if ("正确的密码为6到8位下划线、字母和数字组成！"==$("#err5").html()){
                    layer.alert("请出入正确的密码",{icon:2})
                    return false;
                }
                if ("两次密码输入不一致"==$("#err2").html()){
                    layer.alert("两次密码输入不一致",{icon:2})
                    return false;
                }
                if ("请输入正确的手机号码！"==$("#err3").html()){
                    layer.alert("请输入正确的手机号码",{icon:2})
                    return false;
                }if (""==fileupload.val()){
                    layer.alert("请上传图片",{icon:2})
                    return false;
                }

            },
            success: function (msg) {
                console.log(msg)
                if (msg == "success") {
                    layer.alert("新增成功",{icon:6},function () {
                        window.parent.location.reload();
                    });
                }else if (msg=="IdError"){
                    layer.alert("身份证号码有误",{icon:2})
                } else {
                    layer.alert("新增失败",{icon:2})
                }
            },
            error: function () {
                layer.alert("网络繁忙！")
            }
        });
        return false;
    });


});

// layui.use('upload', function(){
//     var $ = layui.jquery
//         ,upload = layui.upload;
//     var path = $("#path").val();
//     alert(1)
//     //普通图片上传
//     var uploadInst = upload.render({
//         elem: '#test1'
//         ,auto: false//是否自动上传
//         ,url: path + "/school/addStudent" //改成您自己的上传接口
//         ,bindAction: '#OK'
//         ,before: function(obj){
//             //预读本地文件示例，不支持ie8
//             obj.preview(function(index, file, result){
//                 $('#demo1').attr('src', result); //图片链接（base64）
//             });
//         }
//         ,done: function(res){
//             //如果上传失败
//             if(res.code > 0){
//                 return layer.msg('上传失败');
//             }
//             //上传成功
//         }
//     });
// });