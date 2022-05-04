<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<head>
<meta charset="utf-8">
<style>
body {
		font-family: 'Noto Sans KR', sans-serif;
	}
.main_container {
   width:750px;
}


#box {
	margin-top:100px;
	width:730px; 
	height:250px; 
	border: 1px solid #c4c4c4; 
	text-align: center; 
	padding-top: 60px;
}

.button_box {
   display:flex;
   justify-content:space-between;
   margin-top:20px;
   height:70px;
}

.button_box button {
   border:none;
   border-radius:2px;
   width:360px;
   height:50px;
}

.button_box button span {
   font-size:20px;
   color:white;
}

#button_01 {
   background: #c4c4c4;
}

#button_02 {
   background: #184798;
}
</style>
</head>
<body>
<form action="${contextPath}/member/idFindSuccessByNum.do">
<div class="main_container">
		<div id="box">
            <p style="font-size: 20px;">${member_name}님의 아이디는 </p> 
			<p style="font-size: 28px; color:#184798; font-weight: bold;">${myIdByNum}</p>
			<p style="font-size: 20px;">입니다!</p> 
	</div>
	<br>
	<div class="button_box">
     	 <a href="${contextPath}/main/main.do"><button id="button_01"><span>메인으로</span></button></a>
     	 <a href="${contextPath}/member/loginForm.do"><button id="button_02"><span>로그인</span></button></a>
   		</div>
	</div>
	</form>
</body>
</html>