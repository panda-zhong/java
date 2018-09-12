<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<link href="/basic/html/bootstrap.css" rel="stylesheet">
		<link href="/basic/html/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
		<title>评论统计</title>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月18日 下午7:41:09
-->

	<body>
		<%@include file="css_js.jsp"%>

		<div class="container">
			<div class="row">
				<div class="span2">

					<div class="main-left-col">

						<!--<h1>-->
						<img src="/basic/upload/${MANAGEINSESSION.logo}" />
						<!--</h1>-->

						<ul class="side-nav">

							<li class="active">
								<a href="${pageContext.request.contextPath}/manage/login/index"><i class="icon-home"></i> 首页</a>
							</li>

							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="collapse" data-target="#website-dropdown" href="javaScript:"><i class="icon-group"></i> 管理 <b class="caret"></b></a>
								<ul id="website-dropdown" class="collapse">
									<li>
										<a class="dropdown-toggle" data-toggle="collapse" data-target="#manageAccount-dropdown" href="javaScript:"><i class="icon-group"></i> 账号管理 <b class="caret"></b></a>
										<ul id="manageAccount-dropdown" class="collapse">
											<li>
												<a href="${pageContext.request.contextPath}/manage/index/toManageNewsMaker"> &nbsp;新闻发布员</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/manage/index/toManageUser"> &nbsp;用户</a>
											</li>
										</ul>

									</li>
									<li>
										<a href="${pageContext.request.contextPath}/manage/index/toDealNews">新闻管理</a>
									</li>
								</ul>
							</li>

							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="collapse" data-target="#notice-dropdown" href="javaScript:"><i class="icon-bullhorn"></i> 通知 <span class="badge badge-warning" id="noticeSize"></span><b class="caret"></b></a>
								<ul id="notice-dropdown" class="collapse">
									<li>
										<a href="${pageContext.request.contextPath}/manage/index/toDealWithApplyMessage">账号申请 <span class="badge badge-warning" id="applyMessageSize">2</span></a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/manage/index/toNewsApply">新闻发布 <span class="badge badge-warning" id="newsDealSize"></span></a>
									</li>
								</ul>
							</li>

							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="collapse" data-target="#statistics-dropdown" href="javaScript:"><i class="icon-bullhorn"></i> 统计 <b class="caret"></b></a>
								<ul id="statistics-dropdown" class="collapse">
									<li>
										<a href="${pageContext.request.contextPath}/jsps/manage/statisticsNews.jsp">新闻统计 </a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/jsps/manage/statisticsComment.jsp">评论统计</a>
									</li>
								</ul>
							</li>

							<li class="dropdown">
								<a class="dropdown-toggle" href="${pageContext.request.contextPath}/jsps/manage/modifyInfo.jsp"><i class="icon-cogs"></i> 个人信息</a>
							</li>

						</ul>

					</div>
					<!-- end main-left-col -->

				</div>
				<!-- end span2 -->

				<div class="span10">

					<div class="secondary-masthead">

						<ul class="nav nav-pills pull-right">
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="javaScript:"><i class="icon-user"></i> ${MANAGEINSESSION.name}<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a href="${pageContext.request.contextPath}/manage/login/index">主页</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/jsps/manage/modifyInfo.jsp">我的信息</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="${pageContext.request.contextPath}/manage/login/logout">注销</a>
									</li>
								</ul>
							</li>
						</ul>

						<ul class="breadcrumb">
							<li>
								<a href="${pageContext.request.contextPath}/manage/login/index">管理员</a>
							</li>
						</ul>

					</div>
				<div class="main-area dashboard">
						<div class="alert alert-info">
							<a class="close" data-dismiss="alert" href="#">x</a>

							<h4 class="alert-heading">提示</h4> 此处为所有用户评论数目

						</div>
						<div class="row ">
							<div class="span10 ">
								<div class="slate">

									<div class="page-header">
										<h2><i class="icon-signal pull-right"></i>评论统计</h2>
									</div>
									<div id="placeholder" style="height: 400px;"></div>

								</div>
							</div>

						</div>

						<div class="row">

							<div class="span10 footer">

								<p>&copy; panda 2018</p>

							</div>

						</div>

					</div>

				</div>
				<!-- end span10 -->

			</div>
			<!-- end row -->

		</div>
		<!-- end container -->

	</body>
	<script src="/basic/html/jquery.flot.min.js"></script>
	<script type="text/javascript">
		$(document).on('ready', function() {
			var thisYear = new Date().getFullYear();
			getCommentSize();

			function getCommentSize() {
				$.ajax({
					type: "get",
					url: "${pageContext.request.contextPath}/manage/statistics/getCommentSizeByMonth?year=" + thisYear,
					dataType: "json",
					success: function(result) {
						var resultMap = {
							month01:0,
							month02:0,
							month03:0,
							month04:0,
							month05:0,
							month06:0,
							month07:0,
							month08:0,
							month09:0,
							month10:0,
							month11:0,
							month12:0,
						};
						resultMap = result
						setPlot(resultMap)
					},
					async: false
				});
			}

			function setPlot(resultMap) {
				console.log(resultMap)
				var monthDate = [];
				var month01 = resultMap.month01;
				var month02 = resultMap.month02;
				var month03 = resultMap.month03;
				var month04 = resultMap.month04;
				var month05 = resultMap.month05;
				var month06 = resultMap.month06;
				var month07 = resultMap.month07;
				var month08 = resultMap.month08;
				var month09 = resultMap.month09;
				var month10 = resultMap.month10;
				var month11 = resultMap.month11;
				var month12 = resultMap.month12;
				$.plot($("#placeholder"), [{
					label: "用户评论数目",
					data: [
						[new Date(thisYear, 0), month01],
						[new Date(thisYear, 1),  month02],
						[new Date(thisYear, 2), month03],
						[new Date(thisYear, 3), month04],
						[new Date(thisYear, 4), month05],
						[new Date(thisYear, 5), month06],
						[new Date(thisYear, 6), month07],
						[new Date(thisYear, 7), month08],
						[new Date(thisYear, 8), month09],
						[new Date(thisYear, 9), month10],
						[new Date(thisYear, 10), month11],
						[new Date(thisYear, 11), month12],
					]
				}, ], {
					xaxis: {
						mode: "time",
						timeformat: "%y/%m",
						min:new Date(thisYear,1),
						max:new Date(thisYear, 12)
					},
					yaxis: {
						min:0,
						autoscaleMargin:0.25
					}
				});
			}

		})
	</script>

</html>