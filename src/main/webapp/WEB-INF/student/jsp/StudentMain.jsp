<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/3
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--	<meta charset="UTF-8">--%>
<%--	<title>用户登录</title>--%>
<%--	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>--%>
<%--	<script src="${pageContext.request.contextPath}/static/student/js/login.js" type="text/javascript" charset="UTF-8"></script>--%>
<%--	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>--%>
<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">--%>
<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/login.css">--%>
<%--</head>--%>
<%--<body>--%>


<%--<div id="loginBox">--%>
<%--	<form class="layui-form" action="${pageContext.request.contextPath}/student/login" method="post" >--%>

<%--		<div class="layui-form-item" style="margin-right: 20px;margin-top: 10px">--%>
<%--			<label class="layui-form-label">账号</label>--%>
<%--			<div class="layui-input-block">--%>
<%--				<input type="text" name="account" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="layui-form-item"  style="margin-right: 20px">--%>
<%--			<label class="layui-form-label">密码</label>--%>
<%--			<div class="layui-input-block">--%>
<%--				<input type="password" name="pwd" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="layui-form-item"  style="margin-right: 20px">--%>
<%--			<label class="layui-form-label">验证码</label>--%>
<%--			<div class="layui-input-block">--%>
<%--				<input type="text" name="code" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="layui-form-item" style="margin-left: 100px;">--%>
<%--		<img alt="" src="${pageContext.request.contextPath}/checkcode" border='1' onclick="this.src='${pageContext.request.contextPath}/CheckCodeServlet?'+Math.random();" id = "code">--%>
<%--		<a href="JavaScript:void(0)" onclick="document.getElementById('code').src='${pageContext.request.contextPath}/CheckCodeServlet?'+Math.random();">看不清,换一张</a>--%>
<%--		</div>--%>
<%--		<div class="layui-form-item">--%>
<%--			<div class="layui-input-block">--%>
<%--				<button class="layui-btn" lay-submit lay-filter="formDemo">立即登录</button>--%>
<%--				<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</form>--%>
<%--	<input type="hidden" id="path" value="${pageContext.request.contextPath}">--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>



<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-3-15
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>学员登录</title>
	<%String path = request.getContextPath();%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>

</head>
<body class="layui-layout-body"  style="overflow-y:scroll;overflow-x:scroll">
<div class="untop">
	<ul class="menu">
		<!--        <li class="backbg logo" onclick="location.href='/home/index'"></li>-->
		<li class="title">机动车驾驶员网上理论学习平台</li>

	</ul>
</div>
<div class="layui-layout layui-layout-admin">
	<div class='layui-header header' style="background-color: #1470a3;">
		<ul class="layui-nav">


			<li class="layui-nav-item"><a href="">首页</a></li>
			<li class="layui-nav-item">
				<a href="javascript:;">理论学习</a>
				<dl class="layui-nav-child">
					<dd><a href="">科目一</a></dd>
					<dd><a href="">科目四</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;">模拟考试</a>
				<dl class="layui-nav-child">
					<dd><a href="">科目一</a></dd>
					<dd><a href="">科目四</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item">
				<a href="">考试信息</a>
			</li>
			<li class="layui-nav-item"><a href="">社区</a></li>
		</ul>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="javascript:;">
					<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
					峰采
				</a>
				<dl class="layui-nav-child">
					<dd><a href="">基本资料</a></dd>
					<dd><a href="">安全设置</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item"><a href="">退出</a></li>
		</ul>
	</div>


	<div class="df_bd">
		<div class="bgl">
			<div class="usio">
				<div class="fra_title"><span><b class="backbg ico_usico"></b>个人信息<a href="javascript:void(0)"></a></span></div>
				<ul class="usio_ul">
					<li class="usio_ul_1">
						<span>姓名：老张</span>
						<span>车型：C1</span>
						<span>网络学员：<b class="yes">是</b></span>
						<span>卡号：1506515390</span>
						<a href="javascript:void(0)"><img alt="" class="xueyuan" src="${pageContext.request.contextPath}/static/student/images/self.png"></a>
					</li>
					<li class="usio_ul_2">
						<a class="backbg usio_ul_2_1" href="/home/userInfo"></a>
						<a class="backbg usio_ul_2_2" href="/home/Repass"></a>
						<a class="backbg usio_ul_2_3" href="/study/index"></a>
					</li>
				</ul>
			</div>
		</div>
		<div class="bgr">
			<div class="usti">
				<div class="fra_title"><span><b class="backbg ico_time"></b>学时信息<a href="javascript:void(0)"></a></span></div>
				<div class="tmio">
					<table class="tmio_tb">
						<tbody><tr>
							<td class="tmio_td">
								<div class="backbg tmio_ca">
									<div class="tmio_carbg" getw="1.00" style="width: 70px;">
										<div class="tmio_car"></div>
										<div class="backbg tmio_card"></div>
									</div>
								</div>
								<div id="edittd">
									<table>
										<tbody><tr>
											<th>学习阶段</th>
											<th>需要总学时</th>
											<th>-</th>
											<th>网上学时<a href="javascript:void(0)" onclick="edit()">刷新</a></th>
											<th>-</th>
											<th>教室学时<a href="javascript:void(0)" onclick="edit()">刷新</a></th>
											<th>=</th>
											<th>未完成学时</th>
											<th>状态</th>
										</tr>
										<tr>
											<td>第一部分</td>
											<td>12学时</td>
											<td>-</td>
											<td>12学时</td>
											<td>-</td>
											<td>0分钟</td>
											<td>=</td>
											<td>0分钟</td>
											<td><span class="backbg yes"></span></td>
										</tr>
										<tr>
											<td>第四部分</td>
											<td>10学时</td>
											<td>-</td>
											<td>16学时</td>
											<td>-</td>
											<td>0分钟</td>
											<td>=</td>
											<td>0分钟</td>
											<td><span class="backbg yes"></span></td>
										</tr>
										</tbody></table>
								</div>
							</td>
						</tr>
						</tbody></table>
				</div>
				<span style="font-size:12px;color:#808080;display:none;">❄第一部分教室有效学时最多为四学时，第四部分教室有效学时最多为二学时</span>
			</div>
		</div>
	</div>
	<!--    <div class="unfot clearfix" style="margin-bottom: 0%">-->
	<!--        <div class="unfotf">-->
	<!--            <ul class="left">-->
	<!--                <li><a href="javascript:void(0)">关于我们</a></li>-->
	<!--                <li><a href="javascript:void(0)">联系我们</a></li>-->
	<!--                <li><a href="javascript:void(0)">广告投放</a></li>-->
	<!--                <li><span>版权所有</span></li>-->
	<!--            </ul>-->
	<!--            <ul class="left">-->
	<!--                <li><span>ICP备案：蜀ICP备11021464号-2</span></li>-->
	<!--                <li><span>著作权登记号：2014SR148530</span></li>-->
	<!--            </ul>-->
	<!--            <ul class="left">-->
	<!--                <li><span>客服QQ：1031488448</span></li>-->
	<!--                <li><span>电话：0591-87620650</span></li>-->
	<!--                <li><span>地址：福州市八一七北路８１号（东街口）五洲大厦14层</span></li>-->
	<!--            </ul>-->
	<!--            <ul class="right">-->


	<!--            </ul>-->
	<!--        </div>-->
	<!--    </div>-->

</div>
<script src="../src/layui.js"></script>
<script>
	//JavaScript代码区域
	layui.use('element', function(){
		var element = layui.element;

	});
</script>
</body>
</html>
