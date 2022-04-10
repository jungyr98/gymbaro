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
<link rel="stylesheet" href="${contextPath}/resources/css/membership_01.css">
</head>
<body>
	<div class="main_container">
	<p id="title">회원권 예약</p>
	<div class="step_bar">
		<div class="step_bar_01 bars"><span>시설 선택</span></div>
		<div class="step_bar_02 bars"><span>이용일시 선택·결제정보 입력</span></div>
		<div class="step_bar_03 bars"><span>예약 완료</span></div>
	 </div>
	<form action="${contextPath}/membership/membership_02.do" method="post">
		<br><br><br>	
		<table id="table1">
			<thead>
				<tr>
					<td class="fixed_join">예약자 이름
					</td>
					<td>
					  <input type="text" name="name" id="name">
					  <input type="checkbox" name="oldinfo" id="oldinfo"/>기존 회원 정보와 동일
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">이용 예정 시설</td>
					<td>그린 헬스 둔산점</td>
				</tr>
			</thead>
	
			<thead>
				<tr>
					<td class="fixed_join">연락처</td>
					<td>
						<input type="text" name="phonenum" id="phonenum">
					</td>
				</tr>
			</thead>

			<thead>
				<tr>
					<td class="fixed_join">이용 날짜 선택</td>
					<td>
						<input type="text" name="date" id="date">&nbsp;&nbsp;<img src="" alt="달력 아이콘">
					</td>
				</tr>
			</thead>

			<thead>
				<tr>
					<td class="fixed_join">예약일 알림 수신</td>
					<td>
						<input type="checkbox" name="yes">예 &nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="no">아니오
					</td>
				</tr>
			</thead>
			
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">최종 결제 금액</td>
				<td>
					<p>${total_price}</p>
				</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">결제 수단</td> 
					<td>
						  <span><button id="cash">무통장 입금</button></span>
						  <span><button id="credit">신용카드</button></span>
						  <span><button id="naverpay">네이버페이</button></span>
						  <span><button id="paybyphone">휴대폰 결제</button></span>
					<br><br>
						<!--onchange 추가하기-->
						<select name="creditcard" onChange="" title="신용카드 종류 선택" id="selectcard">
							<option value="none">신용카드 종류 선택</option>
							<option value="현대카드">현대카드</option>
							<option value="삼성카드">삼성카드</option>
							<option value="국민카드">국민카드</option>
							<option value="하나카드">하나카드</option>
						</select>
						&nbsp;&nbsp;
					    <select name="installment" onChange="" title="할부 개월 수" id="selectinstallment">
						    <option value="none">할부 개월 수 </option>
						    <option value="2개월">2개월(무이자)</option>
						    <option value="3개월">3개월</option>
						    <option value="4개월">4개월</option>
						    <option value="5개월">5개월</option>
					</select>
					</td>
				</tr>


			</thead>	
		</table>
		<br>
		<div class="button_box" style="float: right;">
			<a><button id="button_01"><span>이전 단계</span></button></a> &nbsp;
			<a href="#"><button id="button_02"><span>예약하기</span></button></a>
		 </div>
	</form>	
</div>
</body>
</html>