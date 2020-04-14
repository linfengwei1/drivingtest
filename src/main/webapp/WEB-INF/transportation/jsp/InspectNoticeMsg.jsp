<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/11
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="utf-8">
	<title>修改通告</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>

	<div class="layui-form-item">
		<label class="layui-form-label">标题：</label>
		<div class="layui-input-inline">
			<input type="hidden" name="id" value="${noticemsg.id}" class="layui-input">
			<input type="text" name="title" value="${noticemsg.title}"  required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item layui-form-text">
		<label class="layui-form-label">内容</label>
		<div class="layui-input-block">
			<textarea name="content" placeholder="请输入内容" class="layui-textarea" >${noticemsg.content}</textarea>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">发布时间</label>
		<div class="layui-input-inline">
			<p style="font-size: 25px"> <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${noticemsg.time}" /></p>
<%--			<input type="text" name="time" value="${noticemsg.time}"  required  lay-verify="required" placeholder="请输入类型" autocomplete="off" class="layui-input">--%>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">公告类型</label>
		<div class="layui-input-inline">
			<input type="text" name="type" value="${noticemsg.type}"  required  lay-verify="required" placeholder="请输入类型" autocomplete="off" class="layui-input">
		</div>
	</div>

<%--	<div class="layui-form-item">--%>
<%--		<div class="layui-input-block">--%>
<%--			<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>--%>
<%--			<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
<%--		</div>--%>
<%--	</div>--%>

</body>

<script>


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
</html>
