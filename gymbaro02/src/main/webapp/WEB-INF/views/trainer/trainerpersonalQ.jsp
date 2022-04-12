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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <title>1:1문의 글 작성</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/trainerpersonalQ.css">
    <style>
    .trainerpersonalQ_table, .trainerpersonalQ_tr, .trainerpersonalQ_td {
        border-collapse : collapse;
        border: 1px solid #c4c4c4;
    }
    </style>
</head>
<body>
    <div class="trainerpersonalQ_main_container">
    <div class="trainerpersonalQ_first_content">
    <div class="trainerpersonalQ_first_text">
       <span><b>1:1 트레이너 문의</b></span>
    </div>
    <div class="trainerpersonalQ_form_box">
    <form action="${contextPath}/main/main.do" method="post">   
       <table class="trainerpersonalQ_table" border="1" width="730px;" style="margin: 0 auto;">
          <thead>
             <tr>
                <td class="trainerpersonalQ_fixed_Q">이름</td>
                <td><input name="name" type="text" style="width:200px"; /></td>
             </tr>
          </thead>
          <thead>
            <tr>
                <td class="trainerpersonalQ_Qform">내용</td>
                <td>
                    <input name="write" type="text" style="width: 578px; height:500px;"/>
                </td>
             </tr>
          </thead>
       </table>
       <br>
       <div class="trainerpersonalQ_button_box">
          <a><button id="trainerpersonalQ_button_01"><span>돌아가기</span></button></a>
          <a href="#"><button id="trainerpersonalQ_button_02"><span>문의하기</span></button></a>
        </div>
    </form>
    </div>
   </div>
  </div>
</body>
</html>