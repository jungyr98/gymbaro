<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</head>
<body>
<div class="main_container">
 <div class="my_location_setting_box">
 	<div class="now_location_box">
 		<span><b>홈 > 시설 찾기</b></span>
 		<div>
 		<img alt="gps.png" src="${contextPath}/resources/image/gps.png">
 		<span>${address}</span>
 		</div>
 	</div>
 	<div class="location_setting">
 		<a href="${contextPath}/gym/searchMap.do">재설정 ㅣ 위치지정</a>
 	</div>
 </div>
 <div class="first_content">
	<div class="first_text">
		<span><b>짐바로 추천</b> 제휴 시설 <img alt="icon_map" src="${contextPath}/resources/image/gymbaro_like.png"></span>
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
  <div class="second_content">
	<div class="first_text">
		<span><b>접속 위치 주변</b> 운동 시설 <img alt="icon_map" src="${contextPath}/resources/image/location.png"></span>
	</div>
	
	<div class="gym_content">
		<c:choose>
		<c:when test="${not empty locationList}">
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
			<h4>주변 운동 시설이 없습니다.</h4>
		</c:otherwise>
		</c:choose>
	</div>
 </div>
</div>
</body>
</html>