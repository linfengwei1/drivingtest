<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/19
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>预约列表</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
</head>
<body style="height: 100%;">
<div class="layui-container">

	<h1 style="margin-left: 40%;">文件上传</h1>


	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
	</fieldset>



	<form class="layui-form" action="" lay-filter="example" enctype="multipart/form-data">
<%--	<form action="/ssm/file/imgUpload" enctype="multipart/form-data" method="post">--%>
		<div class="layadmin-user-login-box layadmin-user-login-header">
			<h2>新增图片</h2>
		</div>
		<div class="layui-inline" style="width:500px;">
			<hr>
		</div>
		<div class="layadmin-user-login-box layadmin-user-login-header">
			<div class="layui-form-item">
				<label class="layui-form-label">新增的书名：</label>
				<div class="layui-input-inline">
					<input type="text" name="documentScore" id="hideBookName" lay-verify="title" autocomplete="off"
					       class="layui-input"style="width: 300px" >
				</div>
			</div>

			<div style="padding-bottom: 10px;">

				<div class="layui-upload">
					<button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">内容信息：</label>
				<div class="layui-input-inline">
					<input type="text" name="documentScore" id="pageContent" lay-verify="title" autocomplete="off"
					       placeholder="请输入绘本信息"
					       class="layui-input" style="width: 300px;height: 120px">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">新页数：</label>
				<div class="layui-input-inline">
					<input type="text" name="documentScore" id="pageNum" lay-verify="title" autocomplete="off"

					       class="layui-input"style="width: 300px">
				</div>
			</div>

			<div class="demoTable">
				<div style="padding-bottom: 10px;">
					<div class="layui-upload">
						<button type="button" class="layui-btn" id="test9">保存</button>
					</div>
				</div>
			</div>
		</div>
	</form>


	<script>
		layui.use(['upload','jquery','layer'], function(){
			var upload = layui.upload,
				$=layui.jquery;
			var layer = layui.layer;
			//执行实例
			var uploadInst = upload.render({
				elem: '#test8' //绑定元素
				,url: '${pageContext.request.contextPath}/user/upload' //上传接口
				,auto: false
				,accept: 'file'
				,bindAction: '#test9'
				,before: function(obj){
					this.data = {
						bookName: $("#hideBookName").val(),
						pageContent: $("#pageContent").val(),
						pageNum: $("#pageNum").val()
					}
				}
				,done: function(res){
					//上传完毕回调
					if(res.code == 0){
						layer.msg("上传成功");
					}else
					{
						layer.msg("上传失败");
					}
				}
				,error: function(){
					//请求异常回调
					alert("上传失败！");
				}
			});
		});


	</script>

</div>
<input type="hidden" id="path" value="${pageContext.request.contextPath}">

</body>
</html>
