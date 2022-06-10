<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/myPage03.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
#goodsInfo_table {
	border: 1px;
    width: 850px;
    /*height: 250px;*/
    margin-top:30px;
}

#goodsInfo_table #goodsInfo_div {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    height: 94px;
    margin-left:10px;
}

#goodsInfo_table #goodsInfo_div div {
	display: flex;
    width: 700px;
    background: #EDEFF2;
    padding: 10px;
    border: 1px solid #c4c4c4;
    border-radius: 2px;
}

#non-border-1 {
	border-bottom:none;
}

#non-border-2 {
	height: 120px;
}

#goodsInfo_table #goodsInfo_div #goods_name {
	width: fit-content;
    font-size: 15px;
    padding-bottom: 5px;
}

#goodsInfo_table #goodsInfo_div .option_span {
	font-size:14px;
}

.membershipDetail_box .title-box {
    font-size: 18px;
    font-family: "Musinsa", sans-serif !important;
    text-align: left;
    margin-bottom: 10px;
}

.membershipDetail_box .title-box .korSub {
    line-height: 15px;
    margin-left: 5px;
}
.membershipDetail_box .title-box .korSub {
    font-weight: bold;
    font-size: 12px;
    color: #b2b2b2;
}

.membershipDetail_box .cell_order_form1 {
    text-align: start;
    margin-bottom: 20px;
}

.title-page, .txt_selected_division, .font-mss {
    font-family: "Musinsa", sans-serif !important;
}

#table_div_box {
	display: flex;
    justify-content: space-between;
    margin: 25px 0;
}

#table_div_box table, #table_div_box tr{
   text-align: left;
   vertical-align: top;
   line-height: 1.8;
}

#table_div_box td {
	padding-left: 10px;
}

#table_div_box .fixed_td {
    height: 43px;
    width: 200px;
    font-weight:bold;
 }
 
#table_div_box .orderer_info {
	width: 335px;
 	background: #EDEFF2;
    padding: 20px;
    border-radius: 5px;
 }

#table_div_box .member_info table {
	width:400px;
} 

#table_div_box .member_info span {
	width: 120px;
    display: block;
    font-size:14px;
}

.membershipDetail_box .sub_wrap .align_rt {
	padding:20px;
}

.membershipDetail_box .order_info_span {
	font-size:14px;
}

.membershipDetail_box #order_detail_title {
	width: 840px;
	text-align: left;
    font-size: 24px;
    color: black;
    padding-bottom: 15px;
    padding-left: 5px;
    border-bottom: 2px solid black;
    border-radius: 0;
}

.membershipDetail_box #order_detail_title button {
    font-size: 14px;
    background: white;
    border: 1px solid #c4c4c4;
    padding: 5px 10px;
    margin-left: 10px;
}

.membershipDetail_box .tab_btn {
    border-bottom: 2px solid black;
    border-radius: 0;
 }
 
.membership_info_span {
	font-size:14px;
}
</style>
</head>
<body>
<div class="myPage_box wrap show membershipDetail_box">
   <div id="content" class="sub_wrap">
  	<div class="align_rt">
      <div class="myPage03_box tab_menu">
     	<div class="first_content">
          <div class="tab_btn">
          	<p id="order_detail_title">예약 상세 <button onclick="javascript:history.back();">뒤로가기</button></p>
          	<table id="goodsInfo_table">
	 		<thead>
	 			<tr id="non-border-1">
	 				<td colspan="2">
	 				<div class="cell_membership_form1">
           				 <h3 class="title-box font-mss">Purchase Info <span class="korSub">구매 정보 확인</span></h3>
       				 </div>
	 				</td>
	 			</tr>
	 		</thead>
			<thead>
				<tr id="non-border-2">
					<td class="info_fixed_join">
						<img width="100" alt="" src="${contextPath}/thumbnailsGym.do?gym_id=${membershipVO.gym_id}&fileName=${membershipVO.fileName}">
					</td>
					<td>
						<div id="goodsInfo_div">
					  		<span id="goods_name">${membershipVO.gym_name}</span>
					  		<div>
					  			<span class="option_span"><b>옵션 : </b></span>&nbsp;
					  			<span class="option_span">${membershipVO.first_option} ${membershipVO.second_option}개월</span>&nbsp;&nbsp;
					  		</div>
					  	</div>
					</td>
				</tr>
			</thead>
			</table>
		  </div>
		  <div id="table_div_box">
		 			 <table id="membership_info">
		  					<thead>
	 						<tr id="non-border-1">
	 							<td colspan="2">
	 							<div class="cell_membership_form1">
           							 <h3 class="title-box font-mss">Order Info <span class="korSub">예약 정보 확인</span></h3>
       							</div>
	 							</td>
	 						</tr>
	 						</thead>
                   			<tr>
                   				<td class="fixed_td">예약한 시설 정보</td>
                   				<td>
                   					<span class="membership_info_span">${membershipVO.gym_name}</span><br>
                   					<span class="membership_info_span">${membershipVO.first_option}</span><br>
                   					<span class="membership_info_span">${membershipVO.second_option}개월</span>
                   					<br><br>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">결제 방법</td>
                   				<td>
                   					<span class="membership_info_span">${membershipVO.payment}</span>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">최종 결제 금액</td>
                   				<td>
                   					<fmt:formatNumber value="${membershipVO.total_price}" type="number" var="price" />
                   					<span class="membership_info_span">${price}원</span>
                   				</td>
                   			</tr>
                   		</table>
                   		<div class="member_info">
                   		<table>
                   			<tr>
                   				<td class="fixed_td">회원권 번호</td>
                   				<td>
                   					<span>${membershipVO.membership_id}</span><br>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">회원명</td>
                   				<td>
                   					<span>${membershipVO.name}</span>
                   				</td>
                   			</tr>
                   			<tr>
                   				<td class="fixed_td">운동 시작일자</td>
                   				<td>
                   					<span>
                   						<fmt:formatDate value="${membershipVO.start_date}" pattern="yyyy-MM-dd"/> ~ 
                    					<fmt:formatDate value="${membershipVO.last_date}" pattern="yyyy-MM-dd"/>
									</span>
                   				</td>
                   			</tr>
                   		</table>
                 </div>
            </div>
		</div>
	 </div>
	</div>
  </div>
</div>
</body>
</html>