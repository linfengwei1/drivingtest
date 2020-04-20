<%--
  Created by IntelliJ IDEA.
  User: HUAWEI
  Date: 2020/4/17
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
    <!-- 引入百度地图的API -->
    <script src="http://api.map.baidu.com/api?v=1.4" type="text/javascript"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=dc6nLZsjs4UaISyazpoKjxQYknUDWuT0"></script>

    <title>百度地图</title>
    <!-- 地图显示的样式 -->
    <style type="text/css">
        html{height:100%}
        body{height:100%;margin:0px;padding:0px}
        #container{height:100%}
    </style>
    <!-- 地图显示的初始化 -->
    <script type="text/javascript">

        var map = new BMap.Map("container");        //在container容器中创建一个地图,参数container为div的id属性;
        var point = new BMap.Point(120.2,30.25);    //创建点坐标
        map.centerAndZoom(point, 14);                //初始化地图，设置中心点坐标和地图级别
        map.enableScrollWheelZoom();                //激活滚轮调整大小功能
        map.addControl(new BMap.NavigationControl());    //添加控件：缩放地图的控件，默认在左上角；
        map.addControl(new BMap.MapTypeControl());        //添加控件：地图类型控件，默认在右上方；
        map.addControl(new BMap.ScaleControl());        //添加控件：地图显示比例的控件，默认在左下方；
        map.addControl(new BMap.OverviewMapControl());  //添加控件：地图的缩略图的控件，默认在右下方； TrafficControl
        var search = new BMap.LocalSearch("中国", {
            onSearchComplete: function(result){
                if (search.getStatus() == BMAP_STATUS_SUCCESS){
                    var res = result.getPoi(0);
                    var point = res.point;
                    map.centerAndZoom(point, 11);
                }

            },renderOptions: {  //结果呈现设置，
                map: map,
                autoViewport: true,
                selectFirstResult: true
            } ,onInfoHtmlSet:function(poi,html){
                // alert(html.innerHTML)
            }

        });

        //设置城市的函数
        function setCity(){
            search.search(document.getElementById("cityName").value);
        }
        //初始化显示的城市
        search.search(document.getElementById("cityName").value);
    </script>
</head>

<body>

<input type="text" id="cityName" value="枣庄"/>
<input type="button" onclick="setCity()" value="查找" />
<div id="container" style="width:1024px;height:600px;"></div>

</body>

</html>

