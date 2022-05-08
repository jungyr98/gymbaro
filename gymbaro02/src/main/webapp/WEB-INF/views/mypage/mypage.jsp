<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<title></title>
<link href="${contextPath}/resources/css/myPage.css" rel="stylesheet" type="text/css" media="screen">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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


// 정보 수정
function fn_modify_member_info(attribute){
		var value;
		
		if(attribute=='name'){
			var name = $('input[name="name"]');
			value = name.val();
		}
		else if(attribute=='phone_number'){
			var phone_number = $('input[name="phone_number"]');
			value = phone_number.val();
		}else if(attribute=='email'){
			value = $('input[name="email"]').val();
		}else if(attribute=='address'){
			var zipcode =$('input[name="zipcode"]');
			var roadAddress = $('input[name="roadAddress"]');
			//var jibunAddress = myInfoTable.jibunAddress;
			//var namujiAddress = myInfoTable.namujiAddress;
			
			//value_jibunAddress=jibunAddress.value;
			//value_namujiAddress=namujiAddress.value;
			value = zipcode.val() + "," + roadAddress.val();
		}
		console.log(attribute, value);
	 
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/mypage/modifyMyInfo.do",
			data : {
				attribute:attribute,
				value:value
			},
			success : function(data, textStatus) {
				if(data.trim()=='mod_success'){
					alert("회원 정보를 수정했습니다.");
					location.reload();
				}else if(data.trim()=='failed'){
					alert("다시 시도해 주세요.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			}
		}); //end ajax
}

$(document).ready(function(){
	var info_yn = $('input[name="check"]');
	var attribute = 'info_yn';
	info_yn.change(function(){
	        if(info_yn.is(":checked")){
	            value = 'Y';
	        }else{
	        	value = 'N';
	        }
	        
	        $.ajax({
				type : "POST",
				async : false, //false인 경우 동기식으로 처리한다.
				url : "${contextPath}/mypage/modifyMyInfo.do",
				data : {
					attribute:attribute,
					value:value
				},
				success : function(data, textStatus) {
					if(data.trim()=='mod_success'){
						
					}else if(data.trim()=='failed'){
						alert("다시 시도해 주세요.");	
					}
					
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다."+data);
				}
			}); //end ajax
	  });
});

</script>
<script type="text/javascript">
$(document).ready(function () {
	
	var isKeyUp = false;
    var timeoutId;

    var letterRegExp = new RegExp("[a-z]");
    var capsLockRegExp = new RegExp("[A-Z]");
    var numberRegExp = new RegExp("[0-9]");
    var symbolRegExp = new RegExp("\\W");
    
	$("#change-password-btn").click(function (e) {
        e.preventDefault();
        $("#password-area").css("display", "none");
        $("#change-password-area").css("display", "");
    });

    $("#change-password-cancel-btn").click(function (e) {
        e.preventDefault();
        $("#password").val('');
        $("#newPassword").val('');
        $("#confirmPassword").val('');
        $("#password-area").css("display", "");
        $("#change-password-area").css("display", "none");
        $("#new-password-invalid").css("display", "none");
        $("#valid-newPassword").css("display", "none");
        $("#password-invalid").css("display", "none");
        $("#valid-password").css("display", "none");
        $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
        $("#change-password-finish-btn").prop('disabled', true);
        $("#newPassword").attr('class', 'n-input');
    });
    
    $("#password").keyup(function (e) {
        e.preventDefault();
        var password = $("#password");
        var newPassword = $("#newPassword");
        var confirmPassword = $("#confirmPassword");
        var displayValue = $("#new-password-invalid").css("display");
        var passwordInvalidDisplayValue = $('#password-invalid').css("display");

        if (password.val().length >= 4 &&
            newPassword.val().length >= 8 &&
            confirmPassword.val().length >= 8 &&
            displayValue == 'none' &&
            passwordInvalidDisplayValue == 'none'
        ) {
            $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent');
            $("#change-password-finish-btn").prop('disabled', false);
        } else {
            $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
            $("#change-password-finish-btn").prop('disabled', true);
        }

        value = $(this).val();
        var passwordInvalid = $('#password-invalid');
        var newPasswordInvalid = $("#new-password-invalid");

        if (!value) {
            passwordInvalid.css('display', '');
            passwordInvalid.text('');
            return false;
        }

        if (password.val().length < 4) {
            passwordInvalid.css('display', '');
            $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
            $("#change-password-finish-btn").prop('disabled', true);
            $("#password_div").attr("class", "input-password__wrap input-danger");
            passwordInvalid.text("4자리 이상 입력");
            return false;
        }

        passwordInvalid.css('display', 'none');
        $("#password_div").attr("class", "input-password__wrap ");
        if (passwordInvalid.css("display") === 'none' && newPasswordInvalid.css("display") === 'none' && confirmPassword.val().length >= 8) {
            $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent');
            $("#change-password-finish-btn").prop('disabled', false);
        }
    });

    $("#newPassword").keyup(function (e) {
        e.preventDefault();
        var newPassword = $("#newPassword");

        if (newPassword.val() == '' || newPassword.val().length < 8) {
            newPassword.attr('class', 'n-input input-danger');
            $("#valid-newPassword").css("display", "none");
            $("#new-password-invalid").css("display", "");
            $("#new-password-invalid").text("8자리 이상 입력");
            $("#newPassword_div").attr("class", "input-password__wrap input-danger");
            $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
            $("#change-password-finish-btn").prop('disabled', true);
            return false;
        } else if (checkFourConsecutiveChar(newPassword.val())) {
            newPassword.attr('class', 'n-input input-danger');
            $("#valid-newPassword").css("display", "none");
            $("#new-password-invalid").css("display", "");
            $("#new-password-invalid").text("4개 이상 연속으로 동일한 문자는 사용하실 수 없습니다.");
            $("#newPassword_div").attr("class", "input-password__wrap input-danger");
            $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
            $("#change-password-finish-btn").prop('disabled', true);
            return false;
        } else if (!isValidPassword(newPassword.val())) {
            newPassword.attr('class', 'n-input input-danger');
            $("#valid-newPassword").css("display", "none");
            $("#new-password-invalid").css("display", "");
            $("#new-password-invalid").text("숫자 ,영문 대소문자, 특수문자 중 두가지 이상으로 조합해 주십시오.");
            $("#newPassword_div").attr("class", "input-password__wrap input-danger");
            $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
            $("#change-password-finish-btn").prop('disabled', true);
            return false;
        } else {
            var points = getPassordRulePoint(newPassword.val());
            newPassword.attr('class', 'n-input');
            $("#new-password-invalid").css("display", "none");
            $("#valid-newPassword").css("display", "");
            $("#valid-newPassword").text("사용 가능");
            $("#newPassword_div").attr("class", "input-password__wrap");
            var confirmPassword = $("#confirmPassword");
            var password = $("#password");
            if (password.val().length >= 4 && confirmPassword.val().length >= 8) {
                $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent');
                $("#change-password-finish-btn").prop('disabled', false);
            } else {
                $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
                $("#change-password-finish-btn").prop('disabled', true);
            }
        }
        return true;
    });

    $("#confirmPassword").keyup(function (e) {
        e.preventDefault();
        var password = $("#password");
        var newPassword = $("#newPassword");
        var confirmPassword = $("#confirmPassword");
        var displayValue = $("#new-password-invalid").css("display");
        var passwordInvalidDisplayValue = $('#password-invalid').css("display");

        if (password.val().length >= 4 &&
            newPassword.val().length >= 8 &&
            confirmPassword.val().length >= 8 &&
            displayValue == 'none' &&
            passwordInvalidDisplayValue == 'none'
        ) {
            $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent');
            $("#change-password-finish-btn").prop('disabled', false);
        } else {
            $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
            $("#change-password-finish-btn").prop('disabled', true);
        }
    });
    
    // 테스트
    
  /*  encryptInputForm = function () {
                if (typeof encryptAES !== 'undefined') {
                    $('#encryptPassword').val(encryptAES($('#password').val().trim(), 'HHY2fbzvPr1Mlpvf6Qqei3x8FHytvCgC'));
                    $('#encryptNewPassword').val(encryptAES($('#newPassword').val().trim(), 'HHY2fbzvPr1Mlpvf6Qqei3x8FHytvCgC'));
                    $('#encryptConfirmPassword').val(encryptAES($('#confirmPassword').val().trim(), 'HHY2fbzvPr1Mlpvf6Qqei3x8FHytvCgC'));

                    $("#password").val('');
                    $("#newPassword").val('');
                    $("#confirmPassword").val('');
                }
            }*/

            $("#change-password-finish-btn").click(function (e) {
                e.preventDefault();

                var password = $("#password").val();
                var newPassword = $("#newPassword").val();
                var confirmPassword = $("#confirmPassword").val();

                if (password === '') {
                    alert('현재 비밀번호를 입력해주세요.');
                    return false;
                }

                if (password.length < 4) {
                    alert('비밀번호 4자 이상이여야합니다.');
                    return false;
                }

                if (newPassword !== confirmPassword) {
                    alert('신규 비밀번호와 재입력 비밀번호가 같지 않습니다.');
                    $("#confirmPassword").val('');
                    $("#newPassword").val('');
                    $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
                    $("#change-password-finish-btn").prop('disabled', true);
                    $("#new-password-invalid").text('');
                    $("#valid-newPassword").text('');
                    return false;
                }

                if (password === newPassword) {
                    alert('현재 비밀번호와 신규 비밀번호가 동일합니다.');
                    $("#newPassword").val('');
                    $("#confirmPassword").val('');
                    $("#change-password-finish-btn").attr('class', 'n-btn btn-sm btn-accent disabled');
                    $("#change-password-finish-btn").prop('disabled', true);
                    $("#new-password-invalid").text('');
                    $("#valid-newPassword").text('');
                    return false;
                }

                if (confirm('비밀번호를 변경하시겠습니까?')) {

                   // encryptInputForm();
                   
                   var value = $("#password").val() + "," + $("#newPassword").val();

                   $.ajax({
                            type: "post",
                            url: "${contextPath}/mypage/modifyMyInfo.do",
                            data: {
                                "attribute":"password",
                                value:value
                            },
                            success : function(data, textStatus) {
            					if(data.trim()=='mod_success'){
            						alert("비밀번호를 수정했습니다.");
            						location.reload();
            					}else if(data.trim()=='failed'){
            						alert("다시 시도해 주세요.");	
            					}
            					
            				},
            				error : function(data, textStatus) {
            					alert("에러가 발생했습니다."+data);
            				}
                        },
                        true
                    )
                }
            });

            function checkFourConsecutiveChar(password) {
                for (var i = 0; i < password.length - 3; i++) {
                    if (password.charAt(i) == password.charAt(i + 1) &&
                        password.charAt(i + 1) == password.charAt(i + 2) &&
                        password.charAt(i + 2) == password.charAt(i + 3)) {
                        return true;
                    }
                }
                return false;
            }

            function isValidPassword(password) {
                var violationCnt = 0;
                if (!letterRegExp.test(password)) {
                    violationCnt++;
                }

                if (!capsLockRegExp.test(password)) {
                    violationCnt++;
                }

                if (!numberRegExp.test(password)) {
                    violationCnt++;
                }

                if (!symbolRegExp.test(password)) {
                    violationCnt++;
                }

                if (violationCnt > 2) {
                    return false;
                } else {
                    return true;
                }
            }

            function getPassordRulePoint(password) {
                var point = 0;
                if (letterRegExp.test(password)) {
                    point = point + 4;
                }

                if (capsLockRegExp.test(password)) {
                    point = point + 4;
                }

                if (numberRegExp.test(password)) {
                    point = point + 4;
                }

                if (symbolRegExp.test(password)) {
                    point = point + 4;
                }

                return point;
            }
            
            $('input[name="phone_number"]').keyup(function (e) {
            	e.preventDefault();
            	if($('input[name="phone_number"]').val().length < 8){
            		$("#phone_number_text").text("(-) 없이 입력");
            	}else{
            		$("#phone_number_text").text('');
            	}
            });
      });

function togglePassword(_id, _this) {
    var _password = $("#" + _id);
    if (_password.attr("type") == "password") {
        _password.attr("type", "text");
        _this.className = 'input-password__button input-password__button--active';
    } else {
        _password.attr("type", "password");
        _this.className = 'input-password__button ';
    }
}
</script>
</head>
<body class="pc">
    <div class="myPage_box wrap show">
      <div class="sub_top_wrap">
        <div class="sub_top">   
          <img class="myPageUser_icon" alt="myPageUser.png" src="${contextPath}/resources/image/myPageUser.png">
          <div class="sub_top_member_info_box">
           	<span class="member_id_span">${memberInfo.member_id}</span>
           	<div class="level_and_joinDate">
           		<span>LV.${memberInfo.member_level} 멤버</span>
           		<span class="joinDate_span">가입일 : <fmt:formatDate value="${memberInfo.joinDate}" type="date"/></span>
           	</div>	
          </div>
          <div class="sub_top_member_service_box">
           	<span><img src="${contextPath}/resources/image/point.png">포인트 > ${memberInfo.member_point}</span>
           	<span><img src="${contextPath}/resources/image/coupon.png">보유 쿠폰 > 0개</span>
          </div>
        </div>
      </div>
      <div id="content" class="sub_wrap">
        <nav>
          <ul>
            <li>
              <a href="${contextPath}/mypage/mypage.do" class="active">회원정보 수정</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/listMyOrderHistory.do">주문/배송</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/listMyPointHistory.do">쿠폰/포인트</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage04.do">예약 내역</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage05.do">내 게시물 관리</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage06.do">1:1 문의 내역</a>
            </li>
          </ul>
        </nav>
        <div class="align_rt">
          <div class="notice">
            <!-- Tab -->
            <div class="tab">
              <div class="tab_btn">
                <ul>
                  <li><a href="#">회원정보 수정</a></li>
                </ul>
              </div>
            </div>
            <div class="tab_each">
              <table name="myInfoTable" border="1" width="730px;" style="margin: 0 auto;">
              <thead>
				<tr>
					<td class="fixed_join"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;이름</td>
					<td>
					<input name="name" type="text" class="mod" value="${memberInfo.member_name}" /></td>
					<td>
					 <input type="button" class="modify" value="이름 수정" onclick="fn_modify_member_info('name')"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr id="password-area">
					<td scope="row" class="fixed_join"><span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;비밀번호</td>
					<td>
						*******
					</td>
					<td>
					 <input type="button" class="modify n-btn w100 btn-sm btn-default cert-hidden" id="change-password-btn" value="비밀번호 변경" />
					</td>
				</tr>
				
				<tr id="change-password-area" style="display: none;">
                        <td scope="row" class="fixed_join pwd_td_2"><span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;비밀번호</td>
                        <td colspan="2">
                            <div class="my-info-modify">
                                <div class="my-info-modify">
                                    <input type="hidden" id="encryptPassword">
                                    <input type="hidden" id="encryptNewPassword">
                                    <input type="hidden" id="encryptConfirmPassword">
                                    <div class="input">
                                        <label for="password" class="label1">현재 비밀번호</label>
                                        <div class="input-password__wrap " id="password_div">
                                            <input type="password" class="n-input" id="password">
                                            <button type="button" class="input-password__button" onclick="togglePassword('password', this);">비밀번호 표시</button>
                                        </div>
                                        <span id="password-invalid" class="validate danger" style="display: none;"></span>
                                    </div>
                                    <div class="input">
                                        <label for="newPassword" class="label2">신규 비밀번호</label>
                                        <div class="input-password__wrap " id="newPassword_div">
                                            <input type="password" class="n-input" id="newPassword" maxlength="30">
                                            <button type="button" class="input-password__button" onclick="togglePassword('newPassword', this);">비밀번호 표시</button>
                                        </div>
                                        <span id="new-password-invalid" class="validate danger" style="display: none;"></span>
                                        <span id="valid-newPassword" class="validate" style="display: none">사용 가능한 비밀번호입니다.</span>
                                    </div>
                                    <div class="input">
                                        <label for="confirmPassword">신규 비밀번호 재 입력</label>
                                        <div class="input-password__wrap " id="confirmPassword_div">
                                            <input type="password" class="n-input" id="confirmPassword" maxlength="30">
                                            <button type="button" class="input-password__button" onclick="togglePassword('confirmPassword', this);">비밀번호 표시</button>
                                        </div>
                                        <span id="confirm-password-invalid" class="validate danger"></span>
                                        <span id="valid-confirmPassword" class="validate" style="display: none">사용 가능한 비밀번호입니다.</span>
                                    </div>
                                    <div class="btn-group">
                                        <button type="button" class="n-btn btn-sm btn-lighter" id="change-password-cancel-btn">취소</button>
                                        <button type="button" class="n-btn btn-sm btn-accent disabled" id="change-password-finish-btn" disabled="">완료</button>
                                    </div>
                                </div>
                        </div></td>
                    </tr>
                    
			</thead>
			<thead>
				<tr>
					<td class="fixed_join"><span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;휴대폰 번호</td>
					<td>
						<input type="text" name="phone_number" class="mod" value="${memberInfo.phone_number}" />
						<span id="phone_number_text"></span>
					</td>
					<td>
					 <input type="button" class="modify" value="휴대전화 변경" onclick="fn_modify_member_info('phone_number')" />
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;이메일</td>
					<td>
					<input size="10px" type="text" name="email"  class="mod" value="${memberInfo.email}" style="width:77%;"/>
					</td>
					<td>
					 <input type="button" class="modify" value="이메일 변경" onclick="fn_modify_member_info('email')" />
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join"><span class="glyphicon glyphicon-question-sign"></span>&nbsp;&nbsp;비밀번호 찾기 질문</td>
					<td><select name="pwdq" onChange="" title="질문 선택" disabled style="width:40%; height:27px;">
							<option value="${memberInfo.pwdFindQ}">${memberInfo.pwdFindQ}</option>
							<option value="none">직접 입력</option>
							<option value="나의 보물 1호는?">나의 보물 1호는?</option>
							<option value="출신 고등학교 이름은?">출신 고등학교 이름은?</option>
							<option value="기억에 남는 추억의 장소는?">기억에 남는 추억의 장소는?</option>
							<option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
							<option value="질문 추가하기">질문 추가하기</option>
						</select>
						<input size="10px" type="text" name="pwdA" value="${memberInfo.pwdFindA}" disabled style="width:45%; margin-left:5px;"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join"><span class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;주소</td>
					<td>
					   <input type="text" id="zipcode" name="zipcode" value="${memberInfo.zipcode}" size="10" style="width:40%; margin-top: 13px;">
					   <button class="form_btn">
					   		<a href="javascript:execDaumPostcode()">우편번호검색</a>
					   	</button>
					  <br>
					  <p> 
					 <input type="text" id="roadAddress"  name="roadAddress" value="${memberInfo.roadAddress}" style="width:77%;"> 
					  </p>
					</td>
					<td>
					 <input type="button" class="modify" value="주소 변경" onclick="fn_modify_member_info('address')"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;정보 메일 수신</td>
				<td id="info_check_box">
				  <section title=".slideThree">
    				<!-- .slideThree -->
    				<div class="slideThree">
    				<c:choose>
    					<c:when test="${memberInfo.info_yn == 'Y'}">
     				 		<input type="checkbox" value="Y" id="slideThree" name="check" checked/>
     					</c:when>
     					<c:otherwise>
     						<input type="checkbox" value="N" id="slideThree" name="check" />
     					</c:otherwise>
     				</c:choose>
   				   <label for="slideThree"></label>
   				 </div>
   				 <!-- end .slideThree -->
  				</section>
				</td>
				</tr>
			</thead>	
		</table>
        </div>
        </div>
            <a href="${contextPath}/mypage/outMember.do" class="withdrawal">회원 탈퇴</a>
          </div>
      </div>
    </div>
</body>
</html>