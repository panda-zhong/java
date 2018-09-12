<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>title</title>
		<link href="/basic/html/bootstrap.css" rel="stylesheet">
		<link href="/basic/html/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
		<style type="text/css">
			/* Secondary Masthead */
			.container {
				margin: 0;
			}
			.secondary-masthead {
				margin: 20px 0 0 0;
				-webkit-border-radius: 6px;
				-moz-border-radius: 6px;
				border-radius: 6px;
				padding: 20px;
				background: #F8F8F8;
			}
			
			.secondary-masthead .breadcrumb {
				background: none;
				border: none;
				-webkit-box-shadow: none;
				-moz-box-shadow: none;
				box-shadow: none;
				margin: 0;
				padding: 0;
				font-size: 18px;
				color: #AAA;
				font-family: "Oxygen", sans-serif;
				font-weight: normal;
			}
			
			.secondary-masthead .breadcrumb a,
			.secondary-masthead .breadcrumb .divider {
				color: #AAA;
			}
			
			.secondary-masthead ul {
				margin: -8px 0 0 0;
			}
			
			.secondary-masthead ul a {
				color: #AAA;
			}
			
			.secondary-masthead .nav .dropdown-toggle .caret {
				border-top-color: #CCC;
				border-bottom-color: #CCC;
				opacity: 1;
				filter: alpha(opacity=100);
			}
			
			.secondary-masthead ul .dropdown-menu {
				margin: 0 0 0 0;
				left: auto;
				right: 0;
			}
			
			.secondary-masthead ul .dropdown-menu:before {
				left: auto;
				right: 12px;
			}
			
			.secondary-masthead ul .dropdown-menu:after {
				left: auto;
				right: 13px;
			}
		</style>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月18日 下午4:55:18
-->

	<body>
		<div class="secondary-masthead">

			<ul class="nav nav-pills pull-right">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i> ${MANAGEINSESSION.name}<b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li class="active">
							<a href="${pageContext.request.contextPath}/manage/login/index">主页</a>
						</li>
						<li>
							<a href="">我的信息</a>
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
					<a href="#">管理员</a>
				</li>
			</ul>

		</div>

	</body>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

</html>