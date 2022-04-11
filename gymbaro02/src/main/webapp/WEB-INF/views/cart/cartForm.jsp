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
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/cartform.css">
    <style>
       table, tr, td {
   border-collapse : collapse;
    }
    .cart_form {
        margin: 0px;
    }
    </style>
<script>
    $(".cart_plus").click(function(){
     var num = $(".cart_numBox").val();
     var plusNum = Number(num) + 1;
     
     if(plusNum >= $){
      $(".cart_numBox").val(num);
     } else {
      $(".cart_numBox").val(plusNum);          
     }
    });
    
    $(".cart_minus").click(function(){
     var num = $(".cart_numBox").val();
     var minusNum = Number(num) - 1;
     
     if(minusNum <= 0) {
      $(".cart_numBox").val(num);
     } else {
      $(".cart_numBox").val(minusNum);          
     }
    });
   </script>
</head>
<body>
    <div class="cart_main_container">
    <div class="cart_first_content">
    <div class="cart_first_text">
       <span><b>운동용품</b></span>
    </div>
    <div class="cart_form_box" style="width: 80%; float: left; width: 500px;" >
    <form action="${contextPath}/cs/cs.do" method="post" >   
       <table border-top ="1"  style="margin: 0 auto;">
          <thead>
             <tr>
                <td class="cart_fixed_cart" >
                    <input type="checkbox" name="cart_checkbox" >
                </td>
                <td class="cart_fixed_cart" colspan="1">상품정보</td>
                <td class="cart_fixed_cart"></td>
                <td class="cart_fixed_cart">수량</td>
                <td class="cart_fixed_cart">가격</td>
             </tr>
          </thead>

          <thead>
            <tr>
               <td class="cart_fixed_cart2" >
                   <input type="checkbox" name="cart_checkbox" >
               </td>
               <td class="cart_fixed_cart2">
                   <img src="${contextPath}/resources/image/boxing.jpg" class="cart_img_boxing">
                   <td><span>상품명</span><br><span>옵션명</span>
               </td>
               <td class="cart_fixed_cart2">
                <p class="cart_cartStock">
                    <button type="button" class="cart_plus">+</button>
                    <input type="number" class="cart_numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
                    <button type="button" class="cart_minus">-</button>
                    </p>
               </td>
               <td class="cart_fixed_cart2">가격</td>
            </tr>
         </thead>

         <thead>
            <tr>
               <td class="cart_fixed_cart3" colspan="5">
                <div class="cart_del_button_box">
                    <a><button id="cart_delbtn1"><span>선택삭제</span></button></a>
                    <a href="#"><button id="cart_delbtn2"><span>전체 삭제</span></button></a>
                    </div>
               </td>
            </tr>
        </thead>
       </table>
       <br>
       <div class="cart_button_box">
          <a><button id="cart_button_01"><span>쇼핑계속하기</span></button></a>
          <a><button id="cart_button_03"><span style="color: #424040;">선택 상품 주문</span></button></a>
          <a href="#"><button id="cart_button_02"><span>전체 상품 주문</span></button></a>
          </div>
    </form>
    <div class="cart_second_content">
    <div class="cart_second_text">
        <span><b>회원권</b></span>
     </div>
     </div>

      </div>
      <div class="cart_form_box2" style="width: 17%; float: right; width: 200px;">
        <form action="${contextPath}/cs/cs.do" method="post">   
           <table border-top ="1"  style="margin: 0 auto;">
              <thead>
                 <tr>
                    <td class="cart_fixed_cart5">총 상품금액</td>
                    <td class="cart_fixed_cart5">총 상품금액</td>
                 </tr>
              </thead>

              <thead>
                <tr style="text-align:start;">
                   <td class="cart_fixed_cart5" style="height: 84px;">배송비</td>
                   <td class="cart_fixed_cart5">배송비
                   </td>
                </tr>
                </thead>
                <thead>
                    <tr>
                       <td class="cart_fixed_cart5" colspan="2" style="text-align: right;">결제금액</td>
                    </tr>
                    </thead>
            </table>
            </form>
   </div>
    </div>

<!-- 회원권 예약-->

<div class="cart_form_box" style="width: 80%; float: left; width: 500px;" >
        <form action="${contextPath}/cs/cs.do" method="post">   
           <table border-top ="1"  style="margin: 0 auto;">
              <thead>
                 <tr>
                    <td class="cart_fixed_cart" >
                        <input type="checkbox" name="cart_checkbox" >
                    </td>
                    <td class="cart_fixed_cart" colspan="1">시설정보</td>
                    <td class="cart_fixed_cart"></td>
                    <td class="cart_fixed_cart">예약일</td>
                    <td class="cart_fixed_cart">가격</td>
                 </tr>
              </thead>
    
              <thead>
                <tr>
                   <td class="cart_fixed_cart2" >
                       <input type="checkbox" name="cart_checkbox" >
                   </td>
                   <td class="cart_fixed_cart2">
                       <img src="${contextPath}/resources/image/boxing.jpg" class="cart_img_boxing">
                       <td><span>시설명</span><br><span>옵션명</span>
                   </td>
                   <td class="cart_fixed_cart2">
                    <select name="question" class="cart_cartque" onChange="" title="문의 항목" style=" height:27px; border:0; outline: none;">
                        <option value="none">날짜 선택</option>
                        <option value="q1">1개월</option>
                        <option value="q2">3개월</option>
                        <option value="q3">6개월</option>
                        <option value="q4">12개월</option>
                     </select>
                   </td>
                   <td class="cart_fixed_cart2">가격</td>
                </tr>
             </thead>
    
             <thead>
                <tr>
                   <td class="cart_fixed_cart3" colspan="5">
                    <div class="cart_del_button_box">
                        <a><button id="cart_delbtn1"><span>선택삭제</span></button></a>
                        <a href="#"><button id="cart_delbtn2"><span>전체 삭제</span></button></a>
                        </div>
                   </td>
                </tr>
            </thead>
           </table>
           <br>
           <div class="cart_button_box">
              <a><button id="cart_button_01"><span>쇼핑계속하기</span></button></a>
              <a><button id="cart_button_03"><span style="color: #424040;">선택한 회원권 예약</span></button></a>
              <a href="#"><button id="cart_button_02"><span>전체 회원권 예약</span></button></a>
              </div>
        </form>
          </div>
          <div class="cart_form_box2" style="width: 17%; float: right; width: 200px;">
            <form action="${contextPath}/cs/cs.do" method="post">   
               <table border-top="1"  style="margin: 0 auto;">
                  <thead>
                     <tr>
                        <td class="cart_fixed_cart5">총 회원권금액</td>
                        <td class="cart_fixed_cart5">총 회원권금액</td>
                     </tr>
                  </thead>
    
                  <thead>
                    <tr>
                       <td class="cart_fixed_cart5" style="height: 84px;" colspan="2"></td>
                    </tr>
                    </thead>
                    <thead>
                        <tr>
                           <td class="cart_fixed_cart5" colspan="2" rowspan="2" style="text-align: right;">결제금액</td>
                        </tr>
                        </thead>
                </table>
                </form>
       </div>
        </div>
 </body>
</html> 