<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />
<%
   request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/loginForm.css">
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<title>로그인창</title>
<script>
$(function () {
    var tab_Btn = $(".tab_btn > ul > li");
    var tab_Cont = $(".tab_cont > form");
    tab_Cont.hide().eq(0).show();
    tab_Btn.click(function (e) {
         e.preventDefault();
         var target = $(this);
         var index = target.index();
         tab_Btn.removeClass("active");
         target.addClass("active");
         tab_Cont.hide();
         tab_Cont.eq(index).show();
    });
});
</script>
</head>
<body>
<body>

    <div class="loginForm_box main_container">
        <div class="first_content">
         <div class="first_text">
            <span><b>로그인</b></span>
         </div>
    <div class="login_box tab_menu">
          <div class="tab_btn">
               <ul>
                    <li class="active"><a href="#">일반 로그인</a></li>
                    <li><a href="#">시설 로그인</a></li>
                    <li><a href="#">비회원 주문조회</a></li>
               </ul>    
          </div>
          <div class="tab_cont">
               <form class="active" action="#" method="post">
					<input type="text" name="id" placeholder="아이디를 입력하세요" />
					<input type="password" name="pwd" placeholder="비밀번호를 입력하세요" />
					<input type="submit" value="로그인">
               </form>
               <form>
					<input type="text" name="id" placeholder="시설 회원 아이디를 입력하세요" />
					<input type="password" name="pwd" placeholder="시설 회원 비밀번호를 입력하세요" />
					<input type="submit" value="로그인">
               </form>
                <form>
					<input type="text" name="id" placeholder="주문자 이름을 입력하세요" />
					<input type="password" name="pwd" placeholder="주문 번호를 입력하세요" />
					<input type="submit" value="로그인">
               </form>
          </div>
     </div>
    <div class="atag">
    <a href="${contextPath}/member/join01.do">회원가입</a>
    |
    <a href="${contextPath}/member/idpwdFindForm.do">아이디찾기 / 비밀번호 찾기</a>
  </div>

  <div class="ic_btn" >
    <button type="button" id="naver-login-btn" class="btn_naver">
        <img src="${contextPath}/resources/image/naver.png" alt="네이버 로고">
    </button>
   
    <button type="button" id="kakao-login-btn" class="btn_kakao">
        <img alt="카카오 로고" src="${contextPath}/resources/image/kakao_login_large_narrow.png">
    </button>
    </div>
    </div>
    </div>
</body>
</html>