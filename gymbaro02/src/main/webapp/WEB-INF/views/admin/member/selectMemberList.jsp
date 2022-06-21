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
<link rel="stylesheet" href="${contextPath}/resources/css/admin.css">
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


// 회원 등급 수정
function updateLevel(uid) {
var checkDel = confirm("등급을 수정하시겠습니까?");
var uid = uid;
var updateLevel = $("select[name="+uid+"]").val()
	
	if(checkDel){
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/member/updateMemberLevel.do",
			data : {
				uid:uid,
				member_level:updateLevel
			},
			success : function(data, textStatus) {
					alert("권한이 변경되었습니다");
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

// 회원 삭제하기
function deleteMember(uid) {
	var checkDel = confirm("회원을 삭제하시겠습니까?");
	
	if(checkDel){
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/member/deleteMember.do",
			traditional : true,
			data : {
				uid:uid
			},
			success : function(data, textStatus) {
					alert("회원이 삭제되었습니다");
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

//선택된 회원 삭제하기
function delete_check_member(){
	var checked_item = $("input:checkbox[name='chk']:checked");
	var uid = new Array();
	if(checked_item.length == 0){
		alert("회원을 선택해주세요!");
		return;
	}else{
		for(var i=0; i<checked_item.length; i++){
			uid[i] = checked_item[i].value;
		}
		deleteMember(uid);
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
            $("#memberTable > tbody > tr").hide();
            var temp = $("#memberTable > tbody > tr > td:nth-child(5n+"+select+"):contains('" + k + "')");

            $(temp).parent().show();
        })
})
</script>
</head>
<body>
<div class="memberList_box main_container">
	<div id="location_box">
		회원 관리
	</div>
	<div class="table_box">
	<div class="count_tr">
			<span class="glyphicon glyphicon-tag"></span>&nbsp;Total (${fn:length(listMember)})
		</div>
		<div class="frame">
			<div style="display:flex;">
  				<select name="keword_select">
  					<option value="none">전체</option>
  					<option value="2">번호</option>
  					<option value="3">회원 종류</option>
  					<option value="4">회원 아이디</option>
  					<option value="5">회원명</option>
  					<option value="6">성별</option>
  					<option value="7">이메일</option>
  				</select>
  				<div id="search_div">
  					<input type="text" name="search_text" id="search_text" class="keyword" placeholder="Search..."/>
  				</div>
  			</div>
  			<div>
  				<button class="custom-btn btn-1" onclick="delete_check_member();" style="background: #DC3545;">선택 회원 삭제</button>
  			</div>
  	</div>
		<table id="memberTable">
			<thead>
			<tr class="fixed_tr">
				<td>
					<input type="checkbox" id="cbx_chkAll">
				</td>
				<td>
					<div id="th_box">
						<span>번호</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 1 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 1 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</td>
				<td>
					<div id="th_box">
						<span>회원 종류</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 2 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 2 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</td>
				<td>
					<div id="th_box">
						<span>회원 아이디</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 3 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 3 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</td>
				<td>
					<div id="th_box">
						<span>회원 이름</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 4 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 4 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</td>
				<td>
					<div id="th_box">
						<span>회원 성별</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 5 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 5 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</td>
				<td>
					<div id="th_box">
						<span>회원 이메일</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 6 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 6 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</td>
				<td>등급</td>
				<td>비고</td>
			</tr>
			</thead>
			<c:choose>
				<c:when test="${listMember == null}">
					<tr>
						<td colspan="8">
							회원 목록이 비었습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tbody>
					<c:forEach var="member" items="${listMember}">
						<c:choose>
						<c:when test="${member.del_yn != 'Y'}">
						<tr class="member_tr" style="height:50px;">
							<td><input type="checkbox" name="chk" value="${member.uid}"></td>
							<td>${member.uid }</td>
							<td>${member.member_type }</td>
							<td><a href="${contextPath}/admin/member/selectMemberDetail.do?uid=${member.uid}">${member.member_id }</a></td>
							<td>${member.member_name }</td>
							<td>${member.member_gender }</td>
							<td>${member.email }</td>
							<td>
								<select name="${member.uid}">
										<c:if test="${member.member_level == 1}">
											<option value="${member.member_level}" selected>웰컴</option>
											<option value="2">실버</option>
											<option value="3">골드</option>
											<option value="4">관리자</option>
										</c:if>
										<c:if test="${member.member_level == 2}">
											<option value="1">웰컴</option>
											<option value="${member.member_level}" selected>실버</option>
											<option value="3">골드</option>
											<option value="4">관리자</option>
										</c:if>
										<c:if test="${member.member_level == 3}">
											<option value="1">웰컴</option>
											<option value="2">실버</option>
											<option value="${member.member_level}" selected>골드</option>
											<option value="4">관리자</option>
										</c:if>
										<c:if test="${member.member_level == 4}">
											<option value="1">웰컴</option>
											<option value="2">실버</option>
											<option value="3">골드</option>
											<option value="${member.member_level}" selected>관리자</option>
										</c:if>
								</select>
							</td>
							<td>
								<a onclick="updateLevel(${member.uid})">수정</a>
								<a onclick="deleteMember(${member.uid})">삭제</a>
							</td>
						</tr>
						</c:when>
						<c:otherwise>
						<tr class="deleted_tr member_tr">
							<td><input type="checkbox" name="chk" value="${member.uid}"></td>
							<td>${member.uid }</td>
							<td style="color:tomato">탈퇴</td>
							<td>${member.member_id }</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					</tbody>
				</c:otherwise>
			</c:choose>
		</table>
		<ul class="pagination">
    
  		</ul>
		<script type="text/javascript">
			var myTable = document.getElementById( "memberTable" ); 
			var replace = replacement( myTable ); 
			function sortTD( index ){    replace.ascending( index );    } 
			function reverseTD( index ){    replace.descending( index );    } 
		</script>
	</div>
</div>
</body>
</html>