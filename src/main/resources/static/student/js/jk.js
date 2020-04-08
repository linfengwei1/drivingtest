$(function () {


	//选择所有的菜单标题，绑定鼠标移动事件
	$(".menutitle").on("click",function () {
		var menuul=$(this).children("ul");//  this:是当前事件触发的元素对象  $(this)--->jq对象
		menuul.toggle(200);
	});

videojs("my-video").ready(function(){
	var myPlayer = this;
	myPlayer.play();

	this.on('ended', function() {
		alert('播放结束');
	});
});


})
