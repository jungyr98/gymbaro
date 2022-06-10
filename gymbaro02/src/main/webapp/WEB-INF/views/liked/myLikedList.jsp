<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/myCartList.css">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$("#cbx_chkAll").prop("checked", true);
	if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);

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

//찜 리스트 비우기
function delete_all_item(){
	var all_item = $("input:checkbox[name='chk']");
	var gym_id = new Array();
		if(all_item.length == 0){
			alert("찜 해제할 아이템이 존재하지 않습니다");
			return;
		}else{
			for(var i=0; i < all_item.length; i++){
			gym_id[i] = all_item[i].value;
			}
			delete_item(gym_id);
		}

}


//선택된 찜 아이템 삭제하기
function delete_check_item(){
	var checked_item = $("input:checkbox[name='chk']:checked");
	var gym_id = new Array();

		if(checked_item.length == 0){
			alert("시설을 선택해주세요!");
			return;
		}else{
			for(var i=0; i<checked_item.length; i++){
				gym_id[i] = checked_item[i].value;
			}
			delete_item(gym_id);
		}
}

// 장바구니 상품 삭제하기
function delete_item(gym_id){
	    	
	    	var deleteCheck = confirm("찜을 해제하시겠습니까?");
     
	    	if(deleteCheck){
	    	$.ajax({
				type : "post",
				async : false, //false인 경우 동기식으로 처리한다.
				traditional : true,
				url : "${contextPath}/liked/deleteLikedItem.do",
				data : {
					"gym_id":gym_id
				},				
				success : function(data, textStatus) {
			        //전송 처리 결과가 성공이면
					alert("해제되었습니다");	
					location.reload();
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다."+data);
					location.reload();
				}
			}); }else {
	    		alert("취소하셨습니다");
	    		return false;
	    	}
}
</script>
</head>
<body>
<div class="cart_main_container">
	<div class="cart_first_text">
		<img alt="next_heart.png" src="${contextPath}/resources/image/next_heart.png">
		<span>찜한 시설</span>
	</div>
	<table id="cart_table">
		<tr class="count_tr" style="background:#184798;color:white;">
			<td colspan="7">일반시설 (${fn:length(listMyLiked)})</td>
		</tr>
		<tr class="fixed_tr">
			<td><input type="checkbox" name="buy" id="cbx_chkAll" onclick=""></td>
			<td>시설정보</td>
			<td>선택</td>
		</tr>
		<c:choose>
		<c:when test="${empty listMyLiked}">
			<td colspan="7" style="height:200px;">찜 목록에 담긴 시설이 없습니다.</td>
		</c:when>
		<c:otherwise>
		<c:forEach var="item" items="${listMyLiked}" varStatus="cnt">
		<tr class="list_tr">
			<td width="50"><input type="checkbox" name="chk" value="${item.gym_id}" value2="${cnt.count}" onclick=""></td>
			<td width="400">
				<div id="goods_info_div">
					<a href="${contextPath}/gym/gymsInfo.do?gym_id=${item.gym_id}">
						<img width="170" alt="${item.fileName}" src="${contextPath}/thumbnailsGym.do?gym_id=${item.gym_id}&fileName=${item.fileName}">
					</a>
					<div id="goods_info">
						<span id="goods_name_span">${item.gym_name }</span>
					</div>
				</div>	
			</td>
			<td width="100">
				<div class="choose_btn_div" style="width:auto">
					<button id="choose_del_btn" onclick="delete_item(${item.gym_id})"><b>X</b> 찜 해제</button>
				</div>
			</td>
		</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
	<div class="main_btn_div">
		<button type="button" onclick="delete_check_item()">선택 시설 삭제하기</button>
		<div>
			<button type="button" onclick="delete_all_item()">찜 리스트 비우기</button>
		</div>
	</div>
</div>
</body>
</html>