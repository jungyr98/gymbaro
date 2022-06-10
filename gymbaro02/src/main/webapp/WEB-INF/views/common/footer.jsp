<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  	<!-- css 파일 링크 -->
  	<link href="${contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css" media="screen">
  	
  	<!-- 폰트 링크 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
<title>footer</title>
</head>
<body>
	<footer class="footer_box">
		<div id="shop_info_box">
			<a href="${contextPath}/cs/csQnA.do" id="csQnA_link">고객센터 ></a>
			<span> 스포츠 시설 예약 및 용품 구매 서비스 주식회사 ㅣ  대표이사 : 2조</span>
			<span>주소 : 대전광역시 서구 대덕대로 182 오라클 빌딩 3층</span>
			<span>사업자 등록번호 : 123-456-78910</span>
			<span>Tel : 042-123-4567 ㅣ Fax : 070-123-4567</span>
			<span>Copyright 2022 Team Gymbaro Inc. All rights reserved.</span>
		</div>
		<div id="sns_url_box">
        	<img width="24" alt="" src="${contextPath}/resources/image/kakao.png">
       		<img width="24" alt="" src="${contextPath}/resources/image/blog.png">
       		<img width="24" alt="" src="${contextPath}/resources/image/facebook.png">
       		<img width="24" alt="" src="${contextPath}/resources/image/instagram.png">
		</div>
    </footer>
</body>
</html>