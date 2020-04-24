<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>学员登录</title>
	<%String path = request.getContextPath();%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<%--	<script src="${pageContext.request.contextPath}/static/jquery-2.2.4.js" type="text/javascript" charset="UTF-8"></script>--%>
<%--	<script src="${pageContext.request.contextPath}/static/student/js/kefu.js" type="text/javascript" charset="utf-8"></script>--%>
	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/static/student/js/StudentMain.js" type="text/javascript" charset="utf-8"></script>


	<link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_658796_or3t32rx0uo6flxr.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/index.css">
<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/homepage/css/bootstrap.min.css">--%>
	<script src="${pageContext.request.contextPath}/static/student/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/student/js/dateFormat.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		// 响应式处理
		if(/AppleWebKit.*Mobile/i.test(navigator.userAgent) || (/MIDP|SymbianOS|NOKIA|SAMSUNG|LG|NEC|TCL|Alcatel|BIRD|DBTEL|Dopod|PHILIPS|HAIER|LENOVO|MOT-|Nokia|SonyEricsson|SIE-|Amoi|ZTE/.test(navigator.userAgent))){
			if(window.location.href.indexOf("?mobile") < 0){
				try{
					if(/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)){
						window.location.href="//m.ds.cn";
					}else if(/iPad/i.test(navigator.userAgent)){
						window.location.href="//m.ds.cn";
					}else{
					}
				}catch(e){}
			}
		}
	</script>




	<script type="text/javascript">
		$(function(){
			layui.use(['layer'], function () {
			$("#tag").click(function(){
				var path = $("#path").val();
				var index1 = layer.msg('你确退出吗？', {
					time: 0 //不自动关闭
					,btn: ['确定', '取消']
					,yes: function(index){
						layer.close(index1);
						$.ajax({
							url:path+'/student/quit',
							type:'post',
							success:function(data){

								if ("success"==data){
									location.href=path+"/student/path/StudentLogin";

								}
							},error:function (err) {
								layer.msg("网络繁忙");
							}
						});

					}
				});
			})
			});
		})
	</script>

</head>
<body class="layui-layout-body"  style="overflow-y:scroll;overflow-x:hidden">
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<input type="hidden" id="studentid" value="${student.id}">
<div class="untop">
	<ul class="menu">
		<!--        <li class="backbg logo" onclick="location.href='/home/index'"></li>-->
		<li class="title">机动车驾驶员网上理论学习平台</li>

	</ul>
</div>
<div class="layui-layout layui-layout-admin">
	<div class='layui-header header' style="background-color: #1470a3;">
		<ul class="layui-nav">


			<li class="layui-nav-item"><a href="${pageContext.request.contextPath}/student/path/StudentInfo" target="frame_div">首页</a></li>
			<li class="layui-nav-item">
				<a href="javascript:;">理论学习</a>
				<dl class="layui-nav-child">
					<dd><a href="${pageContext.request.contextPath}/student/path/VedioStudy" target="frame_div">科目一</a></dd>
					<dd><a href="${pageContext.request.contextPath}/student/path/VedioStudy4" target="frame_div">科目四</a></dd>
				</dl>
			</li>

			<li class="layui-nav-item">
				<a href="javascript:;">在线练习</a>
				<dl class="layui-nav-child">
					<dd><a href="${pageContext.request.contextPath}/student/exercise/1" target="_blank">科目一</a></dd>
					<dd><a href="${pageContext.request.contextPath}/student/exercise/4" target="_blank">科目四</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;">错题练习</a>
				<dl class="layui-nav-child">
					<dd><a href="${pageContext.request.contextPath}/student/wrongQuestion/1" target="_blank">科目一</a></dd>
					<dd><a href="${pageContext.request.contextPath}/student/wrongQuestion/4" target="_blank">科目四</a></dd>
				</dl>
			</li>

			<li class="layui-nav-item">
				<a href="javascript:;">在线打卡</a>
				<dl class="layui-nav-child">
					<dd><a href="${pageContext.request.contextPath}/student/path/FaceSignin?subject=2" target="frame_div">科目二打卡</a></dd>
					<dd><a href="${pageContext.request.contextPath}/student/path/FaceSignin?subject=3" target="frame_div">科目三打卡</a></dd>
					<c:choose>
						<c:when test="${student.identity_state == 0}">
							<dd><a href="${pageContext.request.contextPath}/student/path/FaceImport" target="frame_div">人脸信息录入</a></dd>
						</c:when>
					</c:choose>

				</dl>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;">模拟考试</a>
				<dl class="layui-nav-child">

					<dd style="cursor: pointer" onclick="getStudentState(1)"><a>科目一</a></dd>

					<dd style="cursor: pointer" onclick="getStudentState(4)"><a>科目四</a></dd>

				</dl>
			</li>

			<li class="layui-nav-item">
				<a href="javascript:;">考试信息</a>
				<dl class="layui-nav-child">
					<dd><a href="${pageContext.request.contextPath}/student/path/ExamScore" target="frame_div">考试成绩</a></dd>
					<dd><a href="${pageContext.request.contextPath}/student/path/ExamTime" target="frame_div">考试预约</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item">
				<a href="${pageContext.request.contextPath}/student/path/QueryLocation" target="frame_div">查看位置信息</a>
			</li>

			<li class="layui-nav-item">
				<a href="javascript:;">评论专区</a>
				<dl class="layui-nav-child">
					<dd><a href="${pageContext.request.contextPath}/student/path/EvaluationToCoach" target="frame_div">对教练评价</a></dd>
					<dd><a href="${pageContext.request.contextPath}/student/path/EvaluationToSchool" target="frame_div">对学校评价</a></dd>
				</dl>
			</li>

		</ul>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="javascript:;">
					<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
					${student.name}
				</a>
				<dl class="layui-nav-child">
					<dd><a href="">我的信息</a></dd>
					<dd><a href="${pageContext.request.contextPath}/student/path/UpdatePwd" target="frame_div">修改密码</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item"><a id="tag" style="cursor: pointer;">退出</a></li>
		</ul>
	</div>
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md12">
				<iframe name="frame_div" id="iframe_st" src="${pageContext.request.contextPath}/student/path/StudentInfo" style="width: 1140px;height: 500px;border: none;overflow-y: hidden;overflow-x: hidden;"></iframe>
			</div>
		</div>
	</div>
	<div id="chatWindow" style="display: none">
		<div class="top">
			<span class="Name">客服机器人小码</span>
			<div class="ope">
				<b class="iconfont marco-zuixiaohua"></b>
				<b class="iconfont marco-zuidahua changewindow"></b>
				<b class="iconfont marco-guanbi"></b>
			</div>
		</div>
		<div class="body">
			<div class="msglist">
				<ul>
					<li class="clfix"><span class="fl robot triangle-left">您好！欢迎来到机动车驾驶员网上理论学习平台，请问有什么可以帮您？</span></li>
				</ul>
			</div>
		</div>
		<div class="foot">
			<div class="tab">
				<i class="iconfont marco-xiaoliansmiley40"></i>
				<i class="iconfont marco-tupian"></i>
				<i class="iconfont marco-wenjian"></i>
				<i class="iconfont marco-baocun"></i>
				<i class="iconfont marco-shoucang"></i>
				<i class="iconfont marco-service"></i>
			</div>
			<textarea class="question" placeholder="我想问..."></textarea>
			<div class="bottom">
				<input type="button" value="发送" />
				<span class="send_hint">Ctrl+Enter</span>
			</div>
		</div>
	</div>
	<div id="minwidow" style="display: flex">客服机器人小码（会话中...）</div>
	<script src="${pageContext.request.contextPath}/static/student/js/index.js" type="text/javascript" charset="utf-8"></script>
</div>
<script>
	//JavaScript代码区域
	layui.use('element', function(){
		var element = layui.element;

	});
</script>


</body>
</html>
