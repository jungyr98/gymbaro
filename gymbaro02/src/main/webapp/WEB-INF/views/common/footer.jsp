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
        <div class="align con">
            <address>
                <span><img src="${contextPath}/resources/image/logo.png" alt="짐바로 로고"></span>
                <br>
                <br>
                스포츠 시설 예약 및 용품 구매 서비스 주식회사 ㅣ  대표이사 : 2조
                <br>
                주소 : 대전광역시 서구 대덕대로 182 오라클 빌딩 3층
                <br>
                사업자 등록번호 : 123-456-78910
                <br>
                Tel : 042-123-4567 ㅣ Fax : 070-123-4567
                <br>
                Copyright 2022 Team Gymbaro Inc. All rights reserved.
            </address>
            <div class="sc">
                  <a href="#" target="_blank"  class="fa-brands fa-facebook"></a>
                  <a href="#" target="_blank" class="fa-brands fa-instagram"></a>
            </div>
        </div>
    </footer>
</body>
</html>