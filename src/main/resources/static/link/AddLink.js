layui.use('form', function(){
    var form = layui.form;
    var $ = layui.$;
    var path = $("#path").val();
    //监听提交
    form.on('submit(formDemo)', function(data){
        var path = $("#path").val();
        // var a =JSON.stringify(data.field)
        $.ajax({
            url: path + "/link/addLink",
            async: true,
            type: "POST",
            data:  data.field,
            // data:"a="+a,
            datatype: "text",
            beforeSend:function () {
               

            },
            success: function (msg) {
                if (msg == "success") {
                    layer.alert("新增成功",{icon:6},function () {
                        window.parent.location.reload();
                    });
                }else {
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