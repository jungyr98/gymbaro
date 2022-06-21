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
<link rel="stylesheet" href="${contextPath}/resources/css/myPage03.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
#goodsInfo_table {
	border: 1px;
    width: 850px;
    /*height: 250px;*/
    margin-top:30px;
}

#goodsInfo_table #goodsInfo_div {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    height: 94px;
    margin-left:10px;
}

#goodsInfo_table #goodsInfo_div .goods_option_qty_info {
	display: flex;
    width: 700px;
    background: #EDEFF2;
    padding: 10px;
    border: 1px solid #c4c4c4;
    border-radius: 2px;
}

#goodsInfo_table #goodsInfo_div .goods_name_info {
    border: none;
    background: white;
    width: 700px;
    padding: 10px 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

#non-border-1 {
	border-bottom:none;
}

#non-border-2 {
	height: 120px;
}

#goodsInfo_table #goodsInfo_div #goods_name {
	width: fit-content;
    font-size: 15px;
    padding-bottom: 5px;
}

#goodsInfo_table #goodsInfo_div .option_span {
	font-size:14px;
}

.orderDetail_box .title-box {
    font-size: 18px;
    font-family: "Musinsa", sans-serif !important;
    text-align: left;
    margin-bottom: 10px;
}

.orderDetail_box .title-box .korSub {
    line-height: 15px;
    margin-left: 5px;
}
.orderDetail_box .title-box .korSub {
    font-weight: bold;
    font-size: 12px;
    color: #b2b2b2;
}

.orderDetail_box .cell_order_form1 {
    text-align: start;
    margin-bottom: 20px;
}

.title-page, .txt_selected_division, .font-mss {
    font-family: "Musinsa", sans-serif !important;
}

#table_div_box {
	display: flex;
    justify-content: space-between;
    margin: 25px 0;
}

#table_div_box table, #table_div_box tr{
   text-align: left;
   vertical-align: top;
   line-height: 1.8;
}

#table_div_box td {
	padding-left: 10px;
}

#table_div_box .fixed_td {
    height: 43px;
    width: 200px;
    font-weight:bold;
 }
 
#table_div_box .orderer_info {
	width: 335px;
 	background: #EDEFF2;
    padding: 20px;
    border-radius: 5px;
 }

#table_div_box .orderer_info table {
	width:260px;
} 

#table_div_box .orderer_info span {
	width: 120px;
    display: block;
    font-size:14px;
}

.orderDetail_box .sub_wrap .align_rt {
	padding:20px;
}

.orderDetail_box .order_info_span {
	font-size:14px;
}

.orderDetail_box #order_detail_title {
	width: 840px;
	text-align: left;
    font-size: 24px;
    color: black;
    padding-bottom: 15px;
    padding-left: 5px;
    border-bottom: 2px solid black;
    border-radius: 0;
}

.orderDetail_box #order_detail_title button {
    font-size: 14px;
    background: white;
    border: 1px solid #c4c4c4;
    padding: 5px 10px;
    margin-left: 10px;
}

.orderDetail_box .tab_btn {
    border-bottom: 2px solid black;
    border-radius: 0;
 }
 
#review_btn {
    font-size: 14px;
    background: white;
    border: 1px solid #c4c4c4;
    padding: 5px 10px;
    margin-left: 10px;
}
</style>
</head>
<body>
<div class="myPage_box wrap show orderDetail_box">
   <div id="content" class="sub_wrap">
  	<div class="align_rt">
      <div class="myPage03_box tab_menu">
     	<div class="first_content">
          <div class="tab_btn">
          	<p id="order_detail_title">주문 상세 <button onclick="javascript:history.back();">뒤로가기</button></p>
          	<table id="goodsInfo_table">
	 		<thead>
	 			<tr id="non-border-1">
	 				<td colspan="2">
	 				<div class="cell_membership_form1">
           				 <h3 class="title-box font-mss">Purchase Info <span class="korSub">구매 정보 확인</span></h3>
       				 </div>
	 				</td>
	 			</tr>
	 		</thead>
	 		<c:forEach var="item" items="${orderDetailList}">
			<thead>
				<tr id="non-border-2">
					<td class="info_fixed_join">
						<img width="100" style="height:95px;object-fit:cover;" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.fileName}">
					</td>
					<td>
						<div id="goodsInfo_div">
							<div class="goods_name_info">
							<span id="goods_name">${item.goods_name}</span> 
							<c:choose>
							   <c:when test="${item.review_yn == 'N' and item.order_state == '배송완료'}">
							       <span><a href="${contextPath}/goods/goodsInfo.do?tab=review&goods_id=${item.goods_id}&order_id=${item.order_id}&option_name=${item.option_name}"> 
					  		          <button type="button" id="review_btn">리뷰 쓰기</button>
					  		       </a></span>
					  		   </c:when>
					  		   <c:when test="${item.review_yn == 'Y'}">
					  		   		<a href="${contextPath}/goods/goodsInfo.do?tab=review&goods_id=${item.goods_id}&reviewWrite=ok">
					  		         <button type="button" id="review_btn">리뷰 보기</button>
					  		         </a>
					  		   </c:when>
					  		 </c:choose>
							</div>	
					  		<div class="goods_option_qty_info">
					  			<span class="option_span"><b>옵션 : </b></span>&nbsp;
					  			<span class="option_span">${item.option_name}</span>&nbsp;&nbsp;
					  			<span class="option_span"><b>수량 : </b></span>&nbsp;
					  			<span class="option_span">${item.goods_qty }개</span>
					  		</div>
					  	</div>
					</td>
				</tr>
			</thead>
			</c:forEach>
			</table>
		  </div>
		  <div id="table_div_box">
                   		<table>
                   			<thead>
	 						<tr id="non-border-1">
	 							<td colspan="2">
	 							<div class="cell_membership_form1">
           							 <h3 class="title-box font-mss">Order Info <span class="korSub">주문/배송 정보 확인</span></h3>
       							</div>
	 							</td>
	 						</tr>
	 						</thead>
                   			<tr>
                   				<td class="fixed_td">배송지 정보</td>
                   				<td>
                   					<span class="order_info_span">${orderDetailList.get(0).receiver_phone_number}</span><br>
                   					<span class="order_info_span">${orderDetailList.get(0).receiver_name}</span><br>
                   					<span class="order_info_span">${orderDetailList.get(0).receiver_roadAddress}</span>
                   					<br><br>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">배송 메모</td>
                   				<td>
                   					<span class="order_info_span">${orderDetailList.get(0).delivery_memo}</span>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">결제 방법</td>
                   				<td>
                   					<span class="order_info_span">${orderDetailList.get(0).payment}</span>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">최종 결제 금액</td>
                   				<td>
                   					<fmt:formatNumber  value="${orderDetailList.get(0).total_price}" type="number" var="price" />
                   					<span class="order_info_span">${price}원</span>
                   				</td>
                   			</tr>
                   		</table>
                   		<div class="orderer_info">
                   		<table>
                   			<tr>
                   				<td class="fixed_td">주문번호</td>
                   				<td>
                   					<span>${orderDetailList.get(0).order_id }</span><br>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">주문자명</td>
                   				<td><span>${orderDetailList.get(0).orderer_name}</span></td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">주문일자</td>
                   				<td>
                   					<span>${orderDetailList.get(0).creDate}</span>
                   				</td>
                   			</tr>
                   		</table>
                   		</div>
            </div>
		</div>
	 </div>
	</div>
  </div>
</div>
</body>
</html>