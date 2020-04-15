layui.use('carousel', function () {
	var carousel = layui.carousel;
	//建造实例
	carousel.render({
		elem: '#test1'
		, width: '100%' //设置容器宽度
		, height: '200' //设置容器高度
		// , full:'true' //是否全屏轮播,默认false
		// , arrow: 'always' //始终显示箭头和点击按钮
		// ,anim: 'updown' //切换动画方式，可从各个方向滚动
	});
});

layui.use('carousel', function () {
	var carousel = layui.carousel;
	//建造实例
	carousel.render({
		elem: '#test2'
		, width: '300' //设置容器宽度
		, height: '300' //设置容器高度
		// , full:'true' //是否全屏轮播,默认false
		// , arrow: 'always' //始终显示箭头和点击按钮
		// ,anim: 'updown' //切换动画方式，可从各个方向滚动
	});
});