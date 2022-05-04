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
    <link rel="stylesheet" href="${contextPath}/resources/css/newPwdForm.css">
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</head>
<body>
	 <div class="main_container">
        <div class="first_content">
         <div class="first_text">
            <span><b>비밀번호 재설정</b></span>
         </div>
    <div class="forms">
        <form name="form" action="${contextPath}/member/pwdFindSuccess.do" id="newPwd">
            <div class="input-field">
              <label for="newPwd"></label> 
              <input type="password" name="newPwd" required="newPwd" placeholder="새 비밀번호를 입력하세요." required/>
              <label for="renewPwd"></label> 
              <input type="password" name="renewPwd" required="renewPwd" placeholder="새 비밀번호를 다시 입력하세요." required/>
              <input type="submit" value="확인" class="button"/>
            </div>
        </form>
    </div>
    </div>
    </div>
</body>
</html>