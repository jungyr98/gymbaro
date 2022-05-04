<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<link rel="stylesheet" href="${contextPath}/resources/css/order_02.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<head>
<meta charset="utf-8">
<!-- 아임포트 -->
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
function kakaopay_btn() {
    $(function(){
    
    	//@@@@@@ 1번 @@@@@@@
        var IMP = window.IMP; // 생략가능
        IMP.init('imp55512719'); //가맹점 식별코드 삽입
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
            name : 'vivipayment',
            amount : ${orderMap.total_price},
            buyer_email : '이메일 넣기',
            buyer_name : '이름 넣기',
            buyer_tel : '번호 넣기',
            buyer_addr : '주소 넣기',
            buyer_postcode : '123-456',
           // m_redirect_url : '결제 완료후 이동할 페이지'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "${contextPath}/order/order_03.do", //cross-domain error가 발생하지 않도록 주의해주세요
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
                location.href='${contextPath}/order/order_03.do?msg='+msg;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지

                alert(msg);
                
            }
        });

    });
};

function credit_btn() {
	  //class가 btn_payment인 태그를 선택했을 때 작동한다.
		console.log("크레딧함수");
	  	IMP.init('imp55512719');
	  	//결제시 전달되는 정보
		IMP.request_pay({
				    pg : 'html5_inicis', 
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '주문명:결제테스트'/*상품명*/,
				    amount : 100/*상품 가격*/, 
				    buyer_email : 'iamport@siot.do'/*구매자 이메일*/,
				    buyer_name : '구매자이름',
				    buyer_tel : '010-1234-5678'/*구매자 연락처*/,
				    buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/,
				    buyer_postcode : '123-456'/*구매자 우편번호*/
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
				    	location.href= "${contextPath}/order/order_03.do";
				    }
				    alert(msg);
				});
			}
			
function order_btn(){
	var payment = $('input[name=payment]').val();
	if(payment == '신용카드'){
		if(!credit_btn()){
			return false;
		}
	} else if(payment == '카카오페이'){
		if(!kakaopay_btn()){
			return false;
		}
	}
	return true;
}
</script>

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

//배송지 선택 체인지 부분
$(document).ready(function(){
	 
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=radio]").click(function(){
        if($("input[name=radio]:checked").val() == "1"){
        	$('.receiver_name').val('${memberInfo.member_name}');
			$('.receiver_name').prop("disabled", true);
			$('.receiver_phone_number').val('${memberInfo.phone_number}');
			$('.receiver_phone_number').prop("disabled", true);
			$('#zipcode').val('${memberInfo.zipcode}');
			$('#zipcode').prop("disabled", true);
			$('#roadAddress').val('${memberInfo.roadAddress}');
			$('#roadAddress').prop("disabled", true);
 
        }
    });
    
 // 결제 라디오버튼 클릭시 이벤트 발생
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
    
    //휴대폰 번호 입력시 문구창
    $('input[name="receiver_phone_number"]').keyup(function (e) {
    	e.preventDefault();
    	if($('input[name="receiver_phone_number"]').val().length < 8){
    		$("#phone_number_text").text("(-) 없이 입력");
    	}else{
    		$("#phone_number_text").text('');
    	}
    });
    
  //포인트 전체사용 체인지 부분
    var all_point = $('input[name="all_point"]');
    var point = $('input[name="point"]');
    all_point.change(
    	function(){
    		if(all_point.is(":checked")){
    			point.val('${memberInfo.member_point}');
    		}else {
    			point.val('0원');
    		}
    	});
});

//배송 메모 셀렉트 박스 체인지 부분
var selectBoxChange_memo = function(value){
	$('input[name="delivery_memo"]').css('display', 'none');
	$('input[name="delivery_memo"]').val('');
	if(value == 'write_memo'){
		$('input[name="delivery_memo"]').css('display', '');
		return;
	}
	$('input[name="delivery_memo"]').val(value);
}

function showPopup() { window.open("${contextPath}/order/order_coupon.do", "a", "width=700, height=400, left=100, top=50"); }
</script>
<style type="text/css">
 .test_obj input[type="radio"] {
        display: none;
    }
 
    .test_obj input[type="radio"] + span {
        display: inline-block;
        width: 120px;
    	padding: 10px 10px;
        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        text-align: center;
        cursor: pointer;
    }
 
    .test_obj input[type="radio"]:checked + span {
        background-color: #184798;
        color: #ffffff;
    }
</style>
</head>
<body>
	<div class="orderForm_box main_container">
	<div class="step_bar">
		<div class="step_bar_01 bars"><span>상품 선택</span></div>
		<div class="step_bar_02 bars"><span>배송정보·결제정보 입력</span></div>
		<div class="step_bar_03 bars"><span>주문 완료</span></div>
	 </div>
	<form action="${contextPath}/order/order_03.do" method="post" onsubmit="return order_btn();">
		<div class="cell_order_form1">
            <h3 class="title-box font-mss">Recipient Info <span class="korSub">수령자 정보</span></h3>
        </div>	
		<table id="main_table">
			<thead>
				<tr>
					<td class="fixed_join">수령인 정보
					</td>
					<td>
					  <input type="radio" name="radio" id="oldinfo" value="1" checked/>&nbsp;기존 회원 정보와 동일 &nbsp;&nbsp;
					  <input type="radio" name="radio" id="newinfo" value="0" />&nbsp;새로운 수령인 정보 
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">수령인</td>
					<td>
					<input name="receiver_name" class="receiver_name" type="text" id="receiver" value="${memberInfo.member_name }" disabled/></td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">휴대폰 번호</td>
					<td>
						<input type="text" name="receiver_phone_number" class="receiver_phone_number" id="hp" value="${memberInfo.phone_number }"  disabled/>
						&nbsp;<span id="phone_number_text"></span>
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">배송지 주소</td>
					<td>
					   <input type="text" id="zipcode" name="receiver_zipcode" size="10" value="${memberInfo.zipcode }">&nbsp;<button type="button" id="btn_zipcode"><a href="javascript:execDaumPostcode()">우편번호검색</a></button>
					  <br>
					  <p> 
					 <input type="text" id="roadAddress" name="receiver_roadAddress" value="${memberInfo.roadAddress }"> 
					  </p>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">배송 메모</td>
					<td> 
						<select name="memo" onChange="selectBoxChange_memo(this.value);" title="배송 시 요청사항을 선택해 주세요" id="delivery_memo">
									<option value="none">배송 시 요청사항을 선택해 주세요.</option>
									<option value="배송 전 연락주세요">배송 전 연락주세요</option>
									<option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
									<option value="현관 앞에 놓아주세요">현관 앞에 놓아주세요</option>
									<option value="write_memo">직접입력</option>
						</select>
						<br>
						<p>
						<input type="text" name="delivery_memo" style="display:none;" />
						</p>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">포인트 사용</td>
					<td>
						<input size="10px" type="text" name="point" id="point" placeholder="0원" />&nbsp;<input type="checkbox" name="all_point"/>&nbsp;모두 사용하기
						<span>(사용 가능 적립금 <b>${memberInfo.member_point }</b>원)</span>
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">쿠폰 사용</td>
					<td><a><button type="button" id="coupon" onclick="showPopup();">쿠폰 조회/적용</button></a>  할인 금액 : </td>
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">최종 결제 금액</td>
				<td>
					<fmt:formatNumber  value="${orderMap.total_price}" type="number" var="total_price" />
					<p>${total_price}원</p>
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
							<select>
								<option>입금은행 선택</option>
								<option>기업은행</option>
								<option>국민은행</option>
								<option>우리은행</option>
								<option>수협</option>
								<option>농협</option>
								<option>부산은행</option>
								<option>신한은행</option>
								<option>KEB하나은행</option>
								<option>광주은행</option>
								<option>우체국</option>
								<option>대구은행</option>
								<option>경남은행</option>
							</select>
							<input type="text" value="${memberInfo.member_name }" disabled>
						</div>
						<input type="hidden" name="payment" value="" />
					</td>
				</tr>


			</thead>	
		</table>
		<br>
		<div class="button_box" style="float: right;">
			<a><button id="button_01"><span>이전으로</span></button></a> &nbsp;
			<input type="submit" id="button_02" value="주문하기">
		 </div>
		 </form> 
		</div>
</body>
</html>