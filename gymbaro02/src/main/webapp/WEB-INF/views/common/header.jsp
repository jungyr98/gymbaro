<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  	<!-- css 파일 링크 -->
  	<link href="${contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" media="screen">
  	
  	<!-- 폰트 링크 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script type="text/javascript">
document.addEventListener("touchstart", function () {}, true);


$(function () {
    $("#center_gnb > ul > li").hover(
        function () {
            $("#center_gnb").addClass("active");
        },
        function () {
            $("#center_gnb").removeClass("active");
        }
    );
    $("#center_gnb > ul > li:first-child > a").focusin(function () {
        $("#center_gnb").addClass("active");
    });
    $("#center_gnb li:last-child li:last-child a").focusout(function () {
        $("#center_gnb").removeClass("active");
    });
    $("#center_gnb > ul > li > a").focusin(function () {
        $(this).parent().addClass("active");
    });
    $("#center_gnb li li:last-child a").focusout(function () {
        $("#center_gnb > ul > li").removeClass("active");
    });
});


$(function () {
    var n = 0;
    var pos = 0;
    setInterval(function () {
        n = n + 1;
        pos = -1 * 23 * n;
        $(".header_box .slider ul").animate({ "top": pos }, 300, function () {
            if (n == 4) {
                n = 0;
                pos = 0;
                $(".header_box .slider ul").css({ "top": pos });
            }
        });
    }, 3000);
});
</script>
</head>
<body>
<div class="header_box">
<!--    Made by Erik Terwan    -->
<!--   24th of November 2015   -->
<!--        MIT License        -->
<nav role="navigation">
  <div id="menuToggle">
    <!--
    A fake / hidden checkbox is used as click reciever,
    so you can use the :checked selector on it.
    -->
    <input type="checkbox" />

    <!--
    Some spans to act as a hamburger.
    
    They are acting like a real hamburger,
    not that McDonalds stuff.
    -->
    <span></span>
    <span></span>
    <span></span>

    <!--
    Too bad the menu has to be inside of the button
    but hey, it's pure CSS magic.
    -->
    <ul id="menu">
      <a href="#">
        <li>Home</li>
      </a>
      <a href="#">
        <li>About</li>
      </a>
      <a href="#">
        <li>Info</li>
      </a>
      <a href="#">
        <li>Contact</li>
      </a>
      <a href="https://erikterwan.com/" target="_blank">
        <li>Show me more</li>
      </a>
    </ul>
  </div>
 <div class="icon_and_gnb_box"> 
  <div id="logo">
  	<a href="${contextPath}/main/main.do">
  		<img src="${contextPath}/resources/image/logo.png" alt="짐바로 로고">
  	</a>
  </div>
   <div>
        <div class="center_menu">
            <nav id="center_gnb">
                <ul>
                    <li>
                        <a href="${contextPath}/cs/notice.do">공지사항</a>
                        <ul>
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">이벤트</a></li>

                        </ul>
                    </li>
                    <li>
                        <a href="${contextPath}/gym/searchGyms.do" style="color:#184798;">시설 찾기</a>
                        <ul>
                            <li><a href="#">전체</a></li>
                            <li><a href="#">헬스</a></li>
                            <li><a href="#">필라테스</a></li>
                            <li><a href="#">복싱</a></li>
                            <li><a href="#">수영</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="${contextPath}/goods/searchGoods.do">운동 용품</a>
                        <ul>
                            <li><a href="#">전체</a></li>
                            <li><a href="#">헬스 용품</a></li>
                            <li><a href="#">필라테스 용품</a></li>
                            <li><a href="#">복싱 용품</a></li>
                            <li><a href="#">수영 용품</a></li>
                        </ul>
                    </li><li>
                        <a href="${contextPath}/trainer/findTrainer.do">트레이너</a>
                    </li>
                    <li>
                        <a href="${contextPath}/community/community.do">커뮤니티</a>
                        <ul>
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">중고 거래</a></li>
                            <li><a href="#">회원 양도</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div> 
    <div>
    	<ul class="member_header_box">
	      	<c:choose>
	      		<c:when test="${isLogOn == true  && memberInfo != null}">
	      			<li class =cell-r><a href="${contextPath}/cart/goodsCart.do"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
	      			<li class = cell-r><a href="${contextPath}/cs/csQnA.do">고객센터</a></li>
	      			<li class = cell-r><a href="${contextPath}/member/logout.do">로그아웃</a></li>
	        		<li class = cell-r><a href="${contextPath}/mypage/mypage.do" style="color:#184798;"><span class="glyphicon glyphicon-user"></span>&nbsp;${memberInfo.member_name}님!</a></li>
	      		</c:when>
	      		<c:otherwise>
	      			<li class = cell-r><a href="${contextPath}/cart/goodsCart.do"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
	      			<li class = cell-r><a href="${contextPath}/cs/csQnA.do">고객센터</a></li>
	      			<li class = cell-r><a href="${contextPath}/member/joinTypeForm.do">회원가입</a></li>
	        		<li class = cell-r><a href="${contextPath}/member/loginForm.do">로그인</a></li>
	      		</c:otherwise>
	      	</c:choose>
	      	
	      </ul>
    </div>
   </div>
  <div class="search_and_lanking_box">
  		<div class="slider">
            <ul class="header_lanking_slider_ul">
                <li class="active">
                    <a href="#">
                       1. 홈트레이닝
                    </a>
                </li>
                <li>
                    <a href="#">
                       2. 바벨
                    </a>
                </li>
                <li>
                    <a href="#">
                       3. 헬스장
                    </a>
                </li>
                <li class="active">
                    <a href="#">
                      4. 대전
                    </a>
                </li>
            </ul>
        </div>
  	<form class="search-container" action="//llamaswill.tumblr.com/search">
  		<input id="search-box" type="text" class="search-box" name="q" />
  		<label for="search-box"><span class="glyphicon glyphicon-search search-icon"></span></label>
  		<input type="submit" id="search-submit" />
	</form>
  </div>
</nav>
</div>
</body>
</html>