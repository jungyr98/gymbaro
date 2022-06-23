<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
	<div class="findTrainer_box main_container">
	 <div class="first_content">
	  	<p id="title">트레이너 찾기</p>
	  	<p id="subtitle">나에게 맞는 트레이너를 찾아보세요!</p>
		<div class="trainer_info_box trainer1">
			<div class="trainer_img_box">
				<img src="${contextPath}/resources/image/trainer1.jpg" alt="trainer1" id="trainer_profile_img">
			</div>
			<div id="trainer_profile_text">
				<div>
					<button id="profile_check" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> 송초코 선생님 </button>
					<div class="accordion" id="accordionExample">
  						<div class="accordion-item">
    						<h2 class="accordion-header" id="headingOne">
    						</h2>
    				<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      					<div class="accordion-body">
        		     		<div>
      							<p id="profile_title">경력 및 자격</p>
        		     			<p id="profile_content"> 2020 보디빌딩 대회 우승 </p>
        		     			<p id="profile_content"> 2021 보디빌딩 대회 우승 </p>
        		     			<p id="profile_content"> 생활체육지도사 2급 </p>
        		     			<p id="profile_content"> 스포츠마사지 2급 </p>
							</div> <!-- 프로필 태그 닫기 -->
        		        </div>
    				  </div>
  					 </div>
				</div> <!-- 아코디언 닫기 -->
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
			</div> <!-- 버튼 태그 닫기 -->
		</div>
	</div>
	
		<hr id="hrstyle">
		
		<div class="trainer_info_box trainer2">
			<div class="trainer_img_box">
				<img src="${contextPath}/resources/image/trainer2.jpg" alt="trainer2" id="trainer_profile_img">
			</div>
			<div id="trainer_profile_text">
				<div>
					<button id="profile_check" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"> 정해피 선생님 </button>
					<div class="accordion" id="accordionExample">
					<div class="accordion-item">
    					<h2 class="accordion-header" id="headingTwo">
    					</h2>
    				<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      					<div class="accordion-body">
      						<div>
      							<p id="profile_title">경력 및 자격</p>
        		     			<p id="profile_content"> 그린대학교 생활체육학과</p>
        		     			<p id="profile_content"> 생활체육지도사 2급 </p>
        		     			<p id="profile_content"> 필라테스 교육 과정 수료 </p>
							</div> <!-- 프로필 태그 닫기 -->     					 
     					 </div>
  					  </div>
  					</div>
				</div>
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
		
		<hr id="hrstyle">
		
		<div class="trainer_info_box trainer3">
			<div class="trainer_img_box">
				<img src="${contextPath}/resources/image/trainer3.jpg" alt="trainer3" id="trainer_profile_img">
			</div>
			<div id="trainer_profile_text">
				<div>
					<button id="profile_check" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"> 이누렁 선생님</button>
					<div class="accordion" id="accordionExample">
					<div class="accordion-item">
    					<h2 class="accordion-header" id="headingThree">
    					</h2>
   					 <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      					<div class="accordion-body">
        					<div>
      							<p id="profile_title">경력 및 자격</p>
        		     			<p id="profile_content"> 1990 그린복싱대회 준우승 </p>
        		     			<p id="profile_content"> 1991 그린복싱대회 우승 </p>
        		     			<p id="profile_content"> 2000~2010 그린복싱 관장 </p>
							</div> <!-- 프로필 태그 닫기 -->
      					</div>
   					 </div>
  					</div>
  				</div>
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