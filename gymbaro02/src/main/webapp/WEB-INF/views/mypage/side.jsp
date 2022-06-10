<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
#myPage_side_nav ul li a{
  display:block;
  font-size:20px;
  color:black;
}

#myPage_side_nav{
	padding:0px 20px;
	text-align:left;
}
#myPage_side_nav ul {
	padding-left: 10px;
}

#myPage_side_nav ul .active{
  font-size:20px;
  color:#184798;;
  font-weight:bold;
}

#myPage_side_nav ul li {
    margin-bottom: 26px;
}

#myPage_side_nav ul .active{
  font-size:20px;
  color:#184798;;
  font-weight:bold;
}

#side_member_info_box {
	display: flex;
    flex-direction: column;
    align-items: center;
    height: 210px;
    width: 170px;
    padding: 20px;
    border: 1px solid #ddd;
    margin-bottom: 20px;
    border-radius: 10px;
}

#side_member_info_box .level_span {
    font-size: 30px;
    background: #184798;
    border-radius: 40px;
    padding: 10px 18px;
    color: white;
    font-weight: bold;
}

#side_member_info_box .welcome {
	background: #184798;
}

#side_member_info_box .silver {
	background: silver;
}

#side_member_info_box .gold {
	background: gold;
}

#side_member_info_box .admin {
	background: black;
}
</style>
<script type="text/javascript">
$(function () {
    var side_Btn = $("#myPage_side_nav > ul > li > a");
    side_Btn.click(function (e) {
         var target = $(this);
         var index = target.index();
         side_Btn.removeClass("active");
         target.addClass("active");
    });
});
</script>
</head>
<body>
<nav id="myPage_side_nav">
    <c:choose>
        <c:when test="${memberInfo.member_type == '일반'}">
          <div id="side_member_info_box">
          	<c:if test="${memberInfo.member_level == 1 }">
          		<span class="level_span welcome">W</span>
          	</c:if>
          	<c:if test="${memberInfo.member_level == 2 }">
          		<span class="level_span silver">S</span>
          	</c:if>
          	<c:if test="${memberInfo.member_level == 3 }">
          		<span class="level_span gold">G</span>
          	</c:if>
          	<c:if test="${memberInfo.member_level == 4 }">
          		<span class="level_span admin">A</span>
          	</c:if>
          	<fmt:formatNumber  value="${memberInfo.member_point}" type="number" var="point" />
          	<span style="margin-top: 10px;">${memberInfo.member_name }님</span>
          	<span style="margin-top: 30px;">현재 포인트</span>
          	<span style="font-size: 20px; font-weight: bold;">${point}원</span>
          </div>
          <ul>
            <li>
              <a href="${contextPath}/mypage/mypage.do">회원정보 수정</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/listMyOrderHistory.do">주문/배송</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/listMyPointHistory.do">쿠폰/포인트</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myMembership.do">예약 내역</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/listMyBoardHistory.do?search_type=article">내 게시물 관리</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage06.do">1:1 문의 내역</a>
            </li>
          </ul>
          </c:when>
          <c:when test="${memberInfo.member_type == '시설'}">
          <div id="side_member_info_box">
          	<c:if test="${memberInfo.member_level == 1 }">
          		<span class="level_span welcome">W</span>
          	</c:if>
          	<c:if test="${memberInfo.member_level == 2 }">
          		<span class="level_span silver">S</span>
          	</c:if>
          	<c:if test="${memberInfo.member_level == 3 }">
          		<span class="level_span gold">G</span>
          	</c:if>
          	<c:if test="${memberInfo.member_level == 4 }">
          		<span class="level_span admin">A</span>
          	</c:if>
          	<fmt:formatNumber  value="${memberInfo.member_point}" type="number" var="point" />
          	<span style="margin-top: 10px;">${memberInfo.member_name }님</span>
          	<span style="margin-top: 30px;">현재 포인트</span>
          	<span style="font-size: 20px; font-weight: bold;">${point}원</span>
          </div>
          <ul>
            <li>
              <a href="${contextPath}/mypage/mypage.do">회원정보 수정</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/listMyOrderHistory.do">주문/배송</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/listMyPointHistory.do">쿠폰/포인트</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage04.do">회원/리뷰 관리</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myGymInfo.do">시설 관리</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage04.do">매출 관리</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/listMyBoardHistory.do?search_type=article">내 게시물 관리</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage06.do">1:1 문의 내역</a>
            </li>
          </ul>
          </c:when>
    </c:choose>
</nav>
</body>
</html>