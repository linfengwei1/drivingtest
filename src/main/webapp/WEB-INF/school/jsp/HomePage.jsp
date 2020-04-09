<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-1-5
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>驾校后台管理系统</title>

    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/school/css/HomePage.css">
    <script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/json2.js"></script>
    <script src="${pageContext.request.contextPath}/static/school/js/HomePage.js"></script>
</head>
<body>
<form >
    <input type="hidden" id="path" value="<%=path%>">
    <div id="header_div">
        <h1 >驾校后台管理系统</h1>
        <a id="time1" ></a>
        <div><a href="<%=request.getContextPath()%>/school/deleteAdmin">退出</a>
            <a >
                <% String name = (String)session.getAttribute("name"); %>
                <% String roleType = (String)session.getAttribute("roleType"); %>
                欢迎<%=name %><%=roleType%>
            </a>
            <a href="">服务热线:123456</a>

        </div>
    </div>
    <div id="menu_div">
        <h3 class="h_mun">人员管理</h3>
        <ul class="ul_menu">
             <li><a href="javascript:void (0)"
                 title="${pageContext.request.contextPath}/school/path/SchoolCoachManage"
                 onclick="GoodsManager(this)">教练员管理</a>
             </li>
            <li><a href="javascript:void (0)"
                   title="${pageContext.request.contextPath}/school/path/SchoolAdminManage"
                   onclick="GoodsManager(this)">管理员管理</a>
            </li>
            <li><a href="javascript:void (0)"
                   title="${pageContext.request.contextPath}//school/path/SchoolStudentManage"
                   onclick="GoodsManager(this)">学员管理</a>
            </li>
        </ul>
        <h3 class="h_mun">教练车管理</h3>
        <ul class="ul_menu">
            <li><a href="javascript:void (0)"
                   title="${pageContext.request.contextPath}/${j.MURL}"
                   onclick="GoodsManager(this)">教练车信息</a>
            </li>
        </ul>
    </div>
    <div id="center_div" >
        <iframe src=" " id="iframe_div" style="border: 0" name="goods"></iframe>
    </div>
</form>



</body>
</html>
