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
//Demo
layui.use(['form','upload'], function() {
    var form = layui.form;
    var $ = layui.jquery
        , upload = layui.upload;

    var path = $("#path").val();

    //普通图片上传
    var uploadInst = upload.render({
        elem: '#test1'
        , url: path + '/link/linkImage/'
        , accept: 'images'
        // , auto: false//是否自动上传
        , size: 50000
        // , bindAction: '#OK'
        , before: function (obj) {

            this.data = {//要传递的数据
                id: $("#id").val(),
            }
            obj.preview(function (index, file, result) {

                $('#demo1').attr('src', result);
            });
        }
        , done: function (res) {
            //如果上传失败
            if (res.code > 0) {
                return layer.msg('上传失败');
            }
            //上传成功
            var demoText = $('#demoText');
            demoText.html('<span style="color: #4cae4c;">上传成功</span>');
            var fileupload = $(".image");
            fileupload.attr("value", res.data.src);
            console.log(fileupload.attr("value"));
        }
        , error: function () {
            //演示失败状态，并实现重传
            var demoText = $('#demoText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function () {
                uploadInst.upload();
            });
        }
    });
});