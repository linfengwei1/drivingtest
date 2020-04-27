<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-1-5
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%String path=request.getContextPath(); %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/homepage/css/homepage.css">
<script src="${pageContext.request.contextPath}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/jquery-3.4.1.js" type="text/javascript" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/static/echarts.js" type="text/javascript" charset="UTF-8"></script>
<script src="//cdn.bootcss.com/canvas-nest.js/1.0.0/canvas-nest.min.js"></script>
<canvas id="c_n4" width="860" height="958" style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.5;"></canvas>
<script src="${pageContext.request.contextPath}/static/homepage/js/L2Dwidget.min.js"></script>
<script src="${pageContext.request.contextPath}/static/homepage/js/homepage.js" type="text/javascript" charset="utf-8"></script>
<html>
<head>
    <title>机动车驾驶员计时培训系统</title>
</head>
<body>

<div id="header" style="background-color: #f2f4f9;width: 100%;height:5%" align="right">
    <a href="${pageContext.request.contextPath}/student/path/StudentLogin">学员登录</a>
    <a href="${pageContext.request.contextPath}/coach/login">教练登录</a>
    <a href="${pageContext.request.contextPath}/school/path/SchoolLogin">驾校登录</a>
    <a href="${pageContext.request.contextPath}/TM/login" style="margin-right: 10%;">交管登录</a>
</div>

<div class="layui-carousel" id="test1">
    <div carousel-item style="text-align :center">
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/home_logo2.jpg" /></div>
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage2.png" /></div>
        <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage3.jpg" /></div>
    </div>
</div>

<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this" style="left: 160px;font-size: 20px">首页</li>
        <li style="left: 200px;font-size: 20px">公开公示</li>
        <li style="left: 240px;font-size: 20px">信息查询</li>
        <li style="left: 280px;font-size: 20px">开通服务</li>
        <li style="left: 320px;font-size: 20px">登录</li>
	    <li style="left: 360px;font-size: 20px" onclick="getB()">关于我们</li>
    </ul>
    <div class="layui-tab-content" style="width: 100%;height: auto">
        <div class="layui-tab-item layui-show">
            <table style="margin: 0px;padding: 0px;width: 90%;height: auto">
                <td style="margin: 0px;padding: 0px;width: 450px;padding-right: 10px;">
                    <div class="layui-carousel" id="test2" style="left: 230px">
                        <div carousel-item>
                            <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage4.jpg" /></div>
                            <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage5.jpg" /></div>
                            <div><img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage6.jpg" /></div>
                        </div>
                    </div>
                </td>
                <td style="width: 650px">
                    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" style="height: 300px">
                        <ul class="layui-tab-title" style="margin-top: -25px">
                            <li class="layui-this">通知公告</li>
                            <li>收费明细</li>
                            <li>学驾流程</li>
                            <li>模板下载</li>
                        </ul>
                        <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="tab1">
                                    <tr style="background: #186ca4">
                                        <th width="300px">标题</th>
                                        <th width="100px">文章来源</th>
                                        <th>日期</th>
                                    </tr>
                                        <tr style="height: 30px;background: #dadada" id="template">
                                            <td id="title" onclick="Jump(this)"  ></td>
                                            <td id="type"></td>
                                            <td id="time1"></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <%--                                <div align="right">查看更多>>></div>--%>
                            </div>
                            <div class="layui-tab-item">
                                <table class="layui-table"   lay-skin="line">
                                    <colgroup>
                                        <col width="80" height="25">
                                        <col width="80">
                                        <col width="290">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>阶段</th>
                                        <th>费用(参考)</th>
                                        <th>备注</th>
                                    </tr>
                                    </thead>
                                    <tbody class="title-png">
                                    <tr>
                                        <td >科目一</td>
                                        <td>500元</td>
                                        <td>不同地区根据实际情况定价</td>
                                    </tr>
                                    <tr>
                                        <td >科目二</td>
                                        <td>1000元</td>
                                        <td>不同地区根据实际情况定价</td>
                                    </tr>
                                    <tr>
                                        <td >科目三</td>
                                        <td>1000元</td>
                                        <td>不同地区根据实际情况定价</td>
                                    </tr>
                                    <tr>
                                        <td >科目四</td>
                                        <td>500元</td>
                                        <td>不同地区根据实际情况定价</td>
                                    </tr>
                                    </tbody>
                                </table>

                             </div>
                            <div class="layui-tab-item">
                                <img src="${pageContext.request.contextPath}/static/images/homepageimages/home_logo3.png" />
                            </div>
                            <div class="layui-tab-item">
                                <a >驾校申请模板</a><br>
                                <a href="${pageContext.request.contextPath}/school/downTemplate?name=教练模板">教练申请模板</a><br>
                                <a href="${pageContext.request.contextPath}/school/downTemplate?name=学员模板">学员申请模板</a><br>
                                <a href="${pageContext.request.contextPath}/school/downTemplate?name=教练车模板">教练车申请模板</a>
                            </div>
                            <div class="layui-tab-item">内容5</div>
                        </div>
                    </div>
                </td>
            </table>
        </div>

        <!-- 公示公开-->
        <div class="layui-tab-item">
<%--            <table id="demo" class="layui-table" lay-event="" lay-skin="nob" ></table>--%>
<%--            <table id="demo" lay-filter="test"></table>--%>

            <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top">
	                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
	                                <table width="950" border="0" align="right" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="425">
	                                            <table width="425" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="425" height="32" style="background: #0a76a4">
	                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="33%" align="center" class="baifont" style="background: #a4752b">学车课堂</td>
                                                                    <td width="52%">　</td>
                                                                    <td width="15%"><a href=""><img src="${pageContext.request.contextPath}/static/images/homepageimages/more.gif" width="27" height="18" border="0"></a></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="268" valign="top" class="cbk">
	                                                        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                                                                        <c:if test="${not empty model}">
		                                                                        <c:forEach items="${model.noticeCS}"  var="cs">
                                                                                    <tr  bgcolor='#f4f4f4'>
                                                                                        <td width="90%" height="25" style="font-size: 16px"><a href="${pageContext.request.contextPath}/school/jumpNwePage?id=${cs.id}" target="_blank" title=${cs.title}>${cs.title}</a></td>
                                                                                        <td width="10%"  ><fmt:formatDate type="date" pattern="yyyy/MM/dd" dateStyle="medium" timeStyle="medium" value="${cs.time}" /></td>
                                                                                    </tr>
                                                                                </c:forEach>
	                                                                        </c:if>
	                                                                        <c:if test="${empty model}">
		                                                                        暂无消息
	                                                                        </c:if>

                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="425">
	                                            <table width="425" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="348" height="32" style="background: #0a76a4">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="33%" align="center" class="baifont" style="background: #a4752b">驾驶技巧</td>
                                                                    <td width="52%">　</td>
                                                                    <td width="15%"><a href="newslist.asp?cls=驾驶技巧"><img src="${pageContext.request.contextPath}/static/images/homepageimages/more.gif" width="27" height="18" border="0"></a></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="268" valign="top" class="cbk">
                                                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <c:if test="${not empty model}">
                                                                                <c:forEach items="${model.noticeDS}"  var="ds">
                                                                                    <tr  bgcolor='#f4f4f4'>
                                                                                        <td width="90%" height="25" style="font-size: 16px"><a href="${pageContext.request.contextPath}/school/jumpNwePage?id=${ds.id}" target="_blank" title=${ds.title}>${ds.title}</a></td>
                                                                                        <td width="10%"  ><fmt:formatDate type="date" pattern="yyyy/MM/dd" dateStyle="medium" timeStyle="medium" value="${ds.time}" /></td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                            <c:if test="${empty model}">
                                                                                暂无消息
                                                                            </c:if>

                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table width="100%" height="8" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>


        <div class="layui-tab-item">
            <div class="layui-card">

<%--                <div align="cencer">--%>
<%--                    <a target="_blank" href="http://www.mot.gov.cn/"><img class="footer-img" src="${pageContext.request.contextPath}/static/images/homepageimages/2.PNG"/></a><br><br>--%>
<%--                    <a target="_blank" href="http://www.mot.gov.cn/"><img class="footer-img" src="${pageContext.request.contextPath}/static/images/homepageimages/3.PNG"/></a><br><br>--%>
<%--                    <a target="_blank" href="http://www.mot.gov.cn/"><img class="footer-img" src="${pageContext.request.contextPath}/static/images/homepageimages/4.PNG"/></a>--%>
<%--                </div>--%>
    <div style="padding: 50px">
        <a href="${pageContext.request.contextPath}/coach/testwelcome" class="layui-btn layui-btn layui-btn-radius layui-btn-lg layui-anim layui-anim-upbit" style="margin-left: 400px">信息查询</a>
    </div>

            </div>
<%--            <div class="layui-card">--%>
<%--                <div class="layui-card-header">柱形图</div>--%>
<%--                <div class="layui-card-body">--%>
<%--                    <div id="EchartZhu" style="width: 500px;height: 300px;"></div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
        <div class="layui-tab-item"  align="center" >
            <p style="font-size: 20px">注意：</p>
            <div align="left" style="margin-left: 35%;">
                <br>1、申请驾校需要准备营业制造、法人等相应的证件,以world的形式上传；
                <br>2、申请驾校所需要的的信息均为必填项
                <br>3、申请驾校所需要的的信息必须真实,如果虚假将追究法律责任;
                <br>4、审核时间为15个工作日,在网上审核通过后需到当地交管部门备案；
            </div>

            <br> <a href="${pageContext.request.contextPath}/school/path/upload1" class="layui-btn layui-btn-normal layui-btn-radius layui-btn-lg layui-anim layui-anim-up" >驾校申请</a>
        </div>

        <div class="layui-tab-item">
	        <div style="padding: 50px">
		        <a href="${pageContext.request.contextPath}/TM/login" class="layui-btn layui-btn-normal layui-btn-radius layui-btn-lg layui-anim layui-anim-up" style="margin-left: 400px">运管门户</a>
		        <a href="${pageContext.request.contextPath}/school/path/SchoolLogin" class="layui-btn layui-btn layui-btn-radius layui-btn-lg layui-anim layui-anim-upbit">驾校门户</a>
		        <a href="${pageContext.request.contextPath}/coach/login" class="layui-btn layui-btn-warm layui-btn-radius layui-btn-lg layui-anim layui-anim-scale">教练门户</a>
		        <a href="${pageContext.request.contextPath}/student/path/StudentLogin" class="layui-btn layui-btn layui-btn-radius layui-btn-primary layui-btn-lg layui-anim layui-anim-scaleSpring">学员门户</a>
	        </div>
        </div>

	    <!--关于我们-->
	    <div class="layui-tab-item" >
		    <!-- banner部分 -->
		    <div class="banner about" style="margin-top: 0px">
			    <div class="title">
				    <p>关于我们</p>
				    <p class="en">About Us</p>
			    </div>
		    </div>
		    <!-- main部分 -->
		    <div class="main-about">
			    <div class="layui-container">
				    <div class="layui-row">
					    <ul class="aboutab">
						    <li class="layui-this">简介</li>
                            <li>驾驶计时系统介绍</li>
                            <li>发展历程</li>
					    </ul>
					    <div class="tabIntro">
						    <div class="content">
							    <div class="layui-inline img" style="float: left">
								    <img src="${pageContext.request.contextPath}/static/images/homepageimages/handpage5.jpg" style="padding-left: 150px">
							    </div>
							    <div class="layui-inline panel" style="float: right;text-align: center">
								    <p>传一机动车计时培训系统成立于2020年，致力于为道路运输驾乘人提供驾乘全面信息服务。自成立以来，一直围绕安全，不断创新产品和服务，目标通过6余年积累，在产品体系打造、运营经验、市场规模、商业模式构建上处于领先水平。</p>
						        </div>
							    <div style="clear: both"></div>
						    </div>
						    <div class="content" style="width: 100%">
							    <img src="${pageContext.request.contextPath}/static/images/homepageimages/gltb.png" style="width: 100%">
						    </div>
						    <div class="content">
							    <div class="layui-inline panel p_block" style="float: left">
								    <h2>计时平台</h2>
								    <p style="font-size: 16px">
									    稳定性:<br>
									    千万级数据承载量。<br>
									    安全性:<br>
									    构建物理服务器加云服务器的完整灾备体系，在系统遭到不可抗力因素下仍能保证系统的持续运转以及数据的完整、安全<br>
									    智能维护性:<br>
									    网管系统具有监控、故障检测、故障诊断、故障隔离、过滤等功能。<br>
								    </p>
							    </div>
							    <div class="layui-inline img" style="float: right;margin-left: 50px;margin-top: 100px;width: 500px">
								    <img src="${pageContext.request.contextPath}/static/images/homepageimages/about1.jpg">
							    </div>
							    <div style="clear: both"></div>
						    </div>

						    <div class="content">
							    <div class="layui-inline img" style="float: left">
								    <img src="${pageContext.request.contextPath}/static/images/homepageimages/cygltb.png" style="padding-left: 150px;width: 80%;height: 80%">
							    </div>
							    <div class="layui-inline panel" style="float: right">
								    <h2>内部管理</h2>
								        <h3>车管业务管理</h3>
								            <p style="font-size: 14px">
									            学员状态管理：学员报名、预约考试、考试成绩、合格率详情查询及统计分析<br>
									            学员信息预录入：适应各地交管报开学业务流程，减免人员大量重复录入、减少财务风险<br>
								            </p>
									    <h3>视频功能</h3>
								            <p style="font-size: 14px">
									            实时监控：实时展现车内教学情况,保障人车对应，避免违规用车；及时发现和优化培训服务质量问题<br>
									            培训总结：回放教学过程，优化服务态度、提升教学技能<br>
									            直播：培训视频直播，方便打通各类互联网传播工具，吸引用户关注，差异化 招生营销，提升品牌<br>
								            </p>
									    <h3>财务管理</h3>
								            <p style="font-size: 14px">
									            财务审核：教练管理制度化，保证驾校和教练财务结算清晰<br>
									            财务单据：各类财务数据痕迹化，保证驾校和承包教练管理有据可查<br>
									            支付管理：打通支付宝等支付工具，适应多种管理、培训模式（以下正在开发）<br>
								            </p>
									    <h3>管理人员手机端</h3>
								            <p style="font-size: 14px">
									            满足管理层移动办公需求，专属分权限手机端，实时展示驾校招生、培训、出勤、考试、财务等数据<br>
								            </p>
									    <h3>驾校微信公众号</h3>
								            <p style="font-size: 14px">
									            提供多样业务模板，快速搭建驾校自己的微信公众号官网，打通学员咨询、报名、预约、扫码签到等业务数据<br>
								            </p>
							    </div>
							    <div style="clear: both"></div>
						    </div>

						    <div class="content" style="width: 100%">
							    <div class="layui-inline img">
								    <img src="${pageContext.request.contextPath}/static/images/homepageimages/service.jpg" style="width: 1250px">
							    </div>
						    </div>
					    </div>

					    <div class="tabJob">
						    <div class="content">
							    <p class="title">机动车驾驶员计时培训系统介绍</p>
							    <p>>计时系统</p>
							    <p>
								    <span style="padding-left: 2em"></span>机动车驾驶员计时培训系统，以计算机系统及通信信息技术为基础，为提高机动车驾驶员培训质量，满足机动车驾驶员培训机构对学员进行计时计程培训的要求，实现培训记录的电子化，满足道路运输管理机构对学员培训过程进行监管，同时可以面向其他相关机构提供信息服务的系统平台。<br>
							    </p>
							    <p>
								    <span style="padding-left: 2em"></span>机动车驾驶员计时培训系统主要借助卫星定位技术、无线通信技术、图像技术等技术，完成行业管理中心软硬件平台和企业端软件建设。实现驾培机构理论教学点学时记录及教学监管，衔接公安交警部门考试业务流程，实现报名、培训、考试等服务的无缝链接，保证驾培企业的培训质量，维护正规驾培企业和学员的利益，实现整个驾驶培训行业规范化、信息化的管理。<br>
							    </p>
							    <p>>>系统建设目标</p>
							    <ol>
								    <li>实现对普通机动车（汽车）驾驶员培训学时里程信息进行管理, 对机动车驾驶员驾培机构、教练员、教练车、学员培训情况、毕业学员信息等相关内容进行查询、统计和监管。</li>
								    <li>对驾培行业实施许可情况进行记录、监督，对达不到许可条件要求的驾培企业不予登记，使许可实施部门严格按照法规要求实施许可。</li>
								    <li>对驾培企业教学实行全程信息化实时监控，从而实现教学过程、培训学时自动记录，严格避免违规教学，擅自减少学员学时情况。</li>
								    <li>对教练车实行统一登记管理、核发标志牌和相关证件。</li>
								    <li>结合驾培企业质量信誉考评体系对驾培企业考评情况进行记录并通过互联网向社会公布。</li>
								    <li>对招生点实行统一登记管理，招生点信息通过网站向社会公布。</li>
								    <li>与外部平台的对接，与交通、公安、交警等职能部门的数据共享。</li>
							    </ol>
						    </div>
					    </div>

					    <div class="tabCour">
						    <p class="title">我们的蜕变</p>
						    <ul class="timeline">
							    <li class="odd">
								    <div class="cour-img"><img src="${pageContext.request.contextPath}/static/images/homepageimages/us_img4.png"></div>
								    <div class="cour-panel layui-col-sm4 layui-col-lg5">
									    <p class="label">2020 年 4 月 7 日</p>
									    <p>我们相遇了，从一个人到组成了一个团队。</p>
								    </div>
							    </li>
							    <li>
								    <div class="cour-img"><img src="${pageContext.request.contextPath}/static/images/homepageimages/us_img5.png"></div>
								    <div class="cour-panel layui-col-sm4 layui-col-sm-offset8 layui-col-lg5 layui-col-lg-offset7">
									    <p class="label">2020 年 4 月 13 日</p>
									    <p>我们共同分析问题，一起迎接挑战，不再孤单。</p>
								    </div>
							    </li>
							    <li class="odd">
								    <div class="cour-img"><img src="${pageContext.request.contextPath}/static/images/homepageimages/us_img7.png"></div>
								    <div class="cour-panel layui-col-sm4 layui-col-lg5">
									    <p class="label">2020 年 4 月 20 日</p>
									    <p>携手共进，砥砺前行共同进退，相互帮助。</p>
								    </div>
							    </li>
							    <li>
								    <div class="cour-img"><img src="${pageContext.request.contextPath}/static/images/homepageimages/us_img8.jpg"></div>
								    <div class="cour-panel layui-col-sm4 layui-col-sm-offset8 layui-col-lg5 layui-col-lg-offset7">
									    <p class="label">2020 年 4 月 28日</p>
									    <p>项目结束，友谊永恒,感谢有你们。</p>
								    </div>
							    </li>
						    </ul>
					    </div>
				    </div>
			    </div>
		    </div>
	    </div>


    </div>
</div>
<div style="margin-left: 11%;margin-bottom: 10px;">
    <img src="${pageContext.request.contextPath}/static/images/homepageimages/home_logo2.jpg" style="width: 1050px;">
</div>
<div style="padding-left: 11%;padding-bottom: 2px">
    <div id="echarts_div2" style="width: 500px;height: 300px;;float: left;background-color: #f2f4f9"></div>

    <div class="layui-anim layui-anim-scale" style="width: 550px;height: 300px;float: left;">
        <table id="dataTable" lay-filter="test"></table>
    </div>
</div>

<div style="margin-top: 1%">
    <table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="31"><table width="693" height="31" border="0" cellpadding="0" cellspacing="0" style="background: #0000FF;margin-top: 10px;">
                            <tr>
                                <td width="19">　</td>
                                <td width="94" align="center" valign="bottom">
                                    <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center" style="background: white">互动栏</td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="102" valign="bottom">
                                    <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center">　</td>
                                        </tr>
                                    </table>
                                </td>
                                <td>　</td>
                                <td width="46"><a href="huanjing.asp"></a></td>
                            </tr>
                        </table></td>
                    </tr>
                    <tr>
                        <td height="3"></td>
                    </tr>
                    <tr>
                        <td><table width="690" height="165" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
                            <tr>
                                <td align="center" bgcolor="#FFFFFF"><table width="170" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td height="22" align="center"><table width="93%" height="22" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F1F1">
                                            <tr>
                                                <td align="center"><img src="${pageContext.request.contextPath}/static/images/homepageimages/hu0.jpg" width="159" height="128" border="0"></td>
                                            </tr>
                                        </table></td>
                                    </tr>
                                </table></td>

                                <td align="center" bgcolor="#FFFFFF"><table width="170" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td height="22" align="center"><table width="93%" height="22" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F1F1">
                                            <tr>
                                                <td align="center"><img src="${pageContext.request.contextPath}/static/images/homepageimages/hu1.jpg" width="159" height="128" border="0"></td>
                                            </tr>
                                        </table></td>
                                    </tr>
                                </table></td>
                                <td align="center" bgcolor="#FFFFFF"><table width="170" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td height="22" align="center"><table width="93%" height="22" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F1F1">
                                            <tr>
                                                <td align="center"><img src="${pageContext.request.contextPath}/static/images/homepageimages/hu2.jpg" width="159" height="128" border="0"></td>
                                            </tr>
                                        </table></td>
                                    </tr>
                                </table></td>
                                <td align="center" bgcolor="#FFFFFF"><table width="170" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td height="22" align="center"><table width="93%" height="22" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F1F1">
                                            <tr>
                                                <td align="center"><img src="${pageContext.request.contextPath}/static/images/homepageimages/hu3.jpg" width="159" height="128" border="0"></td>
                                            </tr>
                                        </table></td>
                                    </tr>
                                </table></td>
                            </tr>
                        </table></td>
                    </tr>
                </table>
            </td>
            <td width="350" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
                    <tr>
                        <td><img src="${pageContext.request.contextPath}/static/images/homepageimages/r1.jpg" width="248" height="31"></td>
                    </tr>
                    <tr>
                        <td height="168" class="cbk">
                            <table width="100%" height="168" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top" class="lx">
                                        <table width="98%" border="0" cellspacing="1" cellpadding="0">
                                            <tr>
                                                <td width="30%" height="23" align="right" bgcolor="#f4f4f4">总部地址：</td>
                                                <td width="70%" height="23">福建省厦门市思明区观日路56号</td>
                                            </tr>
                                            <tr>
                                                <td height="23" align="right" bgcolor="#f4f4f4">其他分校：</td>
                                                <td height="23">福建省厦门市集美区哈哈路56号</td>
                                            </tr>
                                            <tr>
                                                <td height="23" align="right" bgcolor="#f4f4f4">福州分校：</td>
                                                <td height="23">福建省福州市鼓楼区呱呱007号</td>
                                            </tr>
                                            <tr>
                                                <td height="23" align="right" bgcolor="#f4f4f4">龙岩分校：</td>
                                                <td height="23">福建省龙岩市新罗区观日路56号</td>
                                            </tr>
                                            <tr>
                                                <td height="23" align="right" bgcolor="#f4f4f4">咨询热线：</td>
                                                <td height="23">18812580580 （编主任） </td>
                                            </tr>

                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>

<%--友情链接--%>
<div class="footer" align="center" style="background-color: #0a76a4;padding-bottom: 0px;">
    <div class="footer-box">
        <div class="footer-friend" id="test">
            <table id="tab2">
                <tr id="template2">
                    <td id="template1">
                        <a id="link"> <img src="" id="img"></a>
                    </td>
                </tr>
            </table>

<%--            <c:forEach items="${model.linkList}" var="link">--%>
<%--                <a target="_blank" href="${link.linkUrl}" alt="${link.linkName}"><img--%>
<%--                        src="${pageContext.request.contextPath}/static${link.pictureUrl}" width="252px" height="48px"/></a>--%>
<%--            </c:forEach>--%>
        </div>

</div>

<div align="center" style="background-color: #0a76a4">
    <p class="footer-p">导航链接</p>
    <ul class="footer-orther" style="">
        <li><a target="_blank" href="http://www.jpxcw.com/">全国驾驶培训公共服务平台</a></li>
        <li><a target="_blank"  href="http://www.bjmcn.com">交通运输通信信息集团有限公司</a></li>
    </ul>
</div>


	<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

    $(function () {
        $.ajax({
            async:true,
            method : "POST",
            url :"${pageContext.request.contextPath}/link/linkW",
            dataType : "text",
            success : function(msg) {
                var arr = JSON.parse(msg);
                $.each(arr, function (i, n) {
                    var td = $("#template1").clone();//使用 clone() 方法来复制元素
                    td.find("#img").attr("src","${pageContext.request.contextPath}/static"+n.pictureUrl);
                    td.find("#img").attr({"width":"252","height":"48"});
                    td.find("#link").attr("href",n.linkUrl);
                    td.appendTo("#template2");
                });

            },
            error : function() {
                alert("服务器正忙");
            }
        });
    })

	</script>


<script>
    onload= layui.use(['form', 'layer', 'layedit'], function () {
        $ = layui.jquery;
        var form = layui.form;
        var layer = layui.layer;
        var layedit = layui.layedit;
        //3.页面打开时异步加载数据
        $(function () {
            $.ajax({
                //提交数据的类型 POST GET
                type: "POST",
                //提交的网址
                url: "${pageContext.request.contextPath}/TM/getNoticeType",
                //提交的数据
                //返回数据的格式
                datatype: "text",//“xml”, “html”, “script”, “json”, “jsonp”, “text”.
                //成功返回之后调用的函数
                success: function (data) {
                    console.log($.parseJSON(data));
                    $.each($.parseJSON(data), function (index, item) {
                        $('#type').append(new Option(item.type, item.type));// 下拉菜单里添加元素
                    });
                    layui.form.render("select");
                }, error: function () {
                    alert("查询失败！！！")
                }
            });
        });
    });

    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#date1' //指定元素
        });
    });

    layui.use(['table','laydate','form','jquery'], function(){
        var table = layui.table,
                laydate=layui.laydate,
                form=layui.form,
                $=layui.jquery;
        //表格实例
        table.render({
            elem: '#demo'
            ,height: 280
            ,id:'testReload'
            ,url: '${pageContext.request.contextPath}/TM/getNotice' //数据接口
            ,page: true //开启分页
            ,limit:5
            ,cols: [[ //表头
                // {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                {field: 'title', title: '标题', width:400}
                ,{field: 'content', title: '内容', width:400 , event:'show'}
                ,{field: 'date', title: '发布时间', templet: "<div>{{layui.util.toDateString(d.time, 'yyyy-MM-dd HH:mm:ss')}}</div>",width:150}
                ,{field: 'type', title: '公告类型', width:150}
                // ,{fixed: 'right', width:300, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]]
        });

        //阻止表单提交
        form.on('submit(formDemo)', function(data){
            return false;//阻止表单跳转
        });

        //表格数据重载
        $('#button').on('click',function () {
            var type=$(this).data('type');
            if(type == 'reload'){
                table.reload('testReload',{
                    page:{
                        curr:1
                    }
                    ,where:{
                        title:$("#title").val(),
                        date:$("#date1").val(),
                        type:$("#type").val(),
                    }
                });
            }

        });

        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if(layEvent === 'show'){ //查看
                var notice=JSON.stringify(data);
                $.ajax({
                    //相应路劲
                    url:"${pageContext.request.contextPath}/TM/getNoticeMsg",
                    //是否异步提交
                    async:true,
                    //请求类型
                    type:"post",
                    //数据名
                    data:{"notice":notice},
                    //数据类型:文本
                    datatype:"text",
                    //返回成功消息
                    success:function (msg) {
                        layer.open({
                            type: 2,
                            title: '查看',
                            shadeClose: true,
                            shade: 0.8,
                            area: ['700px', '500px'],
                            content: "${pageContext.request.contextPath}/TM/path/InspectNoticeMsg",
                            yes: function (index, layero) {

                            }
                        });
                    },
                    //返回失败消息
                    error:function () {
                    }
                });

            } else if(layEvent === 'del'){ //删除
                layer.confirm('确定删除数据?', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);

                    var notice=JSON.stringify(data);

                    //向服务端发送删除指令
                    $.ajax({
                        //相应路劲
                        url:"${pageContext.request.contextPath}/TM/deleteNotice",
                        //是否异步提交
                        async:true,
                        //请求类型
                        type:"post",
                        //数据名
                        data:{"notice":notice},
                        //数据类型:文本
                        datatype:"text",
                        //返回成功消息
                        success:function (msg) {
                            layer.alert("删除成功",{icon:6});
                        },
                        //返回失败消息
                        error:function () {
                        }
                    });

                });
            }
        });

    });

</script>

<script>
	layui.use('table',function () {
		var table=layui.table;

		table.on('tool()',function(){

		})
	})
</script>

<script type="text/javascript">
	var nameArr = [];//驾校名称
	var studentArr = [];
	var coachArr = [];
	var nu1=0;
    var obArr = [];
    var obArr1 = [];
	$(function() {
		$.ajax({
			async:true,
			method : "POST",
			url :"${pageContext.request.contextPath}/school/getSchoolName",
			dataType : "text",
			success : function(msg) {
				var arr = JSON.parse(msg);
				for (var i = 0;i<arr.length;i++){
					nameArr.push(arr[i].name);
				}
				createEchars();
			},
			error : function() {
				alert("服务器正忙");
			}
		});
	})

	$(function() {
		// var path = $("#path").val();
		$.ajax({
			async:true,
			method : "POST",
			url :"${pageContext.request.contextPath}/school/getSchoolStudents",
			dataType : "text",
			success : function(msg) {
				var arr = JSON.parse(msg);
				for (var i = 0;i<arr.length;i++) {
                    studentArr.push(arr[i]);

                }

				createEchars();

			},
			error : function() {
				alert("服务器正忙");
			}
		});
	})

	$(function() {
		// var path = $("#path").val();
		$.ajax({
			async:true,
			method : "POST",
			url :"${pageContext.request.contextPath}/coach/getSchoolCoach",
			dataType : "text",
			success : function(msg) {
				var arr = JSON.parse(msg);
				for (var i = 0;i<arr.length;i++){
					coachArr.push(arr[i]);

				}
				createEchars();
			},
			error : function() {
				alert("服务器正忙");
			}
		});
	})

	function createEchars() {

	// 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('EchartZhu'));

    console.log("tupian");

    // 指定图表的配置项和数据
    var optionchart = {
        title: {
        text: '驾校和学员人数'
        },
        tooltip: {},
        legend: {
            data: ['人数']
        },
        xAxis: {
            data: nameArr
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: '教练人数',
            type: 'bar', //柱状
            data: coachArr,
            itemStyle: {
            normal: { //柱子颜色
                color: 'red'
            }
            }
        },{
            name:'学员人数',
            type:'bar',
            data:studentArr,
            itemStyle:{
            normal:{
                color:'blue'
            }
            }
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    // myChart.setOption(option);
    myChart.setOption(optionchart, true);
	}

    $(function() {
        $.ajax({
            async:true,
            method : "POST",
            url :"${pageContext.request.contextPath}/school/school",
            dataType : "text",
            success : function(msg) {
                var arr = JSON.parse(msg);
                for (var i = 0;i<arr.length;i++){
                    obArr1.push({
                        value : arr[i].count,
                        name : arr[i].name
                    });
                }
                rose();
            },
            error : function() {
                alert("服务器正忙");
            }
        });
    })

    //南丁格尔玫瑰图
    function rose() {

        //基于准备好的dom，初始化echarts实例
        var myChart2 = echarts.init(document.getElementById('echarts_div2'));//dark为暗黑主题 不要可以去掉
        var option = {
            title : {
                text : '基础数据'
            },
            series : [ {
                name : '驾校',
                type : 'pie',
                roseType: 'angle',//南丁格尔玫瑰图样式  去掉则显示基本圆饼图
                radius : '55%',
                data : obArr1

            } ]
        };
        myChart2.setOption(option);
    }


    layui.use(['upload', 'jquery', 'layer','table','laydate'], function () { //导入模块
        $ = layui.jquery;
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#dataTable'
            , height: 280
            , url: '${pageContext.request.contextPath}/school/WelcomeTable' //数据接口
            , page: true //开启分页
            , id: 'searchTable'
            , limit: 5
            , limits: [5]
            , cols: [[ //表头
                {field: 'name', title: '驾校', width: 145, sort: true, fixed: 'left', align: 'center',unresize:true}
                , {field: 'countCoach', title: '教练员', width: 110, sort: true,align: 'center',unresize:true}
                , {field: 'countCar', title: '教练车', width: 140, sort: true, align: 'center',unresize:true}
                , {field: 'countStudent', title: '培训能力(人)', width: 150, sort: true, align: 'center',unresize:true}
            ]]
        });
    });



    //首页新闻页面跳转
    function Jump(node) {
        var REPORTID = $(node).attr('title');
        window.location.href="${pageContext.request.contextPath}/school/jumpNwePage?id="+REPORTID


    }

    $(function () {
        $.ajax({
            async:true,
            method : "POST",
            url :"${pageContext.request.contextPath}/school/getNotice",
            dataType : "text",
            success : function(msg) {
                var arr = JSON.parse(msg);
                $.each(arr, function (i, n) {
                    var row = $("#template").clone();
                    console.log(n.title)
                    row.find("#title").text(n.title).attr("title",n.id);
                    row.find("#type").text(n.type);
                    row.find("#time1").text(n.time);
                    row.appendTo("#tab1");//添加到模板的容器中
                });

            },
            error : function() {
                alert("服务器正忙");
            }
        });
    })
    //首页新闻页面跳转
    function Jump(node) {
        var REPORTID = $(node).attr('title');
        window.location.href="${pageContext.request.contextPath}/school/jumpNwePage?id="+REPORTID


    }

</script>

<script type="text/javascript">
	function getB(){
		L2Dwidget
			.on('*', (name) => {
			console.log('%c EVENT ' + '%c -> ' + name, 'background: #222; color: yellow', 'background: #fff; color: #000')
		})
	.init({
			dialog: {
				// 开启对话框
				enable: true,
				script: {
					// 每空闲 10 秒钟，显示一条一言
					'every idle 10s': '$hitokoto$',
					// 当触摸到星星图案
					'hover .star': '星星在天上而你在我心里 (*/ω＼*)',
					// 当触摸到角色身体
					'tap body': '哎呀！别碰我！',
					// 当触摸到角色头部
					'tap face': '要来加入我们吗?！'
				}
			}
		});
	}

</script>

</body>
</html>