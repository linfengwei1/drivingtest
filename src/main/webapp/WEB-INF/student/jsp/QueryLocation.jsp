<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>查看当前位置信息</title>
	<%String path = request.getContextPath();%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">--%>
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/static/student/js/GeoUtils.js" type="text/javascript" charset="UTF-8"></script>


	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=wL2SnI6SN49V6WoOsRzM0pWlqiYntQrP"></script>
	<!--加载鼠标绘制工具-->
	<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>

	<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
	<!--加载检索信息窗口-->
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />

</head>
<body>
<div id="allmap" style="overflow:hidden;zoom:1;position:relative;">
	<div id="map" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
</div>
<div id="result">
	<input type="hidden" id="ILng" value="118.193217">
	<input type="hidden" id="ILat" value="24.488594">

</div>

</body>
</html>
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>

<script type="text/javascript">
	// 百度地图API功能
	// 百度地图API功能
	// var map = new BMap.Map("allmap");
	// map.centerAndZoom(new BMap.Point(116.331398,39.897445),20);
	// map.enableScrollWheelZoom(true);
	// // var marker = new BMap.Marker(new BMap.Point(118.193217,24.488594));  // 创建标注
	// map.addOverlay(marker);



	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(118.193217,24.488594);
	map.enableScrollWheelZoom(true);

	map.centerAndZoom(point,20);
	var geolocation = new BMap.Geolocation();

	setInterval(function () {
		geolocation.getCurrentPosition(function(r){
			if(this.getStatus() == BMAP_STATUS_SUCCESS){
				var mk = new BMap.Marker(r.point);
				map.addOverlay(mk);
				map.panTo(r.point);
				// alert('您的位置：'+r.point.lng+','+r.point.lat);
				IsInPolygon(r.point);
			}
			else {
				alert('failed'+this.getStatus());
			}
		},{enableHighAccuracy: true})
	},2000);


	function getP() {
		var geolocation = new BMap.Geolocation();

			geolocation.getCurrentPosition(function(r){
				if(this.getStatus() == BMAP_STATUS_SUCCESS){
				 return r.point;
				}
				else {
					alert('failed'+this.getStatus());
					return null;
				}
			},{enableHighAccuracy: true})
	}


	// 用经纬度设置地图中心点
	var overlays = [];
	var overlaycomplete = function(e){
		overlays.push(e.overlay);
	};

	var styleOptions = {
		strokeColor:"red",    //边线颜色。
		fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
		strokeWeight: 3,       //边线的宽度，以像素为单位。
		strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
		fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
		strokeStyle: 'solid' //边线的样式，solid或dashed。
	}
	function clearAll() {

		for(var i = 0; i < overlays.length; i++){
			map.removeOverlay(overlays[i]);
		}
		overlays.length = 0
	}

	function getLayerInformation(){
		console.log(overlays[0].getPath());
	}
	let polygon;
	drawPolygon();//定义栅栏
	function drawPolygon(){


		let point = [
			{
				lng:"118.192793",
				lat:"24.489046"
			},
			{
				lng:"118.192532",
				lat:"24.48859"
			},
			{
				lng:"118.193376",
				lat:"24.48822"
			},
			{
				lng:"118.193632",
				lat:"24.488804"
			}
		];
		let polArry = [];
		point.forEach(item => {
			let p = new BMap.Point(item.lng,item.lat);
		polArry.push(p);
	});
		polygon = new BMap.Polygon(polArry,styleOptions);
		map.addOverlay(polygon);
	}

	function IsInPolygon(point){
		layui.use(['layer'], function () {
			var layer = layui.layer;
			// let lng = $("#ILng").val();
			// let lat = $("#ILat").val();




			// let point = new BMap.Point(lng, lat);
			let marker = new BMap.Marker(point);



			map.addOverlay(marker);
			if (BMapLib.GeoUtils.isPointInPolygon(point, polygon)) {
				// layer.msg('当前处于驾校范围内', {icon: 6});
			} else {
				layer.msg('您已经超出驾校范围', {icon: 5});
			}
		})
	}
	function getLayerInformation(){
		console.log(overlays[0].getPath());
	}




</script>