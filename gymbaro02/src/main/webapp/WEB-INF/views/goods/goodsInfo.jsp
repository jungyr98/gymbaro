<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>

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

</style>
<script type="text/javascript">
$(function () {
    var tab_Btn = $(".tab_btn > ul > li");
    var tab_Cont = $(".tab_cont > div");
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

// 옵션 체인지 부분
var selectBoxChange_option = function(value){
	
	$('input[type="number"]').val(1);
	var qty = $('input[type="number"]').val();
	
	var value1 = value;
	var value2 = $("#optionSelectedBox > option:selected").attr("value2");
	var value3 = $("#optionSelectedBox > option:selected").attr("value3");
	$('.option_name').val(value1);
	$('#select_option_name').text(value1);
	$('#select_option_price').text(value2);
	value3 = value3 * qty;
	$('.total_price').val(value3);
	value3 = value3.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$('#total_price').text(value3 + "원");
}

// 수령 변경시 총 금액 체인지 부분
var numberBoxChange = function(value){
	var value3 = $("#optionSelectedBox > option:selected").attr("value3");
	if(value3==0){
		alert("옵션을 선택해주세요!");
		$('input[type="number"]').val(1);
		return;
	}
	$('.goods_qty').val(value);
	var total_price = value3 * value;
	$('.total_price').val(total_price);
	total_price = total_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$('#select_option_price').text(total_price+"원");
	$('#total_price').text(total_price+"원");
}

//장바구니 추가
function add_cart(goods_id) {
	var goods_qty = $('input[name=goods_qty]').val();
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/cart/addGoodsInCart.do",
		data : {
			goods_id:goods_id,
			goods_qty:goods_qty
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


</script>
</head>
<body>
<div class="main_container">
	<div class="gym_info_header_box">
		<div class="gym_info_header_img">
		<img alt="HTML5 &amp; CSS3"
				src="${contextPath}/thumbnails.do?goods_id=${goodsVO.goods_id}&fileName=${goodsVO.goods_fileName}">
			<!--  <img src="${contextPath}/resources/image/dumbell.png" alt="gym_01.PNG"> -->
		</div>
		<div class="gym_info_header_text">
			<span class="gym_info_header_title">${goodsVO.goods_name}</span>
			<div class="gym_stars_box">
				⭐⭐⭐⭐⭐ 5.0
			</div>
			<div class="gym_location_box">
				<div class="goods_sale_price_box">
					<span>판매가</span>
					<fmt:formatNumber  value="${goodsVO.goods_price}" type="number" var="goods_price" />
					<span>${goods_price}원</span>
				</div>
				<div class="goods_plus_price_box">
					<span>배송비</span>
					<span>3,500원</span>
				</div>
				<div class="goods_point_info_box">
					<span>포인트</span>
					<span>1%</span>
				</div>
			</div>
			<div class="gym_option_box">
				<span>옵션 선택</span>
				<select id="optionSelectedBox" onChange="selectBoxChange_option(this.value);" >
					<option value="옵션 선택" value2="0원" value3="0">옵션 선택</option>
				  <c:forEach var="option" items="${optionList}" >
				  <fmt:formatNumber  value="${option.price}" type="number" var="price" />
					<option value="${option.option_name }" value2="${price }원" value3="${option.price}">${option.option_name }</option>
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
					<input type="button" class="option_submit_btn go_cart_btn" value="장바구니" onClick="add_cart('${goodsVO.goods_id}')">
					<input type="submit" class="option_submit_btn go_order_btn" value="구매하기">
					<input type="button" class="option_submit_btn" value="비회원 구매하기"  onClick="location.href ='${contextPath}/order/order_02.do'">
				</form>
			</div>
		</div>
	</div>
	
	 <div class="myPage03_box tab_menu">
     	<div class="first_content">
          <div class="tab_btn">
               <ul>
                    <li class="active"><a href="#">상세 정보</a></li>
                    <li><a href="#">배송 안내</a></li>
                     <li><a href="#">교환 및 반품 안내</a></li>
                    <li><a href="#">이용후기(11)</a></li>
                     <li><a href="#">상품 문의</a></li>
               </ul>               
          </div>
          <div class="tab_cont">
               <div class="active gymsInfo_first_tab_box">
					<div class="info_content gymsInfo_first_text_box">
						<p>
						테스트 상품 소개
						</p>
					</div>
					<div class="info_content gymsInfo_priceInfo_box">
						<c:forEach var="image" items="${imageList }">
							<img class="goods_detail_img" src="${contextPath}/download.do?goods_id=${goodsVO.goods_id}&fileName=${image.fileName}">
						</c:forEach>
					</div>
					<div class="info_content gymsInfo_timeInfo_box">
						<p>테스트</p>
					</div>
					<div class="info_content gymsInfo_programInfo_box">
						<p>테스트</p>
					</div>
					<div class="info_content gymsInfo_Info_box">
						<p>테스트</p>
					</div>
					<div class="info_content gymsInfo_url_box">
						<p>테스트</p>
					</div>
               </div>
               <div class="gymsInfo_div">
					<div class="gymsInfo_img_box">
						<img src="${contextPath}/resources/image/goods_info_2.PNG" alt="goods_info_2.PNG">
					</div>
               </div>
               <div class="gymsInfo_div">
					<div class="gymsInfo_img_box">
						<img src="${contextPath}/resources/image/goods_info_3.PNG" alt="goods_info_3.PNG">
					</div>
               </div>
                <div class="gymsInfo_div">
					<div class="gymsInfo_review_box">
						<div class="gym_review_box">
							<div class="gym_review_box_title">
								<span>이용 후기</span>
							</div>
							<div class="gym_review_star_box">
								<div class="star_sum_box">
									⭐ 5.0
								</div>
								<div class="star_info_box">
									<div>아주 좋아요 ⭐⭐⭐⭐⭐</div>
									<div>맘에 들어요 ⭐⭐⭐⭐⭐</div>
									<div>보통이에요 ⭐⭐⭐⭐⭐</div>
									<div>그냥 그래요 ⭐⭐⭐⭐⭐</div>
									<div>별로에요 ⭐⭐⭐⭐⭐</div>
								</div>
							</div>
							<div class="user_review_list_box">
								<div class="user_info_box">
									<div class="user_level">
										<span>Gold</span>
									</div>
									<div class="user_info">
										 ⭐⭐⭐⭐⭐
										 <div>
										 	<span class="review_user_name">허용준</span>
										 	<span class="review_write_date">2022.04.04</span>
										 </div>
									</div>
								</div>
								<div class="user_review_content">
									<span>쾌적하고 운동기구가 많아 좋네요. 운동마치고 사우나하고 나오면 하루가 행복합니다. 최고!</span>
								</div>
							</div>
														<div class="user_review_list_box">
								<div class="user_info_box">
									<div class="user_level">
										<span>Gold</span>
									</div>
									<div class="user_info">
										 ⭐⭐⭐⭐⭐
										 <div>
										 	<span class="review_user_name">한다슬</span>
										 	<span class="review_write_date">2022.03.08</span>
										 </div>
									</div>
								</div>
								<div class="user_review_content">
									<span>시설이 참 좋고 카운터 직원분들이 친절하세요</span>
								</div>
							</div>
						</div>
					</div>
               </div>
               <div class="gymsInfo_div">
					<div class="gymsInfo_img_box">
						<p>상품 문의(8)</p>
					</div>
               </div>
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