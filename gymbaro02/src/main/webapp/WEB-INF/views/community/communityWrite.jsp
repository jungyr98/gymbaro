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
</head>
<body>
    <div class="communityDetail_main_container">
    <div class="communityDetail_first_content">
    <div class="communityDetail_first_text">
       <span><b>글쓰기</b></span>
    </div>
    <div class="communityDetail_form_box">
    <form action="${contextPath}/cs/cs.do" method="post">   
       <table class="communityDetail_table" border="1">
        <thead>
            <tr>
               <td class="communityDetail_fixed_community">커뮤니티</td>
               <td><select class="community_selectbox" name="question" onChange="" title="공지사항">
                     <option value="none">분류 선택</option>
                     <option value="q1">자유게시판</option>
                     <option value="q2">중고 거래</option>
                     <option value="q3">회원 양도</option>
                  </select>
               </td>
            </tr>
         </thead>
         <thead>
             <tr>
                <td class="communityDetail_fixed_community">제목</td>
                <td><input name="title" type="text" class="community_titlebox" placeholder="제목을 입력해주세요" /></td>
             </tr>
          </thead>
          <thead>
            <tr>
                <td colspan="2">
                <textarea id="txtContent" rows="10" cols="100" style="width: 100%; height: 412px;"></textarea>
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
				</td>
            </tr>
          </thead>
          <thead>
             <tr class="communityDetail_dot_line">
                <td class="communityDetail_fixed_community">첨부파일</td>
                <td>
                  <label class="input-file-button" for="input-file"></label>
                  <input type="file" id="input-file" />
               </td>
             </tr>
          </thead>   
       </table>
       <br>
       <div class="communityDetail_button_box">
          <a><button type="button" id="communityDetail_button_01"><span>돌아가기</span></button></a>
          <a href="#"><button id="communityDetail_button_02"><span>등록하기</span></button></a>
         </div>
    </form>
    </div>
   </div>
  </div>
</body>
</html>