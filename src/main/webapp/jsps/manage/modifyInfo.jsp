<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>修改个人信息</title>
		<link href="/basic/html/bootstrap.css" rel="stylesheet">
		<link href="/basic/html/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月18日 下午9:20:10
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
									<li class="active">
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
							<a class="close" data-dismiss="alert" href="javaScript:">x</a>
							<h4 class="alert-heading">提示</h4> 账号无法修改
						</div>

						<div class="row">

							<div class="span2 profileicon">

								<img src="/basic/upload/${MANAGEINSESSION.logo}" width="100%"/>
								<p><strong>注册时间:</strong></p>
								<p>${MANAGEINSESSION.registerTime}</p>
								<p><strong>账号:</strong>
								<p class="success">
									${MANAGEINSESSION.account}
								</p>

							</div>
							<div class="span8">
								<div class="slate">
									<div class="page-header">
										修改信息
									</div>
									<div class="control-group">
										<label class="control-label" for="name">姓名：</label>
										<div class="controls">
											<input type="text" id="name" name="name" id="" value="${MANAGEINSESSION.name}" />
											<button class="btn btn-success" id="changeName">修改</button>
										</div>

									</div>
									<form action="${pageContext.request.contextPath}/manage/modifyInfo/modifyLogo" class="form-horizontal" method="post" nctype="multipart/form-data">
										<fieldset>
											<div class="control-group">
												<label for="logo">头像：</label>
												<div class="span2">
													<img src="/basic/upload/${MANAGEINSESSION.logo}" class="img-rounded" id="img" style="width: 100%;" />
												</div>
												<div class="controls">
													<input type="file" name="" id="logo" onchange="show(&quot;img&quot;,&quot;logo&quot;)" value="" />
												</div>
												<div class="controls">
													<button type="submit" class="btn btn-success">修改</button>
												</div>
											</div>
										</fieldset>

									</form>
								</div>
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
		$("#changeName").on("click",function(){
			var name = $("[name=name]").val();
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/manage/modifyInfo/modifyName",
				data:{
					"name":name
				},
				dataType:'json',
				success:function(result){
					location.reload();
				},
				async:true
			});
		})
	</script>
</html>