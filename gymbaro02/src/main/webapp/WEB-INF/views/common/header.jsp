<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>헤더</title>
<link href="${contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" media="screen">
<style type="text/css">
.search_icon {
	width:15px;
	height:15px;
}
</style>
</head>
<body>
	<div class="wrap main_wrap show">
	  <!-- Header -->
	  <header>
	    <div id="head_link" class="con">
	      <ul class = "row">
	      	<c:choose>
	      		<c:when test="${isLogOn == true  && member!= null}">
	      			<li class = cell-r><a href="${contextPath}/mypage/Mypage1.do">마이페이지</a></li>
	      			<li class = cell-r><a href="#">장바구니</a></li>
	        		<li class = cell-r><a href="${contextPath}/member/logout.do">로그아웃</a></li>
	      		</c:when>
	      		<c:otherwise>
	      			<li class = cell-r><a href="${contextPath}/member/agreeForm.do">회원가입</a></li>
	        		<li class = cell-r><a href="${contextPath}/member/loginForm.do">로그인</a></li>
	      		</c:otherwise>
	      	</c:choose>
	      	
	      </ul>
	    </div>
	    <section id="user_header" style="background-color:white">
	      <div class="menu con">
	        <div id = "logo"><a href="${contextPath}/main.do"><img src="${contextPath}/resources/image/logo.png" alt="짐바로 로고"></a></div>
	        <div class="menu-bar row">

           		<!--  
				<div id="search" class="cell">
				 <form name="frmSearch" action="" >
				   <input type="submit" name="search" class="btn1"  value="검 색" >
				   <input name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()" placeholder="지역, 숙소명" >
				  </form>
				</div>
				<div id="suggest" class="cell">
				      <div id="suggestList"></div>
				 </div>
				 -->
	          <ul class="gnb-list row cell">
	            <li class="cell">
	              <div>공지사항</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/searchGoods.do">공지사항/이벤트</a></li>
	                </ul>
	              </div>  
	             </li>
			    <li class="cell">
	              <div>시설 찾기</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/searchGoods.do">전체 시설</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">헬스</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">필라테스</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">복싱</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">수영</a></li>
	                </ul>
	              </div>  
	             </li>
	            <li class="cell">
	              <a href="#">운동 용품</a>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/searchGoods.do">전체 용품</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">헬스 용품</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">필라테스 용품</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">복싱 용품</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">수영 용품</a></li>
	                </ul>
	              </div>
	            </li>
	            <li class="cell mySideSearch">
	              <div>내 주변 시설 찾기</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/CC/User_CCForm.do">공지사항</a></li>
	                  <li><a href="${contextPath}/CC/Question1Form.do">자주 묻는 질문</a></li>
	                  <li><a href="${contextPath}/CC/Question2Form.do">1:1 문의</a></li>
	                </ul>
	              </div>
	            </li>	    
	            <li class="cell">
	              <div>고객센터</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/CC/User_CCForm.do">공지사항</a></li>
	                  <li><a href="${contextPath}/CC/Question1Form.do">자주 묻는 질문</a></li>
	                  <li><a href="${contextPath}/CC/Question2Form.do">1:1 문의</a></li>
	                </ul>
	              </div>
	            </li>	    
	          </ul>
	        </div>
	      </div>
	    </section>
	  </header>
	</div>
</body>
</html>