<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<meta charset="utf-8">
	<title>模拟考试</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<%String path = request.getContextPath();%>

	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/static/student/js/jquery.easy-pie-chart.js" type="text/javascript" charset="UTF-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/test.css">
	<script src="${pageContext.request.contextPath}/static/student/js/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/student/js/exercise.js"></script>

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
<input type="hidden" id="choice" value="${questionList.choice}">
<input type="hidden" id="judge" value="${questionList.judge}">


<div class="main">
	<!--nr start-->
	<div class="test_main">
		<div class="nr_left">
			<div class="test">
				<form action="" method="post" >
					<div class="test_content">
						<div class="test_content_title">
							<h2>单选题</h2>
							<p>
								<span>共</span><i class="content_lit">80</i><span>题，</span><span>合计</span><i class="content_fs">80</i><span>分</span>
							</p>
						</div>
					</div>
					<div class="test_content_nr">
						<ul>
							<c:if test="${not empty questionList.choice}">
								<c:forEach items="${questionList.choice}" var="c" varStatus="v" >

									<li id="qu_0_${v.index}">
										<div class="test_content_nr_tt">
											<i>${v.count}</i><span>(1分)</span><font>${c.question}</font>
										</div>
										<div class="test_content_nr_main">
											<ul>
												<input class="correct" type="hidden" value="${c.answer}">
												<li class="option">

													<input type="radio" class="radioOrCheck" name="answer${v.count}"
													       id="0_answer_${v.count}_option_1" value="1"/>
													<label for="0_answer_${v.count}_option_1">
														A.
														<p class="ue" style="display: inline;">${c.item1}</p>
													</label>
												</li>
												<li class="option">
													<input type="radio" class="radioOrCheck" name="answer${v.count}"
													       id="0_answer_${v.count}_option_2" value="2"/>
													<label for="0_answer_${v.count}_option_2">
														B.
														<p class="ue" style="display: inline;">${c.item2}</p>
													</label>
												</li>
												<li class="option">
													<input type="radio" class="radioOrCheck" name="answer${v.count}"
													       id="0_answer_${v.count}_option_3" value="3"/>
													<label for="0_answer_${v.count}_option_3">
														C.
														<p class="ue" style="display: inline;">${c.item3}</p>
													</label>
												</li>
												<li class="option">

													<input type="radio" class="radioOrCheck" name="answer${v.count}"
													       id="0_answer_${v.count}_option_4" value="4"/>
													<label for="0_answer_${v.count}_option_4">
														D.
														<p class="ue" style="display: inline;">${c.item4}</p>
													</label>
												</li>
											</ul>
										</div>

										<c:if test="${not empty c.url}">
											<img   src="${c.url}" alt="">
										</c:if>
										<div class="answer" style="display: none">
											<c:choose>
												<c:when test="${c.answer==1}">
													正确答案：A。
												</c:when>
												<c:when test="${c.answer==2}">
													正确答案：B。
												</c:when>
												<c:when test="${c.answer==3}">
													正确答案：C。
												</c:when>
												<c:otherwise>
													正确答案：D。
												</c:otherwise>
											</c:choose>
													解析：${c.explains}
										</div>
									</li>
								</c:forEach>
							</c:if>
						</ul>
					</div>

					<div class="test_content">
						<div class="test_content_title">
							<h2>判断题</h2>
							<p>
								<span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i class="content_fs">20</i><span>分</span>
							</p>
						</div>
					</div>
					<div class="test_content_nr">
						<ul>
							<c:if test="${not empty questionList.judge}">
								<c:forEach items="${questionList.judge}" var="c" varStatus="v" >
								<li id="qu_1_${v.index}">
									<div class="test_content_nr_tt">
										<i>${v.count}</i><span>(1分)</span><font>${c.question}</font>
									</div>

									<div class="test_content_nr_main">
										<ul>
											<input class="correct" type="hidden" value="${c.answer}">
											<li class="option">
												<input type="radio" class="radioOrCheck" name="1_answer_${v.count}"
												       id="1_answer_${v.count}_option_1" value="1"/>
												<label for="1_answer_${v.count}_option_1">
													A.
													<p class="ue" style="display: inline;">${c.item1}</p>
												</label>
											</li>
											<li class="option">
												<input type="radio" class="radioOrCheck" name="1_answer_${v.count}"
												       id="1_answer_${v.count}_option_2" value="2"/>

												<label for="1_answer_${v.count}_option_2">
													B.
													<p class="ue" style="display: inline;">${c.item2}</p>
												</label>
											</li>
										</ul>
									</div>

									<c:if test="${not empty c.url}">
										<img   src="${c.url}" alt="">
									</c:if>
									<div class="answer" style="display: none">
										<c:choose>
											<c:when test="${c.answer==1}">
												正确答案：A。
											</c:when>
											<c:when test="${c.answer==2}">
												正确答案：B。
											</c:when>
										</c:choose>
										解析：${c.explains}
									</div>
								</li>
								</c:forEach>
							</c:if>
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
								<c:forEach items="${questionList.choice}" var="c" varStatus="v" >
									<li><a href="#qu_0_${v.index}">${v.count}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<div class="rt_content">
						<div class="rt_content_tt">
							<h2>判断题</h2>
							<p>
								<span>共</span><i class="content_lit">20</i><span>题</span>
							</p>
						</div>
						<div class="rt_content_nr answerSheet">
							<ul>
								<c:forEach items="${questionList.judge}" var="c" varStatus="v" >
									<li><a href="#qu_1_${v.index}">${v.count}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<div class="rt_content">
						<button type="button" class="layui-btn layui-btn-lg">交卷</button>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="foot"></div>
</div>

<!--时间js-->


<script>

	$(function () {
		$('li.option label').click(function () {
			// debugger;
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
