<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="recommandList" value="${gymMap.recommandList}" />
<c:set var="locationList" value="${gymMap.locationList}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/searchGyms.css">
<title>Insert title here</title>
<script type="text/javascript">
<!--
$(function () {
	var last_item_check = $(".second_content .gym_image");
	if((last_item_check.length % 9) != 0){
		$('#page_wrap').css("display", "none");
	}
});
-->

$(document).ready(function () {
var intersectionObserver = new IntersectionObserver(function(entries) {
	  // If intersectionRatio is 0, the target is out of view
	  // and we do not need to do anything.
	  if (entries[0].intersectionRatio <= 0) return;

	  console.log('Loaded new items');
	});
	// start observing
	intersectionObserver.observe(document.querySelector('#sentinel'));

const io = new IntersectionObserver((entries, observer) => {
	entries.forEach(entry => {
	  if (!entry.isIntersecting) return; 
		//entry가 interscting 중이 아니라면 함수를 실행하지 않습니다.
	  
    search();
		//페이지를 불러오는 함수를 호출합니다.
	});
});
var _total = $(".second_content .gym_image");
if (_total.length == 0) {
	$('#sentinel').hide();
	$(".loading").css("display", "none");
	//검색된 아이템이 없을 경우 관찰중인 요소를 숨긴다.
}
if ((_total.length % 9) != 0){
		$('#sentinel').hide();
		$(".loading").css("display", "none");
		//검색된 아이템이 20개 이하일 경우 관찰중인 요소를 숨긴다.
}
io.observe(document.getElementById('sentinel'));
});

function search(){
	var keyword = $('input[name="keyword"]').val();
	var old_limit = $('input[name="old_limit"]').val();
	var new_limit = parseInt(old_limit) + 6;
	$.ajax({
		url: "${contextPath}/gym/searchGyms.do",
		data:  {
			limit:new_limit,
			keyword:keyword
		},
		method: "post",
		dataType: "html",
		success: function (data) {
			var e = $(data).find('.second_content .gym_image');
			$(".second_content .gym_content").html(e);
			if ((e.length % 6) != 0){
				$('#sentinel').hide();
				$(".loading").css("display", "none");
				//검색된 아이템이 20개 이하일 경우 관찰중인 요소를 숨긴다.
			}
		},
		error: function (err) {
		  console.log(err);
		},
		beforeSend: function () {
	   	// _scrollchk = true; 
	    jQuery(".loading").css("display", "");
		}
	});
}
//더보기 버튼
function view_plus() {
	var keyword = $('input[name="keyword"]').val();
	var old_limit = $('input[name="old_limit"]').val();
	var new_limit = parseInt(old_limit) + 3;
	
	$.ajax({
		type : "post",
		async : true, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/gym/searchGyms.do",
		data : {
			limit:new_limit,
			keyword:keyword
		},
		dataType : 'html',
		success : function(data) {
			var e = $(data).find('.second_content .gym_image');
			$(".second_content .gym_content").html(e);
			var last_item_check = $(".second_content .gym_image");
			if((last_item_check.length % 3) != 0){
				$('#page_wrap').css("display", "none");
			}
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
		}
	}); //end ajax	
}
</script>
<style type="text/css">
.skeleton.text {
    -webkit-clip-path: inset(2px 0 2px 0 round 3px 3px 3px 3px);
    clip-path: inset(2px 0 2px 0 round 3px 3px 3px 3px);
}
.skeleton {
    color: rgba(0,0,0,0);
    background-image: linear-gradient(270deg, rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.05), rgba(0, 0, 0, 0.05), rgba(0, 0, 0, 0.1));
    background-size: 400% 100%;
    animation: skeleton-loading 8s ease-in-out infinite;
}
</style>
</head>
<body>
<div class="main_container">
 <c:if test="${empty condMap.keyword}">
 <div class="my_location_setting_box">
 	<input type="hidden" name="old_limit" value="${condMap.limit}">
	<input type="hidden" name="keyword" value="${condMap.keyword}">
 	<div class="now_location_box">
 		<span style="font-size:24px;">시설 찾기</span>
 		<div>
 		<span class="glyphicon glyphicon-map-marker"></span>&nbsp;
 		<c:choose>
 		<c:when test="${not empty address and address != 'N/A'}">
 			<span>${address}</span>
 		</c:when>
 		<c:otherwise>
 			<span>없음</span>
 		</c:otherwise>
 		</c:choose>
 		</div>
 	</div>
 	<div class="location_setting">
 		<a href="${contextPath}/gym/searchMap.do">재설정 ㅣ 위치지정</a>
 	</div>
 </div>
 </c:if>
 <c:if test="${not empty condMap.keyword}">
 <div class="my_location_setting_box">
 	<div class="now_location_box">
 		<span style="font-size:24px;"><b>"${condMap.keyword}"</b> 검색 결과 <span style="color:#184798;"><b>${fn:length(locationList)}개</b></span></span>
 	</div>
 </div>
 </c:if>
  <c:if test="${empty condMap.keyword}">
 <div class="first_content">
	<div class="first_text">
		<span><b>짐바로 추천</b> 운동 시설 <span class="glyphicon glyphicon-ok"></span></span>
	</div>	
	<div class="gym_content">
		<c:forEach var="item" items="${recommandList}">
		<a href="${contextPath}/gym/gymsInfo.do?gym_id=${item.gym_id}">
		<div class="gym_image">
			<img width="75" alt="" src="${contextPath}/thumbnailsGym.do?gym_id=${item.gym_id}&fileName=${item.gym_fileName}">
			<div class="gym_image_info_box">
				<span class="gym_image_info_title">${item.gym_name}</span>
				<div>
					<span>${item.firstAddress}</span>
					<span>${item.distance}</span>
				</div>
			</div>
			<div class="gym_image_tag_box">
				<span>${item.first_option}</span>
			</div>
		</div>
		</a>
		</c:forEach>
	</div>
 </div>
  <div class="second_content" id="second_content">
	<div class="first_text">
		<span><b>접속 위치 주변</b> 운동 시설 <span class="glyphicon glyphicon-map-marker"></span></span>
	</div>
	
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
			<h4 id="no_address_content"><img src="${contextPath}/resources/image/bankrupt.png" width="28"> 주변 운동 시설이 없습니다. <a href="${contextPath}/gym/searchMap.do">위치 설정하러 가기</a></h4>
		</c:otherwise>
		</c:choose>
	</div>
 </div>
 </c:if>
 <c:if test="${not empty condMap.keyword}">
 <div class="second_content">
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
			<h4 id="no_address_content"><img src="${contextPath}/resources/image/bankrupt.png" width="28"> 주변 운동 시설이 없습니다. <a href="${contextPath}/gym/searchMap.do">위치 설정하러 가기</a></h4>
		</c:otherwise>
		</c:choose>
	</div>
 </div>
 </c:if>
 	<div class="list"></div>
	<p id="sentinel"></p>
	<div class="loading"><img width="360" src="${contextPath}/resources/image/gymLoding.gif"></div>
</div>
</body>
</html>