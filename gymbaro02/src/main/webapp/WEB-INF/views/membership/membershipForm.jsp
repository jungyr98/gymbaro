<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/membership_01.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<head>
<meta charset="utf-8">
<script>
function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if(data.buildingName !== '' && data.apartment === 'Y'){
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if(extraRoadAddr !== ''){
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }
      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
      if(fullRoadAddr !== ''){
        fullRoadAddr += extraRoadAddr;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
      document.getElementById('roadAddress').value = fullRoadAddr;
      document.getElementById('jibunAddress').value = data.jibunAddress;

      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if(data.autoRoadAddress) {
        //예상되는 도로명 주소에 조합형 주소를 추가한다.
        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

      } else if(data.autoJibunAddress) {
          var expJibunAddr = data.autoJibunAddress;
          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
      } else {
          document.getElementById('guide').innerHTML = '';
      }
      
     
    }
  }).open();
}


$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
});

$(function() {
    $("#datepicker1").datepicker({
    	onSelect: function(dateText, inst) {
            var date = $(this).val();
            var endDate = new Date(dateText);
            var month = endDate.getMonth()+1;
            endDate.setMonth(month);
            $('#datepicker2').datepicker('setDate', endDate);
       }
    });
    $("#datepicker2").datepicker();
});
</script>
</head>
<body>
	<div class="membershipForm_box main_container">
	<div class="step_bar">
		<div class="step_bar_01 bars"><span>시설 선택</span></div>
		<div class="step_bar_02 bars"><span>이용일시 선택·결제정보 입력</span></div>
		<div class="step_bar_03 bars"><span>예약 완료</span></div>
	 </div>
	 <table id="gymInfo_table">
	 		<thead>
	 			<tr id="non-border-1">
	 				<td>
	 				<div class="cell_membership_form1">
           				 <h3 class="title-box font-mss">Purchase Info <span class="korSub">구매 정보 확인</span></h3>
       				 </div>
	 				</td>
	 			</tr>
	 		</thead>
			<thead>
				<tr id="non-border-2">
					<td class="fixed_join">
						<img width="250" alt="" src="${contextPath}/thumbnailsGym.do?gym_id=1&fileName=gym_001.jpg">
					</td>
					<td>
						<div id="gymInfo_div">
					  		<span id="gym_name">탄방 굿라이프 휘트니스</span>
					  		<div>
					  			<span><b>헬스</b></span>
					  			<span>1개월</span>
					  		</div>
					  	</div>
					</td>
				</tr>
			</thead>
	</table>
	<form action="${contextPath}/membership/membership_02.do" id="membershipForm"  method="post">
		<div class="cell_membership_form1">
            <h3 class="title-box font-mss">Membership Info <span class="korSub">회원권 정보</span></h3>
        </div>
		<table id="main_table">
			<thead>
				<tr>
					<td class="fixed_join">이름
					</td>
					<td>
					  <input type="text" name="name" id="name" value="정유라">
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">성별
					</td>
					<td>
					  <input type="text" name="gender" id="gender" value="여자">
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">생년월일
					</td>
					<td>
					  <input type="text" name="year" id="year" placeholder="YYYY">&nbsp;/<input type="text" name="month" id="month" placeholder="MM">/
					  <input type="text" name="day" id="day" placeholder="DD">
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">연락처</td>
					<td>
						<input type="text" name="hp" id="hp" value="010-1234-5678">
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td>
					   <input type="text" id="zipcode" name="zipcode" size="10">&nbsp;<button type="button" id="btn_zipcode"><a href="javascript:execDaumPostcode()">주소찾기</a></button>
					  <br>
					  <p> 
					 <input type="text" id="roadAddress" name="roadAddress"> 
					  </p>
					  <input type="text" id="extraAddress" name="extraAddress" placeholder="나머지 주소"> 
					</td>
				</tr>
			</thead>			
			<thead>
				<tr>
					<td class="fixed_join">운동 시작일</td>
					<td>
						<input type="text" id="datepicker1" placeholder="달력에서 시작일을 지정해주세요"> ~
  						<input type="text" id="datepicker2" disabled>
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">최종 결제 금액</td>
				<td>
					<p> </p>
				</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">결제 수단</td> 
					<td>
						<label class="test_obj">
    						<input type="radio" name="payment-radio" value="cash">
   							<span>무통장 입금</span>
						</label>
 
						<label class="test_obj">
    						<input type="radio" name="payment-radio" value="credit">
    						<span>신용카드</span>
						</label>
 
						<label class="test_obj">
    						<input type="radio" name="payment-radio" value="kakaopay">
    						<span>카카오페이</span>
						</label>
						<!--onchange 추가하기-->
						<div class="cash-select-box" style="display:none;">
							<br><br>
							<select id="cash-select">
								<option value="none">입금은행 선택</option>
								<option value="기업은행">기업은행</option>
								<option value="국민은행">국민은행</option>
								<option value="우리은행">우리은행</option>
								<option value="수협">수협</option>
								<option value="농협">농협</option>
								<option value="부산은행">부산은행</option>
								<option value="신한은행">신한은행</option>
								<option value="KEB하나은행">KEB하나은행</option>
								<option value="광주은행">광주은행</option>
								<option value="우체국">우체국</option>
								<option value="대구은행">대구은행</option>
								<option value="경남은행">경남은행</option>
							</select>
							<input type="text" value="" disabled>
						</div>
						<input type="hidden" name="goods_qty" value="" />
						<input type="hidden" name="payment" value="" />
					</td>
				</tr>
			</thead>	
		</table>
		<br>
		<div class="button_box" style="float: right;">
			<a><button id="button_01"><span>이전 단계</span></button></a> &nbsp;
			<a href="#"><button id="button_02"><span>예약하기</span></button></a>
		 </div>
	</form>	
</div>
</body>
</html>