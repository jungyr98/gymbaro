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
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
<div id="outer_wrap">
		<div id="wrap">
			<header>
				   <tiles:insertAttribute name="header" />
			</header>
			<div class="clear"></div>
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