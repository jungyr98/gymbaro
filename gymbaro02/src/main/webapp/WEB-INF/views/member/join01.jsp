<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main_container {
	width:750px;
}

.first_content {
	margin-top:70px;
	border-top:2px solid #C4C4C4;
}

.first_text {
	position:relative;
	top:-15px;
	margin-bottom:50px;
}

.first_text span {

	font-size: 20px;
	background:white;
	padding: 0 15px;
}

.first_text span b {
	color: #184798;
}

.first_text span img {
	width:20px;
	heigh:20px;
}

.join_select_box {
	display:flex;
	justify-content:space-around;
	align-items:center;
	border:1px solid #C4C4C4;
	border-radius:10px;
	padding: 50px 50px;	
}

button {
	width:270px;
	height:270px;
	border:none;
	border-radius:10px;
	font-size:24px;
}

.first_button {
	background-color:#184798;
	color:white;
}

.first_button img {
	margin-left:17px;
	margin-bottom:10px;
	width:115px;
	height:115px;
}

.second_button {
	background-color:#C4C4C4;
	color:#171717;
}

.second_button img {

}
</style>
</head>
<body>
<div class="main_container">
  <div class="first_content">
	<div class="first_text">
		<span><b>유형 선택</b></span>
	</div>
	<div class="join_select_box">
		<button class="first_button" onclick="location.href='${contextPath}/member/join02.do?join_type=common'">
			<img alt="icon_map" src="${contextPath}/resources/image/user.png"><br>
			<b>일반</b><br>회원가입
		</button>
		<button class="second_button" onclick="location.href='${contextPath}/member/join02.do?join_type=gym'">
			<img alt="icon_map" src="${contextPath}/resources/image/user02.png"><br>
			<b>시설</b><br>회원가입
		</button>
	</div>
  </div>
</div>
</body>
</html>