<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>title</title>
		<script src="/basic/html/ueditor/ueditor.config.js" type="text/javascript" charset="utf-8"></script>
		<script src="/basic/html/ueditor/ueditor.all.js" type="text/javascript" charset="utf-8"></script>
		<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
		<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月13日 上午8:29:20
-->

	<body>
		<%@include file="header.jsp"%>
		<div>
			<h1>编辑新闻</h1>
			<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
			<!-- 实例化编辑器 -->
		</div>
		<form id="newsForm" action="#" method="post" enctype="multipart/form-data">
			<p>
				标题：
				<input type="text" name="newsTitle" id="newsTitle" value="${MODIFYNEWSINSESSON.newsTitle}" />
			</p>
			<p>
				作者：
				<input type="text" name="newsAuthor" id="newsAuthor" value="${MODIFYNEWSINSESSON.newsAuthor} " />
			</p>
			<p>
				新闻种类：
				<select name="newsKind" value="${MODIFYNEWSINSESSON.kind}">
					<option value="1">科技</option>
					<option value="2">军事</option>
					<option value="3">体育</option>
					<option value="4">娱乐</option>
					<option value="5">政治</option>
				</select>
			</p>
			<p>
				标题图片：
				<img src="/basic/upload/${MODIFYNEWSINSESSON.titleImage}" id="img">
				<input type="file" name="titleImage" id="titleImage" onchange="show(&quot;img&quot;,&quot;titleImage&quot;)" value="" />
			</p>
		</form>
		<p>
			<span id="tip" style="color: red;">
				
			</span>
		</p>
		<button id="finish">保存草稿</button>
	</body>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript">
		var ue = UE.getEditor('editor');

		$.ajax({
			type: "get",
			url: "/basic/html/${MODIFYNEWSINSESSON.savePath}",
			success: function(result) {
				console.log(result)
				var newsHtml = result;
				ue.ready(function(){
					ue.setContent(newsHtml,true);
				})
			},
			async: true
		});

		$("#finish").on('click', function() {
			var newsTitle = $("[name = newsTitle]").val();
			var newsAuthor = $("[name = newsAuthor]").val();
			var kind = $("[name = newsKind]").val();
			if(newsTitle == "") {
				$("#newsTitle").css("border", "1px solid red");
				$("#tip").text("标题不能为空");
				setTimeout(function() {
					$("#newsTitle").css("border", "");
					$("#tip").text("");
				}, 1500)
				return
			}
			if(newsAuthor == "") {
				$("#newsAuthor").css("border", "1px solid red");
				$("#tip").text("作者不能为空");
				setTimeout(function() {
					$("#newsTitle").css("border", "");
					$("#tip").text("");
				}, 1500)
				return;
			}
			var newsForm = document.getElementById("newsForm");
			var innerText = UE.getEditor('editor').getContent();
			newsForm.append("newsText", innerText);
			var newsInput = document.createElement("input");
			newsInput.name = "newsText";
			newsInput.value = innerText;
			newsForm.append(newsInput)
			newsForm.action = "${pageContext.request.contextPath}/newsMaker/news/modifyDraft";
			newsForm.submit();
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