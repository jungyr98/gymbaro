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
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="${contextPath}/resources/css/myPage03.css">
     <title>탭메뉴</title>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
    var tab_Btn = $(".tab_btn > ul > li");
    var tab_Cont = $(".tab_cont > table");
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
#point_state_box #point_imo{
    height: 42px;
    width: 42px;
    border-radius: 4px;
    font-size: 26px;
    color: #9099A9;
    font-weight: bold;
    border: 3px solid #9099A9;
    text-align:center;
}

#point_state_box {
    display: flex;
    justify-content: space-around;
    align-items: center;
    background: #EDEFF2;
    height: 150px;
}

#point_state_box .img_span_box {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width:190px;
    height: 50px;
}

#point_state_box .img_span_box .order_state_count {
	font-size:35px;
	padding-bottom: 5px;
	color: #9099A9;
}

.point_state_item {
	text-align: left;
}

.point_info_div {
    display: flex;
    align-items: center;
    height:115px;
}

.point_info_box {
    display: flex;
    flex-direction: column;
    align-items: baseline;
    margin-left: 20px;
    height: 80px;
}

.point_info_box .point_info_span {
	font-size:14px;
}

#point_state_title {
	color: #9D9D9E;
    font-size: 12px;
    font-weight: bold;
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
          	<div id="point_state_box">
               	<div class="point_state_item">
               		<span id="point_state_title">보유 포인트</span>
               		<div class="img_span_box">
               			<span id="point_imo">P</span>
               			<fmt:formatNumber  value="${myInfo.member_point}" type="number" var="point" />
               			<span class="order_state_count">${point}원</span>
               		</div>
               	</div>
             </div>               
                <form name="searchForm" id="searchForm"  method="get" action="${contextPath}/mypage/listMyPointHistory.do">
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
               <table class="myPage03_table">
               	<thead>
                   <tr class="notice_board_first_tr">
                    	<td width=15%>상태</td>
                    	<td width=15%>포인트</td>
                    	<td width=40%>적립 내용</td>
                    	<td width=15%>주문번호</td>
                    	<td width=15%>적용 일시</td>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="point" items="#{myPointList}">
                    <fmt:formatNumber  value="${point.point}" type="number" var="use_point" />
                    <tr>
                    	<td>
                    		<c:choose>
                    			<c:when test="${point.point_state=='적립'}">
                    			<span style="color:#0078FF">${point.point_state }</span>
                    			</c:when>
                    			<c:otherwise>
                    			<span style="color:#FF0000">${point.point_state }</span>
                    			</c:otherwise>
                    		</c:choose>
                    	</td>
                    	<td>
                    		<c:choose>
                    			<c:when test="${point.point_state=='적립'}">
                    			<span style="color:#0078FF">+ ${use_point}</span>
                    			</c:when>
                    			<c:otherwise>
                    			<span style="color:#FF0000">- ${use_point}</span>
                    			</c:otherwise>
                    		</c:choose>
                    	</td>
                    	<td>${point.his_contents}</td>
                    	<td>${point.order_id}</td>
                    	<td>${point.creDate}</td>
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