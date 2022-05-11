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
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
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


var latitude = "", longitude = "";

window.onload = function() {
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(onSuccess, onError);
    } else {
        latitude = "", longitude = "";
    }	
}


function onSuccess(position) {
	latitude = position.coords.latitude;
    longitude = position.coords.longitude;
    console.log("성공");
    console.log(latitude);
    console.log(longitude);
    $.ajax({
    	type:"POST",
    	url:"${contextPath}/main/ipCheck.do",
    	data:{
    		"latitude":latitude,
    		"longitude":longitude
    	},
    	success:function(data, textStatus){
    		console.log("전송 성공");
    	},
    	error:function(data, textStatus){
    		alert("에러가 발생했습니다.");
    	}
    });
}

function onError() {
	latitude ="N/A";
	longitude = "N/A";
	 $.ajax({
     	type:"POST",
     	url:"${contextPath}/main/ipCheck.do",
     	data:{
     		"latitude":latitude,
     		"longitude":longitude
     	},
     	success:function(data, textStatus){
     		console.log("전송 성공");
     	},
     	error:function(data, textStatus){
     		alert("에러가 발생했습니다.");
     	}
     });        
}    
</script>
<style type="text/css">
.product_content {
	display:flex;
	justify-content:space-between;
	margin-top: 150px;
}
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
			<!--  <div class="rank_mark">
				<span class="rank_num">1</span>
				<img alt="1위" src="${contextPath}/resources/image/tag.png">
			</div>-->
			<a href="${contextPath}/goods/goodsInfo.do">
				<img alt="용품01" src="${contextPath}/resources/image/dumbell.png">
			</a>
			<div class="product_info">
				<span style="font-weight: bold;">운동 용품 이름</span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'><strike>28,000원</strike></span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
				<!--<div class="product_into_star">
					<label for="rate1"><span class="fa-solid fa-star"></span></label>
					<label for="rate2"><span class="fa-solid fa-star"></span></label>
					<label for="rate3"><span class="fa-solid fa-star"></span></label>
					<label for="rate4"><span class="fa-solid fa-star"></span></label>
					<label for="rate5"><span class="fa-solid fa-star"></span></label>
				</div>-->
			</div>
		</div>
		<div class="product_image">
			<!-- <div class="rank_mark">
				<span class="rank_num">2</span>
				<img alt="2위" src="${contextPath}/resources/image/tag.png">
			</div>-->
			<img alt="용품02" src="${contextPath}/resources/image/roller.png">
			<div class="product_info">
				<span style="font-weight: bold;">운동 용품 이름</span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'><strike>28,000원</strike></span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
				<!--<div class="product_into_star">
					<label for="rate1">⭐</label>
					<label for="rate2">⭐</label>
					<label for="rate3">⭐</label>
					<label for="rate4">⭐</label>
					<label for="rate5">⭐</label>
				</div>-->
			</div>
		</div>
		<div class="product_image">
			<!--  <div class="rank_mark">
				<span class="rank_num">3</span>
				<img alt="3위" src="${contextPath}/resources/image/tag.png">
			</div>-->
			<img alt="용품03" src="${contextPath}/resources/image/backback.png">
			<div class="product_info">
				<span style="font-weight: bold;">운동 용품 이름</span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'><strike>28,000원</strike></span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
				<!--<div class="product_into_star">
					<label for="rate1">⭐</label>
					<label for="rate2">⭐</label>
					<label for="rate3">⭐</label>
					<label for="rate4">⭐</label>
					<label for="rate5">⭐</label>
				</div>-->
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