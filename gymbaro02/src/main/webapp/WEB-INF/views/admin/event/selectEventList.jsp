<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/admin.css">
<script type="text/javascript">

// 이벤트 추가하기
function addNewEvent() {
	var event_name = $('input[name="event_name"]').val();
	var discount = $('input[name="discount"]').val();
	var addCheck = confirm("이벤트를 추가하시겠습니까?");
	
	if(addCheck){
		if(event_name.length == 0){
			alert("이벤트명을 입력해주세요!");
			return;
		}
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/event/addNewEvent.do",
			data : {
				"event_name":event_name,
				"discount":discount
			},
			success : function(data, textStatus) {
					if(data.trim()=='addSuccess'){
						alert("이벤트가 추가되었습니다!");
						location.reload();
					}
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			}
		}); //end ajax
	}else{
		return false;
	}
}

// 이벤트 수정하기 (이벤트명, 할인율도 변경 됐을 시 Y,N 여부 값도 보내주기)
function updateEvent(event_id, cnt) {
	var event_name = $('input[name="event_name'+cnt+'"]').val();
	var discount = $('input[name="discount'+cnt+'"]').val();
	var old_discount = $('input[name="old_discount'+cnt+'"]').val();
	var discount_update = "N";
	
	if(discount != old_discount) {
		discount_update = "Y";
	}
	
	var updateCheck = confirm("이벤트를 추가하시겠습니까? *할인율 변경시 적용되어있는 상품의 할인가격도 변경됩니다");
	
	if(updateCheck){
		if(event_name.length == 0){
			alert("이벤트명을 입력해주세요!");
			return;
		}else if(discount > 99 || discount < 1){
			alert("할인율은 최소 1%, 최대 99% 입니다");
			return;
		}
		console.log(event_name, discount, old_discount, discount_update);
		console.log("아작스전");
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/event/updateEvent.do",
			data : {
				event_id:event_id,
				event_name:event_name,
				discount:discount,
				discount_update:discount_update
			},
			success : function(data, textStatus) {
					if(data.trim()=='updateSuccess'){
						alert("이벤트가 변경되었습니다!");
						location.reload();
					}
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			}
		}); //end ajax
	}else{
		return false;
	}
}


//선택된 이벤트 삭제하기
function delete_check_event(){
	var checked_item = $("input:checkbox[name='chk']:checked");
	var event_id = new Array();

	if(checked_item.length == 0){
		alert("상품을 선택해주세요!");
		return;
	}
	for(var i=0; i<checked_item.length; i++){
		event_id[i] = checked_item[i].value;
	}
	deleteEvent(event_id);
}

//이벤트 삭제하기
function deleteEvent(event_id) {
	var checkDel = confirm("이벤트를 삭제하시겠습니까? *해당 이벤트가 적용된 상품의 할인 이벤트도 해제됩니다");
	
	if(checkDel){
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/event/deleteEvent.do",
			traditional : true,
			data : {
				event_id:event_id
			},
			success : function(data, textStatus) {
					alert("이벤트 삭제되었습니다");
					location.reload();				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			}
		}); //end ajax
	} else {
		alert("취소하셨습니다");
		location.reload();
		return false;
	}
}


$(document).ready(function() {
	$("#cbx_chkAll").click(function() {
		if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});

	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;

		if(total != checked) $("#cbx_chkAll").prop("checked", false);
		else $("#cbx_chkAll").prop("checked", true); 
	});
});


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
            $("#eventTable > tbody > tr").hide();
            var temp = $("#eventTable > tbody > tr > td:nth-child(5n+"+select+"):contains('" + k + "')");

            $(temp).parent().show();
        })
})
</script>
</head>
<body>
<div class="eventList_box main_container">
	<div id="location_box">
		이벤트 관리
	</div>
	<div class="table_box" style="margin-bottom:20px;">
		<table>
			<thead>
				<tr class="fixed_tr" style="text-align: center;">
					<td>이벤트명</td>
					<td>할인율</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<tr style="text-align: center;">
					<td>
						<input type="text" name="event_name" class="add_input" maxlength="40" />
					</td>
					<td>
						<input type="number" name="discount" class="add_input" />
					</td>
					<td>
						<a class="btn_a_tag"><button type="button" onclick="addNewEvent();" class="custom-btn btn-1" style="background: #0D6EFD;">새 이벤트 등록</button></a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="table_box">
		<div class="count_tr">
			<span class="glyphicon glyphicon-tag"></span>&nbsp;Total (${fn:length(listEvent)})
		</div>
		<div class="frame">
			<div style="display:flex;">
  				<select name="keword_select">
  					<option value="none">전체</option>
  					<option value="2">이벤트 번호</option>
  					<option value="3">이벤트명</option>
  					<option value="4">할인율</option>
  				</select>
  				<div id="search_div">
  					<input type="text" name="search_text" id="search_text" class="keyword" placeholder="Search..."/>
  				</div>
  			</div>
  			<div>
  				<button class="custom-btn btn-1" onclick="delete_check_event();" style="background: #DC3545;">선택 이벤트 삭제</button>
  			</div>
  		</div>
		<table id="eventTable">
		<thead>
			<tr class="fixed_tr">
				<th style="width:5%"><input type="checkbox" id="cbx_chkAll"></th>
				<th style="width:10%">
					<div id="th_box">
						<span>이벤트번호</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 1 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 1 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width="30%">이벤트명</th>
				<th width="10%">할인율</th>
				<th width="10%">비고</th>
			</tr>
		</thead>
			<c:choose>
				<c:when test="${empty listEvent}">
					<tr>
						<td colspan="5">
							이벤트 목록이 비었습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tbody>
					<c:forEach var="item" items="${listEvent}" varStatus="cnt">
						<tr>
							<td><input type="checkbox" name="chk" value="${item.event_id}"></td>
							<td>${item.event_id }</td>
							<td>
								<input type="text" name="event_name${cnt.count}" class="input_event_name" maxlength="40" value="${item.event_name}">
							</td>
							<td>
								<input type="number" name="discount${cnt.count}" class="input_discount" min="0" max="99" value="${item.discount}">%
								<input type="hidden" name="old_discount${cnt.count}" value="${item.discount}">
							</td>
							<td>
								<a onclick="updateEvent(${item.event_id},${cnt.count})">수정</a>
								<a onclick="deleteEvent(${item.event_id})">삭제</a>
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
			var myTable = document.getElementById( "eventTable" ); 
			var replace = replacement( myTable ); 
			function sortTD( index ){    replace.ascending( index );    } 
			function reverseTD( index ){    replace.descending( index );    } 
		</script>
	</div>
</div>
</body>
</html>