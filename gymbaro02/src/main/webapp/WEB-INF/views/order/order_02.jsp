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
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="${contextPath}/resources/css/orderForm.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

</script>

<style>
#detail_table table tbody tr{
	display: block;
}
#detail_table table tbody tr .fixed_join{
	display:block;
	font-weight: bold;
    font-size: 16px;
}
#detail_table table tbody tr td{
	display:block;
}
#detail_table table tbody tr td p{
	margin-top:0px;
}
#detail_table table tbody tr td input{
	width: 100%;
    height: 30px;
    border-radius: 5px;
    box-sizing: border-box;
    margin-bottom: 10px;
}
body {
		font-family: 'Noto Sans KR', sans-serif;
	}
table, tr, td {
   border-collapse : collapse;
   border: 1px solid #c4c4c4;
   text-align: left;
}

td {
	padding-left: 10px;
	font-size: medium;
}
</style>
<link rel="stylesheet" href="orderform.css">
</head>
<body>
	<div class="main_container">
	<h1 style="color: #184798; text-align: center;">비회원 주문서 작성</h1>
	<div class="step_bar">
		<div class="step_bar_01 bars"><span>상품 선택</span></div>
		<div class="step_bar_02 bars"><span>배송정보·결제정보 입력</span></div>
		<div class="step_bar_03 bars"><span>주문 완료</span></div>
	 </div>
	<form action="${contextPath}/order/order_03.do" method="post">
		<br><br><br>	
		<table border="1" width="976px;" height="886px;" style="margin: 0 auto;">
			<thead>
				<tr>
					<td class="fixed_join" width="129px;" height="33px" style="text-align:center; background-color: lightgray;">주문자 이름
					</td>
					<td>
					<input name="orderer" type="text" style="width: 305px; height: 30px;"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join" width="129px" height="33px" style="text-align:center; background-color: lightgray;">수령인</td>
					<td>
					<input name="receiver" type="text" style="width: 305px; height: 30px;"/></td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join"width="129px" height="33px" style="text-align:center; background-color: lightgray; ">연락처</td>
					<td>
						<input type="text" name="hp" style="width: 305px; height: 30px;"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join" width="129px" height="33px" style="text-align:center; background-color: lightgray;">배송지 주소</td>
					<td>
					   <input type="text" id="zipcode" name="zipcode" size="10" style="width:200px; height: 30px; margin-top: 15px;"> <button style="width:150px; height:30px;"><a href="javascript:execDaumPostcode()">우편번호검색</a></button>
					  <br>
					  <p> 
					 <input type="text" id="roadAddress"  name="roadAddress" style="width:355px; height: 30px;"> 
					  </p>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join" width="129px" height="43px" style="text-align:center; background-color: lightgray;">배송 메모</td>
					<td> 
						<select name="memo" onChange=""	title="배송 메모 선택" style="width:400px; height: 30px; float:left; font-family: 'Noto Sans KR', sans-serif;">
									<option value="none">배송 시 요청사항을 선택해 주세요.</option>
									<option value="배송 전 연락주세요">배송 전 연락주세요</option>
									<option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
									<option value="현관 앞에 놓아주세요">현관 앞에 놓아주세요</option>
									<option value="none">직접입력</option>
							</select></td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join" width="129px" height="43px" style="text-align: center; background-color: lightgray;">최종 결제 금액</td>
				<td>
					<p>{total_price}</p>
				</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join" width="129px" height="43px" style="text-align: center; background-color: lightgray;">결제 수단</td> 
					<td>
						<span><button id="cash" style="width:140px; height:45px;">무통장 입금</button></span>
						<span><button id="credit" style="width:140px; height:45px;">신용카드</button></span>
						<span><button id="naverpay" style="width:140px; height:45px;">네이버페이</button></span>
						<span><button id="paybyphone" style="width:140px; height:45px;">휴대폰 결제</button></span>
						<br><br>
						<!--onchange 추가하기-->
						<select name="creditcard" onChange="" title="신용카드 종류 선택" style="width:200px; height: 30px; float:left; font-family: 'Noto Sans KR', sans-serif;">
							<option value="none">신용카드 종류 선택</option>
							<option value="현대카드">현대카드</option>
							<option value="삼성카드">삼성카드</option>
							<option value="국민카드">국민카드</option>
							<option value="하나카드">하나카드</option>
					</select>
		
					<select name="installment" onChange=""	title="할부 개월 수" style="width:200px; height: 30px; float:left; font-family: 'Noto Sans KR', sans-serif;">
						<option value="none">할부 개월 수 </option>
						<option value="2개월">2개월(무이자)</option>
						<option value="3개월">3개월</option>
						<option value="4개월">4개월</option>
						<option value="5개월">5개월</option>
					</select>
					</td>
				</tr>


			</thead>	
		</table>
		<br>
		<div class="button_box" style="float: right;">
			<a><button id="button_01"><span>이전으로</span></button></a> &nbsp;
			<a><button id="button_02"><span>주문하기</span></button></a>
		 </div>
			</tbody>
		</div>
		
	</form>	
</body>
</html>