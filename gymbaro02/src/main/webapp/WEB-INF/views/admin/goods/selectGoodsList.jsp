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
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/admin.css">
<script type="text/javascript">
// 상품 판매 상태 수정
function updateState(goods_id) {
var checkDel = confirm("상태를 수정하시겠습니까?");
var uid = uid;
var updateState = $("select[name="+goods_id+"]").val()
	
	if(checkDel){
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/goods/updateGoodsState.do",
			data : {
				goods_id:goods_id,
				goods_state:updateState
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

// 상품 삭제하기
function deleteGoods(goods_id) {
	var checkDel = confirm("상품을 목록에서 삭제하시겠습니까?");
	
	if(checkDel){
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/goods/deleteGoods.do",
			data : {
				goods_id:goods_id
			},
			success : function(data, textStatus) {
					alert("상품이 삭제되었습니다");
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

//선택된 상품 삭제하기
function delete_check_goods(){
	var checked_item = $("input:checkbox[name='chk']:checked");
	var goods_id = new Array();
	if(checked_item.length == 0){
		alert("상품을 선택해주세요!");
		return;
	}else{
		for(var i=0; i<checked_item.length; i++){
			goods_id[i] = checked_item[i].value;
		}
		deleteGoods(goods_id);
	}
}

//선택된 상품 이벤트 적용하기
function update_goods_event(){
	var checked_item = $("input:checkbox[name='chk']:checked");
	var event_id = $('select[name="event_select"]').val();
	var goods_id = new Array();
	
	var checkDel = confirm("할인을 적용하시겠습니까?");	
	if(checkDel){
		if(checked_item.length == 0){
			alert("상품을 선택해주세요!");
			return;
		}else if(event_id == 'none'){
			alert("이벤트 옵션을 선택해주세요!");
			return;
		}else{
			for(var i=0; i<checked_item.length; i++){
				goods_id[i] = checked_item[i].value;
			}
		}
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/goods/updateGoodsEvent.do",
			traditional : true,
			data : {
				event_id:event_id,
				goods_id:goods_id
			},
			success : function(data, textStatus) {
					if(data.trim()=='modify_success'){
						alert("할인이 적용되었습니다!");
						location.reload();
					}
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

//선택된 상품 이벤트 적용 취소하기
function delete_goods_event(){
	var checked_item = $("input:checkbox[name='chk']:checked");
	var goods_id = new Array();
	
	var checkDel = confirm("할인을 해제하시겠습니까?");	
	if(checkDel){
		if(checked_item.length == 0){
			alert("상품을 선택해주세요!");
			return;
		}else{
			for(var i=0; i<checked_item.length; i++){
				goods_id[i] = checked_item[i].value;
			}
		}
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/goods/deleteGoodsEvent.do",
			traditional : true,
			data : {
				goods_id:goods_id
			},
			success : function(data, textStatus) {
					if(data.trim()=='modify_success'){
						alert("적용이 해제되었습니다!");
						location.reload();
					}
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
            $("#goodsTable > tbody > tr").hide();
            var temp = $("#goodsTable > tbody > tr > td:nth-child(5n+"+select+"):contains('" + k + "')");

            $(temp).parent().show();
        })
})
</script>
</head>
<body>
<div class="goodsList_box main_container">
	<div id="location_box">
		상품 관리
		<a href="${contextPath}/admin/goods/addNewGoodsForm.do" class="btn_a_tag"><button class="custom-btn btn-1" style="background: #0D6EFD;">새 상품 등록</button></a>
	</div>
	<div class="table_box">
		<div class="count_tr">
			<span class="glyphicon glyphicon-tag"></span>&nbsp;Total (${fn:length(listGoods)})
		</div>
		<div class="frame">
			<div style="display:flex;">
  				<select name="keword_select">
  					<option value="none">전체</option>
  					<option value="2">상품번호</option>
  					<option value="3">상품명</option>
  					<option value="4">카테고리명</option>
  				</select>
  				<div id="search_div">
  					<input type="text" name="search_text" id="search_text" class="keyword" placeholder="Search..."/>
  				</div>
  			</div>
  			<div id="event_div">
  					<select name="event_select">
  						<option value="none" selected>할인 이벤트 선택</option>
  						<c:forEach var="item" items="${listEvent}">
  						<option value="${item.event_id}">${item.event_name}</option>
  						</c:forEach>
  					</select>
  					<button class="custom-btn btn-2" onclick="update_goods_event();" style="background: #FFC107;">이벤트 적용</button>
  			</div>
  			<div>
  				<button class="custom-btn btn-1" onclick="delete_check_goods();" style="background: #198754;">선택 상품 삭제</button>
  				<button class="custom-btn btn-1" onclick="delete_goods_event();" style="background: #DC3545;">이벤트 해제</button>
  			</div>
  		</div>
		<table id="goodsTable">
		<thead>
			<tr class="fixed_tr">
				<th width="5%"><input type="checkbox" id="cbx_chkAll"></th>
				<th width="5%">
					<div id="th_box">
						<span>상품번호</span>
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
				<th width="10%">
					<div id="th_box">
						<span>상품종류</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 3 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 3 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width="10%">
					<div id="th_box">
						<span>수량</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 4 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 4 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width="20%">이벤트여부</th>
				<th width="10%">상태</th>
				<th width="10%">비고</th>
			</tr>
		</thead>
			<c:choose>
				<c:when test="${empty listGoods}">
					<tr>
						<td colspan="7">
							상품 목록이 비었습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tbody>
					<c:forEach var="item" items="${listGoods}">
						<tr>
							<td><input type="checkbox" name="chk" value="${item.goods_id}"></td>
							<td>${item.goods_id }</td>
							<td>
								<div id="goods_info_div">
								<a href="${contextPath}/admin/goods/updateGoodsForm.do?goods_id=${item.goods_id}">
									<img width="80" alt="${item.goods_fileName}" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
									<span>${item.goods_name }</span>
								</a>
								</div>
							</td>
							<td>${item.goods_main_category} > ${item.goods_sub_category}</td>
							<td>${item.goods_amount}</td>
							<td>
								<c:choose>
								<c:when test="${item.event_id > 0}">
									${item.event_name}
								</c:when>
								<c:otherwise>
									기본
								</c:otherwise>
								</c:choose>
							</td>
							<td>
									<c:if test="${item.goods_state == '판매중'}">
										<select name="${item.goods_id}" style="color:#0078ff;">
											<option value="${item.goods_state}" selected>판매중</option>
											<option value="비활성화">비활성화</option>
										</select>
									</c:if>
									<c:if test="${item.goods_state == '비활성화'}">
										<select name="${item.goods_id}" style="color:tomato;">
											<option value="판매중">판매중</option>
											<option value="${item.goods_state}" selected>비활성화</option>
										</select>
									</c:if>
							</td>
							<td>
								<a onclick="updateState(${item.goods_id})">수정</a>
								<a onclick="deleteGym(${item.goods_id})">삭제</a>
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
			var myTable = document.getElementById( "goodsTable" ); 
			var replace = replacement( myTable ); 
			function sortTD( index ){    replace.ascending( index );    } 
			function reverseTD( index ){    replace.descending( index );    } 
		</script>
	</div>
</div>
</body>
</html>