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
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/myPage03.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	
function drawVisualization() {
	var total_price1 = $('input[name="total_price1"]').val();
	var total_price2 = $('input[name="total_price2"]').val();
	var total_date1 = $('input[name="total_date1"]').val();
	var total_date2 = $('input[name="total_date2"]').val();
	
	var data = google.visualization.arrayToDataTable([
		['Month', '예약'],
		['2022/03', 0],
		['2022/04', 0],
		[total_date1, total_price1],
		[total_date2, total_price2]
	]);
	var options = {
		title : "",
		vAxis: {title: ''},
		hAxis: {title: '예약 월별 통합 매출'},
		seriesType: 'bars',
		series: {4: {type: 'line'}}
	};
	
	var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	chart.draw(data, options);
}


function sortingNumber( a , b ){  

    if ( typeof a == "number" && typeof b == "number" ) return a - b; 

    // 천단위 쉼표와 공백문자만 삭제하기.  
    var a = ( a + "" ).replace( /[,\s\xA0]+/g , "" ); 
    var b = ( b + "" ).replace( /[,\s\xA0]+/g , "" ); 

    var numA = parseFloat( a ) + ""; 
    var numB = parseFloat( b ) + ""; 

    if ( numA == "NaN" || numB == "NaN" || a != numA || b != numB ) return false; 

    return parseFloat( a ) - parseFloat( b ); 
} 


/* changeForSorting() : 문자열 바꾸기. */ 

function changeForSorting( first , second ){  

    // 문자열의 복사본 만들기. 
    var a = first.toString().replace( /[\s\xA0]+/g , " " ); 
    var b = second.toString().replace( /[\s\xA0]+/g , " " ); 

    var change = { first : a, second : b }; 

    if ( a.search( /\d/ ) < 0 || b.search( /\d/ ) < 0 || a.length == 0 || b.length == 0 ) return change; 

    var regExp = /(\d),(\d)/g; // 천단위 쉼표를 찾기 위한 정규식. 

    a = a.replace( regExp , "$1" + "$2" ); 
    b = b.replace( regExp , "$1" + "$2" ); 

    var unit = 0; 
    var aNb = a + " " + b; 
    var numbers = aNb.match( /\d+/g ); // 문자열에 들어있는 숫자 찾기 

    for ( var x = 0; x < numbers.length; x++ ){ 

            var length = numbers[ x ].length; 
            if ( unit < length ) unit = length; 
    } 

    var addZero = function( string ){ // 숫자들의 단위 맞추기 

            var match = string.match( /^0+/ ); 

            if ( string.length == unit ) return ( match == null ) ? string : match + string; 

            var zero = "0"; 

            for ( var x = string.length; x < unit; x++ ) string = zero + string; 

            return ( match == null ) ? string : match + string; 
    }; 

    change.first = a.replace( /\d+/g, addZero ); 
    change.second = b.replace( /\d+/g, addZero ); 

    return change; 
} 


/* byLocale() */ 

function byLocale(){ 

    var compare = function( a , b ){ 

            var sorting = sortingNumber( a , b ); 

            if ( typeof sorting == "number" ) return sorting; 

            var change = changeForSorting( a , b ); 

            var a = change.first; 
            var b = change.second; 

            return a.localeCompare( b ); 
    }; 

    var ascendingOrder = function( a , b ){  return compare( a , b );  }; 
    var descendingOrder = function( a , b ){  return compare( b , a );  }; 

    return { ascending : ascendingOrder, descending : descendingOrder }; 
} 


/* replacement() */ 

function replacement( parent ){  
    var tagName = parent.tagName.toLowerCase(); 
    if ( tagName == "table" ) parent = parent.tBodies[ 0 ]; 
    tagName = parent.tagName.toLowerCase(); 
    if ( tagName == "tbody" ) var children = parent.rows; 
    else var children = parent.getElementsByTagName( "li" ); 

    var replace = { 
            order : byLocale(), 
            index : false, 
            array : function(){ 
                    var array = [ ]; 
                    for ( var x = 0; x < children.length; x++ ) array[ x ] = children[ x ]; 
                    return array; 
            }(), 
            checkIndex : function( index ){ 
                    if ( index ) this.index = parseInt( index, 10 ); 
                    var tagName = parent.tagName.toLowerCase(); 
                    if ( tagName == "tbody" && ! index ) this.index = 0; 
            }, 
            getText : function( child ){ 
                    if ( this.index ) child = child.cells[ this.index ]; 
                    return getTextByClone( child ); 
            }, 
            setChildren : function(){ 
                    var array = this.array; 
                    while ( parent.hasChildNodes() ) parent.removeChild( parent.firstChild ); 
                    for ( var x = 0; x < array.length; x++ ) parent.appendChild( array[ x ] ); 
            }, 
            ascending : function( index ){ // 오름차순 
                    this.checkIndex( index ); 
                    var _self = this; 
                    var order = this.order; 
                    var ascending = function( a, b ){ 
                            var a = _self.getText( a ); 
                            var b = _self.getText( b ); 
                            return order.ascending( a, b ); 
                    }; 
                    this.array.sort( ascending ); 
                    this.setChildren(); 
            }, 
            descending : function( index ){ // 내림차순
                    this.checkIndex( index ); 
                    var _self = this; 
                    var order = this.order; 
                    var descending = function( a, b ){ 
                            var a = _self.getText( a ); 
                            var b = _self.getText( b ); 
                            return order.descending( a, b ); 
                    }; 
                    this.array.sort( descending ); 
                    this.setChildren(); 
            } 
    }; 
    return replace; 
} 

function getTextByClone( tag ){  
    var clone = tag.cloneNode( true ); // 태그의 복사본 만들기. 
    var br = clone.getElementsByTagName( "br" ); 
    while ( br[0] ){ 
            var blank = document.createTextNode( " " ); 
            clone.insertBefore( blank , br[0] ); 
            clone.removeChild( br[0] ); 
    } 
    var isBlock = function( tag ){ 
            var display = ""; 
            if ( window.getComputedStyle ) display = window.getComputedStyle ( tag, "" )[ "display" ]; 
            else display = tag.currentStyle[ "display" ]; 
            return ( display == "block" ) ? true : false; 
    }; 
    var children = clone.getElementsByTagName( "*" ); 
    for ( var x = 0; x < children.length; x++){ 
            var child = children[ x ]; 
            if ( ! ("value" in child) && isBlock(child) ) child.innerHTML = child.innerHTML + " "; 
    } 
    var textContent = ( "textContent" in clone ) ? clone.textContent : clone.innerText; 
    return textContent; 
}


// 테이블내 페이징
function pagination() {
	  var req_num_row = 10;
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
	

// 테이블내 키워드 검색
$(document).ready(function() {
        $(".keyword").keyup(function() {
            var k = $(this).val();
            var select = $('select[name="keword_select"]').val();
            $("#salesTable > tbody > tr").hide();
            var temp = $("#salesTable > tbody > tr > td:nth-child(5n+"+select+"):contains('" + k + "')");

            $(temp).parent().show();
        })
})
</script>
</head>
<body>
 <div class="myPage_box wrap show">
 	<c:forEach var="item" items="${salesMap.listMonthSales}" varStatus="cnt">
		<input type="hidden" name="total_price${cnt.count}" value="${item.total_price}" />
		<input type="hidden" name="total_date${cnt.count}" value="${item.date}" />
	</c:forEach>
   <div id="content" class="sub_wrap">
  	<div class="align_rt">
      <div class="myPage03_box tab_menu">
     	<div class="first_content">
          <div class="tab_btn">
             <div id="order_state_box" style="margin-bottom:10px;">
				<div id="chart_div"></div>
             </div>               
               <form name="searchForm" id="searchForm"  method="get" action="${contextPath}/mypage/myGymSales.do">
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
                    	<td width=50%>총매출</td>
                    	<td width=50%>일자</td>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${salesMap.listDaySales}">
                    <tr>
                    	<td>
                    		<fmt:formatNumber  value="${item.total_price}" type="number" var="total_price" />
							${total_price}원
                    	</td>
                    	<td>${item.date }</td>
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