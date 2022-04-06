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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style>
footer{
  background-color:red;
  position:relative;
  padding:10px 16px 180px 16px;
  background:rgb(200,200,200);
}
a{text-decoration:none}
ul,ol,li{list-style:none}
footer{
	text-align: left;
}
footer .link li{
    display:inline-block;
}
footer div address{
  color:rgba(0,0,0,0.38);
  font-style:normal;
  padding:20px 0 0 0;
  float:left;
  background:rgb(200,200,200);
  line-height:30px;
}
footer div .sc{
  float:right;
  background:rgb(200,200,200);
  padding-top: 90px;
  font-size: 10px;
}
footer div .sc a{
  color:#ffffff;
  margin-left: 20px;
}
</style>
<meta charset="UTF-8">
<title>footer</title>
</head>
<body>
	<footer>
        <div class="align con">
            <address>
                <span><!-- 짐바로 로고 이미지 --></span>
                <br>
                <br>
                스포츠 시설 예약 및 용품 구매 서비스 주식회사
                <br>
                대표이사 : 2조
                <br>
                주소 : 대전광역시 서구 대덕대로 182 오라클 빌딩 3층
                <br>
                사업자 등록번호 : 123-456-78910
                <br>
                Tel : 042-123-4567
                <br>
                Fax : 070-123-4567
                <br>
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