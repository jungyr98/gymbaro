<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/insertGym_03.css" type="text/css">
<head>
<meta charset="utf-8">
<style>

body {
		font-family: 'Noto Sans KR', sans-serif;
	}
table, tr, td {
   border-collapse : collapse;
   border: 1px solid #c4c4c4;
}

td {
	padding-left: 10px;
	font-size: medium;
}
</style>
</head>
<body>
	<div class="main_container">
	<p id="title">시설 등록</p>
	<div class="step_bar">
		<div class="step_bar_01 bars"><span>기본 정보 입력</span></div>
		<div class="step_bar_02 bars"><span>가격 정보·사진 정보 입력</span></div>
		<div class="step_bar_03 bars"><span>등록 신청 완료</span></div>
	 </div>
	<form action="${contextPath}/member/order.do" method="post">
		<div class="done_message1">
            <p>시설 등록이 완료되었습니다</p>
        </div>
        <div class="done_message2">
            <p>관리자 승인 대기중입니다.</p>
        </div>
        <div id="regist_box">
            <div id="regist_info">
                <span style="font-weight: bold;">시설회원명</span>
                <span>gymname_example</span>
                <br>
                <span style="font-weight: bold;">연락처</span>
                <span>gymtel_example</span>
                <br><br>
                <span>고객센터</span>
                <span>042 - 1234 - 5678</span>
            </div>
        </div>
        <div class="bottom_button">
            <button>메인 페이지로 이동</button>
        </div>
        </div>
	</form>	
</body>
</html>