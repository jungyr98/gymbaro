<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="${contextPath}/resources/css/membership_02.css">
<style>
body {
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
</head>
<body>
	<div class="main_container">
		<p id="title">예약이 완료되었습니다</p>
			<div class="step_bar">
				<div class="step_bar_01 bars"><span>시설 선택</span></div>
				<div class="step_bar_02 bars"><span>이용일시 선택·결제정보 입력</span></div>
				<div class="step_bar_03 bars"><span>예약 완료</span></div>
	 		</div>
			 <form action="${contextPath}/member/reservate.do" method="post">
	<br><br><br><br>
				<div id="box">				
					<div class="order_number">
						<span id="bold">주문번호</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span id="regular">ordernumber example</span>
					</div>
					<br>
					<div class="order_date">
						<span id="bold">주문일시</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span id="regular">orderdate example</span>
					</div>
					<br>
					<div class="orderer">
						<span id="bold">주문자 정보</span>&nbsp;&nbsp;&nbsp;
						<span id="regular">orderer example</span>
					</div>
					<br>
					<div class="payment_date">
						<span id="bold">결제일</span>&nbsp;&nbsp;&nbsp;
						<span id="regular">payment_date example</span>
					</div>
					<br>
					<div class="reservation_date">
						<span id="bold">예약일</span>&nbsp;&nbsp;&nbsp;
						<span id="regular">reservation_date example</span>
					</div>
					<br>
					<div class="reservation_place">
						<span id="bold">예약 시설 </span>&nbsp;&nbsp;&nbsp;
						<span id="regular">reservation_place example</span>
					</div>
					<div class="place_image">
						<img src="" alt="예약한 시설 이미지">
					</div>
				</div>
				<div class="button_box" style="float: right;">
					<a><button id="button_01"><span>메인으로</span></button></a> &nbsp;
					<a><button id="button_02"><span>다른 시설 보기</span></button></a>
				</div>
			</form>
		</div> 
</body>
</html>