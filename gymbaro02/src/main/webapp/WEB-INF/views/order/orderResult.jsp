<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
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
                   					<span>${myOrderInfo.receiver_phone_number}</span><br>
                   					<span>${myOrderInfo.receiver_name}</span><br>
                   					<span>${myOrderInfo.receiver_roadAddress}</span>
                   					<br><br>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">배송 메모</td>
                   				<td>
                   					<span>${myOrderInfo.delivery_memo}</span>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">결제 방법</td>
                   				<td>
                   					<span>${myOrderInfo.payment}</span>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">최종 결제 금액</td>
                   				<td>
                   					<fmt:formatNumber  value="${myOrderInfo.total_price}" type="number" var="price" />
                   					<span>${price}원</span>
                   				</td>
                   			</tr>
                   		</table>
                   		<div class="orderer_info">
                   		<table>
                   			<tr>
                   				<td class="fixed_td">주문번호</td>
                   				<td>
                   					<span>${myOrderInfo.order_id }</span><br>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">주문자명</td>
                   				<td>
                   					<span>${memberInfo.member_name }</span>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">주문일자</td>
                   				<td>
                   					<span><%= sf.format(nowTime) %></span>
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
					<a href="${contextPath}/mypage/listMyOrderHistory.do"><button type="button" id="button_02"><span>주문배송조회</span></button></a>
                </div>
                </div>
</html>