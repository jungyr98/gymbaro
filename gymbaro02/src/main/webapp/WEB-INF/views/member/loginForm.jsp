<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
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
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/loginForm.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<title>로그인창</title>
<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  result();
}

function result(){
	alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
}
</script>
</c:if>
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

function admin_id_check(){
	var admin_id = $('#admin_id').val();
	if(admin_id != 'admin'){
		alert("아이디가 틀렸습니다!");
		return false;
	}
	return true;
}
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
                    <li><a href="#">관리자로 로그인</a></li>
                    <li><a href="#">비회원 주문조회</a></li>
               </ul>    
          </div>
          <div class="tab_cont">
               <form class="active" action="${contextPath}/member/login.do" method="post">
					<input type="text" name="id" placeholder="아이디를 입력하세요" />
					<input type="password" name="pwd" placeholder="비밀번호를 입력하세요" />
					<input type="submit" value="로그인">
               </form>
               <form action="${contextPath}/admin/member/login.do" method="post" onsubmit="return admin_id_check();">
					<input type="text" name="id" id="admin_id" placeholder="관리자 아이디를 입력하세요" />
					<input type="password" name="pwd" placeholder="관리자 비밀번호를 입력하세요" />
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
    <a href="${contextPath}/member/joinTypeForm.do">회원가입</a>
    |
    <a href="${contextPath}/member/idpwdFindForm.do">아이디찾기 / 비밀번호 찾기</a>
  </div>

  <div class="ic_btn" >
   <!--  네이버아이디로로그인 버튼 노출 영역 
  <div id="naver_id_login"></div>
  //네이버아이디로로그인 버튼 노출 영역
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("a8bNpyJD5yF9SyCjSURA", "http://localhost:8080/gymbaro02/member/callback.do");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,52);
  	naver_id_login.setDomain("http://localhost:8080/gymbaro02/main/main.do");
  	naver_id_login.setState(state);
  	
  	naver_id_login.init_naver_id_login();
  </script> -->
    <!-- 카카오 로그인 -->
     <%
    String clientId = "a8bNpyJD5yF9SyCjSURA";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/gymbaro02/member/callback.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
  
		<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?
		client_id=b45cad6c7b351ab3b0f2ff42b3d5e362&redirect_uri=http://
		localhost:8080/gymbaro02/member/kakaoLogin&response_type=code">
		<img src="${contextPath }/resources/image/
		kakao_login_large_narrow.png" style="height:52px">
 		<!-- 이미지는 카카오 개발자센터에서 제공하는 login 이미지를 사용했습니다. -->
		</a>
    </div>
    </div>
    </div>
</body>
</html>