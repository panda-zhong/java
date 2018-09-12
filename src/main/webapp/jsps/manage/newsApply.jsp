<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>新闻发布申请</title>
		<link href="/basic/html/bootstrap.css" rel="stylesheet">
		<link href="/basic/html/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
		<style type="text/css">
			.proRow p {
				font-size: 0.88rem;
				/*1.4em × 10 = 14px */
			}
			
			.proRow {
				font-size: 62.5%;
				font-weight: lighter;
				display: flex;
				flex-wrap: wrap;
			}
			
			.proBig {
				width: 211px;
				margin: 15px 15px;
				position: relative;
			}
			
			.pro {
				border: 1px solid #ccc;
				height: 300px;
			}
			
			.proImg {
				width: 211px;
				height: 196px;
				text-align: center;
			}
			
			.proImg img {
				height: 196px;
				width: 100%;
			}
			
			.proText {
				margin: 10px 10px;
				height: 60px;
			}
			
			h5 {
				font-size: 1rem;
				margin: 0 auto;
				font-weight: initial;
			}
			
			.proSize {
				font-size: 0.6rem;
				color: #95989A;
				margin: 3px auto;
			}
			
			.proPrice span {
				font-size: 1.2rem;
				font-weight: initial;
				font-style: italic;
			}
			
			.proFrom {
				text-align: right;
				margin-right: 10px;
			}
			
			.proBtn {
				width: 211px;
				height: 300px;
				background-color: #fff;
				background-color: rgba(255, 255, 255, 0.5);
				position: absolute;
				box-sizing: border-box;
				padding-top: 80px;
				margin-top: -362px;
				display: none;
			}
			
			.proBig:hover .proBtn {
				display: block;
			}
			
			.btn {
				width: 167px;
				height: 50px;
				margin: 10px auto;
				background-color: #FCDD00;
				display: flex;
				justify-content: center;
				align-items: center;
				box-sizing: border-box;
			}
			
			.btn:hover {
				border: 1px solid #66503B;
			}
		</style>
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
						<c:if test="${NEWSAPPLTINSESSION.size()<=0}">
							<div class="alert alert-error">
								<a class="close" data-dismiss="alert" href="#">x</a>
								<h4 class="alert-heading">提示</h4> 暂时没有任何新闻发布请求

							</div>

						</c:if>
						<div class="row">

							<div class="span10">
								<div class="proRow">
									<c:forEach items="${NEWSAPPLTINSESSION}" var="news">
										<div class="proBig" id="news${news.id}">
											<div class="pro">
												<div class="proImg">
													<img src="/basic/upload/${news.titleImage}">
												</div>
												<div class="proText">
													<h5>${news.newsTitle}</h5>
													<p class="proSize">
														<fmt:formatDate value="${news.saveDate}" pattern="yyyy-MM-dd hh:mm:ss" />
													</p>
													<p class="proPrice">类型： <span>${news.kindName}</span></p>
												</div>
												<div class="proFrom">作者：${news.newsAuthor }</div>
											</div>
											<a href="javaScript:">
												<div class="proBtn">
													<a href="${pageContext.request.contextPath}/manage/index/toNewsDetail?newsId=${news.id}">
														<div class="btn">
															查看
														</div>
													</a>
													<a href="${pageContext.request.contextPath}/manage/dealNews/accept?newDealId=${news.dealId}">
														<div class="btn">
															通过
														</div>
													</a>
													<a href="${pageContext.request.contextPath}/manage/dealNews/refuse?newDealId=${news.dealId}">
														<div class="btn">
															拒绝
														</div>
													</a>
												</div>
											</a>
										</div>
									</c:forEach>
								</div>
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

</html>