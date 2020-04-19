<%--
  Created by IntelliJ IDEA.
  User: junlong
  Date: 2019-11-16
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>文件上传</title>
	<%String path = request.getContextPath();%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">--%>
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/static/homepage/js/SchoolApple.js" type="text/javascript" charset="utf-8"></script>
</head>
<style>

	/*.layui-form {*/
	/*	margin-top: 5%;*/
	/*	margin-left: 30%;*/
	/*	padding: 2%;*/
	/*	width: 35%;*/
	/*	background-color: #dadada;*/

	/*}*/


</style>
<body>
<input type="hidden" id="path" value="<%=path%>">
<%--<div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">--%>
<%--	<div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>--%>
<%--</div>--%>
<%--<div class="layui-form" action="" lay-filter="example">--%>
<%--	<div class="layadmin-user-login-box layadmin-user-login-header">--%>
<%--		<h2>文件上传</h2>--%>
<%--	</div>--%>
<%--	<div class="layui-inline" style="width:500px;">--%>
<%--		<hr>--%>
<%--	</div>--%>
<%--	<div class="layadmin-user-login-box layadmin-user-login-header">--%>
<%--		<div class="layui-form-item">--%>
<%--			<label class="layui-form-label">文档标题：</label>--%>
<%--			<div class="layui-input-inline">--%>
<%--				<input type="text" name="title" id="hideBookName" required  lay-verify="title"  autocomplete="off"--%>
<%--				       class="layui-input"style="width: 300px" >--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="layui-form-item layui-form-text">--%>
<%--			<label class="layui-form-label">文件简介：</label>--%>
<%--			<div class="layui-input-block">--%>
<%--				<textarea name="intro" placeholder="请输入内容" id="intro" required  class="layui-textarea" style="width: 300px"></textarea>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="layadmin-user-login-box layadmin-user-login-header">--%>
<%--			<div class="layui-form-item">--%>
<%--				<label class="layui-form-label">下载积分：</label>--%>
<%--				<div class="layui-input-inline">--%>
<%--					<input type="text"  onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" name="downscore" id="downScore" required  lay-verify="title"  autocomplete="off"--%>
<%--					       class="layui-input"style="width: 300px" >--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="layui-form-item">--%>
<%--			<label class="layui-form-label">照片</label>--%>
<%--			<div class="layui-input-block">--%>
<%--				<button type="button" class="layui-btn" id="upload1">上传图片</button>--%>
<%--				<input type="hidden" id="img_url" name="img" value=""/>--%>
<%--				<div class="layui-upload-list">--%>
<%--					<img class="layui-upload-img" width="100px" height="80px" id="demo1"/>--%>
<%--					<p id="demoText"></p>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--	<div class="demoTable">--%>
<%--		<div style="padding-bottom: 10px;">--%>
<%--			<div class="layui-upload">--%>
<%--				<button type="button" class="layui-btn" id="test9" style="margin-left: 160px;">上传</button>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</div>--%>

<div class="layui-upload">
	<button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button>
	<div class="layui-upload-list">
		<table class="layui-table">
			<thead>
			<tr><th>文件名</th>
				<th>大小</th>
				<th>状态</th>
				<th>操作</th>
			</tr></thead>
			<tbody id="demoList"></tbody>
		</table>
	</div>
	<button type="button" class="layui-btn" id="testListAction">开始上传</button>
</div>

<script>
	layui.use('upload', function(){
		var $ = layui.jquery
			,upload = layui.upload;

		//多文件列表示例
		var demoListView = $('#demoList')
			,uploadListIns = upload.render({
			elem: '#testList'
			,url: '${pageContext.request.contextPath}/link/fileUpload'
			,accept: 'file'
			,multiple: true
			,auto: false
			,bindAction: '#testListAction'
			,choose: function(obj){
				var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
				//读取本地文件
				obj.preview(function(index, file, result){
					var tr = $(['<tr id="upload-'+ index +'">'
						,'<td>'+ file.name +'</td>'
						,'<td>'+ (file.size/1024).toFixed(1) +'kb</td>'
						,'<td>等待上传</td>'
						,'<td>'
						,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
						,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
						,'</td>'
						,'</tr>'].join(''));

					//单个重传
					tr.find('.demo-reload').on('click', function(){
						obj.upload(index, file);
					});

					//删除
					tr.find('.demo-delete').on('click', function(){
						delete files[index]; //删除对应的文件
						tr.remove();
						uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
					});

					demoListView.append(tr);
				});
			}
			,done: function(res, index, upload){
				if(res.files.file){ //上传成功
					var tr = demoListView.find('tr#upload-'+ index)
						,tds = tr.children();
					tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
					tds.eq(3).html(''); //清空操作
					return delete this.files[index]; //删除文件队列已经上传成功的文件
				}
				this.error(index, upload);
			}
			,error: function(index, upload){
				var tr = demoListView.find('tr#upload-'+ index)
					,tds = tr.children();
				tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
				tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
			}
		});


	});
</script>

</body>
</html>