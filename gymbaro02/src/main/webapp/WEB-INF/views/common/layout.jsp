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
<meta name="viewport" content="width=device-width">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title><tiles:insertAttribute name="title" /></title>
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "b544ce7c-c22c-496d-ae29-a248f3b4b73d"
  });
</script>
<!-- End Channel Plugin -->
<script type="text/javascript">
//퀵메뉴
$(document).ready(function(){
	 var currentPosition = parseInt($(".quickmenu").css("top"));
	 $(window).scroll(function() {
		 var position = $(window).scrollTop(); 
		 $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},0);
	 });
});

//top 버튼
 $(function() {
        $("#quick_top_btn").click(function() {
            $('html, body').animate({
                scrollTop : 0 //버튼 눌렀을때 도달하는 위치
            }, 680);
            return false;
        });
    });
    
//최근 본 상품
var array_index=0;
	var SERVER_URL="${contextPath}/thumbnails.do";
	function fn_show_next_goods(){
		var img_quickmenu=document.getElementById("img_quickmenu");
		var cur_goods_num=document.getElementById("cur_goods_num");
		var goods_id=document.frm_quickmenu.goods_id;
		var goods_fileName=document.frm_quickmenu.goods_fileName;
		if(array_index <goods_id.length-1)
			array_index++;
		 	
		var goods_id=goods_id[array_index].value;
		var fileName=goods_fileName[array_index].value;
		img_quickmenu.src=SERVER_URL+"?goods_id="+goods_id+"&fileName="+fileName;
		cur_goods_num.innerHTML=array_index+1;
	}
	
 function fn_show_previous_goods(){
	var img_quickmenu=document.getElementById("img_quickmenu");
	var cur_goods_num=document.getElementById("cur_goods_num");
	var goods_id=document.frm_quickmenu.goods_id;
	var goods_fileName=document.frm_quickmenu.goods_fileName;
	
	if(array_index >0)
		array_index--;
	
	var goods_id=goods_id[array_index].value;
	var fileName=goods_fileName[array_index].value;
	img_quickmenu.src=SERVER_URL+"?goods_id="+goods_id+"&fileName="+fileName;
	cur_goods_num.innerHTML=array_index+1;
}
 
function goodsInfo(){
	var cur_goods_num=document.getElementById("cur_goods_num");
	arrIdx=cur_goods_num.innerHTML-1;
	
	var img_quickmenu=document.getElementById("img_quickmenu");
	var goods_id=document.frm_quickmenu.goods_id;
	var len=goods_id.length;
	
	if(len>1){
		goods_id=goods_id[arrIdx].value;
	}else{
		goods_id=goods_id.value;
	}
	
	
	var formObj=document.createElement("form");
	var i_goods_id = document.createElement("input"); 
    
	i_goods_id.name="goods_id";
	i_goods_id.value=goods_id;
	
    formObj.appendChild(i_goods_id);
    document.body.appendChild(formObj); 
    formObj.method="get";
    formObj.action="${contextPath}/goods/goodsInfo.do?goods_id="+goods_id;
    formObj.submit();
	
	
}
</script>
<style>

body {
		font-family: 'Noto Sans KR', sans-serif;
}
#container {
    width: 100%;
    margin: 0px auto;
    text-align:center;
    border: 0px solid #bcbcbc;
    }
#header {
   padding: 50px;
}

#content {
   display:flex;
   justify-content:center;
	text-align:center;
     height:auto;
     margin-top: 71px;
      	
}
#footer {
   clear: both;
	margin-top: 150px;
    border: 0px solid #bcbcbc;
}
      
.quickmenu div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
a {text-decoration:none;}
.quickmenu {position:absolute;width:100px;top:30%;right:20px;background:#fff;margin-right:20px; z-index:4;}
.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid;}
.quickmenu ul li {float:left;width:100%;border-bottom:1px solid;text-align:center;display:inline-block;*display:inline;}
.quickmenu ul li a {position:relative;float:left;width:100%;height:30px;line-height:30px;text-align:center;color:#999;font-size:9.5pt;text-decoration-line: none;}
.quickmenu ul li:last-child {border-bottom:0;}

#quick_top_btn:hover{color:white; background-color:#184798;cursor:pointer;}
#quick_cart_btn:hover{color:white; background-color:#184798;}

      
</style>
</head>
<body>
<div class="quickmenu">
	 <ul style="color:#ddd;">
		 <li><a href="${contextPath}/cart/myCartList.do" id="quick_cart_btn" style="text-decoration-line: none;"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
		
		 	<div class="recent">
				<li style="color:#999; height:28px; border-bottom-width: 0px;">최근 본 상품</li>
		  <ul style="border-top-width: 0px;border-right-width: 0px;border-bottom-width: 0px;border-left-width: 0px;">
		<!--   상품이 없습니다. -->
		 <c:choose>
			<c:when test="${ empty quickGoodsList }">
				     <strong><h5> 상품이 없습니다</h5></strong>
			</c:when>
			<c:otherwise>
	       <form name="frm_quickmenu"  >	        
		      <c:forEach var="item" items="${quickGoodsList }" varStatus="itemNum">
		         <c:choose>
		           <c:when test="${itemNum.count==1 }">
			      <a href="javascript:goodsInfo();">
			  	         <img width="99" height="95" id="img_quickmenu"  
			                 src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			      </a>
			        <input type="hidden"  name="goods_id" value="${item.goods_id}" />
			        <input type="hidden" name="goods_fileName" value="${item.goods_fileName}" />
			      <br>
			      </c:when>
			      <c:otherwise>
			        <input type="hidden"  name="goods_id" value="${item.goods_id}" />
			        <input type="hidden" name="goods_fileName" value="${item.goods_fileName}" />
			      </c:otherwise>
			      </c:choose>
		     </c:forEach>
		     </form>
		   </c:otherwise>
	      </c:choose>
		 </ul>		 
	</div>
	 <c:choose>
	    <c:when test="${ empty quickGoodsList }">
		    <li><a>0/0</a></li>
	    </c:when>
	    <c:otherwise>
           <a href='javascript:fn_show_previous_goods();' style="margin-left:20px;"> <i class="fa fa-angle-left"></i> </a> &nbsp;  <span id="cur_goods_num">1</span>/${quickGoodsListNum}  &nbsp; <a href='javascript:fn_show_next_goods();'> <i class="fa fa-angle-right"></i> </a> 
       </c:otherwise>
       </c:choose>
		
		 <li><a id="quick_top_btn" style="border-top: 1px solid #ddd;">TOP</a></li>
	 </ul>
</div>
<div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <!-- 
      <div id="sidebar-left">
          <tiles:insertAttribute name="side"/> 
      </div>
       -->
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>     	
</body>
</html>