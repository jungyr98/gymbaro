<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link href="${contextPath}/resources/css/myPage.css" rel="stylesheet" type="text/css" media="screen">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<html>
<head>
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>

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
<script type="text/javascript">
$(function() {
  $('.modify').val('수정')
  $('.modify').click( function() {
  var idx = $(".modify").index(this)
    if( $(this).val() == '수정' ) {
      $(this).replaceWith('<input type="submit" class="modify" value="변경"></input>');
      $('.mod').eq(idx).attr("readonly", false);
      $('.mod').eq(idx).css({'border':'1px solid rgba(0,0,0,0.2)','border-radius':'4px;', 'width':'150px', 'box-shadow': '0px 0px 1px 1px rgba(190, 190, 190, 0.6)','height':'28px','border-radius':'4px'});
    }
  });
});

</script>
</head>
<body class="pc">
    <div class="wrap show">
      <div class="sub_top_wrap">
        <div class="sub_top">
          <a>MY페이지</a>
        </div>
      </div>
      <div id="content" class="sub_wrap">
        <nav>
          <ul>
            <li>
              <a href="${contextPath}/mypage/mypage.do" class="active">회원정보 수정</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage02.do">주문/배송</a>
            </li>
            <li>
              <a href="${contextPath}/mypage/myPage03.do">쿠폰/포인트</a>
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
              <table border="1" width="730px;" style="margin: 0 auto;">
			<thead>
				<tr>
					<td class="fixed_join"><span>*아이디</span>
					</td>
					<td>
					  <input type="text" name="id"  id="id" value="gymbaro02" disabled/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">*비밀번호</td>
					<td>
					<input name="pwd" type="password" class="mod" value="*********" readonly/></td>
					<td>
					 <input type="button" class="modify"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join" width="25%">*비밀번호 확인</td>
					<td>
					<input name="pwd" type="password" value="*********" readonly/></td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">*이름</td>
					<td>
					<input name="name" type="text" class="mod" value="정유라" readonly /></td>
					<td>
					 <input type="button" class="modify"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">*휴대폰 번호</td>
					<td>
						<input type="text" name="hp" class="mod" value="01012345678" readonly/>
						<input type="button" id="hp" class="form_btn" value="인증번호 받기" onClick=""/>
					</td>
					<td>
					 <input type="button" class="modify"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">이메일</td>
					<td>
					<input size="10px" type="text" name="email"  class="mod" value="gymbaro02" readonly/> @ 
					<input  size="10px"  type="text"name="email2"  class="mod" value="google.com" readonly/> 
						  <select name="email2" onChange=""	title="직접입력" style="width:22%; height:27px;">
									<option value="non">직접입력</option>
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
					<td>
					 <input type="button" class="modify"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr>
					<td class="fixed_join">*비밀번호 찾기 질문</td>
					<td><select name="pwdq" onChange="" title="질문 선택" style="width:31%; height:27px;">
							<option value="none">질문 선택</option>
							<option value="q1">나의 보물 1호는?</option>
							<option value="q2">출신 고등학교 이름은?</option>
							<option value="q3">기억에 남는 추억의 장소는?</option>
							<option value="q4">가장 좋아하는 음식은?</option>
							<option value="addq3">질문 추가하기</option>
						</select>
						<input size="10px" type="text" name="pwdq" style="width:45%; margin-left:5px;"/>
					</td>
					<td>
					 <input type="button" class="modify"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td>
					   <input type="text" id="zipcode" name="zipcode" size="10" style="width:40%; margin-top: 13px;">
					   <button class="form_btn">
					   		<a href="javascript:execDaumPostcode()">우편번호검색</a>
					   	</button>
					  <br>
					  <p> 
					 <input type="text" id="roadAddress"  name="roadAddress" style="width:77%;"> 
					  </p>
					</td>
					<td>
					 <input type="button" class="modify"/>
					</td>
				</tr>
			</thead>
			<thead>
				<tr class="dot_line">
					<td class="fixed_join">정보 메일 수신</td>
				<td>
					<div class="radio_btn_box">
						<input type="radio" id="yes" name="radio"><label> 예</label>
						<input type="radio" id="no" name="radio"><label> 아니오</label>
					</div>
				</td>
				<td>
					 <input type="button" class="modify"/>
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