<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-1-5
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage1.jpg" /></div>
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage2.png" /></div>
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage3.jpg" /></div>
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
                            <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage4.jpg" /></div>
                            <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage5.jpg" /></div>
                            <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage6.jpg" /></div>
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
<%--            <table id="demo" class="layui-table" lay-event="" lay-skin="nob" ></table>--%>
            <table id="demo" lay-filter="test"></table>
        </div>


        <div class="layui-tab-item">
            <div class="layui-card">
                <div class="layui-card-header">柱形图</div>
                <div class="layui-card-body">
                    <div id="EchartZhu" style="width: 500px;height: 500px;"></div>
                </div>
            </div>
        </div>

        <div class="layui-tab-item">内容4</div>
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

	// 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('EchartZhu'));

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
            data: (function () {
	            var arr=[];
	            $.ajax({
		            //相应路劲
		            url:"${pageContext.request.contextPath}/school/getSchoolName",
		            //是否异步提交
		            async:true,
		            //请求类型
		            type:"post",
		            //数据名
		            data:{},
		            //数据类型:文本
		            datatype:"json",
		            //返回成功消息
		            success:function (msg) {
			            console.log(msg);
			            // layer.alert("删除成功",{icon:6});
		            },
		            //返回失败消息
		            error:function () {
		            }
	            });
            })
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: '教练人数',
            type: 'bar', //柱状
            data: [20,30,10,60,40,35],
            itemStyle: {
            normal: { //柱子颜色
                color: 'red'
            }
            }
        },{
            name:'学员人数',
            type:'bar',
            data:[40,60,15,100,80,80],
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
