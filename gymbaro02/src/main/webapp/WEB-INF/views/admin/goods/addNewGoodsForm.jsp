<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/addNewGoods.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
//옵션 선택 셀렉트 박스 체인지 부분
var selectBoxChange_option = function(value){
	$('input[name="first_option"]').val(value);
	if(value == '헬스'){
		$('select[name=1]').css("display", "");
		$('select[name=2]').css("display", "none");
		$('select[name=3]').css("display", "none");
		$('select[name=4]').css("display", "none");
	}else if(value == '필라테스'){
		$('select[name=2]').css("display", "");
		$('select[name=1]').css("display", "none");
		$('select[name=3]').css("display", "none");
		$('select[name=4]').css("display", "none");
	}else if(value == '복싱'){
		$('select[name=3]').css("display", "");
		$('select[name=1]').css("display", "none");
		$('select[name=2]').css("display", "none");
		$('select[name=4]').css("display", "none");
	}else if(value == '수영'){
		$('select[name=4]').css("display", "");
		$('select[name=1]').css("display", "none");
		$('select[name=2]').css("display", "none");
		$('select[name=3]').css("display", "none");
	}
}

var selectBoxChange_sub_option = function(value){
	$('input[name="goods_sub_category"]').val(value);
}

//옵션 추가 버튼
var cnt=1;
function fn_addOption(){
	$("#price_info").append("<label>옵션 추가 "+cnt+"</label><br>"+"<input type='text' name='option_name' placeholder='옵션명'/>"+"<br>"+"<input type='number' name='price' id='option_price' placeholder='추가 가격' />원<br>");
	cnt++;
}

function fnc_addCheck(){
	var check = confirm("상품을 등록하시겠습니까?");
	if(check){
		alert("등록이 완료되었습니다!");
		return true;
	}else{
		return false;
	}
}

function setMainThumbnail(event) {
	var container1 = document.getElementById("image_container1");
	if(container1.childNodes[0] != null){
		container1.removeChild(container1.childNodes[0]);
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
	if(container2.childNodes[0] != null){
		container2.removeChild(container2.childNodes[0]);
	}
	  var reader = new FileReader();

	  reader.onload = function(event) {
	    var img = document.createElement("img");
	    img.setAttribute("src", event.target.result);
	    document.querySelector("div#image_container2").appendChild(img);
	  };

	  reader.readAsDataURL(event.target.files[0]);
	}

</script>
</head>
<body>
<div class="addNewGoods_box">        
	<div class="align_rt">
          <div class="notice">
            <!-- Tab -->
            <div class="tab">
              <div class="tab_btn title_box">
              		상품 등록하기
              </div>
            </div>
            <div class="tab_each">
       <form action="${contextPath}/admin/goods/addNewGoods.do" method="post" onsubmit="return fnc_addCheck();" enctype="multipart/form-data">
		<table id="table1">
			<thead>
				<tr>
					<td class="fixed_join">상품명</td>
					<td>
					  <input type="text" name="goods_name" id="goods_name" placeholder=" ex) 아리프 옥타곤 아령">
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">상품 기본 가격</td>
					<td>
						<input type="text" name="goods_price" id="goods_price">원
                    </td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">상품 옵션 추가</td>
					<td>
						<div id="price_info">
						<button type="button" id="addOptionBtn" onclick="fn_addOption();">옵션 추가</button><br>
						</div>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">카테고리 선택</td>
					<td>
					   <select onChange="selectBoxChange_option(this.value);">
					   		<option value="헬스" selected>헬스 용품</option>
					   		<option value="필라테스">필라테스/요가 용품</option>
					   		<option value="복싱">복싱 용품</option>
					   		<option value="수영">수영 용품</option>
					   </select>
					   <select name="1" onChange="selectBoxChange_sub_option(this.value);" style="display:none;">
					   		<option value="바벨" selected>바벨</option>
					   		<option value="아령">아령</option>
					   		<option value="원판">원판</option>
					   </select>
					   <select name="2" onChange="selectBoxChange_sub_option(this.value);" style="display:none;">
					   		<option value="밴드" selected>밴드</option>
					   		<option value="폼롤러">폼롤러</option>
					   		<option value="요가 짐볼">요가 짐볼</option>
					   		<option value="해먹">해먹</option>
					   </select>
					   <select name="3" onChange="selectBoxChange_sub_option(this.value);" style="display:none;">
					   		<option value="글러브" selected>글러브</option>
					   		<option value="훈련용품">훈련용품</option>
					   		<option value="보호용품">보호용품</option>
					   		<option value="복싱화">복싱화</option>
					   </select>
					   <select name="4" onChange="selectBoxChange_sub_option(this.value);" style="display:none;">
					   		<option value="수경복" selected>수영복</option>
					   		<option value="수영모">수영모</option>
					   		<option value="수경">수경</option>
					   </select>
					   <input type="hidden" name="goods_main_category" value="헬스" />
					   <input type="hidden" name="goods_sub_category" value="헬스" />
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">상품 수량</td>
					<td>
						<input type="number" name="goods_amount" id="goods_amount" value="1" />
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">상품 사진</td>
					<td>
						<label>메인 이미지(최대 한장 첨부 가능)</label>
							<input type="file" name="main_image" class="goods_image" onchange="setMainThumbnail(event);"/>
							<br><br>
						<label>상세페이지 이미지(최대 한장 첨부 가능)</label>
        					<input type="file" name="detail_image" class="goods_image" onchange="setDetailThumbnail(event);"><br>
                    </td>
				</tr>
			</thead>	
		</table>
		<input type="hidden" name="uid" value="${memberInfo.uid}" />
		<input type="hidden" name="goods_state" value="판매중" />
		<div class="image_container_box">
			<label>메인 이미지 미리보기</label>
		 	<div id="image_container1"></div>
		 	<label>상세페이지 미리보기</label>
		 	<div id="image_container2"></div>
		 </div>
		<div class="button_box">
			<button type="button" id="button_01" onclick="history.back()"><span>이전으로</span></button>&nbsp;
			<button type="submit" id="button_02"><span>상품 등록</span></button>
		 </div>
		</form>	
        </div>
        </div>
       </div>
	
</div>
</body>
</html>