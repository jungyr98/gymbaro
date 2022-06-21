<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	
function drawVisualization() {
	var memberCount1 = $('input[name="memberCount1"]').val();
	var memberCount2 = $('input[name="memberCount2"]').val();
	var memberCount3 = $('input[name="memberCount3"]').val();
	var total_date1 = $('input[name="total_date1"]').val();
	var total_date2 = $('input[name="total_date2"]').val();
	var orderCount1 = $('input[name="orderCount1"]').val();
	var orderCount2 = $('input[name="orderCount2"]').val();
	var membershipCount1 = $('input[name="membershipCount1"]').val();
	var membershipCount2 = $('input[name="membershipCount2"]').val();
	var total_price1 = $('input[name="total_price1"]').val();
	var total_price2 = $('input[name="total_price2"]').val();

	var orderCount = $('input[name="orderCount"]');

	var membershipCount = $('input[name="membershipCount"]');

	var memberCount = $('input[name="memberCount"]');
	
	var data = google.visualization.arrayToDataTable([
		['Month', '회원', '주문', '예약', '결제'],
		['2022/03', 0, 0, 0, 0],
		['2022/04', parseInt(memberCount3)*100000, 0, 0, 0],
		[total_date1, parseInt(memberCount1)*100000, parseInt(orderCount1)*10000, parseInt(membershipCount1)*100000, total_price1],
		[total_date2, parseInt(memberCount2)*100000, parseInt(orderCount2)*10000, parseInt(membershipCount2)*100000, total_price2]
	]);
	var options = {
		title : "",
		vAxis: {title: ''},
		hAxis: {title: 'Month'},
		seriesType: 'bars',
		series: {4: {type: 'line'}}
	};
	
	var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	chart.draw(data, options);
}
</script>
<style type="text/css">

body {
	font-family: 'Noto Sans KR', sans-serif;
}

#admin_main_box #location_box {
    display: flex;
    align-items: center;
}
#admin_main_box #todo_list_box {
    margin: 30px 0px;
}

#admin_main_box #todo_order_table {
    width: 1200px;
    height: 100px;
    text-align: center;
    border: 1px solid #ddd;
    margin-top:10px;
}

#admin_main_box #todo_shopping_box {
	width: 1200px;
	display:flex;
	justify-content:space-between;
	height:500px;
	margin-top:10px;
}

#admin_main_box #chart_div {
	width: 1200px;
	border: 1px solid #ddd;
}

#admin_main_box #text_div {
	width: 810px;
	display:flex;
	justify-content:space-between;
	margin:30px 0px;
}

#admin_main_box #todo_goods_table {
	width:490px;
	border: 1px solid #ddd;
	text-align: center;
}

#admin_main_box #fixed_tr {
	background:#f0f0f0;
}

#admin_main_box #value_tr {
	color:#0078FF;
}
</style>
</head>
<body>
<div id="admin_main_box">
	<c:forEach var="item" items="${totalMap.memberCountList }" varStatus="cnt">
		<input type="hidden" name="memberCount${cnt.count}" value="${item.count}" />
		<input type="hidden" name="memberDate${cnt.count}" value="${item.date}" />
	</c:forEach>
	<c:forEach var="item" items="${totalMap.orderCountList }" varStatus="cnt">
		<input type="hidden" name="orderCount${cnt.count}" value="${item.count}" />
		<input type="hidden" name="orderDate${cnt.count}" value="${item.date}" />
	</c:forEach>
	<c:forEach var="item" items="${totalMap.membershipCountList }" varStatus="cnt">
		<input type="hidden" name="membershipCount${cnt.count}" value="${item.count}" />
		<input type="hidden" name="membershipDate${cnt.count}" value="${item.date}" />
	</c:forEach>
	<c:forEach var="item" items="${totalMap.allSalesList }" varStatus="cnt">
		<input type="hidden" name="total_price${cnt.count}" value="${item.total_price}" />
		<input type="hidden" name="total_date${cnt.count}" value="${item.date}" />
	</c:forEach>
	 
	<div id="todo_list_box">
		
	</div>
	
	<div id="text_div">
		<span style="font-size:20px;"><img width="20" alt="logo.png" src="${contextPath}/resources/image/minus.jpg">&nbsp;&nbsp;쇼핑몰 월별 현황</span>
	</div>
	<div id="todo_shopping_box">
		<div id="chart_div">
		</div>
		<!-- 
		<table id="todo_goods_table">
			<tr id="fixed_tr">
				<td>상품명</td>
				<td>판매수량</td>
				<td>판매액</td>
				<td>카테고리</td>
			</tr>
			<tr>
				<td>아리프 옥타곤 아령</td>
				<td>124개</td>
				<td>360,100</td>
				<td>헬스</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
		 -->
	</div>
</div>
</body>
</html>