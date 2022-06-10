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
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px; padding: 0px; vertical-align: middle;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

.clear {
	clear: both;
}
#outer_wrap {
	margin: 0px auto; padding: 0px; width: 100%;
}
#wrap {
	margin: 0px auto; padding: 0px;
}

aside {
	width: 240px; float: left;
}
article {
	margin: 20px 0px 0px 15px; width: 1250px; float: right;
}
</style>
</head>
<body>
<div id="outer_wrap">
		<div id="wrap">
			<header>
				   <tiles:insertAttribute name="header" />
			</header>
			<div class="clear"></div>
			<aside>
				 <tiles:insertAttribute name="side" />
			</aside>
			<article>
			 	<tiles:insertAttribute name="body" />
			</article>
			<div class="clear"></div>
			<footer>
        		<tiles:insertAttribute name="footer" />
        	</footer>
		</div>
</div>        	
</body>
</html>