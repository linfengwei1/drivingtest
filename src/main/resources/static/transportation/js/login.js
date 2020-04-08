﻿// $(function () {
//
// 	layui.use(['layer'], function(){
// 		var layer = layui.layer;
//
// 		$("#reg").on("click",function () {
// 			var path = $("#path").val();
// 			var iframe = layer.open({
// 				type: 2,
// 				title: '用户注册',
// 				btn: ['确定','取消'],
// 				scrollbar:true,
// 				resize:false,
// 				fixed:true,
// 				shadeClose: true, //点击遮罩关闭层
// 				area : ['800px' , '600px'],
// 				content: path+'/UserLoginRegServlet?method=regPage',
//
// 				btn1: function (index, layero) {
//
// 					var body = layer.getChildFrame('body', index);//通过该对象可以获取iframe中的dom元素
// 					var uname = body.find("#uname").val().trim();
// 					var pwd = body.find("#pwd").val().trim();
// 					var ensurepwd = body.find("#ensurepwd").val().trim();
//
//
//
// 					if(uname == "" || uname == null)
// 					{
// 						layer.msg("请输入登录账号");
// 					}
// 					else if(pwd == "" || pwd == null)
// 					{
// 						layer.msg("请输入密码");
// 					}else if(ensurepwd == "" || ensurepwd == null)
// 					{
// 						layer.msg("请输入确认密码");
// 					}else if(ensurepwd !== pwd )
// 					{
// 						layer.msg("密码不一致");
// 					}
// 					else
// 					{
//
// 						var index1 = layer.msg('你确定注册吗？', {
// 							time: 0 //不自动关闭
// 							,btn: ['确定', '取消']
// 							,yes: function(index){
// 								layer.close(index1);
// 								$.ajax({
// 									type:"Post",
// 									async:true,
// 									url:path+'/UserLoginRegServlet?method=reg',
// 									data:{"uname":uname,"pwd":pwd},
// 									dataType:"text",
// 									success:function (str) {
// 										if(str == "success")
// 										{
//
// 											layer.msg('注册成功');
// 											layer.close(iframe);
//
// 										}else if(str == "accountrepeat")
// 										{
// 											layer.msg('注册失败，账号已存在', {icon: 2});
// 										}else
// 										{
// 											layer.msg('注册失败', {icon: 2});
// 										}
// 									},
// 									error: function (str) {
// 										alert(str);
// 									}
// 								})
//
//
// 							}
// 						});
// 					}
// 				}
// 			});
// 		});
// 	});
//
// 	layui.use('form', function(){
// 		var $ = layui.jquery;
//
// 		var form = layui.form;
// 		var path = $("#path").val();
// 		//监听提交
// 		form.on('submit(formDemo)', function(data){
// 			var user = JSON.stringify(data.field);
// 			console.log(data.field);
// 		});
// 	});
//
//
//
//
//
//
// // layui.use(['layer'], function(){
// // 	var layer = layui.layer;
// //
// // 	$("#reg").on("click",function () {
// //
// //
// // 		var path = $("#url").val();
// //
// //
// // 		var iframe = layer.open({
// // 			type: 2,
// // 			title: '用户注册',
// // 			btn: ['确定','取消'],
// // 			scrollbar:true,
// // 			resize:false,
// // 			fixed:true,
// // 			shadeClose: true, //点击遮罩关闭层
// // 			area : ['800px' , '600px'],
// // 			content: path+'/UserLoginRegServlet?method=regPage',
// //
// // 			btn1: function (index, layero) {
// //
// // 				var body = layer.getChildFrame('body', index);//通过该对象可以获取iframe中的dom元素
// // 				var account = body.find("#account").val().trim();
// // 				console.log("账号"+account);
// // 				var pwd = body.find("#pwd").val().trim();
// // 				var ensurepwd = body.find("#ensurepwd").val().trim();
// // 				var phonenum = body.find("#phonenum").val().trim();
// // 				var addr = body.find("#addr").val().trim();
// // 				var age = body.find("#age").val().trim();
// //
// // 				var sex = body.find("input[type=radio]:checked").val();
// //
// // 				var checkage=/^(?:[1-9][0-9]?|1[01][0-9]|120)$/;//年龄是1-120之间有效
// // 				var checkphone = /^((13[0-9])|(17[0-1,6-8])|(15[^4,\\D])|(18[0-9]))\d{8}$/;
// // 				var checkpwd =  /^[\w]{6,15}$/;
// // 				var checkaddr = /^.{1,100}$/;
// //
// // 				if(account == "" || account == null)
// // 				{
// // 					layer.msg("请输入登录账号");
// // 				}else if(!checkpwd.test(account))
// // 				{
// // 					layer.msg("请输入6-15位的字母数字组合的登录账号");
// // 				}
// // 				else if(pwd == "" || pwd == null)
// // 				{
// // 					layer.msg("请输入密码");
// // 				}else if(!checkpwd.test(pwd))
// // 				{
// // 					layer.msg("密码为6-15的字母和数字组合密码");
// // 				}else if(ensurepwd == "" || ensurepwd == null)
// // 				{
// // 					layer.msg("请输入确认密码");
// // 				}else if(ensurepwd !== pwd )
// // 				{
// // 					layer.msg("密码不一致");
// // 				}else if(phonenum == "" || phonenum == null)
// // 				{
// // 					layer.msg("请输入电话号码");
// // 				}
// // 				else if(!checkphone.test(phonenum))
// // 				{
// // 					layer.msg("请输入正确的电话号码");
// // 				}else if(sex == "" || sex == null)
// // 					layer.msg("请选择性别");
// // 				else if(age == "" || age == null)
// // 				{
// // 					layer.msg("请输入年龄");
// // 				}else if(!checkage.test(age))
// // 				{
// // 					layer.msg("请输入正确的年龄");
// // 				}else if(addr == "" || addr == null)
// // 				{
// // 					layer.msg("请输入通讯地址");
// // 				}else if(!checkaddr.test(addr))
// // 				{
// // 					layer.msg("通讯地址过长");
// // 				}
// // 				else
// // 				{
// //
// // 					var index1 = layer.msg('你确定注册吗？', {
// // 						time: 0 //不自动关闭
// // 						,btn: ['确定', '取消']
// // 						,yes: function(index){
// // 							layer.close(index1);
// // 							$.ajax({
// // 								type:"Post",
// // 								async:true,
// // 								url:path+'/UserLoginRegServlet?method=reg',
// // 								data:{"account":account,"pwd":pwd,"age":age,"addr":addr,"phonenum":phonenum,"sex":sex},
// // 								dataType:"text",
// // 								success:function (str) {
// // 									if(str == "success")
// // 									{
// //
// // 										layer.msg('注册成功');
// // 										layer.close(iframe);
// //
// // 									}else if(str == "accountrepeat")
// // 									{
// // 										layer.msg('注册失败，账号已存在', {icon: 2});
// // 									}else
// // 									{
// // 										layer.msg('注册失败', {icon: 2});
// // 									}
// // 								},
// // 								error: function (str) {
// // 									alert(str);
// // 								}
// // 							})
// //
// //
// // 						}
// // 					});
// // 				}
// // 			}
// // 		});
// // 	});
// // });
// //
// //
//
//
// })
//
// function login() {
// 	layui.use(['layer'], function(){
// 		var layer = layui.layer;
//
// 		var account = $("#account").val().trim();
// 		var password = $("#password").val().trim();
// 		var path = $("#ip_url").val();
// 		var checkcode = $("#checkcode").val();
// 		if(account == null || ""==account)
// 		{
// 			layer.ready(function(){
// 				layer.msg('账号不能为空', {icon: 2});
// 			});
// 		}else if(password == null || ""==password)
// 		{
// 			layer.ready(function(){
// 				layer.msg('密码不能为空', {icon: 2});
// 			});
//
// 		}else if(checkcode == null || ""==password)
// 		{
// 			layer.ready(function(){
// 				layer.msg('请输入验证码', {icon: 2});
// 			});
//
// 		}else
// 		{
//
// 			$.ajax({
// 				type:"Post",
// 				async:true,
// 				url:path+"/UserLoginRegServlet?method=login",
// 				data:{account:account,passward:password,check:checkcode},
// 				dataType:"text",
// 				success:function (msg) {
// 					if(msg == "success")
// 					{
// 						window.location.href = path+"/front/jsp/UserMain.jsp";
//
// 					}else if(msg == "error1")
// 					{
// 						layer.ready(function(){
// 							layer.msg('您已经被禁用，禁止登录', {icon: 2});
// 						});
// 					}else if(msg == "error3")
// 					{
// 						layer.ready(function(){
// 							layer.msg('验证码错误', {icon: 2});
// 							$("#img").attr("src",path+"/VerifyCodeServlet?"+Math.random())
// 						});
// 					}else if(msg == "error4")
// 					{
// 						layer.ready(function(){
// 							layer.msg('账号不存在', {icon: 2});
// 						});
// 						$("#img").attr("src",path+"/VerifyCodeServlet?"+Math.random())
// 					}else
// 					{
// 						layer.ready(function(){
// 							layer.msg('验证失败,账号或者密码错误', {icon: 2});
// 						});
// 						$("#img").attr("src",path+"/VerifyCodeServlet?"+Math.random())
// 					}
//
//
// 				},
// 				error: function (msg) {
// 					alert(msg);
// 				}
// 			});
//
//
//
// 		}
// 	});
// }