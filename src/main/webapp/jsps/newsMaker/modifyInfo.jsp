<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="http://p0.meituan.net/merchantpic/23b79725bae58f57fc22400187cc0bed33254.jpg" type="img/x-ico" />
		<title>title</title>
	</head>
	<!--
author:panda
computer:@Berenice
createTime:2018年8月11日 上午8:38:16
-->

	<body>
		<%@include file="header.jsp"%>
		
		<p>
			姓名：
			<input type="text" id="name" name="name" value="${NEWSMAKERINSESSION.name}" />
			<button class="changeName">修改</button>
		</p>
		<p>
			头像：
			<form action="${pageContext.request.contextPath}/newsMaker/modifyInfo/modifyLogo" method="post" enctype="multipart/form-data">
				<input type="file" name="logo" id="logo" />
				<input type="submit" value="修改头像" />
			</form>
		</p>
		
		<p>
			<span id="tip"></span>
		</p>

	</body>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(".changeName").on("click",function(){
			var name = $("[name=name]").val();
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/newsMaker/modifyInfo/modifyName",
				data:{
					"name":name
				},
				dataType:'json',
				success:function(result){
					document.getElementById("tip").innerText = "修改姓名成功";
					location.reload();
				},
				async:true
			});
		})
		
	</script>

</html>