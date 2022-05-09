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
<title>Insert title here</title>
<style type="text/css">
#side_main_box {
    border: 1px solid #ddd;
    border-top: none;
    height: 500px;
    padding:10px;
}

#side_main_box #shop_name_box {
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 5px;
    margin-bottom: 20px;
}

#side_main_box #shop_total_box {
	border: 1px solid #ddd;
    border-radius: 5px;
    padding: 5px;
    margin-bottom: 20px;
    height: 120px;
    display: flex;
    flex-direction: column;
    justify-content: space-around;
}

#side_main_box #fixed_span {
	color:#0078FF;
	font-weight:bold;
	margin-right: 10px;
}
</style>
</head>
<body>
<div id="side_main_box">
	<div id="shop_name_box">
		<span>짐바로</span><br>
		<span>http://gymbaro.co.kr</span>
	</div>
	<div id="shop_total_box">
		<div>
			<span id="fixed_span">총 회원</span>
			<span>100명</span>
		</div>
		<div>
			<span id="fixed_span">총 상품</span>
			<span>100개</span>
		</div>
		<div>
			<span id="fixed_span">총 예약</span>
			<span>100개</span>
		</div>
		<div>
			<span id="fixed_span">총 주문</span>
			<span>100개</span>
		</div>
	</div>
</div>
</body>
</html>