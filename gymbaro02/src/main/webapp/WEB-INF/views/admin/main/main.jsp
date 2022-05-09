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
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	
function drawVisualization() {
	var data = google.visualization.arrayToDataTable([
		['Month', '회원', '주문', '예약', '결제'],
		['2004/05', 165, 938, 522, 998],
		['2004/06', 135, 1120, 599, 1268],
		['2004/07', 157, 1167, 587, 807],
		['2004/08', 139, 1110, 615, 968],
		['2004/09', 136, 691, 629, 1026]
	]);
	var options = {
		title : "",
		vAxis: {title: ''},
		hAxis: {title: 'Month'},
		seriesType: 'bars',
		series: {5: {type: 'line'}}
	};
	
	var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	chart.draw(data, options);
}
</script>
<style type="text/css">

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
	height:200px;
	margin-top:10px;
}

#admin_main_box #chart_div {
	width: 700px;
	border: 1px solid #ddd;
}

#admin_main_box #text_div {
	width: 810px;
	display:flex;
	justify-content:space-between;
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
	<div id="location_box">
		<span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;HOME
		<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>관리자 메인
	</div>
	<div id="todo_list_box">
		<span><img width="14" alt="logo.png" src="${contextPath}/resources/image/minus.jpg">&nbsp;오늘의 할 일</span>
		<table id="todo_order_table">
			<tr id="fixed_tr">
				<td>입금전</td>
				<td>입금완료</td>
				<td>취소<br>신청/완료</td>
				<td>교환<br>신청/완료</td>
				<td>반품<br>신청/완료</td>
				<td>배송준비중</td>
				<td>배송중</td>
				<td>배송완료</td>
			</tr>
			<tr id="value_tr">
				<td>0</td>
				<td>0</td>
				<td>0 / 0</td>
				<td>0 / 0</td>
				<td>0 / 0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
		</table>
	</div>
	<div id="text_div">
		<span><img width="14" alt="logo.png" src="${contextPath}/resources/image/minus.jpg">&nbsp;쇼핑몰 현황</span>
		<span><img width="14" alt="logo.png" src="${contextPath}/resources/image/minus.jpg">&nbsp;상품 판매 순위</span>
	</div>
	<div id="todo_shopping_box">
		<div id="chart_div">
		</div>
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
	</div>
</div>
</body>
</html>