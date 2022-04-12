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
<script type="text/javascript">

$(function () {
    var tab_Btn = $(".tab_btn > ul > li");
    var tab_Cont = $(".tab_cont > #tab_cont_box");
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
</head>
<body>
<div class="main_container">

	<div class="notice_box tab_menu">
     <div class="first_text_box"><!--상단 제목-->
              <span>운동 용품</span>
           </div>
          <div class="tab_btn">
               <ul>
                    <li class="active"><a href="#">전체</a></li>
                    <li><a href="#">헬스</a></li>
                    <li><a href="#">필라테스</a></li>
                    <li><a href="#">복싱</a></li>
                    <li><a href="#">수영</a></li>
               </ul>
          </div>
          <div class="goods_filter_box">
          	<div class="goods_filter_box_item">
          		<label>필터</label>
          	</div>
          	<div class="goods_filter_box_item">
          		<label><input type="checkbox" value="테스트"> 바벨</label>
          		<label><input type="checkbox" value="테스트"> 아령</label>
          		<label><input type="checkbox" value="테스트"> 원판</label>
          	</div>
          	<div class="goods_filter_box_item">
          		<label><input type="checkbox" value="테스트"> 밴드</label>
          		<label><input type="checkbox" value="테스트"> 폼롤러</label>
          		<label><input type="checkbox" value="테스트"> 요가 짐볼</label>
          		<label><input type="checkbox" value="테스트"> 해먹</label>
          	</div>
          	<div class="goods_filter_box_item">
          		<label><input type="checkbox" value="테스트"> 글러브</label>
          		<label><input type="checkbox" value="테스트"> 훈련 용품</label>
          		<label><input type="checkbox" value="테스트"> 보호 용품</label>
          		<label><input type="checkbox" value="테스트"> 복싱화</label>
          	</div>
          	<div class="goods_filter_box_item">
          		<label><input type="checkbox" value="테스트"> 수영복</label>
          		<label><input type="checkbox" value="테스트"> 수영모</label>
          		<label><input type="checkbox" value="테스트"> 수경</label>
          	</div>
          </div>
 <div class="tab_cont">
  <div class="active" id="tab_cont_box">
   <div class="first_content">
	<div class="first_text">
		<span>운동 용품 <b>주간 RANKING</b> <img alt="icon_map" src="${contextPath}/resources/image/medal.png"></span>
	</div>
	<div class="product_content">
		<div class="product_image">
			<!--  <div class="rank_mark">
				<span class="rank_num">1</span>
				<img alt="1위" src="${contextPath}/resources/image/tag.png">
			</div>-->
			<a href="${contextPath}/goods/goodsInfo.do">
				<img alt="용품01" src="${contextPath}/resources/image/dumbell.png">
			</a>
			<div class="product_info">
				<span style="font-weight: bold;">운동 용품 이름</span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'><strike>28,000원</strike></span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
				<!--<div class="product_into_star">
					<label for="rate1"><span class="fa-solid fa-star"></span></label>
					<label for="rate2"><span class="fa-solid fa-star"></span></label>
					<label for="rate3"><span class="fa-solid fa-star"></span></label>
					<label for="rate4"><span class="fa-solid fa-star"></span></label>
					<label for="rate5"><span class="fa-solid fa-star"></span></label>
				</div>-->
			</div>
		</div>
		<div class="product_image">
			<!-- <div class="rank_mark">
				<span class="rank_num">2</span>
				<img alt="2위" src="${contextPath}/resources/image/tag.png">
			</div>-->
			<img alt="용품02" src="${contextPath}/resources/image/roller.png">
			<div class="product_info">
				<span style="font-weight: bold;">운동 용품 이름</span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'><strike>28,000원</strike></span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
				<!--<div class="product_into_star">
					<label for="rate1">⭐</label>
					<label for="rate2">⭐</label>
					<label for="rate3">⭐</label>
					<label for="rate4">⭐</label>
					<label for="rate5">⭐</label>
				</div>-->
			</div>
		</div>
		<div class="product_image">
			<!--  <div class="rank_mark">
				<span class="rank_num">3</span>
				<img alt="3위" src="${contextPath}/resources/image/tag.png">
			</div>-->
			<img alt="용품03" src="${contextPath}/resources/image/backback.png">
			<div class="product_info">
				<span style="font-weight: bold;">운동 용품 이름</span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'><strike>28,000원</strike></span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
				<!--<div class="product_into_star">
					<label for="rate1">⭐</label>
					<label for="rate2">⭐</label>
					<label for="rate3">⭐</label>
					<label for="rate4">⭐</label>
					<label for="rate5">⭐</label>
				</div>-->
			</div>
		</div>
		
	</div>
  </div>
  
   <div class="second_content">

	<div class="list_change">
		<ul>
			<li><a href="#">인기순</a></li>
			<li><a href="#">판매순</a></li>
			<li><a href="#">사용후기순</a></li>
			<li><a href="#">낮은가격순</a></li>
			<li><a href="#">높은가격순</a></li>
		</ul>
		<select>
			<option>10개씩보기</option>
			<option>5개씩보기</option>
		</select>
	</div>
	<c:forEach begin="1" end="4" step="1">
	<div class="product_content">
		<div class="product_image">
			<img alt="용품01" src="${contextPath}/resources/image/ballball.png">
			<div class="product_info">
				<span style="font-weight: bold;">필라테스 볼 </span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'><strike>28,000원</strike></span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
				<div class="product_into_star" style="font-size:20px" >
					<label for="rate1"><span class="fa fa-star" style="color:#184798; font-size:15px; "></span></label>
					<label for="rate2"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate3"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate4"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate5"><span class="fa fa-star-half" style="color:#184798; font-size:15px;"></span></label>
				</div>
			</div>
		</div>
		<div class="product_image">
			<img alt="용품02" src="${contextPath}/resources/image/gloves.jpg">
			<div class="product_info">
				<span style="font-weight: bold;">복싱 글러브 </span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'><strike>28,000원</strike></span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
				<div class="product_into_star" style="font-size:20px" >
					<label for="rate1"><span class="fa fa-star" style="color:#184798; font-size:15px; "></span></label>
					<label for="rate2"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate3"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate4"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate5"><span class="fa fa-star-half" style="color:#184798; font-size:15px;"></span></label>
				</div>
			</div>
		</div>
		<div class="product_image">
			<img alt="용품03" src="${contextPath}/resources/image/roller.png">
			<div class="product_info">
				<span style="font-weight: bold;">폼롤러 </span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'><strike>28,000원</strike></span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
					<div class="product_into_star" style="font-size:20px" >
					<label for="rate1"><span class="fa fa-star" style="color:#184798; font-size:15px; "></span></label>
					<label for="rate2"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate3"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate4"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate5"><span class="fa fa-star-half" style="color:#184798; font-size:15px;"></span></label>
				</div>
			</div>
		</div>
		<div class="product_image">
			<img alt="용품04" src="${contextPath}/resources/image/water.jpg">
			<div class="product_info">
				<span style="font-weight: bold;">물안경 </span>
				<div class="product_info_price">
					<span><b>14,000원</b></span>
					<span style='font-size:14px; color:#424040'><strike>28,000원</strike></span>
					<span style='color:#184798'><b>50%</b></span>
				</div>
				<div class="product_into_star" style="font-size:20px" >
					<label for="rate1"><span class="fa fa-star" style="color:#184798; font-size:15px; "></span></label>
					<label for="rate2"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate3"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate4"><span class="fa fa-star" style="color:#184798; font-size:15px;"></span></label>
					<label for="rate5"><span class="fa fa-star-half" style="color:#184798; font-size:15px;"></span></label>
				</div>
			</div>
		</div>
	</div>
  </c:forEach>
 </div>
</div>

<div id="tab_cont_box">	
		<span>상품 목록이 없습니다.</span>
</div>
<div id="tab_cont_box">	
		<span>상품 목록이 없습니다.</span>
</div>
<div id="tab_cont_box">	
		<span>상품 목록이 없습니다.</span>
</div>
<div id="tab_cont_box">	
		<span>상품 목록이 없습니다.</span>
</div>
</div>        

	<DIV id="page_wrap">
		 <c:forEach var="page" begin="1" end="10" step="1" >
		         <c:if test="${section >1 && page==1 }"> <!-- section 2부터는 그 전 section으로 갈 수 있도록 pre라는 이름의 a태그를 보여줌 -->
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?section=${section-1}&pageNum=${(section-1)*10-page }">&nbsp;pre &nbsp;</a>
		         </c:if>
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		         <c:if test="${page ==10 }"> <!--  -->
		          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
		         </c:if> 
	      </c:forEach> 
		</DIV>
 </div>
 </div>
</body>
</html>