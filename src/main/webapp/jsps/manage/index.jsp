<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>首页</title>
		<link href="/basic/html/bootstrap.css" rel="stylesheet">
		<link href="/basic/html/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月18日 上午9:52:00
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
									<li class="active">
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

						<div class="row">

							<div class="span10">

								<div class="slate clearfix">

									<a class="stat-column" href="${pageContext.request.contextPath}/jsps/manage/statisticsNews.jsp">

										<span class="number" id="newsSize"></span>
										<span>全部新闻数</span>

									</a>

									<a class="stat-column" href="${pageContext.request.contextPath}/jsps/manage/statisticsComment.jsp">

										<span class="number" id="commentSize"></span>
										<span>全部评论数</span>

									</a>

									<a class="stat-column" href="${pageContext.request.contextPath}/manage/index/toManageUser">
										<span class="number" id="userSize"></span>
										<span>总用户数</span>
									</a>
									<a class="stat-column" href="${pageContext.request.contextPath}/manage/index/toManageNewsMaker">
										<span class="number" id="newsMakerSize"></span>
										<span>总新闻发布员</span>
									</a>

								</div>

							</div>

						</div>

						<div class="row">

							<div class="span5">

								<div class="slate">

									<div class="page-header">
										<h2><a class="pull-right iconlink" href=""><i class="icon-rss"></i></a>新闻</h2>
									</div>

									<table class="orders-table table">
										<tbody id="newsList">
										</tbody>
									</table>

								</div>

							</div>

							<div class="span5">

								<div class="slate">

									<div class="page-header">
										<h2><i class="icon-envelope-alt pull-right"></i>新闻请求</h2>
									</div>

									<table class="orders-table table">
										<tbody id="newsDeal">

										</tbody>
									</table>

								</div>

							</div>

						</div>

						<div class="row">

							<div class="span10 footer">

								<p>&copy; Panda 2018</p>

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
	<script type="text/javascript">
		$(document).on('ready',
function() {

	getSize();

	function getSize() {
		var timeInterval = 100;
		setTimeout(function() {
			getCommentSize();
		}, timeInterval * 0)
		setTimeout(function() {
			getNewsSize();
		}, timeInterval * 1)
		setTimeout(function() {
			getUserSize();
		}, timeInterval * 2)
		setTimeout(function() {
			getNewsMakerSize();
		}, timeInterval * 3)
		setTimeout(function() {
			get5NewsOrderByTime();
		}, timeInterval * 4)
		setTimeout(function() {
			get5NewsDealOrderByTime();
		}, timeInterval * 5)//				getNewsSize();
				//				getUserSize();
				//				getNewsMakerSize();
				//				get5NewsOrderByTime();
				//				get5NewsDealOrderByTime();
			}

			function getCommentSize() {
				$.ajax({
					type: "get",
					url: "${pageContext.request.contextPath}/manage/index/getAllCommentSize",
					success: function(result) {
						var size = parseInt(result);
						document.getElementById("commentSize").innerText = size;
						//						getNewsSize()
					},
					async: false
				});
			}

			function getNewsSize() {
				$.ajax({
					type: "get",
					url: "${pageContext.request.contextPath}/manage/index/getNewsSize",
					success: function(result) {
						var size = parseInt(result);
						document.getElementById("newsSize").innerText = size;
						//						getUserSize()
					},
					async: false
				});
			}

			function getUserSize() {
				$.ajax({
					type: "get",
					url: "${pageContext.request.contextPath}/manage/index/getUserSize",
					success: function(result) {
						var size = parseInt(result);
						document.getElementById("userSize").innerText = size;
						//						getNewsMakerSize()
					},
					async: false
				});
			}

			function getNewsMakerSize() {
				$.ajax({
					type: "get",
					url: "${pageContext.request.contextPath}/manage/index/getNewsMakerSize",
					success: function(result) {
						var size = parseInt(result);
						document.getElementById("newsMakerSize").innerText = size;
						//						get5NewsOrderByTime()
					},
					async: false
				});
			}

			function get5NewsOrderByTime() {
				$.ajax({
					type: "get",
					url: "${pageContext.request.contextPath}/manage/index/get5NewsOrderByPage?page=1",
					dataType: "json",
					success: function(result) {
						var newsList = result;
						var dom = document.getElementById("newsList")
						//						get5NewsDealOrderByTime();
						set5News(dom, newsList)
						var length = newsList.length;
						setNewTip(dom, length);
					},
					async: false
				});
			}

			function set5News(dom, newsList) {
				var length = newsList.length;
				for(var i = 0; i < length; ++i) {
					var tr = document.createElement("tr");
					var titleTd = document.createElement("td");
					var a = document.createElement("a");
					a.href = "${pageContext.request.contextPath}/manage/index/toNewsDetail?newsId="+newsList[i].id
					
					a.innerText = newsList[i].newsTitle;
					var dateTd = document.createElement("td");
					dateTd.setAttribute("class", "date");
					dateTd.innerText = newsList[i].publishDate;
					titleTd.appendChild(a)
					tr.appendChild(titleTd);
					tr.appendChild(dateTd);
					dom.appendChild(tr);
				}

			}

			function setNewTip(dom, length) {
				var tr = document.createElement("tr");
				var td = document.createElement("td");
				var a = document.createElement("a");
				a.href = "${pageContext.request.contextPath}/manage/index/toDealNews"
				if(length == "0") {
					a.innerText = "没有新闻，点击查看更多新闻";
					return;
				} else {
					a.innerText = "查看更多新闻";
				}
				td.setAttribute("colspan", "2");
				td.appendChild(a);
				tr.appendChild(td);
				dom.appendChild(tr);
			}

			function get5NewsDealOrderByTime() {
				$.ajax({
					type: "get",
					url: "${pageContext.request.contextPath}/manage/index/get5NewsDealOrderByPage?page=1",
					dataType: "json",
					success: function(result) {
						var newsDealList = result;
						var dom = document.getElementById("newsDeal")
						set5News(dom, newsDealList)
						var length = newsDealList.length;
						setNewDealTip(dom, length);
					},
					async: false
				});
			}

			function setNewDealTip(dom, length) {
				var tr = document.createElement("tr");
				var td = document.createElement("td");
				var a = document.createElement("a");
				a.href = "${pageContext.request.contextPath}/manage/index/toNewsApply"
				if(length == "0") {
					a.innerText = "没有任何请求";
				} else {
					a.innerText = "查看更多新闻发布请求";
				}
				td.setAttribute("colspan", "2");
				td.appendChild(a);
				tr.appendChild(td);
				dom.appendChild(tr);
			}
		})
	</script>

</html>