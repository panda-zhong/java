<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>修改信息</title>
		<link href="/basic/html/bootstrap.css" rel="stylesheet">
		<link href="/basic/html/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
		<script src="/basic/html/ueditor/ueditor.config.js" type="text/javascript" charset="utf-8"></script>
		<script src="/basic/html/ueditor/ueditor.all.js" type="text/javascript" charset="utf-8"></script>
		<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
		<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
		<style type="text/css">
			p img {
				width: 100px;
				height: 100px;
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

							<li class="dropdown ">
								<a class="dropdown-toggle" href="http://localhost:8080/news/newsMaker/index/myNews"><i class="icon-cogs"></i> 我的新闻</a>
							</li>
							<li class="dropdown ">
								<a class="dropdown-toggle" href="${pageContext.request.contextPath}/jsps/newsMaker/addNews.jsp"><i class="icon-cogs"></i> 写新闻</a>
							</li>
							<li class="dropdown active">
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

							<h4 class="alert-heading">提示</h4> 修改信息

						</div>
						<div class="row ">

							<div class="span10 ">

								<div class="slate ">
									<form id="newsForm" action="#" method="post" enctype="multipart/form-data">
										<table class="orders-table table" style="table-layout:fixed;">
											<tbody>
												<tr>
													<td>
														姓名：
													</td>
													<td>
														<input type="text" id="name" name="name" value="${NEWSMAKERINSESSION.name}" />
													</td>
													<td>
														<a href="#" class="changeName btn btn-small btn-primary">修改</a>
													</td>
												</tr>
												<tr>
													<td>
														头像：
													</td>
													<form action="${pageContext.request.contextPath}/newsMaker/modifyInfo/modifyLogo" method="post" enctype="multipart/form-data">
														<td>
															<input type="file" name="logo" id="logo" />
														</td>
														<td>
															<input type="submit" class="btn btn-small btn-primary"value="修改头像" />
														</td>
													</form>
												</tr>
												<tr>
													<p>
														<span id="tip"></span>
													</p>
												</tr>
											</tbody>
										</table>

									</form>
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
		$(".changeName").on("click", function() {
			var name = $("[name=name]").val();
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/newsMaker/modifyInfo/modifyName",
				data: {
					"name": name
				},
				dataType: 'json',
				success: function(result) {
					document.getElementById("tip").innerText = "修改姓名成功";
					location.reload();
				},
				async: true
			});
		})
	</script>

</html>