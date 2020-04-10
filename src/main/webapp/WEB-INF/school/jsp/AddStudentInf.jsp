<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-4-9
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>文件导入学员信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
</head>
<style>

</style>
<body>

<form action="${pageContext.request.contextPath}/school/ImportExcel" method="post" enctype="multipart/form-data">
   <div align="center">
       <h1>文件上传</h1>
       <p>支持上传的文档格式为：.xmlx</p>
       <div style="margin-top: 1%">
           <input type="file" name="file"></Br>
           <button type="submit"  class="layui-btn layui-btn-normal" id="out"><i class="layui-icon">&#xe67c;</i>导入</button>
<%--               <p><input class="layui-input" type="submit" value="提交1"></p>--%>
       </div>





   </div>

</form>
</body>
</html>
