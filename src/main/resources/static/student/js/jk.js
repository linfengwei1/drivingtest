$(function () {
	layui.use(['layer'], function(){
		var layer = layui.layer;
		var path = $("#path").val();
		var studentId = $("#studentid").val();
		var subject = $("#subject").val();

		//选择所有的菜单标题，绑定鼠标移动事件
		$(".menutitle").on("click",function () {
			var menuul=$(this).children("ul");//  this:是当前事件触发的元素对象  $(this)--->jq对象
			menuul.toggle(200);
		});


		$(".s").on("click",function () {
			var id = $(this).attr("title");
			console.log(id);

			$.ajax({
				type:"Post",
				async:true,
				url:path+'/student/checkStudyAuthority',
				data:{"studentId":studentId,"vedioId":id,"subject":subject},
				dataType:"text",
				success:function (str) {
					if(str == "first")
					{
						loadVeido(id,subject);
					}else if(str == "free")
					{
						layer.msg('您已经完成本节学习内容,可自由观看视频', {icon: 6});
						loadVeidoFree(id,subject)
					}else
					{
						layer.msg('暂时无法学习该视频，请先完成当前学时', {icon: 2});
					}
				},
				error: function (str) {
					alert(str);
				}
			})


		})

	});


})





function loadVeido(id,subject) {
	layui.use(['layer'], function(){
	var studentId = $("#studentid").val();
	var layer = layui.layer;
	var path = $("#path").val();

		var data = {
			src: path+'/static/vedio/'+subject+'/'+id+'.mp4',
			type: 'video/mp4'
		};

		var vedioDiv ="<video id='my-video' class='video-js vjs-big-play-centered vjs-fluid'><p class='vjs-no-js'>To view this video please enable JavaScript, and consider upgrading to a web browser that<a href='https://videojs.com/html5-video-support/' target='_blank'>supports HTML5 video</a></p></video>";
		var oldplayer = videojs('my-video');
		oldplayer.dispose();

		$("#right").html(vedioDiv);


		var player = videojs(document.getElementById('my-video'), {
			controls: true, // 是否显示控制条
			preload: 'auto',
			autoplay: false,
			language: 'zh-CN', // 设置语言
			muted: false, // 是否静音
			inactivityTimeout: false,
			controlBar: { // 设置控制条组件


				'progressControl':false,
				'fullscreenToggle':true,
				'currentTimeDisplay':true,
				'timeDivider':true,
				'durationDisplay':true,
				'remainingTimeDisplay':false,
				volumePanel: {
					inline: false
				},

				/* 使用children的形式可以控制每一个控件的位置，以及显示与否 */
				children: [
					{name: 'playToggle'}, // 播放按钮
					// {name: 'currentTimeDisplay'}, // 当前已播放时间
					// {name: 'durationDisplay'}, // 总时间
					{ // 倍数播放
						name: 'playbackRateMenuButton',
						'playbackRates': [0.5, 1, 1.5, 2, 2.5]
					}
					// {
					// 	name: 'volumePanel', // 音量控制
					// 	inline: false, // 不使用水平方式
					// },
				]
			}

		}, function (){
			console.log('视频可以播放了',this);
		});
		player.pause();
		// player.unbind();
		player.src(data);
		player.load(data);
		player.play();
		player.on('ended', function() {
			$.ajax({
				type:"Post",
				async:true,
				url:path+'/student/addStudy1Time',
				data:{"studentId":studentId,"subject":subject},
				dataType:"text",
				success:function (str) {
					if(str == "success")
					{
						layer.msg('恭喜您已经完成本节课内容,学时加1', {icon: 6},function () {
							window.location.reload();
						});

					}else
					{
						layer.msg('服务器繁忙', {icon: 2});
					}
				},
				error: function (str) {
					layer.msg('服务器繁忙', {icon: 2});
				}
			})
		});

	// videojs("my-video").ready(function(){
	// 	var myPlayer = this;
	// 	myPlayer.play();
	//
	//
	// });

	})
}
function loadVeidoFree(id,subject) {
	layui.use(['layer'], function(){
		var studentId = $("#studentid").val();
		var layer = layui.layer;
		var path = $("#path").val();

		var data = {
			src: path+'/static/vedio/'+subject+'/'+id+'.mp4',
			type: 'video/mp4'
		};

		var vedioDiv ="<video id='my-video' class='video-js vjs-big-play-centered vjs-fluid'><p class='vjs-no-js'>To view this video please enable JavaScript, and consider upgrading to a web browser that<a href='https://videojs.com/html5-video-support/' target='_blank'>supports HTML5 video</a></p></video>";
		var oldplayer = videojs('my-video');
		oldplayer.dispose();

		$("#right").html(vedioDiv);


		var player = videojs(document.getElementById('my-video'), {
			controls: true, // 是否显示控制条
			preload: 'auto',
			autoplay: false,
			language: 'zh-CN', // 设置语言
			muted: false, // 是否静音
			inactivityTimeout: false,
			controlBar: { // 设置控制条组件


				'progressControl':true,
				'fullscreenToggle':true,
				'currentTimeDisplay':true,
				'timeDivider':true,
				'durationDisplay':true,
				'remainingTimeDisplay':false,
				volumePanel: {
					inline: false
				},

				/* 使用children的形式可以控制每一个控件的位置，以及显示与否 */
				children: [
					{name: 'playToggle'}, // 播放按钮
					// {name: 'currentTimeDisplay'}, // 当前已播放时间
					// {name: 'durationDisplay'}, // 总时间
					{ // 倍数播放
						name: 'playbackRateMenuButton',
						'playbackRates': [0.5, 1, 1.5, 2, 2.5]
					}
					// {
					// 	name: 'volumePanel', // 音量控制
					// 	inline: false, // 不使用水平方式
					// },
				]
			}

		}, function (){
			console.log('视频可以播放了',this);
		});
		player.pause();
		// player.unbind();
		player.src(data);
		player.load(data);
		player.play();




	})


}
