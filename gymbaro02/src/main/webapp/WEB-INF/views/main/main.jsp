<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.main_container {
	width:1024px;
}

.first_content, .second_content, .last_content {
	margin-top:70px;
	border-top:2px solid #C4C4C4;
}

.second_content {
	margin-top:100px;
}

.last_content {
	margin-top:100px;
}

.first_text {
	position:relative;
	top:-15px;
	margin-bottom:50px;
}

.first_text span {

	font-size: 20px;
	background:white;
	padding: 0 15px;
}

.first_text span b {
	color: #184798;
}

.first_text span img {
	width:20px;
	heigh:20px;
}

.gym_content {
	display:flex;
	justify-content:center;
}

.gym_image img {
	width:337px;
	height:227px;
	margin:2px 3px;
}

.product_content {
	display:flex;
	justify-content:space-between;
	align-items:top;
}

.product_image{
	margin-top:-100px;
}

.last_content .product_image {
	margin-top:0;
}

.product_image img {
	width:280px;
	height:280px;
	border:1px solid #C4C4C4;
}

.product_image .rank_mark img {
	border:none;
}

.product_image .rank_mark {
	position:relative;
	width:90px;
	top:63px;
	
}

.product_image .rank_num {
	position:relative;
	top:40px;
	left:1px;
	font-size:25px;
	font-weight:500;
	color:white;
	z-index:10;
}

.product_image div img {
	width:90px;
	height:60px;
	filter: drop-shadow(1px 1px 1px #424040);
}

.product_info {
	display:flex;
	flex-direction:column;
	align-items:start;
	margin-top:10px;
}

.product_info span {
	color:black;
	font-size:16px;
}

.product_info_price {
	display:flex;
	align-items:center;
}
.product_info_price span {
	margin-right:7px;
}
</style>
</head>
<body>
<div class="main_container">
	<div class="main_img">
		<img alt="swim.png" src="${contextPath}/resources/image/swim.PNG" width="1024">
	</div>
	
 <div class="first_content">
	<div class="first_text">
		<span><b>접속 위치 주변</b> 운동 시설 <img alt="icon_map" src="${contextPath}/resources/image/location.png"></span>
	</div>
	
	<div class="gym_content">
		<div class="gym_image">
			<img alt="시설01" src="${contextPath}/resources/image/gym_01.PNG">
		</div>
		<div class="gym_image">
			<img alt="시설02" src="${contextPath}/resources/image/gym_02.PNG">
		</div>
		<div class="gym_image">
			<img alt="시설03" src="${contextPath}/resources/image/gym_03.PNG">
		</div>
	</div>
	<div class="gym_content">
		<div class="gym_image">
			<img alt="시설03" src="${contextPath}/resources/image/gym_04.PNG">
		</div>
		<div class="gym_image">
			<img alt="시설04" src="${contextPath}/resources/image/gym_05.PNG">
		</div>
		<div class="gym_image">
			<img alt="시설05" src="${contextPath}/resources/image/gym_06.PNG">
		</div>
	</div>
 </div>
 
 <div class="second_content">
	<div class="first_text second">
		<span>운동 용품 <b>주간 RANKING</b> <img alt="icon_map" src="${contextPath}/resources/image/medal.png"></span>
	</div>
	
	<div class="product_content">
		<div class="product_image">
			<div class="rank_mark">
				<span class="rank_num">1</span>
				<img alt="1위" src="${contextPath}/resources/image/bookmark-tag.png">
			</div>
			<img alt="용품01" src="${contextPath}/resources/image/product_01.png">
			<div class="product_info">
				<span>운동 용품 이름</span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'>28,000원</span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
			</div>
		</div>
		<div class="product_image">
			<div class="rank_mark">
				<span class="rank_num">2</span>
				<img alt="2위" src="${contextPath}/resources/image/bookmark-tag.png">
			</div>
			<img alt="용품02" src="${contextPath}/resources/image/product_02.png">
			<div class="product_info">
				<span>운동 용품 이름</span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'>28,000원</span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
			</div>
		</div>
		<div class="product_image">
			<div class="rank_mark">
				<span class="rank_num">3</span>
				<img alt="3위" src="${contextPath}/resources/image/bookmark-tag.png">
			</div>
			<img alt="용품03" src="${contextPath}/resources/image/product_03.png">
			<div class="product_info">
				<span>운동 용품 이름</span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'>28,000원</span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
			</div>
		</div>
	</div>
 </div>
 
 <div class="last_content">
	<div class="first_text last">
		<span><b>짐바로 이벤트</b> 기획 상품 <img alt="icon_map" src="${contextPath}/resources/image/event.png"></span>
	</div>
	
	<div class="product_content">
		<div class="product_image">
			<img alt="용품01" src="${contextPath}/resources/image/product_04.PNG">
			<div class="product_info">
				<span>운동 용품 이름</span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'>28,000원</span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
			</div>
		</div>
		<div class="product_image">
			<img alt="용품02" src="${contextPath}/resources/image/product_05.PNG">
			<div class="product_info">
				<span>운동 용품 이름</span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'>28,000원</span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
			</div>
		</div>
		<div class="product_image">
			<img alt="용품03" src="${contextPath}/resources/image/product_06.PNG">
			<div class="product_info">
				<span>운동 용품 이름</span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'>28,000원</span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
			</div>
		</div>
	</div>
 </div>
 			
</div>
</body>
</html>