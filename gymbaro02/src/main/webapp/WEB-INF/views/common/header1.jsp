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
  	<!-- css 파일 링크 -->
  	<link href="${contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" media="screen">
  	
  	<!-- 폰트 링크 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
<title>헤더</title>
<style type="text/css">
.trainer_icon {
	width:25px;
	hegiht:25px;
	margin-left:5px;
}

.trainer_a_box {
	display:flex;
}

.search_icon {
    position: relative;
    top: 2px;
    left: 180px;
	width:15px;
	height:15px;
}

.search_li_box {
	margin:0;
}

.header_show .con {
    max-width: 1390px;
    margin: 0 auto;
}

#head_link ul li{
  padding-left: 20px;
  padding-right: 20px;
  border-right: 1px solid #ddd;
  color: #777;
  font-size: 14px;
  font-weight: 500;
}

.header_wrap ul {list-style: none; margin: 0; padding: 0;}

.header_wrap .slider {position: relative; width: 180px; height: 23px; overflow: hidden;}
.header_wrap .slider ul {position: absolute; left: 0; top: 0; width: 100px; height: 92px; text-align: initial;}
.header_wrap .slider li {width: 100px; height: 23px; margin-left:20px;}
.header_wrap .slider li a {font-size:14px; color: #777; font-weight:400;}
.header_wrap .slider li img {max-width: 100%;}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function () {
    var n = 0;
    var pos = 0;
    setInterval(function () {
        n = n + 1;
        pos = -1 * 23 * n;
        $(".header_wrap .slider ul").animate({ "top": pos }, 300, function () {
            if (n == 4) {
                n = 0;
                pos = 0;
                $(".header_wrap .slider ul").css({ "top": pos });
            }
        });
    }, 3000);
});
</script>
</head>
<body>
	<div class="header_wrap main_wrap header_show">
	  <!-- Header -->
	  <header>
	    <div id="head_link" class="con">
	      <ul class="row"></ul>
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
	              <a href="${contextPath}/cs/notice.do">공지사항</a>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/cs/notice.do">공지사항</a></li>
	                  <li><a href="${contextPath}/cs/event.do">이벤트</a></li>
	                </ul>
	              </div>  
	             </li>
			    <li class="cell" style='color:#184798'>
	              <a href="${contextPath}/gym/searchGyms.do">시설 찾기</a>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/gym/searchGyms.do">전체 시설</a></li>
	                  <li><a href="${contextPath}/gym/searchGyms.do?menu_type=health">헬스</a></li>
	                  <li><a href="${contextPath}/gym/searchGyms.do?menu_type=pilates">필라테스</a></li>
	                  <li><a href="${contextPath}/gym/searchGyms.do?menu_type=boxing">복싱</a></li>
	                  <li><a href="${contextPath}/gym/searchGyms.do?menu_type=swim">수영</a></li>
	                </ul>
	              </div>  
	             </li>
	            <li class="cell">
	              <a href="${contextPath}/goods/searchGoods.do">운동 용품</a>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/goods/searchGoods.do">전체 용품</a></li>
	                  <li><a href="${contextPath}/goods/searchGoods.do?menu_type=health">헬스 용품</a></li>
	                  <li><a href="${contextPath}/goods/searchGoods.do?menu_type=pilates">필라테스 용품</a></li>
	                  <li><a href="${contextPath}/goods/searchGoods.do?menu_type=boxing">복싱 용품</a></li>
	                  <li><a href="${contextPath}/goods/searchGoods.do?menu_type=swim">수영 용품</a></li>
	                </ul>
	              </div>
	            </li>
	            <li class="cell">
	               <a href="${contextPath}/trainer/findTrainer.do" class="trainer_a_box">트레이너 <img alt="whistle.png" class="trainer_icon" src="${contextPath}/resources/image/whistle.png"></a>
	            </li>   
	            <li class="cell">
	               <a href="${contextPath}/community/community.do">커뮤니티</a>
	              <div class="sub-menu-box">
	                <ul>
	                  <li><a href="${contextPath}/CC/User_CCForm.do">자유게시판</a></li>
	                  <li><a href="${contextPath}/CC/Question1Form.do">중고 거래</a></li>
	                  <li><a href="${contextPath}/CC/Question1Form.do">양도 서비스</a></li>
	                </ul>
	              </div>
	            </li>
	            <li class="cell search_li_box">
		            <form name="frmSearch" id="frmSearch" action="" >
		             <img alt="search.png" class="search_icon" src="../resources/image/search.png">
					  <!--  <input type="submit" name="search" class="btn1"  value="검 색" > -->
		              <input name="searchWord" id="toggleBtnOn" class="main_input" type="text"  onKeyUp="keywordSearch()" placeholder="시설, 용품명" >
		            </form>
	 <div class="container">
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
    </div>
		         		<div id="suggest" class="cell">
		                <div id="suggestList"></div>
		          </div>
		          </li>
		          <li class="cell">
		           <div id="head_link" class="con">
	      <ul class = "row">
	      	<c:choose>
	      		<c:when test="${isLogOn == true  && member!= null}">
	      			<li class =cell-r><a href="${contextPath}/mypage/mypage.do">정유라님</a></li>
	      			<li class = cell-r><a href="#">장바구니</a></li>
	        		<li class = cell-r><a href="${contextPath}/member/logout.do">고객센터</a></li>
	      		</c:when>
	      		<c:otherwise>
	      			<li class = cell-r><a href="${contextPath}/cs/csQnA.do">고객센터</a></li>
	      			<li class = cell-r><a href="${contextPath}/join/join01.do">회원가입</a></li>
	        		<li class = cell-r><a href="${contextPath}/member/loginForm.do">로그인</a></li>
	      		</c:otherwise>
	      	</c:choose>
	      	
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