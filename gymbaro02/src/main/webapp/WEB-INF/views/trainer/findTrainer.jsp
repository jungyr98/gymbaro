<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="${contextPath}/resources/css/findTrainer.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>

body {
		font-family: 'Noto Sans KR', sans-serif;
	}

</style>
</head>
<body>
	<div class="main_container">
	 <div class="first_content">
	 
	  	<p id="title">트레이너 찾기</p>
	  	<p id="subtitle">나에게 맞는 트레이너를 찾아보세요!</p>
		<div class="trainer_info_box trainer1">
			<div class="trainer_img_box">
				<img src="${contextPath}/resources/image/trainer1.jpg" alt="trainer1" id="trainer_profile_img">
			</div>
			<div id="trainer_profile_text">
				<div>
					<span id="profile_name">송초코 선생님</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<span><button id="profile_check" type="button" onclick="location.href='#'"> 프로필 확인하기 ></button></span>
				</div>
				<div class="trainer_location_info_box">
					<p id="profile_gym">탄방 초코헬스</p>
					<p id="profile_address">대전 서구 탄방동</p>
				</div>
				<div class="trainer_tag_box">
					<div>
						<button id="gym_icon">헬스</button>
						<button id="gym_icon2">PT</button>
					</div>
					<button id="chat_icon"><a href="${contextPath}/trainer/trainerpersonalQ.do">1:1 문의</a></button>
				</div>
			</div>
		</div>
		<hr id="hrstyle">
		<div class="trainer_info_box trainer2">
			<div class="trainer_img_box">
				<img src="${contextPath}/resources/image/trainer2.jpg" alt="trainer2" id="trainer_profile_img">
			</div>
			<div id="trainer_profile_text">
				<div>
					<span id="profile_name">정해피 선생님</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<span><button id="profile_check" type="button" onclick="location.href='#'"> 프로필 확인하기 ></button></span>
				</div>
				<div class="trainer_location_info_box">
					<p id="profile_gym">반석 해피필라테스</p>
					<p id="profile_address">대전 유성구 반석동</p>
				</div>
				<div class="trainer_tag_box">
					<div>
						<button id="gym_icon">필라테스</button>
					</div>
					<button id="chat_icon">1:1 문의</button>
				</div>
			</div>
		</div>
		<br>
		<hr id="hrstyle">
		<div class="trainer_info_box trainer3">
			<div class="trainer_img_box">
				<img src="${contextPath}/resources/image/trainer3.jpg" alt="trainer3" id="trainer_profile_img">
			</div>
			<div id="trainer_profile_text">
				<div>
					<span id="profile_name">이누렁 선생님</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<span><button id="profile_check" type="button" onclick="location.href='#'"> 프로필 확인하기 ></button></span>
				</div>
				<div class="trainer_location_info_box">
					<p id="profile_gym">누렁복싱</p>
					<p id="profile_address">대전 서구 도안동</p>
				</div>
				<div class="trainer_tag_box">
					<div>
						<button id="gym_icon">복싱</button>
						<button id="gym_icon2">헬스</button>
					</div>
					<button id="chat_icon">1:1 문의</button>
				</div>
			</div>
		</div>
		<br>
		<hr id="hrstyle">
	  </div>
	</div> 		
</body>
</html>