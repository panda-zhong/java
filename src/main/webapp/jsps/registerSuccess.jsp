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
createTime:2018年8月5日 上午11:40:46
-->
<body>
	${REGISTERMESSAGEINSESSION};
</body>
<script type="text/javascript">
	setTimeout(function(){
		window.location.href = "/newsManage";
	},3000)
</script>
</html>