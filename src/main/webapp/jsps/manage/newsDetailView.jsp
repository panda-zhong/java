<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>新闻详情</title>
		<link href="/basic/html/bootstrap.css" rel="stylesheet">
		<link href="/basic/html/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
		<style type="text/css">
			.main ul {
				text-align: center;
				font-family: 宋体;
			}
			
			.main ul>li {
				list-style-type: none;
			}
			
			.main ul>li>h1 {
				font-weight: hold;
			}
			
			.main ul>li>h5 {
				color: rgb(128, 128, 128);
			}
			
			.main ul>li>h5>a {
				text-indent: 2em;
				text-decoration: none;
				color: rgb(128, 128, 128);
			}
			
			.main ul>li>h5>a:hover {
				text-decoration: underline;
			}
			
			.main .blue {
				color: blue;
			}
			
			.main #red {
				color: red;
			}
			
			.main ul>li>img {
				width: 200px;
			}
			
			.main ul>li>p {
				text-indent: 2em;
				text-align: left;
				font-size: 18px;
				width: 750px;
				margin: 0 auto;
			}
			
			.main .foot li {
				font-weight: hold;
				width: 750px;
				list-style-type: square;
				text-align: left;
				margin: 0 auto;
			}
			
			.main #back-top {
				position: fixed;
				width: 60px;
				height: 60px;
				bottom: 30px;
				right: 30px;
				background: #ccc;
				text-align: center;
				line-height: 60px;
				text-decoration: none;
			}
			
			.main #mycanvas {
				margin: 0 auto;
				display: block;
				border: 1px solid black;
				background-color: black;
				width: 40%;
				height: 200px;
			}
			
			#pn {
				width: 550px;
				height: auto;
				background: #fff;
				margin: 0 auto;
				padding: 20px;
			}
			
			.list0 {
				padding: 20px 0;
				position: relative;
				border-top: 1px solid #eee;
			}
			
			.head {
				width: 60px;
				float: left;
			}
			
			.head img {
				width: 60px;
				height: 60px;
			}
			
			.close {
				width: 20px;
				height: 20px;
				position: absolute;
				top: 0;
				right: 0;
				color: #696e78;
				font-size: 14px;
				text-align: center;
				line-height: 20px;
			}
			
			.close:hover {
				color: #eb7350;
			}
			
			.content {
				width: 450px;
				line-height: 20px;
				font-size: 14px;
				margin-left: 70px;
			}
			
			.name {
				color: #eb7350;
			}
			
			.pic {
				margin: 5px 0;
			}
			
			.good:after {
				clear: both;
				content: '';
				display: block;
				width: 0;
				height: 0;
				visibility: hidden;
			}
			
			.good {
				*zoom: 1;
			}
			
			.date {
				float: left;
				color: #808080;
			}
			
			.good a {
				float: right;
				color: #808080;
			}
			
			.people {
				background: #F7F7F7;
				height: 28px;
				line-height: 28px;
				padding-left: 10px;
				margin: 5px 0;
			}
			
			.comment:after {
				clear: both;
				content: '';
				display: block;
				width: 0;
				height: 0;
				visibility: hidden;
			}
			
			.comment {
				*zoom: 1;
				padding: 10px 0;
				border-top: 1px solid #eee;
			}
			
			.comment-left {
				width: 30px;
				float: left;
				display: inline;
				margin-right: 10px;
			}
			
			.comment-left img {
				width: 30px;
				height: 30px;
			}
			
			.comment-right {
				float: left;
				width: 410px;
			}
			
			.comment-text {
				line-height: 18px;
			}
			
			.comment-text span {
				color: #eb7350;
			}
			
			.comment-date {
				font-size: 12px;
				line-height: 14px;
				color: #ccc;
				position: relative;
			}
			
			.comment-zan {
				position: absolute;
				right: 40px;
				bottom: 0;
				color: #808080;
			}
			
			.comment-dele {
				position: absolute;
				right: 0;
				bottom: 0;
				color: #808080;
			}
			
			.hf:after {
				clear: both;
				content: '';
				display: block;
				width: 0;
				height: 0;
				visibility: hidden;
			}
			
			.hf {
				*zoom: 1;
			}
			
			.hf-text {
				border: 1px solid #eee;
				display: block;
				height: 15px;
				width: 438px;
				padding: 5px;
				resize: none;
				color: #ccc;
				font-size: 12px;
			}
			
			.myarea {
				border: 1px solid #eee;
				display: block;
				height: 15px;
				width: 438px;
				padding: 5px;
				resize: none;
				color: #ccc;
				font-size: 12px;
			}
			
			.hf-on .hf-text {
				height: 60px;
				color: #333;
				border: 1px solid #ff8140;
			}
			
			.hf-btn {
				float: right;
				width: 65px;
				height: 26px;
				background: #f7f7f7;
				color: #ccc;
				font-size: 12px;
				display: none;
			}
			
			.hf-btn-on {
				background: #ff8140;
				color: #fff;
			}
			
			.hf-nub {
				float: right;
				padding: 3px 5px;
				color: #666;
				display: none;
			}
			
			.hf-on .hf-btn {
				display: inline;
			}
			
			.hf-on .hf-nub {
				display: inline;
			}
			
			.comment-area {
				width: 40%;
				height: 160px;
				margin: 0 auto;
			}
			
			.comment-area h4 {
				color: #B1B1B1;
				font-weight: 100;
				font-size: 14px;
			}
			
			.comment-area #div_editor {
				width: 530px;
				border: 1px solid #A9A9A9;
			}
			
			.comment-area #div_editor textarea {
				/*border:1px solid gainsboro;*/
				border: 0;
				width: 500px;
				height: 60px;
				outline: 0px;
				resize: none;
			}
			
			.comment-area #div_editor div.d-last {
				text-align: right;
				font-size: 10px;
				color: #B1B1B1;
				display: none;
			}
			
			.comment-area #btn_submit {
				color: white;
				background-color: #8AC328;
				width: 80px;
				height: 25px;
				border: 1px solid #9CC868;
				margin: 1px;
				float: right;
			}
			
			#pn .getComment {}
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

						<div class="row">
							<div class="span10">

								<div class="main">
									<ul>
										<li>
											<h1>
						${NEWSDETAILINSESSION.newsTitle}
					</h1>
											<h5>
					${NEWSDETAILINSESSION.publishDate}
					&nbsp;
					${NEWSDETAILINSESSION.newsAuthor}
					<a href="#pn" class="blue">评论(<span id="red">
						${NEWSDETAILINSESSION.commentSize}
					</span>)
					</a>
				</h5>
									</ul>
									<hr />
									<iframe name="src" seamless="seamless" frameborder=0 scrolling=no src="//localhost:8080/basic/html/${NEWSDETAILINSESSION.savePath}" width="100%" onload="setIframeHeight(this)"></iframe>
									<hr />
								</div>

								<ul id="pn" class="row">
									<div class="page-header">
										<h2>新闻评论区：</h2>
									</div>
									<c:forEach items="${COMMENTINSESSION}" var="comment">
										<li class="list0">
											<div class="head">
												<img src="/basic/upload/${comment.user.logo}" alt="">
											</div>
											<div class="content">
												<p class="text">
													<span class="name">${comment.user.name}:</span>
													<span id="${comment.user.account}NEWS${comment.time.time}">${comment.context}</span>
												</p>
												<div class="good">
													<span class="date">
					<fmt:formatDate value="${comment.time}" pattern="yyyy-MM-dd HH:mm:ss" />
					</span>
													<jsp:useBean id="nowDate" class="java.util.Date"></jsp:useBean>
													<c:set var="interval" value="${nowDate.time - comment.time.time}" />
													<%--时间差毫秒数--%>
													<fmt:formatNumber value="${interval/(1000*60)}" pattern="#0" var="mins" />
													<%--取分钟差整数--%>
													<a class="dzan" id="${comment.user.account}NEWS${comment.time.time}" href="${pageContext.request.contextPath}/manage/dealNews/deleteComment?newsId=${NEWSDETAILINSESSION.id}&userId=${comment.user.account}&time=${comment.time.time}" >删除</a>
												</div>
											</div>
										</li>
									</c:forEach>
								</ul>

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
		function setIframeHeight(iframe) {
			if(iframe) {
				var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
				if(iframeWin.document.body) {
					iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
				}
			}
		};

		window.onload = function() {
			setIframeHeight(document.getElementById('external-frame'));
		};
	</script>

</html>