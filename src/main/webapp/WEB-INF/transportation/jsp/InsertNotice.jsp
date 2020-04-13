<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/11
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>

<html>
<head>
	<title>Title</title>
</head>
<body>
	<form class="layui-form" id="add-form"  action="">
		<div class="layui-form-item center" >
			<label class="layui-form-label" style="width: 100px" >标题</label>
			<div class="layui-input-inline">
				<input type="text" name="title" required value="" style="width: 240px"  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">公告内容</label>
			<div class="layui-input-block">
				<textarea name="content" placeholder="请输入内容" class="layui-textarea"></textarea>
			</div>
		</div>

		<label class="layui-form-label">公告类型：</label>
		<div class="layui-input-inline">
			<select name="interest" lay-filter="aihao" id="addtype">
				<option value=""  selected=""></option>
				<option value="全员通知">全员通知</option>
				<option value="驾校通知">驾校通知</option>
			</select>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="save" >立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary" id="closeBtn" >重置</button>
			</div>
		</div>
	</form>
</body>
<script>
	//Demo
	layui.use(['form','jquery'], function(){
		var form = layui.form,
			$=layui.jquery;


		//监听提交
		form.on('submit(formDemo)', function(data){

			var notice=JSON.stringify(data.field);
			console.log(notice);
			$.ajax({
				//相应路劲
				url:"${pageContext.request.contextPath}/TM/saveNotice",
				//是否异步提交
				async:true,
				//请求类型
				type:"post",
				//数据名
				data:data.field,
				//数据类型:文本
				// datatype:"text",
				//返回成功消息
				success:function (msg) {
					layer.alert("新增成功",{icon:6},function (index) {
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

</html>
