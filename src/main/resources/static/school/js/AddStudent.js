layui.use(['form','upload'], function(){
    var form = layui.form;
    var $ = layui.$,upload = layui.upload;
    var path = $("#path").val();
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
                }

            },
            success: function (msg) {
                console.log(msg)
                if (msg == "success") {
                    layer.alert("新增成功",{icon:6},function () {
                        window.parent.location.reload();
                    });
                }else if (msg=="IdError"){
                    layer.alert("身份证号码有误",{icon:6},function () {
                    });
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