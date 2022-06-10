<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myCartList"  value="${cartMap.myCartList}"  />
<c:set var="myGoodsList"  value="${cartMap.myGoodsList}"  />
<c:set var="nonCartList"  value="${non_cartMap.myCartList}"  />
<c:set var="nonGoodsList"  value="${non_cartMap.myGoodsList}"  />
<%
   request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/myCartList.css">
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function() {
	$("#cbx_chkAll").prop("checked", true);
	if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
	update_total();
	$("#cbx_chkAll").click(function() {
		if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
		update_total();
	});

	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;

		if(total != checked) $("#cbx_chkAll").prop("checked", false);
		else $("#cbx_chkAll").prop("checked", true);
		update_total();
	});
});

// 총 수량 총 합계 계산하기
function update_total(){
	var checked_item = $("input:checkbox[name='chk']:checked");
	var cnt;
	var goods_qty=0;
	var goods_price=0;
	for(var i=0; i < checked_item.length; i++){
		cnt = checked_item[i].getAttribute("value2");
		goods_qty = goods_qty + parseInt($('input[name="goods_qty'+cnt+'"]').val());
		goods_price = goods_price + parseInt($('input[name="goods_price'+cnt+'"]').val());
	}
	console.log(cnt+ ", " + goods_qty + ", " + goods_price);
	$("#total_goods_qty").text(goods_qty);
	goods_price = goods_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 금액 형태로 포맷
	$("#total_goods_price").text(goods_price);
}

// 상품 수량 수정하기
function change_qty(type,cart_id,cnt){
	var old_qty = $('input[name="goods_qty'+cnt+'"]').val();
	var new_qty = 0;
	if(type=='up'){
		new_qty = parseInt(old_qty)+1;
	}else if(type=='down'){
		if(old_qty==1){
			alert("최소 수량은 1개 입니다");
			return;
		}else{
		new_qty = parseInt(old_qty)-1;
		}
	}else if(type=='write'){
		if(old_qty==0){
			alert("최소 수량은 1개 입니다");
			return;
		}else{
		new_qty = parseInt(old_qty);
		}
	}
$.ajax({
	type : "post",
	async : false, //false인 경우 동기식으로 처리한다.
	url : "${contextPath}/cart/modifyCartQty.do",
	data : {
		cart_id:cart_id,
		cart_goods_qty:new_qty
	},
	
	success : function(data, textStatus) {
		//alert(data);
		if(data.trim()=='modify_success'){
			alert("수량을 변경했습니다!");
			location.reload();
		}else{
			alert("다시 시도해 주세요!");
			location.reload();
		}
		
	},
	error : function(data, textStatus) {
		alert("에러가 발생했습니다."+data);
	},
	complete : function(data, textStatus) {
		//alert("작업을완료 했습니다");
		
	}
});
}

// 회원 장바구니 비우기
function delete_all_item(){
	var all_item = $("input:checkbox[name='chk']");
	var cart_id = new Array();
	if(all_item.length == 0){
		alert("삭제할 상품이 존재하지 않습니다");
		return;
	}else{
		for(var i=0; i < all_item.length; i++){
		cart_id[i] = all_item[i].value;
		}
		delete_item(cart_id);
	}
}

//비회원 장바구니 비우기
function non_delete_all_item(){
	var all_item = $("input:checkbox[name='chk']");
	var cart_id = new Array();
	if(all_item.length == 0){
		alert("삭제할 상품이 존재하지 않습니다");
		return;
	}else{
		for(var i=0; i < all_item.length; i++){
			cart_id[i] = all_item[i].value;
		}
		delete_item(cart_id);
	}
}

//회원 선택된 장바구니 상품 삭제하기
function delete_check_item(){
	var checked_item = $("input:checkbox[name='chk']:checked");
	var cart_id = new Array();
	if(checked_item.length == 0){
		alert("상품을 선택해주세요!");
		return;
	}else{
		for(var i=0; i<checked_item.length; i++){
			cart_id[i] = checked_item[i].value;
		}
		delete_item(cart_id);
	}
}

//비회원 선택된 장바구니 상품 삭제하기
function non_delete_check_item(){
	var checked_item = $("input:checkbox[name='chk']:checked");
	var cart_id = new Array();

	if(checked_item.length == 0){
		alert("상품을 선택해주세요!");
		return;
	}else{
		for(var i=0; i<checked_item.length; i++){
			cart_id[i] = checked_item[i].value;
		}
		delete_item(cart_id);
	}
}

// 장바구니 상품 삭제하기
function delete_item(cart_id){
	    	
	    	var deleteCheck = confirm("장바구니에서 삭제하시겠습니까?");
     
	    	if(deleteCheck){
	    	$.ajax({
				type : "post",
				async : false, //false인 경우 동기식으로 처리한다.
				traditional : true,
				url : "${contextPath}/cart/removeCartGoods.do",
				data : {
					"cart_id":cart_id
				},				
				success : function(data, textStatus) {
			        //전송 처리 결과가 성공이면
					alert("삭제되었습니다");	
					location.reload();
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다."+data);
					location.reload();
				}
			}); }else {
	    		alert("취소하셨습니다");
	    		return false;
	    	}
}

// 개별 상품 주문하기
function order_each_goods(num){

	var order_check = confirm("상품을 주문하시겠습니까?");
	if(order_check){
		$("#each_order_form"+num).submit();
	}else{
		alert("취소하셨습니다");
		return false;
	}
}

// 선택된 상품 주문하기
function order_check_goods(){
	var checked_item = $("input:checkbox[name='chk']:checked");
	var cart_id = new Array();
	var goods_id = new Array();
	var goods_name = new Array();
	var goods_price = new Array();
	var option_name = new Array();
	var goods_qty = new Array();
	var fileName = new Array();
	var order_check = confirm("선택한 상품을 주문하시겠습니까?");
	if(order_check){
		for(var i=0; i < checked_item.length; i++){
			cart_id[i] = checked_item[i].value;
			cnt = checked_item[i].getAttribute("value2");
			goods_id[i] = $("#goods_id"+cnt).val();
			goods_name[i] = $("#goods_name"+cnt).val();
			goods_price[i] = parseInt($("#total_price"+cnt).val());
			option_name[i] = $("#option_name"+cnt).val();
			goods_qty[i] = parseInt($("#goods_qty"+cnt).val());
			fileName[i] = $("#fileName"+cnt).val();
			console.log(cart_id[i] ,goods_id[i], goods_name[i], goods_price[i], option_name[i], goods_qty[i], fileName[i]);
		}
		
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			traditional : true,
			url : "${contextPath}/order/orderCheckCartGoods.do",
			data : {
				cart_id:cart_id,
				goods_id:goods_id,
				goods_name:goods_name,
				goods_price:goods_price,
				option_name:option_name,
				goods_qty:goods_qty,
				fileName:fileName
			},				
			success : function(data, textStatus) {
				location.href='${contextPath}/order/orderGoodsForm.do';
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
				
			}
		});
		
	
	}else{
		alert("취소하셨습니다");
		return;
	}
}
</script>
</head>
<body>
<div class="cart_main_container">
	<div class="cart_first_text">
		<span id="bar"></span>
		<span>장바구니</span>
	</div>
	<c:if test="${not empty non_cartMap and empty memberInfo}">
		<table id="cart_table">
		<tr class="count_tr">
			<td colspan="7">일반상품 (${fn:length(nonCartList)})</td>
		</tr>
		<tr class="fixed_tr">
			<td><input type="checkbox" name="buy" id="cbx_chkAll" onclick=""></td>
			<td>상품정보</td>
			<td>판매금액</td>
			<td>적립금</td>
			<td>수량</td>
			<td>합계</td>
			<td>선택</td>
		</tr>
		<c:choose>
		<c:when test="${empty nonCartList}">
			<td colspan="7" style="height:200px;">장바구니에 담긴 상품이 없습니다.</td>
		</c:when>
		<c:otherwise>
		<c:forEach var="item" items="${nonGoodsList}" varStatus="cnt">
		<tr class="list_tr">
			<td width="50"><input type="checkbox" name="chk" value="${cnt.count-1}" value2="${cnt.count}" onclick=""></td>
			<td width="400">
				<div id="goods_info_div">
					<a href="${contextPath}/goods/goodsInfo.do?goods_id=${item.goods_id}">
						<img width="100" alt="${item.goods_fileName}" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
					</a>
					<div id="goods_info">
						<span id="goods_name_span">${item.goods_name }</span>
						<span id="option_name_span">옵션: ${nonCartList[cnt.count-1].option_name }</span>
					</div>
				</div>	
			</td>
			<fmt:formatNumber value="${item.goods_price + nonCartList[cnt.count-1].add_price}" type="number" var="goods_price" />
			<fmt:formatNumber value="${(item.goods_price + nonCartList[cnt.count-1].add_price)*0.01}" type="number" var="point" />
			<c:set var="cart_goods_qty" value="${nonCartList[cnt.count-1].goods_qty}" />
			<td>
			${goods_price}원
			<form id="each_order_form${cnt.count}" action="${contextPath}/order/orderEachGoods.do" method="post">
				<input type="hidden" name="cart_id" id="cart_id${cnt.count}" value="${nonCartList[cnt.count-1].cart_id}" />
				<input type="hidden" name="goods_id" id="goods_id${cnt.count}" value="${item.goods_id}" />
				<input type="hidden" name="goods_name" id="goods_name${cnt.count}" value="${item.goods_name}" />
				<input type="hidden" name="goods_qty" id="goods_qty${cnt.count}" value="${cart_goods_qty}" />
				<input type="hidden" name="option_name" id="option_name${cnt.count}" value="${nonCartList[cnt.count-1].option_name }" />
				<input type="hidden" name="total_price" id="total_price${cnt.count}" value="${(item.goods_price + nonCartList[cnt.count-1].add_price) * cart_goods_qty}" />
				<input type="hidden" name="fileName" id="fileName${cnt.count}" value="${item.goods_fileName}"/>
			</form>
			</td>
			<td><span id="point_i">적</span> ${point}원</td>
			<td>
				<button type="button" class="qty_change_btn" onclick="change_qty('down',${cnt.count-1},${cnt.count})">-</button>
				<input type="text" name="goods_qty${cnt.count}" class="goods_qty" maxlength="4" value="${cart_goods_qty}" onfocus="this.value='';return true;" onkeyup="change_qty('write',${cnt.count-1},${cnt.count})">
				<button type="button" class="qty_change_btn" onclick="change_qty('up',${cnt.count-1},${cnt.count})">+</button>
			</td>
			<fmt:formatNumber value="${(item.goods_price + nonCartList[cnt.count-1].add_price) * cart_goods_qty}" type="number" var="goods_total_price" />
			<td>
				${goods_total_price}원
				<input type="hidden" name="goods_price${cnt.count}" value="${(item.goods_price + nonCartList[cnt.count-1].add_price) * cart_goods_qty}" />
			</td>
			<td width="100">
				<div class="choose_btn_div">
					<button id="choose_order_btn" onclick="order_each_goods(${cnt.count})">주문하기</button>
					<button id="choose_del_btn" onclick="delete_item(${cnt.count-1})"><b>X</b> 삭제</button>
				</div>
			</td>
		</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
		<tr class="total_tr">
			<td colspan="7">
				<b>상품 수량: <span id="total_goods_qty"></span>개&nbsp;&nbsp;&nbsp;
				합계 금액: <span id="total_goods_price"></span>원</b>
			</td>
		</tr>
	</table>
	<div class="main_btn_div">
		<button type="button" onclick="non_delete_check_item()">선택 상품 삭제하기</button>
		<div>
			<button type="button" onclick="order_check_goods()">주문하기</button>
			<button type="button" onclick="non_delete_all_item()">장바구니 비우기</button>
		</div>
	</div>
	</c:if>
	<c:if test="${not empty memberInfo}">
	<table id="cart_table">
		<tr class="count_tr">
			<td colspan="7">일반상품 (${fn:length(myCartList)})</td>
		</tr>
		<tr class="fixed_tr">
			<td><input type="checkbox" name="buy" id="cbx_chkAll" onclick=""></td>
			<td>상품정보</td>
			<td>판매금액</td>
			<td>적립금</td>
			<td>수량</td>
			<td>합계</td>
			<td>선택</td>
		</tr>
		<c:choose>
		<c:when test="${empty myCartList}">
			<td colspan="7" style="height:200px;">장바구니에 담긴 상품이 없습니다.</td>
		</c:when>
		<c:otherwise>
		<c:forEach var="item" items="${myGoodsList}" varStatus="cnt">
		<tr class="list_tr">
			<td width="50"><input type="checkbox" name="chk" value="${myCartList[cnt.count-1].cart_id}" value2="${cnt.count}" onclick=""></td>
			<td width="400">
				<div id="goods_info_div">
					<a href="${contextPath}/goods/goodsInfo.do?goods_id=${item.goods_id}">
						<img width="100" alt="${item.goods_fileName}" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
					</a>
					<div id="goods_info">
						<span id="goods_name_span">${item.goods_name }</span>
						<span id="option_name_span">옵션: ${myCartList[cnt.count-1].option_name }</span>
					</div>
				</div>	
			</td>
			<fmt:formatNumber value="${item.goods_price + myCartList[cnt.count-1].add_price}" type="number" var="goods_price" />
			<fmt:formatNumber value="${(item.goods_price + myCartList[cnt.count-1].add_price)*0.01}" type="number" var="point" />
			<c:set var="cart_goods_qty" value="${myCartList[cnt.count-1].goods_qty}" />
			<td>
			${goods_price}원
			<form id="each_order_form${cnt.count}" action="${contextPath}/order/orderEachGoods.do" method="post">
				<input type="hidden" name="cart_id" id="cart_id${cnt.count}" value="${myCartList[cnt.count-1].cart_id}" />
				<input type="hidden" name="goods_id" id="goods_id${cnt.count}" value="${item.goods_id}" />
				<input type="hidden" name="goods_name" id="goods_name${cnt.count}" value="${item.goods_name}" />
				<input type="hidden" name="goods_qty" id="goods_qty${cnt.count}" value="${cart_goods_qty}" />
				<input type="hidden" name="option_name" id="option_name${cnt.count}" value="${myCartList[cnt.count-1].option_name }" />
				<input type="hidden" name="total_price" id="total_price${cnt.count}" value="${(item.goods_price + myCartList[cnt.count-1].add_price) * cart_goods_qty}" />
				<input type="hidden" name="fileName" id="fileName${cnt.count}" value="${item.goods_fileName}"/>
			</form>
			</td>
			<td><span id="point_i">적</span> ${point}원</td>
			<td>
				<button type="button" class="qty_change_btn" onclick="change_qty('down',${myCartList[cnt.count-1].cart_id},${cnt.count})">-</button>
				<input type="text" name="goods_qty${cnt.count}" class="goods_qty" maxlength="4" value="${cart_goods_qty}" onfocus="this.value='';return true;" onkeyup="change_qty('write',${myCartList[cnt.count-1].cart_id},${cnt.count})">
				<button type="button" class="qty_change_btn" onclick="change_qty('up',${myCartList[cnt.count-1].cart_id},${cnt.count})">+</button>
			</td>
			<fmt:formatNumber value="${(item.goods_price + myCartList[cnt.count-1].add_price) * cart_goods_qty}" type="number" var="goods_total_price" />
			<td>
				${goods_total_price}원
				<input type="hidden" name="goods_price${cnt.count}" value="${(item.goods_price + myCartList[cnt.count-1].add_price) * cart_goods_qty}" />
			</td>
			<td width="100">
				<div class="choose_btn_div">
					<button id="choose_order_btn" onclick="order_each_goods(${cnt.count})">주문하기</button>
					<button id="choose_del_btn" onclick="delete_item(${myCartList[cnt.count-1].cart_id})"><b>X</b> 삭제</button>
				</div>
			</td>
		</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
		<tr class="total_tr">
			<td colspan="7">
				<b>상품 수량: <span id="total_goods_qty"></span>개&nbsp;&nbsp;&nbsp;
				합계 금액: <span id="total_goods_price"></span>원</b>
			</td>
		</tr>
	</table>
	<div class="main_btn_div">
		<button type="button" onclick="delete_check_item()">선택 상품 삭제하기</button>
		<div>
			<button type="button" onclick="order_check_goods()">주문하기</button>
			<button type="button" onclick="delete_all_item()">장바구니 비우기</button>
		</div>
	</div>
	</c:if>
</div>
</body>
</html>