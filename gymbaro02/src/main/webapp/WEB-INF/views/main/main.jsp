<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="recommandList" value="${gymMap.recommandList}" />
<c:set var="locationList" value="${gymMap.locationList}" />
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
<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">	
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function () {
    var n = 0;
    var pos = 0;
    setInterval(function () {
        n = n + 1;
        pos = -1 * 320 * n;
        $(".main_container .slider ul").animate({ "left": pos }, 320, function () {
            if (n == 4) {
                n = 0;
                pos = 0;
                $(".main_container .slider ul").css({ "left": pos });
            }
        });
    }, 5000);
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
    
    var addressCheck = $('input[name="addressCheck"]').val();
    console.log(addressCheck);
    if(addressCheck != 'Y'){
    $.ajax({
    	type:"POST",
    	url:"${contextPath}/main/ipCheck.do",
    	data:{
    		"latitude":latitude,
    		"longitude":longitude
    	},
    	success:function(data, textStatus){
    		console.log("전송 성공");
    		location.reload();
    	},
    	error:function(data, textStatus){
    		alert("에러가 발생했습니다.");
    	}
    });
    }
}

function onError() {
	_latitude ="N/A";
	_longitude = "N/A";
	var addressCheck = $('input[name="addressCheck"]').val();
    console.log(addressCheck);
    if(addressCheck != 'N'){
	 $.ajax({
     	type:"POST",
     	url:"${contextPath}/main/ipCheck.do",
     	data:{
     		"latitude":_latitude,
     		"longitude":_longitude
     	},
     	success:function(data, textStatus){
     		console.log("전송 실패");
     		location.reload();
     	},
     	error:function(data, textStatus){
     		alert("에러가 발생했습니다.");
     	}
     });
    }
}

$(".carousel").carousel();
</script>
</head>
<body>
<div class="main_container">
	<div id="carousel" class="carousel slide carousel-fade" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carousel" data-slide-to="0" class="active"></li>
        <li data-target="#carousel" data-slide-to="1"></li>
        <li data-target="#carousel" data-slide-to="2"></li>
        <li data-target="#carousel" data-slide-to="3"></li>
    </ol>
    <!-- Carousel items -->
    <div class="carousel-inner">
        <div class="active item">
        	<img alt="main_photo01.png" src="${contextPath}/resources/image/main_photo04.png">
        </div>
        <div class="item">
        	<img alt="main_photo01.png" src="${contextPath}/resources/image/main_photo01.png">
        </div>
        <div class="item">
        	<img alt="main_photo01.png" src="${contextPath}/resources/image/main_photo03.png">
        </div>
        <div class="item">
        	<img alt="main_photo01.png" src="${contextPath}/resources/image/main_photo02.png">
        </div>
    </div>
    <!-- Carousel nav -->
    <a class="carousel-control left" href="#carousel" data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#carousel" data-slide="next">&rsaquo;</a>
	</div>
	<div class="first_text">
 		<c:choose>
			<c:when test="${not empty address and address != 'N/A'}">
				<span><b>가장 가까운</b> 주변 운동 시설 <span class="glyphicon glyphicon-map-marker"></span></span>
			</c:when>
			<c:otherwise>
				<span><b>오늘의 추천</b> 운동 시설 <span class="glyphicon glyphicon-ok"></span></span>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="main_img">
		<div class="recommand_box">
			<input type="hidden" name="addressCheck" value="${addressCheck}">
			<c:choose>
			<c:when test="${not empty address and address != 'N/A'}">
				<a href="${contextPath}/gym/gymsInfo.do?gym_id=${locationList[0].gym_id}"><img alt="" src="${contextPath}/downloadGym?gym_id=${locationList[0].gym_id}&fileName=${locationList[0].gym_fileName}"></a>
				<div id="recommand_text_box">
					<div id="gym_info_div">
						<span id="gym_info_span">${locationList[0].gym_name}</span>
						<span id="gym_address">${locationList[0].firstAddress} ${locationList[0].distance} km</span>
					</div>
					<span id="link_span">보러가기</span>
				</div>
			</c:when>
			<c:otherwise>
				<a href="${contextPath}/gym/gymsInfo.do?gym_id=${recommandList[0].gym_id}"><img alt="" src="${contextPath}/downloadGym?gym_id=${recommandList[0].gym_id}&fileName=${recommandList[0].gym_fileName}"></a>
				<div id="recommand_text_box">
					<div id="gym_info_div">
						<span id="gym_info_span">${recommandList[0].gym_name}</span>
						<span id="gym_address">${recommandList[0].firstAddress}</span>
					</div>
					<span id="link_span">보러가기</span>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
        <div class="slider">
            <ul>
                <li class="active">
                    <a href="#">
                        <img alt="swim.png" src="${contextPath}/resources/image/side_photo01.png">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img alt="boxing.png" src="${contextPath}/resources/image/side_photo02.png">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img alt="yoga.png" src="${contextPath}/resources/image/side_photo03.png">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img alt="health.png" src="${contextPath}/resources/image/side_photo02.png">
                    </a>
                </li>
            </ul>
    	</div>
	</div>
 	<div class="first_text">
 		<c:choose>
			<c:when test="${not empty address and address != 'N/A'}">
				<span><b>접속 위치 주변</b> 운동 시설 <span class="glyphicon glyphicon-map-marker"></span></span>
			</c:when>
			<c:otherwise>
				<span><b>짐바로 추천</b> 운동 시설 <span class="glyphicon glyphicon-ok"></span></span>
			</c:otherwise>
		</c:choose>
	</div>	
 <div class="first_content">
	<div class="gym_content">
	<c:choose>
		<c:when test="${not empty address and address != 'N/A'}">
		<c:forEach var="item" items="${locationList}">
		<a href="${contextPath}/gym/gymsInfo.do?gym_id=${item.gym_id}">
		<div class="gym_image">
			<img width="75" alt="" src="${contextPath}/thumbnailsGym.do?gym_id=${item.gym_id}&fileName=${item.gym_fileName}">
			<div class="gym_image_info_box">
				<span class="gym_image_info_title">${item.gym_name}</span>
				<div>
					<span>${item.firstAddress}</span>
					<span>${item.distance} km</span>
				</div>
			</div>
			<div class="gym_image_tag_box">
				<span>${item.first_option}</span>
			</div>
		</div>
		</a>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<c:forEach var="item" items="${recommandList}">
		<div class="gym_image">
			<a href="${contextPath}/gym/gymsInfo.do?gym_id=${item.gym_id}">
				<img width="75" alt="" src="${contextPath}/thumbnailsGym.do?gym_id=${item.gym_id}&fileName=${item.gym_fileName}">
			</a>
			<div class="gym_image_info_box">
				<span class="gym_image_info_title">${item.gym_name}</span>
				<div>
					<span>${item.firstAddress}</span>
				</div>
			</div>
			<div class="gym_image_tag_box">
				<span>${item.first_option}</span>
			</div>
		</div>
		</c:forEach>
		</c:otherwise>
	</c:choose>
	</div>
 </div>
 
 <div class="first_text second">
	<span>운동 용품 <b>순위 리스트</b></span>
 </div>
 <div class="second_content">	
	<div class="product_content">
	<div class="goods_slider">
	<div class="slide-track">
		<c:forEach var="item" items="${goodsMap.ranking}">
		<div class="slide">
			<div class="product_image">
			<a href="${contextPath}/goods/goodsInfo.do?goods_id=${item.goods_id}">
				<img width="75" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			</a>
			<div class="product_info">
				<span class="goods_name_span" style="font-weight: bold;">${item.goods_name}</span>
				<div class="product_info_price">
					<c:choose>
						<c:when test="${item.goods_discount != 0}">
							<fmt:formatNumber  value="${item.goods_discount}" type="number" var="goods_discount" />
							<span><b>${goods_discount}</b></span>
						</c:when>
						<c:otherwise>
							<fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
							<span><b>${goods_price}</b></span>
						</c:otherwise>
					</c:choose>
					<span style='font-size:14px; color:#424040'><strike>${item.goods_price}</strike></span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
				<div class="product_into_star" style="font-size:20px" >
					<label for="rate1"><span class="fa fa-star" style="color:#184798; font-size:15px; "></span></label>
					<label for="rate2"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate3"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate4"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate5"><span class="fa fa-star-half" style="color:#184798; font-size:15px;"></span></label>
				</div>
			</div>
		  </div>
		</div>
		 </c:forEach>
	   </div>
	  </div>
	</div>
 </div>
 
 <div class="last_content">
	<a href="${contextPath}/member/joinTypeForm.do"><span id="title_span">내 시설 등록하기</span><span id="sub_span">시설 회원으로 가입 후 짐바로와 함께하세요 ></span></a>
 </div>
 			
</div>
</body>
</html>