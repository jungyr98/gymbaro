<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- css 파일 -->
	<link rel="stylesheet" href="${contextPath}/resources/css/searchGoods.css">
    <!--폰트어썸-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<title>운동 용품</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">

.img-score {
    display: inline-block;
    width: 60px;
    height: 12px;
    background: url(https://image.msscdn.net/skin/musinsa/images/icon_star_score.png) no-repeat;
    overflow: hidden;
    vertical-align: middle;
}

.img-score .bar {
    display: block;
    height: 100%;
    background: url(https://image.msscdn.net/skin/musinsa/images/icon_star_score.png) no-repeat 0 -120px;
}

.tab_btn a {
	display: inline-block;
    width: 100%;
    height: 100%;
}
</style>
<script type="text/javascript">

// 서브 카테고리 필터링
$(document).ready(function() {
	var last_item_check = $(".product_image");
	if((last_item_check.length % 12) != 0){
		$('#page_wrap').css("display", "none");
	}
	
	$("input[name=chk]").click(function() {
		var checked_item = $("input:checkbox[name='chk']:checked");
		var main_item = $('input[name="main_item"]').val();
		var sub_item = new Array();
		for(var i=0; i < checked_item.length; i++){
			sub_item[i] = checked_item[i].value;
		}
		$.ajax({
			type : "post",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/goods/searchGoods.do",
			data : {
				sub_item:sub_item,
				main_item:main_item
			},
			traditional : true,
			dataType : 'html',
			success : function(data) {
				var e = $(data).find('.product_image');
				$(".product_content").html(e);
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
			}
		}); //end ajax	
	});
});

// 더보기 버튼
function view_plus() {
	var main_item = $('input[name="main_item"]').val();
	var order_item = $('input[name="order_item"]').val();
	var old_limit = $('input[name="old_limit"]').val();
	var new_limit = parseInt(old_limit) + 12;
	
	$.ajax({
		type : "post",
		async : true, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/goods/searchGoods.do",
		data : {
			limit:new_limit,
			order_item:order_item,
			main_item:main_item
		},
		dataType : 'html',
		success : function(data) {
			 var e = $(data).find('.product_image');
			 //$("#searchGoods_body").html(data);
			$(".product_content").html(e);
			var last_item_check = $(".product_image");
			if((last_item_check.length % 12) != 0){
				$('#page_wrap').css("display", "none");
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
</script>
</head>
<body id="searchGoods_body">
<div class="main_container">

	<div class="notice_box tab_menu">
	 <input type="hidden" name="old_limit" value="${condMap.limit}">
	 <input type="hidden" name="main_item" value="${condMap.main_item}">
	 <input type="hidden" name="order_item" value="${condMap.order_item}">
     <div class="first_text_box"><!--상단 제목-->
              <span>운동 용품</span>
           </div>
          <div class="tab_btn">
          	<c:if test="${condMap.main_item eq '1'}">
               <ul>
                    <li class="active"><a href="${contextPath}/goods/searchGoods.do?main_item=1&order_item=all">전체</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=2&order_item=all">헬스</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=3&order_item=all">필라테스</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=4&order_item=all">복싱</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=5&order_item=all">수영</a></li>
               </ul>
            </c:if>
            <c:if test="${condMap.main_item eq '2'}">
               <ul>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=1&order_item=all">전체</a></li>
                    <li class="active"><a href="${contextPath}/goods/searchGoods.do?main_item=2&order_item=all">헬스</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=3&order_item=all">필라테스</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=4&order_item=all">복싱</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=5&order_item=all">수영</a></li>
               </ul>
            </c:if>
            <c:if test="${condMap.main_item eq '3'}">
               <ul>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=1&order_item=all">전체</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=2&order_item=all">헬스</a></li>
                    <li class="active"><a href="${contextPath}/goods/searchGoods.do?main_item=3&order_item=all">필라테스</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=4&order_item=all">복싱</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=5&order_item=all">수영</a></li>
               </ul>
            </c:if>
            <c:if test="${condMap.main_item eq '4'}">
               <ul>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=1&order_item=all">전체</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=2&order_item=all">헬스</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=3&order_item=all">필라테스</a></li>
                    <li class="active"><a href="${contextPath}/goods/searchGoods.do?main_item=4&order_item=all">복싱</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=5&order_item=all">수영</a></li>
               </ul>
            </c:if>
            <c:if test="${condMap.main_item eq '5'}">
               <ul>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=1&order_item=all">전체</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=2&order_item=all">헬스</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=3&order_item=all">필라테스</a></li>
                    <li><a href="${contextPath}/goods/searchGoods.do?main_item=4&order_item=all">복싱</a></li>
                    <li class="active"><a href="${contextPath}/goods/searchGoods.do?main_item=5&order_item=all">수영</a></li>
               </ul>
            </c:if>
          </div>
          <div class="goods_filter_box">
          	<div class="goods_filter_box_item">
          		<label>필터</label>
          	</div>
          	<div class="goods_filter_box_item">
          	<c:choose>
          		<c:when test="${condMap.main_item eq '2' or condMap.main_item eq '1'}">
          			<label><input type="checkbox" name="chk" value="바벨"> 바벨</label>
          			<label><input type="checkbox" name="chk" value="아령"> 아령</label>
          			<label><input type="checkbox" name="chk" value="원판"> 원판</label>
          		</c:when>
          		<c:otherwise>
          			<label><input type="checkbox" name="chk" value="바벨" disabled> 바벨</label>
          			<label><input type="checkbox" name="chk" value="아령" disabled> 아령</label>
          			<label><input type="checkbox" name="chk" value="원판" disabled> 원판</label>
          		</c:otherwise>
          	</c:choose>
          	</div>
          	<div class="goods_filter_box_item">
          	<c:choose>
          		<c:when test="${condMap.main_item eq '3' or condMap.main_item eq '1'}">
          			<label><input type="checkbox" name="chk" value="밴드"> 밴드</label>
          			<label><input type="checkbox" name="chk" value="폼롤러"> 폼롤러</label>
          			<label><input type="checkbox" name="chk" value="요가 짐볼"> 요가 짐볼</label>
          			<label><input type="checkbox" name="chk" value="해먹"> 해먹</label>
          		</c:when>
          		<c:otherwise>
          			<label><input type="checkbox" name="chk" value="밴드" disabled> 밴드</label>
          			<label><input type="checkbox" name="chk" value="폼롤러" disabled> 폼롤러</label>
          			<label><input type="checkbox" name="chk" value="요가 짐볼" disabled> 요가 짐볼</label>
          			<label><input type="checkbox" name="chk" value="해먹" disabled> 해먹</label>
          		</c:otherwise>
          	</c:choose>
          	</div>
          	<div class="goods_filter_box_item">
          	<c:choose>
          		<c:when test="${condMap.main_item eq '4' or condMap.main_item eq '1'}">
          			<label><input type="checkbox" name="chk" value="글러브"> 글러브</label>
          			<label><input type="checkbox" name="chk" value="훈련용품"> 훈련 용품</label>
          			<label><input type="checkbox" name="chk" value="보호용품"> 보호 용품</label>
          			<label><input type="checkbox" name="chk" value="복싱화"> 복싱화</label>
          		</c:when>
          		<c:otherwise>
          			<label><input type="checkbox" name="chk" value="글러브" disabled> 글러브</label>
          			<label><input type="checkbox" name="chk" value="훈련용품" disabled> 훈련 용품</label>
          			<label><input type="checkbox" name="chk" value="보호용품" disabled> 보호 용품</label>
          			<label><input type="checkbox" name="chk" value="복싱화" disabled> 복싱화</label>
          		</c:otherwise>
          	</c:choose>
          	</div>
          	<div class="goods_filter_box_item">
          	<c:choose>
          		<c:when test="${condMap.main_item eq '5' or condMap.main_item eq '1'}">
          			<label><input type="checkbox" name="chk" value="수영복"> 수영복</label>
          			<label><input type="checkbox" name="chk" value="수영모"> 수영모</label>
          			<label><input type="checkbox" name="chk" value="수경"> 수경</label>
          		</c:when>
          		<c:otherwise>
          			<label><input type="checkbox" name="chk" value="수영복" disabled> 수영복</label>
          			<label><input type="checkbox" name="chk" value="수영모" disabled> 수영모</label>
          			<label><input type="checkbox" name="chk" value="수경" disabled> 수경</label>
          		</c:otherwise>
          	</c:choose>
          	</div>
          </div>
 <div class="tab_cont">
  <div class="active" id="tab_cont_box"> 
   <div class="second_content">

	<div class="list_change">
		<ul>
			<li><a href="${contextPath}/goods/searchGoods.do?order_item=high_order&main_item=${condMap.main_item}">판매순</a></li>
			<li><a href="${contextPath}/goods/searchGoods.do?order_item=high_review&main_item=${condMap.main_item}">사용후기순</a></li>
			<li><a href="${contextPath}/goods/searchGoods.do?order_item=row_price&main_item=${condMap.main_item}">낮은가격순</a></li>
			<li><a href="${contextPath}/goods/searchGoods.do?order_item=high_price&main_item=${condMap.main_item}">높은가격순</a></li>
		</ul>
	</div>
	<div class="product_content product_view_box">
	  <c:forEach var="item" items="${goodsMap.all}">
	  	<c:if test="${item.goods_state eq '품절'}">
	  		<div class="product_image">
				<img width="75" style="filter: brightness(50%);" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			<div class="product_info">
				<span class="goods_name_span" style="font-weight: bold;">${item.goods_name}</span>
				<div class="product_info_price">
					<span style="color:tomato;"><b>품절</b></span>
				</div>
			</div>
		</div>
	  	</c:if>
	  	<c:if test="${item.goods_state eq '판매중'}">
		<div class="product_image">
			<a href="${contextPath}/goods/goodsInfo.do?goods_id=${item.goods_id}&tab=info">
							   <img width="75" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			</a>
			<div class="product_info">
				<span class="goods_name_span" style="font-weight: bold;">${item.goods_name}</span>
				<div class="product_info_price">
					<c:choose>
						<c:when test="${item.goods_discount != 0}">
							<fmt:formatNumber  value="${item.goods_discount}" type="number" var="goods_discount" />
							<fmt:parseNumber var="discount" integerOnly="true" value="${((item.goods_price-item.goods_discount)/item.goods_price)*100}" />
							<span style="color:black;"><b>${goods_discount}원</b></span>
							<span style='font-size:14px; color:#424040'><strike>${item.goods_price}</strike></span>
							<span style='color:#184798'><b>${discount}%</b></span>
						</c:when>
						<c:otherwise>
							<fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
							<span style="color:black;"><b>${goods_price}원</b></span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="product_into_star" style="font-size:20px">
					<span class="img-score">
						<c:if test="${item.score > 4.5}">
							<span class="bar" style="width: 100%"></span>
							<span>${item.score}</span>
						</c:if>
						<c:if test="${item.score <= 4.5 and item.score > 4}">
							<span class="bar" style="width: 90%"></span>
						</c:if>
						<c:if test="${item.score <= 4 and item.score > 3.5}">
							<span class="bar" style="width: 80%"></span>
						</c:if>
						<c:if test="${item.score <= 3.5 and item.score > 3}">
							<span class="bar" style="width: 70%"></span>
						</c:if>
						<c:if test="${item.score <= 3 and item.score > 2.5}">
							<span class="bar" style="width: 60%"></span>
						</c:if>
						<c:if test="${item.score <= 2.5 and item.score > 2}">
							<span class="bar" style="width: 50%"></span>
						</c:if>
						<c:if test="${item.score <= 2 and item.score > 1.5}">
							<span class="bar" style="width: 40%"></span>
						</c:if>
						<c:if test="${item.score <= 1.5 and item.score > 1}">
							<span class="bar" style="width: 30%"></span>
						</c:if>
						<c:if test="${item.score <= 1 and item.score > 0.5}">
							<span class="bar" style="width: 20%"></span>
						</c:if>
						<c:if test="${item.score <= 0.5 and item.score > 0}">
							<span class="bar" style="width: 10%"></span>
						</c:if>
						<c:if test="${item.score == 0}">
							<span class="bar" style="width: 0%"></span>
						</c:if>
					</span>
					<span style="font-size: 13px;color: #c4c4c4;">${item.score}</span>
				</div>
			</div>
		</div>
		</c:if>
	  </c:forEach>
	</div>
 </div>
</div>


</div>        

	<DIV id="page_wrap">
		 <button type="button" style="border:none;background: white" onclick="view_plus()"><span id="view_plus_btn" class="glyphicon glyphicon-chevron-down"></span></button>
	</DIV>
 </div>
 </div>
</body>
</html>