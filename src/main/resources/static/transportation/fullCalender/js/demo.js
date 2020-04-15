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
			console.log(arg);
			$("#starttime").val(new Date(arg.start).format('yyyy-MM-dd'));// 使用时间格式转换时间填入Dialog
			// $("#endtime").val(new Date(arg.end).format('yyyy-MM-dd'));
			$("#caidan").dialog("open");
			calendar.unselect();
		},
		eventClick : function(info) {
			console.log(info.event);
			console.log(info.event._instance.range.end);
			console.log(info.event._instance.range.start);
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
					text : "确定",
					icon : "ui-icon-heart",
					click : function() {
						console.log("444");
						info.title = $('#groups option:selected').val(),// 日程标题
						info.start = new Date($("#starttime").val()),// 日程起始时间
						info.end = new Date($("#endtime").val()),// 日程结束时间
						info.allDay = true// 日程是否全天
						$(this).dialog("close");// dialog关闭


						var chk_value =[];//定义一个数组
						$('input[name="checkbox"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数
							console.log($(this).val());
							chk_value.push($(this).val());//将选中的值添加到数组chk_value中
						});

						console.log(info.title);
						console.log(info.start);
						console.log(info.end);
						console.log(chk_value);
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
		}
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
				})
				console.log(calendar);
				$(this).dialog("close");// dialog关闭




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
		dateFormat : "yy-mm-dd"
	});
	$("#endtime").datepicker({// 日期选择器使用jquery UI样式
		dateFormat : "yy-mm-dd"
	});

	$("input[type='checkbox']").checkboxradio({
		icon : false
	});
	// $("#groups2").selectmenu();
});
// 重构Date对象下的时间格式
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
}
