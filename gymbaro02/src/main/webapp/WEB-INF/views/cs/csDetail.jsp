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
<title>문의글 상세</title>
<link rel="stylesheet" href="${contextPath}/resources/css/csDetail.css">
<style>
table,tr,td {
	border:none;
}
table {
   border-bottom: 1px solid #ddd;
}

.csDetail_form{
	vertical-align: top; 
	text-align:left;
	padding-left:10px;
}
.cs_admin_Info{
text-align: initial;
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
    margin-left: 441px;
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

#commentContent {
	border: 1px solid #c4c4c4;
    border-radius: 3px;
    margin-top: 20px;
    height: 100px;
}
</style>

<script>
// 문의글 삭제 체크
function cs_delete_check(){
	var check = confirm("삭제하시겠습니까?");
	
	if(check){
		return true;
	}else{
		return false;
	}
}

// 문의글 수정 체크 
function cs_updateForm_check(csNO){
	var check = confirm("수정하시겠습니까?");
	
	if(check){
		location.href="${contextPath}/cs/updateForm.do?csNO="+csNO;
	}else {
		return;
	}
}

// 답변 삭제 체크
function comment_del_check(cs_commentNO){
	var check = confirm("삭제하시겠습니까?");
	
	if(check){
		location.href="${contextPath}/cs/csCommentDelete.do?cs_commentNO="+cs_commentNO;
	}else {
		return;
	}
}

//공백확인 함수
function commentCheck() {
	var commentContent = $('#commentContent').val();
    if (commentContent == "") {
        alert("답변을 입력해주세요!");
        return false;
    }
    return true;
}
</script>
</head>
<body>
    <div class="csDetail_main_container">
    <div class="csDetail_first_content">
    <div class="csDetail_button_box">
	<!-- 수정,목록,삭제 버튼 -->
	<div id="form_div_box">
   	<form action="${contextPath}/cs/deleteCS.do" method="post" onsubmit="return cs_delete_check();">
       <div class="csDetail_delete_button">
        <c:if test="${memberInfo.uid eq csDetail.uid}">
       		<input type="hidden" name="csNO" value="${csDetail.csNO}">
       		<input type="hidden" name="uid" value="${csDetail.uid}">
       		<input type="hidden" name="uid2" value="${memberInfo.uid}">
       		<button type="button" id="csDetail_button_01" onclick="cs_updateForm_check(${csDetail.csNO})">수정</button>
       	</c:if>
       	</div>
       	</form>
       	&nbsp;&nbsp;
       	<div class="csDetail_modify_button">
       	<c:if test="${memberInfo.uid eq csDetail.uid}">
       		<button type="submit" id="csDetail_button_01">삭제</button>
        </c:if>
        </div>
      </div>
      <div>
      	 <button type="button" id="csDetail_button_01" onclick="location.href='${contextPath}/cs/csQnA.do'"><span>목록</span></button>
      </div>
    </div>
  <!-- 문의 상세 start -->
    <div class="csDetail_form_box">
       <table border="1" style="width:950px;">
       	 <thead>
            <tr>
               <td class="csDetail_content">[${csDetail.cs_category}] ${csDetail.title}</td>
            </tr>
         </thead>
         <thead>
             <tr>
                <td class="csDetail_fixed_detail" colspan="2" style="background-color: white">
                	<div id="writer_info">
                	<div>
                		${csDetail.writer}&nbsp;&nbsp;ㅣ&nbsp;&nbsp;<fmt:formatDate value="${csDetail.writeDate}" pattern="YYYY-MM-dd hh:mm:ss"></fmt:formatDate>
                	</div>
                    <div>
                    <!-- 비밀글 여부 -->
                    <c:if test="${csDetail.secret eq 'Y'}">
                   		<img src="${contextPath}/resources/image/lock.png" style="width: 17px; padding-bottom: 3px;">
               			<span style="padding-right:10px;">비밀글</span>
               		</c:if>
                	<c:if test="${csDetail.secret eq 'N'}">
                		<img src="${contextPath}/resources/image/unlock.png" style="width: 17px; padding-bottom: 3px;">
               			<span style="padding-right:10px;">공개글</span>
               		</c:if>
                    </div>
                    </div>
                </td>
             </tr>
          </thead>
          <thead class="theadclass">
            <tr>
                <td colspan="2"class="csDetail_form" style="background-color: white;">${csDetail.txtContent}</td>
             </tr>
          </thead>
       </table>
   <!-- 문의 상세 end -->     
      <!-- 답변 상세  -->
      <c:if test="${commentList != null}">
      <div class="cs_comment_box">
      	<div class="cs_admin_box">
      		<div class="cs_admin_Info">
		      	<span>${commentList.writer}</span>
		      	<span style="padding-left:20px;">|</span>
		      	<span style="padding-left: 20px;"><fmt:formatDate value="${commentList.writeDate}" pattern="YYYY-MM-dd kk:mm"></fmt:formatDate></span>
	      	<!-- 수정,삭제 버튼 (관리자에게만 보임 )-->
	      	<div class="cs_admin_button">
		      	 <c:if test="${memberInfo.member_level == '4' && commentList.cs_commentNO != null}">
	             <input type="hidden" name="csNO1" value="${commentList.csNO}">
	             <input type="hidden" name="cs_commentNO" value="${commentList.cs_commentNO}">
	            <a href="${contextPath}/cs/updateCsForm.do?csNO=${commentList.csNO}">
	            <button type="button" class="comment_update_btn" onclick="">수정</button></a>
	       		<button type="button" class="comment_delete_btn" onclick="comment_del_check(${commentList.cs_commentNO})">삭제</button>
	            </c:if>
	       </div>
	       </div>
      	</div>
      	<br>
      	<div class="cs_admin_comment_box">
      		<span>${commentList.commentContent}</span>
      	</div>
      </div>
      </c:if>
      <!-- 답변 상세  끝 -->
      <!-- 답글 작성 -->
      <c:if test="${memberInfo.member_level == '4' && commentList.cs_commentNO == null}">
      <form action="${contextPath}/cs/insertCsComment.do" method="post" onsubmit="return commentCheck();">
       <table border="1" style="width:950px;" >
            <thead>
                <tr>
                   <td>
                    <p><textarea name="commentContent" id="commentContent"></textarea></p>
                   </td>
                   <td>
                   <input type="hidden" name="csNO_2" value="${csDetail.csNO}">
                   <button type="submit" id="comment_btn">답변 등록</button>
                   </td>
                </tr>
             </table>
         </form>
        </c:if>
    </div>
   </div>
  </div>
</body>
</html>