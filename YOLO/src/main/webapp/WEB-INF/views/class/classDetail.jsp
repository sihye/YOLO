<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style>
.contents-title {
	font-size: 30px;
	font-weight: bold;
	color: #337ab7;
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
#headerimg{
	width: 100%;
	height: 600px;
}
.mainImg{
	position: relative;
	background-image: url("../upload/${claVo.cMainimg}");
	background-repeat: no-repeat;
}
.header-wrap{
	position: absolute;
}

.container{
	position: relative;
	margin-top: 100px; 
}
#headericon{
	float: right;
}
#cate{
	border: 1px solid white;
	position: absolute;
	color: white;
	font-size: 2em;
	/* font-weight: bold; */
	padding: 1px;
}
.btn{
	background-color: rgba(0,0,0,0);
	border-color:  rgba(0,0,0,0);
}
.sharerimg{
	width: 50px;
}

</style>
<!-- 헤더 이미지 -->
<div class="mainImg">
	<img id="headerimg" class="header-wrap" alt="${claVo.cName}헤더 이미지" src="<c:url value='/upload/${claVo.cMainimg}'/>">
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
	<!-- 카테고리 -->
	<div id="cate" >${kName}</div>
	<!-- 클래스 이름 -->
	<p>${claVo.cName}</p>
	<!--회원이미지/회원이름/등록일/조회수/결제방법  -->
	<p>${claVo.mUserid }</p>
	<div>등록일
	<fmt:formatDate value="${claVo.cRegdate}" type="date" pattern="yyyy/MM/dd (E)"/>
	| 조회  ${claVo.cHits }</<div>>
	
	<button> 예약하기</button>
	<!--기본정보  -->
	<!--  -->
	<!--  -->
	<!--  -->
	<!--  -->
	<!--  -->

</div>
<!-- 헤더이미지 끝 -->

<div class="container">
	<div class="contents-title">기본 정보</div>
	<hr>	
	<div class="row">
		<div class="col-md-3">카테고리</div>
		<div class="col-md-4">${kName}</div>
	</div>
	<div class="row">
		<div class="col-md-3">비용</div>
		<c:if test="${claVo.cPrice==0 }"><div class="col-md-4">협의 </div></c:if>
		<c:if test="${claVo.cPrice>0 }">	
			<div class="col-md-4"><fmt:formatNumber pattern="#,###" value="${claVo.cPrice }"/>원/회</div>
		</c:if>	
	</div>
	<div class="row">
		<div class="col-md-3">특기사항</div>
		<div class="col-md-4">${claVo.cSpevialty}</div>
	</div>
	<div class="row">
		<div class="col-md-3">최대인원</div>
		<div class="col-md-4">${claVo.cMaxperson }명 (현재 %%명 신청)</div>
	</div>
	
	<div class="contents-title">추가 정보</div><hr>
	<div class="row">
		<div class="col-md-3">목표</div>
		<div class="col-md-4">${claVo.cGoal }</div>
	</div>
	<div class="row">
		<div class="col-md-3">대상</div>
		<div class="col-md-4">${claVo.cTarget }</div>
	</div>


	<div class="contents-title">모꼬지 소개</div><hr>
	<pre>${claVo.cDetailinfo }</pre>
	<div class="contents-title">스케줄</div><hr>
	<div class="contents-title">갤러리</div><hr>
	<c:if test="${!empty claVo.cDetailimg1}"><img class="img-thumbnail" alt="${claVo.cName}의 갤러리1" src="<c:url value='/upload/${claVo.cDetailimg1}'/>"> </c:if>
	<c:if test="${!empty claVo.cDetailimg2}"><img class="img-thumbnail" alt="${claVo.cName}의 갤러리2" src="<c:url value='/upload/${claVo.cDetailimg2}'/>"> </c:if>
	<c:if test="${!empty claVo.cDetailimg3}"><img class="img-thumbnail" alt="${claVo.cName}의 갤러리3" src="<c:url value='/upload/${claVo.cDetailimg3}'/>"> </c:if>
	
	<div class="contents-title">위치</div><hr>
	<p style="font-size: 1.3em;">${claVo.cPalce}</p>
	<div id="map" style="width: 100%; height: 400px;"></div>
	<script src="//apis.daum.net/maps/maps3.js?apikey=ae9a8f33df751fe70e8df23049bf7573&libraries=services"></script>
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
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addr2coord('${claVo.cPalce}',function(status, result) {
			// 정상적으로 검색이 완료됐으면 
			if (status === daum.maps.services.Status.OK) {
	
				var coords = new daum.maps.LatLng(
						result.addr[0].lat, result.addr[0].lng);
	
				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new daum.maps.Marker({
					map : map,
					position : coords
				});
	
				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new daum.maps.InfoWindow(
						{
							content : '<div style="width:150px;text-align:center;padding:6px 0;">${claVo.cName}</div>'
						});
				infowindow.open(map, marker);
	
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
	</script>

	<div class="contents-title">비슷한 클래스</div><hr>
	<!-- 게시판 반복 -->
	<div class="row">
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src='<c:url value='/img/0M0B0169.jpg'/>' alt="...">
				<div class="caption">
					<h3>클래스 이름</h3>
					<p>가격/횟수</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">상세보기</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src="<c:url value='/img/index1.jpg'/>" alt="...">
				<div class="caption">
					<h3>제목</h3>
					<p>내용도 넣을 수 있다.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src='<c:url value='/img/0M0B0169.jpg'/>' alt="...">
				<div class="caption">
					<h3>제목</h3>
					<p>내용도 넣을 수 있다.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>
			</div>
		</div>

		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src='<c:url value='/img/0M0B0169.jpg'/>' alt="...">
				<div class="caption">
					<h3>제목</h3>
					<p>내용도 넣을 수 있다.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>
			</div>
		</div>

		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src='<c:url value='/img/0M0B0169.jpg'/>' alt="...">
				<div class="caption">
					<h3>제목</h3>
					<p>내용도 넣을 수 있다.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>
			</div>
		</div>

		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src='<c:url value='/img/0M0B0169.jpg'/>' alt="...">
				<div class="caption">
					<h3>클래스 이름</h3>
					<p>가격/횟수</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">상세보기</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>




	<%@ include file="../inc/bottom.jsp"%>