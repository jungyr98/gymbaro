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
<title><tiles:insertAttribute name="title" /></title>
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
      #sidebar-left {
        width: 15%;
        height:100px;
        padding: 5px;
        float:left;
        margin-right: 5px;
        margin-bottom: 5px;
        border: 0px solid #bcbcbc;
        font-size:10px;
      }
      #content {
      	display:flex;
		justify-content:center;
		align-items:center;
		text-align:center;
      	height:auto;
      	
      }
      #footer {
        clear: both;
		margin-top: 150px;
        border: 0px solid #bcbcbc;
      }
      
</style>
</head>
<body>
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