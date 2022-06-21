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

//체크한 게시글 숨김처리
function check_board_hidden() {
	var checked_item = $("input:checkbox[name='chk']:checked");
	var articleNo = new Array();
	if(checked_item.length == 0){
		alert("게시물을 선택해주세요!");
		return;
	}else{
		for(var i=0; i<checked_item.length; i++){
			articleNo[i] = checked_item[i].value;
		}
		board_hidden(articleNo);
	}
}

//게시글 숨김처리
function board_hidden(articleNo) {
	var hidden_check = confirm("숨김 처리 하시겠습니까?");
	if(hidden_check){
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/community/updateBoardHidden.do",
			traditional : true,
			data : {
				articleNo:articleNo
			},
			success : function(data, textStatus) {
					alert("숨김 처리 되었습니다");
					location.reload();				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			}
		}); //end ajax
	}else {
		return;
	}
}

//게시글 숨김 해제
function board_view(articleNo) {
	var view_check = confirm("숨김 해제 하시겠습니까?");
	if(view_check){
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/community/updateBoardView.do",
			data : {
				articleNo:articleNo
			},
			success : function(data, textStatus) {
					alert("해제 되었습니다");
					location.reload();				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			}
		}); //end ajax
	}else {
		return;
	}
}


//체크한 댓글 숨김처리
function check_comment_hidden() {
	var checked_item = $("input:checkbox[name='chk']:checked");
	var commentNo = new Array();
	if(checked_item.length == 0){
		alert("게시물을 선택해주세요!");
		return;
	}else{
		for(var i=0; i<checked_item.length; i++){
			commentNo[i] = checked_item[i].value;
		}
		comment_hidden(commentNo);
	}
}

//댓글 숨김처리
function comment_hidden(commentNo) {
	var hidden_check = confirm("숨김 처리 하시겠습니까?");
	if(hidden_check){
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/community/updateCommentHidden.do",
			traditional : true,
			data : {
				commentNo:commentNo
			},
			success : function(data, textStatus) {
					alert("숨김 처리 되었습니다");
					location.reload();				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			}
		}); //end ajax
	}else {
		return;
	}
}

//댓글 숨김 해제
function comment_view(commentNo) {
	var hidden_check = confirm("숨김 해제 하시겠습니까?");
	if(hidden_check){
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/community/updateCommentView.do",
			data : {
				commentNo:commentNo
			},
			success : function(data, textStatus) {
					alert("해제 되었습니다");
					location.reload();				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			}
		}); //end ajax
	}else {
		return;
	}
}

// 선택한 공지글 삭제
function check_delete_notice() {
	var checked_item = $("input:checkbox[name='chk']:checked");
	var noticeNo = new Array();
	if(checked_item.length == 0){
		alert("게시물을 선택해주세요!");
		return;
	}else{
		for(var i=0; i<checked_item.length; i++){
			noticeNo[i] = checked_item[i].value;
		}
		delete_notice(noticeNo);
	}
}

// 공지글 삭제
function delete_notice(noticeNo){
	var delete_check = confirm("삭제하시겠습니까?");
	if(delete_check){
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/community/deleteNotice.do",
			traditional : true,
			data : {
				noticeNo:noticeNo
			},
			success : function(data, textStatus) {
					alert("처리 되었습니다");
					location.reload();				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			}
		}); //end ajax
	}else {
		return;
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
            $("#articleTable > tbody > tr").hide();
            var temp = $("#articleTable > tbody > tr > td:nth-child(5n+"+select+"):contains('" + k + "')");

            $(temp).parent().show();
        })
})
</script>
<style type="text/css">
#location_box .article_menu {
    color: black;
    border: 1px solid #c4c4c4;
    border-radius: 3px;
    font-size: 18px;
    padding: 8px 0px;
    width: 160px;
    text-align: center;
    margin-right: 10px;
}

#location_box .active {
    background: #184798;
    color: white;
}

#articleNo_label {
    color: #878787;
    font-size: 11px;
    font-weight:lighter;
}

#comment_cnt_label {
	color:tomato;
	font-weight: lighter;
}

#article_title_atag {
	font-size:14px;
	display: inline-block;
}

.comment_div_box {
	display: flex;
    flex-direction: column;
}

.comment_div_box label, .comment_span {
	font-size:13px;
	font-weight:lighter;
	color: #878787;
}

.comment_m_btn {
	background:white;
	border:1px solid #c4c4c4;
	border-radius: 3px;
    width: 40px;
}

.cs_status{
	width: 112px;
    height: 28px;
    color: #fff;
    line-height: 26px;
    text-align: center;
    background: #184798;
    border-radius: 20px;
     margin:9px;
	}
	.cs_comment_status{
	width: 112px;
    height: 28px;
    color: #555;
    line-height: 26px;
    text-align: center;
    background: #f0f0f0;
    border-radius: 20px;
     margin:9px;
	}
</style>
</head>
<body>
<div class="goodsList_box main_container">
	<div id="location_box">
		<c:if test="${article_type eq 'board'}">
		<a class="article_menu active" href="${contextPath}/admin/community/selectArticleList.do?article_type=board">게시글 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=comment">댓글 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=notice">공지 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=review">리뷰 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=cs">문의 관리</a>
		</c:if>
		<c:if test="${article_type eq 'comment'}">
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=board">게시글 관리</a>
		<a class="article_menu active" href="${contextPath}/admin/community/selectArticleList.do?article_type=comment">댓글 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=notice">공지 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=review">리뷰 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=cs">문의 관리</a>
		</c:if>
		<c:if test="${article_type eq 'notice'}">
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=board">게시글 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=comment">댓글 관리</a>
		<a class="article_menu active" href="${contextPath}/admin/community/selectArticleList.do?article_type=notice">공지 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=review">리뷰 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=cs">문의 관리</a>
		</c:if>
		<c:if test="${article_type eq 'review'}">
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=board">게시글 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=comment">댓글 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=notice">공지 관리</a>
		<a class="article_menu active" href="${contextPath}/admin/community/selectArticleList.do?article_type=review">리뷰 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=cs">문의 관리</a>
		</c:if>
		<c:if test="${article_type eq 'cs'}">
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=board">게시글 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=comment">댓글 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=notice">공지 관리</a>
		<a class="article_menu" href="${contextPath}/admin/community/selectArticleList.do?article_type=review">리뷰 관리</a>
		<a class="article_menu active" href="${contextPath}/admin/community/selectArticleList.do?article_type=cs">문의 관리</a>
		</c:if>
	</div>
	<div class="table_box">
		<div class="count_tr">
			<c:if test="${article_type eq 'board'}">
				<span class="glyphicon glyphicon-tag"></span>&nbsp;Total (${fn:length(boardList)})
			</c:if>
			<c:if test="${article_type eq 'comment'}">
				<span class="glyphicon glyphicon-tag"></span>&nbsp;Total (${fn:length(commentList)})
			</c:if>
			<c:if test="${article_type eq 'notice'}">
				<span class="glyphicon glyphicon-tag"></span>&nbsp;Total (${fn:length(noticeList)})
			</c:if>
			<c:if test="${article_type eq 'review'}">
				<span class="glyphicon glyphicon-tag"></span>&nbsp;Total (${fn:length(reviewList)})
			</c:if>
			<c:if test="${article_type eq 'cs'}">
				<span class="glyphicon glyphicon-tag"></span>&nbsp;Total (${fn:length(csList)})
			</c:if>
		</div>
		<div class="frame">
			<div style="display:flex;">
  				<select name="keword_select">
  					<c:if test="${article_type eq 'board' or article_type eq 'notice' or article_type eq 'cs'}">
  						<option value="none">전체</option>
  						<option value="2">글번호</option>
  						<option value="3">글제목</option>
  						<option value="4">작성자명</option>
  						<option value="5">카테고리명</option>
  						<option value="5">등록일</option>
  					</c:if>
  					<c:if test="${article_type eq 'comment' or article_type eq 'review'}">
  						<option value="none">전체</option>
  						<option value="2">글번호</option>
  						<option value="4">작성자</option>
  					</c:if>
  				</select>
  				<div id="search_div">
  					<input type="text" name="search_text" id="search_text" class="keyword" placeholder="Search..."/>
  				</div>
  			</div>
  			<div>
  				<c:if test="${article_type eq 'board'}">
  					<a href="${contextPath}/admin/community/addNewNotice.do" class="btn_a_tag"><button class="custom-btn btn-1" style="background: #0D6EFD;">새 공지 등록</button></a>
  					<button class="custom-btn btn-1" onclick="check_board_hidden();" style="background: #DC3545;">선택 숨김 처리</button>
  				</c:if>
  				<c:if test="${article_type eq 'comment'}">
  					<a href="${contextPath}/admin/community/addNewNotice.do" class="btn_a_tag"><button class="custom-btn btn-1" style="background: #0D6EFD;">새 공지 등록</button></a>
  					<button class="custom-btn btn-1" onclick="check_comment_hidden();" style="background: #DC3545;">선택 숨김 처리</button>
  				</c:if>
  				<c:if test="${article_type eq 'notice'}">
  					<a href="${contextPath}/admin/community/addNewNotice.do" class="btn_a_tag"><button class="custom-btn btn-1" style="background: #0D6EFD;">새 공지 등록</button></a>
  					<button class="custom-btn btn-1" onclick="check_delete_notice();" style="background: #DC3545;">선택 삭제</button>
  				</c:if>
  			</div>
  		</div>
		<table id="articleTable">
		<thead>
			<tr class="fixed_tr">
				<c:if test="${article_type eq 'board' or article_type eq 'notice'}">
				<th width=5%><input type="checkbox" id="cbx_chkAll"></th>
				<th width=10%>
					<div id="th_box">
						<span>글번호</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 1 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 1 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width=50%>
					<div id="th_box">
						<span>글제목</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 2 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 2 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width=10%>
					<div id="th_box">
						<span>작성자명</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 2 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 2 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width=10%>카테고리</th>
				<th width=10%>등록일</th>
				<th width=5%>비고</th>
				</c:if>
				<c:if test="${article_type eq 'comment'}">
				<th width=5%><input type="checkbox" id="cbx_chkAll"></th>
				<th width=10%>
					<div id="th_box">
						<span>글번호</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 1 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 1 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width=70%>
					<div id="th_box">
						<span>글제목</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 2 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 2 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width=10%>작성자</th>
				<th width=5%>비고</th>
				</c:if>
				<c:if test="${article_type eq 'review'}">
				<th width=5%><input type="checkbox" id="cbx_chkAll"></th>
				<th width=10%>
					<div id="th_box">
						<span>글번호</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 1 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 1 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width=50%>
					<div id="th_box">
						<span>리뷰 내용</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 2 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 2 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width=10%>고유번호</th>
				<th width=10%>작성자</th>
				<th width=10%>작성일</th>
				<th width=5%>비고</th>
				</c:if>
				<c:if test="${article_type eq 'cs'}">
				<th width=10%>
					<div id="th_box">
						<span>글번호</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 1 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 1 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width=50%>
					<div id="th_box">
						<span>리뷰 내용</span>
						<div id="change_btn_box">
						<button onclick="sortTD ( 2 )"><span class="glyphicon glyphicon-triangle-top"></span></button>
						<button onclick="reverseTD ( 2 )"><span class="glyphicon glyphicon-triangle-bottom"></span></button>
						</div>
					</div>
				</th>
				<th width=10%>고유번호</th>
				<th width=10%>작성자</th>
				<th width=10%>작성일</th>
				<th width=5%>비고</th>
				</c:if>
			</tr>
		</thead>
				<tbody>
					<c:if test="${article_type eq 'board'}">
					<c:forEach var="item" items="${boardList}">
						<tr>
							<td>
								<c:if test="${item.state eq '정상'}">
									<input type="checkbox" name="chk" value="${item.articleNo}">
								</c:if>
							</td>
							<td>${item.articleNo }</td>
							<c:if test="${item.comment_cnt == 0 }">
                    		<td id="title_td"><a href="${contextPath}/admin/community/selectArticleDetail.do?articleNo=${item.articleNo}">${item.title}&nbsp;</a></td>
                    		</c:if>
                    		<c:if test="${item.comment_cnt != 0 }">
                    		<td id="title_td">
                    			<a href="${contextPath}/admin/community/selectArticleDetail.do?articleNo=${item.articleNo}">
                    				${item.title}&nbsp;<span style="color:tomato;font-size:14px;">[${item.comment_cnt}]</span>
                    			</a>
                    		</td>
                    		</c:if>
                    		<td>${item.writer }</td>
							<td>${item.article_category}</td>
							<td><fmt:formatDate value="${item.writeDate}" pattern="YYYY-MM-dd"></fmt:formatDate></td>
							<td>
								<c:if test="${item.state eq '정상'}">
                    			<button type="button" class="comment_m_btn" style="color:tomato;" onclick="board_hidden(${item.articleNo})">숨김</button>
                    		</c:if>
                    		<c:if test="${item.state eq 'DA'}">
                    			<button type="button" class="comment_m_btn" style="color:#198754;" onclick="board_view(${item.articleNo})">해제</button>
                    		</c:if>
                    		<c:if test="${item.state eq 'DU'}">
								<span>삭제</span>
                    		</c:if>
							</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${article_type eq 'comment'}">
					<c:forEach var="item" items="${commentList}">
						<tr>
                    	<td>
                    		<c:if test="${item.state eq '정상'}">
                    			<input type="checkbox" name="chk" value="${item.commentNo}">
                    		</c:if>
                    	</td>
                    	<td>${item.commentNo }</td>
                    	<td style="text-align:left; padding: 10px;">
                    		<a id="article_title_atag" href="${contextPath}/community/selectArticleDetail.do?articleNo=${item.articleNo}">
                    		<div class="comment_div_box">
                    			<label style="color:#333333;text-overflow: ellipsis;">${item.comment_content }</label>
                    			<label><fmt:formatDate value="${item.regDate}" pattern="yyyy.MM.dd"/></label>
                    			<span class="comment_span">
                    				${item.title}<label id="comment_cnt_label">&nbsp;[${item.comment_cnt}]</label>
                    			</span>
                    		</div>
                    		</a>
                    	</td>
                    	<td>${item.comment_writer }</td>
                    	<td>
                    		<c:if test="${item.state eq '정상'}">
                    			<button type="button" class="comment_m_btn" style="color:tomato;" onclick="comment_hidden(${item.commentNo})">숨김</button>
                    		</c:if>
                    		<c:if test="${item.state eq 'DA'}">
                    			<button type="button" class="comment_m_btn" style="color:#198754;" onclick="comment_view(${item.commentNo})">해제</button>
                    		</c:if>
                    		<c:if test="${item.state eq 'DU'}">
								<span>삭제</span>
                    		</c:if>
                    	</td>
                    	</tr>
					</c:forEach>
					</c:if>
					<c:if test="${article_type eq 'notice'}">
					<c:forEach var="item" items="${noticeList}">
						<tr>
							<td><input type="checkbox" name="chk" value="${item.noticeNo}"></td>
							<td>${item.noticeNo }</td>
                    		<td id="title_td"><a href="${contextPath}/admin/community/articleDetail.do?articleNo=${item.noticeNo}">${item.title}&nbsp;</a></td>
                    		<td>${item.notice_writer }</td>
							<td>${item.notice_category}</td>
							<td><fmt:formatDate value="${item.regDate}" pattern="YYYY-MM-dd"></fmt:formatDate></td>
							<td>
								<a onclick="delete_notice(${item.noticeNo})">삭제</a>
							</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${article_type eq 'review'}">
					<c:forEach var="item" items="${reviewList}">
						<tr>
							<td><input type="checkbox" name="chk" value="${item.review_id}"></td>
							<td>${item.review_id }</td>
                    		<td id="title_td">
                    			<a id="article_title_atag" href="${contextPath}/goods/goodsInfo.do?tab=review&goods_id=${item.goods_id}">${item.content}</a>
                    		</td>
                    		<td>${item.uid }</td>
							<td>${item.review_writer}</td>
							<td><fmt:formatDate value="${item.regDate}" pattern="YYYY-MM-dd"></fmt:formatDate></td>
							<td>
								<a onclick="delete_notice(${item.review_id})">숨김</a>
							</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${article_type eq 'cs'}">
					<c:forEach var="item" items="${csList}">
						<tr>
							<td>${item.csNO }</td>
	                    	<!-- 비밀글 여부 설정 -->
	                    	<td id="title_td">
		                    	<c:if test="${item.secret eq 'Y'}">
		                    		<a href="${contextPath}/cs/csDetail.do?csNO=${item.csNO}">${item.title}</a>
		                    		<img src="${contextPath}/resources/image/key.png" style="width: 18px;">
		 						</c:if>
		 						<c:if test="${item.secret eq 'N'}">
		 							<a href="${contextPath}/cs/csDetail.do?csNO=${item.csNO}">${item.title}</a>
		 						</c:if>
	                    	</td>
	                    	<td>${item.uid}</td>
	                    	<td>${item.writer}</td>
	                    	<td><fmt:formatDate value="${item.writeDate}" pattern="YYYY-MM-dd"></fmt:formatDate></td>
	                    	<td>
		                    	<c:choose>
		                    	<c:when test="${item.processing_status == '답변완료'}">
		                    	<div class="cs_status">${item.processing_status}</div>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<div class="cs_comment_status">${item.processing_status}</div>
		                    	</c:otherwise>
		                    	</c:choose>
	                    	</td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>
		</table>
		<ul class="pagination">
    
  		</ul>
		<script type="text/javascript">
			var myTable = document.getElementById( "articleTable" ); 
			var replace = replacement( myTable ); 
			function sortTD( index ){    replace.ascending( index );    } 
			function reverseTD( index ){    replace.descending( index );    } 
		</script>
	</div>
</div>
</body>
</html>