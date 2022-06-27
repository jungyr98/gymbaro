<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>키워드로 장소검색하고 목록으로 표출하기</title>
<script type="text/javascript">
<!-- 주소 수정폼 유효성 검사 -->
function updateCheck() {
	var address = $('input[name="update_address"]').val();
	if(address.length == 0){
		alert("지도에서 원하는 좌표를 선택해주세요!");
		return false;
	}
	return true;
}
</script>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family: 'Noto Sans KR', sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decorataion: none;}
.map_wrap {margin-top:30px; position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
#update_address_box {
position: absolute;
    left: 50px;
    top: 40px;
    height: calc(100% - 130px);
    width: 462px;
    border: 1px solid #939598;
    border-radius: 4px;
    box-shadow: 0 2px 3px 0 rgb(0 0 0 / 20%);
    z-index: 80;
    background: white;
}

#update_address_box #now_location_box,
#update_address_box #update_location_box {
	display: flex;
    flex-direction: column;
    align-items: baseline;
    justify-content: space-between;
    padding: 30px;
    height: 125px;
}

#update_address_box #now_location_box {
	background: #FAFAFA;
	border-bottom: 1px solid #ddd;
}

#update_address_box #location_btn_box {
	display: flex;
	align-items:center;
	padding: 0px 30px;
	justify-content: space-between;
}

div#location_btn_box button {
    width: 195px;
    height: 50px;
    font-size: 15px;
    border: 1px solid #c4c4c4;
    border-radius: 3px;
}

label.location_label {
    font-size: 20px;
    font-weight: lighter;
}

label.location_value_label {
    font-size: 16px;
    font-weight: normal;
}

.location_value_input {
    width: 100%;
    height: 40px;
    border: 1px solid #c4c4c4;
    border-radius: 3px;
    font-size: 15px;
    padding: 0px 10px;
}

#gym_search_btn {
	background:#184798;
	color:white;
	border:none;
}
</style>
</head>
<body>
<div class="map_wrap" style="position:relative;">
<div id="update_address_box">
	<div id="now_location_box">
		<label class="location_label">현재 위치</label>
		<input type="hidden" name="address" value="${address}"/>
		<c:choose>
			<c:when test="${not empty address and address != 'N/A'}">
				<label class="location_value_label">${address}</label>
			</c:when>
			<c:otherwise>
				<label class="location_value_label">없음</label>
			</c:otherwise>
		</c:choose>
	</div>
	<form action="${contextPath}/gym/searchGyms.do" method="POST" onsubmit="return updateCheck();">
	<div id="update_location_box" style="height:150px;">
		<label class="location_label">수정한 위치</label>
		<input type="text" class="location_value_input" name="update_address" readonly />
	</div>
	<div id="location_btn_box">
		<button type="button" onclick="javascript:history.back();">뒤로가기</button>
		<button type="submit" id="gym_search_btn">시설 목록 재검색</button>
	</div>
	</form>		
</div>
<div id="map" style="width:100%;height:100%;"></div>
<div id="centerAddr"></div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${KAKAOMAP_KEY}&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(36.3454412,127.3720287), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
var address = $('input[name="address"]').val();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(address, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        //var infowindow = new kakao.maps.InfoWindow({
        //    content: '<div style="width:150px;text-align:center;padding:6px 0;">현재 위치</div>'
        //});
        //infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
}); 

//지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">수정할 위치</span>' + 
                            detailAddr + 
                        '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
            
            $('input[name="update_address"]').val(result[0].address.address_name);
        }   
    });
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
</script>
</body>
</html>