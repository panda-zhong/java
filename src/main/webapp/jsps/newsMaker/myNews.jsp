<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>我的新闻</title>
		<link href="/basic/html/bootstrap.css" rel="stylesheet">
		<link href="/basic/html/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
		
		<style type="text/css">
			td img {
				width: 50px;
				height: 50px;
			}
		</style>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月12日 下午4:29:12
-->

	<body>
		<%@include file="css_js.jsp"%>
		<div class="container">
			<div class="row">
				<div class="span2">

					<div class="main-left-col">

						<!--<h1>-->
						<img src="/basic/upload/${NEWSMAKERINSESSION.logo}" />
						<!--</h1>-->

						<ul class="side-nav">

							<li class="dropdown active">
								<a class="dropdown-toggle" href="http://localhost:8080/news/newsMaker/index/myNews"><i class="icon-cogs"></i> 我的新闻</a>
							</li>
							<li class="dropdown ">
								<a class="dropdown-toggle" href="${pageContext.request.contextPath}/jsps/newsMaker/addNews.jsp"><i class="icon-cogs"></i> 写新闻</a>
							</li>
							<li class="dropdown ">
								<a class="dropdown-toggle" href="${pageContext.request.contextPath}/jsps/newsMaker/modifyInfo.jsp"><i class="icon-cogs"></i> 我的信息</a>
							</li>
							<li class="dropdown">
								<a class="dropdown-toggle" href="${pageContext.request.contextPath}/newsMaker/login/logout"><i class="icon-cogs"></i> 退出</a>
							</li>
						</ul>

					</div>
					<!-- end main-left-col -->

				</div>
				<!-- end span2 -->

				<div class="span10">

					<div class="secondary-masthead">

						<ul class="breadcrumb">
							<li>
								<a href="#">${NEWSMAKERINSESSION.name} </a>
							</li>
						</ul>

					</div>

					<div class="main-area dashboard">
						<div class="alert alert-info">
							<a class="close" data-dismiss="alert" href="#">x</a>

							<h4 class="alert-heading">提示</h4> 此处为所有你所发布的新闻信息

						</div>
						<div class="row ">

							<div class="span10 ">

								<div class="slate ">

									<table class="orders-table table"  style="table-layout:fixed;">
										<thead>
											<tr>

												<th>标题</th>
												<th>作者</th>
												<th>新闻图片</th>
												<th>类型</th>
												<th>保存时间</th>
												<th>操作</th>
												<th>发布时间</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${MYNEWSINSESSION}" var="myNews">
												<tr id="news${myNews.id}">
													<td style="width: 250px;white-space: nowrap;text-overflow: ellipsis;overflow: hidden; ">${myNews.newsTitle}</td>
													<td>${myNews.newsAuthor }</td>
													<td><img src="/basic/upload/${myNews.titleImage}" /></td>
													<td>${myNews.kindName}</td>
													<td>
														<fmt:formatDate value="${myNews.saveDate}" pattern="yyyy-MM-dd" />
													</td>
													<td>
														<a href="${pageContext.request.contextPath}/newsMaker/index/toModifyNews?id=${myNews.id}" class="btn btn-small btn-primary modify" id="${myNews.id}">
															编辑
														</a>
														<c:choose>
															<c:when test="${myNews.state==null}">
																<a class="btn btn-small btn-success review" id="${myNews.id}">审核发布</a>
															</c:when>
															<c:when test="${myNews.state==0}">
																审核未通过
															</c:when>
															<c:when test="${myNews.state==1}">
																已发布
															</c:when>
															<c:when test="${myNews.state==2}">
																待审核
															</c:when>
														</c:choose>
														<a href="${pageContext.request.contextPath}/newsMaker/news/delete?newsId=${myNews.id}" class="btn btn-small  btn-danger delete" id="${myNews.id}">
															删除
														</a>
													</td>
													<td>
														<span class="tip" id="tip${myNews.id}">
							<c:if test="${myNews.state==1}">
								${myNews.publishDate}
							</c:if>
						</span>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</div>

						</div>

						<div class="row">

							<div class="span10 footer">

								<p>&copy; panda 2019</p>

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
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript">
		$('.modify').on('click', function() {
			var newsId = this.id;
			window.location.href = "" + newsId;
		})
		$(".review").on('click', function() {
			var newsId = this.id;
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/newsMaker/news/toReviewNews",
				data: {
					'newsId': newsId
				},
				dataType: "json",
				success: function(result) {
					window.location.href = "${pageContext.request.contextPath}/newsMaker/index/myNews"
				},
				async: true
			});
		})
	</script>

</html>