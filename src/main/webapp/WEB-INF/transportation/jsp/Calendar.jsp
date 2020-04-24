<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/14
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" ></script>
    <script src="${pageContext.request.contextPath}/static/transportation/fullCalender/lib/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/transportation/fullCalender/lib/jquery-ui.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/transportation/fullCalender/fullcalendar.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/static/transportation/fullCalender/lib/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/transportation/fullCalender/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/transportation/fullCalender/locale-all.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>
<div id='calendar'></div>
<div id="caidan" title="请输入安排考试日程" hidden="hidden">
    <form class="form-inline">
        <p>
            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：</label>
            <input type="text" class="sear datepicker" id="starttime" disabled="disabled">
            <span>至</span>
            <input type="text" class="sear datepicker" id="endtime">
        </p>
        <p>
            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;安排驾校：</label>
            <!--医生列表通过ajax获取-->
            <select name="groups" id="groups">
                <option value="驾校1">驾校1</option>
                <option value="驾校2">驾校2</option>
                <option value="驾校3">驾校3</option>
                <option value="驾校4">驾校4</option>
            </select>
        </p>
    </form>
</div>

<div id="sameday" title="日程明细" hidden="hidden" >
    <form class="form-inline">
        <p>
            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;驾校：</label>
            <label id="school"></label>
        </p>
        <p>
        <fieldset class="likes">
            <legend>考试时段：</legend>

            <label >8：00~12：00 至 14：00~17：00</label>

        </fieldset>
        </p>
    </form>
</div>


</body>


<script>
    $(document).ready(function () {

        //JavaScript代码区域
        layui.use(['table','laydate','form','jquery'], function(){
            var table = layui.table,
                laydate=layui.laydate,
                form=layui.form;



        //加载日历
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
            },
            monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
            dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
            today: ["今天"],
            buttonText: {
                today: '今天',
                month: '月',
                week: '周',
                day: '日',
                prev: '<',
                next: '>'
            },
            eventLimit: true, // 事件太多显示更多
            eventTimeFormat: "HH:mm",
            defaultDate: new Date(),
            editable: false,
            droppable: true, // this allows things to be dropped onto the calendar
            validRange : {
                // validRange 为控制锁死某些日期 当前日期的下一天即为明天开始可用 之前的日期全部锁死 官网原版写法 为 start
                // end 设定开始和结束日期
                start : new Date(new Date().getTime() + (1000 * 60 * 60 * 24))
            },
            events: function (begin, end, timezone, callback) {//加载事件
                // var json = new Array();
                // json = GetEvents(begin, end);//获取事件
                // callback(json);//回调函数
            },
            dayClick: function (date, jsEvent, view) {//点击日历空白区域


                layer.open({
                    type: 1,
                    title: '查看用户',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['400px', '500px'],
                    content: $("#caidan").html,
                    yes: function (index, layero) {

                    }
                });


            },
            eventClick: function (calEvent, jsEvent, view) {//点击事件
                //clearData();
                //fullCalendarEdit(calEvent.id);
            }


        });
    });

    });
    //刷新日历
    function refreshEvent() {
        $('#calendar').fullCalendar('refetchEvents');
    }

    //重构Date对象下的时间格式
    Date.prototype.Format = function(format){

        var o = {

            "M+" : this.getMonth()+1, //month

            "d+" : this.getDate(), //day

            "h+" : this.getHours(), //hour

            "m+" : this.getMinutes(), //minute

            "s+" : this.getSeconds(), //second

            "q+" : Math.floor((this.getMonth()+3)/3), //quarter

            "S" : this.getMilliseconds() //millisecond

        };

        if(/(y+)/.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        }
        for(var k in o) {
            if(new RegExp("("+ k +")").test(format)) {
                format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
            }
        }
        return format;
    };



    //将数据库的时间戳转成 *年*月*日 字符串
    function getDate(DBTime){
        var date = new Date(DBTime);
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        var dateStr;
        if(month<10&&day<10){
            dateStr = year+"-0"+month+"-0"+day;
        }else if(month<10&&day>=10){
            dateStr = year+"-0"+month+"-"+day;
        }else if(month>=10&&day<10){
            dateStr = year+"-"+month+"-0"+day;
        }else if(month>=10&&day>=10){
            dateStr = year+"-"+month+"-"+day;
        }
        return dateStr;
    }
    //将数据库的时间戳转成 *时*分 字符串
    function getTime(DBTime){
        var time = DBTime.substring(0,2)+"-"+DBTime.substring(3,5);
        return time;
    }


</script>

<style>
    body {
        margin: 40px 10px;
        padding: 0;
        ont-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        ont-size: 14px;
    }
    #calendar {
        max-width: 900px;
        margin: 0 auto;
    }
</style>

</html>
