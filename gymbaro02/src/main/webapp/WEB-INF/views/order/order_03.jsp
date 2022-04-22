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
<style>
body {
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
</head>
<body>
	<div class="main_container">
		<p id="title">주문이 완료되었습니다</p>
			<div class="step_bar">
				<div class="step_bar_01 bars"><span>상품 선택</span></div>
				<div class="step_bar_02 bars"><span>배송정보·결제정보 입력</span></div>
				<div class="step_bar_03 bars"><span>주문 완료</span></div>
	 		</div>
	<br><br><br><br>
			<div class="box">
				<div id="box1">
                   <div id="box1_content"> 				
					<div class="order_number">
						<span id="order_info">주문번호</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span id="info_ex">ordernumber example</span>
					</div>
					<br>
					<div class="order_date">
						<span id="order_info">주문일시</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span id="info_ex">orderdate example</span>
					</div>
					<br>
					<div class="orderer">
						<span id="order_info">주문자 정보</span>&nbsp;&nbsp;&nbsp;
						<span id="info_ex">orderer example</span>
					</div>
                </div>
            </div>
            </div>
					

				<div id="box2">	
					<div id="box2_1">
                       <div id="box2_1_content">            
						<div class="order_price">
							<span id="order_info">결제금액</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span id="info_ex">order_price example</span>
						</div>
						<br>
						<div class="order_payment">
							<span id="order_info">결제 수단</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span id="info_ex">order_payment example</span>
						</div>
						<br>
						<div class="order_point">
							<span id="order_info">적립</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span id="info_ex">order_point example</span>
						</div>
                    </div>
					</div>
                </div>
					<div id="box2_2">
                      <div id="box2_2_content">
						<div class="receiver">
							<span id="order_info">받으시는 분</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span id="info_ex">receiver example</span>
						</div>
						<br>
						<div class="delivery_address">
							<span id="order_info">배송지 주소</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span id="info_ex">delivery_address example</span>
						</div>
					</div>
                </div>
				<div class="button_box">
					<a><button id="button_01"><span>메인으로</span></button></a> &nbsp;
					<a><button id="button_02"><span>주문배송조회</span></button></a>
                </div>
                </div>
</html>