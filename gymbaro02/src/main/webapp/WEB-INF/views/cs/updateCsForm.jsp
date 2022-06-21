<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>답변 수정 폼</title>
     <link rel="stylesheet" href="${contextPath}/resources/css/csDetail.css">
    <style>
       table, tr, td {
   border-collapse : collapse;
   border: 1px solid #c4c4c4;
}
.csDetail_form{
	vertical-align: top; 
	text-align:left;
	padding-left:10px;
}
.cs_admin_Info{
 	float:left;
 	margin-top: 20px;
 }
 
.cs_admin_comment_box{
float: left;
    text-align: left;
    margin-top: 10px;
    margin-bottom: 50px;
    padding-top: 10px;
    padding-bottom: 10px;
    border-top: 2px solid #f0f0f0;
    border-bottom: 2px solid #f0f0f0;
        width: -webkit-fill-available;
    color: #666;
}
.comment_update_btn{
appearance: none;
background-color:#999;
	color:white;
	margin: 0;
  padding: 0.5rem 1rem;
  font-size: 1.2rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  width: auto;
  border: none;
  border-radius: 4px;

}

.comment_delete_btn{
appearance: none;
background-color:#999;
	color:white;
	margin: 0;
  padding: 0.5rem 1rem;
  font-size: 1.2rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  width: auto;
  border: none;
  border-radius: 4px;
}
.cs_admin_button{
	float: right;
    margin-left: 460px;
}
#comment_btn{
appearance: none;
    background-color: rgb(0 0 0 / 0%);
    color: #424040;
    font-size: 1.6rem;
    font-weight: 400;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    width: auto;
    border: none;
}
#csDetail_button_01{
margin-top: 20px;
margin-bottom:20px;
	border: none;
    border-radius: 5px;
    width: 100px;
    height: 30px;
    color:white;

}
</style>

<script>
function cs_comment_update_check(){
	var check = confirm("수정하시겠습니까?");
	
	if(check){
		return true;
	}else{
		return false;
	}
}
</script>
</head>
<body>
    <div class="csDetail_main_container">
    <div class="csDetail_first_content">
    <div class="csDetail_first_text">
       <span><b>문의 상세</b></span>
    </div>
  <!-- 문의글 상세  -->
    <div class="csDetail_form_box">
		<form action="${contextPath}/cs/deleteCS.do" method="post">
       <table border="1" style="margin:auto;width:950px;" >
        <thead>
            <tr>
               <td class="csDetail_fixed_detail" name="title">제목</td>
               <td class="csDetail_td">${csDetail.title}</td>
            </tr>
         </thead>
          <thead>
             <tr>
                <td class="csDetail_fixed_detail" name="writer">작성자</td>
                <td class="csDetail_td">${csDetail.writer}</td>
             </tr>
          </thead>
          <thead>
             <tr>
                <td class="csDetail_fixed_detail" colspan="2" style="background-color: white; text-align:right; ">
                    <div id="csDetail_current_date">
                        <span><b>
                        <fmt:formatDate value="${csDetail.writeDate}" pattern="YYYY-MM-dd"></fmt:formatDate>
                        </b></span>
                    </div>
                    <!-- 비밀글 여부 -->
                    <c:if test="${csDetail.secret eq 'Y'}">
                    <img src="${contextPath}/resources/image/lock.png" style="width: 17px; padding-bottom: 3px;">
               		<span style="padding-right:10px;">비밀글</span>
               	</c:if>
                <c:if test="${csDetail.secret eq 'N'}">
                <img src="${contextPath}/resources/image/unlock.png" style="width: 17px; padding-bottom: 3px;">
               		<span style="padding-right:10px;">공개글</span>
               	</c:if>
                </td>
             </tr>
          </thead>
          <thead class="theadclass">
            <tr>
                <td colspan="2"class="csDetail_form" name="txtContent" style="background-color: white;">${csDetail.txtContent}</td>
             </tr>
          </thead>
       </table>
       <button type="button" id="csDetail_button_01" onclick="location.href='${contextPath}/cs/csQnA.do'"><span>목록</span></button>
      </form>
      <!-- 답변 작성 -->
      <div class="cs_comment_write">
      <form action="${contextPath}/cs/updateCsComment.do" method="post" onsubmit="return cs_comment_update_check();">
       <table border="1" style="width:950px;" >
            <thead>
                <tr>
                   <td style="width:80%">
                    <p><textarea name="commentContent">${commentList.commentContent}</textarea></p>
                   </td>
                   <td style="width:20%">
                   <input type="hidden" name="cs_commentNO" value="${commentList.cs_commentNO}">
                   <input type="hidden" name="csNO" value="${commentList.csNO}">
                   <button type="submit" id="comment_btn">수정완료</button>
                   </td>
                </tr>
                </thead>
             </table>
              </form>
              </div>
    </div>
   </div>
  </div>
</body>
</html>