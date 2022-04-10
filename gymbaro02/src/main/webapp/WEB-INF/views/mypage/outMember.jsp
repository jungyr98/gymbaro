<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextPath}/resources/css/outMember.css" rel="stylesheet" type="text/css" media="screen">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
body {
		font-family: 'Noto Sans KR', sans-serif;
	}
.main_container {
   width:730px;
}

.first_content {

   margin-top:70px;
   border-top:2px solid #C4C4C4;
}

.first_text {
   position:relative;
   top:-15px;
   margin-bottom:50px;
}

.first_text span {

   font-size: 21px;
   background:white;
   padding: 0 15px;
}

.first_text span b {
   color: #184798;
}

#outMember_box {
	margin-top:20px;
	width:730px; 
	height:300px; 
	border: 1px solid #c4c4c4; 
	text-align: center; 
	padding-top: 20px;
}


#button_01 {
   background: #184798;
   border:none;
   border-radius:2px;
   width:262px;
   height:50px;
   font-size:20px;
   color:white;
}

#button_02 {
   background: #c4c4c4;
   border:none;
   border-radius:2px;
   width:262px;
   height:50px;
   font-size:20px;
   color:black;
}

.red_read_text {
	color:#D61010;
}

.info_read_text {
	color:#424040;
}

#outMember_form #search_pwd{
	width:500px;
	height:40px;
	border: 1px solid #c4c4c4;
	border-radius:3px;
	padding-left:10px;
	color: #c4c4c4;
	margin:30px 0;
}
</style>
</head>
<body>
<div class="main_container">
	<div class="first_content">
   <div class="first_text">
      <span><b>회원 탈퇴</b></span>
   </div>
		<div id="outMember_box">
			<p class="red_read_text"><b>유의사항</b></p><br>
			<span class="info_read_text">회원 탈퇴 후 기존의 구매내역과 보유 마일리지는 <b>7일간</b> 유효하며</span><br>
			<span class="info_read_text">해당 기한이 지나면 <b>모두 소멸</b>됩니다. 복구 문의는 7일 내로 가능하므로 고객센터에 문의 바랍니다.</span>
			<form id="outMember_form" action="#" method="post">
				<input type="text" name="search_pwd" id="search_pwd" value="비밀번호를 입력하세요"/><br>
				<button id="button_02" onclick="location.href='mypage.jsp'">뒤로 가기</button>
				<input type="submit" id="button_01" value="탈퇴 하기">
			</form>
	</div>
	</div>
</div>
</body>
</html>