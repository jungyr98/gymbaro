<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="${contextPath}/resources/css/membership_02.css">
</head>
<body>
	<div class="membershipResult_box main_container">
			<div class="step_bar">
				<div class="step_bar_01 bars"><span>시설 선택</span></div>
				<div class="step_bar_02 bars"><span>이용일시 선택·결제정보 입력</span></div>
				<div class="step_bar_03 bars"><span>예약 완료</span></div>
	 		</div>
			<div class="box">
				<div id="box1">
                   <div id="box1_content">
                   		<span id="membership_success_title">회원권 구매가 완료되었습니다 &nbsp;
                   		<svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
  						<circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none" />
  						<path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />
						</svg>
						</span>
                   		<div id="table_div_box">
                   		<table>
                   			<tr>
                   				<td class="fixed_td">예약한 시설 정보</td>
                   				<td>
                   					<span>둔산 코앞 휘트니스</span><br>
                   					<span>헬스</span><br>
                   					<span>1개월</span>
                   					<br><br>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">결제 방법</td>
                   				<td>
                   					<span>무통장입금</span>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">최종 결제 금액</td>
                   				<td>
                   					<fmt:formatNumber  value="20000" type="number" var="price" />
                   					<span>${price}원</span>
                   				</td>
                   			</tr>
                   		</table>
                   		<div class="member_info">
                   		<table>
                   			<tr>
                   				<td class="fixed_td">회원권 번호</td>
                   				<td>
                   					<span>22051518</span><br>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">회원명</td>
                   				<td>
                   					<span>정유라</span>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">운동 시작일자</td>
                   				<td>
                   					<span>2022-05-18 ~ 2022-06-18</span>
                   				</td>
                   			</tr>
                   		</table>
                   		</div>
                   		</div>
                	</div>
            	</div>
            </div>
				<div class="button_box">
					<a href="${contextPath}/main/main.do"><button type="button" id="button_01"><span>메인으로</span></button></a> &nbsp;
					<a href="#"><button type="button" id="button_02"><span>회원권조회</span></button></a>
                </div>
		</div> 
</body>
</html>