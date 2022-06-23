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
<!-- SmartEditor2 라이브러리 -->
<script type="text/javascript" src="${contextPath}/resources/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>Document</title>
<link rel="stylesheet" href="${contextPath}/resources/css/communityWrite.css">
<script>

function save(){
   oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
          //스마트 에디터 값을 텍스트컨텐츠로 전달
   var content = document.getElementById("smartEditor").value;
   /* alert(document.getElementById("txtContent").value);  */
          // 값을 불러올 땐 document.get으로 받아오기
   var title = $('input[name="title"]').val().length;
   if(title > 45){
	   alert("제목은 45자 이상을 넘길 수 없습니다!");
	   return false;
   }else{
   		var article_check = confirm("게시물을 등록하시겠습니까?"); 
		if(article_check == true) {
			alert("게시물이 등록되었습니다!");
			return true;
		} else {
			alert("게시물 작성이 취소되었습니다.");
			return false;
		}
   }
   return; 
}

function modify_save(){
	   oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
	          //스마트 에디터 값을 텍스트컨텐츠로 전달
	   var content = document.getElementById("smartEditor").value;
	   /* alert(document.getElementById("txtContent").value);  */
	          // 값을 불러올 땐 document.get으로 받아오기
	   	var article_check = confirm("게시물을 수정하시겠습니까?"); 
		if(article_check == true) {
			return true;
		} else {
			return false;
		}
}

</script>
<style type="text/css">
input[name="detail_image"] {
    margin: 15px 0;
    border: 1px solid #c4c4c4;
    border-radius: 2px;
}

#image_container1 img { 
	width:50px;
	object-fit:cover;
}
</style>
</head>
<body>
    <div class="communityDetail_main_container">
    <div class="communityDetail_first_content">
    <div class="communityDetail_first_text">
       <span><b>게시글 작성</b></span>
    </div>
    <div class="communityDetail_form_box">
   
 
   		<c:if test= "${boardVO == null }">
   		   <form action="${contextPath}/community/addNewArticle.do" method="post" onsubmit="return save();">   <!-- 새 글 등록 form 열기 태그 -->
       <table class="communityDetail_table" border="1">
        <thead>
            <tr>
               <td class="communityDetail_fixed_community">커뮤니티</td>
               <td><select class="community_selectbox" name="article_category" onChange="" title="공지사항">
                     <option value="none">분류 선택</option>
                     <option value="자유게시판">자유게시판</option>
                     <option value="중고 거래">중고 거래</option>
                     <option value="회원 양도">회원 양도</option>
                  </select>
               </td>
            </tr>
         </thead>
         <thead>
             <tr>
                <td class="communityDetail_fixed_community">제목</td>
                <td><input name="title" type="text" class="community_titlebox" placeholder="제목을 입력해주세요" required/></td>
             </tr>
          </thead>
          <thead>
            <tr>
            	<td class="communityDetail_fixed_community">내용</td>
                <td>
                <textarea id="txtContent" name="txtContent" rows="10" cols="100" style="width: 100%; height: 412px;">
                </textarea>
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
						bUseModeChanger : false,
						fOnBeforeUnload : function() {}	// "이 페이지에서 나가시겠습니까" 경고 삭제 
	  		 		 }
					});
				</script>
				</td>
            </tr>
          </thead>
       </table>
       <br>
       <div class="communityDetail_button_box">
          <a><button type="button" id="communityDetail_button_01"><span>돌아가기</span></button></a>
          <a><button type="submit" id="communityDetail_button_02"><span>등록하기</span></button></a>	
         </div>
     </form>     
    </c:if> 

    
      <c:if test="${boardVO != null }">
      <form action="${contextPath}/community/modifyArticle.do" method="post" onsubmit="return modify_save();">
       <table class="communityDetail_table" border="1">
        <thead>
            <tr>
               <td class="communityDetail_fixed_community">커뮤니티</td>
               <td><select class="community_selectbox" name="article_category" onChange="" title="공지사항">
                     <option value="${boardVO.article_category}">${boardVO.article_category}</option>
                     <option value="자유게시판">자유게시판</option>
                     <option value="중고 거래">중고 거래</option>
                     <option value="회원 양도">회원 양도</option>
                  </select>
               </td>
            </tr>
         </thead>
         <thead>
             <tr>
                <td class="communityDetail_fixed_community">제목</td>
                <td><input name="title" type="text" class="community_titlebox" value="${boardVO.title}" required/></td>
             </tr>
          </thead>  
          <thead>
            <tr>
            	<td class="communityDetail_fixed_community">내용</td>
                <td>
                <textarea id="txtContent" name="txtContent" rows="10" cols="100" style="width: 100%; height: 412px;">${boardVO.content}</textarea>
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
						bUseModeChanger : false,
						fOnBeforeUnload : function() {}	// "이 페이지에서 나가시겠습니까" 경고 삭제 
	  		 		 }
					});
				</script>
				</td>
            </tr>
          </thead>
       </table>
       <br>
       <div class="communityDetail_button_box">
       	  <input type="hidden" name="articleNo" value="${boardVO.articleNo}">
          <a><button type="button" id="communityDetail_button_01" onclick="javascript:history.back();"><span>돌아가기</span></button></a>
          <a><button type="submit" id="communityDetail_button_02"><span>수정하기</span></button></a>	
        </div>
 	</form>
   </c:if>    
    </div>
   </div>
  </div>
</body>
</html>