<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/11
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
	<meta charset="utf-8">
	<title>驾校申请</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>
<form class="layui-form" action="">
	<div class="layui-form-item">
		<label class="layui-form-label">驾校账号</label>
		<div class="layui-input-block">
			<input type="text" name="title" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
		</div>
	</div>

	<div class="layui-form-item layui-form-text">
		<label class="layui-form-label">封面图</label>
		<div class="layui-input-block" id="test1" style="border: 1px solid #9F9F9F;">
			<div class="layui-upload-list">
				<img class="layui-upload-img" id="demo1">
			</div>
		</div>
		<input type="hidden" name="lImage" value="" >
	</div>

	//dfasfa
	<div class="layui-form-item layui-form-text">
		<label class="layui-form-label">附加图片</label>
		<div class="layui-input-block" id="test2">
			<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
				预览图(可上传多张)：
				<div class="layui-upload-list" id="demo2"></div>
			</blockquote>
		</div>
	</div>


	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
			<button type="reset" class="layui-btn layu54i-btn-primary">重置</button>
		</div>
	</div>
</form>
</body>

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

	//Demo
	layui.use(['form','jquery'], function(){
		var form = layui.form,
			$=layui.jquery;


		//监听提交
		form.on('submit(formDemo)', function(data){

			console.log(data.field);

			var notice=JSON.stringify(data.field);

			$.ajax({
				//相应路劲
				url:"${pageContext.request.contextPath}/TM/updateNotice",
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
					layer.alert("修改成功",{icon:6},function (index) {
						//回调
						layer.close(layer.index);
						parent.location.reload(); // 父页面刷新
					});

				},
				//返回失败消息
				error:function () {
				}
			});

			return false;
		});
	});
</script>

<script type="text/javascript" data-th-inline="javascript">
	layui.use(['form', 'layedit', 'upload'], function() {
		var form = layui.form
			, layer = layui.layer
			, laydate = layui.laydate
			, $ = layui.jquery
			, upload = layui.upload;

		//普通图片上传
		var uploadInst = upload.render({
			elem: '#test1'
			,url: '/invitation/upload_one/'
			,before: function(obj){
				//预读本地文件示例，不支持ie8
				obj.preview(function(res, file, result){
					$('#demo1').attr('src', result); //图片链接（base64）
				});
			}
			,done: function(res){
				//如果上传失败
				if(res.code == 200){
					return layer.msg('上传失败');
				}
				// 将数据放到input框中
				$("input[name='lImage']").val(res.extend.msg);
			}
		});

		//多图片上传 （其实也是一个单文件上传）
		upload.render({
			elem: '#test2'
			,url: '/invitation/upload_one/'
			,multiple: true
			,before: function(obj){
				//预读本地文件示例，不支持ie8
				obj.preview(function(index, file, result){
					$('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
				});
			}
			,done: function(res){
				//上传完毕
				console.log(res);
				$("#demo2").append('<input type="hidden" name="add_pic" value="'+ res.extend.msg +'"/>');
			}
		});

	})
</script>


</html>
