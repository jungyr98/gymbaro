<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="discount_name" value="${((goodsVO.goods_price-goodsVO.goods_discount)/goodsVO.goods_price)*100}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/goodsInfo.css">
<title>Insert title here</title>
<style>
#layer {
	z-index: 2;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	background-color:rgba(0,0,0,0.8);
}

#popup {
	z-index: 3;
	position: fixed;
	left: 50%;
	top: 50%;
	width: 361px;
	margin-left:-10%;
	height: 300px;
	margin-top:-150px;
	background-color: white;
	border:1px solid #d1d8dd;
	box-shadow:0 0 6px 1px rgb(0 0 0 / 30%);
}

#close {
	z-index: 4;
	float: right;
	margin-top: 23px;
    margin-right: 14px;
    width: 15px;
}

#cartcontents{
	font-weight: 700;
    font-size: 20px;
    margin-right: 175px;
}

.seeCart{
	
	color: white;
    border: none;
    background-color: #184798;
    width: 152px;
    height: 35px;
    float: right;
    margin-right: 20px;
}

.seeCart2{
	
	color: #424040;
    border: none;
    width: 152px;
    height: 35px;
    float: right;
    margin-right: 20px;
}

#seecartform{
	padding-top: 2px solid #424040;
}


.goodsInfo_box .title{
	text-align: center;
	cursor:pointer;
}
.goodsInfo_box .conts{
text-align: left;
    float: inherit;
margin-left: 10px; 
padding:30px;
height:auto;
}
.goodsInfo_box .conts td{
height: 75px;
    display: flex;
    align-items: center;
}
.goodsInfo_box .conts tr{
display: flex;
    width: 900px;
    height: 75px;
    border-top: 1px solid #eee;
}
.goodsInfo_box #goods_cs_button{
	float:right;
  	appearance: none;
	background-color:#184798;
	color:white;
	margin: 0;
  padding: 0.5rem 1rem;
  font-family: "Noto Sans KR", sans-serif;
  font-size: 1.6rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  width: auto;
  border: none;
  border-radius: 4px;
}
.goodsInfo_box .update_btn{
font:initial;
height:25px;
  	appearance: none;
	background-color:#f0f0f0;
	color:#424040;
	font-size: 1.4rem;
  padding: 0.5rem 1rem;
  display: inline-block;
  border: none;
  border-radius: 4px;
}
.goodsInfo_box .delete_btn{
font:initial;
height:25px;
  	appearance: none;
	background-color:#f0f0f0;
	color:#424040;
	font-size: 1.4rem;
  padding: 0.5rem 1rem;
  display: inline-block;
  border: none;
  border-radius: 4px;
}

.goodsInfo_box p{
	display: inline;
}

.goodsInfo_box .cs_img{
	width:32px; 
	margin:10px;
}

.img-score {
    display: inline-block;
    width: 60px;
    height: 12px;
    background: url(https://image.msscdn.net/skin/musinsa/images/icon_star_score.png) no-repeat;
    overflow: hidden;
    vertical-align: middle;
    margin-right:5px;
}

.img-score .bar {
    display: block;
    height: 100%;
    background: url(https://image.msscdn.net/skin/musinsa/images/icon_star_score.png) no-repeat 0 -120px;
}
</style>
<script type="text/javascript">

//리뷰 글자수 제한
$(function(e) { 
$('#goods_review_input').keyup(function (e) {
	let content = $(this).val();
		if (content.length == 0 || content == '') {
			$('.text_count').text('0');	
		} else {
			$('.text_count').text(content.length);
		}	
		if (content.length > 200) {
			$(this).val($(this).val().substring(0, 200));
			alert('리뷰는 200자까지 입력할 수 있습니다!');
			$('.text_count').text('200');
		};
});
});

// 옵션 체인지 부분
var selectBoxChange_option = function(value){
	
	$('input[type="number"]').val(1);
	var qty = $('input[type="number"]').val();
	
	var value1 = value;
	var value2 = $("#optionSelectedBox > option:selected").attr("value2");
	var value3 = $("#optionSelectedBox > option:selected").attr("value3");
	var goods_price = $('input[name="goods_price"]').val();
	
	if(value3==1){
		$('#select_option_price').text(0+"원");
		$('#total_price').text(0+"원");
		return;
	}
	
	$('.option_name').val(value1);
	$('#select_option_name').text(value1);
	value3 = (parseInt(value3)+parseInt(goods_price)) * qty;
	$('.total_price').val(value3);
	value3 = value3.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$('#select_option_price').text(value3+"원");
	$('#total_price').text(value3 + "원");
}

// 수령 변경시 총 금액 체인지 부분
var numberBoxChange = function(value){
	var value3 = $("#optionSelectedBox > option:selected").attr("value3");
	var goods_price = $('input[name="goods_price"]').val();
	var goods_amount = $('input[name="hidden_goods_amount"]').val();
	var total_price = (parseInt(value3)+parseInt(goods_price)) * value;
	if(value3==1){
		alert("옵션을 선택해주세요!");
		$('input[type="number"]').val(1);
		return;
	}else if(value > parseInt(goods_amount)){
		alert("구매 가능 수량을 초과하였습니다!");
		$('input[type="number"]').val(parseInt(goods_amount));
		total_price = (parseInt(value3)+parseInt(goods_price)) * goods_amount;
		$('#select_option_price').text(total_price+"원");
	}
	$('.goods_qty').val(value);
	$('.total_price').val(total_price);
	total_price = total_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$('#select_option_price').text(total_price+"원");
	$('#total_price').text(total_price+"원");
}

//장바구니 추가
function add_cart(goods_id) {
	var goods_qty = $('input[name=goods_qty]').val();
	var option_name = $('input[name=option_name]').val();
	var add_price = $("#optionSelectedBox > option:selected").attr("value3");
	console.log(add_price);
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/cart/addGoodsInCart.do",
		data : {
			goods_id:goods_id,
			goods_qty:goods_qty,
			option_name:option_name,
			add_price:add_price
		},
		success : function(data, textStatus) {
			//alert(data);
		//	$('#message').append(data);
			if(data.trim()=='add_success'){
				imagePopup('open', '.layer01');	
			}else if(data.trim()=='already_existed'){
				alert("이미 카트에 등록된 상품입니다.");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
		}
	}); //end ajax	
}

function imagePopup(type) {
	if (type == 'open') {
		// 팝업창을 연다.
		jQuery('#layer').attr('style', 'visibility:visible');

		// 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
		jQuery('#layer').height(jQuery(document).height());
	}

	else if (type == 'close') {

		// 팝업창을 닫는다.
		jQuery('#layer').attr('style', 'visibility:hidden');
	}
}


function login_yn(isLogOn, goods_id){
	if(isLogOn != '' && isLogOn != 'false'){
		location.href = '${contextPath}/cs/personalQ.do';
	}else{
		var notlogin = confirm("로그인 후 문의 글 작성이 가능합니다.");
		location.href = '${contextPath}/member/loginForm.do?mode=common&goods_id='+goods_id;
	}
}

$(function () {

	$('#contents tr').hide(); // class가 contents인  tr을 모두 감춘다.  펼쳐질 내용을 감춰두기위한 작업
	$('#contents').find('.title').parent().show();// class가 title인 td가 속한 tr을  보이기위한 작업(parent는 상위를 의미한다.) 
	
	$('#contents .title').parent().click(function(){ // class가 title인 td가 속한 tr을 클릭하면 함수 실행
	$('#contents tr').hide(); 
	$('#contents').find('.title').parent().show();
	
	var tr = $('#contents tr'); 
	var rindex = $(this).parent().children().index(this); //클릭한 tr의 인덱스를 찾아 변수에 저장
	$(this).children(); // 클릭한 tr(제목)에만 배경색을 회색으로 지정
	for(var i = rindex; i < rindex + 3; i++){ //클릭한 tr의 다음(1이면 2) tr 인덱스를 찾기위한 작업
	$(tr[i]).show(); //찾아낸 인덱스 tr을 보이기위한 작업
}
});
});

function cs_delete_check(){
	var check = confirm("삭제하시겠습니까?");
	if(check){
		return true;
	}else{
		return false;
	}
}

// 리뷰 쓰기 유효성 평가
function review_check() {
	// 빈칸 입력 불가 및 별점 체크 유효성 체크
	var content = $("#goods_review_input").val();
	var score = $('input[name="score"]').is(':checked');
	if(content == ''){
		alert("내용을 입력해주세요!");
		return false;
	}else if(score == false){
		alert("별점을 선택해주세요!");
		return false;
	}else{
		var review_submit_check = confirm('리뷰를 등록하시겠습니까?');
		if (review_submit_check == true) {
			alert('리뷰가 등록되었습니다!');
			return true;
		} else {
			alert('리뷰 작성이 취소되었습니다.');
			return false;
		}
	}	
}

// 회원 주문하기 submit
function order_check(){
	var orderForm = $(".gym_submit_btn_box");
	var goods_qty = $("#goods_num").val();
	var value3 = $("#optionSelectedBox > option:selected").attr("value3");
	var member_yn = $('input[name="member_yn"]').val();
	var goods_id = $('input[name="goods_id"]').val();
	if(value3==1){
		alert("옵션을 선택해주세요!");
		return;
	}else if(member_yn == 'N'){
		alert("로그인이 필요한 서비스입니다!");
		location.href = "${contextPath}/member/loginForm.do?mode=common&goods_id="+goods_id;
		return;
	}else if(goods_qty == 0){
		alert("최소 수량을 1개 이상 선택해주세요!")
		return false;
	}else{
		var check = confirm("주문하시겠습니까?");
		if(check){
			orderForm.submit();
		}else{
			alert("취소하셨습니다");
			return;
		}
	}
}

// 비회원 주문하기 submit
function nonMember_submit() {
	var orderForm = $(".gym_submit_btn_box");
	var check = confirm("비회원으로 주문하시겠습니까?");
	var value3 = $("#optionSelectedBox > option:selected").attr("value3");
	if(value3==1){
		alert("옵션을 선택해주세요!");
		return;
	}else{
		if(check){
			orderForm.submit();
		}else{
			alert("취소하셨습니다");
			return;
		}
	}
}
</script>
</head>
<body>
<div class="goodsInfo_box main_container">
	<div class="gym_info_header_box">
		<c:if test="${empty memberInfo}">
			<input type="hidden" name="member_yn" value="N">
		</c:if>
		<c:if test="${not empty memberInfo}">
			<input type="hidden" name="member_yn" value="Y">
		</c:if>
		<div class="gym_info_header_img">
		<img alt="HTML5 &amp; CSS3"
				src="${contextPath}/thumbnails.do?goods_id=${goodsVO.goods_id}&fileName=${goodsVO.goods_fileName}">
			<!--  <img src="${contextPath}/resources/image/dumbell.png" alt="gym_01.PNG"> -->
		</div>
		<div class="gym_info_header_text">
			<span class="gym_info_header_title">${goodsVO.goods_name}</span>
			<div class="gym_stars_box">
				<span class="img-score">
						<c:if test="${scoreAvg > 4.5}">
							<span class="bar" style="width: 100%"></span>
						</c:if>
						<c:if test="${scoreAvg <= 4.5 and scoreAvg > 4}">
							<span class="bar" style="width: 90%"></span>
						</c:if>
						<c:if test="${scoreAvg <= 4 and scoreAvg > 3.5}">
							<span class="bar" style="width: 80%"></span>
						</c:if>
						<c:if test="${scoreAvg <= 3.5 and scoreAvg > 3}">
							<span class="bar" style="width: 70%"></span>
						</c:if>
						<c:if test="${scoreAvg <= 3 and scoreAvg > 2.5}">
							<span class="bar" style="width: 60%"></span>
						</c:if>
						<c:if test="${scoreAvg <= 2.5 and scoreAvg > 2}">
							<span class="bar" style="width: 50%"></span>
						</c:if>
						<c:if test="${scoreAvg <= 2 and scoreAvg > 1.5}">
							<span class="bar" style="width: 40%"></span>
						</c:if>
						<c:if test="${scoreAvg <= 1.5 and scoreAvg > 1}">
							<span class="bar" style="width: 30%"></span>
						</c:if>
						<c:if test="${scoreAvg <= 1 and scoreAvg > 0.5}">
							<span class="bar" style="width: 20%"></span>
						</c:if>
						<c:if test="${scoreAvg <= 0.5 and scoreAvg > 0}">
							<span class="bar" style="width: 10%"></span>
						</c:if>
						<c:if test="${scoreAvg == 0}">
							<span class="bar" style="width: 0%"></span>
						</c:if>
					</span>	
				<span id="scoreAvg"> ${scoreAvg}</span>
			</div>
			<div class="gym_location_box">
				<div class="goods_sale_price_box">
					<span>판매가</span>
					<fmt:formatNumber  value="${goodsVO.goods_price}" type="number" var="goods_price" />
					<fmt:formatNumber  value="${goodsVO.goods_discount}" type="number" var="goods_discount" />
					<fmt:parseNumber var="discount" integerOnly= "true" value= "${discount_name}" />
					<c:choose>
						<c:when test="${goods_discount eq '0'}">
							<span>${goods_price}원</span>
							<input type="hidden" name="goods_price" value="${goodsVO.goods_price}" />
						</c:when>
						<c:otherwise>
							<span>
								<b>${goods_discount}원</b>&nbsp;<strike>${goods_price}원</strike>
								<b><span style="color:#184798;font-size:16px;">%${discount}</span></b>&nbsp;
							</span>
							<input type="hidden" name="goods_price" value="${goodsVO.goods_discount}" />
						</c:otherwise>
					</c:choose>
				</div>
				<div class="goods_plus_price_box">
					<span>배송비</span>
					<span>무료</span>
				</div>
				<div class="goods_point_info_box">
					<span>포인트</span>
					<span>1%</span>
				</div>
				<div class="goods_point_info_box" style="color:#c4c4c4;">
					<span>남은 재고</span>
					<span>${goodsVO.goods_amount }개</span>
					<input type="hidden" name="hidden_goods_amount" value="${goodsVO.goods_amount }" />
				</div>
			</div>
			<div class="gym_option_box">
				<span>옵션 선택</span>
				<select id="optionSelectedBox" onChange="selectBoxChange_option(this.value);" >
					<option value="옵션 선택" value2="0원" value3="1">옵션 선택</option>
				  <c:forEach var="option" items="${optionList}" >
				  <fmt:formatNumber  value="${option.price}" type="number" var="price" />
					<option value="${option.option_name }" value2="${price }원" value3="${option.price}">${option.option_name } (+${price}원)</option>
				  </c:forEach>
				</select>
				<div class="goods_num_box">
					<span id="select_option_name">선택한 옵션명</span>
					<input type="number" name="goods_num" id="goods_num" min="1" value="1" onChange="numberBoxChange(this.value);">
					<span id="select_option_price"></span>
				</div>
				<div class="goods_total_price">
					<span>총 합계 금액</span>
					<span id="total_price">0원</span>
				</div>
				<form class="gym_submit_btn_box" action="${contextPath}/order/orderEachGoods.do" method="post">
					<input type="hidden" name="goods_id" value="${goodsVO.goods_id}" />
					<input type="hidden" name="goods_name" value="${goodsVO.goods_name}" />
					<input type="hidden" name="option_name" class="option_name" />
					<input type="hidden" name="goods_qty" class="goods_qty" value="1" />
					<input type="hidden" name="total_price" class="total_price" />
					<input type="hidden" name="fileName" value="${goodsVO.goods_fileName}">
					<input type="button" class="option_submit_btn go_cart_btn" value="장바구니" onClick="add_cart('${goodsVO.goods_id}')">
					<input type="button" class="option_submit_btn go_order_btn" value="구매하기" onclick="order_check()">
					<c:if test="${empty memberInfo}">
						<input type="button" class="option_submit_btn" value="비회원 구매하기" onclick="nonMember_submit()">
					</c:if>
				</form>
			</div>
		</div>
	</div>
	
	 <div class="myPage03_box tab_menu">
     	<div class="first_content">
          <div class="tab_btn">
               <ul>
               <c:if test="${tab eq 'info'}">
                    <li class="active"><a href="${contextPath}/goods/goodsInfo.do?tab=info&goods_id=${goodsVO.goods_id}">상세 정보</a></li>
                    <li><a href="${contextPath}/goods/goodsInfo.do?tab=review&goods_id=${goodsVO.goods_id}">이용후기(${reviewCount})</a></li>
                    <li><a href="${contextPath}/goods/goodsInfo.do?tab=cs&goods_id=${goodsVO.goods_id}">상품 문의(${fn:length(goodsCsList)})</a></li>
               </c:if>
               <c:if test="${tab eq 'review'}">
                    <li><a href="${contextPath}/goods/goodsInfo.do?tab=info&goods_id=${goodsVO.goods_id}">상세 정보</a></li>
                    <li class="active"><a href="${contextPath}/goods/goodsInfo.do?tab=review&goods_id=${goodsVO.goods_id}">이용후기(${reviewCount})</a></li>
                    <li><a href="${contextPath}/goods/goodsInfo.do?tab=cs&goods_id=${goodsVO.goods_id}">상품 문의(${fn:length(goodsCsList)})</a></li>
               </c:if>
               <c:if test="${tab eq 'cs'}">
                    <li><a href="${contextPath}/goods/goodsInfo.do?tab=info&goods_id=${goodsVO.goods_id}">상세 정보</a></li>
                    <li><a href="${contextPath}/goods/goodsInfo.do?tab=review&goods_id=${goodsVO.goods_id}">이용후기(${reviewCount})</a></li>
                    <li class="active"><a href="${contextPath}/goods/goodsInfo.do?tab=cs&goods_id=${goodsVO.goods_id}">상품 문의(${fn:length(goodsCsList)})</a></li>
               </c:if>
               </ul>               
          </div>
          <div class="tab_cont">
          	   <c:if test="${tab eq 'info'}">
               <div class="active gymsInfo_first_tab_box">
					<div class="info_content gymsInfo_priceInfo_box">
						<c:forEach var="image" items="${imageList }">
							<img class="goods_detail_img" src="${contextPath}/download.do?goods_id=${goodsVO.goods_id}&fileName=${image.fileName}">
						</c:forEach>
					</div>
					<div class="gymsInfo_img_box">
						<img src="${contextPath}/resources/image/goods_info_2.PNG" alt="goods_info_2.PNG">
					</div>
					<div class="gymsInfo_img_box">
						<img src="${contextPath}/resources/image/goods_info_3.PNG" alt="goods_info_3.PNG">
					</div>
               </div>
               </c:if>
                <!-- 상품 후기 -->  
                <c:if test="${tab eq 'review'}">  
                <div class="gymsInfo_div" id="goodsReview">
					<div class="gymsInfo_review_box">
						<div class="gym_review_box">
							<div class="gym_review_box_title">
								<span>구매 후기</span>
							</div>
							<div class="gym_review_star_box">
								<div class="star_sum_box">
									⭐ ${scoreAvg}
								</div>
								<div class="star_info_box">
									<div>아주 좋아요 ⭐⭐⭐⭐⭐</div>
									<div>맘에 들어요 ⭐⭐⭐⭐</div>
									<div>보통이에요&nbsp; ⭐⭐⭐</div>
									<div>그냥 그래요 ⭐⭐</div>
									<div>별로예요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;⭐</div>
								</div>
								<div class="star_count_box">
									<div>(${countScore5})</div>
									<div>(${countScore4})</div>
									<div>(${countScore3})</div>
									<div>(${countScore2})</div>
									<div>(${countScore1})</div>
								</div>
							</div>
							
	    		<!-- 상품 후기 작성 시작 -->
							<c:if test="${memberInfo != null && reviewState == 'N'}"> 
							<form action="${contextPath}/goods/addNewReview.do" method="post" id="score" onsubmit="return review_check();">
							<div class="gym_review_box_title">
								<span>후기 작성하기</span>
							</div>
						
				<!-- 상품 별점 입력 칸 -->
							<div class="select_score">
								<fieldset>
										<input type="radio" name="score" value="5" id="rate1"><label for="rate1">★</label>
										<input type="radio" name="score" value="4" id="rate2"><label for="rate2">★</label>
										<input type="radio" name="score" value="3" id="rate3"><label for="rate3">★</label>
										<input type="radio" name="score" value="2" id="rate4"><label for="rate4">★</label>
										<input type="radio" name="score" value="1" id="rate5"><label for="rate5">★</label>	
								</fieldset>
							</div>
							
			   <!-- 상품 후기 등록 버튼 -->
							<div id="review_submit">
								<input type="hidden" name="goods_id" value="${goodsVO.goods_id}">
								<input type="hidden" name="uid" value="${memberInfo.uid}">
								<input type="hidden" name="order_id" value="${myOrder_id}">
								<input type="hidden" name="option_name" value="${myOption_name}">
								<button type="submit" id="review_submit_btn">구매후기 등록</button>
							</div>
							
			   <!-- 상품 후기 텍스트 압력 칸 -->	
							<div class="review_write">
								<div class="review_length">
									<span class="text_count">0</span> 
									<span>/ 200자</span>
								</div>
								<textarea name="content" id="goods_review_input" placeholder="구매 후기를 입력하세요."></textarea>
							</div>
							</form>
							</c:if>
						
				<!-- 상품 후기 전체 출력 -->	
							<c:forEach var="goodsReview" items="${viewAll}">
							<div class="user_review_list_box">
								<div class="user_info_box">
								<div class="user_level">
							
							<!-- 회원 등급 표시 -->
							<c:choose>
								<c:when test="${goodsReview.member_level == 1}">
										<span id="user_level_welcome">welcome</span>
								</c:when>
								<c:when test="${goodsReview.member_level == 2}">
										<span id="user_level_silver">Silver</span>
								</c:when>
								<c:when test="${goodsReview.member_level == 3}">
										<span id="user_level_gold">Gold</span>
								</c:when>
								<c:otherwise>
										<span id="user_level_admin">관리자</span>
								</c:otherwise>
								</c:choose> 
								</div>
								
								<!-- 회원별 부여한 별점 출력 -->
									<div class="user_info">
										<c:choose>
											<c:when test="${goodsReview.score == 1 }">
											⭐
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${goodsReview.score == 2 }">
											⭐⭐
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${goodsReview.score == 3 }">
											⭐⭐⭐
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${goodsReview.score == 4 }">
											⭐⭐⭐⭐
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${goodsReview.score == 5 }">
											⭐⭐⭐⭐⭐
											</c:when>
										</c:choose>
										 <div>
										 	<span class="review_user_name">${goodsReview.review_writer}</span>
										 	<span class="review_write_date"><fmt:formatDate value="${goodsReview.regDate}" pattern="YYYY-MM-dd"></fmt:formatDate></span>
										 </div>
									</div>
								</div>
								<div class="user_review_content">
									<span>${goodsReview.content}</span>
								</div>
							</div>
							</c:forEach>
										
							<br><br>							
						</div>
					</div>
               </div>
               </c:if>
               
				<!-- 상품문의 -->
			   <c:if test="${tab eq 'cs'}">
               <div class="gymsInfo_div">
					<div class="gymsInfo_img_box">
					
					<div class="button_box"><!--문의하기 버튼-->
					<span>상품문의(${fn:length(goodsCsList)})</span>
					<c:if test="${memberInfo.member_level != '4'}">
              <a href="javascript:login_yn('${isLogOn}', ${goodsVO.goods_id})" style="display:inline;">
              <button type="button" id="goods_cs_button">1:1 문의</button>
              </a>
               </c:if>
            </div>
           
         <!-- 상품문의 목록 -->
           <table id="contents" style="border-collapse: collapse;">
					<c:forEach var="csVO" items="${goodsCsList}">
					 <tr style="border-bottom:1px solid #eee; text-align:left;">
       					<td class="title" width="5%">${csVO.csNO}</td>
						<td class="title" width="5%"></td>
						<td class="title" width="60%" style="text-align:left;">${csVO.title}</td>
 						<td class="title" width="15%"> ${csVO.writer}<br>
							<c:if test="${memberInfo.uid eq csVO.uid}">
					       		<input type="hidden" name="csNO" value="${csVO.csNO}">
					       		<input type="hidden" name="uid" value="${csVO.uid}">
					       		<input type="hidden" name="uid2" value="${memberInfo.uid}">
					       		<a href="${contextPath}/cs/updateForm.do?csNO=${csVO.csNO}" style="display:inline;  margin-right: 5px;">
					       		<button type="button" class="update_btn" onclick="">수정</button></a>
					       		<a href="${contextPath}/cs/deleteCS.do?csNO=${csVO.csNO}" style="display:inline;">
					       		<button type="button" class="delete_btn" onclick="return cs_delete_check();">삭제</button></a>
					       	</c:if>
					  </td>
					  <td class="title" style="width:15%;"><fmt:formatDate value="${csVO.writeDate}" pattern="YYYY-MM-dd"></fmt:formatDate></td>
					 </tr>
					 <!-- 상품문의 목록 아코디언 내용 -->
					 <tr style="background-color:#f0f0f0;">
						<td  style="width:5%;"></td>
						<td class="conts" style=" border-bottom: 1px solid #ddd;width:5%;">
						<img src="${contextPath}/resources/image/q.png" class="cs_img"></td>
						<td style="border-bottom: 1px solid #ddd;width:60%;padding:30px;" colspan='2'><span>${csVO.txtContent}</span></td>
						<td style=" border-bottom: 1px solid #ddd;width:15%;"></td>
						<td style="width:15%;"></td>
						</tr>
					<!-- 아코디언 답변 -->
					<c:forEach var="item" items="${commentList}">
					<c:if test="${csVO.csNO eq item.csNO}">
					<tr style="border-bottom: 1px solid #ddd; background-color:#f0f0f0; height:auto;">
					<td style="width:5%;"></td>
					<td class="conts" style="width:5%;">
					<img src="${contextPath}/resources/image/a.png"class="cs_img"></td>
					<td style="width:60%; padding:30px;" colspan='2'><span>${item.commentContent}</span></td>
					<td style=" border-bottom: 1px solid #ddd;width:15%;"></td>
					<td style="width:15%;"></td>
					</tr>
					</c:if>
					</c:forEach>
                  </c:forEach>
                  </table>
					</div>
					<br>
               </div><!-- 상품문의 끝 -->
               </c:if>
          </div>
          </div>
     </div>
	<div class="clear"></div>
	<div id="layer" style="visibility: hidden">
		<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
		<div id="popup">
			<!-- 팝업창 닫기 버튼 -->
			<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');"> 
			<img src="${contextPath}/resources/image/popclose.png" id="close" />
			</a>
			<br><font id="cartcontents">장바구니 담기</font><br>
				<form class="seecartform" action='${contextPath}/cart/myCartList.do'  >
				<br><img style="width:80px;" src="${contextPath}/resources/image/cart.png" id="cart" />
				<br><br><span style="font-Weight:bold; text-size:large;">장바구니에 담겼습니다.</span><br>
				<span style="text-size:medium;">바로 확인하시겠습니까?</span>
				<br><br><br>
				<input type="submit" class="seeCart" value="장바구니 보기">
				<input type="button" class="seeCart2" value="쇼핑 계속하기" onClick="location.reload();">
				</form>
</div>
</div>
</div>
</body>
</html>