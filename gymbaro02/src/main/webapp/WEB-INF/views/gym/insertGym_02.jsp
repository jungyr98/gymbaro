<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/insertGym_02.css" type="text/css">
<head>
<meta charset="utf-8">
<style>

body {
		font-family: 'Noto Sans KR', sans-serif;
	}
table, tr, td {
   border-collapse : collapse;
   border: 1px solid #c4c4c4;
}

td {
	padding-left: 10px;
	font-size: medium;
}
</style>
</head>
<body>
	<div class="main_container">
	<p id="title">시설 등록</p>
	<div class="step_bar">
		<div class="step_bar_01 bars"><span>기본 정보 입력</span></div>
		<div class="step_bar_02 bars"><span>가격 정보·사진 정보 입력</span></div>
		<div class="step_bar_03 bars"><span>등록 신청 완료</span></div>
	 </div>
	<form action="${contextPath}/gym/insertGym_03.do" method="post">
		<br><br><br>	
		<table id="table1">
			<thead>
				<tr>
					<td class="fixed_join">SNS 주소</td>
					<td>
					  <input type="checkbox" name="kakao" id="kakao"><img src="image/kakao.png" alt="카카오톡">
					  <input type="checkbox" name="instagram" id="instagram"><img src="image/instagram.png" alt="인스타그램">
					  <input type="checkbox" name="naverblog" id="naverblog"><img src="image/blog.png" alt="네이버 블로그">
					  <input type="checkbox" name="kakao" id="facebook"><img src="image/facebook.png" alt="페이스북">
					  <input type="checkbox" name="home" id="home"><img src="image/home.png" alt="홈페이지">
					  <br>
						주소<input type="url" name="snsaddress" id="snsaddress">
					</td>
					

				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">시설 사진</td>
					<td>
                        <input type="file" name="photo1" id="photo">
						<br>
						<input type="file" name="photo2" id="photo">
						<br>
						<input type="file" name="photo3" id="photo">
						<br>
						<input type="file" name="photo4" id="photo">
						<br>
						<input type="file" name="photo5" id="photo">
                    </td>
				</tr>
			</thead>
	
			<thead>
				<tr>
					<td class="fixed_join">가격 정보</td>
					<td>
						<div id="price_info">
						일일권&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="price1" id="price" min="0" placeholder="일일권 금액을 입력하세요 (단위: 원)">
						1개월권 <input type="number" name="price2" id="price" min="0" placeholder="1개월권 금액을 입력하세요 (단위: 원)"><br>
						3개월권&nbsp; <input type="number" name="price3" id="price" min="0" placeholder="3개월권 금액을 입력하세요 (단위: 원)">
						6개월권 <input type="number" name="price4" id="price" min="0" placeholder="6개월권 금액을 입력하세요 (단위: 원)"><br>
						연간회원 <input type="number" name="price5" id="price" min="0" placeholder="연간회원권 금액을 입력하세요 (단위: 원)">
						</div>
					</td>
				</tr>
			</thead>
		</table>
		<br>
		<div class="button_box" style="float: right;">
			<a><button id="button_01"><span>이전으로</span></button></a> &nbsp;
			<a><button id="button_02"><span>다음으로</span></button></a>
		 </div>
				</form>	
		</div>
</body>
</html>