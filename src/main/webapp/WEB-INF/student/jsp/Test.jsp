<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<title>模拟考试</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<%String path = request.getContextPath();%>

	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/student/js/jquery-1.11.1.min.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/static/student/js/jquery.easy-pie-chart.js" type="text/javascript" charset="UTF-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/test.css">


	<style>
		.hasBeenAnswer {
			background: #5d9cec;
			color: #fff;
		}

		.reading h2 {
			width: 100%;
			margin: 20px 0 70px;
			text-align: center;
			line-height: 2;
			font-size: 20px;
			color: #59595b;
		}

		.reading h2 a {
			text-decoration: none;
			color: #59595b;
			font-size: 20px;
		}

		.reading h2 a:hover {
			color: #2183f1;
		}
	</style>

</head>

<body>

<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<input type="hidden" id="studentid" value="${student.id}">
<input type="hidden" id="subject" value="1">


<div class="main">
	<!--nr start-->
	<div class="test_main">
		<div class="nr_left">
			<div class="test">
				<form action="" method="post">
					<div class="test_title">
						<font><input type="button" name="test_jiaojuan" value="交卷"></font>
					</div>

					<div class="test_content">
						<div class="test_content_title">
							<h2>单选题</h2>
							<p>
								<span>共</span><i class="content_lit">60</i><span>题，</span><span>合计</span><i class="content_fs">60</i><span>分</span>
							</p>
						</div>
					</div>
					<div class="test_content_nr">
						<ul>

							<li id="qu_0_0">
								<div class="test_content_nr_tt">
									<i>1</i><span>(1分)</span><font>在生产管理信息系统中，下列操作步骤能正确将工单推进流程的是（  ）</font>
								</div>

								<div class="test_content_nr_main">
									<ul>

										<li class="option">

											<input type="radio" class="radioOrCheck" name="answer1"
											       id="0_answer_1_option_1" />


											<label for="0_answer_1_option_1">
												A.
												<p class="ue" style="display: inline;">在工具栏中点击“workflow”标签</p>
											</label>
										</li>

										<li class="option">

											<input type="radio" class="radioOrCheck" name="answer1"
											       id="0_answer_1_option_2" />


											<label for="0_answer_1_option_2">
												B.
												<p class="ue" style="display: inline;">在缺陷单界面中点击“推进流程”按钮</p>
											</label>
										</li>

										<li class="option">

											<input type="radio" class="radioOrCheck" name="answer1"
											       id="0_answer_1_option_3" />


											<label for="0_answer_1_option_3">
												C.
												<p class="ue" style="display: inline;">在缺陷单界面中点击“提交”按钮</p>
											</label>
										</li>

										<li class="option">

											<input type="radio" class="radioOrCheck" name="answer1"
											       id="0_answer_1_option_4" />


											<label for="0_answer_1_option_4">
												D.
												<p class="ue" style="display: inline;">后台启动流程推进</p>
											</label>
										</li>

									</ul>
								</div>
							</li>

							<li id="qu_0_1">
								<div class="test_content_nr_tt">
									<i>2</i><span>(1分)</span><font>在营销系统中查询客户有无欠费、余额及抄表数据接待客户时应做到哪些最基本的礼仪？</font>
								</div>

								<div class="test_content_nr_main">
									<ul>

										<li class="option">

											<input type="radio" class="radioOrCheck" name="answer2"
											       id="0_answer_2_option_1" />


											<label for="0_answer_2_option_1">
												A.
												<p class="ue" style="display: inline;">起身、微笑、示坐、问候客户</p>
											</label>
										</li>

										<li class="option">

											<input type="radio" class="radioOrCheck" name="answer2"
											       id="0_answer_2_option_2" />


											<label for="0_answer_2_option_2">
												B.
												<p class="ue" style="display: inline;">坐着，问候客户</p>
											</label>
										</li>

										<li class="option">

											<input type="radio" class="radioOrCheck" name="answer2"
											       id="0_answer_2_option_3" />


											<label for="0_answer_2_option_3">
												C.
												<p class="ue" style="display: inline;">坐着，问候客户</p>
											</label>
										</li>

										<li class="option">

											<input type="radio" class="radioOrCheck" name="answer2"
											       id="0_answer_2_option_4" />


											<label for="0_answer_2_option_4">
												D.
												<p class="ue" style="display: inline;">请问需要办理什么业务</p>
											</label>
										</li>

									</ul>
								</div>
								<img   src="http://images.juheapi.com/jztk/c1c2subject1/1.jpg" alt="">
								<div class="answer">答案：C.解析：此为机动车车道,比多乘员车辆专用车道少俩人.</div>
							</li>

							<li id="qu_0_2">
								<div class="test_content_nr_tt">
									<i>3</i><span>(1分)</span><font>请在下列选项中选择正确进入电力营销系统网址</font>
								</div>

								<div class="test_content_nr_main">
									<ul>

										<li class="option">

											<input type="radio" class="radioOrCheck" name="answer3"
											       id="0_answer_3_option_1" />


											<label for="0_answer_3_option_1">
												A.
												<p class="ue" style="display: inline;">http://10.113.225.24:83/epm/static/logon/logon.jsp</p>
											</label>
										</li>

										<li class="option">

											<input type="radio" class="radioOrCheck" name="answer3"
											       id="0_answer_3_option_2" />


											<label for="0_answer_3_option_2">
												B.
												<p class="ue" style="display: inline;">http://10.113.255.24:83/epm/static/logon/logon.jsp</p>
											</label>
										</li>

										<li class="option">

											<input type="radio" class="radioOrCheck" name="answer3"
											       id="0_answer_3_option_3" />


											<label for="0_answer_3_option_3">
												C.
												<p class="ue" style="display: inline;">http://10.113.255.24:81/epm/static/logon/logon.jsphttp://10.113.245.24:81/epm/static/logon/logon.jsp</p>
											</label>
										</li>

									</ul>
								</div>
							</li>



						</ul>
					</div>

					<div class="test_content">
						<div class="test_content_title">
							<h2>多选题</h2>
							<p>
								<span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i class="content_fs">30</i><span>分</span>
							</p>
						</div>
					</div>
					<div class="test_content_nr">
						<ul>

							<li id="qu_1_0">
								<div class="test_content_nr_tt">
									<i>1</i><span>(1分)</span><font>以下属于南方电网员工职业操守中明文规定的有()</font>
								</div>

								<div class="test_content_nr_main">
									<ul>

										<li class="option">


											<input type="checkbox" class="radioOrCheck" name="answer1"
											       id="1_answer_1_option_1" />

											<label for="1_answer_1_option_1">
												A.
												<p class="ue" style="display: inline;">热爱祖国、热爱南网、热爱岗位</p>
											</label>
										</li>

										<li class="option">


											<input type="checkbox" class="radioOrCheck" name="answer1"
											       id="1_answer_1_option_2" />

											<label for="1_answer_1_option_2">
												B.
												<p class="ue" style="display: inline;">遵纪守法、忠于职守、令行禁止</p>
											</label>
										</li>

										<li class="option">


											<input type="checkbox" class="radioOrCheck" name="answer1"
											       id="1_answer_1_option_3" />

											<label for="1_answer_1_option_3">
												C.
												<p class="ue" style="display: inline;">客户至上、诚实守信、优质服务</p>
											</label>
										</li>

										<li class="option">


											<input type="checkbox" class="radioOrCheck" name="answer1"
											       id="1_answer_1_option_4" />

											<label for="1_answer_1_option_4">
												D.
												<p class="ue" style="display: inline;">公平竞争、互相监督、服从监管</p>
											</label>
										</li>

									</ul>
								</div>
							</li>

							<li id="qu_1_1">
								<div class="test_content_nr_tt">
									<i>2</i><span>(1分)</span><font>以下属于南方电网员工职业禁区的有()</font>
								</div>

								<div class="test_content_nr_main">
									<ul>

										<li class="option">


											<input type="checkbox" class="radioOrCheck" name="answer2"
											       id="1_answer_2_option_1" />

											<label for="1_answer_2_option_1">
												A.
												<p class="ue" style="display: inline;">严禁违反人文道德</p>
											</label>
										</li>

										<li class="option">


											<input type="checkbox" class="radioOrCheck" name="answer2"
											       id="1_answer_2_option_2" />

											<label for="1_answer_2_option_2">
												B.
												<p class="ue" style="display: inline;">严禁违反安全规定</p>
											</label>
										</li>

										<li class="option">


											<input type="checkbox" class="radioOrCheck" name="answer2"
											       id="1_answer_2_option_3" />

											<label for="1_answer_2_option_3">
												C.
												<p class="ue" style="display: inline;">严禁违背行风规定</p>
											</label>
										</li>

										<li class="option">


											<input type="checkbox" class="radioOrCheck" name="answer2"
											       id="1_answer_2_option_4" />

											<label for="1_answer_2_option_4">
												D.
												<p class="ue" style="display: inline;">严禁违反财经纪律</p>
											</label>
										</li>

									</ul>
								</div>
							</li>
						</ul>
					</div>

				</form>
			</div>
		</div>
		<div class="nr_right">
			<div class="nr_rt_main">
				<div class="rt_nr1">
					<div class="rt_nr1_title">
						<h1>
							答题卡
						</h1>
						<div id="daojishi" style="color: red;"></div>
					</div>

					<div class="rt_content">
						<div class="rt_content_tt">
							<h2>单选题</h2>
							<p>
								<span>共</span><i class="content_lit">60</i><span>题</span>
							</p>
						</div>
						<div class="rt_content_nr answerSheet">
							<ul>

								<li><a href="#qu_0_0">1</a></li>

								<li><a href="#qu_0_1">2</a></li>

								<li><a href="#qu_0_2">3</a></li>
							</ul>
						</div>
					</div>

					<div class="rt_content">
						<div class="rt_content_tt">
							<h2>多选题</h2>
							<p>
								<span>共</span><i class="content_lit">30</i><span>题</span>
							</p>
						</div>
						<div class="rt_content_nr answerSheet">
							<ul>

								<li><a href="#qu_1_0">1</a></li>

								<li><a href="#qu_1_1">2</a></li>
							</ul>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<div class="foot"></div>
</div>

<script src="http://cdn.bootstrapmb.com/jquery/jquery-1.11.1.min.js"></script>
<script src="jquery.easy-pie-chart.js"></script>
<!--时间js-->
<script src="time/layui.js" type="text/javascript" charset="utf-8"></script>


<script>
	layui.use('util', function(){
		var util = layui.util;

		//示例
		var serverTime = new Date().getTime() //假设为结束日期
			,endTime = new Date().getTime()+3600000; //假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的

		util.countdown(endTime, serverTime, function(date, serverTime, timer){
			var str = date[1] + ':' +  date[2] + ':' + date[3];
			layui.$('#daojishi').html('考试倒计时：'+ str);
			if(date[3] == 00 && date[2] == 00 && date[1] == 00 )
			{
				clearTimeout(timer);
			}
		});
	});


	$(function () {
		$('li.option label').click(function () {
			debugger;
			var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); /*得到题目ID*/
			var cardLi = $('a[href=#' + examId + ']'); /*根据题目ID找到对应答题卡*/
			/*设置已答题*/
			if (!cardLi.hasClass('hasBeenAnswer')) {
				cardLi.addClass('hasBeenAnswer');
			}

		});
	});
</script>


</body>
</html>
