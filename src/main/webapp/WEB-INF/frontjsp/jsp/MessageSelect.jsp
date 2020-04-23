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
    <script src="./信息查询_files/hm.js.下载"></script><script type="text/javascript">
        var path = "http://47.96.140.98:20041";
    </script>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?42cc50549976c0fa60df5d3785b70532";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/homepage/css/inquire.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/homepage/css/starScore.css">
    <link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath}/static/homepage/css/layer.css" media="all"></head>
<body style="background: #fafbfd;">

<div class="login-inf">
    <div class="inf-box">
        <div class="inf-time">
            今天是2020年4月22日,欢迎您！
        </div>
        <div class="inf-login">
            <a target="_blank" href="http://118.178.90.232/web/">管理部门登录</a> |
            <a target="_blank" href="http://118.178.90.232:8666/">驾培机构登录</a> |
            <a href="http://47.96.140.98:20041/coaLogin">教练员登录</a> |
            <a href="http://47.96.140.98:20041/stuLogin">学员登录</a>
        </div>
    </div>
</div>
<div class="top">
    <div class="top-box">
        <img class="top-logo" src="${pageContext.request.contextPath}/static/homepage/images/psp-logo.png">
        <div class="top-title">
            <p class="top-title-p1">机动车驾驶员计时培训系统</p>
            <p class="top-title-p2">Henan driving training public service platform </p>
        </div>
<%--        <div class="top-search">--%>
<%--            <select id="selectType" name="selectType">--%>
<%--                <option value="1">驾培机构</option>--%>
<%--                <option value="2">教练员</option>--%>
<%--                <option value="3">教练车</option>--%>
<%--            </select>--%>
<%--            <input type="text" name="" id="selectName" value="">--%>
<%--            <label><a style="cursor: pointer;" onclick="topSelect();"><img src="${pageContext.request.contextPath}/static/homepage/images/search.png">搜索</a></label>--%>
<%--        </div>--%>
    </div>
</div>
<%--<div class="menu">--%>
<%--    <div class="menu-box">--%>
<%--        <ul id="menu-title" class="menu-title">--%>
<%--            <li id="menu-title-one" class="layui-this">--%>
<%--                <img src="${pageContext.request.contextPath}/static/homepage/images/menu_home1.png">--%>
<%--                <a href="http://47.96.140.98:20041/">首页</a>--%>
<%--            </li>--%>
<%--            <li id="menu-title-two">--%>
<%--                <img src="${pageContext.request.contextPath}/static/homepage/images/menu_publicity1.png">--%>
<%--                <a href="http://47.96.140.98:20041/publicity">公开公示</a>--%>
<%--            </li>--%>
<%--            <li id="menu-title-three" class="menu-title-bg">--%>
<%--                <img src="${pageContext.request.contextPath}/static/homepage/images/menu_inquire1.png">--%>
<%--                <a href="http://47.96.140.98:20041/inquire">信息查询</a></li>--%>
<%--            <li id="menu-title-four">--%>
<%--                <img src="${pageContext.request.contextPath}/static/homepage/images/menu_list1.png">--%>
<%--                <a href="http://47.96.140.98:20041/industryList">行业榜单</a>--%>
<%--            </li>--%>
<%--            <li id="menu-title-five">--%>
<%--                <img src="${pageContext.request.contextPath}/static/homepage/images/menu_service1.png">--%>
<%--                <a href="http://47.96.140.98:20041/service">服务导航</a>--%>
<%--            </li>--%>
<%--            <li id="menu-title-six">--%>
<%--                <img src="${pageContext.request.contextPath}/static/homepage/images/menu_student1.png">--%>
<%--                <a href="http://47.96.140.98:20041/studentCoaInfo">学教专区</a>--%>
<%--            </li>--%>
<%--            <li id="menu-title-seven">--%>
<%--                <img src="${pageContext.request.contextPath}/static/homepage/images/menu_download1.png">--%>
<%--                <a href="http://47.96.140.98:20041/download">资料下载</a>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div id="share">--%>
<%--    <a id="totop" title="返回顶部" style="display: none;">返回顶部</a>--%>
<%--    <a href="javascript:viod(0)" title="返回上一页" class="sina" onclick="history.go(-1);"></a>--%>
<%--    <a href="javascript:viod(0)" title="刷新" class="tencent" onclick="history.go(0);"></a>--%>
<%--</div>--%>
<div class="main">
    <div class="layui-tab">
        <ul id="selectParent" class="layui-tab-title" style="float: left;width: 150px;height: 200px;top: 45px;">
<%--            <li onclick="selectSchInfoJump();" class="layui-this">查驾培机构</li>--%>
            <li id="selectTwo" onclick="selectCoaInfoJump();">查驾校</li>
            <li id="selectThree" onclick="selectVueInfoJump();">查教练</li>
        </ul>
        <span class="inq-inf"><img src="${pageContext.request.contextPath}/static/homepage/images/inquires.png">信息查询</span>
        <div id="tab-item-parent" class="layui-tab-content" style="margin-left: 165px;">
            <div class="layui-tab-item layui-show">
                <div class="inq-con">
                    <span class="title-con">查询条件</span>
                    <div class="title-num">共<span id="schNum">5</span>所驾培机构</div>
                </div>
                <div class="top-search">
                    <select id="selectType" name="selectType">
                        <option value="1">驾培机构</option>
                        <option value="2">教练员</option>
                    </select>
                    <input type="text" name="" id="selectName" value="">
                    <label><a style="cursor: pointer;" onclick="topSelect();"><img src="${pageContext.request.contextPath}/static/homepage/images/search.png">搜索</a></label>
                </div>
<%--                <ul class="ul1">--%>
<%--                    <li>--%>
<%--                        <span class="title-area">地区范围：</span>--%>
<%--                        <select id="province" name="quiz1" class="inq-sel" style="margin-left: 20px;width: 100px;"><option value="410000">河南省</option></select>--%>
<%--                        <img src="${pageContext.request.contextPath}/static/homepage/images/arrows1.png" style="margin: 0 10px;">--%>
<%--                        <select onchange="selectSchCity(this.value);" id="city" name="quiz2" class="inq-sel" style="width: 100px;"><option value="" selected="">地市级</option><option value="410100">郑州市</option><option value="410200">开封市</option><option value="410300">洛阳市</option><option value="410400">平顶山市</option><option value="410500">安阳市</option><option value="410600">鹤壁市</option><option value="410700">新乡市</option><option value="410800">焦作市</option><option value="410900">濮阳市</option><option value="411000">许昌市</option><option value="411100">漯河市</option><option value="411200">三门峡市</option><option value="411300">南阳市</option><option value="411400">商丘市</option><option value="411500">信阳市</option><option value="411600">周口市</option><option value="411700">驻马店市</option><option value="419000">济源市</option></select>--%>
<%--                        <img src="${pageContext.request.contextPath}/static/homepage/images/arrows1.png" style="margin: 0 10px;">--%>
<%--                        <select onchange="selectSchCounty(this.value);" id="county" name="quiz3" class="inq-sel" style="width: 100px;">--%>
<%--                            <option value="" selected="">区县级</option>--%>
<%--                        </select>--%>
<%--                    </li>--%>
<%--                    <li id="levelParent">--%>
<%--                        <span class="title-area">分类等级：</span>--%>
<%--                        <button id="levelzero" onclick="level(&#39;&#39;,&#39;levelzero&#39;);" class="button1 buttonbackground">不限</button>--%>
<%--                        <button id="levelone" onclick="level(1,&#39;levelone&#39;);">一级</button>--%>
<%--                        <button id="leveltwo" onclick="level(2,&#39;leveltwo&#39;);">二级</button>--%>
<%--                        <button id="levelthree" onclick="level(3,&#39;levelthree&#39;);">三级</button>--%>
<%--                    </li>--%>
<%--                    <li id="busiscopeParent">--%>
<%--                        <span class="title-area">经营范围：</span>--%>
<%--                        <button id="busiscopezero" onclick="busiscope(&#39;&#39;,&#39;busiscopezero&#39;);" class="button1 buttonbackground">不限</button>--%>
<%--                        <button id="busiscopeA1" onclick="busiscope(&#39;A1&#39;,&#39;busiscopeA1&#39;);">A1</button>--%>
<%--                        <button id="busiscopeA2" onclick="busiscope(&#39;A2&#39;,&#39;busiscopeA2&#39;);">A2</button>--%>
<%--                        <button id="busiscopeA3" onclick="busiscope(&#39;A3&#39;,&#39;busiscopeA3&#39;);">A3</button>--%>
<%--                        <button id="busiscopeB1" onclick="busiscope(&#39;B1&#39;,&#39;busiscopeB1&#39;);">B1</button>--%>
<%--                        <button id="busiscopeB2" onclick="busiscope(&#39;B2&#39;,&#39;busiscopeB2&#39;);">B2</button>--%>
<%--                        <button id="busiscopeC1" onclick="busiscope(&#39;C1&#39;,&#39;busiscopeC1&#39;);">C1</button>--%>
<%--                        <button id="busiscopeC2" onclick="busiscope(&#39;C2&#39;,&#39;busiscopeC2&#39;);">C2</button>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                <div class="inq-rank">--%>
<%--                    <ul id="schOrder">--%>
<%--                        <li class="li1" id="schStarOrder" onclick="schStarOrderClick();">综合星级<img src="${pageContext.request.contextPath}/static/homepage/images/sort2.png" alt=""></li>--%>
<%--                        <li id="levelOrder" onclick="levelOrderClick();">分类等级<img src="${pageContext.request.contextPath}/static/homepage/images/sort2.png" alt=""></li>--%>
<%--                        <li id="coacountOrder" onclick="coacountOrderClick();">教练员数<img src="${pageContext.request.contextPath}/static/homepage/images/sort2.png" alt=""></li>--%>
<%--                        <li id="vuecountOrder" onclick="vuecountOrderClick();">教练车数<img src="${pageContext.request.contextPath}/static/homepage/images/sort2.png" alt=""></li>--%>
<%--                        <li id="yearaddstucountOrder" onclick="yearaddstucountOrderClick();">年新增学员数<img src="${pageContext.request.contextPath}/static/homepage/images/sort2.png" alt=""></li>--%>
<%--                        <li id="yearendstucountOrder" onclick="yearendstucountOrderClick();">年结业学员数<img src="${pageContext.request.contextPath}/static/homepage/images/sort2.png" alt=""></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
                <hr>
                <div class="inq-school">
                    <ul id="schoolList"><li class="list-school"><a href="http://47.96.140.98:20041/schInfoDetail?inscode=9571143364213502"><img src="${pageContext.request.contextPath}/static/images/messageselect/sch6.jpg"></a>
                        <div class="inf-school"><a href="http://47.96.140.98:20041/schInfoDetail?inscode=9571143364213502"><p class="word-1" title="长葛祥和驾校">长葛祥和驾校</p></a><p style="float: left;">综合星级：</p>
                            <div class="atar_Show" style="display:inline;"><p tip="5" style="width: 150px;float: none;"></p></div><span>5分</span><p></p><p><span>分类等级：三级</span><span style="margin-left: 45px;" title="C1,C2">经营范围：C1,C2</span></p><p><span>教练员数：88人</span><span style="margin-left: 35px;">教练车数：37台</span></p><p><span>年新增学员数：435人</span><span style="margin-left: 5px;">年结业学员数：0人</span></p><p title="长葛市祥和路（尹家堂村）">地址：长葛市祥和路（尹家堂村）</p></div></li>
                        <li class="list-school"><a href="http://47.96.140.98:20041/schInfoDetail?inscode=5555711433974153"><img src="${pageContext.request.contextPath}/static/images/messageselect/sch6.jpg"></a>
                        <div class="inf-school"><a href="http://47.96.140.98:20041/schInfoDetail?inscode=5555711433974153"><p class="word-1" title="郏县中运驾校">郏县中运驾校</p></a><p style="float: left;">综合星级：</p><div class="atar_Show" style="display:inline;"><p tip="5" style="width: 150px;float: none;"></p></div><span>5分</span><p></p><p><span>分类等级：三级</span><span style="margin-left: 45px;" title="C1,C2">经营范围：C1,C2</span></p><p><span>教练员数：84人</span><span style="margin-left: 35px;">教练车数：41台</span></p><p><span>年新增学员数：537人</span><span style="margin-left: 5px;">年结业学员数：0人</span></p><p title="郏县渣元乡十里铺村">地址：郏县渣元乡十里铺村</p></div></li>
                        <li class="list-school"><a href="http://47.96.140.98:20041/schInfoDetail?inscode=4805457035153643"><img src="${pageContext.request.contextPath}/static/images/messageselect/sch6.jpg"></a>
                        <div class="inf-school"><a href="http://47.96.140.98:20041/schInfoDetail?inscode=4805457035153643"><p class="word-1" title="许昌正通驾校">许昌正通驾校</p></a><p style="float: left;">综合星级：</p><div class="atar_Show" style="display:inline;"><p tip="5" style="width: 150px;float: none;"></p></div><span>5分</span><p></p><p><span>分类等级：三级</span><span style="margin-left: 45px;" title="C1,C2">经营范围：C1,C2</span></p><p><span>教练员数：79人</span><span style="margin-left: 35px;">教练车数：24台</span></p><p><span>年新增学员数：140人</span><span style="margin-left: 5px;">年结业学员数：66人</span></p><p title="许昌市许繁路北段东侧">地址：许昌市许繁路北段东侧</p></div></li>
                        <li class="list-school"><a href="http://47.96.140.98:20041/schInfoDetail?inscode=4521216293887223"><img src="${pageContext.request.contextPath}/static/images/messageselect/sch6.jpg"></a>
                        <div class="inf-school"><a href="http://47.96.140.98:20041/schInfoDetail?inscode=4521216293887223"><p class="word-1" title="汝南县驾校">汝南县驾校</p></a><p style="float: left;">综合星级：</p>
                            <div class="atar_Show" style="display:inline;"><p tip="5" style="width: 150px;float: none;"></p></div><span>5分</span><p></p><p><span>分类等级：三级</span><span style="margin-left: 45px;" title="C1">经营范围：C1</span></p><p><span>教练员数：75人</span><span style="margin-left: 35px;">教练车数：50台</span></p><p><span>年新增学员数：0人</span><span style="margin-left: 5px;">年结业学员数：0人</span></p><p title="汝南县梁祝大道北段路东">地址：汝南县梁祝大道北段路东</p></div></li>
                        <li class="list-school"><a href="http://47.96.140.98:20041/schInfoDetail?inscode=4623045776719159"><img src="${pageContext.request.contextPath}/static/images/messageselect/sch6.jpg"></a>
                        <div class="inf-school"><a href="http://47.96.140.98:20041/schInfoDetail?inscode=4623045776719159"><p class="word-1" title="襄县保通">襄县保通</p></a><p style="float: left;">综合星级：</p>
                            <div class="atar_Show" style="display:inline;"><p tip="5" style="width: 150px;float: none;"></p></div><span>5分</span><p></p><p><span>分类等级：三级</span><span style="margin-left: 45px;" title="C1,C2">经营范围：C1,C2</span></p><p><span>教练员数：72人</span><span style="margin-left: 35px;">教练车数：49台</span></p><p><span>年新增学员数：165人</span><span style="margin-left: 5px;">年结业学员数：0人</span></p><p title="襄城县西环路北100米">地址：襄城县西环路北100米</p></div></li>
                        <li class="list-school"><a href="http://47.96.140.98:20041/schInfoDetail?inscode=5758179799756695"><img src="${pageContext.request.contextPath}/static/images/messageselect/sch6.jpg"></a>
                        <div class="inf-school"><a href="http://47.96.140.98:20041/schInfoDetail?inscode=5758179799756695"><p class="word-1" title="百分百驾校">百分百驾校</p></a><p style="float: left;">综合星级：</p>
                            <div class="atar_Show" style="display:inline;"><p tip="5" style="width: 150px;float: none;"></p></div><span>5分</span><p></p><p><span>分类等级：三级</span><span style="margin-left: 45px;" title="C1,C2">经营范围：C1,C2</span></p><p><span>教练员数：72人</span><span style="margin-left: 35px;">教练车数：39台</span></p><p><span>年新增学员数：281人</span><span style="margin-left: 5px;">年结业学员数：0人</span></p><p title="河南省平顶山市新华区焦店镇东果店村平郏快速路南段1_7公里处路东">地址：河南省平顶山市新华区焦店镇东果店……</p></div></li></ul>
                    <hr>
                    <div id="demo0" style="float: right;"><div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-2"><a href="javascript:;" class="layui-laypage-prev layui-disabled" data-page="0">上一页</a><span class="layui-laypage-curr"><em class="layui-laypage-em"></em><em>1</em></span><a href="javascript:;" data-page="2">2</a><a href="javascript:;" data-page="3">3</a><a href="javascript:;" data-page="4">4</a><a href="javascript:;" data-page="5">5</a><span class="layui-laypage-spr">…</span><a href="javascript:;" class="layui-laypage-last" title="尾页" data-page="363">363</a><a href="javascript:;" class="layui-laypage-next" data-page="2">下一页</a></div></div>
                </div>
            </div>
            <div id="tab-item-two" class="layui-tab-item">
                <div class="inq-con">
                    <span class="title-con">查询条件</span>
                    <div class="title-num">共<span id="coaNum">0</span>名教练员</div>
                </div>
                <ul class="ul1">
                    <li>
                        <span class="title-area">驾培机构：</span>
                        <select id="coaProvince" name="quiz1" class="inq-sel" style="margin-left: 20px;width: 100px;">

                        </select>
                        <img src="${pageContext.request.contextPath}/static/homepage/images/arrows1.png" style="margin: 0 10px;">
                        <select onchange="selectCoaCity(this.value);" id="coaCity" name="quiz2" class="inq-sel" style="width: 100px;">

                        </select>
                        <img src="${pageContext.request.contextPath}/static/homepage/images/arrows1.png" style="margin: 0 10px;">
                        <select onchange="selectCoaCounty(this.value);" id="coaCounty" name="quiz3" class="inq-sel" style="width: 100px;">
                            <option value="" selected="">区县级</option>
                        </select>
                        <img src="${pageContext.request.contextPath}/static/homepage/images/arrows1.png" style="margin: 0 10px;">
                        <select onchange="selectCoaSch(this.value);" id="coaSch" name="quiz3" class="inq-sel" style="width: 100px;">
                            <option value="" selected="">驾培机构</option>
                        </select>
                    </li>
                    <li id="coaSexParent">
                        <span class="title-area">性　　别：</span>
                        <button id="coaSexzero" onclick="coaSexClick(&#39;&#39;,&#39;coaSexzero&#39;);" class="button1 buttonbackground">不限</button>
                        <button id="coaSex1" onclick="coaSexClick(1,&#39;coaSex1&#39;);">男</button>
                        <button id="coaSex2" onclick="coaSexClick(2,&#39;coaSex2&#39;);">女</button>
                    </li>

                    <li id="dripermittedParent">
                        <span class="title-area">准教车型：</span>
                        <button id="dripermittedzero" onclick="teachpermitted(&#39;&#39;,&#39;dripermittedzero&#39;);" class="button1 buttonbackground">不限</button>
                        <button id="dripermittedA1" onclick="teachpermitted(&#39;A1&#39;,&#39;dripermittedA1&#39;);">A1</button>
                        <button id="dripermittedA2" onclick="teachpermitted(&#39;A2&#39;,&#39;dripermittedA2&#39;);">A2</button>
                        <button id="dripermittedA3" onclick="teachpermitted(&#39;A3&#39;,&#39;dripermittedA3&#39;);">A3</button>
                        <button id="dripermittedB1" onclick="teachpermitted(&#39;B1&#39;,&#39;dripermittedB1&#39;);">B1</button>
                        <button id="dripermittedB2" onclick="teachpermitted(&#39;B2&#39;,&#39;dripermittedB2&#39;);">B2</button>
                        <button id="dripermittedC1" onclick="teachpermitted(&#39;C1&#39;,&#39;dripermittedC1&#39;);">C1</button>
                        <button id="dripermittedC2" onclick="teachpermitted(&#39;C2&#39;,&#39;dripermittedC2&#39;);">C2</button>
                    </li>
                    <li id="ageParent">
                        <span class="title-area">年龄范围：</span>
                        <button id="agezero" onclick="ageClick(&#39;&#39;,&#39;agezero&#39;);" class="button1 buttonbackground">不限</button>
                        <button id="age1" onclick="ageClick(&#39;1&#39;,&#39;age1&#39;);">18岁以下</button>
                        <button id="age2" onclick="ageClick(&#39;2&#39;,&#39;age2&#39;);">18-30岁</button>
                        <button id="age3" onclick="ageClick(&#39;3&#39;,&#39;age3&#39;);">30-45岁</button>
                        <button id="age4" onclick="ageClick(&#39;4&#39;,&#39;age4&#39;);">45-60岁</button>
                        <button id="age5" onclick="ageClick(&#39;5&#39;,&#39;age5&#39;);">60岁以上</button>
                    </li>
                </ul>
                <div class="inq-rank">
                    <ul style="width: 270px;" id="coaOrder">
                        <li class="li1" id="coaStarOrder" onclick="coaStarOrderClick();">综合星级<img src="${pageContext.request.contextPath}/static/homepage/images/sort2.png" alt=""></li>
                        <li id="ageOrder" onclick="ageOrderClick();">年龄<img src="${pageContext.request.contextPath}/static/homepage/images/sort2.png" alt=""></li>
                        <li id="yearteachcountOrder" onclick="yearteachcountOrderClick();">年带教学员数<img src="${pageContext.request.contextPath}/static/homepage/images/sort2.png" alt=""></li>
                    </ul>
                </div>
                <hr>
                <div class="inq-student">
                    <ul id="studentList">

                    </ul>
                    <hr>
                    <div id="demo123" style="float: right;"></div>
                </div>
            </div>
            <div id="tab-item-three" class="layui-tab-item">
                <div class="inq-con">
                    <span class="title-con">查询条件</span>
                    <div class="title-num">共<span id="vehNum">0</span>辆教练车</div>
                </div>
                <ul class="ul1">
                    <li>
                        <span class="title-area">驾培机构：</span>
                        <select id="vehProvince" name="quiz1" class="inq-sel" style="margin-left: 20px;width: 100px;">

                        </select>
                        <img src="${pageContext.request.contextPath}/static/homepage/images/arrows1.png" style="margin: 0 10px;">
                        <select onchange="selectVehCity(this.value);" id="vehCity" name="quiz2" class="inq-sel" style="width: 100px;">

                        </select>
                        <img src="${pageContext.request.contextPath}/static/homepage/images/arrows1.png" style="margin: 0 10px;">
                        <select onchange="selectVehCounty(this.value);" id="vehCounty" name="quiz3" class="inq-sel" style="width: 100px;">
                            <option value="" selected="">区县级</option>
                        </select>
                        <img src="${pageContext.request.contextPath}/static/homepage/images/arrows1.png" style="margin: 0 10px;">
                        <select onchange="selectVehSch(this.value);" id="vehSch" name="quiz3" class="inq-sel" style="width: 100px;">
                            <option value="" selected="">驾培机构</option>
                        </select>
                    </li>
                    <li id="perdritypeParent">
                        <span class="title-area">培训车型：</span>
                        <button id="perdritypezero" onclick="perdritype(&#39;&#39;,&#39;perdritypezero&#39;);" class="button1 buttonbackground">不限</button>
                        <button id="perdritypeA1" onclick="perdritype(&#39;A1&#39;,&#39;perdritypeA1&#39;);">A1</button>
                        <button id="perdritypeA2" onclick="perdritype(&#39;A2&#39;,&#39;perdritypeA2&#39;);">A2</button>
                        <button id="perdritypeA3" onclick="perdritype(&#39;A3&#39;,&#39;perdritypeA3&#39;);">A3</button>
                        <button id="perdritypeB1" onclick="perdritype(&#39;B1&#39;,&#39;perdritypeB1&#39;);">B1</button>
                        <button id="perdritypeB2" onclick="perdritype(&#39;B2&#39;,&#39;perdritypeB2&#39;);">B2</button>
                        <button id="perdritypeC1" onclick="perdritype(&#39;C1&#39;,&#39;perdritypeC1&#39;);">C1</button>
                        <button id="perdritypeC2" onclick="perdritype(&#39;C2&#39;,&#39;perdritypeC2&#39;);">C2</button>
                    </li>
                </ul>

                <div class="inq-school">
                    <ul id="vehList">

                    </ul>
                    <hr>
                    <div id="demo456" style="float: right;margin-right: 10px;"></div>
                </div>
            </div>

        </div>
    </div>
</div>

<%--<div class="footer">--%>
<%--    <div class="footer-box">--%>
<%--        <p class="footer-p">友情链接</p>--%>
<%--        <div class="footer-friend">--%>
<%--            <a target="_blank" href="http://www.mot.gov.cn/"><img class="footer-img" src="${pageContext.request.contextPath}/static/homepage/images/traffic.jpg"></a>--%>
<%--            <a target="_blank" href="https://www.cttic.cn/"><img class="footer-img" src="${pageContext.request.contextPath}/static/homepage/images/traffic_center.jpg"></a>--%>
<%--            <a target="_blank" href="http://www.122.gov.cn/"><img class="footer-img" src="${pageContext.request.contextPath}/static/homepage/images/traffic_safety.jpg"></a>--%>
<%--            <a target="_blank" href="http://www.crta.org.cn/"><img class="footer-imgs" src="${pageContext.request.contextPath}/static/homepage/images/crta.jpg"></a>--%>
<%--        </div>--%>
<%--        <p class="footer-p">导航链接</p>--%>
<%--        <ul class="footer-orther" style="">--%>
<%--            <li><a target="_blank" href="http://www.jpxcw.com/">全国驾驶培训公共服务平台</a></li>--%>
<%--            <li><a target="_blank" href="http://www.bjmcn.com/">交通运输通信信息集团有限公司</a></li>--%>
<%--        </ul>--%>




<%--    </div>--%>

<%--</div>--%>
<%--<div class="footer-inf">--%>
<%--    <ul style="text-align: center;display: table;">--%>
<%--        <li style="margin: 0 60px 0 0px;">--%>
<%--            <a href="javascript:void(0);">版权所有：河南省道路运输管理局</a>--%>
<%--        </li>--%>
<%--        <li style="margin: 0 60px 0 0px;">--%>
<%--            <a href="javascript:void(0);">技术支持：国交信息股份有限公司</a>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a target="_blank" href="https://tongji.baidu.com/web/welcome/ico?s=42cc50549976c0fa60df5d3785b70532">网站统计</a>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</div>--%>
<%--<script src="./信息查询_files/jquery.min.js.下载"></script>--%>
<%--<script src="./信息查询_files/City_data.js.下载"></script>--%>
<%--<script src="./信息查询_files/areadata.js.下载"></script>--%>
<%--<script src="./信息查询_files/auto_area.js.下载"></script>--%>
<%--<script src="./信息查询_files/layui.js.下载"></script>--%>
<%--<script src="./信息查询_files/common.js.下载"></script>--%>
<%--<script src="./信息查询_files/commonpage.js.下载"></script>--%>

<%--<script type="text/javascript" src="./信息查询_files/inquire.js.下载"></script>--%>


</body></html>