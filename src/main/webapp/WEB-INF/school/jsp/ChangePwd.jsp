<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-3-13
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改密码</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>

    <style>
        .layui-main-login {
            margin-top: 7%;
            margin-left: 20%;
            padding-left: 5%;
            padding-top: 2%;
            width: 70%;
            background-color: #dadada;
        }
        .layui-layout-body{
            background-image: url(${pageContext.request.contextPath}/static/images/demo-1-bg.jpg);
            overflow:auto; /*这边设置是为了弹出的时候，如果框的大小小于内容，就出现滑动条*/
        }
    </style>
</head>
<body class="layui-layout-body">
<input type="hidden" id="path" value="<%=path%>">
<div class="layui-main-login">
    <form class="layui-form" action=" " onsubmit="return false" >
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label> <button class="layui-btn layui-btn-primary" id="send" >发送短信</button>
            <div class="layui-input-inline">
                <input type="text" id="phone" name="phone" required lay-verify="required" placeholder="请输入手机验证码" autocomplete="off" class="layui-input">
            </div>
            <span id="err3" style="color: red"></span>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">短信验证码</label>
            <div class="layui-input-inline">
                <input type="text" id="phoneMsg" name="phoneMsg" required lay-verify="required" placeholder="请输入手机号码" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">密码框</label>
            <div class="layui-input-inline">
                <input type="password" id="pwd"  name="pwd" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>

            <span id="err5" style="color: red"></span>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">重复输入</label>
            <div class="layui-input-inline">
                <input type="password"  id="rpassword" name="rpassword" required lay-verify="required" placeholder="请在此输入密码" autocomplete="off" class="layui-input">
            </div>
            <span id="err2"></span>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo" id="OK">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

    </form>
</div>

</body>
<script>
    layui.use('form', function(){
        var form = layui.form;
        var $ = layui.$;

        $("#pwd").blur(function (){
            var  UserPaw3=$("#pwd").val()
            var  r_UserPaw3 =/^[A-Za-z0-9_]{6,8}$/;//(正确的密码为6到8位下划线、字母和数字组成)
            //判断值是否符合正则表达式的规则
            if (!r_UserPaw3.test(UserPaw3)){
                $("#err5").html("正确的密码为6到8位下划线、字母和数字组成！");
            }else {
                $("#err5").html("");
            }
        })

        $("#rpassword").blur(function (){
            var paw =$("#pwd").val()
            var rpaw =$("#rpassword").val()
            if (paw!=rpaw){
                $("#err2").html("两次密码输入不一致");
            }else {
                $("#err2").html("");
            }
        })

        $("#phone").blur(function (){
            var UserPhone3=$("#phone").val();
            var r_UserPhone3 = /^1(3|4|5|6|7|8|9)\d{9}$/;
            if (!r_UserPhone3.test(UserPhone3)){
                $("#err3").html("请输入正确的手机号码！");
            }else {
                $("#err3").text("");
            }
        })

        //监听提交
        form.on('submit(formDemo)', function(data){
            var path = $("#path").val();
            $.ajax({
                url: path + "/school/changePwdByPhone",
                async: true,
                type: "POST",
                data:  data.field,
                datatype: "text",
                beforeSend:function () {
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
                    if (msg == "success") {
                        layer.alert("修改成功",{icon:6},function () {
                            window.parent.location.reload();
                        });
                    }else if (msg == "cancel") {
                        layer.alert("短信验证码已失效",{icon:2})
                    }else {
                        layer.alert("修改失败",{icon:2})
                    }
                },
                error: function () {
                    layer.alert("网络繁忙！")
                }
            });
        });


    });

    // $(function () {
    //     //短信验证码倒计时
    //     var countdownHandler = function(){
    //         var $button = $("#send");
    //         var number = 60;
    //         var countdown = function(){
    //             if (number == 0) {
    //                 $button.attr("disabled",false);
    //                 $button.html("发送验证码");
    //                 number = 60;
    //                 return;
    //             } else {
    //                 $button.attr("disabled",true);
    //                 $button.html(number + "秒 重新发送");
    //                 number--;
    //             }
    //             setTimeout(countdown,1000);
    //         }
    //         setTimeout(countdown,1000);
    //     }
    //
    //     $("#send").click(function () {
    //         var path = $("#path").val();
    //         $.ajax({
    //             url: path+"/school/phoneMsg",
    //             async: true,
    //             type: "POST",
    //             data: "phone="+$("#phone").val(),
    //             datatype: "text",
    //             success: function (msg) {
    //                 if (msg == "success") {
    //                     countdownHandler();
    //                     return ;
    //                 }if (msg=="no"){
    //                     layer.alert("手机号码不存在",{icon:2})
    //                 }
    //             },
    //             error: function () {
    //                 layer.alert("网络繁忙！")
    //             }
    //         });
    //     })
    //
    // })
//====================================================================================


    $('#send').click(function(){
        var path = $("#path").val();
        $.ajax({
            url: path+"/school/phoneMsg",
            async: true,
            type: "POST",
            data: "phone="+$("#phone").val(),
            datatype: "text",
            success: function (msg) {
                if (msg == "success") {
                    $('#send').text('倒计时60s');
                    $('#send').prop('disabled',true);
                    // 设置 cookie 值
                    $(document)[0].cookie = 'ckey='+60;
                    console.log('cookie 设置完毕');
                }if (msg=="no"){
                    layer.alert("手机号码不存在",{icon:2})
                }
            },
            error: function () {
                layer.alert("网络繁忙！")
            }
        });


    });
    function setStyle(){
        var cval = getCookie();
        if(cval>1){
            $('#send').text('倒计时'+cval+'s');
            $('#send').prop('disabled',true);
            console.log('hahah')
        }else{
            $('#send').text('获取验证码');
            $('#send').prop('disabled',false);
        }
    }

    var number = 61;
    // //时间间隔
    id = setInterval(function(){
        number--;
        if (number==0){
            clearTimeout(id);
        }
        setCookie();
        console.log(1);
    },1000)

    setStyle();

    function setCookie(){
        var cval = getCookie();
        if(cval>1){
            $(document)[0].cookie = 'ckey='+(cval-1);
            $('#send').text('倒计时'+(cval-1)+'s');
            $('#send').prop('disabled',true);
        }else if(cval==1){
            $('#send').text('获取验证码');
            $('#send').prop('disabled',false);
            $(document)[0].cookie = 'ckey='+0;
            // clearInterval(id);
        }
    }
    function getCookie(){
        // 获取全部的 cookie
        var cookie = $(document)[0].cookie;
        // 获取 cookie 项  (数组)
        var citem = cookie.split(';');
        // 过滤数组  获得 键为 ckey 的项
        var ckey = citem.filter(function(item){
            return item.split('=')[0].trim()=='ckey';
        });
        // 获得 时间  cval
        cval = ckey[0].split('=')[1];
        return cval;
    }

</script>
</html>
