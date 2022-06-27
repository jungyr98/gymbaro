<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- 아임포트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<head>
<meta charset="utf-8">
<script type="text/javascript">

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
    yearSuffix: '년',
});

$(function() {
	var option = $('input[name="option"]').val();
	var minDate1 = $('input[name="minDate"]').val();
	console.log(minDate1)
	if(minDate1 == '0'){
		minDate1 = parseInt(minDate1);
	}
    $("#datepicker1").datepicker({
    	dateFormat: 'yy-mm-dd',
    	minDate: minDate1,
    	onSelect: function(dateText, inst) {
            var date = $(this).val();
            var endDate = new Date(dateText);
            if(option=='1day'){
            	var day = endDate.getDate()+1;
            	endDate.setDate(day);
            }else{
            	var month = endDate.getMonth()+parseInt(option);
            	endDate.setMonth(month);
            }
            $('#datepicker2').datepicker('setDate', endDate);
            endDate = endDate.getFullYear() + "-" + ((endDate.getMonth() + 1) > 9 ? (endDate.getMonth() + 1).toString() : "0" + (endDate.getMonth() + 1)) + "-" + endDate.getDate();
            $('input[name="last_date"]').val(endDate);
       }
    });
    $("#datepicker2").datepicker({
    	dateFormat: 'yy-mm-dd',
    });
});

</script>
<script>
var key = $('input[name="KEY"]').val();


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


function kakaopay_btn() {
    	var total_price = $('input[name="total_price"]').val();
    	var name = $('input[name="buyItemName"]').val();
    	var buyer_name = $('input[name="name"]').val();
    	var buyer_tel = $('input[name="phone_number"]').val();
    	var buyer_addr = $('input[name="roadAddress"]').val();
    	var buyer_postcode = $('input[name="zipcode"]').val();
    	//@@@@@@ 1번 @@@@@@@
        var IMP = window.IMP; // 생략가능
        IMP.init(key); //가맹점 식별코드 삽입
        var msg;
        
        //@@@@@@@@ 2번 @@@@@@@@
        //url에서 parameter 가져오기 --> price값 알기 위해서
        var getParam = function(key){
            var _parammap = {};
            document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
                function decode(s) {
                    return decodeURIComponent(s.split("+").join(" "));
                }

                _parammap[decode(arguments[1])] = decode(arguments[2]);
            });

            return _parammap[key];
        };
        
		//@@@@@@ 3번 @@@@@@@
            IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : name,
            amount : total_price,
            buyer_email : 'no',
            buyer_name : buyer_name,
            buyer_tel : buyer_tel,
            buyer_addr : buyer_addr,
            buyer_postcode : buyer_postcode,
           // m_redirect_url : '결제 완료후 이동할 페이지'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "${contextPath}/order/payToOrderGoods.do", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        uid : rsp.imp_uid,
                        price: rsp.paid_amount
                        //기타 필요한 데이터가 있으면 추가 전달
                    })
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\n결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;

                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                var formObj = $('#membershipForm');
                formObj.removeAttr('onsubmit');
                formObj.submit();
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지

                alert(msg);
                
            }
        });
};

function credit_btn() {
	var name = $('input[name="buyItemName"]').val();
	var buyer_name = $('input[name="name"]').val();
	var buyer_tel = $('input[name="phone_number"]').val();
	var buyer_addr = $('input[name="roadAddress"]').val();
	var buyer_postcode = $('input[name="zipcode"]').val();
	  //class가 btn_payment인 태그를 선택했을 때 작동한다.
		console.log("크레딧함수");
	  	IMP.init(key);
	  	//결제시 전달되는 정보
		IMP.request_pay({
				    pg : 'html5_inicis', 
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : name,/*상품명*/
				    amount : 100/*상품 가격*/, 
				    buyer_email : 'no'/*구매자 이메일*/,
				    buyer_name : buyer_name,
				    buyer_tel : buyer_tel/*구매자 연락처*/,
				    buyer_addr : buyer_addr/*구매자 주소*/,
				    buyer_postcode : buyer_postcode/*구매자 우편번호*/
				}, function(rsp) {
					var result = '';
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        result ='0';
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        result ='1';
				    }
				    if(result=='0') {
				    	var formObj = $('#membershipForm');
		                formObj.removeAttr('onsubmit');
		                formObj.submit();
				    }
				    alert(msg);
				});
			}

//주문하기 누를시 해당 결제방법으로 결제하기
function order_btn(){
	var check = confirm("회원권을 결제하시겠습니까?");
	if(check){
	var payment = $('input[name=payment]').val();
	if(payment == '신용카드'){
		if(!credit_btn()){
			return false;
		}
	} else if(payment == '카카오페이'){
		if(!kakaopay_btn()){
			return false;
		}
	} else if(payment == ''){
		alert("결제수단을 선택해주세요!");
		return false;
	} else if(payment == '무통장입금'){
		var cashSelect = $('#cash-select');
		if(cashSelect.val() == 'none'){
			alert("입금은행을 선택해주세요!");
			return false;
		}
	  }
	} else {
		return false;
	}
	return true;
}

$(document).ready(function(){
//결제 라디오버튼 클릭시 이벤트 발생
$("input:radio[name='payment-radio']").click(function(){
	$('.cash-select-box').css("display", "none");
	$('.credit-select-box').css("display", "none");
    if($("input[name='payment-radio']:checked").val() == "cash"){
		$('.cash-select-box').css("display", "");
		$('input[name=payment]').val('무통장입금');
    }else if($("input[name='payment-radio']:checked").val() == "credit"){
    	$('.credit-select-box').css("display", "");
    	$('input[name=payment]').val('신용카드');
    }else if($("input[name='payment-radio']:checked").val() == "kakaopay"){
    	$('input[name=payment]').val('카카오페이');
    }
});
$("#day").change(function(){
	var birth = $("#year").val()+"-"+$("#month").val()+"-"+$("#day").val();
	$("#birth").val(birth);
});
});
</script>
</head>
<body>
	<div class="membershipForm_box main_container">
	<input type="hidden" name="KEY" value="${KEY}" />
	<div class="step_bar">
		<div class="step_bar_01 bars"><span>시설 선택</span></div>
		<div class="step_bar_02 bars"><span>이용일시 선택·결제정보 입력</span></div>
		<div class="step_bar_03 bars"><span>예약 완료</span></div>
	 </div>
	 <!-- 이미 회원권이 있다면, 해당 회원권이 만료되는 날짜까지는 선택하지 못하게 한다  -->
	 <c:if test="${empty minDate}">
	 	<input type="hidden" name="minDate" value="0">
	 </c:if>
	 <c:if test="${not empty minDate}">
	 	<fmt:formatDate var="item" value="${minDate.last_date}" pattern="YYYY-MM-dd"/>
	 	<input type="hidden" name="minDate" value="${item}">
	 </c:if>
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
						<img width="250" alt="" src="${contextPath}/thumbnailsGym.do?gym_id=${optionMap.gym_id}&fileName=${optionMap.gym_fileName}">
					</td>
					<td>
						<div id="gymInfo_div">
					  		<span id="gym_name">${optionMap.gym_name}</span>
					  		<div>
					  			<span><b>${optionMap.first_option}</b></span>
					  				<c:choose>
					  				<c:when test="${optionMap.option eq '1day'}">
					  					<span>1일권</span>
					  				</c:when>
					  				<c:otherwise>
					  					<span>${optionMap.option}개월</span>
					  				</c:otherwise>
					  			</c:choose>
					  		</div>
					  	</div>
					  	<c:choose>
					  	<c:when test="${optionMap.option eq '1day'}">
					  		<input type="hidden" name="buyItemName" value="${optionMap.gym_name} 1일권" />
					  	</c:when>
					  	<c:otherwise>
					  	<input type="hidden" name="buyItemName" value="${optionMap.gym_name} ${optionMap.option}개월" />
					  	</c:otherwise>
					  	</c:choose>
					</td>
				</tr>
			</thead>
	</table>
	<form action="${contextPath}/membership/addNewMembership.do" id="membershipForm"  method="post" onsubmit="return order_btn();">
		<div class="cell_membership_form1">
            <h3 class="title-box font-mss">Membership Info <span class="korSub">회원권 정보</span></h3>
        </div>
		<table id="main_table">
			<thead>
				<tr>
					<td class="fixed_join">이름
					</td>
					<td>
					  <input type="text" name="name" id="name" value="${memberInfo.member_name}" readonly>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">성별
					</td>
					<td>
					  <input type="text" name="gender" id="gender" value="${memberInfo.member_gender}" readonly>
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
					  <input type="hidden" name="birth" id="birth" />
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">연락처</td>
					<td>
						<input type="text" name="phone_number" id="hp" value="${memberInfo.phone_number}" readonly>
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td>
					   <input type="text" id="zipcode" name="zipcode" value="${memberInfo.zipcode}" size="10">&nbsp;<button type="button" id="btn_zipcode"><a href="javascript:execDaumPostcode()">주소찾기</a></button>
					  <br>
					  <p> 
					 <input type="text" id="roadAddress" name="roadAddress" value="${memberInfo.roadAddress}"> 
					  </p>
					  <input type="text" id="extraAddress" name="extraAddress" placeholder="나머지 주소"> 
					</td>
				</tr>
			</thead>			
			<thead>
				<tr>
					<td class="fixed_join">운동 시작일</td>
					<td>
						<input type="text" name="start_date" id="datepicker1" placeholder="달력에서 시작일을 지정해주세요" readonly> ~
  						<input type="text" name="last_date2" id="datepicker2" disabled>
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">최종 결제 금액</td>
				<td>
					<fmt:formatNumber value="${optionMap.total_price}" type="number" var="total_price" />
					<p>${total_price}원</p>
					<input type="hidden" name="total_price" value="${optionMap.total_price}" />
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
							<input type="text" value="${memberInfo.member_name}" disabled>
						</div>
						<input type="hidden" name="uid" value="${memberInfo.uid}" />
						<input type="hidden" name="gym_id" value="${optionMap.gym_id}" />
						<input type="hidden" name="gym_name" value="${optionMap.gym_name}" />
						<input type="hidden" name="first_option" value="${optionMap.first_option}" />
						<input type="hidden" name="option" value="${optionMap.option}" />
						<input type="hidden" name="last_date" />
						<input type="hidden" name="payment" value="" />
					</td>
				</tr>
			</thead>	
		</table>
		<br>
		<div class="button_box" style="float: right;">
			<a><button type="button" id="button_01"><span>이전 단계</span></button></a> &nbsp;
			<a href="#"><button type="submit" id="button_02"><span>예약하기</span></button></a>
		 </div>
	</form>	
</div>
</body>
</html>