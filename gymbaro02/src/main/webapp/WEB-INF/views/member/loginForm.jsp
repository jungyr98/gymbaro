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
<link rel="stylesheet" href="../resources/css/loginForm.css">
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<title>로그인창</title>
<script type="text/javascript">

<!-- Channel Plugin Scripts -->

  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "b544ce7c-c22c-496d-ae29-a248f3b4b73d"
  });
</script>
<!-- End Channel Plugin -->
<script>
$(document).ready(function(){
	
    $("#non-member_order").hide();{
      $('.tab a').on('click', function (e) {
      e.preventDefault();
       
      $(this).parent().removeClass('tab');
      $(this).parent().addClass('active');
      $(this).parent().siblings().removeClass('active');
       
      var href = $(this).attr('href');
      $('.forms > form').hide();
      $(href).fadeIn(300);
    });
    };
});
</script>

<script>
$(document).ready(function(){
	$(".r3").hide();{
    $('input[type="radio"]').click(function(){
    
    var val = $(this).attr("value");
    
    var target = $("." + val);
    
    $(".msg").not(target).hide();
    
    $(target).show();
    
    });
	};
    });
    
</script>


<style>
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
            <li class="tab active"><a href="#login">로그인</a></li>
            <li class="tab"><a href="#non-member_order">비회원 주문조회</a></li>
        </ul>
        
        <form action="#" id="login">
        	<input type="radio" name="rdo1" id="rdo1" value="r1" checked> 일반회원 로그인
        	<input type="radio" name="rdo1" id="rdo1" value="r2"> 시설회원 로그인
        	<input type="radio" name="rdo1" id="rdo1" value="r3"> 관리자 로그인
             <div class="r1 msg">
              <div class="input-field">
                <label for="id"></label>
                <input type="text" name="id" placeholder=" 아이디를 입력하세요." required style="width:620px;"/>
                <label for="password"></label> 
                <input type="password" name="password" placeholder=" 비밀번호를 입력하세요." required style="width:620px;"/>
                <input type="submit" value="로그인" class="button" style="width:623px;"/>
              </div>
              </div>
               <div class="r2 msg">
                <div class="input-field">
                  <label for="id"></label> 
                  <input type="text" name="id" required placeholder=" 시설회원 아이디를 입력하세요." style="width:620px;"/>
                  <label for="password"></label> 
                  <input type="password" name="password" placeholder=" 시설회원 비밀번호를 입력하세요." required style="width:620px;"/>
                  <input type="submit" value="로그인" class="button" style="width:623px;"/>
                </div>
        	</div>
        	<div class="r3 msg">
                <div class="input-field">
                  <label for="id"></label> 
                  <input type="text" name="id" required placeholder=" 관리자 아이디를 입력하세요." style="width:620px;"/>
                  <label for="password"></label> 
                  <input type="password" name="password" placeholder=" 관리자 비밀번호를 입력하세요." required style="width:620px;"/>
                  <input type="submit" value="로그인" class="button" style="width:623px;"/>
                </div>
        	</div>
          </form>
          
          <form action="#" id="non-member_order">
              <div class="input-field">
                <label for="name"></label> 
                <input type="text" name="ordername" placeholder=" 주문자 이름을 입력하세요." required style="width:620px;"/>
                <label for="orderno"></label> 
                <input type="text" name="orderno" placeholder=" 주문 번호를 입력하세요." required style="width:620px;"/>
                <input type="submit" value="조회" class="button" style="width:623px;"/>
              </div>
          </form>
     </div>
    <div class="atag" style="color:#424040">
    <a href="${contextPath}/join/join01.do">회원가입</a>
    |
    <a href="${contextPath}/member/idpwdFindForm.do">아이디찾기 / 비밀번호 찾기</a>
  </div>

  <div class="ic_btn" >
    <button type="button" id="naver-login-btn" class="btn_naver" style="padding:0;">
        <img src="${contextPath}/resources/image/naver.png" alt="네이버 로고">
    </button>
   
    <button type="button" id="kakao-login-btn" class="btn_kakao" style="padding:0;">
        <img alt="카카오 로고" src="${contextPath}/resources/image/kakao_login_large_narrow.png">
    </button>
    </div>
    </div>
    </div>
</body>
</html>