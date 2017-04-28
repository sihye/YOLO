<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link href="<c:url value='/css/lightbox.css'/>" rel="stylesheet">
<script src="<c:url value='/js/lightbox.js'/>"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
<style>
.contents-title {
	font-size: 30px;
	font-weight: bold;
	color: #95badf;
	margin-top: 20px;
}

.col-md-3 {
	color: gray;
	font-size: 1.3em;
}

.col-md-4 {
	color: gray;
	font-size: 1.35em;
}
hr{
	margin-top: 2px;
}

.mainImg{
	background-image: url("<c:url value='/upload/${claVo.cMainimg}'/>");
	background-repeat: no-repeat;
	height: 500px;
	background-size: 100%;
}
#onHeader {
	color: white;
	height: 500px;
}
#onHeader table{
	margin: 0 auto;
	padding-top: 400px;
	width: 970px;
}
.header-wrap{
}

.container{
	clear: both;
}
#headericon{
	text-align: right;
	padding-right: 50px;
}

#headericon img{
	width: 30px;
}
.modal-content{
	text-align: center;
}
.modal-content img{
	width: 45px;
}

#cate{
	border: 1px solid white;
	border-radius:10px;
	color: white;
	font-size: 13px;;
	padding: 1px;
	margin: 0 auto;
	text-align: center;
	width: 120px;
}
.btn{
	background-color: rgba(0,0,0,0);
	border-color:  rgba(0,0,0,0);
}

.sharerimg{
	width: 50px;
}
/*갤러리*/
.img-thumbnail{
	width: 500px;
	height: 300px;
}
</style>
<!-- 헤더 이미지 -->
<div class="mainImg">
	<!-- 헤더아이콘 -->
 	<div class="header-wrap" id="headericon">
		<a href="#">
			<img src="<c:url value='/img/classDetail/icon_heart_n.png'/>">
		</a>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target=".bs-example-modal-sm"><img src="<c:url value='/img/classDetail/icon_share_n.png'/>"></button>

		<div class="modal fade bs-example-modal-sm" tabindex="-1"
			role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<p>클래스를 친구와 공유해 보세요!</p>
					<a href="http://www.facebook.com/sharer/sharer.php?u=http://localhost:9090/yolo/class/claDetail.do?cNo=${claVo.cNo }">
						<img class="sharerimg" alt="facebook공유하기" src="<c:url value='/img/classDetail/facebook_logo.jpg'/>">
					</a>
					<a href="https://twitter.com/intent/tweet?url=http://localhost:9090/yolo/class/claDetail.do?cNo=${claVo.cNo }">
						<img class="sharerimg" alt="twitter공유하기" src="<c:url value='/img/classDetail/twitter.png'/>">
					</a>
				</div>
			</div>
		</div>
		<a>
			<img src="<c:url value='/img/classDetail/icon_report_n.png'/>">
		</a>
	</div>
	<!-- 아이콘끝 -->
	
	<!-- 헤더 위에 기본정보 -->
	<div id="onHeader">
		<table>
			<tbody>
				<tr><td style="text-align: left;">
					<div id="cate" >${kName}</div>
				</td></tr>
				<tr><td style="text-align: center; font-size: 50px;"><p style="color: white;">${claVo.cName}</p></td></tr>
				<tr><td><span style="color: white; font-size: 20px; ">${claVo.mUserid }</span><br><span style="color: white; font-size: 20px;">등록일 <fmt:formatDate value="${claVo.cRegdate}" type="date" pattern="yyyy/MM/dd (E)"/>
	| 조회  ${claVo.cHits }</span></td></tr>
			</tbody>
		</table>
		<!-- Button trigger modal -->
<button type="button" class="btn btn-lg" data-toggle="modal" data-target="#myModal1">
  예약하기
</button>

<!-- Modal -->
<form action="" method="post" name="" id="">
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"
      aria-label="Close" aria-hidden="true">×</button>
        
        <h4 class="modal-title" id="myModalLabel" style="color: black;">예약하기</h4>
      </div>
      <div class="modal-body" >
      	스케줄 정보 뿌려줌
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default">예약하기</button>
        <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
        
      </div>
    </div>
  </div>
</div>
</form>
	</div>

</div>
<!-- 헤더이미지 끝 -->
<div id="tabs" class="container">
  <ul>
    <li><a href="#tabs-1">클래스정보</a></li>
    <li><a href="#tabs-2">Q&A</a></li>
    <li><a href="#tabs-3">후기</a></li>
  </ul>
  <div id="tabs-1">
		<div>
			<div class="contents-title">기본 정보</div>
			<hr>
			<div class="row">
				<div class="col-md-3">카테고리</div>
				<div class="col-md-4">${kName}</div>
			</div>
			<div class="row">
				<div class="col-md-3">비용</div>
				<c:if test="${claVo.cPrice==0 }">
					<div class="col-md-4">협의</div>
				</c:if>
				<c:if test="${claVo.cPrice>0 }">
					<div class="col-md-4">
						<fmt:formatNumber pattern="#,###" value="${claVo.cPrice }" />
						원/회
					</div>
				</c:if>
			</div>
			<div class="row">
				<div class="col-md-3">특기사항</div>
				<div class="col-md-4">${claVo.cSpevialty}</div>
			</div>
			<div class="row">
				<div class="col-md-3">최대인원</div>
				<div class="col-md-4">${claVo.cMaxperson }명(현재 %%명 신청)</div>
			</div>

			<div class="contents-title">추가 정보</div>
			<hr>
			<div class="row">
				<div class="col-md-3">목표</div>
				<div class="col-md-4">${claVo.cGoal }</div>
			</div>
			<div class="row">
				<div class="col-md-3">대상</div>
				<div class="col-md-4">${claVo.cTarget }</div>
			</div>


			<div class="contents-title">모꼬지 소개</div>
			<hr>
			<pre>${claVo.cDetailinfo }</pre>
			<div class="contents-title">스케줄</div>
			<hr>
			<div class="contents-title">갤러리</div>
			<hr>

			<c:if test="${!empty claVo.cDetailimg1}">
				<a href="<c:url value='/upload/${claVo.cDetailimg1}'/>"
					data-lightbox="roadtrip"><img class="img-thumbnail"
					alt="${claVo.cName}의 갤러리1"
					src="<c:url value='/upload/${claVo.cDetailimg1}'/>"></a>
			</c:if>
			<c:if test="${!empty claVo.cDetailimg2}">
				<a href="<c:url value='/upload/${claVo.cDetailimg2}'/>"
					data-lightbox="roadtrip"><img class="img-thumbnail"
					alt="${claVo.cName}의 갤러리2"
					src="<c:url value='/upload/${claVo.cDetailimg2}'/>"></a>
			</c:if>
			<c:if test="${!empty claVo.cDetailimg3}">
				<a href="<c:url value='/upload/${claVo.cDetailimg3}'/>"
					data-lightbox="roadtrip"><img class="img-thumbnail"
					alt="${claVo.cName}의 갤러리3"
					src="<c:url value='/upload/${claVo.cDetailimg3}'/>"></a>
			</c:if>

			<div class="contents-title">위치</div>
			<hr>
			<p style="font-size: 1.3em;">${claVo.cPlace}</p>
			<div id="map" style="width: 100%; height: 400px;"></div>
			<script
				src="//apis.daum.net/maps/maps3.js?apikey=ae9a8f33df751fe70e8df23049bf7573&libraries=services"></script>
			<script type="text/javascript">
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer, mapOption);

				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new daum.maps.MapTypeControl();

				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl,
						daum.maps.ControlPosition.TOPRIGHT);

				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new daum.maps.ZoomControl();
				map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder
						.addr2coord(
								'${claVo.cPlace}',
								function(status, result) {
									// 정상적으로 검색이 완료됐으면 
									if (status === daum.maps.services.Status.OK) {

										var coords = new daum.maps.LatLng(
												result.addr[0].lat,
												result.addr[0].lng);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new daum.maps.Marker({
											map : map,
											position : coords
										});

										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new daum.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">${claVo.cplacedetail}</div>'
												});
										infowindow.open(map, marker);

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
			</script>

			<div class="contents-title">비슷한 클래스</div>
			<hr>
			<!-- 게시판 반복 -->
			<section class="listings">
				<div class="wrapper">
					<ul class="properties_list">
					<!--게시판 반복 -->
						<c:if test="${empty inClaList }">
							<h1>조회된 클래스가 없습니다.</h1>
						</c:if>
						<c:if test="${!empty inClaList }">
							<c:forEach var="claVo" items="${inClaList }">
								<li><a
									href="<c:url value='/class/claDetail.do?cNo=${claVo.cNo}'/>">
										<img src="<c:url value='/upload/${claVo.cMainimg }'/>"
										alt="${claVo.cName}의 메인 이미지" title="${claVo.cName}"
										class="property_img" />
								</a> <c:if test="${claVo.cPaymentway=='온라인'}">
										<span class="price">온라인 결제</span>
									</c:if>
									<div class="property_details">
										<h1>
											<a
												href="<c:url value='/class/claDetail.do?cNo=${claVo.cNo}'/>">${claVo.cName}</a>
										</h1>
										<h2 style="text-align: right;">
											<i class="fa fa-eye " aria-hidden="true"></i>${claVo.cHits}
											<i class="fa fa-heart-o" aria-hidden="true"></i>
											<span class="property_size">(288ftsq)</span>
										</h2>
									</div></li>
							</c:forEach>
						</c:if>
					</ul>
					<div class="more_listing">
						<a href="#" class="more_listing_btn">View More Listings</a>
					</div>
				</div>
			</section>
		</div>
	</div>
  <div id="tabs-2">
  	<!-- 큐앤에이 -->
  </div>
  <div id="tabs-3">
  	<!-- 후기 -->
  </div>
</div>
 





	<%@ include file="../inc/bottom.jsp"%>