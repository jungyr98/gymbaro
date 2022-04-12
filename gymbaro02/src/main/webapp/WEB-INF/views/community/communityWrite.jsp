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
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/communityWrite.css">
    <style>
       .communityDetail_ table, tr, td {
   border-collapse : collapse;
   border: 1px solid #c4c4c4;
}
	.communityDetail_noticeWrite_box td:not(.communityDetail_fixed_cs){
		text-align: start;
	}
    </style>
</head>
<body>
    <div class="communityDetail_main_container">
    <div class="communityDetail_first_content">
    <div class="communityDetail_first_text">
       <span><b>커뮤니티</b></span>
    </div>
    <div class="communityDetail_form_box">
    <form action="${contextPath}/cs/cs.do" method="post">   
       <table border="1" width="730px;" style="margin: 0 auto;">
        <thead>
            <tr>
               <td class="communityDetail_fixed_community">커뮤니티</td>
               <td><select name="question" onChange="" title="공지사항" style="width:31%; height:27px; border:0; outline: none;">
                     <option value="none">분류 선택</option>
                     <option value="q1">자유게시판</option>
                     <option value="q2">중고 거래</option>
                     <option value="q3">회원 양도</option>
                  </select>
               </td>
            </tr>
         </thead>
         <thead>
             <tr>
                <td class="communityDetail_fixed_community">제목</td>
                <td><input name="title" type="text" style="width:200px"; /></td>
             </tr>
          </thead>
          <thead>
            <tr>
                <td class="communityDetail_fixed_community form">내용</td>
                <td><input name="write" type="text" style="width: 200px; height:500px;" /></td>
            </tr>
          </thead>
          <thead>
             <tr class="communityDetail_dot_line">
                <td class="communityDetail_fixed_community">첨부파일</td>
                <td>
                  <label class="communityDetail_input-file-button" for="input-file">업로드</label>
                  <input type="file" id="communityDetail_input-file" style="display: none;"/>
               </td>
             </tr>
          </thead>   
       </table>
       <br>
       <div class="communityDetail_button_box">
          <a><button id="communityDetail_button_01"><span>돌아가기</span></button></a>
          <a href="#"><button id="communityDetail_button_02"><span>입력완료</span></button></a>
         </div>
    </form>
    </div>
   </div>
  </div>
</body>
</html>