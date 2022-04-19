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
</script>

<style type="text/css">
.myPage03_box a, .myPage03_box span:not(.first_text span, .gym_review_box_title span, .review_write_date) {text-decoration: none; font-size: 16px; color: #666;}
.myPage03_box ul, .myPage03_box li {list-style: none;}
.myPage03_box td {font-style: normal; font-weight: normal;}

.myPage03_box .tab_btn {position: relative; width: 900px;}
.myPage03_box .tab_btn a.more {position: absolute; right: 0; top: 13px; font-size: 13px;}
.myPage03_box .tab_btn ul {display: flex; padding-left: 0; margin: 0;}
.myPage03_box .tab_btn ul li {width: 900px; text-align: center; border: 1px solid #ccc; padding: 15px 0; box-sizing: border-box; margin-left: -1px; transition: all 0.5s;}
.myPage03_box .tab_btn ul li:hover,
.myPage03_box .tab_btn ul li:active {background: rgb(24, 71, 152);}
.myPage03_box .tab_btn ul .active {background: rgb(24, 71, 152);}
.myPage03_box .tab_btn ul .active a {color:white;}
.myPage03_box .tab_btn ul li a {display: flex; justify-content: center; align-items: center; font-size:18px;}
.myPage03_box .tab_btn ul li a img {width:24px; height:24px; margin-left:10px;}
.myPage03_box .tab_cont {margin-top: -1px;}
.myPage03_box .tab_cont table {width: 900px; padding-top: 15px; box-sizing: border-box; margin: 0;}
.myPage03_box .tab_cont table tr {position: relative; width: 400px; height: 30px; line-height: 30px; box-sizing: border-box;}
.myPage03_box .tab_cont table tr td {height:50px;}
.tab_menu a {display: block; transition: all 0.5s;}
.tab_menu a:hover {color: white;}

.main_container {
	width:900px;
}

.gym_info_header_box {
	display:flex;
	justify-content:space-between;
	margin: 25px 0 40px 0;
	color: #424040;
}
.gym_info_header_img img {
	width:400px
}
.gym_info_header_text {
	display:flex;
	flex-direction:column;
	align-items:baseline;
	width: 450px;
}

.gym_info_header_text .gym_info_header_title {
	font-size:25px;
	font-weight:600;
}

.gym_info_header_text .gym_stars_box {
	width: 100%;
    text-align: left;
	border-bottom: 2px solid #f0f0f0;
	padding-bottom: 20px;
	margin:5px 0px 20px 0px;
}

.gym_info_header_text .gym_location_box {
	display:flex;
	flex-direction:column;
	width: 100%;
    text-align: left;
	border-bottom: 2px solid #f0f0f0;
	padding-bottom: 20px;
	margin:5px 0px 20px 0px;
	justify-content: space-between;
    height: 90px;
}

.goods_sale_price_box, .goods_plus_price_box, .goods_point_info_box {
    display: flex;
    justify-content: space-between;
}

.gym_info_header_text .gym_location_box img {
	margin-right:10px;
}

.gym_info_header_text .gym_option_box{
	display: flex;
    flex-direction: column;
    align-items:baseline;
}

.gym_info_header_text .gym_option_box select {
	width: 450px;
    height: 40px;
    font-size: 15px;
    padding: 0 5px;
    border: 1px solid #c4c4c4;
    border-radius: 5px;
    margin-top:10px;
    box-shadow: 0 1px 3px rgb(0 0 0 / 12%), 0 1px 2px rgb(0 0 0 / 24%);
}

.gym_info_header_text .gym_option_box .option_submit_btn {
	width: 450px;
	height:50px;
    font-size: 17px;
    font-weight:600;
    padding: 0 5px;
    border:none;
    border-radius: 5px;
	margin-top:20px;
	background:rgb(24, 71, 152);
	color:white;
	box-shadow: 0 1px 3px rgb(0 0 0 / 12%), 0 1px 2px rgb(0 0 0 / 24%);
}

.goods_total_price {
    width: 450px;
    display: flex;
    justify-content: space-between;
}

.gym_submit_btn_box {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}


.gym_option_box .gym_submit_btn_box .go_cart_btn,
.gym_option_box .gym_submit_btn_box .go_order_btn {
	width: 220px;
}

.gym_option_box .gym_submit_btn_box .go_cart_btn {
	background:white;
	color:rgb(24, 71, 152);
}

.goods_num_box {
    display: flex;
    width: 450px;
    justify-content: space-between;
    border-top: 2px solid #f0f0f0;
    border-bottom: 2px solid #c4c4c4;
    padding: 10px 0;
    margin: 20px 0;
}

.gymsInfo_first_tab_box {
	display: flex;
    flex-direction: column;
    align-items: center;
    padding: 50px 30px;
}

.gymsInfo_first_tab_box .info_content {
	border-bottom: 1px solid #c4c4c4;
	width:100%;
	padding: 50px 0 50px 0;
}

.gymsInfo_first_text_box p {
	background: #fafafa;
    height: 400px;
    border: 1px solid #c4c4c4;
    border-radius: 5px;
    color: #424040;
    padding: 40px;
    text-align: left;
}

.gym_review_box {
    margin-top: 50px;
}

.gym_review_box .gym_review_box_title {
	text-align: left;
}

.gym_review_box_title span {
	font-size:24px;
}

.gym_review_star_box {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 50px 0;
    }
    
.star_info_box {
    display: flex;
    flex-direction: column;
    align-items: end;
    border-left: 1px solid #c4c4c4;
    margin-left: 50px;
    padding-left: 50px;
    color: #424040;
    font-size: 16px;
}

.star_info_box div {
	margin-bottom:5px;
}

.star_sum_box {
    font-size: 50px;
    /* color: rgb(24, 71, 152); */
}

.user_review_list_box {
    border-top: 2px solid #f0f0f0;
    margin-top: 50px 0px;
    padding: 25px 0;
    display: flex;
    flex-direction: column;
    align-items: baseline;
}

.user_review_list_box .user_level {
    width: 50px;
    height: 50px;
    border-radius: 25px;
    background: gold;
    margin-right: 15px;
    font-size: 25px;
    font-weight: bold;
    display: flex;
    justify-content: center;
    align-items: center;
}

.user_review_list_box .user_info_box {
    display: flex;
}

.user_review_list_box .user_info {
    display: flex;
    flex-direction: column;
    align-items: baseline;
}

.user_review_list_box .review_write_date {
    font-size: 14px;
    border-left: 1px solid #c4c4c4;
    padding-left: 10px;
    margin-left: 10px;
    color: #c4c4c4;
}

.user_review_list_box .user_review_content {
    margin: 20px 0 20px 65px;
}

</style>

</head>
<body>
<div class="main_container">
	<div class="gym_info_header_box">
		<div class="gym_info_header_img">
			<img src="${contextPath}/resources/image/dumbell.png" alt="gym_01.PNG">
		</div>
		<div class="gym_info_header_text">
			<span class="gym_info_header_title">운동 용품 이름</span>
			<div class="gym_stars_box">
				⭐⭐⭐⭐⭐ 5.0
			</div>
			<div class="gym_location_box">
				<div class="goods_sale_price_box">
					<span>판매가</span>
					<span>70,400</span>
				</div>
				<div class="goods_plus_price_box">
					<span>배송비</span>
					<span>2,500원</span>
				</div>
				<div class="goods_point_info_box">
					<span>포인트</span>
					<span>1%</span>
				</div>
			</div>
			<div class="gym_option_box">
				<span>옵션 선택</span>
				<select>
					<option>바벨 4kg</option>
				</select>
				<div class="goods_num_box">
					<span>선택한 옵션명</span>
					<input type="number" name="goods_num" id="goods_num" min="1" value="1">
					<span>70,400원</span>
				</div>
				<div class="goods_total_price">
					<span>총 합계 금액</span>
					<span>70,400원</span>
				</div>
				<div class="gym_submit_btn_box">
					<input type="button" class="option_submit_btn go_cart_btn" value="장바구니">
					<input type="button" class="option_submit_btn go_order_btn" value="구매하기" onClick="location.href ='${contextPath}/order/order_01.do'">
					<input type="button" class="option_submit_btn" value="비회원 구매하기"  onClick="location.href ='${contextPath}/order/order_02.do'">
				</div>
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
						<p>테스트</p>
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
						<p>배송 안내</p>
					</div>
               </div>
               <div class="gymsInfo_div">
					<div class="gymsInfo_img_box">
						<p>교환 및 반품안내</p>
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
	
</div>
</body>
</html>