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


$(function () {
	  var shrinkHeader = 300;
	  $(window).scroll(function () {
	    var scroll = getCurrentScroll();
	    if (scroll >= shrinkHeader) {
	      $(".header").addClass("shrink");
	      $(".sub-menu-box").addClass("shrink_sub_box");
	    } else {
	      $(".header").removeClass("shrink");
	      $(".sub-menu-box").removeClass("shrink_sub_box");
	    }
	  });
	  function getCurrentScroll() {
	    return window.pageYOffset || document.documentElement.scrollTop;
	  }
	});
</script>
</head>
<body>
 <div class="header">
 <div class="main_menu_box">
  <div id="logo">
  	<a href="${contextPath}/main/main.do">
  		<img src="${contextPath}/resources/image/logo.png" alt="짐바로 로고">
  	</a>
  </div>
     <nav id="center_gnb">
                <ul class="center-gnb-list">
                    <li>
                        <a href="${contextPath}/cs/notice.do">공지사항</a>
                    </li>
                    <li>
                        <a href="${contextPath}/gym/searchGyms.do" style="color:#184798;">시설 찾기</a>
                    </li>
                    <li>
                        <a href="${contextPath}/goods/searchGoods.do">운동 용품</a>
                    </li>
                    <li>
                        <a href="${contextPath}/community/community.do">커뮤니티</a>
                    </li>
                    <li>
                        <a href="${contextPath}/trainer/findTrainer.do">트레이너</a>
                    </li>
                </ul>
                <div class="sub-menu-box">
	                <ul>
	                  <li><a href="#">공지사항</a></li>
                      <li><a href="#">이벤트</a></li>
	                </ul>
	                <ul>
                      <li><a href="#">전체</a></li>
                      <li><a href="#">헬스</a></li>
                      <li><a href="#">필라테스</a></li>
                      <li><a href="#">복싱</a></li>
                      <li><a href="#">수영</a></li>
                    </ul>
                    <ul>
                      <li><a href="#">전체</a></li>
                      <li><a href="#">헬스 용품</a></li>
                      <li><a href="#">필라테스 용품</a></li>
                      <li><a href="#">복싱 용품</a></li>
                      <li><a href="#">수영 용품</a></li>
                   </ul>
                   <ul>
                      <li><a href="#">자유게시판</a></li>
                      <li><a href="#">중고 거래</a></li>
                      <li><a href="#">회원 양도</a></li>
                   </ul>
	           </div>  
            </nav>
  	</div>
  	<div id="user_menu_box">
  		<div class="search_and_lanking_box">
  			<form class="search-container" action="//llamaswill.tumblr.com/search">
  				<button id="search-btn" type="submit" name="q" >
  					<span class="glyphicon glyphicon-search search-icon"></span>
  				</button>
  				<input id="search-box" type="text" name="q" />
			</form>
  		</div>
	      	<c:choose>
	      		<c:when test="${isLogOn == true  && memberInfo != null}">
	        		<ul class="gnb-list">
	           			<li class="cell-r">
	           				<a href="${contextPath}/mypage/mypage.do">
	           					<img width="24" src="${contextPath }/resources/image/account.png" alt="account.png" />
	           					<span>${memberInfo.member_name}님!</span>
	           				</a>
	           			</li>
	           			<li class="cell-r">
	           				<a href="${contextPath}/cart/myCartList.do">
	           					<img width="24" src="${contextPath }/resources/image/shopping-cart.png" alt="shopping-cart.png" />
	           					<span>장바구니</span>
	           				</a>
	           			</li>
	           			<c:if test="${memberInfo.member_type eq '일반' or memberInfo.member_type eq 'SNS'}">
	           			<li class="cell-r">
	           				<a href="${contextPath}/liked/listMyLiked.do">
	           					<img width="24" src="${contextPath }/resources/image/heart.png" alt="heart.png" />
	           					<span>찜</span>
	           				</a>
	           			</li>
	           			</c:if>
	           			<c:if test="${memberInfo.member_type eq '시설'}">
	           			<li class="cell-r">
	           				<a href="${contextPath}/mypage/myGymInfo.do">
	           					<img width="24" src="${contextPath }/resources/image/gym_header.png" alt="gym_header.png" />
	           					<span>내 시설</span>
	           				</a>
	           			</li>
	           			</c:if>
	           			<c:if test="${memberInfo.member_type eq '관리자'}">
	           			<li class="cell-r">
	           				<a href="${contextPath}/admin/main/main.do">
	           					<img width="24" src="${contextPath }/resources/image/admin_header.png" alt="admin_header.png" />
	           					<span>관리자 모드</span>
	           				</a>
	           			</li>
	           			</c:if>
	           			<li class="cell-r">
	           				<a href="${contextPath}/member/logout.do">
	           					<img width="24" src="${contextPath }/resources/image/logout.png" alt="logout.png" />
	           					<span>로그아웃</span>
	           				</a>
	           			</li>
 					</ul>
	      		</c:when>
	      		<c:otherwise>
	      			<ul class="gnb-list">
	      				<li class = cell-r>
	      					<a href="${contextPath}/member/loginForm.do">
	           					<img width="24" src="${contextPath}/resources/image/enter.png" alt="enter.png" />
	           					<span>로그인</span>
	           				</a></li>
	      				<li class = cell-r>
	      					<a href="${contextPath}/member/joinTypeForm.do">
	      						<img width="24" src="${contextPath}/resources/image/add-user.png" alt="add-user.png" />
	           					<span>회원가입</span>
	      					</a>
	      				</li>
	       		 		<li class = cell-r>
	       		 			<a href="${contextPath}/cart/myCartList.do">
	           					<img width="24" src="${contextPath }/resources/image/shopping-cart.png" alt="shopping-cart.png" />
	           					<span>장바구니</span>
	           				</a>
	       		 		</li>
	       		 		<li class = cell-r>
	       		 			<a href="${contextPath}/cs/csQnA.do">
	           					<img width="24" src="${contextPath }/resources/image/help-desk.png" alt="help-desk.png" />
	           					<span>고객센터</span>
	           				</a>
	       		 		</li>
	      			</ul>
	      		</c:otherwise>
	      	</c:choose>
	   </div>   	
    </div> 
</body>
</html>