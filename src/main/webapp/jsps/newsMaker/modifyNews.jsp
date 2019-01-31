<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>修改新闻</title>
		<link href="/basic/html/bootstrap.css" rel="stylesheet">
		<link href="/basic/html/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
		<script src="/basic/html/ueditor/ueditor.config.js" type="text/javascript" charset="utf-8"></script>
		<script src="/basic/html/ueditor/ueditor.all.js" type="text/javascript" charset="utf-8"></script>
		<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
		<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月12日 下午4:29:12
-->

	<body>
		<%@include file="css_js.jsp"%>
		<div class="container">
			<div class="row">
				<div class="span2">

					<div class="main-left-col">

						<!--<h1>-->
						<img src="/basic/upload/${NEWSMAKERINSESSION.logo}" />
						<!--</h1>-->

						<ul class="side-nav">

							<li class="dropdown active">
								<a class="dropdown-toggle" href="http://localhost:8080/news/newsMaker/index/myNews"><i class="icon-cogs"></i> 我的新闻</a>
							</li>
							<li class="dropdown ">
								<a class="dropdown-toggle" href="${pageContext.request.contextPath}/jsps/newsMaker/addNews.jsp"><i class="icon-cogs"></i> 写新闻</a>
							</li>
							<li class="dropdown ">
								<a class="dropdown-toggle" href="${pageContext.request.contextPath}/jsps/newsMaker/modifyInfo.jsp"><i class="icon-cogs"></i> 我的信息</a>
							</li>
							<li class="dropdown">
								<a class="dropdown-toggle" href="${pageContext.request.contextPath}/newsMaker/login/logout"><i class="icon-cogs"></i> 退出</a>
							</li>
						</ul>

					</div>
					<!-- end main-left-col -->

				</div>
				<!-- end span2 -->

				<div class="span10">

					<div class="secondary-masthead">

						<ul class="breadcrumb">
							<li>
								<a href="#">${NEWSMAKERINSESSION.name} </a>
							</li>
						</ul>

					</div>

					<div class="main-area dashboard">
						<div class="alert alert-info">
							<a class="close" data-dismiss="alert" href="#">x</a>

							<h4 class="alert-heading">提示</h4> 修改新闻

						</div>
						<div class="row ">

							<div class="span10 ">

								<div class="slate ">
									<form id="newsForm" action="#" method="post" enctype="multipart/form-data">
										<table class="orders-table table" style="table-layout:fixed;">
											<tbody>
												<tr>
													<td>
														标题：
													</td>
													<td>
														<input type="text" name="newsTitle" id="newsTitle" value="${MODIFYNEWSINSESSON.newsTitle}" />
													</td>
												</tr>
												<tr>
													<td>
														作者：
													</td>
													<td>
														<input type="text" name="newsAuthor" id="newsAuthor" value="${MODIFYNEWSINSESSON.newsAuthor} " />
													</td>
												</tr>
												<tr>
													<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
												</tr>
												<tr>
													<td>
														新闻种类：
													</td>
													<td>
														<select name="newsKind" value="${MODIFYNEWSINSESSON.kind}">
															<option value="1" selected="">科技</option>
															<option value="2">军事</option>
															<option value="3">体育</option>
															<option value="4">娱乐</option>
															<option value="5">政治</option>
														</select>
													</td>
												</tr>
												<tr>
													<td>标题图片：</td>
													<td>
														<img src="/basic/upload/${MODIFYNEWSINSESSON.titleImage}" alt="加载失败" id="img">
														<input type="file" name="titleImage" id="titleImage" onchange="show(&quot;img&quot;,&quot;titleImage&quot;)" value="" />
													</td>
												</tr>
											</tbody>
										</table>
										<a class="btn btn-small btn-success" id="finish">保存草稿</a>

									</form>
									<p>
										<span id="tip" style="color: red;">
				
			</span>
									</p>
								</div>

							</div>

						</div>

						<div class="row">

							<div class="span10 footer">

								<p>&copy; panda 2019</p>

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