<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>修改信息</title>
		<style type="text/css">
			form img{
				width: 100px;
				height: 100px;
			}
		</style>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月11日 上午8:38:16
-->

	<body>
		<%@include file="header.jsp"%>
		<div id="main" style="width: 50%; margin: 0 auto;">
			<p>
				 注册时间：${USERINSESSION.registerTime}
			</p>
			<p>
				姓名：
				<input type="text" id="name" name="name" value="${USERINSESSION.name}" />
				<button class="changeName">修改</button>
			</p>
			<p>
				头像：
				<form action="${pageContext.request.contextPath}/user/modifyInfo/modifyLogo" method="post" enctype="multipart/form-data">
					
					<img src="/basic/upload/${USERINSESSION.logo}" alt="加载失败" id="img">
					<input type="file" name="logo" onchange="show(&quot;img&quot;,&quot;logo&quot;)" id="logo" />
					<input type="submit" value="修改头像" />
				</form>
			</p>
			<a href="${pageContext.request.contextPath}/user/login/logout">
				<button>注销</button>
			</a>
			<p>
				<span id="tip"></span>
			</p>
		</div>

	</body>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(".changeName").on("click", function() {
			var name = $("[name=name]").val();
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/user/modifyInfo/modifyName",
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