s<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<link rel="stylesheet" href="${contextPath}/resources/css/addNewGym.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<style type="text/css">
#kakao, #facebook, #naverblog, #home, #instagram {
	width:20px;
	height:20px;
}
</style>
<script type="text/javascript">
// 파일업로드
var cnt=1;
function fn_addFile(){
	$("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	cnt++;
}

//옵션 선택 셀렉트 박스 체인지 부분
var selectBoxChange_option = function(value){
	$('input[name="first_option"]').val(value);
}

// 메인 이미지 선택시 이미지명 추출 부분
function fileUpload(fis) {
	var str = fis.value;
	str = fis.value.substring(str.lastIndexOf("\\")+1)
	$('input[name="main_image"]').val(str);
}
</script>
</head>
<body class="pc">
    <div class="myPage_box wrap show">
      <div id="content" class="sub_wrap">
        <div class="align_rt">
          <div class="notice">
            <!-- Tab -->
            <div class="tab">
              <div class="tab_btn">
                <ul>
                  <li><a href="#">시설 등록하기</a></li>
                </ul>
              </div>
            </div>
            <div class="tab_each">
              <form action="${contextPath}/mypage/addNewGym.do" method="post" enctype="multipart/form-data">
		<table id="table1">
			<thead>
				<tr>
					<td class="fixed_join">시설명</td>
					<td>
					  <input type="text" name="gym_name" id="gym_name" placeholder="ex) 둔산 피트니스">
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">시설 전화번호</td>
					<td>
					  <input type="text" name="hp1" id="hp1">-
					  <input type="text" name="hp2" id="hp2">-
					  <input type="text" name="hp3" id="hp3">
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">시설 주소</td>
					<td>
					<div id="address_info">
                        <label>첫번째 주소</label><input type="text" name="firstAddress" id="firstAddress" placeholder="ex) 대전광역시 서구 둔산동"><br>
                        <label>상세 주소</label><input type="text" name="extraAddress" id="extraAddress" placeholder="ex) 둔산1동 1487 신화빌딩 7층">
                    </div> 
                    </td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">주 종목</td>
					<td>
					   <select onChange="selectBoxChange_option(this.value);">
					   		<option value="헬스" selected>헬스</option>
					   		<option value="필라테스">필라테스</option>
					   		<option value="복싱">복싱</option>
					   		<option value="수영">수영</option>
					   </select>
					   <input type="hidden" name="first_option" value="헬스" />
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">소개글</td>
					<td>
						<textarea rows="" cols="" id="gym_intro" name="gym_intro" placeholder=" ex) 안녕하세요! 둔산 휘트니스입니다"></textarea>
					</td>
				</tr>
			</thead>

			<thead>
				<tr>
					<td class="fixed_join">운영 시간</td>
					<td>
                        <textarea rows="" cols="" id="time_info" name="time_info" placeholder=" ex) 월-금 : 9시 ~ 10시"></textarea>
					</td>
				</tr>
			</thead>

			<thead>
				<tr>
					<td class="fixed_join">운영 프로그램</td>
					<td>
						<textarea rows="" cols="" id="program_list" name="program_list" placeholder=" ex) 유료  P.T (센터 별도 문의)"></textarea>
					</td>
				</tr>
			</thead>
			
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">편의시설</td>
				<td class="service_td">
					<input type="checkbox" id="checklist" name="service" value="1"><label>주차장</label>
                    <input type="checkbox" id="checklist" name="service" value="2"><label>운동복</label>
                    <input type="checkbox" id="checklist" name="service" value="3"><label>수건</label>
                    <input type="checkbox" id="checklist" name="service" value="4"><label>탈의실</label>
                    <input type="checkbox" id="checklist" name="service" value="5"><label>샤워실</label>
                    <input type="checkbox" id="checklist" name="service" value="6"><label>Wi-Fi</label>
                    <input type="checkbox" id="checklist" name="service" value="7"><label>체성분 검사</label>
				</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">SNS 주소</td>
					<td class="address_td">
					<div class="address_box">
					  <img src="${contextPath}/resources/image/kakao.png" id="kakao" alt="카카오톡"><input type="url" name="kakao_addr" id="kakao_addr" placeholder="카카오톡 링크 입력"><br>
					  <img src="${contextPath}/resources/image/instagram.png" id="instagram" alt="인스타그램"><input type="url" name="insta_addr" id="insta_addr" placeholder="인스타그램 주소 입력"><br>
					  <img src="${contextPath}/resources/image/blog.png" id="naverblog" alt="네이버 블로그"><input type="url" name="nblog_addr" id="nblog_addr" placeholder="네이버 블로그 주소 입력"><br>
					  <img src="${contextPath}/resources/image/facebook.png" id="facebook" alt="페이스북"><input type="url" name="fbook_addr" id="fbook_addr" placeholder="페이스북 주소 입력"><br>
					  <img src="${contextPath}/resources/image/home.png" id="home" alt="홈페이지"><input type="url" name="home_addr" id="home_addr" placeholder="홈페이지 주소 입력"><br>
					 </div>
					</td>
					

				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">시설 사진</td>
					<td>
						<label>메인 이미지(최대 한장 첨부 가능)</label>
							<input type="file" class="main_image" onchange="fileUpload(this)" />
							<input type="hidden" name="main_image" />
							<br><br>
						<label>상세 이미지 (최대 9장 첨부 가능)</label>
                        <div class="insert">
        						<input type="button" value="파일 추가" onclick="fn_addFile()"><br>
        				<div id="d_file"></div>
						</div>
                    </td>
				</tr>
			</thead>
	
			<thead>
				<tr>
					<td class="fixed_join">가격 정보</td>
					<td>
						<div id="price_info">
						<label>일일권</label><input type="number" name="price_info1" id="price" min="0" placeholder="일일권 금액을 입력하세요 (단위: 원)"><br>
						<label>1개월권</label><input type="number" name="price_info2" id="price" min="0" placeholder="1개월권 금액을 입력하세요 (단위: 원)"><br>
						<label>3개월권</label><input type="number" name="price_info3" id="price" min="0" placeholder="3개월권 금액을 입력하세요 (단위: 원)"><br>
						<label>6개월권</label><input type="number" name="price_info4" id="price" min="0" placeholder="6개월권 금액을 입력하세요 (단위: 원)"><br>
						<label>연간회원</label><input type="number" name="price_info5" id="price" min="0" placeholder="연간회원권 금액을 입력하세요 (단위: 원)">
						</div>
					</td>
				</tr>
			</thead>
		</table>
		<input type="hidden" name="array[0]" />
		<input type="hidden" name="array[1]" />
		<input type="hidden" name="array[2]" />
		<input type="hidden" name="array[3]" />
		<input type="hidden" name="array[4]" />
		<input type="hidden" name="array[5]" />
		<input type="hidden" name="array[6]" />
		<input type="hidden" name="array[7]" />
		<input type="hidden" name="array[8]" />
		<input type="hidden" name="array[9]" />
		<br>
		<div class="button_box">
			<button type="button" id="button_01"><span>이전으로</span></button>&nbsp;
			<button type="submit" id="button_02"><span>시설 등록 신청</span></button>
		 </div>
		</form>	
        </div>
        </div>
          </div>
      </div>
    </div>
</body>
</html>