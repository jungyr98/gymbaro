<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}

#side_main_box {
    border-top: none;
    height: 100vw;
    padding:10px;
    color:white;
    background: #212529;
}

#side_main_box #shop_name_box {
    border-radius: 5px;
    padding: 5px;
    margin-bottom: 20px;
}

#side_main_box #shop_total_box {
    border-radius: 5px;
    padding: 5px;
    display: flex;
    flex-direction: column;
    justify-content: space-around;
}

#side_main_box #fixed_span {
	font-weight:bold;
	margin-right: 10px;
}

#shop_total_box a {
	text-decoration:none;
	color:#8E9294;
	font-size: 16px;
    font-weight: bold;
    display:flex;
    margin:10px 0px;
    transition:0.2s;
}

#shop_total_box span{
	color:#595C5F;
	margin-right:10px;
}

#shop_total_box a:hover {
	color:white;
}

#shop_total_box .side_sub_menu {
    font-weight: bold;
    margin: 10px 0px;
}

#shop_total_box #side_main_menu {
	display:flex;
	justify-content:space-around;
	align-items:center;
	color:white;
	margin: 10px 0px 20px 0px;
}

#shop_total_box #side_main_menu a {
	font-size:22px;
}

#shop_total_box #side_main_menu a span {
	color:white;
}

#shop_total_box #side_top_menu a {
	display:inline-block;
	font-size:24px;
	color:white;
}

#shop_total_box #side_top_menu {
	text-align:center;
	border-bottom: 2px solid black;
    padding-bottom: 20px;
    margin-bottom: 20px;
}
</style>
</head>
<body>
<div id="side_main_box">
	<div id="shop_total_box">
		<div id="side_top_menu">
			<a href="${contextPath}/admin/main/main.do">관리자 모드</a>
		</div>
		<div id="side_main_menu">
			<a href="${contextPath}/main/main.do"><span class="glyphicon glyphicon-home"></span></a>
			<a href="${contextPath}/goods/searchGoods.do"><span class="glyphicon glyphicon-shopping-cart"></span></a>
			<a href="${contextPath}/member/logout.do"><span class="glyphicon glyphicon-log-out"></span></a>
		</div>
		<span class="side_sub_menu">common</span>
		<a href="#"><span class="glyphicon glyphicon-cog"></span>기본 설정</a>
		<a href="#"><span class="glyphicon glyphicon-stats"></span>매출 관리</a>
		<br>
		<span class="side_sub_menu">member</span>
		<a href="${contextPath}/admin/gym/selectGymList.do"><span class="glyphicon glyphicon-home"></span>시설 관리</a>
       	<a href="${contextPath}/admin/member/selectMemberList.do"><span class="glyphicon glyphicon-user"></span>회원 관리</a>
       	<br>
       	<span class="side_sub_menu">shop</span>
       	<a href="${contextPath}/admin/goods/selectGoodsList.do"><span class="glyphicon glyphicon-tag"></span>상품 관리</a>
       	<a href="${contextPath}/admin/order/selectOrderList.do"><span class="glyphicon glyphicon-shopping-cart"></span>주문 관리</a>
       	<a href="${contextPath}/admin/membership/listMembership.do"><span class="glyphicon glyphicon-calendar"></span>예약 관리</a>
       	<a href="#"><span class="glyphicon glyphicon-edit"></span>게시물 관리</a>
        <a href="#"><span class="glyphicon glyphicon-gift"></span>이벤트 관리</a>
	</div>
</div>
</body>
</html>