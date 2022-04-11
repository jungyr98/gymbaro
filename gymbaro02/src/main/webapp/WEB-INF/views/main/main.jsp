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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function () {
    var n = 0;
    var pos = 0;
    setInterval(function () {
        n = n + 1;
        pos = -1 * 1024 * n;
        $(".main_container .slider ul").animate({ "left": pos }, 300, function () {
            if (n == 4) {
                n = 0;
                pos = 0;
                $(".main_container .slider ul").css({ "left": pos });
            }
        });
    }, 3000);
});
</script>
<style type="text/css">

body {
	font-family: 'Noto Sans KR', sans-serif;
}


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
	justify-content: space-between;
    margin-bottom: 5px;
}

.gym_image {
	border: 1px solid #c4c4c4;
	border-radius:5px;
	box-shadow: 0 1px 3px rgb(0 0 0 / 12%), 0 1px 2px rgb(0 0 0 / 24%);
	text-align:start;
	transition:0.3s; 
}

.gym_image:hover {
	cursor:pointer;
	transition: 0.3;
}

.gym_image img {
	width:337px;
	height:227px;
}

.gym_image .gym_image_tag_box {
	margin-top:20px;
}

.gym_image .gym_image_info_box,
.gym_image .gym_image_tag_box {
	margin: 20px 10px;
}

.gym_image .gym_image_info_box .gym_image_info_title {
	font-size:17px;
	font-weight:bold;
	color: #424040;
}

.gym_image .gym_image_info_box div {
	display:flex;
	justify-content:space-between;
	font-size: 15px;
    color: #424040;
    margin-top: 5px;
}

.gym_image .gym_image_tag_box {
	margin-top:40px;
}

.gym_image .gym_image_tag_box span {
	padding: 0 10px;
    border: 1px solid #424040;
    border-radius: 13px;
    color: #424040;
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
	width:300px;
	height:280px;
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

.event_content {
	display:flex;
	justify-content: space-between;
}

.event_image img{
	width: 500px;
	height: 250px;
}

body, html {margin: 0; padding: 0;}
ul {list-style: none; margin: 0; padding: 0;}

.main_container .container { }
.main_container .slider {position: relative; width: 1024px; height: 500px; overflow: hidden;}
.main_container .slider ul {position: absolute; left: 0; top: 0; width: 4096px; height: 597px;}
.main_container .slider li {float: left; width: 1024px; height: 597px;}
.main_container .slider li img {max-width: 100%;}

</style>
</head>
<body>
<div class="main_container">
	<div class="main_img">
		<div class="container">
        <div class="slider">
            <ul>
                <li class="active">
                    <a href="#">
                        <img alt="swim.png" src="${contextPath}/resources/image/swim.PNG" width="1024">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img alt="boxing.png" src="${contextPath}/resources/image/main_join_event.PNG" width="1024">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img alt="yoga.png" src="${contextPath}/resources/image/main_photo_review_event.PNG" width="1024">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img alt="health.png" src="${contextPath}/resources/image/main_review_event.PNG" width="1024">
                    </a>
                </li>
            </ul>
        </div>
    </div>
	</div>
	
 <div class="first_content">
	<div class="first_text">
		<span><b>접속 위치 주변</b> 운동 시설 <img alt="icon_map" src="${contextPath}/resources/image/location.png"></span>
	</div>
	
	<div class="gym_content">
		<div class="gym_image">
			<img alt="시설01" src="${contextPath}/resources/image/gym_01.PNG">
			<div class="gym_image_info_box">
				<span class="gym_image_info_title">홍제 짐굿라이프</span>
				<div>
					<span>서울 서대문구 홍제동</span>
					<span>1.78 km</span>
				</div>
			</div>
			<div class="gym_image_tag_box">
				<span>P.T</span>
				<span>헬스</span>
			</div>
		</div>
		<div class="gym_image">
			<img alt="시설02" src="${contextPath}/resources/image/gym_02.PNG">
			<div class="gym_image_info_box">
				<span class="gym_image_info_title">홍제 에이스 복싱</span>
				<div>
					<span>서울 서대문구 홍제동</span>
					<span>1.86 km</span>
				</div>
			</div>
			<div class="gym_image_tag_box">
				<span>복싱</span>
				<span>그룹P.T</span>
			</div>
		</div>
		<div class="gym_image">
			<img alt="시설03" src="${contextPath}/resources/image/gym_03.PNG">
			<div class="gym_image_info_box">
				<span class="gym_image_info_title">홍제 매직짐</span>
				<div>
					<span>서울 서대문구 홍제동</span>
					<span>2.10 km</span>
				</div>
			</div>
			<div class="gym_image_tag_box">
				<span>헬스</span>
				<span>P.T</span>
			</div>
		</div>
	</div>
	<div class="gym_content">
		<div class="gym_image">
			<img alt="시설03" src="${contextPath}/resources/image/gym_04.PNG">
			<div class="gym_image_info_box">
				<span class="gym_image_info_title">광화문 MCT GYM</span>
				<div>
					<span>서울 종로구 내수동</span>
					<span>2.26 km</span>
				</div>
			</div>
			<div class="gym_image_tag_box">
				<span>P.T</span>
				<span>헬스</span>
			</div>
		</div>
		<div class="gym_image">
			<img alt="시설04" src="${contextPath}/resources/image/gym_05.PNG">
			<div class="gym_image_info_box">
				<span class="gym_image_info_title">광화문 피트니스 101</span>
				<div>
					<span>서울 종로구 내수동</span>
					<span>2.30 km</span>
				</div>
			</div>
			<div class="gym_image_tag_box">
				<span>P.T</span>
				<span>헬스</span>
				<span>기구 필라테스</span>
			</div>
		</div>
		<div class="gym_image">
			<img alt="시설05" src="${contextPath}/resources/image/gym_06.PNG">
			<div class="gym_image_info_box">
				<span class="gym_image_info_title">서대문 짐피닉스 PT스튜디오</span>
				<div>
					<span>서울 서대문구 교남동</span>
					<span>2.67 km</span>
				</div>
			</div>
			<div class="gym_image_tag_box">
				<span>그룹P.T</span>
				<span>헬스</span>
			</div>
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
		<span><b>짐바로 이벤트</b> 기획 <img alt="icon_map" src="${contextPath}/resources/image/event.png"></span>
	</div>
	
	<div class="event_content">
		<div class="event_image">
			<img alt="event" src="${contextPath}/resources/image/main_coupon.PNG">
		</div>
		<div class="event_image">
			<img alt="event" src="${contextPath}/resources/image/main_coupon.PNG">
		</div>
	</div>
 </div>
 			
</div>
</body>
</html>