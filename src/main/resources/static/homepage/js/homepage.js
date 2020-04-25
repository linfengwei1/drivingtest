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


/**

 @Name: layuiNetCompany - 大气风格的网络公司企业模版
 @Author: xuxingyu
 @Copyright: layui.com

 */

layui.define(['jquery', 'element', 'carousel', 'laypage'], function(exports){
	var $ = layui.jquery
		,element = layui.element
		,carousel = layui.carousel
		,laypage = layui.laypage;

	//轮播渲染
	carousel.render({
		elem: '#banner'
		,width: '100%'
		,height: '898px'
		,arrow: 'always'
	});

	//滚动监听
	$(window).scroll(function() {
		var scr=$(document).scrollTop();
		scr > 0 ? $(".nav").addClass('scroll') : $(".nav").removeClass('scroll');
	});

	//轮播文字
	$(function(){
		$('.banner').children('.title').addClass('active');
	})

	//导航切换
	var btn = $('.nav').find('.nav-list').children('button')
		,spa = btn.children('span')
		,ul = $('.nav').find('.nav-list').children('.layui-nav');
	btn.on('click', function(){
		if(!$(spa[0]).hasClass('spa1')){
			spa[0].className = 'spa1';
			spa[1].style.display = 'none';
			spa[2].className = 'spa3';
			$('.nav')[0].style.height = 90 + ul[0].offsetHeight + 'px';
		}else{
			spa[0].className = '';
			spa[1].style.display = 'block';
			spa[2].className = '';
			$('.nav')[0].style.height = 80 + 'px';
		}
	});

	//关于内容
	$('.main-about').find('.aboutab').children('li').each(function(index){
		$(this).on('click', function(){
			$(this).addClass('layui-this').siblings().removeClass('layui-this');
			$('.aboutab').siblings().fadeOut("fast");
			$('.aboutab').siblings().eq(index).fadeIn("");
		});
	});

	//动态分页
	laypage.render({
		elem: 'newsPage'
		,count: 50
		,theme: '#2db5a3'
		,layout: ['page', 'next']
	});

	//案例分页
	laypage.render({
		elem: 'casePage'
		,count: 50
		,theme: '#2db5a3'
		,layout: ['page', 'next']
	});

	//新闻字段截取
	$(function(){
		$(".main-news").find(".content").each(function(){
			var span = $(this).find(".detail").children("span")
				,spanTxt = span.html();
			if(document.body.clientWidth > 463){
				span.html(spanTxt);
			}else{
				span.html(span.html().substring(0, 42)+ '...')
			};
			$(window).resize(function(){
				if(document.body.clientWidth > 463){
					span.html(spanTxt);
				}else{
					span.html(span.html().substring(0, 42)+ '...')
				};
			});
		});
	});

	exports('firm', {});
});

//鼠标点击心形特效
!function(e, t, a) {
	function r() {
		for (var e = 0; e < s.length; e++) s[e].alpha <= 0 ? (t.body.removeChild(s[e].el), s.splice(e, 1)) : (s[e].y--, s[e].scale += .004, s[e].alpha -= .013, s[e].el.style.cssText = "left:" + s[e].x + "px;top:" + s[e].y + "px;opacity:" + s[e].alpha + ";transform:scale(" + s[e].scale + "," + s[e].scale + ") rotate(45deg);background:" + s[e].color + ";z-index:99999");
		requestAnimationFrame(r)
	}
	function n() {
		var t = "function" == typeof e.onclick && e.onclick;
		e.onclick = function(e) {
			t && t(),
				o(e)
		}
	}
	function o(e) {
		var a = t.createElement("div");
		a.className = "heart",
			s.push({
				el: a,
				x: e.clientX - 5,
				y: e.clientY - 5,
				scale: 1,
				alpha: 1,
				color: c()
			}),
			t.body.appendChild(a)
	}
	function i(e) {
		var a = t.createElement("style");
		a.type = "text/css";
		try {
			a.appendChild(t.createTextNode(e))
		} catch(t) {
			a.styleSheet.cssText = e
		}
		t.getElementsByTagName("head")[0].appendChild(a)
	}
	function c() {
		return "rgb(" + ~~ (255 * Math.random()) + "," + ~~ (255 * Math.random()) + "," + ~~ (255 * Math.random()) + ")"
	}
	var s = [];
	e.requestAnimationFrame = e.requestAnimationFrame || e.webkitRequestAnimationFrame || e.mozRequestAnimationFrame || e.oRequestAnimationFrame || e.msRequestAnimationFrame ||
		function(e) {
			setTimeout(e, 1e3 / 60)
		},
		i(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}"),
		n(),
		r()
} (window, document);



