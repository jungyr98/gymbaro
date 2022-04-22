<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ page errorPage="/error/error_500.jsp" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/error_404.css">
<style>
body {
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
<title>Error 500 Page</title>
</head>
<body>
	<div class="error_notice">
	<form action="${contextPath}/error/error_500.do" method="post">
		<img src="${contextPath}/resources/image/exclamation-mark.png" alt="error_mark" id="error_mark">
		<p id="error_message">Error 500</p>
		<input type="button" id="back_button" value="뒤로가기" onclick="javascript:history.back();">
	</div>
	</form>
</body>
</html>