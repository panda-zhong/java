<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<link rel="stylesheet" type="text/css" href="//localhost:8080/newsManage/css/main.css" />
		<title>首页</title>
		<style type="text/css">
			* {
				padding: 0;
				margin: 0;
			}
			
			ul {
				list-style-type: none;
			}
			
			a {
				text-decoration: none;
			}
			
			.hotnews {
				width: 500px;
				height: 301px;
			}
			
			#progress {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				background-color: #337ab7;
				height: 100%;
				display: block;
			}
			
			#loading {
				background-color: #ec5858;
				height: 100%;
				width: 100%;
				position: fixed;
				z-index: 1;
				margin-top: 0px;
				top: 0px;
			}
			
			#loading-text {
				position: absolute;
				top: 70%;
				left: 40%;
			}
			
			#loading-text p {
				font-size: 18px;
				color: #FFFFFF;
			}
			
			#loading-center {
				width: 100%;
				height: 100%;
				position: relative;
			}
			
			#loading-center-absolute {
				position: absolute;
				left: 50%;
				top: 50%;
				height: 150px;
				width: 250px;
				margin-top: -25px;
				margin-left: -75px;
			}
			
			.object {
				width: 8px;
				height: 50px;
				margin-right: 5px;
				background-color: #FFF;
				-webkit-animation: animate 1s infinite;
				animation: animate 1s infinite;
				float: left;
			}
			
			.object:last-child {
				margin-right: 0px;
			}
			
			.object:nth-child(10) {
				-webkit-animation-delay: 0.9s;
				animation-delay: 0.9s;
			}
			
			.object:nth-child(9) {
				-webkit-animation-delay: 0.8s;
				animation-delay: 0.8s;
			}
			
			.object:nth-child(8) {
				-webkit-animation-delay: 0.7s;
				animation-delay: 0.7s;
			}
			
			.object:nth-child(7) {
				-webkit-animation-delay: 0.6s;
				animation-delay: 0.6s;
			}
			
			.object:nth-child(6) {
				-webkit-animation-delay: 0.5s;
				animation-delay: 0.5s;
			}
			
			.object:nth-child(5) {
				-webkit-animation-delay: 0.4s;
				animation-delay: 0.4s;
			}
			
			.object:nth-child(4) {
				-webkit-animation-delay: 0.3s;
				animation-delay: 0.3s;
			}
			
			.object:nth-child(3) {
				-webkit-animation-delay: 0.2s;
				animation-delay: 0.2s;
			}
			
			.object:nth-child(2) {
				-webkit-animation-delay: 0.1s;
				animation-delay: 0.1s;
			}
			
			@-webkit-keyframes animate {
				50% {
					-ms-transform: scaleY(0);
					-webkit-transform: scaleY(0);
					transform: scaleY(0);
				}
			}
			
			@keyframes animate {
				50% {
					-ms-transform: scaleY(0);
					-webkit-transform: scaleY(0);
					transform: scaleY(0);
				}
			}
			
			#body {
				width: 80%;
				margin: 0 auto;
			}
			
			#body #headline-tabs {
				width: 300px;
				height: 38px;
				border-bottom: 1px solid darkgray;
				text-align: center;
				margin-bottom: 10px;
			}
			
			#body #headline-tabs .clearfix {
				width: 100px;
				height: 100%;
				border-bottom: 2px solid blue;
			}
			
			#body #headline-tabs a {
				font-weight: bold;
				line-height: 30px;
				font-size: 18px;
			}
			
			#body .mod-tab-content {
				width: 50%;
				float: left;
			}
			
			#body .mod-tab-content ul {
				list-style-type: circle;
				list-style-position: inside;
			}
			
			#body .mod-tab-content ul li {
				padding: 5px 10px 3px 0;
			}
			
			#body .mod-tab-content ul li a {
				color: rgb(34, 34, 34);
			}
			
			#body .box {
				width: 50%;
				float: left;
				position: relative;
				right: 0;
				/*top: -94px;*/
			}
			
			#body .box .top {
				width: 400px;
				position: relative;
				/*bottom: 20px;*/
			}
			
			#body .box .box-1 {
				width: 100%;
				height: 300px;
				margin: 40px auto;
				border: 1px solid chartreuse;
				position: relative;
				overflow: hidden;
			}
			
			#body .box .box-1 li {
				width: 480px;
				height: 320px;
				float: left;
				list-style: none;
				position: absolute;
				border: 1px solid white;
				overflow: hidden;
			}
			
			#body .box .box-1 li p {
				/*z-index: 100;*/
				width: 100%;
				height: 25px;
				text-indent: 2em;
				padding-top: 5px;
				background-color: rgba(0, 0, 0, 0.7);
				font-size: 16px;
				font-weight: bold;
				color: white;
				position: absolute;
				top: 270px;
				/*left: 10%;*/
			}
			
			#body .box .box-1 li img {
				width: 100%;
				height: 100%;
			}
			
			.copyright {
				position: absolute;
				bottom: 0;
			}
			
			.copyright a {
				text-decoration: none;
				color: #16a085;
			}
			
			.copyright a:hover {
				text-decoration: underline;
			}
			
			.button {
				position: relative;
				width: 120px;
				padding: 1em 0.8em;
				border: none;
				background-color: transparent;
				cursor: pointer;
				outline: none;
				font-size: 18px;
				margin: 1em 0.8em;
			}
			
			.button.type1 {
				color: #566473;
			}
			
			.button.type1.type1::after,
			.button.type1.type1::before {
				content: "";
				display: block;
				position: absolute;
				width: 20%;
				height: 20%;
				border: 2px solid;
				transition: all 0.6s ease;
				border-radius: 2px;
			}
			
			.button.type1.type1::after {
				bottom: 0;
				right: 0;
				border-top-color: transparent;
				border-left-color: transparent;
				border-bottom-color: #566473;
				border-right-color: #566473;
			}
			
			.button.type1.type1::before {
				top: 0;
				left: 0;
				border-bottom-color: transparent;
				border-right-color: transparent;
				border-top-color: #566473;
				border-left-color: #566473;
			}
			
			.button.type1.type1:hover:after,
			.button.type1.type1:hover:before {
				width: 100%;
				height: 100%;
			}
			
			.button.type2 {
				color: #16a085;
				position: absolute;
				left: 50%;
			}
			
			.button.type2.type2:after,
			.button.type2.type2:before {
				content: "";
				display: block;
				position: absolute;
				top: 100%;
				left: 0;
				width: 100%;
				height: 2px;
				background-color: #16a085;
				transition: all 0.3s ease;
				transform: scale(0.85);
			}
			
			.button.type2.type2:hover:before {
				top: 0;
				transform: scale(1);
			}
			
			.button.type2.type2:hover:after {
				transform: scale(1);
			}
			
			.button.type3 {
				color: #435a6b;
			}
			
			.button.type3.type3::after,
			.button.type3.type3::before {
				content: "";
				display: block;
				position: absolute;
				width: 20%;
				height: 20%;
				border: 2px solid;
				transition: all 0.6s ease;
				border-radius: 2px;
			}
			
			.button.type3.type3::after {
				bottom: 0;
				right: 0;
				border-top-color: transparent;
				border-left-color: transparent;
				border-bottom-color: #435a6b;
				border-right-color: #435a6b;
			}
			
			.button.type3.type3::before {
				top: 0;
				left: 0;
				border-bottom-color: transparent;
				border-right-color: transparent;
				border-top-color: #435a6b;
				border-left-color: #435a6b;
			}
			
			.button.type3.type3:hover:after,
			.button.type3.type3:hover:before {
				border-bottom-color: #435a6b;
				border-right-color: #435a6b;
				border-top-color: #435a6b;
				border-left-color: #435a6b;
				width: 100%;
				height: 100%;
			}
			
			marquee {
				width: 600px;
				height: 50px;
				position: relative;
				top: 20px;
			}
			
			.info_main {
				width: 80%;
				height: 600px;
				margin: 0 auto;
				border: 1px solid chocolate;
			}
			
			.info_main>div {
				border-bottom: 1px solid red;
			}
			
			.showinfo {
				width: 100%;
				height: 80%;
				overflow-y: scroll;
				position: relative;
			}
			
			.showinfo h1 {
				margin-left: 30px;
				border: 1px dashed gainsboro;
				width: 200px;
			}
			
			.showinfo .baseinfo {
				position: relative;
				left: 3%;
				top: 10%;
				width: 40%;
				margin-bottom: 10%;
			}
			
			.showinfo .baseinfo img {
				border-radius: 100%;
				width: 100px;
				height: 100px;
				position: relative;
				margin-right: 20px;
				float: left;
			}
			
			.showinfo .baseinfo h3,
			h5 {
				/*float: left;*/
				position: relative;
				/*margin-top: 20px;*/
				margin-left: 20px;
			}
			
			.showinfo .even_text {
				height: 100%;
			}
		</style>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月15日 下午1:42:53
-->

	<body>
		<%@include file="header.jsp"%>

		<div id="body">
			<div>
				<button class="button type1">
	        			<a href="#" style="color:#000">热点要闻</a>
	   			</button>
				<button class="button type2">
        			<a href="#" style="color:#000">图片简介</a>
   				 </button>
			</div>
			<div class="mod-tab-content">
				<div id="pane-news" class="mod-tab-pane active">
					<div class="hotnews" alog-group="focustop-hotnews">
						<ul id="allNews">
						</ul>
					</div>
				</div>
			</div>

			<div class="box">
				<div class="box-1">
					<ul class="box" id="newsBox">

					</ul>
				</div>
			</div>
			<div id="bottom-left">
				<div>
					<button class="button type3">
	        			<a href="#" style="color:#000">时间</a>
	    			</button>
					<marquee behavior="scroll" direction="left">
						<p id="time"></p>
					</marquee>
				</div>
			</div>
		</div>
	</body>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).on('ready', function() {
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath}/news/index/all",
				success: function(result) {
					var newsList = JSON.parse(result);
					addToBody(newsList)
				},
				async: true
			});
		})

		function addToBody(newsList) {
			var length = newsList.length
			console.log(newsList)
			for(var i = 0; i < length; ++i) {
				var allNews = document.getElementById("allNews")
				var li = document.createElement("li");
				var a = document.createElement("a");
				a.href = "${pageContext.request.contextPath}/news/index/getById?newsId=" + newsList[i].id
				a.innerText = newsList[i].newsTitle;
				li.appendChild(a);
				allNews.appendChild(li)

				var newsBox = document.getElementById("newsBox");
				var box_li = document.createElement("li");
				var box_a = document.createElement("a");
				var box_p = document.createElement("p");
				var box_img = document.createElement("img");
				box_a.href = "${pageContext.request.contextPath}/news/index/getById?newsId=" + newsList[i].id
				box_p.innerText = newsList[i].newsTitle;
				box_img.src = "/basic/upload/" + newsList[i].titleImage;
				box_a.appendChild(box_img);
				box_a.appendChild(box_p);
				box_li.appendChild(box_a);
				newsBox.appendChild(box_li);
			}
		}
	</script>

	<script type="text/javascript">
		$("#body").hide()
		$("article").show()
		setTimeout(
			function() {
				$("#body").show()
				$("article").hide()
			}, 1000
		)

		function time() {
			function format(i) {
				return(i < 10 ? "0" + i : i);
			}
			var date = new Date();
			var year = date.getFullYear();
			var month = format(date.getMonth() + 1);
			var day = format(date.getDate());
			var arr = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
			var week = arr[date.getDay()];
			var hour = format(date.getHours());
			var minute = format(date.getMinutes());
			var second = format(date.getSeconds());
			document.getElementById("time").innerHTML = "你好，现在时间是：" + year + "年" + month + "月" + day + "日" + " " + week + hour + "点" + minute + "分" + second + "秒"
		}
		var interval = setInterval(time, 100);
		$(".box-1 ul li").hover(function() {
			clearInterval(time);
			var index = $(this).index();
			for(var i = 0; i <= index; i++) {
				$(".box-1 ul li").eq(i).stop().animate({
					left: i * 30
				})
			}

			for(; i < $("li").length; i++) {
				$(".box-1 ul li").eq(i).stop().animate({
					left: i * 30 + 350
				})
			}

		}, function() {
			$(".box-1 ul li").each(function(i) {
				$(".box-1 ul li").eq(i).stop().animate({
					left: i * 80
				})
			})
			begin();
		})

		var index = 0;
		var time;
		begin();

		function begin() {
			time = setInterval(
				function() {
					for(var i = 0; i <= index; i++) {
						$(".box-1 ul li").eq(i).stop().animate({
							left: i * 30
						})
					}

					for(; i < $("li").length; i++) {
						$(".box-1 ul li").eq(i).stop().animate({
							left: i * 30 + 350
						})
					}
					index = (index + 1) % 7;
				}, 1000)

		}

		$(".type2").click(
			function() {
				$(".showinfo").hide()
				$(".changeInfo").show()
			}
		)

		$(".type1").click(
			function() {
				$(".showinfo").show()
				$(".changeInfo").hide()
			}
		)
	</script>

</html>