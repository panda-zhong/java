<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon"
	href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg"
	type="img/x-ico" />
<title>title</title>
<style type="text/css">
	.logo img{
		width: 100px;
		height: 100px;
	}
</style>
</head>
<!--
author:panda
computer:@Berenice
createTime:2018年8月3日 上午10:26:29
-->
<body>
	新闻发布员首页：<a href="${pageContext.request.contextPath}/newsMaker/login/index" class="logo">
		<img src="/basic/upload/${NEWSMAKERINSESSION.logo}" />
	</a>
	<text> 你好，${NEWSMAKERINSESSION.name} 注册时间：
	${NEWSMAKERINSESSION.registerTime}
	</text>
	<a href="${pageContext.request.contextPath}/newsMaker/login/logout">注销</a>
</body>
</html>