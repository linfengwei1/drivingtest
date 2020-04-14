layui.use('form', function(){
    var form = layui.form;
    var $ = layui.$;
    var path = $("#path").val();
    //监听提交
    form.on('submit(formDemoUpdate)', function(data){
        var path = $("#path").val();
        // var a =JSON.stringify(data.field)
        // var linkId = $("#linkId").val();
        // var linkName = $("#linkName").val();
        // var linkUrl = $("#linkUrl").val();
        // var linkSort = $("#linkSort").val();
        $.ajax({//发起异步请求
            url: path + "/link/updateLink",//controller层接口地址，数据要提交的地址
            async: true,
            type: "POST",
            data:  data.field,
            // data:"a="+a,
            // data: {"linkId": linkId,"linkName": linkName,"linkUrl": linkUrl,"linkSort": linkSort},
            datatype: "text",
            beforeSend:function () {//提交之前验证：非空验证、规则验证等


            },
            success: function (msg) {
                if (msg == "success") {
                    layer.alert("修改成功",{icon:6},function () {
                        window.parent.location.reload();
                    });
                }else {
                    layer.alert("修改失败",{icon:2})
                }
            },
            error: function () {
                layer.alert("网络繁忙！")
            }
        });
        return false;
    });
});