<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style type="text/css">
body {
	height:1000vh;
}
.navbar {
	padding:0;
}
.container-fluid {
	height:100%;
	background-color:#fff;
	height:85px;
	top:0;
}
#navbarText {
	
	font-weight:600;
	color:black;
}

.search_icon {
	width:15px;
	height:15px;
}

</style>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
    	<img alt="logo.png" src="../resources/image/logo.png">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">회원권 예약</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">운동 용품</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">내 주변 시설 찾기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">커뮤니티</a>
        </li>
      </ul>
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="#">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">회원가입</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">고객센터</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">
          	<img alt="search.png" class="search_icon" src="../resources/image/search.png">
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>


</body>
</html>