<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="${contextPath}/resources/css/notice.css">
     <title>탭메뉴</title>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
    var tab_Btn = $(".tab_btn > ul > li");
    var tab_Cont = $(".tab_cont > table");
    tab_Cont.hide().eq(0).show();
    tab_Btn.click(function (e) {
         e.preventDefault();
         var target = $(this);
         var index = target.index();
         tab_Btn.removeClass("active");
         target.addClass("active");
         tab_Cont.hide();
         tab_Cont.eq(index).show();
    });
});

</script>
</head>
<body>
     <div class="notice_box tab_menu">
     <div class="first_content">
     <div class="first_text"><!--상단 제목-->
              <span><b>커 뮤 니 티</b></span>
           </div>
          <div class="tab_btn">
               <ul>
                    <li class="active"><a href="#">자유게시판</a></li>
                    <li><a href="#">중고 거래</a></li>
                    <li><a href="#">회원 양도</a></li>
               </ul>
          </div>
          <div class="tab_cont">
               <table class="active">
                    <tr class="notice_board_first_tr">
                    	<td width=15%>글번호</td>
                    	<td width=50%>제목</td>
                    	<td width=15%>작성자</td>
                    	<td width=20%>작성일</td>
                    </tr>
                    <c:forEach begin="0" end="10" step="1">
                    <tr>
                    	<td>100</td>
                    	<td>자유게시판 제목 테스트</td>
                    	<td>정유라</td>
                    	<td>[2022-04-10]</td>
                    </tr>
                    </c:forEach>
               </table>
               <table>
                   <tr class="notice_board_first_tr">
                    	<td width=15%>글번호</td>
                    	<td width=50%>제목</td>
                    	<td width=15%>작성자</td>
                    	<td width=20%>작성일</td>
                    </tr>
                    <c:forEach begin="0" end="10" step="1">
                    <tr>
                    	<td>100</td>
                    	<td>중고 거래 제목 테스트</td>
                    	<td>정유라</td>
                    	<td>[2022-04-10]</td>
                    </tr>
                    </c:forEach>
               </table>
               <table>
                   <tr class="notice_board_first_tr">
                    	<td width=15%>글번호</td>
                    	<td width=50%>제목</td>
                    	<td width=15%>작성자</td>
                    	<td width=20%>작성일</td>
                    </tr>
                    <c:forEach begin="0" end="10" step="1">
                    <tr>
                    	<td>100</td>
                    	<td>양도 서비스 제목 테스트</td>
                    	<td>정유라</td>
                    	<td>[2022-04-10]</td>
                    </tr>
                    </c:forEach>
               </table>
          </div>
          <DIV id="page_wrap">
		 <c:forEach var="page" begin="1" end="10" step="1" >
		         <c:if test="${section >1 && page==1 }"> <!-- section 2부터는 그 전 section으로 갈 수 있도록 pre라는 이름의 a태그를 보여줌 -->
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?section=${section-1}&pageNum=${(section-1)*10-page }">&nbsp;pre &nbsp;</a>
		         </c:if>
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		         <c:if test="${page ==10 }"> <!--  -->
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
		         </c:if> 
	      </c:forEach> 
		</DIV>
		<div class="noticeWrite_btn_box">
			<a href="${contextPath}/cs/noticeWrite.do">글 작성하기</a>
		</div>	
          </div>
     </div>
</body>
</html>