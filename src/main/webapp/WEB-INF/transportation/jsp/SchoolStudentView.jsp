<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/16
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学校统计</title>
    <%String path = request.getContextPath();%>
    <script src= "${pageContext.request.contextPath}/static/echarts.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/json2.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div style="width: 70%;height: 500px;border:3px solid #dadada;margin-left: 15%;margin-top: 100px;"; id="div2"  >
    <h3 style="text-align: center">统计数据</h3>
    <div style="overflow:auto; width: 800px;height: 350px" id="div6">
    </div>
</div>

</body>
<script>
    var school_name=[];
    var student=[];
    var coach=[];
    var coachCar=[];
    var nu1=0;
    $(function() {
        var path = $("#path").val();
        $.ajax({
            async:true,
            method : "POST",
            url :path+"/TM/schoolStudentView",
            dataType : "text",
            success : function(msg) {
                var arr =[];
                arr = JSON.parse(msg);

                school_name=arr["school_name"];
                student=arr["studentNum"];
                coach=arr["coachNum"];
                coachCar=arr["coachCarNum"];
                console.log("msg=="+msg);

                createEchars();// 创建普通柱状图
            }
        });
    })

    function createEchars() {
        var myChart = echarts.init(document.getElementById('div6'));
        var option = {
            color: [ '#006699', '#4cabce', '#e5323e'],
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                data: [ '学员', '教练', '教练车']
            },
            xAxis: [
                {
                    type: 'category',
                    axisTick: {show: false},
                    data: school_name
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '学员',
                    type: 'bar',
                    barGap: 0,
                    data: student
                },
                {
                    name: '教练',
                    type: 'bar',
                    data: coach
                },
                {
                    name: '教练车',
                    type: 'bar',
                    data: coachCar
                }
            ]
        };
        myChart.setOption(option);
    }
</script>
</html>
