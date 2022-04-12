<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
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
 		<span>서울 특별시 중구 명동</span>
 		</div>
 	</div>
 	<div class="location_setting">
 		<a>재설정 ㅣ 위치지정</a>
 	</div>
 </div>
 <div class="first_content">
	<div class="first_text">
		<span><b>짐바로 추천</b> 제휴 시설 <img alt="icon_map" src="${contextPath}/resources/image/gymbaro_like.png"></span>
	</div>
	
	<div class="gym_content">
		<div class="gym_image" onClick="location.href ='${contextPath}/gym/gymsInfo.do'">
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
</div>
</body>
</html>