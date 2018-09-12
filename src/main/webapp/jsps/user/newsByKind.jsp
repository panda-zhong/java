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
			.proRow p {
				font-size: 0.88rem;
				/*1.4em × 10 = 14px */
			}
			
			.proRow {
				width: 70%;
				font-size: 62.5%;
				font-weight: lighter;
				display: flex;
				flex-wrap: wrap;
				margin: 0 auto;
			}
			
			.proBig {
				width: 211px;
				margin: 15px 15px;
				position: relative;
			}
			
			.pro {
				border: 1px solid #ccc;
				height: 300px;
			}
			
			.proImg {
				width: 211px;
				height: 196px;
				text-align: center;
			}
			
			.proImg img {
				height: 196px;
				width: 100%;
			}
			
			.proText {
				margin: 10px 10px;
				height: 70px;
			}
			
			h5 {
				font-size: 1rem;
				margin: 0 auto;
				font-weight: initial;
			}
			
			.proSize {
				font-size: 0.4rem;
				color: #95989A;
				margin: 3px auto;
			}
			
			.proPrice span {
				font-size: 0.8rem;
				font-weight: initial;
				font-style: italic;
			}
			
			.proFrom {
				text-align: right;
				margin-right: 10px;
			}
			
			.proBtn {
				width: 211px;
				height: 300px;
				background-color: #fff;
				background-color: rgba(255, 255, 255, 0.5);
				position: absolute;
				box-sizing: border-box;
				padding-top: 80px;
				margin-top: -300px;
				display: none;
			}
			
			.proBig:hover .proBtn {
				display: block;
			}
			
			.btn {
				width: 167px;
				height: 50px;
				margin: 10px auto;
				background-color: #FCDD00;
				display: flex;
				justify-content: center;
				align-items: center;
				box-sizing: border-box;
			}
			
			.btn:hover {
				border: 1px solid #66503B;
			}
		</style>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月16日 上午10:05:15
-->

	<body>
		<%@include file="header.jsp"%>
		<div class="proRow">
			<c:forEach items="${NEWORDERBYTIMEANDKINDINSESSION}" var="news">
				<div class="proBig" id="news${news.id}">
					<div class="pro">
						<div class="proImg">
							<img src="/basic/upload/${news.titleImage}">
						</div>
						<div class="proText">
							<h5>${news.newsTitle}</h5>
							<p class="proSize">
								<fmt:formatDate value="${news.saveDate}" pattern="yyyy-MM-dd hh:mm:ss" />
							</p>
							<p class="proPrice">类型： <span>${news.kindName}</span></p>
						</div>
						<div class="proFrom">作者：${news.newsAuthor }</div>
					</div>
					<a href="javaScript:">
						<div class="proBtn">
							<a href="${pageContext.request.contextPath}/news/index/getById?newsId=${news.id}">
								<div class="btn">
									查看
								</div>
							</a>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>

	</body>

</html>