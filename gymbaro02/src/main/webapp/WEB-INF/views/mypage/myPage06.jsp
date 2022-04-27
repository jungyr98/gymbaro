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

</script>

</head>
<body>
 <div class="myPage_box wrap show">
      <div class="sub_top_wrap">
        <div class="sub_top">   
          <img class="myPageUser_icon" alt="myPageUser.png" src="${contextPath}/resources/image/myPageUser.png">
          <div class="sub_top_member_info_box">
           	<span class="member_id_span">${memberInfo.member_id}</span>
           	<div class="level_and_joinDate">
           		<span>LV.${memberInfo.member_level} 멤버</span>
           		<span class="joinDate_span">가입일 : <fmt:formatDate value="${memberInfo.joinDate}" type="date"/></span>
           	</div>	
          </div>
          <div class="sub_top_member_service_box">
           	<span><img src="${contextPath}/resources/image/point.png">포인트 > ${memberInfo.member_point}</span>
           	<span><img src="${contextPath}/resources/image/coupon.png">보유 쿠폰 > 0개</span>
          </div>
        </div>
      </div>
      <div id="content" class="sub_wrap">
        <nav>
          <ul>
            <li>
              <a href="${contextPath}/mypage/mypage.do">회원정보 수정</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage02.do">주문/배송</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage03.do">쿠폰/포인트</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage04.do">예약 내역</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage05.do">내 게시물 관리</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage06.do" class="active">1:1 문의 내역</a>
            </li>
          </ul>
        </nav>
  <div class="align_rt">
      <div class="myPage03_box tab_menu">
     	<div class="first_content">
          <div class="tab_btn">
               <ul>
                    <li class="active"><a href="#">1:1 문의 내역<img alt="coupon.png" src="${contextPath}/resources/image/customer-care.png"></a></li>
               </ul>
               
                <form name="searchForm" id="searchForm"  method="get" action="/app/mypage/qa">
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
                    <tr class="notice_board_first_tr">
                    	<td width=20%>번호</td>
                    	<td width=40%>항목</td>
                    	<td width=20%>작성일</td>
                    	<td width=20%>처리 상태</td>
 
                    </tr>
                    <c:forEach begin="0" end="10" step="1">
                    <tr>
                    	<td>12</td>
                    	<td>교환/반품</td>
                    	<td>2022-04-03</td>
                    	<td>답변 완료</td>
                    </tr>
                    </c:forEach>
               </table>
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
    </div>
   </div>
</div>
</body>
</html>