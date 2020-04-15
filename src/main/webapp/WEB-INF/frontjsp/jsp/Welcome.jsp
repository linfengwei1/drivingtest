<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-1-5
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%String path=request.getContextPath(); %>
<link rel="stylesheet" href="../layui/css/layui.css">
<script src="../layui/layui.js"></script>
<script src="../layui/jquery-3.4.1.js"></script>
<script src="../layui/json2.js"></script>
<script src="../layui/js/login.js"></script>
<html>
<head>
    <title>哈哈哈</title>
</head>
<body>
<div id="header" style="background-color: white;width: 100%;height: 10%">
    <div style="font-size: 30px">驾校管理系统</div>
</div>

<div class="layui-carousel" id="test1">
    <div carousel-item>
        <div><img src="../static/layui/image/1.jpg" /></div>
        <div><img src="../static/layui/image/2.jpg" /></div>
        <div><img src="../static/layui/image/3.jpg" /></div>
    </div>
</div>

<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this" style="left: 360px;font-size: 20px">首页</li>
        <li style="left: 380px;font-size: 20px">公开公示</li>
        <li style="left: 400px;font-size: 20px">信息查询</li>
        <li style="left: 420px;font-size: 20px">开通服务</li>
        <li style="left: 440px;font-size: 20px">登录</li>
    </ul>
    <div class="layui-tab-content" style="width: 100%;height: 300px">
        <div class="layui-tab-item layui-show">
            <table style="margin: 0px;padding: 0px;width: 100%;height: 100%">
                <td style="margin: 0px;padding: 0px;">
                    <div class="layui-carousel" id="test2" style="left: 250px">
                        <div carousel-item>
                            <div><img src="../static/layui/image/1.jpg" /></div>
                            <div><img src="../static/layui/image/2.jpg" /></div>
                            <div><img src="../static/layui/image/3.jpg" /></div>
                        </div>
                    </div>
                </td>
                <td style="margin: 0px;padding: 0px;">
                    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                        <ul class="layui-tab-title" style="top: -120px">
                            <li class="layui-this">首页</li>
                            <li>公开公示</li>
                            <li>信息查询</li>
                            <li>开通服务</li>
                            <li>登录</li>
                        </ul>
                    </div>
                </td>
            </table>
        </div>







        <div class="layui-tab-item">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="">默认展开</a>
                </li>
                <li class="layui-nav-item">
                    <a href="">解决方案</a>
                </li>
                <li class="layui-nav-item">
                    <a href="">产品</a>
                </li>
                <li class="layui-nav-item">
                    <a href="">大数据</a>
                </li>
            </ul>
        </div>
        <div class="layui-tab-item">内容3</div>
        <div class="layui-tab-item">内容4</div>
        <div class="layui-tab-item">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="">运管人员</a>
                </li>
                <li class="layui-nav-item">
                    <a href="">驾校人员</a>
                </li>
                <li class="layui-nav-item">
                    <a href="">教练</a>
                </li>
                <li class="layui-nav-item">
                    <a href="">学员</a>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="footer">
    <div class="footer-box">
        <p class="footer-p">友情链接</p>
        <div class="footer-friend">
            <a target="_blank" href="http://www.mot.gov.cn/"><img class="footer-img" src="main/webapp/image/traffic.jpg"/></a>
            <a target="_blank" href="https://www.cttic.cn/"><img class="footer-img" src="main/webapp/image/traffic_center.jpg" /></a>
            <a target="_blank" href="http://www.122.gov.cn"><img class="footer-img" src="main/webapp/image/traffic_safety.jpg" /></a>
            <a target="_blank" href="http://www.crta.org.cn/"><img class="footer-imgs" src="main/webapp/image/crta.jpg"/></a>
        </div>
        <p class="footer-p">导航链接</p>
        <ul class="footer-orther" style="">
            <li><a target="_blank" href="http://www.jpxcw.com/">全国驾驶培训公共服务平台</a></li>
            <li><a target="_blank"  href="http://www.bjmcn.com">交通运输通信信息集团有限公司</a></li>
        </ul>
    </div>

</div>

<%--<script LANGUAGE=javascript>--%>
<%--    function rewlink(){--%>
<%--        if((refform.linkname.value == "")||(refform.linkurl.value == "")){--%>
<%--            alert("关键字不能为空，")--%>
<%--        }else{--%>
<%--            if(refform.linkurl.value.substring(0,7).toLowerCase() == 'http://'){--%>
<%--                return true;--%>
<%--            }else{--%>
<%--                alert("必须带http://");--%>
<%--                return false;--%>
<%--            }--%>
<%--        }--%>
<%--        return false;--%>
<%--    }--%>
<%--</script>--%>
<%--<div id="main">--%>
<%--    <div id="inmain">--%>
<%--        <div id="main_head">当前位置:<strong>后台首页</strong> >； <strong>其它信息管理e5a48de588b6e799bee5baa631333337393632</strong> >； <strong>友情链接管理</strong></div>--%>
<%--        <div id="main_text">--%>
<%--            <form name="refform" action="../admin/LinkServlet？method=rewLink&link_id=${rew.link_id }" method="post" onSubmit="return rewlink();">--%>
<%--                <input name="link_id" type="hidden" value="${rew.link_id }"/>--%>
<%--                <div class="main_table">--%>
<%--                    <dl>--%>
<%--                        <dt>修改友情链接</dt>--%>
<%--                        <dd class="table_style">--%>
<%--                            <ul>--%>
<%--                                <li style="width:150px;">描述</li>--%>
<%--                                <li style="width:200px;"><input name="linkname" value="${rew.link_name }" type="text" class="border" /></li>--%>
<%--                                <li></li>--%>
<%--                            </ul>--%>
<%--                        </dd>--%>
<%--                        <dd class="table_style">--%>
<%--                            <ul>--%>
<%--                                <li style="width:150px;">链接地址</li>--%>
<%--                                <li style="width:200px;"><input type="text" name="linkurl" value="${rew.link_url }" class="border" /></li>--%>
<%--                                <li><span>[ 需要添加 “http://” ]</span></li>--%>
<%--                            </ul>--%>
<%--                        </dd>--%>
<%--                        <dd class="table_handle">--%>
<%--                            <ul>--%>
<%--                                <li style="width:83px;">--%>
<%--                                    <input type="submit" value="修改" class="bt" />--%>
<%--                                </li>--%>
<%--                                <li style="width:50px;">--%>
<%--                                    <input type="reset" value="重置" class="bt" />--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </dd>--%>
<%--                    </dl>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<div class="layui-header">--%>
<%--	<ul class="layui-nav layui-bg-blue" lay-filter="">--%>
<%--	<li class="layui-nav-item"><a href="">首页</a></li>--%>
<%--	<li class="layui-nav-item">--%>
<%--		<a href="javascript:;">公开公示</a>--%>
<%--		<dl class="layui-nav-child">--%>
<%--			<dd><a href="">通知公告</a></dd>--%>
<%--			<dd><a href="">行业动态</a></dd>--%>
<%--			<dd><a href="">政策法规</a></dd>--%>
<%--			<dd><a href="">曝光台</a></dd>--%>
<%--		</dl>--%>
<%--	</li>--%>
<%--	<li class="layui-nav-item">--%>
<%--		<a href="javascript:;">信息查询</a>--%>
<%--		<dl class="layui-nav-child">--%>
<%--			<dd><a href="">培训机构查询</a></dd>--%>
<%--		</dl>--%>
<%--	</li>--%>
<%--	<li class="layui-nav-item">--%>
<%--		<a href="javascript:;">开通服务</a>--%>
<%--		<dl class="layui-nav-child">--%>
<%--			<dd><a href="">学员注册</a></dd>--%>
<%--			<dd><a href="">驾校开通申请</a></dd>--%>
<%--		</dl>--%>
<%--	</li>--%>
<%--	<li class="layui-nav-item">--%>
<%--		<a href="javascript:;">登录</a>--%>
<%--		<dl class="layui-nav-child">--%>
<%--			<dd><a href="">运管人员</a></dd>--%>
<%--			<dd><a href="">驾校人员</a></dd>--%>
<%--			<dd><a href="">教练</a></dd>--%>
<%--			<dd><a href="">学员</a></dd>--%>
<%--		</dl>--%>
<%--	</li>--%>
<%--</ul>--%>
<%--</div>--%>


<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });


</script>



</body>
</html>

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>友情链接_编辑修改</title>--%>
<%--    <link href="main.css" rel="stylesheet" type="text/css" />--%>
<%--</head>--%>
<%--<body>--%>
<%--&lt;%&ndash;<script LANGUAGE=javascript>&ndash;%&gt;--%>
<%--&lt;%&ndash;    function rewlink(){&ndash;%&gt;--%>
<%--&lt;%&ndash;        if((refform.linkname.value == "")||(refform.linkurl.value == "")){&ndash;%&gt;--%>
<%--&lt;%&ndash;            alert("关键字不能为空，")&ndash;%&gt;--%>
<%--&lt;%&ndash;        }else{&ndash;%&gt;--%>
<%--&lt;%&ndash;            if(refform.linkurl.value.substring(0,7).toLowerCase() == 'http://'){&ndash;%&gt;--%>
<%--&lt;%&ndash;                return true;&ndash;%&gt;--%>
<%--&lt;%&ndash;            }else{&ndash;%&gt;--%>
<%--&lt;%&ndash;                alert("必须带http://");&ndash;%&gt;--%>
<%--&lt;%&ndash;                return false;&ndash;%&gt;--%>
<%--&lt;%&ndash;            }&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;        return false;&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>
<%--&lt;%&ndash;</script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<div id="main">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div id="inmain">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div id="main_head">当前位置:<strong>后台首页</strong> >； <strong>其它信息管理e5a48de588b6e799bee5baa631333337393632</strong> >； <strong>友情链接管理</strong></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div id="main_text">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <form name="refform" action="../admin/LinkServlet？method=rewLink&link_id=${rew.link_id }" method="post" onSubmit="return rewlink();">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input name="link_id" type="hidden" value="${rew.link_id }"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="main_table">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <dl>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <dt>修改友情链接</dt>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <dd class="table_style">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <ul>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <li style="width:150px;">描述</li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <li style="width:200px;"><input name="linkname" value="${rew.link_name }" type="text" class="border" /></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <li></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </ul>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </dd>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <dd class="table_style">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <ul>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <li style="width:150px;">链接地址</li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <li style="width:200px;"><input type="text" name="linkurl" value="${rew.link_url }" class="border" /></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <li><span>[ 需要添加 “http://” ]</span></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </ul>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </dd>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <dd class="table_handle">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <ul>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <li style="width:83px;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <input type="submit" value="修改" class="bt" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <li style="width:50px;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <input type="reset" value="重置" class="bt" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </ul>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </dd>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </dl>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </form>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--</body>--%>
<%--</html>--%>
