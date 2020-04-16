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

layui.use([], function () {
	var $ = layui.jquery;
	//演示动画开始
	$('.site-doc-icon .layui-anim').on('click', function(){
		var othis = $(this), anim = othis.data('anim');

		//停止循环
		if(othis.hasClass('layui-anim-loop')){
			return othis.removeClass(anim);
		}
		othis.removeClass(anim);
		setTimeout(function(){
			othis.addClass(anim);
		});
		//恢复渐隐
		if(anim === 'layui-anim-fadeout'){
			setTimeout(function(){
				othis.removeClass(anim);
			}, 1300);
		}
	});
	//演示动画结束
});