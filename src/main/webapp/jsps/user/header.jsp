<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>title</title>
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="//localhost:8080/newsManage/css/header.css" charset="utf-8" />
		<style type="text/css">
			header {
				width: 100%;
				height: 37px;
				background-color: #C82F03;
			}
			
			header a {
				text-decoration: none;
				color: white;
			}
			
			header .channel-all {
				width: 80%;
				height: 100%;
				background-color: #C82F03;
				margin: 0 auto;
			}
			
			header .channel-all ul {
				list-style-type: none;
			}
			
			header .channel-all ul li {
				text-align: left;
				float: left;
				padding-left: 10px;
				padding-right: 10px;
				height: 100%;
				line-height: 35px;
				font-size: 18px;
			}
			
			header .channel-all ul li:hover {
				background-color: #DA5B21;
			}
			header li img{
				width: 35px; height: 35px; position: absolute; right: -20%;top:1%;
			}
		</style>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月3日 上午10:26:29
-->

	<body>
		<%-- 用户首页：
		 </text> 
	<a href="">注销</a>--%>

		<header>
			<div id="channel-all" class="channel-all clearfix" style="z-index: 9;">
				<div class="menu-list">
					<ul class="clearfix lavalamp" style="position: relative;">
						<div class="lavalamp-object" style="position: absolute; width: 69px; height: 40px; top: 0px; left: 0px; overflow: hidden;"></div>
						<li class="navitem-index current active lavalamp-item" style="z-index: 5; position: relative;"><i class="fa fa-home" aria-hidden="true"></i>
							<a href="${pageContext.request.contextPath}/jsps/user/index.jsp" >首页</a>
						</li>
						<!--1 科技 2 军事 3 体育 4 娱乐 5 政治-->
						<li class="lavalamp-item" style="z-index: 5; position: relative;">
							<a href="${pageContext.request.contextPath}/news/index/getByKind?kind=2">军事</a>
						</li>
						<li class="lavalamp-item" style="z-index: 5; position: relative;">
							<a href="${pageContext.request.contextPath}/news/index/getByKind?kind=4">娱乐</a>
						</li>
						<li class="lavalamp-item" style="z-index: 5; position: relative;">
							<a href="${pageContext.request.contextPath}/news/index/getByKind?kind=1">科技</a>
						</li>
						<li class="lavalamp-item" style="z-index: 5; position: relative;">
							<a href="${pageContext.request.contextPath}/news/index/getByKind?kind=5">政治</a>
						</li>
						<c:if test="${USERINSESSION!=null}">
							<li class="lavalamp-item" style="z-index: 5; position: relative;">
								<a href="${pageContext.request.contextPath}/jsps/user/modifyInfo.jsp" class="logo">
									个人中心：
									${USERINSESSION.name}
									<img src="/basic/upload/${USERINSESSION.logo}"/>
								</a>
							</li>
						</c:if>
						<c:if test="${USERINSESSION==null}">
							<li class="lavalamp-item" style="z-index: 5; position: relative;">
								<a href="${pageContext.request.contextPath}">登录</a> /
								<a href="${pageContext.request.contextPath}/jsps/register.jsp">注册</a>
							</li>
						</c:if>
					</ul>
				</div>
				<i class="slogan"></i>
			</div>
		</header>
	</body>

</html>