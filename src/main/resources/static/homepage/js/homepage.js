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

// var dataAxis = ['点', '击', '柱', '子', '或', '者', '两', '指', '在', '触', '屏', '上', '滑', '动', '能', '够', '自', '动', '缩', '放'];
// var data = [220, 182, 191, 234, 290, 330, 310, 123, 442, 321, 90, 149, 210, 122, 133, 334, 198, 123, 125, 220];
// var yMax = 500;
// var dataShadow = [];
//
// for (var i = 0; i < data.length; i++) {
// 	dataShadow.push(yMax);
// }
//
// option = {
// 	title: {
// 		text: '特性示例：渐变色 阴影 点击缩放',
// 		subtext: 'Feature Sample: Gradient Color, Shadow, Click Zoom'
// 	},
// 	xAxis: {
// 		data: dataAxis,
// 		axisLabel: {
// 			inside: true,
// 			textStyle: {
// 				color: '#fff'
// 			}
// 		},
// 		axisTick: {
// 			show: false
// 		},
// 		axisLine: {
// 			show: false
// 		},
// 		z: 10
// 	},
// 	yAxis: {
// 		axisLine: {
// 			show: false
// 		},
// 		axisTick: {
// 			show: false
// 		},
// 		axisLabel: {
// 			textStyle: {
// 				color: '#999'
// 			}
// 		}
// 	},
// 	dataZoom: [
// 		{
// 			type: 'inside'
// 		}
// 	],
// 	series: [
// 		{ // For shadow
// 			type: 'bar',
// 			itemStyle: {
// 				color: 'rgba(0,0,0,0.05)'
// 			},
// 			barGap: '-100%',
// 			barCategoryGap: '40%',
// 			data: dataShadow,
// 			animation: false
// 		},
// 		{
// 			type: 'bar',
// 			itemStyle: {
// 				color: new echarts.graphic.LinearGradient(
// 					0, 0, 0, 1,
// 					[
// 						{offset: 0, color: '#83bff6'},
// 						{offset: 0.5, color: '#188df0'},
// 						{offset: 1, color: '#188df0'}
// 					]
// 				)
// 			},
// 			emphasis: {
// 				itemStyle: {
// 					color: new echarts.graphic.LinearGradient(
// 						0, 0, 0, 1,
// 						[
// 							{offset: 0, color: '#2378f7'},
// 							{offset: 0.7, color: '#2378f7'},
// 							{offset: 1, color: '#83bff6'}
// 						]
// 					)
// 				}
// 			},
// 			data: data
// 		}
// 	]
// };
//
// // Enable data zoom when user click bar.
// var zoomSize = 6;
// myChart.on('click', function (params) {
// 	console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
// 	myChart.dispatchAction({
// 		type: 'dataZoom',
// 		startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
// 		endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
// 	});
// });



