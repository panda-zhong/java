<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>title</title>
		<style type="text/css">
			td img{
				width: 100px;
				height: 100px;
			}
		</style>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月13日 下午6:00:42
-->

	<body>
		<%@include file="header.jsp"%>
		<table border="1" cellspacing="" cellpadding="">
			<tr>
				<th>标题</th>
				<th>作者</th>
				<th>新闻图片</th>
				<th>类型</th>
				<th>保存时间</th>
				<th>发布时间</th>
				<th>操作</th>
			</tr>

			<c:forEach items="${NEWSAPPLTINSESSION}" var="news">
				<tr id="news${news.id}">
					<td>${news.newsTitle}</td>
					<td>${news.newsAuthor }</td>
					<td><img src="/basic/upload/${news.titleImage}" /></td>
					<td>${news.kindName}</td>
					<td>
						<fmt:formatDate value="${news.saveDate}" pattern="yyyy-MM-dd hh:mm:ss" />
					</td>
					<td>
						<span class="tip" id="tip${news.id}">
								${news.publishDate}
						</span>
					</td>

					<td>
						<a href="/basic/html/${news.savePath}" target="_blank">
							<button class="modify" id="${news.id}">查看</button>
						</a>
						
						<c:if test="${news.state==2}">
						
						<a href="${pageContext.request.contextPath}/manage/dealNews/accept?newDealId=${news.dealId}">
							<button class="publish" id="${news.dealId}">通过</button>
						</a>
						<a href="${pageContext.request.contextPath}/manage/dealNews/refuse?newDealId=${news.dealId}">
							<button class="noPublish" id="${news.dealId}">不通过</button>
						</a>
						</c:if>
						<c:if test="${news.state==1}">已发布</c:if>
						<c:if test="${news.state==0}">拒绝</c:if>
					</td>
				</tr>
			</c:forEach>
			
			
			
			<c:forEach items="${NEWSPUBLISHEDINSESSION}" var="news">
				<tr id="news${news.id}">
					<td>${news.newsTitle}</td>
					<td>${news.newsAuthor }</td>
					<td><img src="/basic/upload/${news.titleImage}" /></td>
					<td>${news.kindName}</td>
					<td>
						<fmt:formatDate value="${news.saveDate}" pattern="yyyy-MM-dd" />
					</td>
					<td>
						<span class="tip" id="tip${news.id}">
								${news.publishDate}
						</span>
					</td>

					<td>
						<a href="/basic/html/${news.savePath}" target="_blank">
							<button class="modify" id="${news.id}">查看</button>
						</a>
						<a href="${pageContext.request.contextPath}/manage/dealNews/delete?newsId=${news.id}">
							<button>删除</button>
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
</html>