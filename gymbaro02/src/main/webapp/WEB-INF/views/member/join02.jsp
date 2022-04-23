<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
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

.step_bar_01 {
	background: #184798;
}

.step_bar_01 span {
	color:white;
}

.step_bar_02, .step_bar_03 {
	background: #f0f0f0;
}

.content_first_text {
	display:flex;
	align-items:center;
	margin-top:50px;
	margin-bottom:10px;
}

.content_first_text span {
	margin-left:10px;
}

.content_first_text div {
	width:10px;
	height:10px;
	border-radius:3px;
	background: #184798;
}

.content_bar {
	overflow-y:scroll;
	height:140px;
	background: #f0f0f0;
	border: 1px solid #8f8f8f;
}

.content_bar div {
	height:170px;
}

.agree_checkbox {
	display:flex;
	flex-direction:column;
	align-items:start;
	margin-top:40px;
}

.checkbox_02 {
	margin-top:20px;
}

.button_box {
	display:flex;
	justify-content:space-between;
	margin-top:40px;
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
		<span><b>약관 내용</b></span>
	</div>
	<div class="step_bar">
		<div class="step_bar_01 bars"><span>약관 동의</span></div>
		<div class="step_bar_02 bars"><span>본인인증/정보입력</span></div>
		<div class="step_bar_03 bars"><span>가입완료</span></div>
	</div>
	<div class="content_first_text">
		<div></div>
		<span>개인정보 수집 · 이용 동의</span>
	</div>
	<div class="content_bar">
		<div>
			<span>약관 내용</span>
		</div>
	</div>
	<div class="content_first_text">
		<div></div>
		<span>위치정보 이용약관 동의</span>
	</div>
	<div class="content_bar">
		<div>
			<span>약관 내용</span>
		</div>
	</div>
	<div class="agree_checkbox">
	   <div>
		<input type="checkbox">
		<label>서비스 이용약관 및 개인정보 처리 방침에 동의합니다.</label>
	   </div>
	   <div class="checkbox_02">
		<input type="checkbox">
		<label>위치기반서비스 이용약관에 동의합니다.</label>
	   </div>
	</div>
	<div class="button_box">
		<a><button id="button_01"><span>이전 단계</span></button></a>
		<c:if test="${join_type=='common'}">
			<a href="${contextPath}/member/join03_1.do?"><button id="button_02"><span>가입하기</span></button></a>
		</c:if>
		<c:if test="${join_type=='gym'}">
			<a href="${contextPath}/member/join03_2.do?"><button id="button_02"><span>가입하기</span></button></a>
		</c:if>
	</div>
  </div>
 </div>
</body>
</html>