$(function () {
    layui.use(['form','jquery','layer'],  function(){
        var form = layui.form;
        var layer = layui.layer;
        var path = $("#path").val();
        //监听提交
        form.on('submit(formDemo)', function(data){
            console.log(data.field);
            var loading = layer.msg('正在登录', {icon: 16, shade: 0.3});

            $.ajax({
                url:path+'/student/login',
                type:'post',
                data: data.field,
                success:function(data){

                    console.log("data="+data);
                    if ("success"==data){
                        $("#loginbtn").attr("disabled",true);
                        location.href=path+"/student/path/StudentMain"
                    }else if ("yzm"==data) {
                        layer.msg("验证码错误",function () {
                            refreshCode();
                        });
                    }else {
                        layer.msg("密码错误",function () {
                            window.location.reload();
                        });
                    }
                },error:function (err) {
                    layer.msg("网络繁忙",function () {
                        window.location.reload();
                    });
                }
            });
            return false;//阻止表单跳转
        });
    });
})






function refreshCode() {//给图片添加一个点击事件
    var YZM = document.getElementById("passPhoto");//使用js的可以,换成jq不行(还不知道为什么)
    var path = $("#path").val();
    //点击时更换验证码，其中的？num是随便添加的一个参数,为了让程序知道每次都是不一样的,才能更新
    // Math.random()是实现随机的一个方法
    YZM.src=path+"/student/CheckCode?num="+Math.random()+1;

}