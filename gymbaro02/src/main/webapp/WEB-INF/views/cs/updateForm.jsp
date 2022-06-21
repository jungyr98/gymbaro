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
    <script type="text/javascript" src="${contextPath}/resources/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <title>1:1문의 글 수정폼</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/personalQ.css">
    <style>
       table, tr, td {
   border-collapse : collapse;
   border: 1px solid #c4c4c4;
}
	.cs_td{
		text-align:left;
		padding-left:10px;
	}
    </style>
 <script type="text/javascript">
 function save(){
	 //문의항목 선택 여부 
	  var cs_category = $('#cs_category').val();
		 if (cs_category == "none") {
		     alert("문의항목을 선택해주세요!");
		     return false;
		 }      
	// 제목 공백 여부 
	    var title = $('#title').val();
		 if (title == "") {
		     alert("제목을 입력해주세요!");
		     return false;
		 }
		 
	   oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
	          //스마트 에디터 값을 텍스트컨텐츠로 전달
	   var content = document.getElementById("smartEditor").value;
	   /* alert(document.getElementById("txtContent").value);  */
	          // 값을 불러올 땐 document.get으로 받아오기
	 //내용 공백 여부 
	   if (txtContent == '<p><br></p>') {
		     alert("내용을 입력해주세요!");
		     return false;
		 }       
	   //제목 45자 체크        
	     var title = $('input[name="title"]').val().length;
   if(title > 45){
	   alert("제목은 45자 이상을 넘길 수 없습니다!");
	   return false;
   }else{
	   //수정완료 버튼 체크 
	   var cs_check = confirm("문의글을 수정하시겠습니까?");
	   if(cs_check) {
	      alert("문의글이 수정되었습니다!");
	      return true;
	   } else if(!cs_check) {
		   alert("수정이 취소었습니다!");
		   return false;
	   }
	}
 }
 </script>
  <script type="text/javascript">
 function secretCheck(){
	var secret = $("#secret"); 
 	if(secret.is(":checked")){
 		$('input[name="secret"]').val('Y');
 		console.log('if Y')
	}else {
 		$('input[name="secret"]').val('N');
 		console.log('if N')
 	}
 };
 </script>
</head>
<body>
    <div class="main_container">
    <div class="first_content">
    <div class="first_text">
       <span><b>1:1 문의 작성</b></span>
    </div>
    <div class="form_box">
    <form action="${contextPath}/cs/updateCS.do?csNO=${csDetail.csNO}" method="post" onsubmit="return save();">   
   
       <table border="1" width="730px;" style="margin: 0 auto;">
        <thead>
            <tr>
               <td class="fixed_cs">문의항목</td>
               <td><select id="cs_category" name="cs_category" onChange="" title="문의 항목" style="width:31%; height:27px; border:0; outline: none; display:block;">
                     <option value="${csDetail.cs_category}">${csDetail.cs_category}</option>
                     <option value="배송문의">배송문의</option>
                     <option value="반품/교환/환불">반품/교환/환불</option>
                     <option value="주문/결제">주문 / 결제</option>
                     <option value="회원서비스">회원 서비스</option>
                  </select>
               </td>
            </tr>
         </thead>
          <thead>
             <tr>
                <td class="fixed_cs">제목</td>
                <td>
                  <input type="text" name="title"  id="title" value="${csDetail.title}" style="width:300px; display:block;" />
                </td>
             </tr>
          </thead>
          
          <thead>
            <tr>
                <td class="csform">내용</td>
                <td>
                 <textarea id="txtContent" name="txtContent" rows="10" cols="100" style="width: 100%; height: 412px;">${csDetail.txtContent}</textarea>
				<!-- textarea 밑에 script 작성하기 -->
				<script id="smartEditor" type="text/javascript"> 
					var oEditors = [];
					nhn.husky.EZCreator.createInIFrame({
	  		  		oAppRef: oEditors,
	   		 		elPlaceHolder: "txtContent",  //textarea ID 입력
	   		 		sSkinURI: "${contextPath}/resources/smartEditor/SmartEditor2Skin.html",  //martEditor2Skin.html 경로 입력
	  		  		fCreator: "createSEditor2",
	   		 		htParams : { 
	    				// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
	      		  		bUseToolbar : true, 
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
						bUseVerticalResizer : false, 
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
						bUseModeChanger : false 
						
	  		 		 }
					});
				</script>
             </tr>
          </thead>
            
          <!-- 비밀글 여부 -->
          <thead>
             <tr class="csform_checkbox">
                <td class="fixed_cs">비밀글</td>
                <td class="cs_td" >
               	<c:if test="${csDetail.secret eq 'Y'}">
               		<input type="checkbox" id="secret" onchange="secretCheck();" checked >
               	</c:if>
                <c:if test="${csDetail.secret eq 'N'}">
               		<input type="checkbox" id="secret" onchange="secretCheck();" >
               	</c:if>                  
                  <input type="hidden" name="secret" value="${csDetail.secret}">
                  <label class="check_label">비밀글</label>
               </td>
             </tr>
          </thead>     
       </table>
       <br>
       <div class="button_box">
         <a class="back_a" href="javascript:history.back();"><button>돌아가기</button></a>
          <button type="submit" id="button_02"><span>수정완료</span></button>
          </div>
    </form>
    </div>
   </div>
  </div>
</body>
</html>