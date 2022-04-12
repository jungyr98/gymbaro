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
    <title>1:1 문의 상세</title>
    <link rel="stylesheet" href="trainerpersonalDetail.css">
    <style>
    .trainerpersonalDetail_table, .trainerpersonalDetail_tr, .trainerpersonalDetail_td, .trainerpersonalDetail_table2{
        border-collapse : collapse;
        border: 1px solid #c4c4c4;
    }
	.trainerpersonalDetail_box td:not(.trainerpersonalDetail_fixed_pd){
		text-align: start;
	}
    </style>
</head>
<body>
    <div class="trainerpersonalDetail_main_container">
    <div class="trainerpersonalDetail_first_content">
    <div class="trainerpersonalDetail_first_text">
       <span><b>트레이너 1:1 문의 상세</b></span>
    </div>
    <div class="trainerpersonalDetail_form_box">
    <form action="${contextPath}/mypage/mypage06.do" method="post">   
       <table class="trainerpersonalDetail_table" border="1" width="730px;" style="margin: 0 auto;">
            <thead> 
                <tr>
                <td class="trainerpersonalDetail_fixed_pd">문의항목</td>
                <td>문의항목</td>
                </tr>
            </thead>
            <thead>
                <tr>
                <td class="trainerpersonalDetail_fixed_pd">아이디</td>
                <td>아이디</td>
                </tr>
            </thead>
            <thead>
                <tr>
                    <td class="trainerpersonalDetail_fixed_pd">이름</td>
                    <td>이름</td>
                </tr>
            </thead>
            <thead>
                <tr>
                    <td class="trainerpersonalDetail_fixed_pd pdform">내용</td>
                    <td style="width: 200px; height:500px;">문의 상세 입니다</td>
                </tr>
            </thead>
            <thead>
                <tr class="trainerpersonalDetail_dot_line">
                    <td class="trainerpersonalDetail_fixed_pd">첨부파일</td>
                </tr>
            </thead>   
     </table>
       <br>
       <table class="trainerpersonalDetail_table2" border="1" width="730px;" style="margin: 0 auto;">
            <thead> 
                <tr>
                <td class="trainerpersonalDetail_fixed_pd">작성자</td>
                <td>트레이너</td>
                </tr>
            </thead>
            <thead>
                <tr>
                    <td class="trainerpersonalDetail_fixed_pd pdform">내용</td>
                    <td style="width: 200px; height:300px;">문의 상세 입니다</td>
                </tr>
            </thead>
        </table>
        <br>
       <div class="trainerpersonalDetail_button_box">
          <a><button id="trainerpersonalDetail_button_01"><span>메인으로</span></button></a>
          <a href="#"><button id="trainerpersonalDetail_button_02"><span>문의하기</span></button></a>
        </div>
    </form>
    </div>
   </div>
  </div>
</body>
</html>