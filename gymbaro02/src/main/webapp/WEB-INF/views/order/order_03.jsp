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
<link rel="stylesheet" href="${contextPath}/resources/css/order_03.css">
</head>
<body>
	<div class="orderResult_box main_container">
			<div class="step_bar">
				<div class="step_bar_01 bars"><span>상품 선택</span></div>
				<div class="step_bar_02 bars"><span>배송정보·결제정보 입력</span></div>
				<div class="step_bar_03 bars"><span>주문 완료</span></div>
	 		</div>
			<div class="box">
				<div id="box1">
                   <div id="box1_content">
                   		<span id="order_success_title">주문이 완료되었습니다 &nbsp;
                   		<svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
  						<circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none" />
  						<path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />
						</svg>
						</span>
                   		<div id="table_div_box">
                   		<table>
                   			<tr>
                   				<td class="fixed_td">배송지 정보</td>
                   				<td>
                   					<span>010-1234-5678</span><br>
                   					<span>정유라</span><br>
                   					<span>대전광역시 서구 괴정동</span>
                   					<br><br>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">배송 메모</td>
                   				<td>
                   					<span>배송 전 연락주세요</span>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">결제 방법</td>
                   				<td>
                   					<span>신용카드</span>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">최종 결제 금액</td>
                   				<td>
                   					<span>44,000원</span>
                   				</td>
                   			</tr>
                   		</table>
                   		<div class="orderer_info">
                   		<table>
                   			<tr>
                   				<td class="fixed_td">주문번호</td>
                   				<td>
                   					<span>12345678910</span><br>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">주문자명</td>
                   				<td>
                   					<span>정유라</span>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">주문일자</td>
                   				<td>
                   					<span>2022-05-05</span>
                   				</td>
                   			</tr>
                   		</table>
                   		</div>
                   		</div>
                	</div>
            	</div>
            </div>
				<div class="button_box">
					<a><button id="button_01"><span>메인으로</span></button></a> &nbsp;
					<a><button id="button_02"><span>주문배송조회</span></button></a>
                </div>
                </div>
</html>