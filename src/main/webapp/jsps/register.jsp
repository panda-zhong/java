<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
		<title>title</title>
		<style type="text/css">
			.body {
				background: #ff4931;
				transition: all .5s;
				padding: 1px;
			}
			
			.veen {
				width: 70%;
				margin: 100px auto;
				background: rgba(255, 255, 255, .5);
				min-height: 400px;
				display: table;
				position: relative;
				box-shadow: 0 0 4px rgba(0, 0, 0, .14), 0 4px 8px rgba(0, 0, 0, .28);
			}
			
			.veen>div {
				display: table-cell;
				vertical-align: middle;
				text-align: center;
				color: #fff;
			}
			
			.veen button {
				background: transparent;
				/*//background-image: linear-gradient(90deg, #e0b722, #ff4931);*/
				display: inline-block;
				padding: 10px 30px;
				border: 3px solid #fff;
				border-radius: 50px;
				background-clip: padding-box;
				position: relative;
				color: #FFF;
				//box-shadow: 0 0 4px rgba(0,0,0,.14), 0 4px 8px rgba(0,0,0,.28);
				transition: all .25s;
			}
			
			.veen button.dark {
				border-color: #ff4931;
				background: #ff4931;
			}
			
			.veen .move button.dark {
				border-color: #e0b722;
				background: #e0b722;
			}
			
			.veen .splits p {
				font-size: 18px;
			}
			
			.veen button:active {
				box-shadow: none;
			}
			
			.veen button:focus {
				outline: none;
			}
			
			.veen>.wrapper {
				position: absolute;
				width: 40%;
				height: 120%;
				top: -10%;
				left: 5%;
				background: #fff;
				box-shadow: 0 0 4px rgba(0, 0, 0, .14), 0 4px 8px rgba(0, 0, 0, .28);
				transition: all .5s;
				color: #303030;
				overflow: hidden;
			}
			
			.veen .wrapper>div {
				padding: 15px 30px 30px;
				width: 100%;
				transition: all .5s;
				background: #fff;
				position: absolute;
				left: 0;
				top: 0;
				width: 100%;
			}
			
			.veen .wrapper #register {
				left: 100%;
			}
			
			.veen .wrapper.move #register {
				left: 0%;
			}
			
			.veen .wrapper>div>div {
				position: relative;
				margin-bottom: 15px;
			}
			
			.veen .wrapper label {
				position: absolute;
				top: -7px;
				font-size: 12px;
				white-space: nowrap;
				background: #fff;
				text-align: left;
				left: 15px;
				padding: 0 5px;
				color: #999;
				pointer-events: none;
			}
			
			.veen .wrapper h3 {
				margin-bottom: 25px;
			}
			
			.veen .wrapper input {
				height: 40px;
				padding: 5px 15px;
				width: 100%;
				border: solid 1px #999;
			}
			
			.veen .wrapper input:focus {
				outline: none;
				border-color: #ff4931;
			}
			
			.veen>.wrapper.move {
				left: 45%;
			}
			
			.veen>.wrapper.move input:focus {
				border-color: #e0b722;
			}
			
			.passwd #img {
				width: 50px;
				height: 50px;
				border-radius: 100%;
				margin-left: 20%;
			}
		</style>

	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月16日 上午11:56:22
-->

	<body>
		<%@include file="user/header.jsp"%>
		<div class="body">
			<div class="veen">
				<div class="login-btn splits">
					<p>已有账号了？</p>
					<a href="${pageContext.request.contextPath}">
						<button>登录</button>
					</a>
				</div>
				<div class="rgstr-btn splits">
					<p></p>
					<button></button>
				</div>
				<form class="wrapper" action="${pageContext.request.contextPath}/register/in" method="post" enctype="multipart/form-data" style="display: inline-block;">
					<div id="register">
						<div class="name">
							<select name="kind" id="kind" style="width: 50%; height: 40px; margin-left: 30%;">
								<option value="1">管理员</option>
								<option value="2">普通用户</option>
								<option value="3">新闻发布员</option>
							</select>
							<label>注册类型：</label>
						</div>
						<div class="mail">
							<input type="text" name="name">
							<label>用户名：</label>
						</div>
						<div class="uid">
							<input type="text" name="account" id="account" value="">
							<label>账号：
							<span id="accountTip">
							</span>
							</label>
						</div>
						<div class="passwd">
							<input type="password" name="password">
							<label>密码：</label>
						</div>
						<div class="passwd">
							<input type="text" name="code" id="code" >
							<label>验证码：</label>
							<span id="codeTip">
								
							</span>
							<img src="${pageContext.request.contextPath}/getCodeImage?code=" id="codeImage" style="cursor: pointer;" />
						</div>
						<div class="submit">
							<button class="dark" type="submit">注册</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.veen .wrapper').addClass('move');
			$('.body').css('background', '#e0b722');
			$("#codeImage").on('click',function(){
				$("#codeImage").attr('src',"${pageContext.request.contextPath}/getCodeImage?code="+Math.random());
			})
			$("#account").blur(function() {
				var account = this.value;
				var kind = document.getElementById("kind").value;
				$.ajax({
					type: "post",
					url: "${pageContext.request.contextPath}/register/checkAccount?account=" + account + "&kind=" + kind,
					success: function(data) {
						var flag = (data);
						console.log(data)
						if(data == "0") {
							document.getElementById("accountTip").innerText = "账号已被注册!";
							setTimeout(function() {
								document.getElementById("accountTip").innerText = "";
								document.getElementById("account").value = "";
							}, 1000)
						}
					},
					async: true
				});
			})
			$("#code").blur(function() {
				var code = this.value;
				$.ajax({
					type: "post",
					url: "${pageContext.request.contextPath}/register/checkCode",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data:{
						'code':code
					},
					success: function(data) {
						var flag = (data);
						console.log(data)
						if(data == "0") {
							document.getElementById("codeTip").innerText = "验证码不正确!";
							setTimeout(function() {
								document.getElementById("codeTip").innerText = "";
							}, 1000)
						}
					},
					async: true
				});
			})
			
		});

		function show(imgID, iptfileupload) { // 接收传过来的img标签的ID 和 当前input的框的ID
			var file_img = document.getElementById(imgID),
				iptfileupload = document.getElementById(iptfileupload);
			// 调用上传图片函数
			getPath(file_img, iptfileupload, file_img);
		};

		//上传图片函数封装
		function getPath(obj, fileQuery, transImg) {

			var imgSrc = '',
				imgArr = [],
				strSrc = '';

			if(window.navigator.userAgent.indexOf("MSIE") >= 1) { // IE浏览器判断
				if(obj.select) {
					obj.select();
					var path = document.selection.createRange().text;
					alert(path);
					obj.removeAttribute("src");
					imgSrc = fileQuery.value;
					imgArr = imgSrc.split('.');
					strSrc = imgArr[imgArr.length - 1].toLowerCase();
					if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0) {
						obj.setAttribute("src", transImg);
						obj.style.filter =
							"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + path + "', sizingMethod='scale');"; // IE通过滤镜的方式实现图片显示
					} else {
						//try{
						throw new Error('File type Error! please image file upload..');
						//}catch(e){
						//  alert('name: ' + e.name + 'message: ' + e.message) ;
						//}
					}
				} else {
					// alert(fileQuery.value) ;
					imgSrc = fileQuery.value;
					imgArr = imgSrc.split('.');
					strSrc = imgArr[imgArr.length - 1].toLowerCase();
					if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0) {
						obj.src = fileQuery.value;
					} else {
						//try{
						throw new Error('File type Error! please image file upload..');
						//}catch(e){
						//  alert('name: ' + e.name + 'message: ' + e.message) ;
						//}
					}

				}

			} else {
				var file = fileQuery.files[0];
				var reader = new FileReader();
				reader.onload = function(e) {

					imgSrc = fileQuery.value;
					imgArr = imgSrc.split('.');
					strSrc = imgArr[imgArr.length - 1].toLowerCase();
					if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0) {
						obj.setAttribute("src", e.target.result);
					} else {
						//try{
						throw new Error('File type Error! please image file upload..');
						//}catch(e){
						//  alert('name: ' + e.name + 'message: ' + e.message) ;
						//}
					}

					// alert(e.target.result); 
				}
				reader.readAsDataURL(file);
			}
		}
	</script>

</html>