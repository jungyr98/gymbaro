<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="gymVO" value="${gymMap.gymVO}" />
<c:set var="imageList" value="${gymMap.imageList}" />
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
</script>
</head>
<body>
<div class="main_container">
	<div class="gym_info_header_box">
		<div class="gym_info_header_img">
			<img alt="HTML5 &amp; CSS3" src="${contextPath}/thumbnailsGym.do?gym_id=${gymVO.gym_id}&fileName=${gymVO.gym_fileName}">
		</div>
		<div class="gym_info_header_text">
			<span class="gym_info_header_title">${gymVO.gym_name}</span>
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
				<select>
					<option>개월수</option>
					<fmt:formatNumber value="${gymVO.price_info1}" type="number" var="price1" />
					<fmt:formatNumber value="${gymVO.price_info2}" type="number" var="price2" />
					<fmt:formatNumber value="${gymVO.price_info3}" type="number" var="price3" />
					<fmt:formatNumber value="${gymVO.price_info4}" type="number" var="price4" />
					<fmt:formatNumber value="${gymVO.price_info5}" type="number" var="price5" />
					<option>1일권 ${price1}원</option>					
					<option>1개월 ${price2}원</option>
					<option>3개월 ${price3}원</option>
					<option>6개월 ${price4}원</option>
					<option>12개월 ${price5}원</option>
				</select>
				<input type="button" class="option_submit_btn" value="회원권 담기">
			</div>
		</div>
	</div>
	
	 <div class="myPage03_box tab_menu">
     	<div class="first_content">
          <div class="tab_btn">
               <ul>
                    <li class="active"><a href="#">시설정보</a></li>
                    <li><a href="#">사진</a></li>
                    <li><a href="#">이용후기(11)</a></li>
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
						<p>테스트 가격정보</p>
					</div>
					<div class="info_content gymsInfo_timeInfo_box">
						<p>운영시간</p>
					</div>
					<div class="info_content gymsInfo_programInfo_box">
						<p>${gymVO.program_list}</p>
					</div>
					<div class="info_content gymsInfo_Info_box">
						<p>편의시설</p>
					</div>
					<div class="info_content gymsInfo_url_box">
						<p>바로가기</p>
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
							<div class="gym_review_star_box">
								<div class="star_sum_box">
									⭐ 5.0
								</div>
								<div class="star_info_box">
									<div>시설 ⭐⭐⭐⭐⭐</div>
									<div>강사 ⭐⭐⭐⭐⭐</div>
									<div>친절함 ⭐⭐⭐⭐⭐</div>
									<div>청결함 ⭐⭐⭐⭐⭐</div>
								</div>
							</div>
							<div class="user_review_list_box">
								<div class="user_info_box">
									<div class="user_level">
										<span>Gold</span>
									</div>
									<div class="user_info">
										 ⭐⭐⭐⭐⭐
										 <div>
										 	<span class="review_user_name">허용준</span>
										 	<span class="review_write_date">2022.04.04</span>
										 </div>
									</div>
								</div>
								<div class="user_review_content">
									<span>쾌적하고 운동기구가 많아 좋네요. 운동마치고 사우나하고 나오면 하루가 행복합니다. 최고!</span>
								</div>
							</div>
														<div class="user_review_list_box">
								<div class="user_info_box">
									<div class="user_level">
										<span>Gold</span>
									</div>
									<div class="user_info">
										 ⭐⭐⭐⭐⭐
										 <div>
										 	<span class="review_user_name">한다슬</span>
										 	<span class="review_write_date">2022.03.08</span>
										 </div>
									</div>
								</div>
								<div class="user_review_content">
									<span>시설이 참 좋고 카운터 직원분들이 친절하세요</span>
								</div>
							</div>
						</div>
					</div>
               </div>
          </div>
          </div>
     </div>	
</div>
</body>
</html>