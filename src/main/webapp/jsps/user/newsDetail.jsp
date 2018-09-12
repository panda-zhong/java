<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>新闻详情</title>
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
			/*body,h1,h2,h3,h4,h5,h6,hr,p,blockquote,dl,dt,dd,ul,ol,li,pre,form,fieldset,legend,button,input,textarea,th,td {
	margin:0;
	padding:0;
	border:none;
	outline:none;
}
h1,h2,h3,h4,h5,h6 {
	font-size:100%;
}*/
			
			address,
			cite,
			dfn,
			em,
			var {
				font-style: normal;
			}
			
			code,
			kbd,
			pre,
			samp {
				font-family: courier new, courier, monospace;
			}
			
			ul,
			ol {
				list-style: none;
			}
			
			a {
				text-decoration: none;
			}
			
			a:hover,
			a:visited,
			a:link,
			a:active {
				text-decoration: none;
			}
			
			sup {
				vertical-align: text-top;
			}
			
			sub {
				vertical-align: text-bottom;
			}
			
			legend {
				color: #000;
			}
			
			fieldset,
			img {
				border: 0;
			}
			
			button,
			input,
			select,
			textarea {
				font-size: 100%;
			}
			
			table {
				border-collapse: collapse;
				border-spacing: 0;
			}
			
			.clear {
				clear: both;
				float: none;
				height: 0;
				overflow: hidden;
			}
			
			body {
				color: #333;
				font: 12px/1.3 'Arial', 'Microsoft YaHei';
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
createTime:2018年8月15日 下午6:11:50
-->

	<body>
		<%@include file="header.jsp"%>
		<div class="main">
			<ul>
				<li>
					<h1>${NEWSDETAILINSESSION.newsTitle}</h1>
					<h5>
					${NEWSDETAILINSESSION.publishDate} &nbsp;
					${NEWSDETAILINSESSION.newsAuthor} <a href="#pn" class="blue">评论(<span
						id="red"> ${NEWSDETAILINSESSION.commentSize} </span>)
					</a>
				</h5>
			</ul>
			<hr />
			<iframe name="src" seamless="seamless" frameborder=0 scrolling=no src="//localhost:8080/basic/html/${NEWSDETAILINSESSION.savePath}" width="100%" onload="setIframeHeight(this)"></iframe>
			<hr />
		</div>
		<c:if test="${USERINSESSION!=null}">
			<div class="comment-area">
				<h2>我也要评论:</h2>
				<form action="${pageContext.request.contextPath}/user/index/comment" method="post">
					<div id="div_editor">
						<textarea id="txt_content" name="context" rows="2" cols="10"></textarea>
						<div class="d-last">还能输入140字</div>
					</div>
					<input type="submit" id="btn_submit" value="确定">
				</form>
			</div>
		</c:if>
		<c:if test="${USERINSESSION==null}">
			<div class="comment-area">
				<h2>登录后才能评论</h2>
			</div>
		</c:if>
		<ul id="pn">
			<c:forEach items="${COMMENTINSESSION}" var="comment">
				<li class="list0">
					<div class="head">
						<img src="/basic/upload/${comment.user.logo}" alt="">
					</div>
					<div class="content">
						<p class="text">
							<span class="name">${comment.user.name}:</span> <span id="${comment.user.account}NEWS${comment.time.time}">${comment.context}</span>
						</p>
						<div class="good">
							<span class="date"> <fmt:formatDate
								value="${comment.time}" pattern="yyyy-MM-dd HH:mm:ss" />
						</span>
							<jsp:useBean id="nowDate" class="java.util.Date"></jsp:useBean>
							<c:set var="interval" value="${nowDate.time - comment.time.time}" />
							<%--时间差毫秒数--%>
							<fmt:formatNumber value="${interval/(1000*60)}" pattern="#0" var="mins" />
							<%--取分钟差整数--%>
							<c:if test="${comment.user.account==USERINSESSION.account&&mins<5}">
								<a class="dzan" id="${comment.user.account}NEWS${comment.time.time}" href="javascript:;">修改</a>
							</c:if>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>

	</body>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document)
			.on(
				"ready",
				function() {
					var commentDate = document
						.getElementsByClassName("date");
					var length = commentDate.length;
					for(var i = 0; i < length; ++i) {
						var dateStr = commentDate[i].innerText;
						console.log(dateStr)
					}
					$(".dzan")
						.on(
							'click',
							function() {
								var id = this.id
								console.log(id);
								var userId = id.substring(0, id
									.lastIndexOf("NEWS"));
								var time = id.substring(id
									.lastIndexOf("NEWS") + 4);
								console.log(userId + " " + time)
								//				console.log($('p #'+id).text())
								var oldText = $('p #' + id).text()
								var value = prompt('输入新的评论',
									oldText);
								//				$('p #'+id).text(value);
								$
									.ajax({
										type: "post",
										url: "${pageContext.request.contextPath}/user/index/modifyComment",
										data: {
											'userId': userId,
											'context': value,
											"commentTime": time
										},
										dataType: "json",
										success: function(
											result) {
											$('p #' + id).text(
												value);
										},
										async: true
									});
							})
				})

		function setIframeHeight(iframe) {
			if(iframe) {
				var iframeWin = iframe.contentWindow ||
					iframe.contentDocument.parentWindow;
				if(iframeWin.document.body) {
					iframe.height = iframeWin.document.documentElement.scrollHeight ||
						iframeWin.document.body.scrollHeight;
				}
			}
		};

		window.onload = function() {
			setIframeHeight(document.getElementById('external-frame'));
		};

		$(function() {

			$("#div_editor textarea").focus(function() {
				$(this).css("height", "60px");
				$("#div_editor div.d-last").show();
				$("#div_editor").css("borderColor", "#B4E6FA");
			}).blur(function() {
				$(this).css("height", "65px");
				$("#div_editor div.d-last").fadeIn(200);
				$("#div_editor").css("borderColor", "#A9A9A9");
			}).keyup(function() {
				var c = $(this).val();
				if(c.length > 140) {
					c = c.substr(0, 140);
					$(this).val(c);
				}
				var last = 140 - c.length;
				$("#div_editor div.d-last").text("还能输入" + last + "字");
			})

		});
	</script>

</html>