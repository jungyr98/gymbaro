<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/admin.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//주문 상태 수정
function updateOrderState(order_id) {
var check = confirm("상태를 수정하시겠습니까?");
var updateState = $("select[name="+order_id+"]").val()
	
	if(check){
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/order/updateOrderState.do",
			data : {
				order_id:order_id,
				order_state:updateState
			},
			success : function(data, textStatus) {
					alert("상태가 변경되었습니다");
					location.reload();				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			}
		}); //end ajax
	} else {
		alert("취소하셨습니다");
		return false;
	}
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
	

// 테이블내 키워드 검색
$(document).ready(function() {
        $(".keyword").keyup(function() {
            var k = $(this).val();
            var select = $('select[name="keword_select"]').val();
            $("#orderTable > tbody > tr").hide();
            var temp = $("#orderTable > tbody > tr > td:nth-child(5n+"+select+"):contains('" + k + "')");

            $(temp).parent().show();
        })
})
</script>
</head>
<body>
<div class="orderList_box main_container">
	<div id="location_box">
		주문 관리
	</div>
	<div class="table_box">
		<div class="count_tr">
			<span class="glyphicon glyphicon-tag"></span>&nbsp;Total (${fn:length(listOrder)})
		</div>
		<div class="frame">
			<div style="display:flex;">
  				<select name="keword_select">
  					<option value="none">전체</option>
  					<option value="1">주문번호</option>
  					<option value="2">상품명</option>
  					<option value="5">주문자명</option>
  					<option value="7">주문일자</option>
  				</select>
  				<div id="search_div">
  					<input type="text" name="search_text" id="search_text" class="keyword" placeholder="Search..."/>
  				</div>
  			</div>
  		</div>
		<table id="orderTable">
		<thead>
			<tr class="fixed_tr">
				<th width="10%">
					<div id="th_box">
						<span>주문번호</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 1 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 1 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width="30%">
					<div id="th_box">
						<span>상품명</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 2 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 2 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width="10%">수량</th>
				<th width="10%">
					<div id="th_box">
						<span>회원/비회원</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 3 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 3 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width="10%">
					<div id="th_box">
						<span>주문자명</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 4 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 4 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width="10%">상태</th>
				<th width="10%">
					<div id="th_box">
						<span>주문일자</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 5 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 5 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width="10%">비고</th>
			</tr>
		</thead>
			<c:choose>
				<c:when test="${empty listOrder}">
					<tr>
						<td colspan="7">
							상품 목록이 비었습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tbody>
					<c:forEach var="item" items="${listOrder}">
						<tr class="order_tr">
							<td>${item.order_id }</td>
							<td><span>${item.goods_name }</span></td>
							<td>${item.goods_qty}개</td>
							<td>
								<c:if test="${item.member_yn eq 'Y'}">
									회원
								</c:if>
								<c:if test="${item.member_yn eq 'N'}">
									비회원
								</c:if>
							</td>
							<td>${item.orderer_name}</td>
							<td>
									<c:if test="${item.order_state eq '주문취소'}">
										<span style="color:tomato;">${item.order_state}</span>
									</c:if>
									<c:if test="${item.order_state eq '입금완료'}">
										<select name="${item.order_id}" style="color:#198754;">
											<option value="주문취소">주문취소</option>
											<option value="${item.order_state}" selected>입금완료</option>
											<option value="배송중">배송중</option>
											<option value="배송완료">배송완료</option>
										</select>
									</c:if>
									<c:if test="${item.order_state eq '배송중'}">
										<select name="${item.order_id}" style="color:orange;">
											<option value="${item.order_state}" selected>배송중</option>
											<option value="배송완료">배송완료</option>
										</select>
									</c:if>
									<c:if test="${item.order_state eq '배송완료'}">
										<select name="${item.order_id}" style="color:#0078ff;">
											<option value="${item.order_state}" selected>배송완료</option>
											<option value="교환">교환</option>
											<option value="반품">반품</option>
										</select>
									</c:if>
									<c:if test="${item.order_state eq '교환' or item.order_state eq '반품'}">
										<span style="color:tomato;">${item.order_state}</span>
										<option value="배송완료">배송완료</option>
									</c:if>
							</td>
							<td>
								<fmt:formatDate value="${item.creDate}" pattern="yyyy-MM-dd"/>
							</td>
							<td>
								<a onclick="updateOrderState(${item.order_id})">수정</a>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</c:otherwise>
			</c:choose>
		</table>
		<ul class="pagination">
    
  		</ul>
		<script type="text/javascript">
			var myTable = document.getElementById( "orderTable" ); 
			var replace = replacement( myTable ); 
			function sortTD( index ){    replace.ascending( index );    } 
			function reverseTD( index ){    replace.descending( index );    } 
		</script>
	</div>
</div>
</body>
</html>