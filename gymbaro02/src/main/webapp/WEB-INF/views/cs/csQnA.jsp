<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="result" value="${param.result }" />
<%
   request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 목록</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="${contextPath}/resources/css/csQnA.css">
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<style>
	a{
		text-decoration-line: none;
		color:#424040;
	}
	a:hover{
		color:#184798;
		text-decoration-line: none;
	}
	.cs_status{
	width: 112px;
    height: 28px;
    color: #fff;
    line-height: 26px;
    text-align: center;
    background: #184798;
    border-radius: 20px;
     margin:9px;
	}
	.cs_comment_status{
	width: 112px;
    height: 28px;
    color: #555;
    line-height: 26px;
    text-align: center;
    background: #f0f0f0;
    border-radius: 20px;
     margin:9px;
	}
	.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #184798;
    border-color: #184798;
}
.pagination>li>a, .pagination>li>span {
    position: relative;
    float: left;
    padding: 6px 12px;
    margin-left: -1px;
    line-height: 1.42857143;
    color: #184798;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #ddd;
}
</style>
<script type="text/javascript">

$(document).ready(function () {
	const tabList = document.querySelectorAll('.tab_btn ul li');
const contents = document.querySelectorAll('.tab_each ul')
let activeCont = '';// 현재 활성화 된 컨텐츠

for(var i = 0; i < tabList.length; i++){
    tabList[i].querySelector('.tab_btn ul li a').addEventListener('click', function(e){
      e.preventDefault();
      for(var j = 0; j < tabList.length; j++){
        // 나머지 버튼 클래스 제거
        tabList[j].classList.remove('active');

        // 나머지 컨텐츠 display:none 처리
        contents[j].style.display = 'none';
      }

      // 버튼 관련 이벤트
      this.parentNode.classList.add('active');

      // 버튼 클릭시 컨텐츠 전환
      activeCont = this.getAttribute('href');
      document.querySelector(activeCont).style.display = 'block';
    })
  }
});

//문의하기 버튼을 눌렀을때, 로그인 여부 체크 
function login_yn(isLogOn, personalQ, loginForm){
	if(isLogOn != '' && isLogOn != 'false'){
		location.href = '${contextPath}/cs/personalQ.do';
	}else{
		var notlogin = confirm("로그인 후 문의 글 작성이 가능합니다.");
		if(notlogin == true){
			location.href = '${contextPath}/member/loginForm.do';
		}else{
			return false;
		}
		
	}
}

//테이블내 페이징
function pagination() {
	  var req_num_row = 10;
	  var $tr = jQuery("tbody tr");
	  var total_num_row = $tr.length;
	  var num_pages = 0;
	  if (total_num_row % req_num_row == 0) {
	    num_pages = total_num_row / req_num_row;
	  }
	  if (total_num_row % req_num_row >= 1) {
	    num_pages = total_num_row / req_num_row;
	    num_pages++;
	    num_pages = Math.floor(num_pages++);
	  }

	  jQuery(".pagination").append('<li><a class="prev"><</a></li>');

	  for (var i = 1; i <= num_pages; i++) {
	    jQuery(".pagination").append("<li><a>" + i + "</a></li>");
	    jQuery(".pagination li:nth-child(2)").addClass("active");
	    jQuery(".pagination a").addClass("pagination-link");
	  }

	  jQuery(".pagination").append('<li><a class="next">></a></li>');

	  $tr.each(function (i) {
	    jQuery(this).hide();
	    if (i + 1 <= req_num_row) {
	      $tr.eq(i).show();
	    }
	  });

	  jQuery(".pagination a").click(".pagination-link", function (e) {
	    e.preventDefault();
	    $tr.hide();
	    var page = jQuery(this).text();
	    var temp = page - 1;
	    var start = temp * req_num_row;
	    var current_link = temp;

	    jQuery(".pagination li").removeClass("active");
	    jQuery(this).parent().addClass("active");

	    for (var i = 0; i < req_num_row; i++) {
	      $tr.eq(start + i).show();
	    }

	    if (temp >= 1) {
	      jQuery(".pagination li:first-child").removeClass("disabled");
	    } else {
	      jQuery(".pagination li:first-child").addClass("disabled");
	    }
	  });

	  jQuery(".prev").click(function (e) {
	    e.preventDefault();
	    jQuery(".pagination li:first-child").removeClass("active");
	  });

	  jQuery(".next").click(function (e) {
	    e.preventDefault();
	    jQuery(".pagination li:last-child").removeClass("active");
	  });
	}

	jQuery("document").ready(function () {
	  pagination();

	  jQuery(".pagination li:first-child").addClass("disabled");
	});
</script>

</head>
<body>
    <div class="csQnA_box">
        <div class="first_content">
           <div class="first_text"><!--상단 제목-->
              <span><b>고객센터</b></span>
              
           </div>
           <!--카테고리-->
            <div class="wrap show">
                <div class="sub_wrap">
                    <!-- Tab -->
                    <div class="tab">
                        <div class="tab_btn">
                            <div class="form-inline">
                                <ul>
                                    <li class="active"><a href="#tab1"><input type="button" id="categorybtn" name="ctbtn" value="배송문의" class="btn" checked/></a></li>
                                    <li><a href="#tab2"><input type="button" id="categorybtn" name="ctbtn" value="교환/환불" class="btn"/></a></li>
                                    <li><a href="#tab3"><input type="button" id="categorybtn" name="ctbtn" value="주문/결제" class="btn"/></a></li>
                                    <li><a href="#tab4"><input type="button" id="categorybtn" name="ctbtn" value="회원문의" class="btn"/></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- 공지사항  -->
                    <div class="tab_each">
                        <ul id="tab1" class="active">
                            <li>
                                <input type="checkbox" class="question" id="que-1">
                                <label for="que-1">자주묻는질문 배송문의1</label>
                                <div class="answer" id="ans-1">자주묻는질문 배송문의1 테스트</div>
                            </li>
                            <li>
                                <input type="checkbox" class="question" id="que-2">
                                <label for="que-2">자주묻는질문 배송문의2</label>
                                <div class="answer" id="ans-1">자주묻는질문 배송문의2 테스트</div>
                            </li>
                        </ul>
                        <ul id="tab2">
                            <li>
                                <input type="checkbox" class="question" id="que-3">
                                <label for="que-3">자주묻는질문 반품교환1</label>
                                <div class="answer" id="ans-3">자주묻는질문 반품교환1 테스트</div>
                            </li>
                            <li>
                                <input type="checkbox" class="question" id="que-4">
                                <label for="que-4">자주묻는질문 반품교환2</label>
                                <div class="answer" id="ans-4">자주묻는질문 반품교환2 테스트</div>
                            </li>
                        </ul>
                        <ul id="tab3">
                            <li>
                                <input type="checkbox" class="question" id="que-5">
                                <label for="que-5">자주묻는질문 주문문의1</label>
                                <div class="answer" id="ans-5">자주묻는질문 주문문의1 테스트</div>
                            </li>
                            <li>
                                <input type="checkbox" class="question" id="que-6">
                                <label for="que-6">자주묻는질문 결제문의2</label>
                                <div class="answer" id="ans-6">자주묻는질문 결제문의2 테스트</div>
                            </li>
                        </ul>
                        <ul id="tab4">
                            <li>
                                <input type="checkbox" class="question" id="que-7">
                                <label for="que-7">자주묻는질문 회원서비스1</label>
                                <div class="answer" id="ans-7">자주묻는질문 회원서비스1 테스트</div>
                            </li>
                            <li>
                                <input type="checkbox" class="question" id="que-8">
                                <label for="que-8">자주묻는질문 회원서비스2</label>
                                <div class="answer" id="ans-8">자주묻는질문 회원서비스2 테스트</div>
                            </li>
                        </ul>
                    </div>
          </div>
                </div>
            </div>
            <!-- 고객센터 1:1 문의목록 start -->
            <div class="second_content">
             <div class="second_text"><!--상단 제목-->
              <span><b>새로운 문의</b></span>
           </div>
          <!-- 문의 리스트 -->
           <table id="contents" style="width:900px;">
           		<thead>
                    <tr class="notice_board_first_tr">
                    	<td width=15%>답변 상태</td><!-- 답변대기(default) / 답변 완료 -->
                    	<td width=50%>제목</td>
                    	<td width=15%>작성자</td>
                    	<td width=20%>작성일</td>
                    </tr>
                </thead>
                <tbody>
                    	<c:forEach var="csVO" items="${csList}">
                    	<tr style="padding:20px; height:50px; border-bottom: 1px solid #ddd;">
	                    	<td>
		                    	<c:choose>
		                    	<c:when test="${csVO.processing_status == '답변완료'}">
		                    	<div class="cs_status">${csVO.processing_status}</div>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<div class="cs_comment_status">${csVO.processing_status}</div>
		                    	</c:otherwise>
		                    	</c:choose>
	                    	</td>
	                    	<!-- 비밀글 여부 설정 -->
	                    	<td style="text-align:left;">
		                    	<c:if test="${csVO.secret eq 'Y'}">
		                    	<c:choose>
		                    		<c:when test="${csVO.writer eq memberInfo.member_name || memberInfo.member_level eq '4'}">
		                    			<a href="${contextPath}/cs/csDetail.do?csNO=${csVO.csNO}">${csVO.title}</a>
		                    		</c:when>
		                    		<c:otherwise>
		                    				<img src="${contextPath}/resources/image/key.png" style="width: 18px;">
		                    				비밀글은 작성자와 관리자만 열람 가능합니다.
		                    		</c:otherwise>
		                    	</c:choose>
		 						</c:if>
		 						<c:if test="${csVO.secret eq 'N'}">
		 							<a href="${contextPath}/cs/csDetail.do?csNO=${csVO.csNO}">${csVO.title}</a>
		 						</c:if>
	                    	</td>
	                    	<td>${csVO.writer}</td>
	                    	<td><fmt:formatDate value="${csVO.writeDate}" pattern="YYYY-MM-dd"></fmt:formatDate></td>
                    	</tr> 
                  </c:forEach>
                  </tbody>
               </table>
              <ul class="pagination"></ul>
           </div>
           <!-- cs고객센터 문의 목록 end -->
          	
          	<!--문의하기 버튼 start-->
          	<c:if test="${memberInfo.member_level != '4'}">
            <div class="button_box">
              <a href="javascript:login_yn('${isLogOn}','${contextPath}/cs/personalQ.do', '${contextPath}/member/loginForm.do')">
              <button type="button" id="button_01"><span>1:1 문의 하기</span></button>
              </a>
            </div>
            </c:if>
         </div>
<!--문의하기 버튼 end-->
</body>
</html>