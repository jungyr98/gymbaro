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
    <link rel="stylesheet" href="${contextPath }/resources/css/idpwdFind.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript">

$(document).ready(function(){
    
    $("#pwdFind").hide();{
      $('.tab a').on('click', function (e) {
      e.preventDefault();
       
      $(this).parent().removeClass('tab');
      $(this).parent().addClass('active');
      $(this).parent().siblings().removeClass('active');
       
      var href = $(this).attr('href');
      $('.forms > form').hide();
      $(href).fadeIn();
    });
    };

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
    
</script>
</head>
<body>
	 <div class="main_container">
        <div class="first_content">
         <div class="first_text">
            <span><b>아이디/비밀번호 찾기</b></span>
         </div>
    <div class="forms">
        <ul class="tab-group">
            <li class="tab active"><a href="#idFind">아이디 찾기</a></li>
            <li class="tab"><a href="#pwdFind">비밀번호 찾기</a></li>
        </ul>      


            <form action="${contextPath}/member/idFindSuccess.do" id="idFind">
            <input type="radio" name="rdo1" id="rdo1" value="r1" checked> 이메일로 찾기
        	<input type="radio" name="rdo1" id="rdo1" value="r2"> 전화번호로 찾기
             <div class="r1 msg">
                <div class="input-field">
                  <label for="name"></label>
                  <input type="text" name="name" required="name" placeholder="이름을 입력하세요."/>
                  <label for="Email"></label> 
                  <input type="text" name="Email" placeholder="이메일을 입력하세요." required/>
                  <input type="submit" value="확인" class="button"/>
                </div>
                </div>
                <div class="r2 msg">
                <div class="input-field">
                  <label for="name"></label> 
                  <input type="text" name="name" required="name" placeholder="이름을 입력하세요."/>
                  <label for="phonNum"></label> 
                  <input type="text" name="phoneNum" placeholder="전화번호를 입력하세요." required/>
                  <input type="submit" value="확인" class="button" />
                </div>
        	</div>
            </form>




        
        <form action="${contextPath}/member/newPwdForm.do" id="pwdFind">
            <div class="input-field">
              <label for="name"></label> 
              <input type="text" name="name" required="name" placeholder="이름을 입력하세요."/>
              <select name="pwdQ" required>
                <option value="" disabled selected>비밀번호 찾기 질문 선택하기</option>
                <option value="Q1">나의 보물 1호는?</option>
                <option value="Q2">출신 고등학교 이름은?</option>
                <option value="Q3">기억에 남는 추억의 장소는?</option>
                <option value="Q4">가장 좋아하는 음식은?</option>
              </select>
              <label for="pwdAnswer"></label> 
              <input type="text" name="pwdAnswer" placeholder="비밀번호질문 답을 입력하세요." required/>
              <input type="submit" value="확인" class="button" />
            </div>
        </form>
        
    </div>
    
        </div>
    </div>
</body>
</html>