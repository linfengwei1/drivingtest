<%--
  Created by IntelliJ IDEA.
  User: Mr.Fan
  Date: 2020-3-10
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>教练管理</title>
    <%String path = request.getContextPath(); %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/school/js/SchoolCoachManage.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" action=" " onsubmit="return false" >
    <div class="layadmin-user-login-box layadmin-user-login-header" style="background-color: #dadada">
        <h2 style="margin-left: 43%">教练管理</h2>
    </div>
    <div class="layui-fluid" id="searchTable" style="margin-top: 1%;">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <div style="padding-bottom: 10px;">
                <div class="layui-upload">
                    <div style="float: left;margin-left: 5%">
                        <label class="layui-form-label">状态</label>
                        <div class="layui-input-block" style="width: 190px;">
                            <select  name="state" id="state" >
                                <option value=""></option>
                                <option value="1">启用</option>
                                <option value="2">封停</option>
                                <option value="3">禁止报名</option>
                                <option value="4">驾校待审核</option>
                                <option value="5">信息不完整</option>
                                <option value="6">运管审核不通过</option>
                            </select>
                        </div>
                    </div>

                    <div style="float: left">
                        <label class="layui-form-label" >姓名</label>
                        <div class="layui-inline" style="width: 190px">
                            <input class="layui-input" name="name" id="name" autocomplete="off">
                        </div>
                    </div>
                    <div style="float: left">
                        <label class="layui-form-label" >联系方式</label>
                        <div class="layui-input-block" style="width: 190px">
                            <input class="layui-input" name="phone" id="phone" autocomplete="off">
                        </div>
                    </div>
                    <div style="float: left;margin-left: 5%">
                        <label class="layui-form-label" >身份证号码</label>
                        <div class="layui-input-block" style="width: 190px">
                            <input class="layui-input" name="idnumber" id="idnumber" autocomplete="off">
                        </div>
                    </div>
                    <div style="float: left;">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block" style="width: 190px;">
                            <select  name="state" id="sex">
                                <option value=""></option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div style="float: left;margin-left: 3% ">
                        <button class="layui-btn layui-btn-normal" data-type="reload" lay-submit="" lay-filter="formDemo"><i class="layui-icon">&#xe615;</i>搜索</button>
                        <button type="button"  class="layui-btn layui-btn-normal" id="add"><i class="layui-icon">&#xe654;</i>教练申请</button>
                        <button type="button"  class="layui-btn layui-btn-normal" id="out"><i class="layui-icon">&#xe654;</i>导出</button>
                        <button type="button"  class="layui-btn layui-btn-normal" id="in"><i class="layui-icon">&#xe654;</i>Excel导入</button>
                    </div>
                    </div>
            </div>
        </div>
    </div>

    <div class="layui-anim layui-anim-scale" style="clear: left">
        <table id="dataTable" lay-filter="test"></table>
    </div>
    <script type="text/html" id="butdiv">

        {{#  if(d.coach_state_id == '5'){ }}
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="update" ><i class="layui-icon">&#xe642;</i>更新</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="CoachMsg" ><i class="layui-icon">&#xe63c;</i>个人详情</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="AddCoachImage" ><i class="layui-icon">&#xe642;</i>上传图片</button>
        {{#  }if(d.coach_state_id <='3'){ }}
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="CoachMsg" ><i class="layui-icon">&#xe63c;</i>个人详情</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="update" ><i class="layui-icon">&#xe642;</i>更新</button>
        {{#  }if(d.coach_state_id == '4'){ }}
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="CoachMsg" ><i class="layui-icon">&#xe63c;</i>个人详情</button>
        {{# } if(d.coach_state_id == '6'){ }}
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="CoachMsg" ><i class="layui-icon">&#xe63c;</i>个人详情</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="delete" ><i class="layui-icon">&#xe640;</i>删除</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="update" ><i class="layui-icon">&#xe642;</i>更新</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="resubmit" ><i class="layui-icon">&#xe643;</i>重新审核</button>
        {{#  } }}
    </script>

</form>

</body>
</html>
