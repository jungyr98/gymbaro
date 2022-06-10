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
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/myPage03.css">
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
<style type="text/css">
.gym_img_box {
    display: flex;
    justify-content: center;
    align-items: center;
}

.gym_img_box img {
    width: 150px;
    margin: 10px;
}
</style>
</head>
<body>
 <div class="myPage_box wrap show">
  <div id="content" class="sub_wrap">
  	<div class="align_rt">
      <div class="myPage03_box tab_menu">
     	<div class="first_content">
          <div class="tab_btn">
               <ul>
                    <li class="active"><a href="#">내 시설 관리<img alt="coupon.png" src="${contextPath}/resources/image/customer-care.png"></a></li>
               </ul>             
          </div>
          <div class="tab_cont" style="margin-top:10px;">
               <table class="active myPage03_table">
                    <tr class="notice_board_first_tr">
                    	<td width=10%>시설번호</td>
                    	<td width=40%>시설명</td>
                    	<td width=15%>등록일자</td>
                    	<td width=10%>회원 수</td>
                    	<td width=15%>상태</td>
 
                    </tr>
                    <c:choose>
                    <c:when test="${empty gymInfo}">
                    	<tr>
                    		<td colspan="5">
                    			등록된 시설이 존재하지 않습니다. <a href="${contextPath}/mypage/addNewGymForm.do" id="addNewGym"><b>시설 등록하러 가기</b></a>
                    		</td>
                    	</tr>
                    </c:when>
                    <c:otherwise>
                    <c:forEach var="item" items="${gymInfo}">
                    <tr>
                    	<td>${item.gym_id}</td>
                    	<td>
                    		<div class="gym_img_box">
                    			<img width="150" alt="" src="${contextPath}/thumbnailsGym.do?gym_id=${item.gym_id}&fileName=${item.gym_fileName}">&nbsp;
                    			<div>
                    			<b>${item.gym_name}</b>
                    			</div>
                    		</div>
                    	</td>
                    	<td>
                    		<fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd"/>
                    	</td>
                    	<td>${item.member_count}</td>
                    	<td>
                    		<c:if test="${item.state == '신청중'}">
                    			<span style="color:limegreen;">${item.state}</span>
                    		</c:if>
                    		<c:if test="${item.state == '활성화'}">
                    			<span style="color:#0078ff;">${item.state}</span>
                    		</c:if>
                    		<c:if test="${item.state == '비활성화'}">
                    			<span style="color:tomato;">${item.state}</span>
                    		</c:if>
                    	</td>
                    </tr>
                    </c:forEach>
                    </c:otherwise>
                    </c:choose>
               </table>
          </div>
          </div>
     </div>
    </div>
   </div>
</div>
</body>
</html>