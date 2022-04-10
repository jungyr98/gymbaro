<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
table, tr, td {
   border-collapse : collapse;
   border: 1px solid #c4c4c4;
}

td {
	padding-left: 10px;
	font-size: medium;
}
</style>
<link rel="stylesheet" href="${contextPath}/resources/css/insertGym_01.css" type="text/css">
</head>
<body>
	<div class="main_container">
	<p id="title">시설 등록</p>
	<div class="step_bar">
		<div class="step_bar_01 bars"><span>기본 정보 입력</span></div>
		<div class="step_bar_02 bars"><span>가격 정보·사진 정보 입력</span></div>
		<div class="step_bar_03 bars"><span>등록 신청 완료</span></div>
	 </div>
	<form action="${contextPath}/gym/insertGym_02.do" method="post">
		<br><br><br>	
		<table id="table1">
			<thead>
				<tr>
					<td class="fixed_join">시설 이름</td>
					<td>
					  <input type="text" name="name" id="name">
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">시설 주소</td>
					<td>
                        <input type="text" name="address" id="address">
                    </td>
				</tr>
			</thead>
	
			<thead>
				<tr>
					<td class="fixed_join">소개글</td>
					<td>
						<input type="text" name="introduction" id="introduction">
					</td>
				</tr>
			</thead>

			<thead>
				<tr>
					<td class="fixed_join">운영 시간</td>
					<td>
                        <select name="opening" onChange="" title="오픈 시간" id="opening">
							<option value="none">오픈 시간</option>
							<option value="06:00">06:00</option>
							<option value="07:00">07:00</option>
							<option value="08:00">08:00</option>
							<option value="09:00">09:00</option>
						</select>
                        <span> ~ </span>
                        <select name="closing" onChange="" title="마감 시간" id="closing">
							<option value="none">마감 시간</option>
							<option value="20:00">20:00</option>
							<option value="21:00">21:00</option>
							<option value="22:00">22:00</option>
							<option value="23:00">23:00</option>
                            <option value="23:00">24:00</option>
						</select>
					</td>
				</tr>
			</thead>

			<thead>
				<tr>
					<td class="fixed_join">운영 프로그램</td>
					<td>
						<input type="text" name="program" id="program">
					</td>
				</tr>
			</thead>
			
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">편의시설</td>
				<td>
					<input type="checkbox" id="checklist"> 주차장
                    <input type="checkbox" id="checklist"> 운동복
                    <input type="checkbox" id="checklist"> 수건
                    <input type="checkbox" id="checklist"> 탈의실
                    <input type="checkbox" id="checklist"> 샤워실
                    <input type="checkbox" id="checklist"> Wi-Fi
                    <input type="checkbox" id="checklist"> 체성분 검사
				</td>
				</tr>
			</thead>
		</table>
		<br>
		<div class="button_box" style="float: right;">
			<a><button id="button_01"><span>이전으로</span></button></a> &nbsp;
			<a href="${contextPath}/gym/insertGym_02.do"><button id="button_02"><span>다음으로</span></button></a>
		 </div>
				</form>	
		</div>
</body>
</html>