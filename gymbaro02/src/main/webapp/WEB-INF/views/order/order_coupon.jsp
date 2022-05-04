<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.n-coupon-popup .popup-tit {
  padding: 20px;
  font-size: 24px;
  font-family: "Musinsa", sans-serif !important;
}
.n-coupon-popup .popup-cont {
  padding: 0 20px 20px;
}
.n-coupon-popup .n-table.table-col td {
  border-bottom: none;
}
.n-coupon-popup .n-table.table-col .coupon-price-area {
  text-align: center;
  min-width: 424px;
  padding: 10px 0;
}
.n-coupon-popup .n-table.table-col .coupon-price-area > div {
  display: inline-block;
  text-align: center;
  vertical-align: top;
  font-size: 0;
}
.n-coupon-popup .n-table.table-col .coupon-price-area > div i {
  padding-top: 14px;
}
.n-coupon-popup .n-table.table-col .coupon-price-area > div.coupon-sale-price {
  width: 100px;
}
.n-coupon-popup .n-table.table-col .coupon-price-area > div.coupon-product-cnt {
  width: 36px;
  margin: 0 8px;
}
.n-coupon-popup .n-table.table-col .coupon-price-area > div > span {
  font-size: 11px;
  display: block;
  text-align: center;
}
.n-coupon-popup .n-table.table-col .coupon-price-area > div > strong {
  font-size: 14px;
  line-height: 21px;
}
.n-coupon-popup .n-table.table-col .coupon-price-area > div > strong.font-w-noraml {
  font-weight: normal;
}
.n-coupon-popup .n-table.table-col .no-data {
  color: #aaaaaa;
}
.n-coupon-popup .n-table.table-col .n-prd-row {
  min-height: 0;
  margin: 0;
}
.n-coupon-popup .n-table.table-col .n-prd-row .img-block {
  width: 50px;
  padding-top: 60px;
}
.n-coupon-popup .n-table.table-col .n-prd-row .name {
  max-height: 36px;
  font-size: 12px;
  line-height: 18px;
}
.n-coupon-popup .n-table.table-col .direct-on-text {
  color: #14aaff;
}
.n-coupon-popup .n-btn.btn-sm {
  min-width: 60px;
  white-space: nowrap;
}
.n-coupon-popup .n-btn.btn-sm.btn-disable {
  color: #ccc;
  cursor: default;
}
.n-coupon-popup .n-btn.btn-sm.btn-disable:hover {
  border-color: #e5e5e5;
}
.n-coupon-popup .info-list {
  margin-bottom: 10px;
  padding-top: 10px;
}
.n-coupon-popup .info-list li {
  position: relative;
  padding-left: 8px;
  color: #333;
  font-weight: 300;
  font-size: 12px;
  line-height: 18px;
}
.n-coupon-popup .info-list li:before {
  position: absolute;
  left: 0;
  top: 0;
  content: "-";
}
.n-coupon-popup .n-btn-group {
  padding-bottom: 40px;
}
.n-coupon-popup li .coupon-info {
  color: #0078ff;
  margin-top: 3px;
  font-size: 12px;
  line-height: 1.5;
}
.n-coupon-popup .n-coupon-popup {
  margin-top: 1px;
  font-size: 11px;
  line-height: 16px;
}
.n-coupon-popup .n-max-dc {
  margin-top: 1px;
  color: #777777;
  font-size: 11px;
  line-height: 16px;
}
</style>
</head>
<body>
<form name="f1" method="post" action="">
<input type="hidden" name="used_coupon_idxs">
<!-- 컨텐츠 영역 -->

<div class="n-coupon-popup">
	<h1 class="popup-tit">COUPON</h1>
	<div class="popup-cont">
		<!--쿠폰 리스트-->
		<table class="n-table table-col">
			<colgroup>
				<col style="width:100px">
				<col style="width:100px;">
				<col style="width:100px">
				<col style="width:100px">
			</colgroup>
			<thead>
			<tr>
				<th scope="col">쿠폰 선택</th>
				<th scope="col">쿠폰명</th>
				<th scope="col">할인율</th>
				<th scope="col">할인 기간</th>
			</tr>
			</thead>
			<tbody>
				<tr>
				<td>
					<div>
						<input type="radio">
					</div>
				</td>
				<td>
					<div class="n-prd-row">
					<!--
						<span class="img-block">
							<img src="${contextPath}/thumbnails.do?goods_id=${goodsVO.goods_id}&fileName=${goodsVO.goods_fileName}" alt="${goodsVO.goods_fileName}">
						</span>
					 -->
						<ul class="info">
							<li class="name">
								10% 할인쿠폰
							</li>
						</ul>
					</div>
				</td>
				<td class="coupon-price-area">
					<div>
						<i class="ic-18-line-close"></i>
					</div>
					<div class="coupon-sale-price">
						<span class="coupon-total-price">총 판매가</span>
						<strong>${orderMap.total_price }원</strong>
					</div>
				</td>
				<td id="dc_amt_0" name="dc_amt_0">0원</td>
				<input type="hidden" name="goods_dc_amt_0" value="">
                <input type="hidden" id="goods_opt" name="goods_opt_0" value="300">
                <input type="hidden" id="goods_coupon_info" name="goods_coupon_info_0" value="">
				<input type="hidden" name="goods_coupon_no_0" value="">
				<input type="hidden" name="goods_coupon_nm_0" value="">
				<input type="hidden" name="goods_coupon_idx_0" value="">
				<input type="hidden" id="goods_cnt" name="goods_cnt_0" value="1">
				<input type="hidden" id="limit_qty" name="limit_qty_0" value="">
				<input type="hidden" name="max_limit_qty_0" value="">
				<input type="hidden" id="goods_no_1900410" value="0">
			</tr>
						</tbody>
		</table>
		<input type="hidden" name="sum_dc_amt" value="">
		<input type="hidden" name="coupon_info" value="">
		<input type="hidden" name="layer_cnt" value="1">

		<ul class="info-list">
			<li>쿠폰 적용 시 한 주문, 한 상품에 한해서만 적용됩니다. (복수발급 쿠폰 제외)</li>
			<li>각 쿠폰은 사용기한이 정해져 있습니다.</li>
			<li>주문 후 반품/환불/취소의 경우 사용하신 쿠폰은 소멸됩니다.</li>
			<li>쿠폰 적용품목이 한정된 쿠폰은 해당 품목에서만 사용가능 합니다.</li>
			<li>할인/적립(%) 쿠폰은 적립금할인 등을 제외한 실제 결제금액에 적용됩니다.</li>
			<li>해당 상품에 대한 쿠폰은 해당 상품만 구매시 적용이 가능합니다.</li>
		</ul>

		<div class="n-btn-group"><a href="javascript:void(0)" onclick="ApplyCouponOrder(); return false;" class="n-btn btn-accent">쿠폰 적용</a></div>
	</div>
</div>

<!--// 컨텐츠 영역 -->
<span id="tot_dc_amt" name="tot_dc_amt" style="display: none;">0</span>
<div id="coupon_list" class="ui-layer layer-basic n-layer-coupon-list"></div>
</form>
</body>
</html>