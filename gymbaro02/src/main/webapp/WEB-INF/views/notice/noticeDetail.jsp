<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<title>Document</title>
<link rel="stylesheet" href="${contextPath}/resources/css/communityDetail.css">
<style>
table,tr,td {border:none;}
table {border-bottom: 1px solid #ddd;}
#notice_image {
/* 	width: 700px;
	height: 700px; */
	object-fit: cover;
	display: block;
	margin:auto;
	
}
</style>
<script>
function check_delete() {
	var check = confirm("공지사항을 삭제하시겠습니까?");
	if (check) {
		alert("공지사항이 삭제되었습니다.");
		return true;
		
	} else {
		return false;
	}		
};
</script>
</head>
<body>
<div class="communityDetail_main_container">
    <div class="communityDetail_first_content">
    <div class="communityDetail_form_box"> 
    
       <table border="1">
       <thead>
            <tr>
               <td class="communityDetail_content">[${readNotice.notice_category}] ${readNotice.title}</td>
            </tr>
        </thead>
        <thead>
             <tr>
                <td class="communityDetail_fixed_detail" colspan="2" style="background-color: white">
                	<div id="writer_info">
                	<div>
                		${readNotice.notice_writer}&nbsp;&nbsp;ㅣ&nbsp;&nbsp;<fmt:formatDate value="${readNotice.regDate}" pattern="YYYY-MM-dd hh:mm:ss"></fmt:formatDate>
                	</div>
                    <div>
                      	조회수 ${readNotice.view_cnt}
                    </div>
                    </div>
                </td>
             </tr>
          </thead>
          <thead>
            <tr>

                	<td colspan="2" class="communityDetail_form" style=" background-color: white">
 					<br>
 					${readNotice.content}
                	</td>
                	<%-- <td>
                	<c:forEach var="notice_img" items="${readNotice.noticeImageList }">
 						<img class="notice_img" id="notice_image" src="${contextPath}/downloadNoticeImage.do?noticeNo=${readNotice.noticeNo}&imageFileName=${notice_img.imageFileName}">
 					</c:forEach>
 					
                	</td> --%>
              </tr>
          </thead>
            
       </table>
       <br>
       <div class="communityDetail_button_box">
       <c:choose>
       	<c:when test= "${prevNoticeNo != null && nextNoticeNo != null}">
       	<div>
       	  <c:if test="${empty from}">
          <a href="${contextPath}/notice/noticeDetail.do?noticeNo=${prevNoticeNo}"><button id="communityDetail_button_01"><span>이전</span></button></a>
          <a href="${contextPath}/notice/notice.do"><button id="communityDetail_button_02"><span>목록</span></button></a>
          <a href="${contextPath}/notice/noticeDetail.do?noticeNo=${nextNoticeNo}"><button id="communityDetail_button_01"><span>다음</span></button></a>
          </c:if>
          <c:if test="${not empty from}">
          	<a href="${contextPath}/community/community.do"><button id="communityDetail_button_02"><span>목록</span></button></a>
          </c:if>
         </div>
        </c:when>
         <c:when test= "${prevNoticeNo == null && nextNoticeNo != null}">
         <div>
         <c:if test="${empty from}">
          <a><button id="communityDetail_button_01" disabled><span>이전</span></button></a>
          <a href="${contextPath}/notice/notice.do"><button id="communityDetail_button_02"><span>목록</span></button></a>
          <a href="${contextPath}/notice/noticeDetail.do?noticeNo=${nextNoticeNo}"><button id="communityDetail_button_01"><span>다음</span></button></a>
          </c:if>
          <c:if test="${not empty from}">
          	<a href="${contextPath}/community/community.do"><button id="communityDetail_button_02"><span>목록</span></button></a>
          </c:if>
         </div>
        </c:when>
         <c:when test= "${prevNoticeNo != null && nextNoticeNo == null}">
         <div>
         <c:if test="${empty from}">
          <a href="${contextPath}/notice/noticeDetail.do?noticeNo=${prevNoticeNo}"><button id="communityDetail_button_01"><span>이전</span></button></a>
          <a href="${contextPath}/notice/notice.do"><button id="communityDetail_button_02"><span>목록</span></button></a>
          <a><button id="communityDetail_button_01" disabled><span>다음</span></button></a>
          </c:if>
          <c:if test="${not empty from}">
          	<a href="${contextPath}/community/community.do"><button id="communityDetail_button_02"><span>목록</span></button></a>
          </c:if>
         </div>
        </c:when>
          <c:when test= "${prevNoticeNo == null && nextNoticeNo == null}">
          <div>
          <c:if test="${empty from}">
          	<a><button id="communityDetail_button_01" disabled><span>이전</span></button></a>
          	<a href="${contextPath}/notice/notice.do"><button id="communityDetail_button_02"><span>목록</span></button></a>
          	<a><button id="communityDetail_button_01" disabled><span>다음</span></button></a>
          </c:if>
          <c:if test="${not empty from}">
          	<a href="${contextPath}/community/community.do"><button id="communityDetail_button_02"><span>목록</span></button></a>
          </c:if>
          </div>
        </c:when>        
       </c:choose>
       <div id="form_div_box">          
        <form action="${contextPath}/notice/deleteNotice.do" onsubmit="return check_delete();" name="detailForm" method="post">
       	<c:if test="${memberInfo.member_level == '4'}">
       		<div class="communityDetail_delete_button">
        	<input type="hidden" name="noticeNo" value="${readNotice.noticeNo}">
        	<button type="submit" id="delete_btn">게시물 삭제하기</button>
        	</div>
       	</c:if>
       	</form>
       	</div>
      </div>
    </div>
   </div>
  </div>
</body>
</html>