<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-2-24
  Time: 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人员统计</title>
    <%String path = request.getContextPath();%>
    <script src= "${pageContext.request.contextPath}/static/echarts.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/json2.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div style="width: 70%;height: 500px;border:3px solid #dadada;margin-left: 15%;"; id="div2"  >
    <h3 style="text-align: center">学员统计</h3>
    <div style="overflow:auto" id="div4" >
        <label style="margin-left: 60%;">学员总量为：</label><label id="lab1"></label>
    </div>
    <div style="overflow:auto; width: 800px;height: 350px" id="div6">
    </div>
</div>

</body>
<script>
    var nameArr = [];
    var valueArr = [];
    var obArr = [];
    var nu1=0;
    $(function() {
        var path = $("#path").val();
        $.ajax({
            async:true,
            method : "POST",
            url :path+"/school/Statistics",
            dataType : "text",
            success : function(msg) {
                var arr = JSON.parse(msg);
                console.log("msg=="+arr);
                for (var i = 0;i<arr.length;i++){
                    valueArr.push(arr[i]);
                    nu1  =parseInt(nu1)+ parseInt(arr[i]);
                }
                nameArr=["科目一","科目二","科目三","科目四","毕业"];
                createEchars();// 创建普通柱状图
                console.log("nu1="+nu1);
                $("#lab1").text(nu1);
            },
            error : function() {
                alert("服务器正忙");
            }
        });
    })

    function createEchars() {
        var myChart = echarts.init(document.getElementById('div6'));
        var option = {
            tooltip: {},
            xAxis: {
                data:nameArr
            },
            yAxis: {},
            series: [{
                name: '用户统计',
                type: 'bar',
                data: valueArr,
                itemStyle: {
                    normal: {
                        label: {
                            show: true, //开启显示
                            position: 'top', //在上方显示
                            textStyle: { //数值样式
                                color: 'black',
                                fontSize: 16
                            }
                        }
                    }
                },
            }]
        };
        myChart.setOption(option);
    }
</script>
</html>
