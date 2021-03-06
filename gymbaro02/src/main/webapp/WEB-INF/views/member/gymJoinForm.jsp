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
<link rel="stylesheet" href="${contextPath}/resources/css/join_03_1.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
// 회원 가입 유효성 검사
function checkAll() {
	
	if (!checkUserId(form.id.value)) {
        return false;
    }
    if (!checkPassword(form.id.value, form.member_pwd.value, form.pwd2.value)) {
        return false;
    }
    if (!checkName(form.member_name.value)) {
        return false;
    }
    if (!checkPhone()){
		return false;
    }
    if (!checkMail(form.email.value)) {
        return false;
    }
    if(!checkPasswordQnA(form.pwdFindQ.value, form.pwdFindA.value)){
    	return false;
    }

    return true;
}

// 공백확인 함수
function checkExistData(value, dataName) {
    if (value == "") {
        alert(dataName + " 입력해주세요!");
        return false;
    }
    return true;
}

function checkUserId(id) {
    //Id가 입력되었는지 확인하기
    if (!checkExistData(id, "아이디를")){
        return false;
    }

    return true; //확인이 완료되었을 때
}


function checkPassword(id,pwd,pwd2) {
    //비밀번호가 입력되었는지 확인하기
    if (!checkExistData(pwd, "비밀번호를")){
        return false;
    }
    //비밀번호 확인이 입력되었는지 확인하기
    if (!checkExistData(pwd2, "비밀번호 확인을")){
        return false;
    }

    var password1RegExp = /^(?=.*[a-z])(?=.*[0-9]).{8,12}$/; //비밀번호 유효성 검사
    if (!password1RegExp.test(pwd)) {
        alert("비밀번호는 영문 소문자와 숫자 8~12자리로 입력해야합니다!");
        form.member_pwd.value = "";
        form.member_pwd.focus();
        return false;
    }
    //비밀번호와 비밀번호 확인이 맞지 않다면..
    if (pwd != pwd2) {
        alert("두 비밀번호가 맞지 않습니다.");
        form.pwd2.value = "";
        form.pwd2.focus();
        return false;
    }

    //아이디와 비밀번호가 같을 때..
    if (id == pwd) {
        alert("아이디와 비밀번호는 같을 수 없습니다!");
        form.member_pwd.value = "";
        form.pwd2.value = "";
        form.pwd2.focus();
        return false;
    }
    return true; //확인이 완료되었을 때
}

function checkName(name) {
    if (!checkExistData(name, "이름을")){
        return false;
    }

    var nameRegExp = /^[가-힣]{2,4}$/;
    if (!nameRegExp.test(name)) {
        alert("이름이 올바르지 않습니다.");
        return false;
    }
    return true; //확인이 완료되었을 때
}

 function checkPhone(){
	 var phone_check = $('#phone_check_input').val();
	 if (phone_check != 'OK'){
		alert("휴대폰 인증을 진행해주세요!");
	    return false;
	 }
	 return true; //확인이 완료되었을 때
}

function checkMail(email) {
    //mail이 입력되었는지 확인하기
    if (!checkExistData(email, "이메일을")){
        return false;
    }

    var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]/;
    if (!emailRegExp.test(email)) {
        alert("이메일 형식이 올바르지 않습니다!");
        form.email.value = "";
        form.email.focus();
        return false;
    }
    return true; //확인이 완료되었을 때
}

function checkPasswordQnA(pwdQ, pwdA) {
    //비밀번호 찾기 질문이 선택 되었는지 확인하기
    if (!checkExistData(pwdQ, "비밀번호 찾기 질문을")){
        return false;
    }
    //비밀번호 찾기 답변이 입력되었는지 확인하기
    if (!checkExistData(pwdA, "비밀번호 찾기 답변을")){
        return false;
    }
    return true; //확인이 완료되었을 때
}

// 우편 api
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

// 아이디 중복 검사
function fn_overlapped(){
    var _id=$("#id").val();
    if(_id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
    
    var idRegExp = /^(?=.*[a-z])(?=.*[0-9]).{4,12}$/; //아이디 유효성 검사
    if (!idRegExp.test(_id)) {
        alert("아이디는 영문 소문자와 숫자 4~12자리로 입력해야합니다!");
        form.id.value = "";
        form.id.focus();
        return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/member/overlapped.do",
       dataType:"text",
       data: {id:_id},
       success:function (data,textStatus){
          if(data=='false'){
       	    alert("사용할 수 있는 ID입니다.");
       	    $('#btnOverlapped').prop("disabled", true);
       	    $('#id').prop("disabled", true);
       	    $('#member_id').val(_id);
          }else{
        	  alert("사용할 수 없는 ID입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");ㅣ
       },
       complete:function(data,textStatus){
          //alert("작업을완료 했습니다");
       }
    });  //end ajax	 
 }
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
//휴대폰 인증 api
function phone_check(){
	$('#checkBtn').prop("disabled", false);
    $('#inputCertifiedNumber').prop("disabled", false);
    var phoneNumber = $('#inputPhoneNumber').val();
    
    if(phoneNumber == ''){
    	Swal.fire('번호를 입력해주세요!')
    	return;
    }
    Swal.fire('인증번호 발송 완료!')

    $.ajax({
        type: "GET",
        url: "${contextPath}/member/check/sendSMS",
        data: {
            "phoneNumber" : phoneNumber
        },
        success: function(res){
            $('#checkBtn').click(function(){
                if($.trim(res) ==$('#inputCertifiedNumber').val()){
                    Swal.fire(
                        '인증성공!',
                        '휴대폰 인증이 정상적으로 완료되었습니다.',
                        'success'
                        )

                    $.ajax({
                        type: "GET",
                        url: "/update/phone",
                        data: {
                            "phoneNumber" : $('#inputPhoneNumber').val()
                        }
                    })
                    //history.back();
                    $('#checkBtn').prop("disabled", true);
                    $('#inputCertifiedNumber').prop("disabled", true);
                    $('#phone_check_input').attr('value', 'OK');
                }else{
                    Swal.fire({
                        icon: 'error',
                        title: '인증오류',
                        text: '인증번호가 올바르지 않습니다!',
                     // footer: '<a href="/home">다음에 인증하기</a>'
                    })
                }
            })


        }
    }); // end ajax
};

//이메일 셀렉트 박스 체인지 부분
var selectBoxChange_email = function(value){
	if(value == 'none'){
		$('#email2').val('');
		return;
	}
	$('#email2').val(value);
}

//비밀번호 찾기 답변 셀렉트 박스 체인지 부분
var selectBoxChange_pwdQ = function(value){
	if(value == 'none'){
		$('#pwdFindQ').val('');
		return;
	}
	$('#pwdFindQ').val(value);
}

//정보수신 동의여부 체인지 부분
var info_yn = $('input[name="info_yn"]');
info_yn.change(
	function(){
		if(info_yn.is(":checked")){
			info_yn.val('Y');
		}else {
			info_yn.val('N');
		}
	});
</script>
</head>
<body>
	<div class="join_03_1_box main_container">
	<div class="first_content">
   <div class="first_text">
      <span><b>정보 입력</b></span>
   </div>
   <div class="step_bar">
      <div class="step_bar_01 bars"><span>약관 동의</span></div>
      <div class="step_bar_02 bars"><span>본인인증/정보입력</span></div>
      <div class="step_bar_03 bars"><span>가입완료</span></div>
   </div>
   <div class="form_box">
	<form name=form onsubmit="return checkAll()" action="${contextPath}/member/addMember.do?join_type=gym" method="post">	
		<table border="1" width="730px;" style="margin: 0 auto;">
			<thead>
				<tr>
					<td class="fixed_join">*아이디
					</td>
					<td>
					  <input type="text" name="id" id="id" style="width:200px;" />
					  <input type="hidden" name="member_id"  id="member_id" />
					  <input type="button"  id="btnOverlapped" class="form_btn" value="중복확인" onClick="fn_overlapped()"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">*비밀번호</td>
					<td>
					<input name="member_pwd" type="password" style="width:200px"/></td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join" width="25%">*비밀번호 확인</td>
					<td>
					<input name="pwd2" type="password" style="width:200px" /></td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">*이름</td>
					<td>
					<input name="member_name" type="text" style="width:200px" />
					<input type="hidden" name="member_level" value="1" />
					<input type="hidden" name="member_point" value="1000" />
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">*성별</td>
					<td>
						<input type="radio" name="member_gender" class="member_gender" value="여자" checked />
						<label class="gender_label">여성</label>&nbsp;&nbsp;
						<input type="radio" name="member_gender" class="member_gender" value="남자" />
						<label class="gender_label">남성</label>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">*휴대폰 번호</td>
					<td>
						<input type="text" name="hp" id="inputPhoneNumber" width=200px />
						<input type="button" id="sendPhoneNumber" class="form_btn" value="인증번호 받기" onClick="phone_check()" /> <br>
						<input type="text" name="cerNum" id="inputCertifiedNumber" width=200px disabled />
						<input type="button" id="checkBtn" class="form_btn" value="인증번호 확인" onclick="" disabled/>
						<input type="hidden" name="phone_check_input" id="phone_check_input" />
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">이메일</td>
					<td>
					<input size="10px" type="text" name="email1" style="width:30%;"/> @ <input size="10px" type="text" name="email2" id="email2" style="width:30%;"/> 
						  <select name="email_select" id="email_select" onChange="selectBoxChange_email(this.value);" title="직접입력" style="width:22%; height:27px;">
									<option value="none">직접입력</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="naver.com">naver.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="paran.com">paran.com</option>
									<option value="nate.com">nate.com</option>
									<option value="google.com">google.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="empal.com">empal.com</option>
									<option value="korea.com">korea.com</option>
									<option value="freechal.com">freechal.com</option>
							</select></td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">*비밀번호 찾기 질문</td>
					<td><select name="pwdQ" id="pwdQ" onChange="selectBoxChange_pwdQ(this.value);" title="질문 선택" style="width:31%; height:27px;">
							<option value="none">질문 선택</option>
							<option value="나의 보물 1호는?">나의 보물 1호는?</option>
							<option value="출신 고등학교 이름은?">출신 고등학교 이름은?</option>
							<option value="기억에 남는 추억의 장소는?">기억에 남는 추억의 장소는?</option>
							<option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
						</select>
						<input type="hidden" name="pwdFindQ" id="pwdFindQ" />
						<input size="10px" type="text" name="pwdFindA" style="width:45%; margin-left:5px;"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td>
					   <input type="text" id="zipcode" name="zipcode" size="10" style="width:40%; margin-top: 13px;">
					   <button type="button" style="width:20%; height:27px;" onclick="execDaumPostcode();">우편번호검색</button>
					  <br>
					  <p> 
					 <input type="text" id="roadAddress"  name="roadAddress" style="width:77%;"> 
					  </p>
					  <input type="hidden" id="jibunAddress" name="jibunAddress">
					 <input type="hidden" id="guide">
					 <input type="text" id="extraAddress"  name="extraAddress" placeholder="나머지 주소" style="width:77%;">
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">사업자 등록번호</td>
					<td id="info_check_box">
						<input type="text" name="license1" /> - <input type="text" name="license2" /> - <input type="text" name="license3" />
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">정보 메일 수신</td>
				<td id="info_check_box">
				  <label>
					정보를 메일로 받겠습니다.&nbsp;
					<input type="checkbox" name="info_yn" value="Y" checked />
				  </label>
				</td>
				</tr>
			</thead>	
		</table>
		<br>
		<div class="button_box">
     	 <a href="javascript:history.back();" id="button_01">이전 단계</a>
     	 <input type="submit" id="button_02" value="가입하기">
   		</div>
   </form>
   </div>
  </div>
 </div>
</body>
</html>