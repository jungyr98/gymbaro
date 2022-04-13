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
		<p style="color: #184798; text-align: center; font-size: 36px; font-weight: bold;">주문이 완료되었습니다</p>
			<div class="step_bar">
				<div class="step_bar_01 bars"><span>상품 선택</span></div>
				<div class="step_bar_02 bars"><span>배송정보·결제정보 입력</span></div>
				<div class="step_bar_03 bars"><span>주문 완료</span></div>
	 		</div>
	<br><br><br><br>
			<div class="box">
				<div id="box1" style="width: 1024px; height:236px; border: 1px solid; text-align: left; padding-top: 100px; float:left;">				
					<div class="order_number" style="padding-left: 50px;">
						<span style="font-size: 20px; font-weight: bold;">주문번호</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span style="font-size: 18px;">ordernumber example</span>
					</div>
					<br>
					<div class="order_date" style="padding-left: 50px;">
						<span style="font-size: 20px; font-weight: bold;">주문일시</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span style="font-size: 18px;">orderdate example</span>
					</div>
					<br>
					<div class="orderer" style="padding-left: 50px;">
						<span style="font-size: 20px; font-weight: bold;">주문자 정보</span>&nbsp;&nbsp;&nbsp;
						<span style="font-size: 18px;">orderer example</span>
					</div>
					

				<div id="box2">	
					<div class="box2-1" style="width: 505px; height:300px; border: 1px solid; margin-top: 120px; float: left;">
						<div class="order_price" style="padding-left: 50px; margin-top: 80px;">
							<span style="font-size: 20px; font-weight: bold;">결제금액</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="font-size: 18px;">order_price example</span>
						</div>
						<br>
						<div class="order_payment" style="padding-left: 50px;">
							<span style="font-size: 20px; font-weight: bold;">결제 수단</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="font-size: 18px;">order_payment example</span>
						</div>
						<br>
						<div class="order_point" style="padding-left: 50px;">
							<span style="font-size: 20px; font-weight: bold;">적립</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="font-size: 18px;">order_point example</span>
						</div>
					</div>

					<div class="box2-2" style="width: 505px; height:300px; border: 1px solid; margin-top: 120px; float: right;">
						<div class="receiver" style="padding-left: 50px; margin-top: 80px;">
							<span style="font-size: 20px; font-weight: bold;">받으시는 분</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="font-size: 18px;">receiver example</span>
						</div>
						<br>
						<div class="delivery_address" style="padding-left: 50px;">
							<span style="font-size: 20px; font-weight: bold;">배송지 주소</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span style="font-size: 18px;">delivery_address example</span>
						</div>
					</div>
				</div>
				<div class="button_box" style="float: right;">
					<a><button id="button_01"><span>메인으로</span></button></a> &nbsp;
					<a><button id="button_02"><span>주문배송조회</span></button></a>
				 </div>
		</div>
	</div> 
</div>
  
</body>
</html>