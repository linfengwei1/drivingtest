<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>学员登录</title>
	<%String path = request.getContextPath();%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/studentmain.css">
	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="HTML,CSS,XML,JavaScript">
	<meta charset="utf-8" />
	<style type="text/css">
		body{
			font:14px/28px "微软雅黑";
		}
		.contact *:focus{outline :none;}
		.contact{
			width: 700px;
			height: auto;
			background: #f6f6f6;
			margin: 40px auto;
			padding: 10px;
		}
		.contact ul {
			width: 650px;
			margin: 0 auto;
		}
		.contact ul li{
			border-bottom: 1px solid #dfdfdf;
			list-style: none;
			padding: 12px;
		}
		.contact ul li label {
			width: 120px;
			display: inline-block;
			float: left;
		}
		.contact ul li input[type=text],.contact ul li input[type=password]{
			width: 220px;
			height: 25px;
			border :1px solid #aaa;
			padding: 3px 8px;
			border-radius: 5px;
		}
		.contact ul li input:focus{
			border-color: #c00;

		}
		.contact ul li input[type=text]{
			transition: padding .25s;
			-o-transition: padding  .25s;
			-moz-transition: padding  .25s;
			-webkit-transition: padding  .25s;
		}
		.contact ul li input[type=password]{
			transition: padding  .25s;
			-o-transition: padding  .25s;
			-moz-transition: padding  .25s;
			-webkit-transition: padding  .25s;
		}
		.contact ul li input:focus{
			padding-right: 70px;
		}
		.btn{
			position: relative;
			left: 300px;
		}
		.tips{
			color: rgba(0, 0, 0, 0.5);
			padding-left: 10px;
		}
		.tips_true,.tips_false{
			padding-left: 10px;
		}
		.tips_true{
			color: green;
		}
		.tips_false{
			color: red;
		}
	</style>
</head>
<body>
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<input type="hidden" id="account" value="${student.account}">



<div class="df_bd">
	<div class="bgr" style="margin-right: 110px">
		<div class="usti">
			<div class="fra_title"><span><b class="backbg ico_time"></b><i class="layui-icon">&#xe673;</i>修改密码<a href="javascript:void(0)"></a></span></div>
			<div class="tmio">
				<div class="contact" >
					<form name="form1" method="post">
						<ul>
							<li>
								<label>输入密码：</label>
								<input type="password" name="yourname" id="pwd" placeholder="请输入密码"   required/><span class="tips" id="divname"></span>
							</li>
							<li>
								<label>新密码：</label>
								<input type="password" name="yourpass"  id="newpwd1" placeholder="请输入你的新密码"  required/><span class="tips" id="divpassword1">两次密码需要相同</span>
							</li>
							<li>
								<label>确认密码：</label>
								<input type="password" name="yourpass2" id="newpwd"placeholder="请再次输入你的密码"  required/><span class="tips" id="divpassword2">两次密码需要相同</span>
							</li>
						</ul>
						<b class="btn"><button type="button" class="layui-btn" id="updatePwd">
							<i class="layui-icon">&#xe614;</i>确定修改
						</button></b>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

	layui.use(['layer'], function () {
		var layer = layui.layer;
		var path = $("#path").val();
		var account = $("#account").val();
		var pwd = $("#pwd").val();
		var newPwd = $("#newpwd").val();





		$("#updatePwd").on("click",function(){

			var pwd = $("#pwd").val();
			var newPwd = $("#newpwd").val();
			var checkpwd =  /^[\w]{6,12}$/;
			if($("#pwd").val() == null || $("#newpwd1").val() == null || $("#newpwd").val() == null)
			{
				layer.msg("不能为空",{icon: 5});
				return;
			}else if(!checkpwd.test($("#newpwd1").val()) || !checkpwd.test($("#newpwd").val()))
			{
				layer.msg("密码必须是6-12位数的字母数字组合",{icon: 5});
				return;
			}else if($("#newpwd1").val() != $("#newpwd").val())
			{
				layer.msg("两次密码不一致",{icon: 5});
				return;
			}


			var index1 = layer.msg('你确定注册吗？', {
				time: 0 //不自动关闭
				,btn: ['确定', '取消']
				,yes: function(index){
					layer.close(index1);
					$.ajax({
						url:path+'/student/updatePwd',
						type:'post',
						data: {account:account,pwd:pwd,newPwd:newPwd},
						success:function(data){

							console.log("data="+data);
							if ("success"==data){
								$("#updatePwd").attr("disabled",true);
								layer.msg("密码修改成功",{icon: 6},function () {
									parent.location.href=path+"/student/path/StudentLogin";
								});

							}else if("error1" == data){
								layer.msg("密码错误",{icon: 5});

							}
						},error:function (err) {
							layer.msg("网络繁忙",function () {
								window.location.reload();
							});
						}
					});

				}
			});



		});



		//验证密码 
		$("#newpwd1").blur(function () {

			var checkpwd =  /^[\w]{6,12}$/;
			if(!checkpwd.test($("#newpwd1").val())) {
				document.getElementById("divpassword1").innerHTML = '<font class="tips_false">长度错误,必须为6-12个字母数字的组合</font>';
			}else
			{
				document.getElementById("divpassword1").innerHTML = '<font class="tips_true">输入正确</font>';
			}


			// psd1 = $("#newpwd1").val();
			// var flagZM = false;
			// var flagSZ = false;
			// var flagQT = false;
			// if (psd1.length < 6 || psd1.length > 12) {
			// 	document.getElementById("divpassword1").innerHTML = '<font class="tips_false">长度错误,必须为6-12个字母数字的组合</font>';
			// } else {
			// 	for (i = 0; i < psd1.length; i++) {
			// 		if ((psd1.charAt(i) >= 'A' && psd1.charAt(i) <= 'Z') || (psd1.charAt(i) >= 'a' && psd1.charAt(i) <= 'z')) {
			// 			flagZM = true;
			// 		} else if (psd1.charAt(i) >= '0' && psd1.charAt(i) <= '9') {
			// 			flagSZ = true;
			// 		} else {
			// 			flagQT = true;
			// 		}
			// 	}
			// 	if (!flagZM || !flagSZ || flagQT) {
			// 		document.getElementById("divpassword1").innerHTML = '<font class="tips_false">密码必须是字母数字的组合</font>';
			//
			// 	} else {
			//
			// 		document.getElementById("divpassword1").innerHTML = '<font class="tips_true">输入正确</font>';
			//
			// 	}

		})

		//验证密码 
		$("#newpwd").blur(function () {
			var checkpwd =  /^[\w]{6,12}$/;
			if ($("#newpwd").val() != $("#newpwd1").val()) {
				document.getElementById("divpassword2").innerHTML = '<font class="tips_false">您两次输入的密码不一样</font>';
			}else if(!checkpwd.test($("#newpwd").val()))
			{
				document.getElementById("divpassword2").innerHTML = '<font class="tips_false">长度错误,必须为6-12个字母数字的组合</font>';
			}else {
				document.getElementById("divpassword2").innerHTML = '<font class="tips_true">输入正确</font>';
			}

		})



	})
</script>

</body>
</html>





