<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"   
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextPath}/resources/css/outMember.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div class="main_container">
	<div class="first_content">
   <div class="first_text">
      <span><b>회원 탈퇴</b></span>
   </div>
		<div id="outMember_box">
			<p class="red_read_text"><b>유의사항</b></p><br>
			<span class="info_read_text">포인트, 쿠폰, 회원 등급, 장바구니 등의 데이터는 <b>삭제</b>됩니다.</span><br>
			<span class="info_read_text">각종 게시판의 게시글, 댓글 등의 데이터는 삭제되지 않습니다. 반드시 <b>탈퇴 전 직접 삭제</b>하셔야 합니다.</span><br>
			<span class="info_read_text">회원 탈퇴 즉시 모든 회원 정보가 삭제되며 재가입시에도 <b>기존 아이디</b>는 더 이상 사용하실 수 없습니다.</span><br>
			<span class="info_read_text">회원 탈퇴 후 주문 정보 및 예약 정보는 <b>5년간</b> 보관됩니다.</span><br>
			<form id="outMember_form" action="#" method="post">
				<input type="text" name="search_pwd" id="search_pwd" value="비밀번호를 입력하세요"/><br>
				<button type="button" id="button_02" onclick="javascript:history.back();">뒤로 가기</button>
				<input type="submit" id="button_01" value="탈퇴 하기">
			</form>
	</div>
	</div>
</div>
</body>
</html>