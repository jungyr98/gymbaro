<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://djqafk2qzyjhg.cloudfront.net/css/font-awesome.min.css" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<style type="text/css">
header #header_top_box {
	display: flex;
    align-items: center;
    justify-content: space-between;
}
header #logo {
	margin-left: 10px; float: left;
}
header #logo img {
	width: 250px;
}

header #logo #menual_atag {
	margin-left:20px;
}
header #head_link {
	font-size: 0.75em; margin-right: 10px; float: right;
}
header #head_link ul {
	list-style: none;
}
/*
header #head_link li {
	padding: 0px 8px; border-right-color: rgb(153, 153, 153); border-right-width: 1px; border-right-style: solid; float: left;
}
*/

header #head_link ul li span {
	font-size:14px;
	margin-right:10px;
}

header #head_link img {
	width:30px;
}
/*
#head_link .no_line {
	border-right-color: currentColor; border-right-width: medium; border-right-style: none;
}
*/

header #search {
	padding: 0px; float: right;
}
header #search .main_input {
	padding: 0px 5px; border: 1px solid #c4c4c4; border-image: none; width: 260px; height: 25px;
}
header #search .btn1 {
	border: 1px solid #c4c4c4;
    border-image: none;
    width: 27px;
    height: 25px;
    margin-left: 2px;
    background-color: white;
    padding-bottom: 3px;
}

header #suggestList{
	display:flex;
	border: 1px solid #ddd;
}

header #suggestList button {
    /* margin: 0; */
    width: 187px;
    height: 90px;
    background: white;
    color: #333333;
    border:none;
    border-left: 1px solid #ddd;
    font-size: 16px;
}

header #suggestList button span {
	font-size: 30px;
	margin-bottom: 5px;
}

header #suggestList button:hover {
	background: #184798;
    color: white;
}
</style>
<script type="text/javascript">
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "/bookShop01/goods/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}

</script>
</head>
<body>
<header>
  <div id="header_top_box">
	<div id="logo">
		<a href="${contextPath}/admin/main/main.do">
			<img width="124" alt="logo.png" src="${contextPath}/resources/image/gymbaro_admin_logo.png">
		</a>
		<a href="#" target="_blank" id="menual_atag">
			<i class="ace-icon fa fa-book"></i>&nbsp;사용메뉴얼 보기
		</a>
	</div>
	<!--
	<div id="search">
		<form name="frmSearch" action="/bookShop01/goods/searchGoods.do">
			<select>
				<option>
			</select>
			<input name="searchWord" class="main_input" type="text" onkeyup="keywordSearch()"> 
			<button type="submit" name="search" class="btn1"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
		</form>
	</div>
	 -->
	<div id="head_link">
		<ul>		   		     			 
			   <li>
			   		<span>Admin</span>
			   		<img src="${contextPath }/resources/image/myPageUser.png" alt="myPageUser.png" />
			   		</a>
			   </li>     			  
		</ul>
	</div>
  </div>
	<br>
   <div id="suggest">
        <div id="suggestList">
        	<a href="#"><button type="button"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span><br>기본설정</button></a>
        	<a href="#"><button type="button"><span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span><br>상품관리</button></a>
        	<a href="#"><button type="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span><br>주문관리</button></a>
        	<a href="#"><button type="button"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span><br>예약관리</button></a>
        	<a href="#"><button type="button"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><br>회원관리</button></a>
        	<a href="#"><button type="button"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span><br>게시판관리</button></a>
        	<a href="#"><button type="button"><span class="glyphicon glyphicon-gift" aria-hidden="true"></span><br>이벤트</button></a>
        	<a href="#"><button type="button"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span><br>매출관리</button></a>
        </div>
   </div>


</header>
</body>
</html>