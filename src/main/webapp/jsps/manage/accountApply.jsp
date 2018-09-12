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
		<title>账号申请处理</title>
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
						<c:if test="${APPLYMESSAGEINSESSION.size()>0}">
							<div class="alert alert-info">
								<a class="close" data-dismiss="alert" href="#">x</a>

								<h4 class="alert-heading">提示</h4> 当鼠标移到该位置既能显示"不通过"的标签

							</div>
						</c:if>
						<c:if test="${APPLYMESSAGEINSESSION.size()<=0}">
							<div class="alert alert-error">
								<a class="close" data-dismiss="alert" href="#">x</a>
								<h4 class="alert-heading">提示</h4> 暂时没有任何账号请求

							</div>

						</c:if>
						<div class="row ">

							<div class="span10 ">

								<div class="slate ">
									<c:if test="${APPLYMESSAGEINSESSION.size()>0}">
										<table class="orders-table table">
											<thead>
												<tr>
													<th>账号</th>
													<th>类型</th>
													<th class="actions">操作</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach items="${APPLYMESSAGEINSESSION}" var="applyMessage">
													<tr id="apply${applyMessage.id}">
														<td>
															<span class="label label-info">${applyMessage.account }</span><br />
														</td>
														<td>
															<span class="label label-info">${applyMessage.kindName }</span><br />
														</td>

														<td class="actions">
															<a class="btn btn-small btn-danger no" id="${applyMessage.id}" data-toggle="modal" href="javascript:">拒绝</a>
															<a class="btn btn-small btn-primary yes" id="${applyMessage.id}" href="javascript:">接受</a>
															<p class="meta tip" id="tip${applyMessage.id}"></p>
														</td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</c:if>
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
	<script type="text/javascript">
		$(".yes").click(function() {
			var applyId = this.id;
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/manage/dealWithApplyMessage/accept",
				data: {
					"applyId": applyId,
				},
				success: function() {
					document.getElementById("tip" + applyId).innerText = "已接受";
				},
				async: true
			});
			setTimeout(function() {
				$("#apply" + applyId).hide(500)
			}, 500)
		})
		$(".no").click(function() {
			var applyId = this.id;
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/manage/dealWithApplyMessage/refuse",
				data: {
					"applyId": applyId,
				},
				success: function() {
					document.getElementById("tip" + applyId).innerText = "已拒绝";
				},
				async: true
			});
			setTimeout(function() {
				$("#apply" + applyId).hide(500)
			}, 500)
		})
	</script>

</html>