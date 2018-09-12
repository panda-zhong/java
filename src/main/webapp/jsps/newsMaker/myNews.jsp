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
			td img {
				width: 50px;
				height: 50px;
			}
		</style>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月12日 下午4:29:12
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
				<th>操作</th>
				<th>发布时间</th>
			</tr>

			<c:forEach items="${MYNEWSINSESSION}" var="myNews">
				<tr id="news${myNews.id}">
					<td>${myNews.newsTitle}</td>
					<td>${myNews.newsAuthor }</td>
					<td><img src="/basic/upload/${myNews.titleImage}" /></td>
					<td>${myNews.kindName}</td>
					<td>
						<fmt:formatDate value="${myNews.saveDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/newsMaker/index/toModifyNews?id=${myNews.id}">
							<button class="modify" id="${myNews.id}">编辑</button>
						</a>
						<c:choose>
							<c:when test="${myNews.state==null}">
								<button class="review" id="${myNews.id}">审核发布</button>
							</c:when>
							<c:when test="${myNews.state==0}">
								审核未通过
							</c:when>
							<c:when test="${myNews.state==1}">
								已发布
							</c:when>
							<c:when test="${myNews.state==2}">
								待审核
							</c:when>
						</c:choose>
						<a href="${pageContext.request.contextPath}/newsMaker/news/delete?newsId=${myNews.id}">
							<button class="delete" id="${myNews.id}">删除</button>
						</a>
					</td>
					<td>
						<span class="tip" id="tip${myNews.id}">
							<c:if test="${myNews.state==1}">
								${myNews.publishDate}
							</c:if>
						</span>					
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript">
		$('.modify').on('click', function() {
			var newsId = this.id;
			window.location.href = "" + newsId;
		})
		$(".review").on('click',function(){
			var newsId = this.id;
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/newsMaker/news/toReviewNews",
				data:{ 
					'newsId':newsId
				},
				dataType:"json",
				success:function(result){
					window.location.href = "${pageContext.request.contextPath}/newsMaker/index/myNews"
				},
				async:true
			});
		})
		
	</script>

</html>