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
		<style type="text/css">
			
			.overCurtain {
				border-top: 1px solid rgb(230, 245, 255);
				position: absolute;
				height: 674px;
				width: 100%;
				left: 0px;
				top: 0px;
				opacity: 0.7;
				display: none;
				background-color: rgb(230, 245, 255);
			}
			
			.hide-center {
				width: 1024px;
				height: 500px;
				margin: 0 auto;
				position: relative;
				right: 0;
				left: 0;
				bottom: 0;
				top: 0;
				display: none;
				z-index: 1;
			}
			
			.hide-center #formhead {
				margin: 0 auto;
				width: 300px;
				height: 42px;
				padding-top: 12px;
				padding-bottom: -30px;
				border-top-left-radius: 10px;
				border-top-right-radius: 10px;
				background-color: #101010;
			}
			
			.hide-center #formhead-title {
				width: 80px;
				height: 24px;
				margin-left: 106px;
				margin-right: 36px;
				color: #bfbfbf;
				font-weight: 900;
				display: inline-block;
			}
			
			.hide-center #close {
				width: 60px;
				height: 20px;
				border: 0;
				border-radius: 20%;
				background-color: red;
				color: white;
				display: inline-block;
			}
			
			.hide-center #formbody {
				margin: 0 auto;
				width: 300px;
				height: 245px;
				background-color: #1e1e1e;
				border-bottom-left-radius: 10px;
				border-bottom-right-radius: 10px;
			}
			
			.hide-center .loginHead {
				margin-right: -8px;
				padding: 13px;
				width: 25px;
				height: 28px;
				background-color: #141414;
				vertical-align: middle;
			}
			
			.hide-center .loginInput {
				height: 52px;
				width: 230px;
				padding-left: 10px;
				border: 0;
				background-color: #141414;
				color: aliceblue;
			}
			
			.hide-center .loginUserName {
				padding-left: 30px;
				padding-top: 30px;
			}
			
			.hide-center .login1 #img-topleft-loginHead {
				border-top-left-radius: 5px;
			}
			
			.hide-center .login1 #input-topright-loginInput {
				border-top-right-radius: 5px;
			}
			
			.hide-center .login1 #img-bottomleft-loginHead {
				border-bottom-left-radius: 5px;
			}
			
			.hide-center .login1 #input-bottomright-loginInput {
				border-bottom-right-radius: 5px;
			}
			
			.hide-center .loginPassword {
				padding-left: 30px;
			}
			
			.hide-center #formfoot {
				margin-top: 30px;
				margin-left: 30px;
			}
			
			.hide-center #BSignIn {
				border: 0;
				background: #329d90;
				color: #ffffff;
				width: 240px;
				height: 40px;
				border-bottom-left-radius: 5px;
				border-bottom-right-radius: 5px;
				border-top-left-radius: 5px;
				border-top-right-radius: 5px;
			}
			
			a {
				text-decoration: none
			}
			
			body {
				margin: 0;
				padding: 0;
				width: 100%;
				height: 100vh;
				display: flex;
				justify-content: center;
				align-items: center;
				flex-direction: column;
				font-family: Raleway;
				background-color: #ecf0f1;
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
				/*width: 150px;*/
				height: 65px;
				position: relative;
				padding: 1em 1.5em;
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
		</style>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月3日 上午9:57:51
-->

	<body>
		<div class="hide-center">
			<%@include file="user/header.jsp"%> 
			<div style="width: 500px; margin: 0 auto;">
				<button class="button type1 kind" id="1">
        <a href="javascript:;" class="kind"  style="color:#000">管理员</a>
    			</button>

				<button class="button type2 kind" id="3">
        <a href="javascript:;" class="kind"  style="color:#000">新闻发布员</a>
    </button>

				<button class="button type3  kind " id="2">
        <a href="javascript:;"style="color:#000">普通用户</a>
    </button>
			</div>
			<div id="formhead">
				<div id="formhead-title">
				</div>
				<a href="${pageContext.request.contextPath}/jsps/register.jsp">
					<button type="button" id="close">注册</button>
				</a>
			</div>
			<div id="formbody">
				<div class="loginUserName">
					<input id="input-topright-loginInput" name="account" class="loginInput" placeholder="请输入账号" type="text" value="">
				</div>
				<div class="loginPassword">
					<input id="input-bottomright-loginInput" name="password" class="loginInput" placeholder="请输入密码" type="password" style="border-bottom-right-radius:5px;">
				</div>
				<div id="formfoot">
					<button id="BSignIn">登录</button>
					<p id="resultTip" style="color: white;">
					
					</p>
				</div>
			</div>
		</div>
	</body>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script src="/basic/html/bootstrap.js"></script>
	<script type="text/javascript">
		var action = null;
		var kind = '1';
		var kindName = null;

		function changKind() {
			//		id="1">我是管理员
			//		id="2">我是普通用户
			//		 id="3">我是新闻发布员
			var KindInHtml = document.getElementById("kindName");
			switch(kind) {
				case '1':
					KindInHtml.innerText = '管理员';
					kindName = 'manage';
					break;
				case '2':
					KindInHtml.innerText = '普通用户';
					kindName = 'user';
					break;
				case '3':
					KindInHtml.innerText = '新闻发布员';
					kindName = 'newsMaker';
					break;
				default:
					break;
			}
			action = "${pageContext.request.contextPath}/" + kindName + "/login/check"
		}
		changKind(kind)
		$(".kind").click(function() {
			kind = this.id;
			changKind();
		})
		$('#login').click(function() {
			var account = $('[name=account]').val();
			var password = $('[name=password]').val();
			$.ajax({
				type: "post",
				url: action,
				data: {
					'account': account,
					'password': password
				},
				dataType: "json",
				async: true,
				success: function(data) {
					var result = JSON.parse(data);
					console.log(result)
					if(result) {
						document.getElementById("resultTip").innerText = "密码正确,正在跳转页面"
						setTimeout(function() {
							//							window.location.href = "${pageContext.request.contextPath}/jsps/"+kindName+"/index.jsp"
							window.location.href = "${pageContext.request.contextPath}/" + kindName + "/login/index";
						}, 800)
					} else {
						document.getElementById("resultTip").innerText = "账号密码错误！"
					}
				}
			});
		})

		var action = null;
		var kind = '1';
		var kindName = null;
			$(".hide-center").fadeIn("slow");
			$(".overCurtain").fadeIn("slow");
		$("#close").click(function() {
			$(".hide-center").fadeOut("slow")
			$(".overCurtain").fadeOut("slow")
		})
		$(".kind").click(function() {
			kind = this.id;
			changKind();
		})
		$('#BSignIn').click(function() {
			var account = $('[name=account]').val();
			var password = $('[name=password]').val();
			$.ajax({
				type: "post",
				url: action,
				data: {
					'account': account,
					'password': password
				},
				dataType: "json",
				async: true,
				success: function(data) {
					var result = JSON.parse(data);
					console.log(result)
					if(result) {
						document.getElementById("resultTip").innerText = "密码正确,正在跳转页面"
						setTimeout(function() {
							//							window.location.href = "${pageContext.request.contextPath}/jsps/"+kindName+"/index.jsp"
							window.location.href = "${pageContext.request.contextPath}/" + kindName + "/login/index";
						}, 800)
					} else {
						document.getElementById("resultTip").innerText = "账号密码错误！"
					}
				}
			});
		})

		function changKind() {
			//		id="1">我是管理员
			//		id="2">我是普通用户
			//		 id="3">我是新闻发布员
			var KindInHtml = document.getElementById("formhead-title");
			switch(kind) {
				case '1':
					KindInHtml.innerText = '管理员';
					kindName = 'manage';
					break;
				case '2':
					KindInHtml.innerText = '普通用户';
					kindName = 'user';
					break;
				case '3':
					KindInHtml.innerText = '新闻发布员';
					kindName = 'newsMaker';
					break;
				default:
					break;
			}
			action = "${pageContext.request.contextPath}/" + kindName + "/login/check"
		}
		changKind(kind)
	</script>

</html>