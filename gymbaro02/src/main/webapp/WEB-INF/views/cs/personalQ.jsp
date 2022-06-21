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
<title>1:1문의 글 작성</title>
<link rel="stylesheet" href="${contextPath}/resources/css/communityWrite.css">
<style>
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
	   var txtContent = $("#txtContent").val();
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
  	 //게시물 등록 체크  
	   var cs_check = confirm("게시물을 등록하시겠습니까?");
	   if(cs_check) {
	      alert("게시물이 등록되었습니다!");
	      return true;
	   } else if(!cs_check) {
		   alert("게시물등록이 취소되었습니다!");
		   return false;
	   }
   }
	}
 </script>
 <script type="text/javascript">
 //비밀글 여부 체크 
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
    <div class="communityDetail_main_container">
    <div class="communityDetail_first_content">
    <div class="communityDetail_first_text">
       <span><b>1:1 문의 작성</b></span>
    </div>
    <div class="communityDetail_form_box">
    <form action="${contextPath}/cs/addNewcs.do" method="post" encType="multipart/form-data" onsubmit="return save();">   
        <table class="communityDetail_table" border="1">
        <thead>
            <tr>
               <td class="communityDetail_fixed_community">문의항목</td>
               <td class="cs_td">
               	 <select id="cs_category" name="cs_category" onChange="" title="문의 항목" style="width:31%; height:27px; border:0; outline: none; display:block;">
                     <option value="none">항목 선택</option>
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
                <td class="communityDetail_fixed_community">제목</td>
                <td class="cs_td">
                  <input type="text" name="title"  id="title" style="width:300px; display:block;" />
                </td>
             </tr>
          </thead>
          
          <thead>
            <tr>
                <td class="communityDetail_fixed_community">내용</td>
                <td>
                 <textarea id="txtContent" name="txtContent" rows="10" cols="100" style="width: 100%; height: 412px;"></textarea>
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
          <thead>
             <tr class="csform_checkbox">
                <td class="communityDetail_fixed_community">비밀글</td>
                <td class="cs_td" >
                  <input type="checkbox" id="secret" onchange="secretCheck();" checked="checked" >
                  <input type="hidden" name="secret" value="Y">
                  <label class="check_label">비밀글</label>
               </td>
             </tr>
          </thead>    
       </table>
       <br>
       <div class="communityDetail_button_box">
  		  <button type="button" id="communityDetail_button_01" onclick='javascript:history.back();'>돌아가기</button>
          <button type="submit" id="communityDetail_button_02"><span>입력완료</span></button>
          </div>
    </form>
    </div>
   </div>
  </div>
</body>
</html>