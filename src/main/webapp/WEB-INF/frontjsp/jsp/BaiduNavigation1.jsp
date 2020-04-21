<%--
  Created by IntelliJ IDEA.
  User: HUAWEI
  Date: 2020/4/17
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<span style="font-size:14px;"><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%--<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />--%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
<meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
<title>百度地图API自定义地图</title>
    <!--引用百度地图API-->
<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
   <script src="http://api.map.baidu.com/api?v=1.4" type="text/javascript"></script><%--这句是从BaiduNavigation.jsp拷贝过来的，没有这句话地图出不来--%>
    <%--    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=你的AK密码"></script>--%>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=dc6nLZsjs4UaISyazpoKjxQYknUDWuT0"></script>
</head>

<body>
  <div style="margin-left:670px;margin-top:60px;"><span style="font-size:30px;">地图信息</span></div>
  <!--百度地图容器-->
  <div style="width:697px;height:550px;border:#ccc solid 1px;margin:auto;padding:0px;margin-top:40px;" id="dituContent"></div>
</body>
<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
    }

    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        // var point = new BMap.Point(103.833724,36.065339);//定义一个中心点坐标
        var point = new BMap.Point(118.833724,24.065339);//定义一个中心点坐标
        map.centerAndZoom(point,18);//设定地图的中心点和坐标并将地图显示在地图容器中
        //设置弹出框
        var marker = new BMap.Marker(point);  // 创建标注
        map.addOverlay(marker);              // 将标注添加到地图中

        var opts = {
            width : 200,     // 信息窗口宽度
            height: 100,     // 信息窗口高度
            title : "实时数据" , // 信息窗口标题
        }
        var infoWindow = new BMap.InfoWindow("666666666666666", opts);  // 创建信息窗口对象

        marker.addEventListener("mouseover", function(){
            map.openInfoWindow(infoWindow,point); //开启信息窗口
        });
        marker.addEventListener("mouseout", function(){
            map.closeInfoWindow(infoWindow,point); //开启信息窗口
        });
        window.map = map;//将map变量存储在全局
    }

    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }

    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
        var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(ctrl_nav);

        //向地图中添加比例尺控件
        var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
        map.addControl(ctrl_sca);
    }
    //鼠标单击事件函数
    function showInfo(e){
        window.location.href="http://www.baidu.com";
    }

    initMap();//创建和初始化地图
    //鼠标单击事件
    map.addEventListener("click", showInfo);


</script>
</html></span>
