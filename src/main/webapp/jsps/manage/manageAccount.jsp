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
			td img {
				width: 50px;
				height: 50px;
			}
		</style>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月9日 上午8:43:07
-->

	<body>
		<%@include file="header.jsp"%>
		<h1>用户列表</h1>
		<table border="1" cellspacing="" cellpadding="">
			<tr>
				<th>账号</th>
				<th>姓名</th>
				<th>注册日期</th>
				<th>头像</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${ALLUSERINFOINSESSION}" var="userInfo">
				<tr id="userInfo${userInfo.account}">
					<td>${userInfo.account}</td>
					<td>${userInfo.name}</td>
					<td>${userInfo.registerTime}</td>
					<td><img src="/basic/upload/${userInfo.logo}" /></td>
					<td class="state">
						<c:if test="${userInfo.state==0}">
							已停用
						</c:if>
						<c:if test="${userInfo.state==1}">
							正常
						</c:if>
					</td>
					<td>
						<button class="disableUser" id="${userInfo.account}">停用</button>
						<button class="enableUser" id="${userInfo.account}">恢复</button>
						<span class="tip" id="tip${userInfo.account}"></span>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		
		
		
		<h1>新闻发布员列表</h1>
		<table border="1" cellspacing="" cellpadding="">
			<tr>
				<th>账号</th>
				<th>姓名</th>
				<th>注册日期</th>
				<th>头像</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${ALLNEWSMAKERINFOINSESSION}" var="newsMakerInfo">
				<tr id="newsMakerInfo${newsMakerInfo.account}">
					<td>${newsMakerInfo.account}</td>
					<td>${newsMakerInfo.name}</td>
					<td>${newsMakerInfo.registerTime}</td>
					<td><img src="/basic/upload/${newsMakerInfo.logo}" /></td>
					<td class="state">
						<c:if test="${newsMakerInfo.state==0}">
							已停用
						</c:if>
						<c:if test="${newsMakerInfo.state==1}">
							正常
						</c:if>
					</td>
					<td>
						<button class="disableNewsMaker" id="${newsMakerInfo.account}">停用</button>
						<button class="enableNewsMaker" id="${newsMakerInfo.account}">恢复</button>
						<span class="tip" id="tip${newsMakerInfo.account}"></span>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		
		
		<h1>管理员列表</h1>
		<table border="1" cellspacing="" cellpadding="">
			<tr>
				<th>账号</th>
				<th>姓名</th>
				<th>注册日期</th>
				<th>头像</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${ALLMANAGEINFOINSESSION}" var="manageInfo">
				<tr id="manageInfo${manageInfo.account}">
					<td>${manageInfo.account}</td>
					<td>${manageInfo.name}</td>
					<td>${manageInfo.registerTime}</td>
					<td><img src="/basic/upload/${manageInfo.logo}" /></td>
					<td class="state">
						<c:if test="${manageInfo.state==0}">
							已停用
						</c:if>
						<c:if test="${manageInfo.state==1}">
							正常
						</c:if>
					</td>
					<td>
						<button class="disableManage" id="${manageInfo.account}">停用</button>
						<button class="enableManage" id="${manageInfo.account}">恢复</button>
						<span class="tip" id="tip${manageInfo.account}"></span>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript">
		$('.disableUser').click(function() {
			var account = this.id;
			$.ajax({
				type: "post",
				data: {
					'account': account
				},
				dataType: 'json',
				url: "${pageContext.request.contextPath}/manage/manageAccount/disableUserAccount",
				success: function(result) {
					document.getElementById("tip" + account).innerText = "停用成功"
					window.location.href = "${pageContext.request.contextPath}/manage/index/toManageAccount"
				},
				async: true
			});
		})

		$('.enableUser').click(function() {
			var account = this.id;
			$.ajax({
				type: "post",
				data: {
					'account': account
				},
				dataType: 'json',
				url: "${pageContext.request.contextPath}/manage/manageAccount/enableUserAccount",
				success: function(result) {
					document.getElementById("tip" + account).innerText = "恢复成功"
					window.location.href = "${pageContext.request.contextPath}/manage/index/toManageAccount"
				},
				async: true
			});
		})
		
		
		$('.disableNewsMaker').click(function() {
			var account = this.id;
			$.ajax({
				type: "post",
				data: {
					'account': account
				},
				dataType: 'json',
				url: "${pageContext.request.contextPath}/manage/manageAccount/disableNewsMakerAccount",
				success: function(result) {
					document.getElementById("tip" + account).innerText = "停用成功"
					window.location.href = "${pageContext.request.contextPath}/manage/index/toManageAccount"
				},
				async: true
			});
		})

		$('.enableNewsMaker').click(function() {
			var account = this.id;
			$.ajax({
				type: "post",
				data: {
					'account': account
				},
				dataType: 'json',
				url: "${pageContext.request.contextPath}/manage/manageAccount/enableNewsMakerAccount",
				success: function(result) {
					document.getElementById("tip" + account).innerText = "恢复成功"
					window.location.href = "${pageContext.request.contextPath}/manage/index/toManageAccount"
				},
				async: true
			});
		})
		
		
			$('.disableManage').click(function() {
			var account = this.id;
			$.ajax({
				type: "post",
				data: {
					'account': account
				},
				dataType: 'json',
				url: "${pageContext.request.contextPath}/manage/manageAccount/disableManageAccount",
				success: function(result) {
					document.getElementById("tip" + account).innerText = "停用成功"
					window.location.href = "${pageContext.request.contextPath}/manage/index/toManageAccount"
				},
				async: true
			});
		})

		$('.enableManage').click(function() {
			var account = this.id;
			$.ajax({
				type: "post",
				data: {
					'account': account
				},
				dataType: 'json',
				url: "${pageContext.request.contextPath}/manage/manageAccount/enableManageAccount",
				success: function(result) {
					document.getElementById("tip" + account).innerText = "恢复成功"
					window.location.href = "${pageContext.request.contextPath}/manage/index/toManageAccount"
				},
				async: true
			});
		})
	</script>

</html>