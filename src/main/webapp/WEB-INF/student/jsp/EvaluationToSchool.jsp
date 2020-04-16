<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>学员人脸录入</title>
	<%String path = request.getContextPath();%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">--%>
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>

	<style type="text/css">

		*{margin:0;padding: 0;}
		.wrap{
			width:780px;
			height: 880px;
			margin:0 auto;
			box-shadow: 10px 10px 30px #ccc;
			border-radius: 2px;
			padding: 10px;
			position: relative;
			top: 50px;
		}
		.says{
			width:780px;
			height: 200px;
			position: absolute;
		}
		.says h1{
			font-size:18px;
			color:#A8A8A8;
			margin-bottom: 5px;
		}
		textarea{
			width:760px;
			height: 100px;
			outline: none;
			resize: none;
			border:1px solid #ccc;
			border-radius: 3px;
			padding: 5px;
			color:#660000;
		}
		input{
			width:100px;
			height: 30px;
			border:none;
			cursor: pointer;
			background: #00CC66;
			color:white;
			border-radius: 2px;
			position: absolute;
			right: 10px;
			bottom: 5px;
			transition: all ease 0.4s;
			font-size: 16px;
		}
		input:hover{
			filter:alpha(opaciyt:70);
			opacity: 0.7;
		}
		ul{
			width:750px;
			height: 640px;
			position: absolute;
			bottom: 0;
			overflow-x: hidden;
			overflow-y: scroll;

		}
		li{
			width:750px;
			border-bottom: 1px  dotted #ccc;
			list-style:none;
			line-height: 57px;
			font-size: 14px;
			color:#606060;
			overflow: hidden;
			filter: alpha(opacity:0);
			opacity: 0;

		}
		span{
			float: right;
			margin-right: 30px;
		}
		.errmsg{
			font-size: 14px;
			color:red;
			font-weight: bold;
			filter: alpha(opacity:0);
			opacity:0;
		}
		a{
			font-size: 14px;
			color:#990000;
			text-decoration: none;
			margin-left: 10px;
		}
		a:hover{
			color:red;
			text-decoration: underline;
		}
	</style>
</head>
<body>
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<input type="hidden" id="studentid" value="${student.id}">
<input type="hidden" id="schoolid" value="${student.school_id}">
<div class="wrap">
	<div class="says">
		<h1>亲，来对${student.school.name}提提建议或者作出评价吧</h1>
		<textarea>请点击发布试试吧</textarea><input type="button"  value="发布">
		<div class="errmsg">请填写内容后再发布！</div>
	</div>
	<ul>

	</ul>
</div>
<script>
	window.onload=function()
	{
		var path = $("#path").val();
		var studentid = $("#studentid").val();
		var schoolId = $("#schoolid").val();



		var oWrap=document.getElementsByClassName("wrap")[0];
		var oTextarea=oWrap.getElementsByTagName("textarea")[0];
		var oBtn=oWrap.getElementsByTagName("input")[0];
		var oUl=oWrap.getElementsByTagName("ul")[0];
		var errMsg=oWrap.getElementsByClassName("errmsg")[0];
		var oA=document.getElementsByTagName("a");
		//console.log(oA);
		var t=new Date();
		var Year=t.getFullYear();
		var Month=t.getMonth()+1;
		var Day=t.getDate();
		var Hours=t.getHours();
		var Minutes=t.getMinutes();
		var Scondes=t.getSeconds();
		var timers=toString(Year)+"年"+toString(Month)+"月"+toString(Day)+"日"+toString(Hours)+":"+toString(Minutes)+":"+toString(Scondes);//将获取到的日期对象拼接。
		//console.log(timers);


		function toString(n)//数字转字符串
		{
			if(n<9)
			{
				n="0"+n;
			}
			else
			{
				n=""+n;
			}
			return n;
		};


		// 用ajax获取所有评论
		$.ajax({
			url:path+'/student/getAllEvaForSchool',
			type:'post',
			data: {schoolId:schoolId},
			dateType:"json",
			success:function(data){
				console.log(data);

				for (var i= 0; i <data.length; i++)
				{
					addEva(data[i]);
				}

			},error:function (err) {

			}
		});



		oBtn.onclick=function()
		{
			if(oTextarea.value=="")
			{
				startMove(errMsg,{opacity:100});
				//console.log(errMsg.style.opacity)
				oTextarea.select();
			}
			else
			{
				$.ajax({
					url:path+'/student/addEvaForSchool',
					type:'post',
					data: {schoolId:schoolId,content:oTextarea.value},
					dateType:"json",
					success:function(data){
						if(data == "success")
						{
							var aLi=document.createElement("li");
							var aSpan=document.createElement("span");
							aLi.innerHTML=oTextarea.value;
							aSpan.innerHTML=timers;
							//aSpan.innerHTML="<a href='javascript:;'>删除</a>"
							if(oUl.children.length>0)
							{
								oUl.insertBefore(aLi,oUl.children[0]);
								aLi.appendChild(aSpan);
								oTextarea.value="";
							}
							else
							{
								oUl.appendChild(aLi);
								aLi.appendChild(aSpan);
								oTextarea.value="";
							};
							var aLiHeight=parseInt(getStyle(aLi,"height"));
							//console.log(aLiHeight);
							aLi.style.height="0";
							startMove(aLi,{height:aLiHeight},function(){
								startMove(aLi,{opacity:100});
							});
							delLi();//添加数据后加载删除模块
						}else
						{
							alert('评论失败');
						}

					},error:function (err) {

					}
				});

			}
		};


		function addEva(data)
		{

			var aLi=document.createElement("li");
			var aSpan=document.createElement("span");
			//console.log(aLi);
			//console.log(aSpan);
			//oUl.appendChild(aLi);
			//aLi.appendChild(aSpan);
			aLi.innerHTML=data.content;
			aSpan.innerHTML=changeTime(data.time);
			//aSpan.innerHTML="<a href='javascript:;'>删除</a>"
			if(oUl.children.length>0)
			{
				oUl.insertBefore(aLi,oUl.children[0]);
				aLi.appendChild(aSpan);
			}
			else
			{
				oUl.appendChild(aLi);
				aLi.appendChild(aSpan);
			};
			var aLiHeight=parseInt(getStyle(aLi,"height"));
			//console.log(aLiHeight);
			aLi.style.height="0";
			startMove(aLi,{height:aLiHeight},function(){
				startMove(aLi,{opacity:100});
			});
			delLi();//添加数据后加载删除模块

		};



		function changeTime(data) {


			var t = new Date(data);

			var Year=t.getFullYear();
			var Month=t.getMonth()+1;
			var Day=t.getDate();
			var Hours=t.getHours();
			var Minutes=t.getMinutes();
			var Scondes=t.getSeconds();
			var timers=toString(Year)+"年"+toString(Month)+"月"+toString(Day)+"日"+toString(Hours)+":"+toString(Minutes)+":"+toString(Scondes);//将获取到的日期对象拼接。
			return timers;
		}

		// function convertDateFromString(dateString) {
		// 	if (dateString) {
		// 		//2012-9-20 19:46:18
		// 		var arr1 = dateString.split(" ");
		// 		var sdate = arr1[0].split('-');
		// 		var date = new Date(sdate[0], sdate[1]-1, sdate[2]);
		// 		return date;
		// 	}
		// }


		function delLi()
		{
			for(var i=0;i<oA.length;i++)
			{
				oA[i].onclick=function()
				{
					liNode=this.parentNode.parentNode//获取到当前A标签的父节点，也就是LI
					var aLiHeight=parseInt(getStyle(liNode,"height"))+1;
					//console.log(aLiHeight);
					//链式运动操作：先进行透明化，再进行高度变小，最后删除DOM元素
					startMove(liNode,{opacity:0},function(){
						startMove(liNode,{height:0},function(){
							oUl.removeChild(liNode);
						});
					});
				}
			}
		}
	};

	//运动框架
	function startMove(obj,json,endFn){
		clearInterval(obj.timer);
		obj.timer=setInterval(
			function(){

				var iStop=true;
				for(var curr in json)
				{
					var oNumber=0;
					if(curr=="opacity")
					{
						oNumber=Math.round(parseFloat(getStyle(obj,curr))*100);
					}
					else
					{
						oNumber=parseInt(getStyle(obj,curr));
					}
					var speed=(json[curr]-oNumber)/6;
					speed=speed>0?Math.ceil(speed):Math.floor(speed);
					if(oNumber!=json[curr])
						iStop=false;
					if(curr=="opacity")
					{
						obj.style.filter="alpha(opacity:"+(oNumber+speed)+")";
						obj.style.opacity=(oNumber+speed)/100;
					}
					else
					{
						obj.style[curr]=oNumber+speed+"px";
					}
				};
				if(iStop)
				{
					clearInterval(obj.timer);
					if(endFn)endFn();
				}
			},30);
	};

	//获取非行间样式
	function getStyle(obj,name)
	{
		if(obj.currentStyle)
		{
			obj=currentStyle[name];
		}
		else
		{
			obj=getComputedStyle(obj,false)[name];
		}
		return obj;
	};
</script>


</body>
</html>