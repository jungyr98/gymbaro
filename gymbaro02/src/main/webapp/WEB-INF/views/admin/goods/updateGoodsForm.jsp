<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="goodsVO" value="${goodsMap.goodsVO}" />
<c:set var="optionList" value="${goodsMap.optionList}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/updateGoods.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
//옵션 선택 셀렉트 박스 체인지 부분
var selectBoxChange_option = function(value){
	$('input[name="goods_main_category"]').val(value);
	var sub1 = $('select[name=1]');
	var sub2 = $('select[name=2]');
	var sub3 = $('select[name=3]');
	var sub4 = $('select[name=4]');
	if(value == '헬스'){
		sub1[0].style.display='';
		sub2[0].style.display='none';
		sub3[0].style.display='none';
		sub4[0].style.display='none';
		$('input[name="goods_sub_category"]').val('바벨'); //기본 서브카테고리 value 지정
	}else if(value == '필라테스'){
		sub2[0].style.display='';
		sub1[0].style.display='none';
		sub3[0].style.display='none';
		sub4[0].style.display='none';
		$('input[name="goods_sub_category"]').val('밴드'); //기본 서브카테고리 value 지정
	}else if(value == '복싱'){
		sub3[0].style.display='';
		sub1[0].style.display='none';
		sub2[0].style.display='none';
		sub4[0].style.display='none';
		$('input[name="goods_sub_category"]').val('글러브'); //기본 서브카테고리 value 지정
	}else if(value == '수영'){
		sub4[0].style.display='';
		sub1[0].style.display='none';
		sub2[0].style.display='none';
		sub3[0].style.display='none';
		$('input[name="goods_sub_category"]').val('수영복'); //기본 서브카테고리 value 지정
	}
}
// 서브 카테고리 적용시 hidden value 값 변경
var selectBoxChange_sub_option = function(value){
	$('input[name="goods_sub_category"]').val(value);
}

//옵션 추가 버튼
var cnt=1;
function fn_addOption(){
	$("#price_info").append("<label>옵션 추가 "+cnt+"</label><br>"+"<div id='option_div'><div><input type='text' name='option_name"+cnt+"' placeholder='옵션명'/>"+"<br>"+"<input type='number' name='price"+cnt+"' id='option_price' value='0' placeholder='추가 가격' />원</div><input type='button' class='insert' value='추가' onclick='fnc_add_option("+cnt+")'/></div></div>");
	cnt++;
}

// 상품 수정하기
function fnc_addCheck(){
	var check = confirm("상품을 수정하시겠습니까?");
	if(check){
		alert("수정이 완료되었습니다!");
		return true;
	}else{
		return false;
	}
}

function setMainThumbnail(event) {
	var container1 = document.getElementById("image_container1");
	var old_image = $(".goods_main_img");
		if(old_image != null){
			$(".goods_main_img").remove();
		}
		if(container1.childNodes[1] != null){
			container1.removeChild(container1.childNodes[1]);
		}

  var reader = new FileReader();

  reader.onload = function(event) {
    var img = document.createElement("img");
    img.setAttribute("src", event.target.result);
    document.querySelector("div#image_container1").appendChild(img);
  };

  reader.readAsDataURL(event.target.files[0]);
}

function setDetailThumbnail(event) {
	var container2 = document.getElementById("image_container2");
	var old_image = $(".goods_detail_img");
	if(old_image != null){
		$(".goods_detail_img").remove();
	}
	if(container2.childNodes[1] != null){
		container2.removeChild(container2.childNodes[1]);
	}
	  var reader = new FileReader();

	  reader.onload = function(event) {
	    var img = document.createElement("img");
	    img.setAttribute("src", event.target.result);
	    document.querySelector("div#image_container2").appendChild(img);
	  };

	  reader.readAsDataURL(event.target.files[0]);
}

// 상품 정보 수정하기
function fnc_modify_goods(attribute) {
	var goods_id = $('input[name="goods_id"]').val();
	var value="";
	var modifyCheck = confirm("수정하시겠습니까?");
	if(modifyCheck){
	if(attribute == 'goods_name'){
		var goods_name = $('input[name="goods_name"]');
		value = goods_name.val();
	}else if(attribute == 'goods_price'){
		var goods_price = $('input[name="goods_price"]');
		value = goods_price.val();
	}else if(attribute == 'goods_amount'){
		var goods_amount = $('input[name="goods_amount"]');
		value = goods_amount.val();
	}else if(attribute == 'goods_category'){
		var goods_main_category = $('input[name="goods_main_category"]');
		var goods_sub_category = $('input[name="goods_sub_category"]');
		value = goods_main_category.val()+","+goods_sub_category.val();
	}
	console.log(attribute, value); // 값 확인
	
	$.ajax({
		type : "POST",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/admin/goods/modifyGoodsInfo.do",
		data : {
			attribute:attribute,
			value:value,
			goods_id:goods_id
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("상품 정보를 수정했습니다.");
				location.reload();
			}else if(data.trim()=='failed'){
				alert("다시 시도해 주세요.");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		}
	}); //end ajax
	} else{
		alert("취소하셨습니다");
		return;
	}
}

//상품 옵션 수정하기
function fnc_modify_option(num, option_id) {
	var value="";
	var modifyCheck = confirm("옵션을 수정하시겠습니까?");
	if(modifyCheck){
		var option_name = $('input[name="old_option_name'+num+'"]');
		var price = $('input[name="old_price'+num+'"]');
		value = option_name.val()+","+price.val();
		console.log(value); // 값 확인
	
	$.ajax({
		type : "POST",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/admin/goods/modifyOption.do",
		data : {
			value:value,
			option_id:option_id,
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("옵션을 수정했습니다.");
				location.reload();
			}else if(data.trim()=='failed'){
				alert("다시 시도해 주세요.");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		}
	}); //end ajax
	} else{
		alert("취소하셨습니다");
		return;
	}
}


//상품 옵션 삭제하기
function fnc_delete_option(option_id) {

	var deleteCheck = confirm("옵션을 삭제하시겠습니까?");
	if(deleteCheck){
		
	$.ajax({
		type : "POST",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/admin/goods/deleteOption.do",
		data : {
			option_id:option_id,
		},
		success : function(data, textStatus) {
			if(data.trim()=='del_success'){
				alert("옵션을 삭제했습니다.");
				location.reload();
			}else if(data.trim()=='failed'){
				alert("다시 시도해 주세요.");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		}
	}); //end ajax
	} else{
		alert("취소하셨습니다");
		return;
	}
}



// 상품 옵션 추가하기
function fnc_add_option(num) {
	var goods_id = $('input[name="goods_id"]').val();
	var value="";
	var modifyCheck = confirm("옵션을 추가하시겠습니까?");
	if(modifyCheck){
		var option_name = $('input[name="option_name'+num+'"]');
		var price = $('input[name="price'+num+'"]');
		value = option_name.val()+","+price.val();
		console.log(value); // 값 확인
	
	$.ajax({
		type : "POST",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/admin/goods/addGoodsOption.do",
		data : {
			value:value,
			goods_id:goods_id
		},
		success : function(data, textStatus) {
			if(data.trim()=='add_success'){
				alert("옵션을 추가하였습니다.");
				location.reload();
			}else if(data.trim()=='failed'){
				alert("다시 시도해 주세요.");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		}
	}); //end ajax
	} else{
		alert("취소하셨습니다");
		return;
	}
}

function fnc_modify_img(obj){
	var form = document.obj;
	var check = confirm("이미지를 수정하시겠습니까?");
	if(check){
		document.getElementById(obj).submit();
	}else{
		alert("취소하셨습니다");
		return false;
	}
}

</script>
</head>
<body>
<div class="updateGoods_box">        
	<div class="align_rt">
          <div class="notice">
            <!-- Tab -->
            <div class="tab">
              <div class="tab_btn title_box">
              		상품 수정하기
              </div>
            </div>
            <div class="tab_each">
        <div id="table_box">
		<table id="table1">
			<thead>
				<tr>
					<td class="fixed_join">상품명</td>
					<td>
					  <input type="text" name="goods_name" id="goods_name" value="${goodsVO.goods_name}">
					</td>
					<td>
					 <input type="button" class="modify" value="수정" onclick="fnc_modify_goods('goods_name')"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">상품 기본 가격</td>
					<td>
						<input type="text" name="goods_price" id="goods_price" value="${goodsVO.goods_price}">원
                    </td>
                    <td>
					 <input type="button" class="modify" value="수정" onclick="fnc_modify_goods('goods_price')"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">상품 옵션 추가</td>
					<td colspan="2">
						<div id="price_info">
						<c:forEach var="item" items="${optionList}" varStatus="cnt">
						<br>
							<label>기본 옵션</label><br>
							<div id="option_div">
								<div>
								<input type='text' name='<c:out value="old_option_name${cnt.count}"/>' value="${item.option_name}"/><br>
								<input type='number' name='<c:out value="old_price${cnt.count}"/>' id='option_price' value="${item.price}" />원<br>
								</div>
								<div id="button_div">
								<input type="button" class="modify" value="수정" onclick="fnc_modify_option(${cnt.count},${item.option_id})"/>
								<input type="button" class="modify" value="삭제" onclick="fnc_delete_option(${item.option_id})"/>
								</div>
							</div>
						</c:forEach>
						<button type="button" id="addOptionBtn" onclick="fn_addOption();">옵션 추가</button><br>
						</div>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">카테고리 선택</td>
					<td>
					<c:if test="${goodsVO.goods_main_category eq '헬스'}">
					   <select onChange="selectBoxChange_option(this.value);">
					   		<option value="헬스" selected>헬스 용품</option>
					   		<option value="필라테스">필라테스/요가 용품</option>
					   		<option value="복싱">복싱 용품</option>
					   		<option value="수영">수영 용품</option>
					   </select>
					   <c:if test="${goodsVO.goods_sub_category eq '바벨'}">
					   <select name="1" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="바벨" selected>바벨</option>
					   		<option value="아령">아령</option>
					   		<option value="원판">원판</option>
					   </select>
					   </c:if>
					   <c:if test="${goodsVO.goods_sub_category eq '아령'}">
					   <select name="1" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="바벨">바벨</option>
					   		<option value="아령" selected>아령</option>
					   		<option value="원판">원판</option>
					   </select>
					   </c:if>
					   <c:if test="${goodsVO.goods_sub_category eq '원판'}">
					   <select name="1" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="바벨">바벨</option>
					   		<option value="아령">아령</option>
					   		<option value="원판" selected>원판</option>
					   </select>
					   </c:if>
					</c:if>
					<c:if test="${goodsVO.goods_main_category eq '필라테스'}">
					 	<select onChange="selectBoxChange_option(this.value);">
					   		<option value="헬스">헬스 용품</option>
					   		<option value="필라테스" selected>필라테스/요가 용품</option>
					   		<option value="복싱">복싱 용품</option>
					   		<option value="수영">수영 용품</option>
					   </select>
					   <c:if test="${goodsVO.goods_sub_category eq '밴드'}">
					   <select name="2" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="밴드" selected>밴드</option>
					   		<option value="폼롤러">폼롤러</option>
					   		<option value="요가 짐볼">요가 짐볼</option>
					   		<option value="해먹">해먹</option>
					   </select>
					   </c:if>
					   <c:if test="${goodsVO.goods_sub_category eq '폼롤러'}">
					   <select name="2" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="밴드">밴드</option>
					   		<option value="폼롤러" selected>폼롤러</option>
					   		<option value="요가 짐볼">요가 짐볼</option>
					   		<option value="해먹">해먹</option>
					   </select>
					   </c:if>
					   <c:if test="${goodsVO.goods_sub_category eq '요가 짐볼'}">
					   <select name="2" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="밴드">밴드</option>
					   		<option value="폼롤러">폼롤러</option>
					   		<option value="요가 짐볼" selected>요가 짐볼</option>
					   		<option value="해먹">해먹</option>
					   </select>
					   </c:if>
					   <c:if test="${goodsVO.goods_sub_category eq '해먹'}">
					   <select name="2" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="밴드">밴드</option>
					   		<option value="폼롤러">폼롤러</option>
					   		<option value="요가 짐볼">요가 짐볼</option>
					   		<option value="해먹" selected>해먹</option>
					   </select>
					   </c:if>
					</c:if>
					<c:if test="${goodsVO.goods_main_category eq '복싱'}">
						<select onChange="selectBoxChange_option(this.value);">
					   		<option value="헬스">헬스 용품</option>
					   		<option value="필라테스">필라테스/요가 용품</option>
					   		<option value="복싱" selected>복싱 용품</option>
					   		<option value="수영">수영 용품</option>
					   </select>
					   <c:if test="${goodsVO.goods_sub_category eq '글러브'}">
					   <select name="3" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="글러브" selected>글러브</option>
					   		<option value="훈련용품">훈련용품</option>
					   		<option value="보호용품">보호용품</option>
					   		<option value="복싱화">복싱화</option>
					   </select>
					   </c:if>
					   <c:if test="${goodsVO.goods_sub_category eq '훈련용품'}">
					   <select name="3" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="글러브">글러브</option>
					   		<option value="훈련용품" selected>훈련용품</option>
					   		<option value="보호용품">보호용품</option>
					   		<option value="복싱화">복싱화</option>
					   </select>
					   </c:if>
					   <c:if test="${goodsVO.goods_sub_category eq '보호용품'}">
					   <select name="3" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="글러브">글러브</option>
					   		<option value="훈련용품">훈련용품</option>
					   		<option value="보호용품" selected>보호용품</option>
					   		<option value="복싱화">복싱화</option>
					   </select>
					   </c:if>
					   <c:if test="${goodsVO.goods_sub_category eq '복싱화'}">
					   <select name="3" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="글러브">글러브</option>
					   		<option value="훈련용품">훈련용품</option>
					   		<option value="보호용품">보호용품</option>
					   		<option value="복싱화" selected>복싱화</option>
					   </select>
					   </c:if>
					</c:if>
					<c:if test="${goodsVO.goods_main_category eq '수영'}">
						<select onChange="selectBoxChange_option(this.value);">
					   		<option value="헬스">헬스 용품</option>
					   		<option value="필라테스">필라테스/요가 용품</option>
					   		<option value="복싱">복싱 용품</option>
					   		<option value="수영" selected>수영 용품</option>
					   </select>
					   <c:if test="${goodsVO.goods_main_category eq '수영복'}">
					   <select name="4" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="수영복" selected>수영복</option>
					   		<option value="수영모">수영모</option>
					   		<option value="수경">수경</option>
					   </select>
					   </c:if>
					   <c:if test="${goodsVO.goods_main_category eq '수영모'}">
					   <select name="4" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="수영복">수영복</option>
					   		<option value="수영모" selected>수영모</option>
					   		<option value="수경">수경</option>
					   </select>
					   </c:if>
					   <c:if test="${goodsVO.goods_main_category eq '수경'}">
					   <select name="4" onChange="selectBoxChange_sub_option(this.value);">
					   		<option value="수영복">수영복</option>
					   		<option value="수영모">수영모</option>
					   		<option value="수경" selected>수경</option>
					   </select>
					   </c:if>
					</c:if>
						<select name="1" onChange="selectBoxChange_sub_option(this.value);" style="display:none">
					   		<option value="바벨" selected>바벨</option>
					   		<option value="아령">아령</option>
					   		<option value="원판">원판</option>
					   </select>
					   <select name="2" onChange="selectBoxChange_sub_option(this.value);" style="display:none">
					   		<option value="밴드" selected>밴드</option>
					   		<option value="폼롤러">폼롤러</option>
					   		<option value="요가 짐볼">요가 짐볼</option>
					   		<option value="해먹">해먹</option>
					   </select>
					    <select name="3" onChange="selectBoxChange_sub_option(this.value);" style="display:none">
					   		<option value="글러브" selected>글러브</option>
					   		<option value="훈련용품">훈련용품</option>
					   		<option value="보호용품">보호용품</option>
					   		<option value="복싱화">복싱화</option>
					   </select>
					    <select name="4" onChange="selectBoxChange_sub_option(this.value);" style="display:none">
					   		<option value="수영복" selected>수영복</option>
					   		<option value="수영모">수영모</option>
					   		<option value="수경">수경</option>
					   </select>
					   <input type="hidden" name="goods_main_category" value="${goodsVO.goods_main_category}" />
					   <input type="hidden" name="goods_sub_category" value="${goodsVO.goods_sub_category}" />
					</td>
					<td>
					 <input type="button" class="modify" value="수정" onclick="fnc_modify_goods('goods_category')"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">상품 수량</td>
					<td>
						<input type="number" name="goods_amount" id="goods_amount" value="${goodsVO.goods_amount }" />
					</td>
					<td>
					 <input type="button" class="modify" value="수정" onclick="fnc_modify_goods('goods_amount')"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">상품 사진</td>
					<td>
					<form action="${contextPath}/admin/goods/modifyGoodsImage.do" method="post" id="main_img_form" enctype="multipart/form-data">
						<label>메인 이미지(최대 한장 첨부 가능)</label>
							<input type="file" name="main_image" class="goods_image" onchange="setMainThumbnail(event);"/>
							<input type="hidden" name="old_fileName" value="${goodsVO.goods_fileName}" />
							<input type="hidden" name="img_goods_id" value="${goodsVO.goods_id}" />
							<input type="hidden" name="contextPath" value="${contextPath}" />
							<br><br>
					</form>
					<form action="${contextPath}/admin/goods/modifyGoodsImage.do" method="post" id="detail_img_form" enctype="multipart/form-data">
						<label>상세페이지 이미지(최대 한장 첨부 가능)</label>
        					<input type="file" name="detail_image" class="goods_image" onchange="setDetailThumbnail(event);"><br>
        					<input type="hidden" name="old_fileName" value="${goodsMap.imageList[0].fileName}" />
        					<input type="hidden" name="img_goods_id" value="${goodsVO.goods_id}" />
        					<input type="hidden" name="contextPath" value="${contextPath}" />
        			</form>	        				
                    </td>
                    <td>
                    	<input type="button" class="modify" value="수정" id="main_img_submit" onclick="fnc_modify_img('main_img_form')"/>
                    	<input type="button" class="modify" value="수정" onclick="fnc_modify_img('detail_img_form')"/>
                    </td>
				</tr>
			</thead>	
		</table>
		<input type="hidden" name="goods_id" value="${goodsVO.goods_id}" />
		<input type="hidden" name="uid" value="${memberInfo.uid}" />
		<input type="hidden" name="goods_state" value="판매중" />
		<div class="image_container_box">
			<label>메인 이미지 미리보기</label>
		 	<div id="image_container1">
		 		<img class="goods_main_img" alt="HTML5 &amp; CSS3" src="${contextPath}/thumbnails.do?goods_id=${goodsVO.goods_id}&fileName=${goodsVO.goods_fileName}">
		 	</div>
		 	<label>상세페이지 미리보기</label>
		 	<div id="image_container2">
		 		<c:forEach var="image" items="${goodsMap.imageList}">
		 		<img class="goods_detail_img" src="${contextPath}/download.do?goods_id=${goodsVO.goods_id}&fileName=${image.fileName}">
		 		</c:forEach>
		 	</div>
		 </div>
		<div class="button_box">
			<button type="button" id="button_01" onclick="location.href='${contextPath}/admin/goods/selectGoodsList.do'"><span>목록으로</span></button>
		 </div>
		 </div>
        </div>
        </div>
       </div>
	
</div>
</body>
</html>