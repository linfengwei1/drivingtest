<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!-- saved from url=(0033)http://47.96.140.98:20041/inquire -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>信息查询</title>
<%--    <link rel="stylesheet" href="./信息查询_files/layui.css" media="all">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/homepage/css/layui.css" media="all">
<%--    <link rel="stylesheet" href="./信息查询_files/common.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/homepage/css/common.css">
    <link rel="shortcut icon" type="image/x-icon" href="http://47.96.140.98:20041/static/img/logo_favicon.ico">
    <script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>

<%--    <script src="${pageContext.request.contextPath}/static/homepage/js/query.js" type="text/javascript" charset="UTF-8"></script>--%>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/homepage/css/inquire.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/homepage/css/starScore.css">
    <link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath}/static/homepage/css/layer.css" media="all"></head>
<body style="background: #fafbfd;">
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<div class="login-inf">
    <div class="inf-box">
        <div class="inf-time">
            欢迎您！
        </div>
        <div class="inf-login">
            <a target="_blank" href="${pageContext.request.contextPath}/link/path/Welcome">首页</a> |
            <a target="_blank" href="${pageContext.request.contextPath}/TM/login">驾培机构登录</a> |
            <a target="_blank" href="${pageContext.request.contextPath}/school/path/SchoolLogin">学校登录</a> |
            <a target="_blank" href="${pageContext.request.contextPath}/coach/path/CoachLogin">教练登录</a> |
            <a target="_blank" href="${pageContext.request.contextPath}/student/path/StudentLogin">学员登录</a> |
        </div>
    </div>
</div>

<div class="main">
    <div class="layui-tab">
        <span class="inq-inf"><img src="${pageContext.request.contextPath}/static/homepage/images/inquires.png">信息查询</span>
        <div id="tab-item-parent" class="layui-tab-content" style="margin-left: 165px;">
            <div class="layui-tab-item layui-show">
                <div class="inq-con">
                    <span class="title-con">查询条件</span>
                    <div class="title-num">共<span id="schNum">5</span>所符合条件的驾培机构</div>
                </div>
                <div class="top-search">
                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">驾校</label>
                            <div class="layui-input-inline">
                                <input type="text" id="selectName"  placeholder="请输入驾校名字"  class="layui-input">
                            </div>
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-inline">
                                <input type="text" id="addr"  placeholder="请输入驾校地址"  class="layui-input">
                            </div>
                            <button type="button" class="layui-btn">搜索</button>

                        </div>
                    </form>
                </div>
                <hr>
                <div class="inq-school">
                    <ul id="schoolList">

                    </ul>
                    <hr>
                    <div id="test1"></div>
                </div>
            </div>


        </div>
    </div>
</div>
<script>
    layui.use(['form', 'laypage','layer'], function(){
        var form = layui.form;
        var laypage = layui.laypage;
        var layer = layui.layer;
        var count;
        getPage(1,laypage);
        //执行一个laypage实例

        $(".layui-btn").on("click",function () {
            getPage(1,laypage);
        });
    });

    function getPage(curr,laypage) {
        var path = $("#path").val();
        var shcoolName = $("#selectName").val();
        var addr = $("#addr").val();
        $("#schoolList").empty();
        $.ajax({
            url:path+'/link/getSchoolInfoByPage',
            type:'post',
            data: {curr:curr,shcoolName:shcoolName,addr:addr},
            dateType:"json",
            success:function(msg){
                console.log(msg.list);
                data = msg.list;
                count = msg.count;
                if(msg == null || msg.count == 0)
                {
                    layer.msg('暂无符合条件的驾校');
                    return;
                }
                for (var i= 0; i <data.length; i++)
                {

                    $("#schoolList").append("<li class=\"list-school\"><a href=\"\"><img src=\"${pageContext.request.contextPath}/static/images/messageselect/sch6.jpg\"></a><div class=\"inf-school\"><a href=\"\"><p class=\"word-1\" title=\"\">"+data[i].schoolName+"</p></a><p><span>教练员数："+data[i].coaches.length+"人</span></p><p><span>教练车数："+data[i].coachCars.length+"辆</span></p><p><span>学员数："+data[i].students.length+"人</span></p><p title=\"）\">地址："+data[i].addr+"</p></div></li>");
                }

                $("#schNum").text(count);
                if(curr == 1)
                {
                    laypage.render({
                        elem: 'test1'
                        ,count: count //数据总数，从服务端得到
                        ,limit:6
                        ,jump: function(obj, first){
                            console.log('第'+first);
                            if (!first) {
                                page=obj.curr;
                                getPage(page,laypage);

                            }
                        }
                    });
                }

            },error:function (err) {

            }
        });

    }
</script>
</body>
</html>