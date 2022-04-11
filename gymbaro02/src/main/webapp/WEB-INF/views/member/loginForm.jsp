<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="result" value="${param.result }" />
<%
   request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/loginForm.css">
<title>로그인창</title>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript">



$(document).ready(function(){
    $("#non-member_order").hide();{
      $('.tab a').on('click', function (e) {
      e.preventDefault();
       
      $(this).parent().removeClass('tab');
      $(this).parent().addClass('active');
      $(this).parent().siblings().removeClass('active');
       
      var href = $(this).attr('href');
      $('.forms > form').hide();
      $(href).fadeIn(500);
    });
    };

});
</script>
<style type="text/css">
body {
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
</head>
<body>
<body>

    <div class="loginForm_box main_container">
        <div class="first_content">
         <div class="first_text">
            <span><b>로그인</b></span>
         </div>
    <div class="forms">
        <ul class="tab-group">
            <li class="tab active"><a href="#login">회원 로그인</a></li>
            <li class="tab"><a href="#non-member_order">비회원 주문조회</a></li>
        </ul>
        <form action="#" id="login">
              <div class="input-field">
                <label for="id"></label>
                <input type="id" name="id" required="id" placeholder="아이디를 입력하세요."/>
                <label for="password"></label> 
                <input type="password" name="password" placeholder="비밀번호를 입력하세요." required/>
                <input type="submit" value="로그인" class="button"/>
              </div>
          </form>
          <form action="#" id="non-member_order">
              <div class="input-field">
                <label for="name"></label> 
                <input type="name" name="ordername" required="ordername" placeholder="주문자 이름을 입력하세요."/>
                <label for="orderno"></label> 
                <input type="orderno" name="orderno" placeholder="주문 번호를 입력하세요." required/>
                <input type="submit" value="조회" class="button" />
              </div>
          </form>
    </div>
    <div class="atag" style="color:#424040">
    <a href="${contextPath}/join/join01.do">회원가입</a>
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