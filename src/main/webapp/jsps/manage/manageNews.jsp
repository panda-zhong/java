<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>管理新闻</title>
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
							<h4 class="alert-heading">提示</h4> 此处新闻都以发布
						</div>

						<div class="row">

							<div class="span10">

								<div class="slate">

									<div class="page-header">
										<h2>最新新闻</h2>
									</div>

									<table class="orders-table table">
										<thead>
											<tr>
												<th>新闻</th>
												<td class="value">类型</td>
												<th class="actions">操作</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${NEWSBYPAGEINSESSION}" var="news">
												<tr id="news${news.id}">
													<td>
														<a href="vieworder.html">${news.newsTitle}</a>
														<br />
														<span class="meta"><fmt:formatDate value="${news.saveDate}" pattern="yyyy-MM-dd hh:mm:ss" /></span>
													</td>
													<td class="value">
														<span class="label label-info">${news.kindName}</span>
													</td>
													<td class="actions">
														<a class="btn btn-small btn-danger no" id="${applyMessage.id}" data-toggle="modal" href="${pageContext.request.contextPath}/manage/dealNews/delete?newsId=${news.id}">删除</a>
														<!--${pageContext.request.contextPath}/manage/dealNews/delete?newsId=${news.id}-->
														<a class="btn btn-small btn-primary" href="${pageContext.request.contextPath}/manage/index/toNewsDetail?newsId=${news.id}">查看</a>
													</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>

								</div>

							</div>

							<div class="span5">

								<div class="pagination pull-left">
									<ul id="pages">
									</ul>
								</div>

							</div>

						</div>

						<div class="row">

							<div class="span10 footer">

								<p>&copy; Website Name 2014</p>

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
		$(document).on('ready', function() {
			getNewsNumner();

			function getNewsNumner() {
				$.ajax({
					type: "get",
					url: "${pageContext.request.contextPath}/manage/index/getNewsSize",
					success: function(result) {
						var newsNumber = result;
						setPages(newsNumber);
					},
					async: false
				});
			}
			function setPages(size) {
				var numberInPage = 5;
				var pages = Math.ceil((size - 1) / numberInPage);
				console.log(pages)
				var page = parseInt("${NEWSPAGEINSESSION}");
				console.log(page)
				var ulDom = document.getElementById("pages");
				if(page != 1) {
					//	需要首页
					var li = document.createElement("li");
					var a = document.createElement("a");
					a.href = "${pageContext.request.contextPath}/manage/index/toDealNews";
					a.innerText = "首页"
					li.appendChild(a)
					ulDom.appendChild(li)
				}

				for(var i = 1; i <= pages; ++i) {
					var li = document.createElement("li");
					var a = document.createElement("a");
					if(page==i){
						a.setAttribute('class','active')
					}
					a.href = "${pageContext.request.contextPath}/manage/dealNews/getNewsByPage?page="+(i);
					a.innerText = i
					li.appendChild(a)
					ulDom.appendChild(li)

				}
				if(page!=pages){
					var li = document.createElement("li");
					var a = document.createElement("a");
					a.href = "${pageContext.request.contextPath}/manage/dealNews/getNextPageNews";
					a.innerText = "下一页"
					li.appendChild(a)
					ulDom.appendChild(li)
				}
			}

		})
	</script>

</html>