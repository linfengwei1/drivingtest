<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/8
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>公告管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<form class="layui-form" action=""  >
    <div class="layui-form-item">
        <label class="layui-form-label">标题：</label>
        <div class="layui-input-inline">
            <input type="text"  id="title" name="question" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" value="${userName}">
        </div>

        <label class="layui-form-label">日期：</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="date1">
        </div>

        <label class="layui-form-label">公告类型：</label>
        <div class="layui-input-inline">
            <select name="interest" lay-filter="aihao" id="type">
                <option value=""  selected=""></option>
            </select>
        </div>

        <button class="layui-btn" id="button" lay-submit="" lay-filter="formDemo" data-type="reload" >查询</button>

    </div>

</form>

<%--<bottom class="layui-btn" onclick="test1()">弹出层</bottom>--%>
<a onclick="func7();" class="layui-btn layui-inline fl w130">添加</a>

<table id="demo" lay-filter="test"></table>

</body>
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    onload= layui.use(['form', 'layer', 'layedit'], function () {
        $ = layui.jquery;
        var form = layui.form;
        var layer = layui.layer;
        var layedit = layui.layedit;
        //3.页面打开时异步加载数据
        $(function () {
            $.ajax({
                //提交数据的类型 POST GET
                type: "POST",
                //提交的网址
                url: "${pageContext.request.contextPath}/TM/getNoticeType",
                //提交的数据
                //返回数据的格式
                datatype: "text",//“xml”, “html”, “script”, “json”, “jsonp”, “text”.
                //成功返回之后调用的函数
                success: function (data) {
                    console.log($.parseJSON(data));
                    $.each($.parseJSON(data), function (index, item) {
                        $('#type').append(new Option(item.type, item.type));// 下拉菜单里添加元素
                    });
                    layui.form.render("select");
                }, error: function () {
                    alert("查询失败！！！")
                }
            });
        });
    });

    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#date1' //指定元素
        });
    });

    layui.use(['table','laydate','form','jquery'], function(){
        var table = layui.table,
            laydate=layui.laydate,
            form=layui.form,
            $=layui.jquery;
        //表格实例
        table.render({
            elem: '#demo'
            ,height: 500
            ,id:'testReload'
            ,url: '${pageContext.request.contextPath}/TM/getNotice' //数据接口
            ,page: true //开启分页
            ,limit:10
            ,cols: [[ //表头
                {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                ,{field: 'title', title: '标题', width:400}
                ,{field: 'date', title: '发布时间', templet: "<div>{{layui.util.toDateString(d.time, 'yyyy-MM-dd HH:mm:ss')}}</div>",width:150}
                ,{field: 'type', title: '公告类型', width:150}
                ,{fixed: 'right', width:300, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]]
        });


        //阻止表单提交
        form.on('submit(formDemo)', function(data){
            return false;//阻止表单跳转
        });

        //表格数据重载
        $('#button').on('click',function () {
            var type=$(this).data('type');
            if(type == 'reload'){
                console.log("biaogechognzai");
                table.reload('testReload',{
                    page:{
                        curr:1
                    }
                    ,where:{
		                title:$("#title").val(),
		                date:$("#date1").val(),
		                type:$("#type").val()
                    }
                });
            }

        });


        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
	        console.log(data);
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
	        console.log(layEvent);
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if(layEvent === 'detail'){ //查看
            	console.log("点击了查看");
                //do somehing
	            console.log(data);

	            var notice=JSON.stringify(data);

	            $.ajax({
		            //相应路劲
		            url:"${pageContext.request.contextPath}/TM/getNoticeMsg",
		            //是否异步提交
		            async:true,
		            //请求类型
		            type:"post",
		            //数据名
		            data:{"notice":notice},
		            //数据类型:文本
		            datatype:"text",
		            //返回成功消息
		            success:function (msg) {
			            layer.open({
				            type: 2,
				            title: '查看',
				            shadeClose: true,
				            shade: 0.8,
				            area: ['700px', '500px'],
				            content: "${pageContext.request.contextPath}/TM/path/InspectNoticeMsg",
				            yes: function (index, layero) {

				            }
			            });
		            },
		            //返回失败消息
		            error:function () {
		            }
	            });

            } else if(layEvent === 'del'){ //删除
            	// console.log("点击了删除按钮");
                layer.confirm('确定删除数据?', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);

                    var notice=JSON.stringify(data);

                    //向服务端发送删除指令
                    $.ajax({
                        //相应路劲
                        url:"${pageContext.request.contextPath}/TM/deleteNotice",
                        //是否异步提交
                        async:true,
                        //请求类型
                        type:"post",
                        //数据名
                        data:{"notice":notice},
                        //数据类型:文本
                        datatype:"text",
                        //返回成功消息
                        success:function (msg) {
                        	console.log(msg);
                            layer.alert("删除成功",{icon:6});
                        },
                        //返回失败消息
                        error:function () {
                        }
                    });

                });
            } else if(layEvent === 'edit'){ //编辑
            	// console.log("点击了编辑");

                // do something
                console.log(data);

                var notice=JSON.stringify(data);

                $.ajax({
                    //相应路劲
                    url:"${pageContext.request.contextPath}/TM/getNoticeMsg",
                    //是否异步提交
                    async:true,
                    //请求类型
                    type:"post",
                    //数据名
                    data:{"notice":notice},
                    //数据类型:文本
                    datatype:"text",
                    //返回成功消息
                    success:function (msg) {
                        layer.open({
                            type: 2,
                            title: '修改',
                            shadeClose: true,
                            shade: 0.8,
                            area: ['700px', '500px'],
                            content: "${pageContext.request.contextPath}/TM/path/ModifyNoticeMsg",
                            yes: function (index, layero) {

                            }
                        });
                    },
                    //返回失败消息
                    error:function () {
                    }
                });
            }
        });

    });

    layui.use('layer', function(){
	    var layer = layui.layer;

	    layer.msg('hello');
    });

</script>

<script type="text/javascript">
	<%--function test1(){--%>
	<%--	console.log("click");--%>
	<%--	layui.use(['layer','jquery'], function(){--%>
	<%--		var layer = layui.layer;--%>
	<%--		$=layui.jquery;--%>
	<%--		$.ajax({--%>
	<%--			url: "${pageContext.request.contextPath}/TM/saveNotice",--%>
	<%--			type: 'POST',--%>
	<%--			data: {"notice":notice},--%>
	<%--			dataType : "html",--%>
	<%--			success: function (result) {--%>
	<%--				layer.open({--%>
	<%--					title: '添加通告',--%>
	<%--					type: 2,--%>
	<%--					area: ["1000px","500px"],--%>
	<%--					// btn: ['确定', '取消'],--%>
	<%--					content: "${pageContext.request.contextPath}/TM/path/InsertNotice"--%>
	<%--				});--%>
	<%--			}--%>
	<%--		});--%>

	<%--	});--%>
	<%--}--%>

	function func7() {
		console.log("click");
		//页面层

		layer.open({
			type: 2,
			title: 'layer mobile页',
			shadeClose: true,
			shade: 0.8,
			area: ['1000px', '500px'], //宽高
			content: "${pageContext.request.contextPath}/TM/path/InsertNotice"  //调到新增页面,iframe的url
		});
	}
</script>

</html>
