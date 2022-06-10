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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/communityDetail.css">
<style>
table,tr,td {
	border:none;
}
table {
   border-bottom: 1px solid #ddd;
}
</style>
    
<script>
		function check_delete() {
			var check = confirm("게시물을 삭제하시겠습니까?");
			if (check) {
				alert("게시물이 삭제되었습니다.");
				return true;
				
			} else {
				return false;
			}		
		};	
		
	function comment_delete(articleNo, commentNo) {
		var delete_check = confirm("댓글을 삭제하시겠습니까?");
		if (delete_check == true) {
			alert("댓글이 삭제되었습니다.");
			location.href = '${contextPath}/community/deleteComment.do?articleNo='+articleNo+'&commentNo='+commentNo;
		} else {
			alert("댓글 삭제가 취소되었습니다.");
			return;
		}
	}
	
</script> 
</head>
<body>
    <div class="communityDetail_main_container">
    <div class="communityDetail_first_content">
    <div class="communityDetail_form_box"> 

       <table border="1" width="1024px;" >
        <thead>
            <tr>
               <td class="communityDetail_content">[${readArticle.article_category}] ${readArticle.title}</td>
            </tr>
         </thead>
          <thead>
             <tr>
                <td class="communityDetail_fixed_detail" colspan="2" style="background-color: white">
                	<div id="writer_info">
                	<div>
                		${readArticle.writer}&nbsp;&nbsp;ㅣ&nbsp;&nbsp;<fmt:formatDate value="${readArticle.writeDate}" pattern="YYYY-MM-dd hh:mm:ss"></fmt:formatDate>
                	</div>
                    <div>
                      	조회수 ${readArticle.view_cnt}&nbsp;&nbsp;ㅣ&nbsp;&nbsp;댓글  ${readArticle.comment_cnt}
                    </div>
                    </div>
                </td>
             </tr>
          </thead>
          <thead>
            <tr>
                <td colspan="2"class="communityDetail_form" style=" background-color: white">${readArticle.content}</td>
             </tr>
          </thead>
            
       </table>
       <br>
       <div class="communityDetail_button_box">
       <c:choose>
       	<c:when test= "${prevArticleNo != null && nextArticleNo != null}">
       	<div>
          <a href="${contextPath}/community/communityDetail.do?articleNo=${prevArticleNo}"><button id="communityDetail_button_01"><span>이전</span></button></a>
          <a href="${contextPath}/community/community.do"><button type="button" id="communityDetail_button_02"><span>목록</span></button></a>
          <a href="${contextPath}/community/communityDetail.do?articleNo=${nextArticleNo}"><button id="communityDetail_button_01"><span>다음</span></button></a>
         </div>
        </c:when>
         <c:when test= "${prevArticleNo == null && nextArticleNo != null}">
         <div>
          <a><button type="button" id="communityDetail_button_01" disabled><span>이전</span></button></a>
          <a href="${contextPath}/community/community.do"><button type="button" id="communityDetail_button_02"><span>목록</span></button></a>
          <a href="${contextPath}/community/communityDetail.do?articleNo=${nextArticleNo}"><button id="communityDetail_button_01"><span>다음</span></button></a>
         </div>
        </c:when>
         <c:when test= "${prevArticleNo != null && nextArticleNo == null}">
         <div>
          <a href="${contextPath}/community/communityDetail.do?articleNo=${prevArticleNo}"><button type="button" id="communityDetail_button_01"><span>이전</span></button></a>
          <a href="${contextPath}/community/community.do"><button type="button" id="communityDetail_button_02"><span>목록</span></button></a>
          <a><button type="button" id="communityDetail_button_01" disabled><span>다음</span></button></a>
         </div>
        </c:when>
          <c:when test= "${prevArticleNo == null && nextArticleNo == null}">
          <div>
          <a><button type="button" id="communityDetail_button_01" disabled><span>이전</span></button></a>
          <a href="${contextPath}/community/community.do"><button type="button" id="communityDetail_button_02"><span>목록</span></button></a>
          <a><button type="button" id="communityDetail_button_01" disabled><span>다음</span></button></a>
          </div>
        </c:when>        
       </c:choose>
       		<div id="form_div_box">
       			<form action="${contextPath}/community/deleteArticle.do" onsubmit="return check_delete();" name="detailForm" method="post">
       			<c:if test="${readArticle.uid == memberInfo.uid}">
     		  		<div class="communityDetail_delete_button">
      		  	<input type="hidden" name="articleNo" value="${readArticle.articleNo}">
      		  	<button type="submit" id="delete_btn">삭제하기</button>
   			     </div>
    		   	</c:if>
    		   	</form>
       	
    		    <c:if test="${readArticle.uid == memberInfo.uid}">
     		  	  <div class="communityDetail_modify_button">
     		   	<input type="hidden" name="articleNo" value="${readArticle.articleNo}">
      		  	<a href="${contextPath}/community/modifyForm.do?articleNo=${readArticle.articleNo}"><button type="button" onclick="">수정하기</button></a>
     		     </div>
      		 	</c:if>   
       		</div>
          </div>

        
      <!--  댓글 작성  -->  
          <br>
         <div id="reply_count">총 <span style="color: #184798">${readArticle.comment_cnt}</span>개의 댓글</div><br>
         
         <div class="comment_view">
         <table> 
            <tr>   
               <td id="comment_view_title1">댓글 작성자</td>
               <td id="comment_view_title2">댓글 내용</td>
               <td id="comment_view_title3">댓글 작성일</td>
               <%-- <c:if test="${commentVO.uid == memberInfo.uid}"> --%>
        		<td id="comment_delete_title">댓글 삭제</td>
        		<%-- </c:if> --%>
            </tr>
            <c:forEach var="viewComment" items="${viewComment}">
            <tr>
            	<td id="comment_view_content1">${viewComment.comment_writer}</td>
            	<td id="comment_view_content2">${viewComment.comment_content}</td>
            	<td id="comment_view_content3"><fmt:formatDate value="${viewComment.regDate}" pattern="YYYY-MM-dd kk:mm:ss"></fmt:formatDate></td>
            	
            	<%-- <c:if test="${commentVO.uid == memberInfo.uid }"> --%>
            	<input type="hidden" name="articleNo" value="${readArticle.articleNo}">
        		<input type="hidden" name="commentNo" value="${readArticle.commentNo}">
        		<td><button type="button" onclick="comment_delete(${readArticle.articleNo},${viewComment.commentNo})" id="comment_delete_btn">삭제</button></td>
    
           	<%-- </c:if> --%> 
            
            </tr>
 
            </c:forEach> 
        </table> 
        
     
         </div>
         
         
		<br><br>
   
          <form action="${contextPath}/community/addNewComment.do">
          <table border="1" width="1024px;" >
            <thead>
                <tr>
                   <td class="communityDetail_fixed_comment">
                    
                        <p><textarea name="comment_content" placeholder="입력창에 댓글을 작성해 주세요. &#13;&#10;비방이나 욕설, 광고글이나 허위 또는 저속한 내용의 댓글은 사전 통보 없이 삭제됩니다."></textarea></p>
                      
                   </td>
                   <td class="communityDetail_enter" style="width: 18%;">
                   		<input type="hidden" name="articleNo" value="${readArticle.articleNo}">
                   		<button type="submit" id="comment_btn">댓글 등록</button>
                   </td>
                </tr>
              </thead>
             </table>
             </form>
    
    </div>
   </div>
  </div>
 </body>
</html>