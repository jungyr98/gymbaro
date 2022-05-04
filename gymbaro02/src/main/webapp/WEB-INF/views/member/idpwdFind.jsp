<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>로그인창</title>
    <link rel="stylesheet" href="../resources/css/idpwdFind.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript">
$(function () {
    var tab_Btn = $(".tab_btn > ul > li");
    var tab_Cont = $(".tab_cont > div");
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

<script>
$(document).ready(function(){

    $('input[type="radio"]').click(function(){
    
    var val = $(this).attr("value");
    
    var target = $("." + val);
    
    $(".msg").not(target).hide();
    
    $(target).show();
    
    });
    
});

//비밀번호 찾기 답변 셀렉트 박스 체인지 부분
var selectBoxChange_pwdQ = function(value){
	if(value == 'none'){
		$('#pwdFindQ').val('');
		return;
	}
	$('#pwdFindQ').val(value);
}
    
</script>
</head>
<body>
	 <div class="idpwdFindForm_box main_container">
        <div class="first_content">
         <div class="first_text">
            <span><b>아이디/비밀번호 찾기</b></span>
         </div>
         
         <div class="idpwdFind_box tab_menu">
          <div class="tab_btn">
               <ul>
                    <li class="active"><a href="#">아이디 찾기</a></li>
                    <li><a href="#">비밀번호 찾기</a></li>
               </ul>    
          </div>
          <div class="tab_cont">
          	<div class="tab_div_box">
          		<br><br>
               <input type="radio" name="rdo1" id="rdo1" value="r1" checked> 이메일로 찾기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<input type="radio" name="rdo1" id="rdo1" value="r2"> 전화번호로 찾기
             <div class="r1 msg">
                <div class="input-field">
                  <form action= "${contextPath}/member/idFindSuccess.do" method="post" id="idFind">
                  <label for="member_name"></label>
                  <input type="text" name="member_name" placeholder="이름을 입력하세요." required/>
                  <label for="email"></label> 
                  <input type="text" name="email" placeholder="이메일을 입력하세요." required/> 
                  <input type="submit" value="확인" class="button">
                  </form>
                </div>
                </div>
                <div class="r2 msg">
                <div class="input-field">
                 <form action= "${contextPath}/member/idFindSuccessByNum.do" method="post" id="idFind">
                  <label for="member_name"></label> 
                  <input type="text" name="member_name" placeholder="이름을 입력하세요." required/>
                  <label for="phone_number"></label> 
                  <input type="text" name="phone_number" placeholder="전화번호를 입력하세요." required/>
                  <input type="submit" value="확인" class="button" />
                  </form>
                </div>
        	</div>
            </div>
            <div class="tab_div_box">
               <form action="${contextPath}/member/newPwdForm.do" id="pwdFind">
            	<div class="input-field">
              <label for="member_id"></label> 
              <input type="text" name="member_id" placeholder="아이디를 입력하세요." required/>
              <select name="pwdFindQ" onChange="selectBoxChange_pwdQ(this.value)" required>
                <option value="none" disabled selected>비밀번호 찾기 질문 선택하기</option>
                <option value="나의 보물 1호는?">나의 보물 1호는?</option>
                <option value="출신 고등학교 이름은?">출신 고등학교 이름은?</option>
                <option value="기억에 남는 추억의 장소는?">기억에 남는 추억의 장소는?</option>
                <option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
              </select>
              <input type="hidden" name="pwdFindQ" id="pwdFindQ" />
              <label for="pwdFindA"></label> 
              <input type="text" name="pwdFindA" placeholder="비밀번호질문 답을 입력하세요." required/>
              <input type="submit" value="확인" class="button" />
            	</div>
        	</form>
            </div>
          </div>
     </div>
    
        </div>
    </div>
</body>
</html>