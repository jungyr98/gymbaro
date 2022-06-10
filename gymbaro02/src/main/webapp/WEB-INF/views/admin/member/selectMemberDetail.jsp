<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
// 관리자쪽에서 포인트 추가 적립하기
function updatePoint(uid) {
	var add_point = document.getElementById("add_point").value;
	if(add_point == 0){
		alert("추가할 금액을 입력해주세요!");
		return;
	}
	var check = confirm("추가로 적립하시겠습니까?");
	if(check){
		$.ajax({
			type : "POST",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/member/updateMemberPoint.do",
			data : {
				uid:uid,
				add_point:add_point
			},
			success : function(data, textStatus) {
				if(data.trim()=='updateSuccess'){
					alert("추가 적립되었습니다!");
					location.reload();
				}
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			}
		}); //end ajax
	}else {
		alert("취소하셨습니다");
		return;
	}
}
</script>
<style type="text/css">
.member_detail_box {
   width: 1200px;
   /* border: 1px solid #c4c4c4; */
   border-radius: 5px;
   padding: 10px;
}

.member_detail_box table {
	width: 1185px;
	border-top: 2px solid;
}

.member_detail_box table tr{
	height: 50px;
	border-bottom: 1px solid #f1f1f1;
}

.member_detail_box table tr .fixed_td {
	font-weight:bold;
}

.member_detail_box #location_box {
    display: flex;
    align-items: center;
    font-size:26px;
    margin-bottom:15px;
}

.member_detail_box #location_box #back_button {
    font-size: 16px;
    margin-left: 20px;
    background: #0D6EFD;
    color: white;
    border: 1px solid #c4c4c4;
    width: 100px;
    height: 30px;
    border-radius: 3px;
}

.member_detail_box table #pointBtn {
    font-size: 14px;
    margin-left: 20px;
    background: white;
    color: black;
    border: 1px solid #c4c4c4;
    width: 100px;
    height: 30px;
    border-radius: 3px;
}

input[name="add_point"] {
    height: 30px;
    border: 1px solid #c4c4c4;
    border-radius: 3px;
    padding-left: 5px;
}

</style>
</head>
<body>
<div class="member_detail_box main_container">
	<div id="location_box">
		회원 정보
		<button type="button" id="back_button" onclick="history.back()">목록으로</button>
	</div>
	<table>
		<tr>
			<td class="fixed_td">번호</td>
			<td>${memberVO.uid}</td>
		</tr>
		<tr>
			<td class="fixed_td">아이디</td>
			<td>${memberVO.member_id}</td>
		</tr>
		<tr>
			<td class="fixed_td">이름</td>
			<td>${memberVO.member_name}</td>
		</tr>
		<tr>
			<td class="fixed_td">성별</td>
			<td>${memberVO.member_gender}</td>
		</tr>
		<tr>
			<td class="fixed_td">회원 종류</td>
			<td>${memberVO.member_type}</td>
		</tr>
		<tr>
			<td class="fixed_td">회원 등급</td>
			<td>
				<c:if test="${memberVO.member_level eq '1'}">
					웰컴
				</c:if>
				<c:if test="${memberVO.member_level eq '2'}">
					실버
				</c:if>
				<c:if test="${memberVO.member_level eq '3'}">
					골드
				</c:if>
				<c:if test="${memberVO.member_level eq '4'}">
					관리자
				</c:if>
			</td>
		</tr>
		<tr>
			<td class="fixed_td">포인트</td>
			<td>
				<input type="hidden" name="member_point" value="${memberVO.member_point}" />
				<fmt:formatNumber  value="${memberVO.member_point}" type="number" var="member_point" />
				${member_point}원
				+ <input type="text" name="add_point" id="add_point" placeholder="추가 포인트 입력하기.." value="0"/> 원 
				<button type="button" id="pointBtn" onclick="updatePoint('${memberVO.uid}');">추가 적립하기</button>
			</td>
		</tr>
		<tr>
			<td class="fixed_td">휴대폰</td>
			<td>${memberVO.phone_number}</td>
		</tr>
		<tr>
			<td class="fixed_td">이메일</td>
			<td>${memberVO.email}</td>
		</tr>
		<tr>
			<td class="fixed_td">주소</td>
			<td>${memberVO.zipcode} ${memberVO.roadAddress}</td>
		</tr>
	</table>
</div>
</body>
</html>