<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--	<title>学员登录</title>--%>
<%--	<%String path = request.getContextPath();%>--%>

<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">--%>
<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">--%>
<%--	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>--%>
<%--	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>--%>
<%--	<script src="${pageContext.request.contextPath}/static/student/js/jk.js" type="text/javascript" charset="UTF-8"></script>--%>
<%--	<script src="${pageContext.request.contextPath}/static/student/js/12.js" type="text/javascript" charset="UTF-8"></script>--%>


<%--	<style>--%>
<%--		body {--%>
<%--			background-color: #191919--%>
<%--		}--%>
<%--		.m {--%>
<%--			width: 960px;--%>
<%--			height: 400px;--%>
<%--			margin-left: auto;--%>
<%--			margin-right: auto;--%>
<%--			margin-top: 100px;--%>
<%--		}--%>
<%--		.video-js{ /* 给.video-js设置字体大小以统一各浏览器样式表现，因为video.js采用的是em单位 */--%>
<%--			font-size: 14px;--%>
<%--		}--%>
<%--		.video-js button{--%>
<%--			outline: none;--%>
<%--		}--%>
<%--		.video-js.vjs-fluid,--%>
<%--		.video-js.vjs-16-9,--%>
<%--		.video-js.vjs-4-3{ /* 视频占满容器高度 */--%>
<%--			height: 100%;--%>
<%--			background-color: #161616;--%>
<%--		}--%>
<%--		.vjs-poster{--%>
<%--			background-color: #161616;--%>
<%--		}--%>
<%--		.video-js .vjs-big-play-button{ /* 中间大的播放按钮 */--%>
<%--			font-size: 2.5em;--%>
<%--			line-height: 2.3em;--%>
<%--			height: 2.5em;--%>
<%--			width: 2.5em;--%>
<%--			-webkit-border-radius: 2.5em;--%>
<%--			-moz-border-radius: 2.5em;--%>
<%--			border-radius: 2.5em;--%>
<%--			background-color: rgba(115,133,159,.5);--%>
<%--			border-width: 0.12em;--%>
<%--			margin-top: -1.25em;--%>
<%--			margin-left: -1.75em;--%>
<%--		}--%>
<%--		.video-js.vjs-paused .vjs-big-play-button{ /* 视频暂停时显示播放按钮 */--%>
<%--			display: block;--%>
<%--		}--%>
<%--		.video-js.vjs-error .vjs-big-play-button{ /* 视频加载出错时隐藏播放按钮 */--%>
<%--			display: none;--%>
<%--		}--%>
<%--		.vjs-loading-spinner { /* 加载圆圈 */--%>
<%--			font-size: 2.5em;--%>
<%--			width: 2em;--%>
<%--			height: 2em;--%>
<%--			border-radius: 1em;--%>
<%--			margin-top: -1em;--%>
<%--			margin-left: -1.5em;--%>
<%--		}--%>
<%--		.video-js .vjs-control-bar{ /* 控制条默认显示 */--%>
<%--			display: flex;--%>
<%--		}--%>
<%--		.video-js .vjs-time-control{display:block;}--%>
<%--		.video-js .vjs-remaining-time{display: none;}--%>

<%--		.vjs-button > .vjs-icon-placeholder:before{ /* 控制条所有图标，图标字体大小最好使用px单位，如果使用em，各浏览器表现可能会不大一样 */--%>
<%--			font-size: 22px;--%>
<%--			line-height: 1.9;--%>
<%--		}--%>
<%--		.video-js .vjs-playback-rate .vjs-playback-rate-value{--%>
<%--			line-height: 2.4;--%>
<%--			font-size: 18px;--%>
<%--		}--%>
<%--		/* 进度条背景色 */--%>
<%--		.video-js .vjs-play-progress{--%>
<%--			color: #ffb845;--%>
<%--			background-color: #ffb845;--%>
<%--		}--%>
<%--		.video-js .vjs-progress-control .vjs-mouse-display{--%>
<%--			background-color: #ffb845;--%>
<%--		}--%>
<%--		.vjs-mouse-display .vjs-time-tooltip{--%>
<%--			padding-bottom: 6px;--%>
<%--			background-color: #ffb845;--%>
<%--		}--%>
<%--		.video-js .vjs-play-progress .vjs-time-tooltip{--%>
<%--			display: none!important;--%>
<%--		}--%>
<%--		.video-js .vjs-time-control{display:block;}--%>
<%--		.video-js .vjs-remaining-time{display: none;}--%>
<%--		.video-js .vjs-big-play-button{--%>
<%--			font-size: 2.5em;--%>
<%--			line-height: 2.3em;--%>
<%--			height: 2.5em;--%>
<%--			width: 2.5em;--%>
<%--			-webkit-border-radius: 2.5em;--%>
<%--			-moz-border-radius: 2.5em;--%>
<%--			border-radius: 2.5em;--%>
<%--			background-color: #73859f;--%>
<%--			background-color: rgba(115,133,159,.5);--%>
<%--			border-width: 0.15em;--%>
<%--			margin-top: -1.25em;--%>
<%--			margin-left: -1.75em;--%>
<%--		}--%>
<%--		/* 中间的播放箭头 */--%>
<%--		.vjs-big-play-button .vjs-icon-placeholder {--%>
<%--			font-size: 1.63em;--%>
<%--		}--%>
<%--		/* 加载圆圈 */--%>
<%--		.vjs-loading-spinner {--%>
<%--			font-size: 2.5em;--%>
<%--			width: 2em;--%>
<%--			height: 2em;--%>
<%--			border-radius: 1em;--%>
<%--			margin-top: -1em;--%>
<%--			margin-left: -1.5em;--%>
<%--		}--%>
<%--	</style>--%>
<%--</head>--%>
<%--<body class="layui-layout-body">--%>
<%--<div class="lp_bd">--%>
<%--	<div class="div960">--%>
<%--		<div class="fra_title lp_menu">--%>
<%--			<a class="on" href="javascript:void(0)" onclick="LoadMenu(658)">第一部分：理论学习</a>--%>
<%--		</div>--%>
<%--		<div class="df_l">--%>
<%--			<div  class="menutitle">--%>
<%--				<h3 style = "text-align: center">1法律、法规及道路交通信号</h3>--%>
<%--				<ul class="left_div_menu" style="display: none">--%>
<%--					<li title="">1.1机动车驾驶证申领与使用</li>--%>
<%--					<li title="">1.2道路交通信号</li>--%>
<%--				</ul>--%>
<%--			</div>--%>
<%--			<div  class="menutitle">--%>
<%--				<h3 style = "text-align: center">2机动车基本知识</h3>--%>
<%--				<ul class="left_div_menu" style="display: none">--%>
<%--					<li title="">2.1车辆结构常识</li>--%>
<%--					<li title="">2.2车辆主要安全装置</li>--%>
<%--				</ul>--%>
<%--			</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="df_r">--%>
<%--			<!--视频内容-->--%>
<%--			<div class="lp_sp" id="lp_sp">--%>

<%--				<video id="my-video" class="video-js vjs-big-play-centered" controls preload="auto" width="960" height="400"--%>
<%--				       poster="m.jpg" data-setup="{}">--%>
<%--					<source src="${pageContext.request.contextPath}/static/student/vedio/1.mp4" type="video/mp4">--%>
<%--					<p class="vjs-no-js"> To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a> </p>--%>
<%--				</video>--%>
<%--				<script type="text/javascript">--%>
<%--					//设置中文--%>
<%--					videojs.addLanguage('zh-CN', {--%>
<%--						"Play": "播放",--%>
<%--						"Pause": "暂停",--%>
<%--						"Current Time": "当前时间",--%>
<%--						"Duration": "时长",--%>
<%--						"Remaining Time": "剩余时间",--%>
<%--						"Stream Type": "媒体流类型",--%>
<%--						"LIVE": "直播",--%>
<%--						"Loaded": "加载完毕",--%>
<%--						"Progress": "进度",--%>
<%--						"Fullscreen": "全屏",--%>
<%--						"Non-Fullscreen": "退出全屏",--%>
<%--						"Mute": "静音",--%>
<%--						"Unmute": "取消静音",--%>
<%--						"Playback Rate": "播放速度",--%>
<%--						"Subtitles": "字幕",--%>
<%--						"subtitles off": "关闭字幕",--%>
<%--						"Captions": "内嵌字幕",--%>
<%--						"captions off": "关闭内嵌字幕",--%>
<%--						"Chapters": "节目段落",--%>
<%--						"Close Modal Dialog": "关闭弹窗",--%>
<%--						"Descriptions": "描述",--%>
<%--						"descriptions off": "关闭描述",--%>
<%--						"Audio Track": "音轨",--%>
<%--						"You aborted the media playback": "视频播放被终止",--%>
<%--						"A network error caused the media download to fail part-way.": "网络错误导致视频下载中途失败。",--%>
<%--						"The media could not be loaded, either because the server or network failed or because the format is not supported.": "视频因格式不支持或者服务器或网络的问题无法加载。",--%>
<%--						"The media playback was aborted due to a corruption problem or because the media used features your browser did not support.": "由于视频文件损坏或是该视频使用了你的浏览器不支持的功能，播放终止。",--%>
<%--						"No compatible source was found for this media.": "无法找到此视频兼容的源。",--%>
<%--						"The media is encrypted and we do not have the keys to decrypt it.": "视频已加密，无法解密。",--%>
<%--						"Play Video": "播放视频",--%>
<%--						"Close": "关闭",--%>
<%--						"Modal Window": "弹窗",--%>
<%--						"This is a modal window": "这是一个弹窗",--%>
<%--						"This modal can be closed by pressing the Escape key or activating the close button.": "可以按ESC按键或启用关闭按钮来关闭此弹窗。",--%>
<%--						", opens captions settings dialog": ", 开启标题设置弹窗",--%>
<%--						", opens subtitles settings dialog": ", 开启字幕设置弹窗",--%>
<%--						", opens descriptions settings dialog": ", 开启描述设置弹窗",--%>
<%--						", selected": ", 选择",--%>
<%--						"captions settings": "字幕设定",--%>
<%--						"Audio Player": "音频播放器",--%>
<%--						"Video Player": "视频播放器",--%>
<%--						"Replay": "重播",--%>
<%--						"Progress Bar": "进度小节",--%>
<%--						"Volume Level": "音量",--%>
<%--						"subtitles settings": "字幕设定",--%>
<%--						"descriptions settings": "描述设定",--%>
<%--						"Text": "文字",--%>
<%--						"White": "白",--%>
<%--						"Black": "黑",--%>
<%--						"Red": "红",--%>
<%--						"Green": "绿",--%>
<%--						"Blue": "蓝",--%>
<%--						"Yellow": "黄",--%>
<%--						"Magenta": "紫红",--%>
<%--						"Cyan": "青",--%>
<%--						"Background": "背景",--%>
<%--						"Window": "视窗",--%>
<%--						"Transparent": "透明",--%>
<%--						"Semi-Transparent": "半透明",--%>
<%--						"Opaque": "不透明",--%>
<%--						"Font Size": "字体尺寸",--%>
<%--						"Text Edge Style": "字体边缘样式",--%>
<%--						"None": "无",--%>
<%--						"Raised": "浮雕",--%>
<%--						"Depressed": "压低",--%>
<%--						"Uniform": "均匀",--%>
<%--						"Dropshadow": "下阴影",--%>
<%--						"Font Family": "字体库",--%>
<%--						"Proportional Sans-Serif": "比例无细体",--%>
<%--						"Monospace Sans-Serif": "单间隔无细体",--%>
<%--						"Proportional Serif": "比例细体",--%>
<%--						"Monospace Serif": "单间隔细体",--%>
<%--						"Casual": "舒适",--%>
<%--						"Script": "手写体",--%>
<%--						"Small Caps": "小型大写字体",--%>
<%--						"Reset": "重启",--%>
<%--						"restore all settings to the default values": "恢复全部设定至预设值",--%>
<%--						"Done": "完成",--%>
<%--						"Caption Settings Dialog": "字幕设定视窗",--%>
<%--						"Beginning of dialog window. Escape will cancel and close the window.": "开始对话视窗。离开会取消及关闭视窗",--%>
<%--						"End of dialog window.": "结束对话视窗"--%>
<%--					});--%>
<%--					var myPlayer = videojs('my-video', {controlBar:{--%>
<%--							'progressControl':false,--%>
<%--							'fullscreenToggle':false--%>
<%--						}}, function() {--%>
<%--						console.log('播放器初始化完成');--%>
<%--					});--%>
<%--					videojs("my-video").ready(function(){--%>
<%--						var myPlayer = this;--%>
<%--						myPlayer.play();--%>

<%--						this.on('ended', function() {--%>
<%--							alert('播放结束');--%>
<%--						});--%>
<%--					});--%>
<%--				</script>--%>

<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/12
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Video.js 7.4.1</title>

	<%String path = request.getContextPath();%>

	<link href="${pageContext.request.contextPath}/static/student/css/vediostudy.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/static/student/css/video-js.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/static/student/js/jk.js" type="text/javascript" charset="UTF-8"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="${pageContext.request.contextPath}/static/student/js/12.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">

	<style>
		.m {
			width: 600px;
			height: 400px;
			margin-left: auto;
			margin-right: auto;
			margin-top: 100px;
		}
		.video-js{ /* 给.video-js设置字体大小以统一各浏览器样式表现，因为video.js采用的是em单位 */
			font-size: 14px;
		}
		.video-js button{
			outline: none;
		}
		.video-js.vjs-fluid,
		.video-js.vjs-16-9,
		.video-js.vjs-4-3{ /* 视频占满容器高度 */
			height: 100%;
			background-color: #161616;
		}
		.vjs-poster{
			background-color: #161616;
		}
		.video-js .vjs-big-play-button{ /* 中间大的播放按钮 */
			font-size: 2.5em;
			line-height: 2.3em;
			height: 2.5em;
			width: 2.5em;
			-webkit-border-radius: 2.5em;
			-moz-border-radius: 2.5em;
			border-radius: 2.5em;
			background-color: rgba(115,133,159,.5);
			border-width: 0.12em;
			margin-top: -1.25em;
			margin-left: -1.75em;
		}
		.video-js.vjs-paused .vjs-big-play-button{ /* 视频暂停时显示播放按钮 */
			display: block;
		}
		.video-js.vjs-error .vjs-big-play-button{ /* 视频加载出错时隐藏播放按钮 */
			display: none;
		}
		.vjs-loading-spinner { /* 加载圆圈 */
			font-size: 2.5em;
			width: 2em;
			height: 2em;
			border-radius: 1em;
			margin-top: -1em;
			margin-left: -1.5em;
		}
		.video-js .vjs-control-bar{ /* 控制条默认显示 */
			display: flex;
		}
		.video-js .vjs-time-control{display:block;}
		.video-js .vjs-remaining-time{display: none;}

		.vjs-button > .vjs-icon-placeholder:before{ /* 控制条所有图标，图标字体大小最好使用px单位，如果使用em，各浏览器表现可能会不大一样 */
			font-size: 22px;
			line-height: 1.9;
		}
		.video-js .vjs-playback-rate .vjs-playback-rate-value{
			line-height: 2.4;
			font-size: 18px;
		}
		/* 进度条背景色 */
		.video-js .vjs-play-progress{
			color: #ffb845;
			background-color: #ffb845;
		}
		.video-js .vjs-progress-control .vjs-mouse-display{
			background-color: #ffb845;
		}
		.vjs-mouse-display .vjs-time-tooltip{
			padding-bottom: 6px;
			background-color: #ffb845;
		}
		.video-js .vjs-play-progress .vjs-time-tooltip{
			display: none!important;
		}
		.video-js .vjs-time-control{display:block;}
		.video-js .vjs-remaining-time{display: none;}
		.video-js .vjs-big-play-button{
			font-size: 2.5em;
			line-height: 2.3em;
			height: 2.5em;
			width: 2.5em;
			-webkit-border-radius: 2.5em;
			-moz-border-radius: 2.5em;
			border-radius: 2.5em;
			background-color: #73859f;
			background-color: rgba(115,133,159,.5);
			border-width: 0.15em;
			margin-top: -1.25em;
			margin-left: -1.75em;
		}
		/* 中间的播放箭头 */
		.vjs-big-play-button .vjs-icon-placeholder {
			font-size: 1.63em;
		}
		/* 加载圆圈 */
		.vjs-loading-spinner {
			font-size: 2.5em;
			width: 2em;
			height: 2em;
			border-radius: 1em;
			margin-top: -1em;
			margin-left: -1.5em;
		}
		.fra_title {
			width: 100%;
			border-bottom: #ddd solid 1px;
			height: 40px;
			position: relative;
			z-index: 1;
		}
		.fra_title span {
			float: left;
			line-height: 40px;
			height: 40px;
			border-bottom: #2689bf solid 1px;
			color: #2689bf;
		}

	</style>
</head>

<body>

<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<input type="hidden" id="studentid" value="${student.id}">
<input type="hidden" id="subject" value="1">
<div class="fra_title"><span><b class="backbg ico_time"></b>科目一理论学习<a href="javascript:void(0)"></a></span></div>
<div class="layui-container">
	<div class="left">
		<div id="left_div">
			<div  class="menutitle">
				<h3 style = "text-align: left">机动车驾驶基础知识</h3>
				<ul class="left_div_menu" style="display: none">
					<li class="s" title="1">1.1机动车驾驶证申领与使用</li>
					<li class="s" title="2">1.2道路交通信号</li>
					<li class="s" title="3">1.3道路安全指示牌</li>
				</ul>
			</div>
<%--			<div  class="menutitle">--%>
<%--				<h3 style = "text-align: center">2机动车基本知识</h3>--%>
<%--				<ul class="left_div_menu" style="display: none">--%>
<%--					<li title="">2.1车辆结构常识</li>--%>
<%--					<li title="">2.2车辆主要安全装置</li>--%>
<%--				</ul>--%>
<%--			</div>--%>
		</div>
	</div>
	<div id="right">
	<video id="my-video" class="video-js vjs-big-play-centered vjs-fluid">
		<p class="vjs-no-js">
			To view this video please enable JavaScript, and consider upgrading to a
			web browser that
			<a href="https://videojs.com/html5-video-support/" target="_blank">
				supports HTML5 video
			</a>
		</p>
	</video>
	</div>
</div>

<%--<script type="text/javascript">--%>
<%--	var myPlayer = videojs('my-video', {controlBar:{--%>
<%--			'progressControl':false--%>
<%--		}}, function() {--%>
<%--		console.log('播放器初始化完成');--%>
<%--	});--%>
<%--	videojs("my-video").ready(function(){--%>
<%--		var myPlayer = this;--%>
<%--		myPlayer.play();--%>

<%--		this.on('ended', function() {--%>
<%--			alert('播放结束');--%>
<%--		});--%>
<%--	});--%>
<%--</script>--%>


</body>
</html>
