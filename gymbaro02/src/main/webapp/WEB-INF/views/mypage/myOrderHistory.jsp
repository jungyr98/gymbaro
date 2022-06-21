<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var = "delivery_ing_total" value = "0" />
<c:set var = "delivery_done_total" value = "0" />
<c:set var = "delivery_cancel_total" value = "0" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${contextPath}/resources/css/myPage03.css">
<title>탭메뉴</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

//날짜 형식 체크 및 변경
function checkDateFormat(obj) {
	$("#searchForm [name='radioTabGuide']").attr("checked", false);
	$("#searchForm [name='period']").val('input');

	if($(obj).val() != "") {
		var only_nos = $(obj).val().replace(/[^0-9]/g, '');

		if (only_nos.length == 8) {
			var year = only_nos.substr(0, 4);
			var month = only_nos.substr(4, 2);
			var day = only_nos.substr(6, 2);
			var chg_value = year + "." + month + "." + day;
			// var hidden_chg_value = year + "-" + month + "-" + day;

			if (month > 12 || day > 31) {
				alert("날짜 형식을 잘못 입력하셨습니다.");
				chg_value = "";
			}

			$(obj).val(chg_value);
		} else {
			alert("날짜 형식을 잘못 입력하셨습니다.");
			$(obj).val("");
		}
	}
}

// 시작 기간 얻기
function setStartDate(type) {
	var time_val = "";
	var now = new Date();

	if(type == "1week") {
		time_val = now.getTime() - (7 * 24 * 60 * 60 * 1000);
	} else if(type == "1month") {
		time_val = now.getTime() - (30 * 24 * 60 * 60 * 1000);
	} else if(type == "3month") {
		time_val = now.getTime() - (91 * 24 * 60 * 60 * 1000);
	}

	if(time_val != "") {
		now.setTime(time_val);
	}

	var year= now.getFullYear();
	var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1);
	var day = now.getDate() > 9 ? '' + now.getDate() : '0' + now.getDate();

	return year + '.' + mon + '.' + day + "|" + year + '-' + mon + '-' + day;
}

// 기간 설정
function setPeriod(obj, type){
	// Type Setting
	$("#searchForm [name='period']").val(type);

	// 기간 검색 부분 Init
	$("#searchForm [name='dt_fr']").val('');
	$("#searchForm [name='dt_to']").val('');

	// 기간 부분 조건에 따라 Setting
	var now = new Date();

	var year= now.getFullYear();
	var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1);
	var day = now.getDate() > 9 ? '' + now.getDate() : '0' + now.getDate();

	var now_date = year + '.' + mon + '.' + day;

	if(type != '') {
		var start_date = setStartDate(type);
		var a_date = start_date.split('|');

		$("#searchForm [name='dt_to']").val(now_date);
		$("#searchForm [name='dt_fr']").val(a_date[0]);
	}
}

function search(){
	if($("#searchForm [name='period']").val() == 'input' && ($("#searchForm [name='dt_fr_input']").val() == '' || $("#searchForm [name='dt_to_input']").val() == '')){
		alert("검색 기간을 설정해 주세요");
		return false;
	}

	$('#searchForm').submit();
}

//테이블내 페이징
function pagination() {
	  var req_num_row = 5;
	  var $tr = jQuery("tbody tr");
	  var total_num_row = $tr.length;
	  var num_pages = 0;
	  if (total_num_row % req_num_row == 0) {
	    num_pages = total_num_row / req_num_row;
	  }
	  if (total_num_row % req_num_row >= 1) {
	    num_pages = total_num_row / req_num_row;
	    num_pages++;
	    num_pages = Math.floor(num_pages++);
	  }

	  jQuery(".pagination").append('<li><a class="prev">Previous</a></li>');
	  for (var i = 1; i <= num_pages; i++) {
	    jQuery(".pagination").append("<li><a>" + i + "</a></li>");
	    jQuery(".pagination li:nth-child(2)").addClass("active");
	    jQuery(".pagination a").addClass("pagination-link");
	  }

	  jQuery(".pagination").append('<li><a class="next">Next</a></li>');

	  $tr.each(function (i) {
	    jQuery(this).hide();
	    if (i + 1 <= req_num_row) {
	      $tr.eq(i).show();
	    }
	  });

	  jQuery(".pagination a").click(".pagination-link", function (e) {
	    e.preventDefault();
	    $tr.hide();
	    var page = jQuery(this).text();
	    var temp = page - 1;
	    var start = temp * req_num_row;
	    var current_link = temp;

	    jQuery(".pagination li").removeClass("active");
	    jQuery(this).parent().addClass("active");

	    for (var i = 0; i < req_num_row; i++) {
	      $tr.eq(start + i).show();
	    }

	    if (temp >= 1) {
	      jQuery(".pagination li:first-child").removeClass("disabled");
	    } else {
	      jQuery(".pagination li:first-child").addClass("disabled");
	      jQuery(".pagination li:last-child").removeClass("disabled");
	    }
	  });

	  jQuery(".prev").click(function (e) {
	    e.preventDefault();
	    jQuery(".pagination li:first-child").removeClass("active");
	  });

	  jQuery(".next").click(function (e) {
	    e.preventDefault();
	    jQuery(".pagination li:last-child").removeClass("active");
	  });
	}

	jQuery("document").ready(function () {
	  pagination();

	  jQuery(".pagination li:first-child").addClass("disabled");

	});
</script>
<style type="text/css">
#order_state_box img {
    background: #9099A9;
    padding: 15px;
    border-radius: 30px;
}

#order_state_box {
    display: flex;
    justify-content: space-around;
    align-items: center;
    background: #EDEFF2;
    height: 150px;
}

#order_state_box .img_span_box {
    margin-top: 10px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 95px;
}

#order_state_box .img_span_box .order_state_count {
	font-size:35px;
}

.order_info_div {
    display: flex;
    align-items: center;
    height:115px;
}

.order_info_box {
    display: flex;
    flex-direction: column;
    align-items: baseline;
    margin-left: 20px;
    height: 80px;
}

.order_info_box .order_info_span {
	font-size:14px;
}

.disabled {
pointer-events: none;
}
</style>
</head>
<body>
 <div class="myPage_box wrap show">
   <div id="content" class="sub_wrap">
  	<div class="align_rt">
      <div class="myPage03_box tab_menu">
     	<div class="first_content">
          <div class="tab_btn">
             <div id="order_state_box">
             	<c:forEach var="item" items="${myOrderList}">
                    	<c:if test="${item.order_state eq '배송중'}">
                    		<c:set var = "delivery_ing_total" value = "${delivery_ing_total + 1}" />
                    	</c:if>
                    	<c:if test="${item.order_state eq '배송완료'}">
                    		<c:set var = "delivery_done_total" value = "${delivery_done_total + 1}" />
                    	</c:if>
                    	<c:if test="${item.order_state eq '주문취소' or item.order_state eq '반품'}">
                    		<c:set var = "delivery_cancel_total" value = "${delivery_cancel_total + 1}" />
                    	</c:if>
                </c:forEach>
               	<div class="order_state_item">
               		<span>배송중</span>
               		<div class="img_span_box">
               			<img alt="" src="${contextPath}/resources/image/order_item01.png">
               			<span class="order_state_count"><c:out value="${delivery_ing_total}"/></span>
               		</div>
               	</div>
               	<div class="order_state_item">
               		<span>배송완료</span>
               		<div class="img_span_box">
               			<img alt="" src="${contextPath}/resources/image/order_item02.png">
               			<span class="order_state_count"><c:out value="${delivery_done_total}"/></span>
               		</div>
               	</div>
               	<div class="order_state_item">
               		<span>취소/반품</span>
               		<div class="img_span_box">
               			<img alt="" src="${contextPath}/resources/image/order_item03.png">
               			<span class="order_state_count"><c:out value="${delivery_cancel_total}"/></span>
               		</div>
               	</div>
             </div>
               
               <form name="searchForm" id="searchForm"  method="get" action="${contextPath}/mypage/listMyOrderHistory.do">
				<input type="hidden" name="period" value=""/>
				<input type="hidden" name="page" value="1"/>
				<div class="n-table-filter">
					<div class="n-radio-tab">
						<input type="radio" id="radioTabGuide0" name="radioTabGuide" onClick="setPeriod(this,'1week');" >
						<label for="radioTabGuide0">1주일</label>

						<input type="radio" id="radioTabGuide1" name="radioTabGuide" onClick="setPeriod(this,'1month');" >
						<label for="radioTabGuide1">1개월</label>

						<input type="radio" id="radioTabGuide2" name="radioTabGuide" onClick="setPeriod(this,'3month');" >
						<label for="radioTabGuide2">3개월</label>

						<input type="radio" id="radioTabGuide3" name="radioTabGuide" onClick="setPeriod(this,'');" checked>
						<label for="radioTabGuide3">전체 시기</label>
					</div>

					<div class="n-datepicker sb">
						<input type="text" class="n-input" name="dt_fr" value="" placeholder="-" onblur="checkDateFormat(this);">
						<img class="ui-datepicker-trigger" src="//image.msscdn.net/skin/musinsa/images/ico_calendar.png?20200528" alt="날짜 선택" title="날짜 선택">
					</div>
					<div class="n-datepicker">
						<input type="text" class="n-input" name="dt_to" value="" placeholder="-" onblur="checkDateFormat(this);">
						<img class="ui-datepicker-trigger" src="//image.msscdn.net/skin/musinsa/images/ico_calendar.png?20200528" alt="날짜 선택" title="날짜 선택">
					</div>
					<div class="n-select">
						<select name="state" id="ui-id-1" style="display: none;">
							<option value="">전체 보기</option>
														<option value="1">답변 대기</option>
														<option value="10">접수</option>
														<option value="20">업체 문의 중</option>
														<option value="30">물품 도착 확인</option>
														<option value="40">교환 상품 발송</option>
														<option value="50">답변 완료</option>
						</select>
						<span class="ui-selectmenu-button ui-widget ui-state-default ui-corner-top" tabindex="0" id="ui-id-1-button" role="combobox" aria-expanded="true" aria-autocomplete="list" aria-owns="ui-id-1-menu" aria-haspopup="true" style="width: 100%;" aria-activedescendant="ui-id-2" aria-labelledby="ui-id-2" aria-disabled="false">
							<span class="ui-icon ico ico-sm ico-ar00"></span>
							<span class="ui-selectmenu-text">전체 보기</span>
						</span>
					</div>
					<button type="button" class="n-btn btn-sm btn-accent" onclick="search();">조회</button>
				</div>
			</form>
               
          </div>
          <div class="tab_cont">
               <table class="active myPage03_table">
               		<thead>
                    <tr class="notice_board_first_tr">
                    	<td width=15%>주문번호</td>
                    	<td width=55%>주문정보</td>
                    	<td width=10%>주문상태</td>
                    	<td width=10%></td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${myOrderList}">
                    <tr>
                    	<td><a href="${contextPath}/mypage/listMyOrderDetail.do?order_id=${order.order_id}" id="order_id_atag">${order.order_id}</a></td>
                    	<td>
                    		<fmt:formatNumber  value="${order.total_price}" type="number" var="price" />
                    		<div class="order_info_div">
                    			<img width="100" style="height:95px;object-fit:cover;" alt="${order.fileName}" src="${contextPath}/thumbnails.do?goods_id=${order.goods_id}&fileName=${order.fileName}">
                    			<div class="order_info_box">
                    				<span class="order_info_span">${order.goods_name }</span>
                    				<div>
                    					<span class="order_info_span">${price }원 ${order.goods_qty }개</span>ㅣ
                    					<span class="order_info_span"><b>${order.creDate }</b></span>
                    				</div>
                    			</div>
                    		</div>
                    	</td>
                    	<td>${order.order_state }</td>
                    	<td>
                    		<c:choose>
                    			<c:when test="${order.order_state == '입금완료'}">
                    			<a href="#" id="order_state_atag">주문취소</a>
                    			</c:when>
                    		</c:choose>
                    	</td>
                    </tr>
                    </c:forEach>
                    </tbody>
               </table>
               <ul class="pagination">
    
  			   </ul>
          </div>
          </div>
     </div>
    </div>
   </div>
</div>
</body>
</html>