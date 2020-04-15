<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fullcalendar日历插件使用案例</title>

<link rel="shortcut icon" href=<%=path+"/image/favicon.ico"%> >
<link rel="stylesheet" type="text/css" href=<%=path+"/static/transportation/fullCalender/css/jquery-ui.min.css" %>>
<link rel="stylesheet" type="text/css" href=<%=path+"/static/transportation/fullCalender/css/jquery-ui.structure.min.css" %>>
<link rel="stylesheet" type="text/css" href=<%=path+"/static/transportation/fullCalender/css/jquery-ui.theme.min.css" %>>
<link rel="stylesheet" type="text/css" href=<%=path+"/static/transportation/fullCalender/css/core/main.css" %>>
<link rel="stylesheet" type="text/css" href=<%=path+"/static/transportation/fullCalender/css/daygrid/main.css" %>>
<link rel="stylesheet" type="text/css" href=<%=path+"/static/transportation/fullCalender/css/demostyle.css" %>>
<script type="text/javascript" src=<%=path+"/static/transportation/fullCalender/js/jquery.js" %>></script>
<script type="text/javascript" src=<%=path+"/static/transportation/fullCalender/js/jquery-ui.min.js" %>></script>
<script type="text/javascript" src=<%=path+"/static/transportation/fullCalender/js/core/main.js" %>></script>
<script type="text/javascript" src=<%=path+"/static/transportation/fullCalender/js/daygrid/main.js" %>></script>
<script type="text/javascript" src=<%=path+"/static/transportation/fullCalender/js/interaction/main.js" %>></script>
<%--<script type="text/javascript" src=<%=path+"/static/transportation/fullCalender/js/demo.js" %>></script>--%>
</head>
<body>
	<div id='calendar'></div>
	<div id="caidan" title="请输入排班日程" hidden="hidden">
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
	var calendarEl;
	var calendar;
	$(function() {
		// 日历插件初始化
		calendarEl = document.getElementById('calendar');
		// calendarEl=$("#calendar");
		calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid' ],
			defaultDate : new Date(),
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			navLinks : false, // 开启单击天/周名称导航视图
			selectable : true,
			locale: "zh-cn",//语言设置，需要引用语言包
			selectMirror : true,
			select : function(arg) {
				$("#starttime").val(new Date(arg.start).format('yyyy-MM-dd'));// 使用时间格式转换时间填入Dialog
				// $("#endtime").val(new Date(arg.end).format('yyyy-MM-dd'));
				$("#caidan").dialog("open");
				calendar.unselect();
			},
			eventClick : function(info) {

				//document.getElementById("school").title=$('#groups option:selected').val();
				$("#school").text($('#groups option:selected').val());

				$("#sameday").dialog({
					autoOpen : false,
					modal : true,
					width : 550,
					height : 270,
					draggable : false,
					resizable : false,
					buttons : [ {
						text : "删除",
						icon : "ui-icon-heart",
						click : function() {
							console.log("333");
							info.event.remove();
							$(this).dialog("close");// dialog关闭


						}
					}, {
						text : "取消",
						icon : "ui-icon-heart",
						click : function() {
							console.log("555");
							$(this).dialog("close");
						}
					}, ],
					show : {
						effect : "blind",
						duration : 1000
					},
					hide : {
						effect : "explode",
						duration : 1000
					}
				});
				$("#sameday").dialog("open");
				// if (confirm('是否删除这个日程?')) {
				// info.event.remove();
				// }
			},
			validRange : {
				// validRange 为控制锁死某些日期 当前日期的下一天即为明天开始可用 之前的日期全部锁死 官网原版写法 为 start
				// end 设定开始和结束日期
				start : new Date(new Date().getTime() + (1000 * 60 * 60 * 24))
			},
			 <%--events:function(start, end,callback) {--%>

				<%-- // events:[--%>
				<%-- // {--%>
				<%-- // 	title:"sss",--%>
				<%-- // 	start:new Date(2020,4,15),--%>
				<%-- // 	end:new Date(2020,4,16),--%>
				<%-- // 	id:10--%>
				<%-- // },{--%>
				<%-- // 	title:"ss2",--%>
				<%-- // 	start:new Date(2020,4,15),--%>
				<%-- // 	end:new Date(2020,4,16),--%>
				<%-- // 	id:11--%>


				<%-- $.ajax({--%>
				<%-- 	url:"${pageContext.request.contextPath}/TM/getExamTime",--%>
				<%-- 	cache:false,--%>
				<%-- 	success:function(doc) {--%>
				<%-- 		console.log(doc);--%>

				<%-- 		var events = [];--%>


				<%-- 		events.push({--%>
				<%-- 			title:"sss",--%>
				<%-- 			start:new Date("2020-4-15"),--%>
				<%-- 			end:new Date("2020-4-20"),--%>
				<%-- 			id:10--%>
				<%-- 		});--%>
				<%-- 		// for (var i = 0; i < info.length; i++) {--%>
				<%-- 		// 	var ev = info[i];--%>
				<%-- 		// 	var title = ev.title;--%>
				<%-- 		// 	var evtstart = new Date("2020-4-15");--%>
				<%-- 		// 	var evtend = new Date("2020-4-20");--%>
				<%-- 		// 	console.log(ev.start);--%>
				<%-- 		// 	console.log(ev.end);--%>
				<%-- 		//--%>
				<%-- 		// }--%>
				<%-- 		console.log(events);--%>

				<%-- 		callback(events);--%>

				<%-- 		console.log(events);--%>
				<%-- 	},--%>
				<%-- 	error:function() {--%>
				<%-- 		alert('sdf')--%>
				<%-- 	}--%>
				<%-- })--%>
			 <%--}--%>

		});

		calendar.render();



// 初始化dialog
		$("#caidan").dialog({
			autoOpen : false,
			modal : true,
			width : 500,
			height : 250,
			draggable : false,
			resizable : false,
			buttons : [ {
				text : "确定",
				icon : "ui-icon-heart",
				click : function() {
					// 创建新的日程
					calendar.addEvent({
						title : $('#groups option:selected').val(),// 日程标题
						start : new Date($("#starttime").val()),// 日程起始时间
						end : new Date($("#endtime").val()),// 日程结束时间
						allDay : true
						// 日程是否全天
					});

					$(this).dialog("close");// dialog关闭
					var title = $('#groups option:selected').val();// 日程标题
					var start = $("#starttime").val();// 日程起始时间
					var end = $("#endtime").val();// 日程结束时间
					var allDay = true;// 日程是否全天
					$(this).dialog("close");// dialog关闭



					console.log(title);
					console.log(start);
					console.log(end);
					console.log(allDay);

					$.ajax({
						async:true,
						method : "POST",
						url :'${pageContext.request.contextPath}/TM/insertExamTime',
						data: {"title":title,"state":start,"end":end,"allDay":allDay},
						dataType :"text",
						success:function(data){

						}
					});


				}
			}, {
				text : "取消",
				icon : "ui-icon-heart",
				click : function() {
					$(this).dialog("close");
				}
			}, ],
			show : {
				effect : "blind",
				duration : 1000
			},
			hide : {
				effect : "explode",
				duration : 1000
			}
		});

		$("#groups").selectmenu();// 下拉列表使用jquery UI样式

		$("#starttime").datepicker({// 日期选择器使用jquery UI样式
			dateFormat : "yy-mm-dd",
		});
		$("#endtime").datepicker({// 日期选择器使用jquery UI样式
			dateFormat : "yy-mm-dd",
			startDate : $("#starttime").val()
		});

		$("input[type='checkbox']").checkboxradio({
			icon : false
		});
		// $("#groups2").selectmenu();



		//ajax从数据库获取时间

		$.ajax({
			async:true,
			method : "POST",
			url :'${pageContext.request.contextPath}/TM/getExamTime',
			success:function(data){

				for(var i=0;i<2;i++){

					calendar.addEvent({
						title: "ss2",
						start: new Date("2020-4-15"),
						end: new Date("2020-4-18"),
						id: i,
						allDay: true
						// 日程是否全天
					});
				}


			}
		});





	});
	//重构Date对象下的时间格式
	Date.prototype.format = function(format) {
		var o = {
			"M+" : this.getMonth() + 1,
			"d+" : this.getDate(),
			"h+" : this.getHours(),
			"m+" : this.getMinutes(),
			"s+" : this.getSeconds(),
			"q+" : Math.floor((this.getMonth() + 3) / 3),
			"S" : this.getMilliseconds()
		}
		if (/(y+)/.test(format)) {
			format = format.replace(RegExp.$1, (this.getFullYear() + "")
					.substr(4 - RegExp.$1.length));
		}
		for ( var k in o) {
			if (new RegExp("(" + k + ")").test(format)) {
				format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
						: ("00" + o[k]).substr(("" + o[k]).length));
			}
		}
		return format;
	};


</script>
</html>