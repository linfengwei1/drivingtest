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
						loadVeido(id);
					}else if(str == "free")
					{
						layer.msg('恭喜您已经完成本课所有学时', {icon: 6});
						loadVeidoFree(id)
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





function loadVeido(id) {
	var path = $("#path").val();
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
		},
		sources:[ // 视频源
			{
				src: path+'/static/file/'+id+'.mp4',
				type: 'video/mp4'
			}
		]
	}, function (){
		console.log('视频可以播放了',this);
	});

	videojs("my-video").ready(function(){
		var myPlayer = this;
		myPlayer.play();

		this.on('ended', function() {
			alert('播放结束');
		});
	});
}
function loadVeidoFree(id) {
	var path = $("#path");
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
		},
		sources:[ // 视频源
			{
				src: path+'/static/file/'+id+'.mp4',
				type: 'video/mp4'
			}
		]
	}, function (){
		console.log('视频可以播放了',this);
	});

}
