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
<link rel="stylesheet" href="${contextPath}/resources/css/notice.css">
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

function login_yn(isLogOn) {
	if(isLogOn != '' && isLogOn != 'false') {
		location.href = '${contextPath}/notice/noticeWrite.do';
	} else {
		var no_login = confirm("로그인 후 공지사항 작성이 가능합니다.");
		location.href = '${contextPath}/member/loginForm.do';		
	}
}

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

function fn_paging(pageNum){
	var dt_fr = $("#dt_fr").val();
	var dt_to = $("#dt_to").val();
	var search_select =  $("#search_select").val();
	var search_keyword = $("#search_keyword").val();
	location.href="${contextPath}/notice/notice.do?curPage="+pageNum+"&dt_fr="+dt_fr+"&dt_to="+dt_to+"&search_select="+search_select+"&search_keyword="+search_keyword;
}

//셀렉트 박스 체인지 부분
var selectBoxChange_search = function(value){
	$('input[name="search_select"]').val(value);
}
</script>
<style type="text/css">
.notice_box .tab_btn ul .active {
    background: rgb(24, 71, 152);
    color:white;
}
.notice_box .tab_btn ul .active a{
	color:white;
}

.n-table-filter {
	margin: 10px 0;
}

.n-table-filter .n-select {
  width: 100px;
}

.n-table-filter .n-radio-tab, .n-table-filter .n-datepicker, .n-table-filter .n-select {
    display: block;
    float: left;
    margin-right: 20px;
}

.n-hidden, .n-radio-tab input, .n-check, .n-radio {
    display: block;
    position: absolute;
    overflow: hidden;
    width: 1px;
    height: 1px;
    margin: -1px;
    clip: rect(0 0 0 0);
}

.n-radio-tab input + label {
    display: inline-block;
    min-width: 76px;
    border: 1px solid #f1f1f1;
    color: #777777;
    font-size: 14px;
    line-height: 30px;
    float: left;
    margin-right: -1px;
    text-align: center;
    vertical-align: top;
    position: relative;
    cursor: pointer;
    background: white;
}

.n-radio-tab input:checked + label {
    border-color: #000000;
    color: #000000;
    z-index: 1;
}

.n-table-filter .n-datepicker.sb {
    margin-right: 10px;
}
.n-table-filter .n-datepicker {
    width: 120px;
}

.n-table-filter .n-radio-tab, .n-table-filter .n-datepicker, .n-table-filter .n-select {
    display: block;
    float: left;
    margin-right: 20px;
}
.n-datepicker, .vdp-datepicker {
    display: inline-block;
    position: relative;
}

.n-table-filter .n-btn {
    min-width: 90px;
    margin-left: 10px;
}
.n-btn.btn-accent {
    border: 1px solid #000000;
    background-color: #000000;
}
.n-btn.btn-sm {
    min-width: 70px;
    height: 32px;
    line-height: 30px;
    padding-top: 0;
    margin-bottom: 4px;
    font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif !important;
}

.n-btn {
    display: inline-block;
    min-width: 100px;
    height: 40px;
    line-height: 36px;
    color: #ffffff;
    box-sizing: border-box;
    padding: 2px 8px 0 8px;
    font-size: 14px;
    text-align: center;
    cursor: pointer;
    vertical-align: middle;
    -webkit-transition: border 0.2s, background 0.2s ease-in-out;
    -moz-transition: border 0.2s, background 0.2s ease-in-out;
    -o-transition: border 0.2s, background 0.2s ease-in-out;
    transition: border 0.2s, background 0.2s ease-in-out;
}

.n-datepicker .n-input, .vdp-datepicker .n-input {
    width: 100%;
    padding-right: 30px;
}
.notice_box input[type="text"] {
    text-indent: 3px;
}
.n-input {
    height: 32px;
    padding: 5px 6px;
    border: 1px solid #e5e5e5;
    background-color: #ffffff;
    box-sizing: border-box;
    font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif !important;
    font-size: 14px;
    line-height: 20px;
    -webkit-transition: border 0.2s ease-in-out;
    -moz-transition: border 0.2s ease-in-out;
    -o-transition: border 0.2s ease-in-out;
    transition: border 0.2s ease-in-out;
}

.n-datepicker .vdp-datepicker__trigger, .n-datepicker .ui-datepicker-trigger, .vdp-datepicker .vdp-datepicker__trigger, .vdp-datepicker .ui-datepicker-trigger {
    position: absolute;
    right: 4px;
    top: 4px;
}

.n-select .ui-selectmenu-button {
    display: inline-block;
    width: 100%;
    height: 32px;
    box-sizing: border-box;
    border: 1px solid #e5e5e5;
    color: black;
    cursor: default;
    position: relative;
    -webkit-transition: border 0.2s ease-in-out;
    -moz-transition: border 0.2s ease-in-out;
    -o-transition: border 0.2s ease-in-out;
    transition: border 0.2s ease-in-out;
}

.n-select .ui-selectmenu-button .ui-icon {
    position: absolute;
    right: 4px;
    top: 4px;
}

.n-select .ui-selectmenu-button .ui-selectmenu-text {
    display: block;
    font-family: "Apple SD Gothic Neo", "Noto Sans KR", sans-serif !important;
    font-size: 14px;
    line-height: 30px;
    padding: 0 32px 0 10px;
}

.n-select .search_input_box {
	
}

#searchForm {
	display:flex;
	align-items:center;
	justify-content:center;
}

#now_pageNum {
    border: 1px solid #ddd;
    background: white;
    padding-right: 8px;
}
</style>
</head>
<body>
     <div class="notice_box tab_menu">
     <div class="first_content">
     <div class="first_text"><!--상단 제목-->
              <span><b>공 지 사 항</b></span>
           </div>
          <div class="tab_btn">
               <ul>
                    <li class="active"><a href="#">공지사항</a></li>
                    <li><a href="#">이벤트</a></li>
               </ul>
          </div>
          <div class="tab_cont">
               <table class="active">
                    <tr class="notice_board_first_tr">
                    	<td width=10%>공지 번호</td>
                    	<td width=60%>제목</td>
                    	<td width=10%>작성자</td>
                    	<td width=10%>작성일</td>
                    	<td width=10%>조회수</td>
                    </tr>
                    <c:forEach begin="0" end="10" step="1" var="viewAll" items="${viewAll}">
                    <c:if test="${viewAll.notice_category == '공지사항'}">
                    <c:choose>
                    <c:when test="${viewAll.impt_notice == 'Y'}">
                    <tr bgcolor="#F9F9F8">
                      	<td><strong class="impt_notice_text">필독</strong></td>
                    	<td style="text-align:left;">
                    		<a href="${contextPath}/notice/noticeDetail.do?noticeNo=${viewAll.noticeNo}" style="color:#ff4e59;font-size:14px;">
                    			<strong><span class="category_head">[${viewAll.notice_category}]</span> ${viewAll.title}</strong>
                    		</a>
                    	</td>
                    	<td>${viewAll.notice_writer}</td>
                    	<td><fmt:formatDate value="${viewAll.regDate}" pattern="YYYY-MM-dd"></fmt:formatDate></td>
                    	<td>${viewAll.view_cnt}</td>
                    </tr>
                    </c:when>
                    <c:otherwise>
                       <tr>
                    	<td>${viewAll.noticeNo}</td>
                    	<td style="text-align:left;">
                    		<a href="${contextPath}/notice/noticeDetail.do?noticeNo=${viewAll.noticeNo}" style="font-size:14px;">
                    		<span class="category_head">[${viewAll.notice_category}]</span> ${viewAll.title}
                    		</a>
                    	</td>
                    	<td>${viewAll.notice_writer}</td>
                    	<td><fmt:formatDate value="${viewAll.regDate}" pattern="YYYY-MM-dd"></fmt:formatDate></td>
                    	<td>${viewAll.view_cnt}</td>
                    </tr>
                    </c:otherwise>
                    </c:choose>
                    </c:if>
                    </c:forEach>
               </table>
               <table>
                   <tr class="notice_board_first_tr">
                    	<td width=15%>이벤트 번호</td>
                    	<td width=40%>제목</td>
                    	<td width=15%>작성자</td>
                    	<td width=20%>작성일</td>
                    	<td width=10%>조회수</td>
                    </tr>
                    <c:forEach begin="0" end="10" step="1" var="viewAll" items="${viewAll}">
                    <c:if test="${viewAll.notice_category == '이벤트'}">
                    <tr>
                    	<td>${viewAll.noticeNo}</td>
                    	<td><a href="${contextPath}/notice/noticeDetail.do?noticeNo=${viewAll.noticeNo}">${viewAll.title}</a></td>
                    	<td>${viewAll.notice_writer}</td>
                    	<td><fmt:formatDate value="${viewAll.regDate}" pattern="YYYY-MM-dd"></fmt:formatDate></td>
                    	<td>${viewAll.view_cnt}</td>
                    </tr>
                    </c:if>
                    </c:forEach>
               </table>
          </div>
		<div class="noticeWrite_btn_box">
			<c:if test="${not empty memberInfo and memberInfo.member_level == 4}">
			<a href="javascript:login_yn('${isLogOn}')" id="writeBtn">공지사항 작성하기</a>
			</c:if>
		</div>	
        </div>
        <DIV id="page_wrap">
          <div>
                    <c:if test="${pagination.curRange ne 1 }">
                        <a href="#" onClick="fn_paging(1)">[처음]</a> 
                    </c:if>
                    <c:if test="${pagination.curPage ne 1}">
                        <a href="#" onClick="fn_paging('${pagination.prevPage }')"><span class="glyphicon glyphicon-menu-left"></span>이전</a> 
                    </c:if>
                    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq  pagination.curPage}">
                                <span id="now_pageNum"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                            </c:when>
                            <c:otherwise>
                                <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.nextPage }')">다음 <span class="glyphicon glyphicon-menu-right"></span></a> 
                    </c:if>
                    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
                    </c:if>
                </div>
                
                <div style="display:none;">
                    총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
                </div>
		 <form name="searchForm" id="searchForm"  method="get" action="${contextPath}/notice/notice.do">
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
						<select name="state" class="ui-selectmenu-button" id="ui-id-1" onChange="selectBoxChange_search(this.value);">
							<option value="title">제목만</option>
							<option value="writer">글작성자</option>
						</select>
						<input type="hidden" name="search_select" value="title" />
					</div>
					<input type="text" placeholder="검색어를 입력해주세요" name="search_keyword" class="search_input_box n-input" />
					<button type="button" class="n-btn btn-sm btn-accent" onclick="search();">조회</button>
				</div>
			</form>
		</DIV>
     </div>
</body>
</html>