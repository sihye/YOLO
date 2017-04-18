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
</style>
<!-- 헤더 이미지 -->
<div class="mainImg">
	<!-- 공유등등 -->
	<div class="header-button-wrap">
		<button class="header-button likeButton likeCancel"
			id="teacher_1631_0">
			<img src="<c:url value='/img/classDetail/icon_heart_n.png'/>">
		</button>

		<button class="header-button shareButton">
			<img src="<c:url value='/img/classDetail/icon_share_n.png'/>">
		</button>
		<!-- 	<div class="header-button-shareBox" style="display: none;">
		<div class="sharebox-title">모꼬지를 SNS에 공유해보세요.</div>
		<span class="kakao" id="shareOnKakao"><em class="fa fa-comment"></em></span>
		<span class="facebook" id="shareOnFacebook"><em
			class="fa fa-facebook"></em></span>
	</div> -->
		<button class="header-button report-modal-button" data-toggle="modal"
			data-target="#report-modal" data-keyboard="false">
			<img src="<c:url value='/img/classDetail/icon_report_n.png'/>">
		</button>
	</div>
	<!-- 공유끝 -->
	<!-- 카테고리 -->
	<!-- 클래스 이름 -->
	<!--회원이미지/회원이름/등록일/조회수/결제방법  -->
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
		<div class="col-md-4">${claVo. }</div>
	</div>
	<div class="row">
		<div class="col-md-3">비용</div>
		<div class="col-md-4">##회</div>
	</div>
	<div class="row">
		<div class="col-md-3">특기사항</div>
		<div class="col-md-4">##</div>
	</div>
	<div class="row">
		<div class="col-md-3">최대인원</div>
		<div class="col-md-4">##명 (현재 %%명 신청)</div>
	</div>
	
	<div class="contents-title">추가 정보</div><hr>
	<div class="row">
		<div class="col-md-3">목표</div>
		<div class="col-md-4">기타 우크렐라</div>
	</div>
	<div class="row">
		<div class="col-md-3">대상</div>
		<div class="col-md-4">기타 우크렐라</div>
	</div>


	<div class="contents-title">모꼬지 소개</div><hr>
	<pre>Q. 강사님을 소개해주세요.(이력, 자기소개 등)
A. 실용음악기타전공, 인디밴드 및 다년간 공연 및 음반활동. 강사활동4년. 음악학원 운영 3년.

Q.수업에 어떤 분들이 참여하면 좋을까요?
A. 대학생부터 일반 성인, 직장인 모두 참여가능합니다.

Q.일정에 대해 알려주세요.(날짜, 시간, 소요시간, 횟수 등)
A. 매주 토요일 오후 4시와 일요일 오후 1시에 왕초보분들 대상으로 90분간 통기타 원데이클래스 맛보기 강습 진행합니다.

Q.참여시 준비물이 필요한가요?
A. 왼손 손톱만 짧게 자르고 오시면 됩니다.

Q.참여하는 인원이 보통 몇 명인가요?
A. 3~7명

Q.결제는 어떤 방식으로 이루어지나요?
A. 계좌이체 또는 현장결제 가능하며, 카드도 가능해요.

Q.수업 내용을 자유롭게 소개해주세요.(커리큘럼, 결과물 등)
A. 통기타의 기초지식을 알려드리고 왕초보들도 쉽게 하실 수 있는 기초곡을 함께 천천히 배워보면서 기타라는 악기에 대해 이해할 수 있도록 합니다. 전체적인 강습 후 바로 실습해보며 1:1로 돌아가며 충분한 실습시간이 주어집니다.</pre>
	<div class="contents-title">스케줄</div><hr>
	<div class="contents-title">갤러리</div><hr>
	<div class="contents-title">위치</div><hr>
	<p style="font-size: 1.3em;">서울 영등포구 당산동3가 257-8 블루기타</p>
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
		geocoder.addr2coord('서울 영등포구 당산동3가 257-8',function(status, result) {
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
							content : '<div style="width:150px;text-align:center;padding:6px 0;">블루기타</div>'
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