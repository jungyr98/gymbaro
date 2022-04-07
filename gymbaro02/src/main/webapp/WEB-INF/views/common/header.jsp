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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
body {
		font-family: 'Noto Sans KR', sans-serif;
	}
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
	      			<li class = cell-r><a href="${contextPath}/member/agreeForm.do">고객센터</a></li>
	      			<li class = cell-r><a href="${contextPath}/join/join01.do">회원가입</a></li>
	        		<li class = cell-r><a href="${contextPath}/member/loginForm.do">로그인</a></li>
	      		</c:otherwise>
	      	</c:choose>
	      	
	      </ul>
	    </div>
	    <section id="user_header" style="background-color:white">
	      <div class="menu con">
	        <div id="logo"><a href="${contextPath}/main/main.do"><img src="${contextPath}/resources/image/logo.png" alt="짐바로 로고"></a></div>
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
	                  <li><a href="${contextPath}/searchGoods.do">공지사항</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">이벤트</a></li>
	                </ul>
	              </div>  
	             </li>
			    <li class="cell">
	              <a href="${contextPath}/gym/searchGyms.do">시설 찾기</a>
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
	              <a href="${contextPath}/goods/searchGoods.do">운동 용품</a>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/goods/searchGoods.do">전체 용품</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">헬스 용품</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">필라테스 용품</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">복싱 용품</a></li>
	                  <li><a href="${contextPath}/searchGoods.do">수영 용품</a></li>
	                </ul>
	              </div>
	            </li>
	            <li class="cell" style='color:#184798'>
	              <div>내 주변 시설 찾기</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/CC/User_CCForm.do">내 주변 시설 찾기</a></li>
	                </ul>
	              </div>
	            </li>	    
	            <li class="cell">
	              <div>커뮤니티</div>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/CC/User_CCForm.do">자유게시판</a></li>
	                  <li><a href="${contextPath}/CC/Question1Form.do">중고 거래</a></li>
	                  <li><a href="${contextPath}/CC/Question1Form.do">양도 서비스</a></li>
	                </ul>
	              </div>
	            </li>
	            <li class="cell">
	            	<div id="search" class="cell">
	              <div class="sub-menu-box">
		            <form name="frmSearch" action="" >
		              <input type="checkbox" id="toggleBtn">
		              <label for="toggleBtn" class="toggleBtn">
		             <img alt="search.png" class="search_icon" src="../resources/image/search.png">
		              &nbsp;&nbsp; &nbsp;</label>
					  <!--  <input type="submit" name="search" class="btn1"  value="검 색" > -->
		              <input name="searchWord" id="toggleBtnOn" class="main_input" width="200" type="text"  onKeyUp="keywordSearch()" placeholder="시설, 용품명" >
		            </form>
	             </div>
		         		<div id="suggest" class="cell">
		                <div id="suggestList"></div>
		          </div>
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