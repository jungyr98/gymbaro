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
// 게시물 삭제
function check_delete() {
	var check = confirm("게시물을 삭제하시겠습니까?");
	if (check) {
		alert("게시물이 삭제되었습니다.");
		return true;
		
	} else {
		return false;
	}		
};	

// 댓글 등록 컨펌
function commentAddCheck() {
	var add_check = confirm("등록하시겠습니까?");
	if(add_check){
		return true;
	}else {
		return false;
	}
}

// 댓글 삭제
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

// 댓글 수정
function commentUpdateCheck(commentNo) {
	var comment_content = $("#comment_content"+commentNo).val();
	if(comment_content==''){
		alert("내용을 입력해주세요!");
		return false;
	}else if(comment_content>250){
		alert("댓글은 250자 이하로 써주세요!");
		return false;
	}
	var update_check = confirm("수정하시겠습니까?");
	if(update_check){
		return true;
	}else{
		return false;
	}
}

// 답글 쓸 때 답글폼 노출하기, 취소 누르면 답글폼 숨김
function write_parent_comment(parentNo, type) {
	if(type=='Y'){
		$('#write_parentNo'+parentNo).css("display", "");
	}else if(type=='N'){
		$('#write_parentNo'+parentNo).css("display", "none");
		$('#reply_content'+parentNo).val("");
	}
}

// 수정 버튼 누를 시 수정폼 노출, 원래 댓글 숨김
function comment_update(commentNo) {
	$(".comment_view_content"+commentNo).css("display", "none");
	$(".updateCommentForm"+commentNo).css("display", "");
	$(".comment_btn_box"+commentNo).css("display", "none");
}

// 취소 버튼 누를 시 수정폼 숨김, 원래 댓글 노출
function update_cancel(commentNo) {
	$(".comment_view_content"+commentNo).css("display", "");
	$(".updateCommentForm"+commentNo).css("display", "none");
	$(".comment_btn_box"+commentNo).css("display", "");
}

//top 버튼
$(function() {
       $(".community_top_btn").click(function() {
           $('html, body').animate({
               scrollTop : 0 //버튼 눌렀을때 도달하는 위치
           }, 680);
           return false;
       });
});

// 비회원일시 로그인 후 다시 현재창으로 돌아올 수 있도록 loginForm에 주소값 보내기
function comment_check_login(articleNo) {
	console.log(articleNo);
	var action = "/community/communityDetail.do?articleNo="+articleNo;
	location.href = '${contextPath}/member/loginForm.do?mode=common&action='+action;
}

// 관리자 댓글 숨김처리
function comment_hidden(commentNo) {
	var hidden_check = confirm("숨김 처리 하시겠습니까?");
	var commentList = new Array();
	commentList[0] = commentNo;
	if(hidden_check){
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/community/updateCommentHidden.do",
			traditional : true,
			data : {
				"commentNo":commentList
			},
			success : function(data, textStatus) {
					alert("숨김 처리 되었습니다");
					location.reload();				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			}
		}); //end ajax
	}else {
		return;
	}
}
</script>
<style type="text/css">
.communityDetail_button_box .glyphicon {
font-size: 10px;
margin-right:5px;
}

.communityDetail_first_content .comment_box {
    display: flex;
    flex-direction: column;
    align-items: baseline;
    justify-content: space-between;
    width: 850px;
    height: 70px;
    margin: 10px;
}

.communityDetail_first_content .comment_box .comment_writer_span {
    font-size: 15px;
    font-weight: bold;
}

.communityDetail_first_content .comment_box .comment_content_span {
    width: 600px;
    text-align: left;
}

.communityDetail_first_content .comment_box .comment_regDate_span {
    font-size: 13px;
    color: #979797;
}

.communityDetail_first_content .comment_write_box {
    display: flex;
    flex-direction: column;
    align-items: baseline;
    padding: 15px;
    border: 2px solid #f0f0f0;
    border-radius: 6px;   
    margin: 35px 0px;
    width: 950px;
}

.communityDetail_first_content .comment_write_box .my_comment_name {
    color: black;
}

.communityDetail_first_content .comment_write_box .comment_submit_box {
    width: 100%;
    text-align: end;
}

.communityDetail_first_content .comment_box .writer_tag {
    color: #F53535;
    border: 2px solid #FBB3B3;
    font-size: 11px;
    font-weight: bold;
    border-radius: 11px;
    padding: 1px 4px;
    margin-left: 5px;
}

.my_comment_btn_box button,
.comment_hidden_btn {
    border: 1px solid #ddd;
    border-radius: 2px;
    background: white;
    color: #c4c4c4;
    font-size:13px;
}

.comment_hidden_btn {
	font-size:13px;
	margin-left:5px;
}

.my_comment_btn_box {
    display: flex;
    align-items: center;
    width: 85px;
    margin-left:5px;
}

#location_login_btn {
	border: 1px solid #ddd;
    background: white;
    height: 35px;
    width: 125px;
    margin-left: 10px;
}

.comment_state_d_box {
	text-align: left;
    padding-left: 10px;
    height: 60px;
    color: #676767;
}

.my_comment_setting_box {
	display: flex;
    align-items: center;
}
</style> 
</head>
<body>
    <div class="communityDetail_main_container">
    <div class="communityDetail_first_content">
    <div class="communityDetail_button_box">
    	<div id="form_div_box">
       			<form action="${contextPath}/community/deleteArticle.do" onsubmit="return check_delete();" name="detailForm" method="post">
       			<c:if test="${readArticle.uid == memberInfo.uid}">
     		  		<div class="communityDetail_delete_button">
      		  	<input type="hidden" name="articleNo" value="${readArticle.articleNo}">
      		  	<button type="submit" id="communityDetail_button_01">삭제</button>
   			     </div>
    		   	</c:if>
    		   	</form>
    		   	&nbsp;&nbsp;     	
    		    <c:if test="${readArticle.uid == memberInfo.uid}">
     		  	  <div class="communityDetail_modify_button">
     		   	<input type="hidden" name="articleNo" value="${readArticle.articleNo}">
      		  	<a href="${contextPath}/community/modifyForm.do?articleNo=${readArticle.articleNo}"><button type="button" id="communityDetail_button_01" onclick="">수정</button></a>
     		     </div>
      		 	</c:if>   
       	</div>
       <c:choose>
       	<c:when test= "${prevArticleNo != null && nextArticleNo != null}">
       	<div>
          <a href="${contextPath}/community/communityDetail.do?articleNo=${prevArticleNo}"><button id="communityDetail_button_01"><span><span class="glyphicon glyphicon-menu-up"></span>&nbsp;이전글</span></button></a>
          <a href="${contextPath}/community/communityDetail.do?articleNo=${nextArticleNo}"><button id="communityDetail_button_01"><span><span class="glyphicon glyphicon-menu-down"></span>&nbsp;다음글</span></button></a>
          <a href="${contextPath}/community/community.do"><button type="button" id="communityDetail_button_02"><span>목록</span></button></a>
         </div>
        </c:when>
         <c:when test= "${prevArticleNo == null && nextArticleNo != null}">
         <div>
          <a href="${contextPath}/community/communityDetail.do?articleNo=${nextArticleNo}"><button id="communityDetail_button_01"><span><span class="glyphicon glyphicon-menu-down"></span>&nbsp;다음글</span></span></button></a>
          <a href="${contextPath}/community/community.do"><button type="button" id="communityDetail_button_02"><span>목록</span></button></a>
         </div>
        </c:when>
         <c:when test= "${prevArticleNo != null && nextArticleNo == null}">
         <div>
          <a href="${contextPath}/community/communityDetail.do?articleNo=${prevArticleNo}"><button type="button" id="communityDetail_button_01"><span><span class="glyphicon glyphicon-menu-up"></span>&nbsp;이전글</span></button></a>
          <a href="${contextPath}/community/community.do"><button type="button" id="communityDetail_button_02"><span>목록</span></button></a>
         </div>
        </c:when>
          <c:when test= "${prevArticleNo == null && nextArticleNo == null}">
          <div>
          <a href="${contextPath}/community/community.do"><button type="button" id="communityDetail_button_02"><span>목록</span></button></a>
          </div>
        </c:when>        
       </c:choose>
          </div>
    <div class="communityDetail_form_box"> 

       <table border="1" style="width:950px;" >
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
      <!--  댓글 작성  -->  
          <br>
         <div id="reply_count">총 <span style="color: #184798">${readArticle.comment_cnt}</span>개의 댓글</div><br>
         
         <div class="comment_view">
         <table> 
            <c:forEach var="viewComment" items="${viewComment}">
            <c:if test="${viewComment.state eq '정상'}">
            <tr>
            	<td id="comment_view_content1">
            		<div class="comment_box comment_view_content${viewComment.commentNo}">
            			<div>
            				<span class="comment_writer_span">${viewComment.comment_writer}</span>
            				<c:if test="${readArticle.uid == viewComment.uid}">
            					<span class="writer_tag">작성자</span>
            				</c:if>
            			</div>
            			<span class="comment_content_span">${viewComment.comment_content}</span>
            			<div class="my_comment_setting_box">
            				<span class="comment_regDate_span"><fmt:formatDate value="${viewComment.regDate}" pattern="YYYY.MM.dd. kk:mm:ss" /></span>
            				<c:if test="${not empty memberInfo}">
            					<button type="button" class="comment_regDate_span" style="border:none; background:white; margin-left:5px;" onclick="write_parent_comment(${viewComment.commentNo},'Y');">답글쓰기</button>
            					<c:if test="${memberInfo.member_level == 4}">
        							<button type="button" type="button" onclick="comment_hidden(${viewComment.commentNo})" class="comment_hidden_btn">숨김</button>
        						</c:if>
        						<c:if test="${viewComment.uid == memberInfo.uid}">
        							<div class="my_comment_btn_box comment_btn_box${viewComment.commentNo}">
        								<button type="button" onclick="comment_update(${viewComment.commentNo})" id="comment_delete_btn">수정</button>
        								<button type="button" onclick="comment_delete(${readArticle.articleNo},${viewComment.commentNo})" id="comment_delete_btn">삭제</button>
        							</div>
        						</c:if>
            				</c:if>
            			</div>
            		</div>
            		<form action="${contextPath}/community/updateComment.do" class="updateCommentForm${viewComment.commentNo}" onsubmit="return commentUpdateCheck(${viewComment.commentNo});" style="display:none;">
                  		<div class="comment_write_box">
                  			<span class="my_comment_name">${viewComment.comment_writer}</span>
                 		 	  <textarea name="comment_content" id="comment_content${viewComment.commentNo}">${viewComment.comment_content}</textarea>
                  			  <div class="comment_submit_box">
                  			  	<button type="button" id="comment_btn" onclick="update_cancel(${viewComment.commentNo});">취소</button>
                				<button type="submit" id="comment_btn">수정</button>
                			</div>
                   		<input type="hidden" name="articleNo" value="${readArticle.articleNo}" />
                   		<input type="hidden" name="commentNo" value="${viewComment.commentNo}" />
                 		 </div>
         	  		</form>
            		<input type="hidden" name="articleNo" value="${readArticle.articleNo}" />
            	</td>            	
            	<td>
            	<input type="hidden" name="articleNo" value="${readArticle.articleNo}" />
        		<input type="hidden" name="commentNo" value="${viewComment.commentNo}" />
        		</td>
            </tr>
            </c:if>
            <c:if test="${viewComment.state eq 'DU'}">
            	<tr>
            		<td colspan="3" class="comment_state_d_box">
            			<span class="comment_content_span">삭제된 댓글입니다.</span>
            		</td>
            	</tr>
            </c:if>
            <c:if test="${viewComment.state eq 'DA'}">
            	<tr>
            		<td colspan="3" class="comment_state_d_box">
            			<span class="comment_content_span">관리자에 의해 숨겨진 댓글입니다.</span>
            		</td>
            	</tr>
            </c:if>
            <c:forEach var="item" items="${replyComment}">
            <c:if test="${viewComment.commentNo eq item.parentNo }">
            <tr>
               <c:if test="${item.state eq '정상'}">
               <td style="padding-left:30px;">
            		<div class="comment_box comment_view_content${item.commentNo}" style="width:700px;">
            			<div>
            				<span class="comment_writer_span">${item.comment_writer}</span>
            				<c:if test="${readArticle.uid == item.uid}">
            					<span class="writer_tag">작성자</span>
            				</c:if>
            			</div>
            			<span class="comment_content_span">${item.comment_content}</span>
            			<div class="my_comment_setting_box">
            				<span class="comment_regDate_span"><fmt:formatDate value="${item.regDate}" pattern="YYYY.MM.dd. kk:mm:ss" /></span>
            				<c:if test="${memberInfo.member_level == 4}">
        							<button type="button" type="button" onclick="comment_hidden(${item.commentNo})" class="comment_hidden_btn">숨김</button>
        					</c:if>
        					<c:if test="${item.uid == memberInfo.uid}">
        							<div class="my_comment_btn_box comment_btn_box${item.commentNo}">
        								<button type="button" onclick="comment_update(${item.commentNo})" id="comment_delete_btn">수정</button>
        								<button type="button" onclick="comment_delete(${readArticle.articleNo},${item.commentNo})" id="comment_delete_btn">삭제</button>
        							</div>
        					</c:if>
            			</div>
            		</div>
            		<form action="${contextPath}/community/updateComment.do" class="updateCommentForm${item.commentNo}" onsubmit="return commentUpdateCheck();" style="display:none;">
                  		<div class="comment_write_box">
                  			<span class="my_comment_name">${item.comment_writer}</span>
                 		 	  <textarea name="comment_content">${item.comment_content}</textarea>
                  			  <div class="comment_submit_box">
                  			<button type="button" id="comment_btn" onclick="update_cancel(${item.commentNo});">취소</button>
                			<button type="submit" id="comment_btn">수정</button>
                		</div>
                   		<input type="hidden" name="articleNo" value="${readArticle.articleNo}" />
                   		<input type="hidden" name="commentNo" value="${item.commentNo}" />
                 		 </div>
         	  		</form>
            		<input type="hidden" name="articleNo" value="${readArticle.articleNo}" />
            	</td>
            	<td></td>            	
        		</c:if>
        		<c:if test="${item.state eq 'DU'}">
            		<td colspan="3" class="comment_state_d_box" style="padding-left:40px;">
            			<span class="comment_content_span">삭제된 댓글입니다.</span>
            		</td>
            	</c:if>
            	<c:if test="${item.state eq 'DA'}">
            		<td colspan="3" class="comment_state_d_box" style="padding-left:40px;">
            			<span class="comment_content_span">관리자에 의해 숨겨진 댓글입니다.</span>
            		</td>
            	</c:if>
            </tr>
            </c:if>
            </c:forEach>
 			<tr id="write_parentNo${viewComment.commentNo}" style="display:none;">
 			<td style="padding-left:30px;">
        		<form action="${contextPath}/community/addNewComment.do" onsubmit="return commentAddCheck();">
                  <div class="comment_write_box" style="margin-top:10px;">
                  	<span class="my_comment_name">${memberInfo.member_name}</span>
                    <textarea name="comment_content" id="reply_content${viewComment.commentNo}" placeholder="입력창에 댓글을 작성해 주세요. &#13;&#10;비방이나 욕설, 광고글이나 허위 또는 저속한 내용의 댓글은 사전 통보 없이 삭제됩니다."></textarea>
                    <div class="comment_submit_box">
                    	<button type="button" id="comment_btn" onclick="write_parent_comment(${viewComment.commentNo},'N');">취소</button>
                		<button type="submit" id="comment_btn">등록</button>
                	</div>
                   	<input type="hidden" name="articleNo" value="${readArticle.articleNo}" />
                   	<input type="hidden" name="parentNo" value="${viewComment.commentNo}" />
                  </div>
         	  </form>
        		</td>
 			</tr>
            </c:forEach>
            <tr>
             <c:choose>
             <c:when test="${empty memberInfo}">
             	<td colspan="3" style="height:100px;border-top: 1px solid #f0f0f0;">
             		<span>로그인이 필요한 서비스입니다</span>
             		<button type="button" id="location_login_btn" onclick="comment_check_login(${readArticle.articleNo});">로그인 하러 가기</button>
             	</td>
             </c:when>
             <c:otherwise>
             <td colspan="3">
              <form action="${contextPath}/community/addNewComment.do" onsubmit="return commentAddCheck();">
                  <div class="comment_write_box">
                  	<span class="my_comment_name">${memberInfo.member_name}</span>
                    <textarea name="comment_content" placeholder="입력창에 댓글을 작성해 주세요. &#13;&#10;비방이나 욕설, 광고글이나 허위 또는 저속한 내용의 댓글은 사전 통보 없이 삭제됩니다."></textarea>
                    <div class="comment_submit_box">
                		<button type="submit" id="comment_btn">등록</button>
                	</div>
                   	<input type="hidden" name="articleNo" value="${readArticle.articleNo}" />
                  </div>
         	  </form>
         	  </td>
         	  </c:otherwise>
         	  </c:choose>
           </tr>     
        </table> 
            
         </div>
    </div>
    <div style="text-align: end;padding-top: 10px;">
         	<button type="submit" id="communityDetail_button_01" class="community_top_btn"><span class="glyphicon glyphicon-triangle-top"></span>&nbsp;TOP</button>
         </div>
   </div>
  </div>
 </body>
</html>