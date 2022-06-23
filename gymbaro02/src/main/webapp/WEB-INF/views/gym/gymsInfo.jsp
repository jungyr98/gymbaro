<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="gymVO" value="${gymMap.gymVO}" />
<c:set var="imageList" value="${gymMap.imageList}" />
<c:set var="likedState" value="${gymMap.likedState}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/gymsInfo.css">
<title>Insert title here</title>
<script type="text/javascript">
$(function () {
    var tab_Btn = $(".tab_btn > ul > li");
    var tab_Cont = $(".tab_cont > div");
    tab_Cont.hide().eq(0).show();
    tab_Btn.click(function (e) {
         e.preventDefault();
         var target = $(this);
         var index = target.index();
         tab_Btn.removeClass("active");
         target.addClass("active");
         tab_Cont.hide();
         tab_Cont.eq(index).show();
    });
});

//회원 주문하기 submit
function membership_check(){
	var value3 = $('#option').val();
	var gym_id = $('input[name="gym_id"]').val();
	var member_yn = $('input[name="member_yn"]').val();
	var action = "/gym/gymsInfo.do?gym_id="+gym_id;
	if(value3==''){
		alert("옵션을 선택해주세요!");
		return false;
	}else if(member_yn == 'N'){
		alert("로그인이 필요한 서비스입니다!");
		location.href = "${contextPath}/member/loginForm.do?mode=common&action="+action;
		return false;
	}else{
		var check = confirm("구매하시겠습니까?");
		if(check){
			return true;
		}else{
			return false;
		}
	}
}

//옵션 셀렉트 박스 체인지 부분
var selectBoxChange_option = function(value){
	if(value == 'none'){
		$('#option').val('');
		$('#total_price').val('');
		return;
	}
	if(value == 1){
		$('#total_price').val('${gymVO.price_info2}');
		$('#option').val(value);
	}else if(value == 3){
		$('#total_price').val('${gymVO.price_info3}');
		$('#option').val(value);
	}else if(value == 6){
		$('#total_price').val('${gymVO.price_info4}');
		$('#option').val(value);
	}else if(value == 12){
		$('#total_price').val('${gymVO.price_info5}');
		$('#option').val(value);
	}else if(value == "1day"){
		$('#total_price').val('${gymVO.price_info1}');
		$('#option').val(value);
	}
}

//리뷰 글자수 제한
$(function(e) { 
$('#gym_review_input').keyup(function (e) {
	let content = $(this).val();
		if (content.length == 0 || content == '') {
			$('.text_count').text('0');	
		} else {
			$('.text_count').text(content.length);
		}	
		if (content.length > 200) {
			$(this).val($(this).val().substring(0, 200));
			alert('리뷰는 200자까지 입력할 수 있습니다!');
		};
});
});

function review_check() {
	var content = $("#gym_review_input").val();
	var score_gym = $('input[name="score_gym"]').is(':checked');
	var score_instructor = $('input[name="score_instructor"]').is(':checked');
	var score_access = $('input[name="score_access"]').is(':checked');
	
	if (content == '') {
		alert("내용을 입력해주세요!");
		return false;
	} else if (score_gym == false) {
		alert("시설 별점을 선택해주세요!");
		return false;
	} else if (score_instructor == false) {
		alert("시설 별점을 선택해주세요!");
		return false;
	} else if (score_access == false) {
		alert("접근성 별점을 선택해주세요!");
		return false;
	} else {
		var review_check = confirm("리뷰를 등록하시겠습니까?");
		if(review_check == true) {
			alert("리뷰가 등록되었습니다!");
			return true;
		} else {
			alert("리뷰 작성이 취소되었습니다.");
			return false;
		}
	}
}
// 찜 상태 변경하기
function updateLiked(gym_id, state) {
	if(state == 'Y'){
		var check = confirm("찜을 해제하시겠습니까?");
		if(check){
			$.ajax({
				type : "post",
				async : false, //false인 경우 동기식으로 처리한다.
				url : "${contextPath}/liked/deleteLikedItem.do",
				data : {
					gym_id:gym_id,
				},
				
				success : function(data, textStatus) {
					//alert(data);
					if(data.trim()=='delSuccess'){
						alert("찜을 취소했습니다!");
						location.reload();
					}else if(data.trim()=='login'){
						alert("로그인이 필요한 서비스입니다!");
						location.href="${contextPath}/member/loginForm.do?mode=common";
					}
					
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다."+data);
				}
			});
		} else{
			alert("취소하셨습니다");
			return;
		}
	}else if(state == 'N') {
			$.ajax({
				type : "post",
				async : false, //false인 경우 동기식으로 처리한다.
				url : "${contextPath}/liked/addNewLiked.do",
				data : {
					gym_id:gym_id,
				},
				
				success : function(data, textStatus) {
					//alert(data);
					if(data.trim()=='addSuccess'){
						alert("찜 했습니다!");
						location.reload();
					}else if(data.trim()=='doLogin'){
						alert("로그인이 필요한 서비스입니다.");
						location.href="${contextPath}/member/loginForm.do";
					}
					
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다."+data);
				}
			});
	}
}
</script>
</head>
<body>
<div class="main_container">
	<div class="gym_info_header_box">
		<c:if test="${empty memberInfo}">
			<input type="hidden" name="member_yn" value="N">
		</c:if>
		<c:if test="${not empty memberInfo}">
			<input type="hidden" name="member_yn" value="Y">
		</c:if>
		<div class="gym_info_header_img">
			<img alt="HTML5 &amp; CSS3" src="${contextPath}/downloadGym.do?gym_id=${gymVO.gym_id}&fileName=${gymVO.gym_fileName}">
		</div>
		<div class="gym_info_header_text">
			<div id="title_and_heart_box">
				<span class="gym_info_header_title">${gymVO.gym_name}</span>
				<!-- 시설 회원에게는 찜 기능이 노출되지 않도록 한다  -->
				<c:if test="${memberInfo.member_type != '시설'}">
				<c:if test="${likedState == 0}">
					<img alt="pre_heart.png" src="${contextPath}/resources/image/pre_heart.png" onclick="updateLiked(${gymVO.gym_id}, 'N')">
				</c:if>
				<c:if test="${likedState == 1}">
					<img alt="pre_heart.png" src="${contextPath}/resources/image/next_heart.png" onclick="updateLiked(${gymVO.gym_id}, 'Y')">
				</c:if>
				</c:if>
			</div>
			<div class="gym_stars_box">
				⭐⭐⭐⭐⭐ 5.0
			</div>
			<div class="gym_location_box">
				<span>${gymVO.firstAddress} ${gymVO.extraAddress}</span>
				<span><img src="${contextPath}/resources/image/telephone.png" alt="telephone.png">${gymVO.hp}</span>
			</div>
			<div class="gym_option_box">
				<span>옵션 선택</span>
				<select>
					<option>${gymVO.first_option}</option>
				</select>
				<select name="option_select" id="option_select" onChange="selectBoxChange_option(this.value);">
					<option value="none">개월수</option>
					<fmt:formatNumber value="${gymVO.price_info1}" type="number" var="price1" />
					<fmt:formatNumber value="${gymVO.price_info2}" type="number" var="price2" />
					<fmt:formatNumber value="${gymVO.price_info3}" type="number" var="price3" />
					<fmt:formatNumber value="${gymVO.price_info4}" type="number" var="price4" />
					<fmt:formatNumber value="${gymVO.price_info5}" type="number" var="price5" />
					<option value="1day">1일권 ${price1}원</option>					
					<option value="1">1개월 ${price2}원</option>
					<option value="3">3개월 ${price3}원</option>
					<option value="6">6개월 ${price4}원</option>
					<option value="12">12개월 ${price5}원</option>
				</select>
				<form action="${contextPath}/membership/membershipForm.do" method="post" onsubmit="return membership_check();">
					<input type="hidden" name="gym_id" value="${gymVO.gym_id}" />
					<input type="hidden" name="gym_name" value="${gymVO.gym_name}" />
					<input type="hidden" name="gym_fileName" value="${gymVO.gym_fileName}" />
					<input type="hidden" name="first_option" value="${gymVO.first_option}" />
					<input type="hidden" name="option" id="option" />
					<input type="hidden" name="total_price" id="total_price" />
					<c:if test="${memberInfo.member_type != '시설'}">
						<input type="submit" class="option_submit_btn" value="회원권 담기">
					</c:if>
					<c:if test="${not empty memberInfo and memberInfo.member_type eq '시설'}">
						<input type="submit" style="background:#c4c4c4;" class="option_submit_btn" value="일반회원만 이용할 수 있습니다" disabled>
					</c:if>
				</form>
			</div>
		</div>
	</div>
	
	 <div class="myPage03_box tab_menu">
     	<div class="first_content">
          <div class="tab_btn">
               <ul>
                    <li class="active"><a href="#">시설정보</a></li>
                    <li><a href="#">사진</a></li>
                    <li><a href="#">이용후기(${reviewCount})</a></li>
               </ul>               
          </div>
          <div class="tab_cont">
               <div class="active gymsInfo_first_tab_box">
					<div class="info_content gymsInfo_first_text_box">
						<p>
						${gymVO.gym_intro}
						</p>
					</div>
					<div class="info_content gymsInfo_priceInfo_box">
						<h4>가격정보</h4>
						<div class="price_info_box">
							<div class="price_info_option">
								<span>1일권</span>
								<span>1개월</span>
								<span>3개월</span>
								<span>6개월</span>
								<span>12개월</span>
							</div>
							<div class="price_info_num">
								<span>월 ${price1}원</span>
								<span>월 ${price2}원</span>
								<span>월 ${price3}원</span>
								<span>월 ${price4}원</span>
								<span>월 ${price5}원</span>
							</div>
						</div>
					</div>
					<div class="info_content gymsInfo_timeInfo_box">
						<h4>운영시간</h4>
						<p>${gymVO.time_info}</p>
					</div>
					<div class="info_content gymsInfo_programInfo_box">
						<h4>운영 프로그램</h4>
						<p>${gymVO.program_list}</p>
					</div>
					<div class="info_content gymsInfo_Info_box">
						<h4>편의시설</h4>
						<div class="gymInfo_service_box">
						<c:set var="service" value="${fn:split(gymVO.service,',')}" />
							<c:forEach var="item" items="${service}">
     							<c:if test="${item == 1}">
     								<div class="service_box">
     									<img width="60" src="${contextPath}/resources/image/gym-service1.png" id="" alt="gym-service1.png">주차장
     								</div>
     							</c:if>
     							<c:if test="${item == 2}">
     								<div class="service_box">
     									<img width="60" src="${contextPath}/resources/image/gym-service2.png" id="" alt="gym-service2.png">운동복
     								</div>
     							</c:if>
     							<c:if test="${item == 3}">
     								<div class="service_box">
     									<img width="60" src="${contextPath}/resources/image/gym-service3.png" id="" alt="gym-service3.png">수건
     								</div>
     							</c:if>
     							<c:if test="${item == 4}">
     								<div class="service_box">
     									<img width="60" src="${contextPath}/resources/image/gym-service4.png" id="" alt="gym-service4.png">탈의실
     								</div>
     							</c:if>
     							<c:if test="${item == 5}">
     								<div class="service_box">
     									<img width="60" src="${contextPath}/resources/image/gym-service5.png" id="" alt="gym-service5.png">샤워실
     								</div>
     							</c:if>
     							<c:if test="${item == 6}">
     								<div class="service_box">
     									<img width="60" src="${contextPath}/resources/image/gym-service6.png" id="" alt="gym-service6.png">Wi-fi
     								</div>
     							</c:if>
     							<c:if test="${item == 6}">
     								<div class="service_box">
     									<img width="60" src="${contextPath}/resources/image/gym-service7.png" id="" alt="gym-service7.png">체성분 검사
     								</div>
     							</c:if>
							</c:forEach>
						</div> 
					</div>
					<div class="info_content gymsInfo_url_box">
						<h4>바로가기</h4>
						<c:if test="${not empty gymVO.kakao_addr}">
							<a href="${gymVO.kakao_addr}" class="gym_url_atag"><img width="80" src="${contextPath}/resources/image/kakao.png" id="kakao" alt="카카오톡"></a>
						</c:if>
						<c:if test="${not empty gymVO.insta_addr}">
					  		<a href="${gymVO.insta_addr}" class="gym_url_atag"><img width="80" src="${contextPath}/resources/image/instagram.png" id="instagram" alt="인스타그램"></a>
					  	</c:if>
					  	<c:if test="${not empty gymVO.nblog_addr}">
					  		<a href="${gymVO.nblog_addr}" class="gym_url_atag"><img width="80" src="${contextPath}/resources/image/blog.png" id="naverblog" alt="네이버 블로그"></a>
					  	</c:if>
					  	<c:if test="${not empty gymVO.fbook_addr}">
					  		<a href="${gymVO.fbook_addr}" class="gym_url_atag"><img width="80" src="${contextPath}/resources/image/facebook.png" id="facebook" alt="페이스북"></a>
					  	</c:if>
					  	<c:if test="${not empty gymVO.home_addr}">
					 		<a href="${gymVO.home_addr}" class="gym_url_atag"><img width="80" src="${contextPath}/resources/image/home.png" id="home" alt="홈페이지"></a>
						</c:if>
					</div>
               </div>
               <div class="gymsInfo_div">
					<div class="gymsInfo_img_box">
					  	<c:forEach var="item" items="${imageList}">
					  		<img class="gym_detail_img" src="${contextPath}/downloadGym.do?gym_id=${gymVO.gym_id}&fileName=${item.fileName}">
					  	</c:forEach>
					</div>
               </div>
                <div class="gymsInfo_div">
					<div class="gymsInfo_review_box">
						<div class="gym_review_box">							
							<div class="gym_review_box_title">
								<span>이용 후기</span>
							</div>						
							<c:if test="${viewAll != null}">
							<div class="gym_review_star_box">
								<div class="star_sum_box">
									<p>⭐ ${avg_result}</p>
								</div>
								<div class="star_info_box">
									<div><p>시설 ${score_gym}</p></div>
									<div><p>강사 ${score_instructor}</p></div>
									<div><p>접근성 ${score_access}</p></div>
								</div>
							</div>
							
							<c:if test="${memberInfo != null && reviewState == 'N' }">
							<form action="${contextPath}/gym/addNewReview.do" method="post" id="" onsubmit="return review_check();">
							<div class="gym_score">
							<fieldset>	
								<div id="score_gym">
								<p>시설</p>
									<input type="radio" name="score_gym" value="5" id="rate1"><label for="rate1">★</label>
									<input type="radio" name="score_gym" value="4" id="rate2"><label for="rate2">★</label>
									<input type="radio" name="score_gym" value="3" id="rate3"><label for="rate3">★</label>
									<input type="radio" name="score_gym" value="2" id="rate4"><label for="rate4">★</label>
									<input type="radio" name="score_gym" value="1" id="rate5"><label for="rate5">★</label>
								</div>		
							</fieldset>
							
							<fieldset>
								<div id="score_instructor">
								<p>강사</p>
									<input type="radio" name="score_instructor" value="5" id="rate6"><label for="rate6">★</label>
									<input type="radio" name="score_instructor" value="4" id="rate7"><label for="rate7">★</label>
									<input type="radio" name="score_instructor" value="3" id="rate8"><label for="rate8">★</label>
									<input type="radio" name="score_instructor" value="2" id="rate9"><label for="rate9">★</label>
									<input type="radio" name="score_instructor" value="1" id="rate10"><label for="rate10">★</label>
								</div>
							</fieldset>
							
							<fieldset>
								<div id="score_access">
								<p>접근성</p>
									<input type="radio" name="score_access" value="5" id="rate11"><label for="rate11">★</label>
									<input type="radio" name="score_access" value="4" id="rate12"><label for="rate12">★</label>
									<input type="radio" name="score_access" value="3" id="rate13"><label for="rate13">★</label>
									<input type="radio" name="score_access" value="2" id="rate14"><label for="rate14">★</label>
									<input type="radio" name="score_access" value="1" id="rate15"><label for="rate15">★</label>
								</div>
							</fieldset>
							
							
							<div id="review_submit">
							<input type="hidden" name="gym_id" value="${gym_id}">
							<input type="hidden" name="uid" value="${gymReviewVO.uid}">								
							 <a><button type="submit" id="review_submit">이용후기 등록</button></a>
							</div>
							<div class="review_write">
								<div class="review_length">
									<span class="text_count">0</span> 
									<span>/ 200자</span>
								</div>
								<textarea name="content" id="gym_review_input" placeholder="이용 후기를 입력하세요."></textarea>
							</div>
							</div>
							</form>
							</c:if>
					
							<c:forEach var="gymReview" items="${viewAll}">
							<div class="user_review_list_box">
								<div class="user_info_box">
									<div class="user_level">
									<c:choose>
										<c:when test="${gymReview.member_level == 1}">
											<span id="user_level_welcome">welcome</span>
										</c:when>
										<c:when test="${gymReview.member_level == 2}">
											<span id="user_level_silver">Silver</span>
										</c:when>
										<c:when test="${gymReview.member_level == 3}">
											<span id="user_level_gold">Gold</span>
										</c:when>
										<c:otherwise>
											<span id="user_level_admin">관리자</span>
										</c:otherwise>
									</c:choose> 
									</div>
									<div class="user_info">
										 <p>${personal_avg_result}</p>
										 <div>
										 	<span class="review_user_name">${gymReview.review_writer}</span>
										 	<span class="review_write_date"><fmt:formatDate value="${gymReview.regDate}" pattern="YYYY-MM-dd"></fmt:formatDate></span> 
										 </div>
									</div>
								</div>
								<div class="user_review_content">
									<span>${gymReview.content}</span>
								</div>
							</div>
							</c:forEach> 
							</c:if>	
							<c:if test="${viewAll == null}">
								<p id="no_review_message"> 등록된 리뷰가 없습니다. </p>
							</c:if>				
						</div>
					</div>
               </div>
          </div>
          </div>
     </div>	
</div>
</body>
</html>