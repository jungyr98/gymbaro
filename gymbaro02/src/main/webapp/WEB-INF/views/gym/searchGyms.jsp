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
	<title>Insert title here</title>
	<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>

    <!-- 디버그용 인디케이터, 실전에선 필요없음 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/plugins/debug.addIndicators.js"></script>

    <!-- gsap 용 플러그인 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/plugins/animation.gsap.js"></script>
    <!-- 달력링크 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
    
    <!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- css -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
 
	<!-- js -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>


    <link rel="stylesheet" href="${contextPath}/resources/css/search_gyms.css">
    <script src="${contextPath}/resources/js/search_goods.js"></script>
    <!--  달력js -->
    <script>
    $(function() {
        $('input[name="daterange"]').daterangepicker({
        opens: 'left',
        timePicker: true
        }, function(start, end, label) {
        console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
        });

    });
    </script>
<style type="text/css">

body {
		font-family: 'Noto Sans KR', sans-serif;
	}
.goods_picture {
	overflow:none;
}	
</style>
</head>
<body>
<!-- yolo가자 작성 -->
<div class="detail-select" style="width:1024px;">
  
   <div class="header-bar">
      <div class="text-box con">
        <p>시설 찾기</p>
      </div>
    </div>
 
    <div class="detail-select-box con">
      <div class="top_menu">
        <ul class="row">
          <li class="cell"><a href="#">전체 시설</a></li>
          <li class="cell"><a href="#">헬스장</a></li>
          <li class="cell"><a href="#">필라테스</a></li>
          <li class="cell"><a href="#">복싱</a></li>
          <li class="cell"><a href="#">수영장</a></li>
        </ul>
      </div>
      <!-- 상세 검색창 -->
      <div class="filter_wrap">
        <section class="date-wrap">
          <h3>날짜</h3>
          <div class="btn_date">
            <tr class="date-box">
              <td  class="date"><input type="text" name="daterange" value="01/01/2021/ - 01/15/2022" /></td>
                  </tr>
          </div>
        </section>
        <div class="select-wrap">
          <h3>상세조건</h3>
          <button type="button" onclick="">초기화</button>
          <button type="submit">적용</button>
        </div>
        
        <section>
          <strong>바벨/아령</strong>
            <ul class="hide_type half">
              <li>
              	<input type="checkbox" id="tmino_0" name="tmino[]" class="inp_chk" value="8">
              	<label for="tmino_0" class="label_chk">바벨</label>
              </li>
              <li>
              	<input type="checkbox" id="tmino_1" name="tmino[]" class="inp_chk" value="14">
              	<label for="tmino_1" class="label_chk">원판</label></li>
              <li>
              	<input type="checkbox" id="tmino_2" name="tmino[]" class="inp_chk" value="1">
              	<label for="tmino_2" class="label_chk">아령</label></li>
            </ul>
            
          </ul>
        </section>
        <section>
          <strong>요가/필라테스</strong>
          <ul class="hide_type half">
            <li>
            	<input type="checkbox" id="tmino_10" name="tmino[]" class="inp_chk" value="19">
            	<label for="tmino_10" class="label_chk">밴드</label>
            </li>
            <li>
            	<input type="checkbox" id="tmino_11" name="tmino[]" class="inp_chk" value="17">
            	<label for="tmino_11" class="label_chk">폼롤러</label>
            </li>
            <li>
            	<input type="checkbox" id="tmino_12" name="tmino[]" class="inp_chk" value="7">
            	<label for="tmino_12" class="label_chk">요가 짐볼</label></li>
            <li>
            	<input type="checkbox" id="tmino_13" name="tmino[]" class="inp_chk" value="15">
            	<label for="tmino_13" class="label_chk">해먹</label>
            </li>
          </ul> 
        </section>
        <section>
          <strong>복싱</strong>
          <ul class="hide_type half">
            <li>
            	<input type="checkbox" id="tmino_17" name="tmino[]" class="inp_chk" value="11">
                <label for="tmino_17" class="label_chk">글러브</label></li>
            <li>
            	<input type="checkbox" id="tmino_18" name="tmino[]" class="inp_chk" value="4">
            	<label for="tmino_18" class="label_chk">보호 용품</label></li>
            <li>
            	<input type="checkbox" id="tmino_19" name="tmino[]" class="inp_chk" value="6">
            	<label for="tmino_19" class="label_chk">훈련 용품</label></li>
            <li>
            	<input type="checkbox" id="tmino_20" name="tmino[]" class="inp_chk" value="3">
            <label for="tmino_20" class="label_chk">복싱화</label></li>
          </ul>
        </section>
        <section>
          <strong>수영</strong>
          <ul class="hide_type half">
            <li>
            	<input type="checkbox" id="tmino_17" name="tmino[]" class="inp_chk" value="11">
                <label for="tmino_17" class="label_chk">수영복</label></li>
            <li>
            	<input type="checkbox" id="tmino_18" name="tmino[]" class="inp_chk" value="4">
            	<label for="tmino_18" class="label_chk">수영모</label></li>
            <li>
            	<input type="checkbox" id="tmino_19" name="tmino[]" class="inp_chk" value="6">
            	<label for="tmino_19" class="label_chk">수경</label></li>
          </ul>
        </section>
        
     
  
        <section>
          <strong>가격
            <span><label for="amount"></label><input type="text" id="amount" class="price_val" readonly="">
              <input type="hidden" id="min_price" name="min_price" value="">
              <input type="hidden" id="max_price" name="max_price" value="">
            </span>
          </strong>
          <div class="slider_wrap">
            <div id="slider"
                 class="slider_align ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                 data-min="1" data-max="30">
              <div class="ui-slider-range ui-corner-all ui-widget-header"
                   style="left: 0%; width: 100%;"></div>
              <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 0%;"></span>
              <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 100%;"></span>
            </div><span class="price_txt">1만원</span><span class="price_txt">30만원</span>
          </div>
         </section>
      </div>
      <div class="list_wrap">
        <div class="goods-wrap">
          <div class="search-menu">
            <div class="search-box">
             <button type="button" data-sort="distance" class=""><span>거리순</span></button>
             <button type="button" data-sort="lowprice" class=""><span>낮은 가격 순</span></button>
             <button type="button" data-sort="highprice" class=""><span>높은 가격 순</span></button>
            </div>
            <button type="button" class="btn_map" onclick="pop_map_pc();">지도</button>
          </div>
          <div class="goods_list">
            <div class="goods_title"><h3>상품 리스트</h3></div>
            <li class="list_1 goods_menu1 goods_box">
              <a href="${contextPath}/goods/goodsInformation.do">
                <div class="goods_picture">
                  <img src="${contextPath}/resources/image/gym_01.PNG" alt="시설 이미지">
                </div>
                <div class="goos_impormation">
                  <div class="name">
                    <strong>숙소 명</strong>
                    <p class="score"><span><em>8.2</em></p>
                    <p> 8.6km | 강북구 수유동 </p>
                    <p class="txt_opt">예약취소가능</p>
                  </div>
                  <div class="price">
                    <div class="map_html">
                      <p>대실&nbsp;<b>15,000원</b></p>
                      <p>숙박&nbsp;<span class="build_badge" style="color: rgba(255,255,255,1); background-color: rgba(112, 173, 71, 1);">예약</span>&nbsp;<b>20,000원</b></p>
                    </div>
                  </div>    
                </div>
              </a>
            </li><!--    goods_menu1/2/3/4/5(호텔 모텔 리조트 등등 번호 순차 등록)      -->
            <li class="list_1 goods_menu1 goods_box">
              <a href="${contextPath}/goodsRoom.do">
                <div class="goods_picture">
                  <img src="https://image.goodchoice.kr/resize_1000X500x0/adimg_new/69041/19415/76471771556d9ece792699bf7c21c31c.jpg" alt="숙소 이미지">
                </div>
                <div class="goos_impormation">
                  <div class="name">
                    <strong>숙소 명</strong>
                    <p class="score"><span><em>8.2</em></p>
                    <p> 8.6km | 강북구 수유동 </p>
                    <p class="txt_opt">예약취소가능</p>
                  </div>
                  <div class="price">
                    <div class="map_html">
                      <p>대실&nbsp;<b>15,000원</b></p>
                      <p>숙박&nbsp;<span class="build_badge" style="color: rgba(255,255,255,1); background-color: rgba(112, 173, 71, 1);">예약</span>&nbsp;<b>20,000원</b></p>
                    </div>
                  </div>    
                </div>
              </a>
            </li><!--    goods_menu1/2/3/4/5(호텔 모텔 리조트 등등 번호 순차 등록)      -->
            <li class="list_1 goods_menu1 goods_box">
              <a href="${contextPath}/board/goodsInformation.do">
                <div class="goods_picture">
                  <img src="https://image.goodchoice.kr/resize_1000X500x0/adimg_new/69041/19415/76471771556d9ece792699bf7c21c31c.jpg" alt="숙소 이미지">
                </div>
                <div class="goos_impormation">
                  <div class="name">
                    <strong>숙소 명</strong>
                    <p class="score"><span><em>8.2</em></p>
                    <p> 8.6km | 강북구 수유동 </p>
                    <p class="txt_opt">예약취소가능</p>
                  </div>
                  <div class="price">
                    <div class="map_html">
                      <p>대실&nbsp;<b>15,000원</b></p>
                      <p>숙박&nbsp;<span class="build_badge" style="color: rgba(255,255,255,1); background-color: rgba(112, 173, 71, 1);">예약</span>&nbsp;<b>20,000원</b></p>
                    </div>
                  </div>    
                </div>
              </a>
            </li><!--    goods_menu1/2/3/4/5(호텔 모텔 리조트 등등 번호 순차 등록)      -->
            
          </div>
        </div>
      </div>
    </div>    
  </div>
</body>
</html>