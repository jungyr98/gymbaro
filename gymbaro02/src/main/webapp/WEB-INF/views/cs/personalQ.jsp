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
    <link rel="stylesheet" href="${contextPath}/resources/css/personalQ.css">
    <style>
       table, tr, td {
   border-collapse : collapse;
   border: 1px solid #c4c4c4;
}
    </style>
</head>
<body>
    <div class="main_container">
    <div class="first_content">
    <div class="first_text">
       <span><b>1:1 문의 작성</b></span>
    </div>
    <div class="form_box">
    <form action="${contextPath}/cs/cs.do" method="post">   
       <table border="1" width="730px;" style="margin: 0 auto;">
        <thead>
            <tr>
               <td class="fixed_cs">문의항목</td>
               <td><select name="question" onChange="" title="문의 항목" style="width:31%; height:27px; border:0; outline: none;">
                     <option value="none">항목 선택</option>
                     <option value="q1">배송문의</option>
                     <option value="q2">반품/교환/환불</option>
                     <option value="q3">주문 / 결제</option>
                     <option value="q4">회원 서비스</option>
                  </select>
               </td>
            </tr>
         </thead>
          <thead>
             <tr>
                <td class="fixed_cs">아이디</td>
                <td>
                  <input type="text" name="id"  id="id" style="width:200px;" />
                </td>
             </tr>
          </thead>
          <thead>
             <tr>
                <td class="fixed_cs">이름</td>
                <td>
                <input name="name" type="text" style="width:200px"; /></td>
             </tr>
          </thead>
          <thead>
            <tr>
                <td class="csform">내용</td>
                <td>
                <input name="write" type="text" style="width: 200px; height:500px;" /></td>
             </tr>
          </thead>
          <thead>
             <tr class="dot_line">
                <td class="fixed_cs">첨부파일</td>
                <td>
                  <label class="input-file-button" for="input-file">업로드</label>
                  <input type="file" id="input-file" style="display: none;"/>
               </td>
             </tr>
          </thead>   
       </table>
       <br>
       <div class="button_box">
          <a><button id="button_01"><span>돌아가기</span></button></a>
          <a href="#"><button id="button_02"><span>입력완료</span></button></a>
          </div>
    </form>
    </div>
   </div>
  </div>
</body>
</html>