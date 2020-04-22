<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<meta charset="utf-8">
	<title>科目${subject}在线练习</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<%String path = request.getContextPath();%>

	<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
	<script src="${pageContext.request.contextPath}/static/student/js/jquery.easy-pie-chart.js" type="text/javascript" charset="UTF-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/student/css/test.css">
	<script src="${pageContext.request.contextPath}/static/student/js/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/student/js/WrongQusetion.js"></script>

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
<input type="hidden" id="subject" value="${subject}">


<div class="main">
	<!--nr start-->
	<div class="test_main">
		<div class="nr_left" style="margin-left: 15%">
			<div class="test">
				<form action="" method="post" >
					<div class="test_content">
						<div class="test_content_title">
							<h2>科目${subject}错题集</h2>
							<p>
								<span>共</span><i class="content_lit">${size}</i><span>题</span>
							</p>
						</div>
					</div>
					<div class="test_content_nr">
						<ul>
							<c:if test="${not empty questionList}">
								<c:forEach items="${questionList}" var="c" varStatus="v" >

									<li id="${v.index}">
										<div class="test_content_nr_tt">
											<i>${v.count}</i><font>${c.question}</font>
										</div>

										<div class="test_content_nr_main">
											<ul>
												<input class="correct" type="hidden" value="${c.answer}">
												<input class="id" type="hidden" value="${c.id}">
												<c:choose>
													<c:when test="${c.type == 1}">
														<li class="option">

															<input type="radio" class="radioOrCheck"  name="answer${v.count}"
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

													</c:when>
													<c:otherwise>
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
													</c:otherwise>
												</c:choose>
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
										<div style="margin-left: 80%"><button type="button" onclick="delQuestion(${c.id},${v.index})" class="layui-btn"> <i class="layui-icon">&#xe640;</i>删除该题</button></div>
									</li>
								</c:forEach>
							</c:if>
						</ul>
					</div>


				</form>
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
