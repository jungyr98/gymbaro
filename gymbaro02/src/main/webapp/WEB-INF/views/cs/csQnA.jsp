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
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

<link rel="stylesheet" href="${contextPath}/resources/css/csQnA.css">

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
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

</script>
</head>
<body>
    <div class="csQnA_box">
        <div class="first_content">
           <div class="first_text"><!--상단 제목-->
              <span><b>고객센터</b></span>
           </div>
           <div class="search_link_box"><!--검색바-->
                <form id="searchlink"><!--검색 후 엔터 누르면 이동 할 페이지 넣기-->
                    <div class="search">
                        <input type="text" class="searchword" placeholder="자주 묻는 질문 검색">
                        <button type="submit" id="searchbtn"><img src="${contextPath}/resources/image/search.png" alt=""></button>
                    </div>
                </form>
            </div><!--카테고리-->
            
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

            <div class="button_box"><!--문의하기 버튼-->
              <a href="${contextPath}/cs/personalQ.do"><button type="button" id="button_01"><span>1:1 문의 하기</span></button></a>
            </div>
          </div>
         </div>
</body>
</html>