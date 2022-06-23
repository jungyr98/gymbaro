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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>로그인창</title>
<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  result();
}

function result(){
	alert('${message}'); 
}
</script>
</c:if>
<script>


function loginCheck() {
	var id = $('input[name="id"]').val();
	var pwd = $('input[name="pwd"]').val();
	if(id == '' || pwd == ''){
		alert("아이디와 비밀번호를 입력하세요!");
		return false;
	}else{
	return true;
	}
}

function orderCheck() {
	var name = $('input[name="orderer_name"]').val();
	var order_id = $('input[name="order_id"]').val();
	if(name == '' || order_id == ''){
		alert("주문자명과 주문번호를 입력하세요!");
		return false;
	}else{
	return true;
	}
}

</script>
</head>
<body>
<body>

    <div class="loginForm_box main_container">
        <div class="first_content">
         <div class="first_text">
         </div>
          <div class="login_wrap">
                <ul class="menu_wrap" role="tablist">
                	<c:if test="${mode eq 'common'}">
                    <li class="menu_item" role="presentation">
                        <!--[주] 탭메뉴 활성화시(=선택시) "on"을 추가해주세요. 접근성: aria-selected는 탭 선택시 true, 미선택시 false로 적용-->
                        <!--[주:접근성] 탭메뉴의 id 값과 탭내용의 aria-controls를 연결하고 있습니다. -->
                        <a href="${contextPath}/member/loginForm.do?mode=common" id="loinid" class="menu_id on" role="tab" aria-selected="true">
                            <span class="menu_text"><span class="text">ID 로그인</span></span>
                        </a>
                    </li>
                    <li class="menu_item" role="presentation">
                        <a href="${contextPath}/member/loginForm.do?mode=admin" id="admin" class="menu_ones" role="tab" aria-selected="false">
                            <span class="menu_text"><span class="text">관리자</span></span>
                        </a>
                    </li>
                    <li class="menu_item" role="presentation">
                        <a href="${contextPath}/member/loginForm.do?mode=non-member" id="non-member" class="menu_qr" role="tab" aria-selected="false">
                            <span class="menu_text"><span class="text">비회원</span></span>
                        </a>
                    </li>
                    </c:if>
                    <c:if test="${mode eq 'admin'}">
                    <li class="menu_item" role="presentation">
                        <a href="${contextPath}/member/loginForm.do?mode=common" id="loinid" class="menu_id" role="tab" aria-selected="false">
                            <span class="menu_text"><span class="text">ID 로그인</span></span>
                        </a>
                    </li>
                    <li class="menu_item" role="presentation">
                        <a href="${contextPath}/member/loginForm.do?mode=admin" id="admin" class="menu_ones on" role="tab" aria-selected="true">
                            <span class="menu_text"><span class="text">관리자</span></span>
                        </a>
                    </li>
                    <li class="menu_item" role="presentation">
                        <a href="${contextPath}/member/loginForm.do?mode=non-member" id="non-member" class="menu_qr" role="tab" aria-selected="false">
                            <span class="menu_text"><span class="text">비회원</span></span>
                        </a>
                    </li>
                    </c:if>
                    <c:if test="${mode eq 'non-member'}">
                    <li class="menu_item" role="presentation">
                        <a href="${contextPath}/member/loginForm.do?mode=common" id="loinid" class="menu_id" role="tab" aria-selected="false">
                            <span class="menu_text"><span class="text">ID 로그인</span></span>
                        </a>
                    </li>
                    <li class="menu_item" role="presentation">
                        <a href="${contextPath}/member/loginForm.do?mode=admin" id="admin" class="menu_ones" role="tab" aria-selected="false">
                            <span class="menu_text"><span class="text">관리자</span></span>
                        </a>
                    </li>
                    <li class="menu_item" role="presentation">
                        <a href="${contextPath}/member/loginForm.do?mode=non-member" id="non-member" class="menu_qr on" role="tab" aria-selected="true">
                            <span class="menu_text"><span class="text">비회원</span></span>
                        </a>
                    </li>
                    </c:if>
                </ul>
                <c:if test="${mode eq 'common'}">
                <form id="frmNIDLogin" name="frmNIDLogin" onsubmit="return loginCheck();" action="${contextPath}/member/login.do" method="POST">
					<ul class="panel_wrap">
                        <li class="panel_item" style="display: block;">
                            <div class="panel_inner" role="tabpanel" aria-controls="loinid">
                                <div class="id_pw_wrap">
                                    <div class="input_row" id="id_line">
                                        <div class="icon_cell" id="id_cell">
                                            <span class="icon_id">
                                                <span class="blind">아이디</span>
                                            </span>
                                        </div>
                                        <input type="text" id="id" name="id" placeholder="아이디" title="아이디" class="input_text" maxlength="41" value="">
                                        <span role="button" class="btn_delete" id="id_clear" style="display: none;">
                                            <span class="icon_delete">
												<span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                    <div class="input_row" id="pw_line">
                                        <div class="icon_cell" id="pw_cell">
                                            <span class="icon_pw">
                                                <span class="blind">비밀번호</span>
                                            </span>
                                        </div>
                                        <input type="password" id="pw" name="pwd" placeholder="비밀번호" title="비밀번호" class="input_text" maxlength="16">
                                        <span role="button" class="btn_delete" id="pw_clear" style="display: none;">
                                            <span class="icon_delete">
                                                <span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                </div>
                                <div class="btn_login_wrap">

                                    <button type="submit" class="btn_login" id="log.login">
                                        <span class="btn_text">로그인</span>
                                    </button>

                                </div>
                            </div>
                        </li>
                    </ul>
                </form>
                </c:if>
                <c:if test="${mode eq 'admin'}">
                <form id="frmNIDLogin" name="frmNIDLogin" onsubmit="return loginCheck();" action="${contextPath}/admin/member/login.do" method="POST">
					<ul class="panel_wrap">
                        <li class="panel_item" style="display: block;">
                            <div class="panel_inner" role="tabpanel" aria-controls="admin">
                                <div class="id_pw_wrap">
                                    <div class="input_row" id="id_line">
                                        <div class="icon_cell" id="id_cell">
                                            <span class="icon_id">
                                                <span class="blind">아이디</span>
                                            </span>
                                        </div>
                                        <input type="text" id="id" name="id" placeholder="아이디" title="아이디" class="input_text" maxlength="41" value="" onclick="borderOn('#id','#id_line')">
                                        <span role="button" class="btn_delete" id="id_clear" style="display: none;">
                                            <span class="icon_delete">
												<span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                    <div class="input_row" id="pw_line">
                                        <div class="icon_cell" id="pw_cell">
                                            <span class="icon_pw">
                                                <span class="blind">비밀번호</span>
                                            </span>
                                        </div>
                                        <input type="password" id="pw" name="pwd" placeholder="비밀번호" title="비밀번호" class="input_text" maxlength="16">
                                        <span role="button" class="btn_delete" id="pw_clear" style="display: none;">
                                            <span class="icon_delete">
                                                <span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                </div>
                                <div class="btn_login_wrap">

                                    <button type="submit" class="btn_login" id="log.login">
                                        <span class="btn_text">로그인</span>
                                    </button>

                                </div>
                            </div>
                        </li>
                    </ul>
                </form>
                </c:if>
                <c:if test="${mode eq 'non-member'}">
                <form id="frmNIDLogin" name="frmNIDLogin"  onsubmit="return orderCheck();" action="${contextPath}/member/nonMemberOrderDetail.do" method="POST">
					<ul class="panel_wrap">
                        <li class="panel_item" style="display: block;">
                            <div class="panel_inner" role="tabpanel" aria-controls="non-member">
                                <div class="id_pw_wrap">
                                    <div class="input_row" id="id_line">
                                        <div class="icon_cell" id="id_cell">
                                            <span class="icon_id">
                                                <span class="blind">주문자명</span>
                                            </span>
                                        </div>
                                        <input type="text" id="id" name="orderer_name" placeholder="주문자명" title="주문자명" class="input_text" maxlength="41" value="" onclick="borderOn('#id','#id_line')">
                                        <span role="button" class="btn_delete" id="id_clear" style="display: none;">
                                            <span class="icon_delete">
												<span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                    <div class="input_row" id="pw_line">
                                        <div class="icon_cell" id="pw_cell">
                                            <span class="icon_pw">
                                                <span class="blind">주문번호</span>
                                            </span>
                                        </div>
                                        <input type="password" id="pw" name="order_id" placeholder="주문번호" title="주문번호" class="input_text" maxlength="16">
                                        <span role="button" class="btn_delete" id="pw_clear" style="display: none;">
                                            <span class="icon_delete">
                                                <span class="blind">삭제</span>
                                            </span>
                                        </span>
                                    </div>
                                </div>
                                <div class="btn_login_wrap">

                                    <button type="submit" class="btn_login" id="log.login">
                                        <span class="btn_text">주문조회</span>
                                    </button>

                                </div>
                            </div>
                        </li>
                    </ul>
                </form>
                </c:if>
            </div>
     </div>
    <div class="atag">
    <a href="${contextPath}/member/joinTypeForm.do">회원가입</a>
    |
    <a href="${contextPath}/member/idpwdFindForm.do">아이디찾기 / 비밀번호 찾기</a>
  </div>
	
	<!-- 네이버 로그인 -->
  <div class="ic_btn" >
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

   
    <!-- 카카오 로그인 -->
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