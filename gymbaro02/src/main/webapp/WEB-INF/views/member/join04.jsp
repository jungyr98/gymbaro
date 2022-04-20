<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="joinform.css">
<head>
<meta charset="utf-8">
<style>
body {
		font-family: 'Noto Sans KR', sans-serif;
	}
.main_container {
   width:730px;
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

   font-size: 21px;
   background:white;
   padding: 0 15px;
}

.first_text span b {
   color: #184798;
}

.step_bar {
   display:flex;
   justify-content:space-between;
}

#box {
	margin-top:20px;
	width:730px; 
	height:250px; 
	border: 1px solid #c4c4c4; 
	text-align: center; 
	padding-top: 100px;
}

.bars {
   width:989px;
   height:43px;
   display:flex;
   justify-content:center;
   align-items:center;
}

.bars span {
   font-size:18px;
}

.step_bar_03 {
   background: #184798;
}

.step_bar_03 span {
   color:white;
}

.step_bar_01, .step_bar_02 {
   background: #f0f0f0;
}

.button_box {
   display:flex;
   justify-content:space-between;
   margin-top:20px;
   height:50px;
}

.button_box button {
   border:none;
   border-radius:2px;
   width:360px;
   height:50px;
}

.button_box button span {
   font-size:20px;
   color:white;
}

#button_01 {
   background: #c4c4c4;
}

#button_02 {
   background: #184798;
}
</style>
</head>
<body>
<div class="main_container">
	<div class="first_content">
   <div class="first_text">
      <span><b>가입 완료</b></span>
   </div>
	<div class="step_bar">
		<div class="step_bar_01 bars"><span>약관 동의</span></div>
		<div class="step_bar_02 bars"><span>본인인증/정보입력</span></div>
		<div class="step_bar_03 bars"><span>가입완료</span></div>
	 </div>
		<div id="box">
			<p style="font-size: 28px; color:#184798; font-weight: bold;">membername님, 짐바로 가입을 환영합니다!</p><br>  
			<p style="font-size: 20px;">아이디는 memberid 입니다</p> 
	</div>
	<br>
	<div class="button_box">
     	 <a><button id="button_01"><span>메인으로</span></button></a>
     	 <a href="${contextPath}/member/loginForm.do"><button id="button_02"><span>로그인</span></button></a>
   		</div>
	</div>
</div>
</body>
</html>