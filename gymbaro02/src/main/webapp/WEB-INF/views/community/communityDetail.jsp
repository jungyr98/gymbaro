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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/communityDetail.css">
    <style>
       table, tr, td {
   border-collapse : collapse;
   border: 1px solid #c4c4c4;
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
    <form action="${contextPath}/notice/notice.do" method="post">   
       <table border="1" width="730px;" >
        <thead>
            <tr>
               <td class="communityDetail_fixed_detail">제목</td>
               <td>커뮤니티 게시글 제목</td>
            </tr>
         </thead>
          <thead>
             <tr>
                <td class="communityDetail_fixed_detail">작성자</td>
                <td>닉네임</td>
             </tr>
          </thead>
          <thead>
             <tr>
                <td class="communityDetail_fixed_detail" colspan="2" style="background-color: white">
                    <div id="communityDetail_current_date">
                        <span><b>작성일 : </b></span>
                        <script>
                        date = new Date();
                        year = date.getFullYear();
                        month = date.getMonth() + 1;
                        day = date.getDate();
                        document.getElementById("communityDetail_current_date").innerHTML = year + "-" + month + "-" + day;
                        </script>
                    </div>
                </td>
             </tr>
          </thead>
          <thead>
            <tr>
                <td colspan="2"class="communityDetail_form" style=" background-color: white">공지사항 내용 입니다</td>
             </tr>
          </thead>
            
       </table>
       <br>
       <div class="communityDetail_button_box">
        <a><button id="communityDetail_button_01"><span>이전글</span></button></a>
          <a><button id="communityDetail_button_01"><span>목록</span></button></a>
          <a><button id="communityDetail_button_01"><span>다음글</span></button></a>
          </div>
          <br>
          <span>총 10 개의 댓글</span>
          <table border="1" width="730px;" >
            <thead>
                <tr>
                   <td class="communityDetail_fixed_comment">
                    <form>
                        <p><textarea placeholder="입력창에 댓글을 작성해 주세요. &#13;&#10;비방이나 욕성, 광고글이나 허위 또는 저속한 내용의 댓글은 사전 통보 없이 삭제됩니다."></textarea></p>
                      </form>
                   </td>
                   <td class="communityDetail_enter" style="width: 18%;">등록</td>
                </tr>
             </table>
    </form>
    </div>
   </div>
  </div>
 </body>
</html>