layui.use(['form','jquery'],  function(){
    var form = layui.form;
    $ = layui.jquery;
    var path = $("#path").val();
    //监听提交
    form.on('submit(formDemo)', function(data){

        $.ajax({
            url:path+'/coach/checkLogin',
            type:'post',
            data: data.field,
            success:function(data){
                // layer.msg(data);
                console.log("data="+data)
                if ("success"==data){
                    layer.alert("欢迎",{icon:6},function () {
                        location.href=path+"/coach/path/back"
                    });
                }else if ("yzm"==data) {
                    layer.alert("验证码错误",{icon:3},function () {
                        window.location.reload();
                    });
                }else {
                    layer.alert("账号异常或密码错误！",{icon:3},function () {
                        window.location.reload();
                    });
                }
            },error:function (err) {
                layer.msg("网络繁忙",function () {
                    // window.location.reload();
                });
            }
        });
        return false;//阻止表单跳转
    });
});

function refreshCode() {//给图片添加一个点击事件
    var YZM = document.getElementById("passPhoto");//使用js的可以,换成jq不行(还不知道为什么)
    var path = $("#path").val();
    //点击时更换验证码，其中的？num是随便添加的一个参数,为了让程序知道每次都是不一样的,才能更新
    // Math.random()是实现随机的一个方法
    YZM.src=path+"/coach/CheckCodeServlet?num="+Math.random()+1;

}