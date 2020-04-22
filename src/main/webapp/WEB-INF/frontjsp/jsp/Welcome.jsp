<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-1-5
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%String path=request.getContextPath(); %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/homepage/css/homepage.css">--%>
<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/static/echarts.js" type="text/javascript" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/static/homepage/js/homepage.js" type="text/javascript" charset="utf-8"></script>
<html>
<head>
    <title>机动车驾驶员计时培训系统</title>
</head>
<body>
<div id="header" style="background-color: white;width: 100%;height: 10%">
    <div style="font-size: 30px">驾校管理系统</div>
</div>

<div class="layui-carousel" id="test1">
    <div carousel-item style="text-align :center">
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/home_logo2.jpg" /></div>
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage2.png" /></div>
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage3.jpg" /></div>
    </div>
</div>

<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this" style="left: 160px;font-size: 20px">首页</li>
        <li style="left: 200px;font-size: 20px">公开公示</li>
        <li style="left: 240px;font-size: 20px">信息查询</li>
        <li style="left: 280px;font-size: 20px">开通服务</li>
        <li style="left: 320px;font-size: 20px">登录</li>
    </ul>
    <div class="layui-tab-content" style="width: 100%;height: 300px">
        <div class="layui-tab-item layui-show">
            <table style="margin: 0px;padding: 0px;width: 90%;height: 100%">
                <td style="margin: 0px;padding: 0px;width: 450px;padding-right: 10px;">
                    <div class="layui-carousel" id="test2" style="left: 150px">
                        <div carousel-item>
                            <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage4.jpg" /></div>
                            <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage5.jpg" /></div>
                            <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage6.jpg" /></div>
                        </div>
                    </div>
                </td>
                <td style="width: 650px">
                    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" style="height: 300px">
                        <ul class="layui-tab-title" style="margin-top: -25px">
                            <li class="layui-this">收费明细</li>
                            <li>通知公告</li>
                            <li>政策法规</li>
                            <li>政策解读</li>
                            <li>曝光台</li>
                        </ul>
                        <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <table class="layui-table"   lay-skin="line">
                                    <colgroup>
                                        <col width="80" height="25">
                                        <col width="80">
                                        <col width="290">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>阶段</th>
                                        <th>费用(参考)</th>
                                        <th>备注</th>
                                    </tr>
                                    </thead>
                                    <tbody class="title-png">
                                    <tr>
                                        <td >科目一</td>
                                        <td>500元</td>
                                        <td>不同地区根据实际情况定价,最高不得大于定价的百分之30</td>
                                    </tr>
                                    <tr>
                                        <td >科目一</td>
                                        <td>1000元</td>
                                        <td>不同地区根据实际情况定价,最高不得大于定价的百分之30</td>
                                    </tr>
                                    <tr>
                                        <td >科目一</td>
                                        <td>1000元</td>
                                        <td>不同地区根据实际情况定价,最高不得大于定价的百分之30</td>
                                    </tr>
                                    <tr>
                                        <td >科目一</td>
                                        <td>500元</td>
                                        <td>不同地区根据实际情况定价,最高不得大于定价的百分之30</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="layui-tab-item">
                                <table class="layui-table"   lay-skin="line">
                                <colgroup>
                                    <col width="250">
                                    <col width="100">
                                    <col width="100">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th >标题</th>
                                    <th>文章来源</th>
                                    <th>日期</th>
                                </tr>
                                </thead>
                                <tbody class="title-png">
                                <tr>
                                    <td >联播+丨如何成为好老师，习近平殷切寄语qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq</td>
                                    <td>汉族</td>
                                    <td>1989-10-14</td>
                                </tr>
                                <tr>
                                    <td>张爱玲</td>
                                    <td>汉族</td>
                                    <td>1920-09-30</td>
                                </tr>
                                <tr>
                                    <td>Helen Keller</td>
                                    <td>拉丁美裔</td>
                                    <td>1880-06-27</td>
                                </tr>
                                <tr>
                                    <td>岳飞</td>
                                    <td>汉族</td>
                                    <td>1103-北宋崇宁二年</td>
                                </tr>
                                </tbody>
                             </table>
                             </div>
                            <div class="layui-tab-item">内容3</div>
                            <div class="layui-tab-item">内容4</div>
                            <div class="layui-tab-item">内容5</div>
                        </div>
                    </div>
                </td>
            </table>
        </div>






        <!-- 公示公开-->
        <div class="layui-tab-item">
<%--            <table id="demo" class="layui-table" lay-event="" lay-skin="nob" ></table>--%>
<%--            <table id="demo" lay-filter="test"></table>--%>

            <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top">
	                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
	                                <table width="950" border="0" align="right" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="425">
	                                            <table width="425" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="425" height="32" style="background: #0a76a4">
	                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="33%" align="center" class="baifont" style="background: #a4752b">学车课堂</td>
                                                                    <td width="52%">　</td>
                                                                    <td width="15%"><a href=""><img src="${pageContext.request.contextPath}/static/images/homepageimages/more.gif" width="27" height="18" border="0"></a></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="268" valign="top" class="cbk">
	                                                        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                                                                        <c:if test="${not empty noticeCS}">
		                                                                        <c:forEach items="${noticeCS}"  var="cs">
                                                                                    <tr  bgcolor='#f4f4f4'>
                                                                                        <td width="90%" height="25" style="font-size: 16px"><a href="shownews.asp?id=2276" target="_blank" title="石佛寺驾校，清明节放假通知">${cs.title}</a></td>
                                                                                        <td width="10%"  ><fmt:formatDate type="date" pattern="yyyy/MM/dd" dateStyle="medium" timeStyle="medium" value="${cs.time}" /></td>
                                                                                    </tr>
                                                                                </c:forEach>
	                                                                        </c:if>
	                                                                        <c:if test="${empty noticeCS}">
		                                                                        暂无消息
	                                                                        </c:if>

                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="425">
	                                            <table width="425" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="348" height="32" style="background: #0a76a4">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="33%" align="center" class="baifont" style="background: #a4752b">驾驶技巧</td>
                                                                    <td width="52%">　</td>
                                                                    <td width="15%"><a href="newslist.asp?cls=驾驶技巧"><img src="${pageContext.request.contextPath}/static/images/homepageimages/more.gif" width="27" height="18" border="0"></a></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="268" valign="top" class="cbk">
                                                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <c:if test="${not empty noticeDS}">
                                                                                <c:forEach items="${noticeDS}"  var="ds">
                                                                                    <tr  bgcolor='#f4f4f4'>
                                                                                        <td width="90%" height="25" style="font-size: 16px"><a href="shownews.asp?id=2276" target="_blank" title="石佛寺驾校，清明节放假通知">${ds.title}</a></td>
                                                                                        <td width="10%"  ><fmt:formatDate type="date" pattern="yyyy/MM/dd" dateStyle="medium" timeStyle="medium" value="${ds.time}" /></td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                            <c:if test="${empty noticeDS}">
                                                                                暂无消息
                                                                            </c:if>

                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table width="100%" height="8" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>


        <div class="layui-tab-item">
            <div class="layui-card">
                <div class="layui-card-header">柱形图</div>
                <div class="layui-card-body">
                    <div id="EchartZhu" style="width: 500px;height: 300px;"></div>
                </div>
            </div>
        </div>
        <div class="layui-tab-item"  >内容四
            <a href="${pageContext.request.contextPath}/TM/login" class="layui-btn layui-btn-normal layui-btn-radius layui-btn-lg layui-anim layui-anim-up" style="margin-left: 400px">驾校申请</a>
        </div>
        <div class="layui-tab-item">
	        <div style="padding: 50px">
		        <a href="${pageContext.request.contextPath}/TM/login" class="layui-btn layui-btn-normal layui-btn-radius layui-btn-lg layui-anim layui-anim-up" style="margin-left: 400px">运管门户</a>
		        <a href="${pageContext.request.contextPath}/school/path/SchoolLogin" class="layui-btn layui-btn layui-btn-radius layui-btn-lg layui-anim layui-anim-upbit">驾校门户</a>
		        <a href="${pageContext.request.contextPath}/coach/login" class="layui-btn layui-btn-warm layui-btn-radius layui-btn-lg layui-anim layui-anim-scale">教练门户</a>
		        <a href="${pageContext.request.contextPath}/student/path/StudentLogin" class="layui-btn layui-btn layui-btn-radius layui-btn-primary layui-btn-lg layui-anim layui-anim-scaleSpring">学员门户</a>
	        </div>
        </div>
    </div>
</div>
<div style="margin-left: 11%;margin-bottom: 10px;">
    <img src="${pageContext.request.contextPath}/static/images/homepageimages/home_logo2.jpg" style="width: 1050px;">
</div>
<div style="padding-left: 11%;padding-bottom: 2px">
    <div id="echarts_div2" style="width: 500px;height: 300px;;float: left;background-color: #f2f4f9"></div>

    <div class="layui-anim layui-anim-scale" style="width: 550px;height: 300px;float: left;">
        <table id="dataTable" lay-filter="test"></table>
    </div>
</div>

<div style="margin-top: 1%">
    <table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="31"><table width="693" height="31" border="0" cellpadding="0" cellspacing="0" style="background: #0000FF;margin-top: 10px;">
                            <tr>
                                <td width="19">　</td>
                                <td width="94" align="center" valign="bottom">
                                    <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center" style="background: white">互动栏</td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="102" valign="bottom">
                                    <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center">　</td>
                                        </tr>
                                    </table>
                                </td>
                                <td>　</td>
                                <td width="46"><a href="huanjing.asp"></a></td>
                            </tr>
                        </table></td>
                    </tr>
                    <tr>
                        <td height="3"></td>
                    </tr>
                    <tr>
                        <td><table width="690" height="165" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
                            <tr>
                                <td align="center" bgcolor="#FFFFFF"><table width="170" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td height="22" align="center"><table width="93%" height="22" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F1F1">
                                            <tr>
                                                <td align="center"><img src="${pageContext.request.contextPath}/static/images/homepageimages/hu0.jpg" width="159" height="128" border="0"></td>
                                            </tr>
                                        </table></td>
                                    </tr>
                                </table></td>

                                <td align="center" bgcolor="#FFFFFF"><table width="170" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td height="22" align="center"><table width="93%" height="22" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F1F1">
                                            <tr>
                                                <td align="center"><img src="${pageContext.request.contextPath}/static/images/homepageimages/hu1.jpg" width="159" height="128" border="0"></td>
                                            </tr>
                                        </table></td>
                                    </tr>
                                </table></td>
                                <td align="center" bgcolor="#FFFFFF"><table width="170" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td height="22" align="center"><table width="93%" height="22" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F1F1">
                                            <tr>
                                                <td align="center"><img src="${pageContext.request.contextPath}/static/images/homepageimages/hu2.jpg" width="159" height="128" border="0"></td>
                                            </tr>
                                        </table></td>
                                    </tr>
                                </table></td>
                                <td align="center" bgcolor="#FFFFFF"><table width="170" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td height="22" align="center"><table width="93%" height="22" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F1F1">
                                            <tr>
                                                <td align="center"><img src="${pageContext.request.contextPath}/static/images/homepageimages/hu3.jpg" width="159" height="128" border="0"></td>
                                            </tr>
                                        </table></td>
                                    </tr>
                                </table></td>
                            </tr>
                        </table></td>
                    </tr>
                </table>
            </td>
            <td width="350" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                    <tr>
                        <td><img src="${pageContext.request.contextPath}/static/images/homepageimages/r1.jpg" width="248" height="31"></td>
                    </tr>
                    <tr>
                        <td height="168" class="cbk">
                            <table width="100%" height="168" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top" class="lx">
                                        <table width="98%" border="0" cellspacing="1" cellpadding="0">
                                            <tr>
                                                <td width="30%" height="23" align="right" bgcolor="#f4f4f4">总部地址：</td>
                                                <td width="70%" height="23">福建省厦门市思明区观日路56号</td>
                                            </tr>
                                            <tr>
                                                <td height="23" align="right" bgcolor="#f4f4f4">其他分校：</td>
                                                <td height="23">福建省厦门市集美区哈哈路56号</td>
                                            </tr>
                                            <tr>
                                                <td height="23" align="right" bgcolor="#f4f4f4">福州分校：</td>
                                                <td height="23">福建省福州市鼓楼区呱呱007号</td>
                                            </tr>
                                            <tr>
                                                <td height="23" align="right" bgcolor="#f4f4f4">龙岩分校：</td>
                                                <td height="23">福建省龙岩市新罗区观日路56号</td>
                                            </tr>
                                            <tr>
                                                <td height="23" align="right" bgcolor="#f4f4f4">咨询热线：</td>
                                                <td height="23">18812580007 （编主任） </td>
                                            </tr>

                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>


<div class="footer" align="center" style="background-color: #0a76a4">
    <div class="footer-box">
        <p class="footer-p">友情链接</p>
        <div class="footer-friend">
            <a target="_blank" href="http://www.mot.gov.cn/"><img class="footer-img" src="${pageContext.request.contextPath}/static/images/homepageimages/traffic.jpg"/></a>
            <a target="_blank" href="https://www.cttic.cn/"><img class="footer-img" src="${pageContext.request.contextPath}/static/images/homepageimages/traffic_center.jpg" /></a>
            <a target="_blank" href="http://www.122.gov.cn"><img class="footer-img" src="${pageContext.request.contextPath}/static/images/homepageimages/traffic_safety.jpg" /></a>
            <a target="_blank" href="http://www.crta.org.cn/"><img class="footer-imgs" src="${pageContext.request.contextPath}/static/images/homepageimages/crta.jpg"/></a>
            <a target="_blank" href="${pageContext.request.contextPath}/link/findAllLink/">${"#dt.linkUrl"}连接地址</a>
            <c:if test="dt != null">
                ${"dt.linkUrl"}
            </c:if>
<%--    <a target="_blank" href="${pageContext.request.contextPath}/link/findAllLink">${$("#linkUrl").val()}连接地址</a>--%>
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


<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });


</script>


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

    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#date1' //指定元素
        });
    });

    layui.use(['table','laydate','form','jquery'], function(){
        var table = layui.table,
                laydate=layui.laydate,
                form=layui.form,
                $=layui.jquery;
        //表格实例
        table.render({
            elem: '#demo'
            ,height: 280
            ,id:'testReload'
            ,url: '${pageContext.request.contextPath}/TM/getNotice' //数据接口
            ,page: true //开启分页
            ,limit:5
            ,cols: [[ //表头
                // {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                {field: 'title', title: '标题', width:400}
                ,{field: 'content', title: '内容', width:400 , event:'show'}
                ,{field: 'date', title: '发布时间', templet: "<div>{{layui.util.toDateString(d.time, 'yyyy-MM-dd HH:mm:ss')}}</div>",width:150}
                ,{field: 'type', title: '公告类型', width:150}
                // ,{fixed: 'right', width:300, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]]
        });

        //阻止表单提交
        form.on('submit(formDemo)', function(data){
            return false;//阻止表单跳转
        });

        //表格数据重载
        $('#button').on('click',function () {
            var type=$(this).data('type');
            if(type == 'reload'){
                table.reload('testReload',{
                    page:{
                        curr:1
                    }
                    ,where:{
                        title:$("#title").val(),
                        date:$("#date1").val(),
                        type:$("#type").val(),
                    }
                });
            }

        });

        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            console.log(data);
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            console.log(layEvent);
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if(layEvent === 'show'){ //查看
                console.log("点击了查看");
                //do somehing
                console.log(data);

                var notice=JSON.stringify(data);

                $.ajax({
                    //相应路劲
                    url:"${pageContext.request.contextPath}/TM/getNoticeMsg",
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
                        layer.open({
                            type: 2,
                            title: '查看',
                            shadeClose: true,
                            shade: 0.8,
                            area: ['700px', '500px'],
                            content: "${pageContext.request.contextPath}/TM/path/InspectNoticeMsg",
                            yes: function (index, layero) {

                            }
                        });
                    },
                    //返回失败消息
                    error:function () {
                    }
                });

            } else if(layEvent === 'del'){ //删除
                // console.log("点击了删除按钮");
                layer.confirm('确定删除数据?', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);

                    var notice=JSON.stringify(data);

                    //向服务端发送删除指令
                    $.ajax({
                        //相应路劲
                        url:"${pageContext.request.contextPath}/TM/deleteNotice",
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
                            console.log(msg);
                            layer.alert("删除成功",{icon:6});
                        },
                        //返回失败消息
                        error:function () {
                        }
                    });

                });
            }
        });

    });

</script>

<script>
	layui.use('table',function () {
		var table=layui.table;

		table.on('tool()',function(){

		})
	})
</script>

<script type="text/javascript">
	var nameArr = [];//驾校名称
	var studentArr = [];
	var coachArr = [];
	var nu1=0;
    var obArr = [];
    var obArr1 = [];
	$(function() {
		// var path = $("#path").val();
		$.ajax({
			async:true,
			method : "POST",
			url :"${pageContext.request.contextPath}/school/getSchoolName",
			dataType : "text",
			success : function(msg) {
				var arr = JSON.parse(msg);
				console.log("msg=="+arr);
				for (var i = 0;i<arr.length;i++){
					nameArr.push(arr[i].name);
				}
				console.log("学校名ms=="+nameArr);
				createEchars();
			},
			error : function() {
				alert("服务器正忙");
			}
		});
	})

	$(function() {
		// var path = $("#path").val();
		$.ajax({
			async:true,
			method : "POST",
			url :"${pageContext.request.contextPath}/school/getSchoolStudents",
			dataType : "text",
			success : function(msg) {
				var arr = JSON.parse(msg);
				console.log("msg=="+arr);
				for (var i = 0;i<arr.length;i++) {
                    studentArr.push(arr[i]);

                }
				console.log("学员ms=="+nameArr);
				createEchars();

			},
			error : function() {
				alert("服务器正忙");
			}
		});
	})

	$(function() {
		// var path = $("#path").val();
		$.ajax({
			async:true,
			method : "POST",
			url :"${pageContext.request.contextPath}/coach/getSchoolCoach",
			dataType : "text",
			success : function(msg) {
				var arr = JSON.parse(msg);
				console.log("msg=="+arr);
				for (var i = 0;i<arr.length;i++){
					// valueArr.push(arr[i]);
					// nu1  =parseInt(nu1)+ parseInt(arr[i]);
					coachArr.push(arr[i]);
                    console.log("ms=="+arr);

				}
				console.log("教练ms=="+coachArr);
				createEchars();
			},
			error : function() {
				alert("服务器正忙");
			}
		});
	})

	function createEchars() {

	// 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('EchartZhu'));

    console.log("tupian");

    // 指定图表的配置项和数据
    var optionchart = {
        title: {
        text: '驾校和学员人数'
        },
        tooltip: {},
        legend: {
            data: ['人数']
        },
        xAxis: {
            data: nameArr
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: '教练人数',
            type: 'bar', //柱状
            data: coachArr,
            itemStyle: {
            normal: { //柱子颜色
                color: 'red'
            }
            }
        },{
            name:'学员人数',
            type:'bar',
            data:studentArr,
            itemStyle:{
            normal:{
                color:'blue'
            }
            }
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    // myChart.setOption(option);
    myChart.setOption(optionchart, true);
	}






    $(function() {
        $.ajax({
            async:true,
            method : "POST",
            url :"${pageContext.request.contextPath}/school/school",
            dataType : "text",
            success : function(msg) {
                var arr = JSON.parse(msg);
                for (var i = 0;i<arr.length;i++){
                    obArr1.push({
                        value : arr[i].count,
                        name : arr[i].name
                    });
                }
                rose();
            },
            error : function() {
                alert("服务器正忙");
            }
        });
    })

    //南丁格尔玫瑰图
    function rose() {

        //基于准备好的dom，初始化echarts实例
        var myChart2 = echarts.init(document.getElementById('echarts_div2'));//dark为暗黑主题 不要可以去掉
        var option = {
            title : {
                text : '基础数据'
            },
            series : [ {
                name : '驾校',
                type : 'pie',
                roseType: 'angle',//南丁格尔玫瑰图样式  去掉则显示基本圆饼图
                radius : '55%',
                data : obArr1
                // data:[
                //     {value: 10, name: 'rose1'},
                //     {value: 5, name: 'rose2'},
                //     {value: 15, name: 'rose3'},
                //     {value: 25, name: 'rose4'},
                //     {value: 20, name: 'rose5'},
                //     {value: 35, name: 'rose6'},
                //     {value: 30, name: 'rose7'},
                //     {value: 40, name: 'rose8'}
                // ]
            } ]
        };
        myChart2.setOption(option);
    }


    layui.use(['upload', 'jquery', 'layer','table','laydate'], function () { //导入模块
        $ = layui.jquery;
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#dataTable'
            , height: 280
            , url: '${pageContext.request.contextPath}/school/WelcomeTable' //数据接口
            , page: true //开启分页
            , id: 'searchTable'
            , limit: 5
            , limits: [5]
            , cols: [[ //表头
                {field: 'name', title: '驾校', width: 145, sort: true, fixed: 'left', align: 'center',unresize:true}
                , {field: 'countCoach', title: '教练员', width: 110, sort: true,align: 'center',unresize:true}
                , {field: 'countCar', title: '教练车', width: 140, sort: true, align: 'center',unresize:true}
                , {field: 'countStudent', title: '培训能力(人)', width: 150, sort: true, align: 'center',unresize:true}
            ]]
        });
    });



</script>

</body>
</html>

