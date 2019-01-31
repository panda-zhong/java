<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>title</title>
		<style type="text/css">
			body {
				background: url(${pageContext.request.contextPath}/img/bg.png) repeat-y;
			}
			
			.container {
				margin: 0;
			}
			/* Headings */
			
			h1,
			h2,
			h3,
			h4,
			h5,
			h6 {
				font-weight: normal;
				font-family: "Oxygen", sans-serif;
			}
			/* Masthead */
			
			.main-left-col {
				position: relative;
				z-index: 1;
				border-right: 3px solid #F1F1F1;
				padding-top: 20px;
			}
			
			.main-left-col h1 {
				font-size: 24px;
				font-weight: normal;
				color: #FFF;
				margin-bottom: 0;
				font-family: "Marck Script", sans-serif;
				margin-left: 2px;
				background: rgba(0, 0, 0, 0.3);
				-webkit-border-radius: 60px;
				-moz-border-radius: 60px;
				border-radius: 60px;
				width: 100px;
				height: 85px;
				text-align: center;
				line-height: 1;
				padding: 25px 10px 10px 10px;
				margin: 0 auto;
			}
			
			.main-left-col .side-nav {
				list-style: none;
				margin: 20px 0 0 0;
				border-bottom: 1px solid #414040;
				border-top: 1px solid #232222;
			}
			
			.main-left-col .side-nav ul {
				margin: 0;
				background: #5f5e5e;
			}
			
			.main-left-col .side-nav a {
				color: #FFF;
				display: block;
				padding: 8px 16px;
				border-top: 1px solid #414040;
				border-bottom: 1px solid #232222;
			}
			
			.main-left-col .side-nav a:hover {
				text-decoration: none;
				background: #4a4949;
			}
			
			.main-left-col .side-nav ul li a:hover {
				background: #535252;
			}
			
			.main-left-col .side-nav .active>a {
				background: #4a4949;
				border-top: 1px solid #5A5A5A;
				border-bottom: 1px solid #3A3A3A;
			}
			
			.main-left-col .side-nav ul li a {
				border: none;
				padding: 4px 16px;
				background: #5f5e5e;
			}
			
			.main-left-col .side-nav .active ul li a {
				border: none;
			}
			
			.main-left-col .side-nav ul li.active a {
				background: #4a4949;
			}
			
			.main-left-col .side-nav .dropdown-toggle .caret {
				border-top-color: #FFF;
				border-bottom-color: #FFF;
				opacity: 1;
				filter: alpha(opacity=100);
			}
			/* Secondary Masthead */
			
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
			/* Main Area */
			
			.main-area {
				padding: 20px 0;
			}
			/* Slates */
			
			.slate {
				background: #FFF;
				padding: 10px 20px;
				border: 1px solid #F8F8F8;
				margin-bottom: 20px;
			}
			
			.slate .page-header {
				margin-top: 0;
				padding-bottom: 10px;
			}
			
			.slate h2 {
				font-weight: normal;
				font-family: "Oxygen", sans-serif;
				font-size: 18px;
			}
			
			.stat-column {
				width: 13%;
				float: left;
				text-align: center;
				display: block;
				color: #999;
				margin: 0 4%;
				padding: 12px 2%;
			}
			
			.stat-column:hover {
				background: #FC6B0A;
				color: #FFF;
				text-decoration: none;
				-webkit-border-radius: 8px;
				-moz-border-radius: 8px;
				border-radius: 8px;
			}
			
			.stat-column span {
				font-weight: normal;
				font-family: "Oxygen", sans-serif;
				font-size: 14px;
				display: block;
			}
			
			.stat-column span.number {
				font-size: 32px;
				font-weight: normal;
				font-family: "Oxygen", sans-serif;
				margin: 0;
				margin: 14px 0 10px 0;
			}
			
			.slate .table-striped,
			.slate .table-striped {
				background-color: #FFF;
				-webkit-border-radius: 5px;
				-moz-border-radius: 5px;
				border-radius: 5px;
			}
			
			.slate .table tbody tr:hover td,
			.slate .table tbody tr:hover th {
				background-color: #EEE;
			}
			
			.slate .table th,
			.slate .table td {
				border-top: none;
				border-bottom: 1px solid #EBEBEB;
			}
			
			.slate .table td.date {
				width: 100px;
				font-size: 11px;
				color: #BBB;
				text-align: right;
			}
			
			.slate .table td.value,
			.slate .table th.value {
				width: 100px;
				text-align: right;
			}
			
			.slate .table td.actions,
			.slate .table th.actions {
				width: 200px;
				text-align: right;
			}
			
			.slate .table .btn-danger {
				visibility: hidden;
			}
			
			.slate .table tr:hover .btn-danger {
				visibility: visible;
			}
			
			.slate .table td span.meta {
				font-size: 11px;
				color: #BBB;
			}
			
			.slate .form-inline {
				margin-bottom: 0;
				padding: 10px 0;
			}
			
			.slate .form-inline input,
			.slate .form-inline select {
				margin-right: 6px;
			}
			/* Heading Icon Link */
			
			.iconlink {
				color: #999;
			}
			
			.iconlink:hover {
				color: #FC6B0A;
				text-decoration: none;
			}
			/* Listing Buttons */
			
			.listing-buttons {
				text-align: right;
				margin-bottom: 20px;
			}
			/* Pagination */
			
			.pagination {
				margin-top: 0;
			}
			
			.profileicon {
				text-align: center;
			}
			
			.profileicon i {
				color: #AAA;
				font-size: 180px;
				line-height: 1;
			}
			/* Footer */
			
			.footer {
				border-top: 1px solid #EEE;
				text-align: right;
				padding-top: 10px;
				color: #BBB;
			}
			
			@media (max-width: 767px) {
				.main-left-col {
					height: auto;
					margin: 0 -20px;
					border-right: none;
					border-bottom: 3px solid #F1F1F1;
				}
				.stat-column {
					width: auto;
					float: none;
				}
			}
			
			@media (min-width: 768px) and (max-width: 979px) {
				.main-left-col h1 {
					-webkit-border-radius: 40px;
					-moz-border-radius: 40px;
					border-radius: 40px;
					width: 60px;
					height: 45px;
					font-size: 14px;
				}
				.profileicon i {
					color: #AAA;
					font-size: 140px;
					line-height: 1;
				}
			}
		</style>

	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月18日 下午5:03:43
-->

	<body>

	</body>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>


</html>