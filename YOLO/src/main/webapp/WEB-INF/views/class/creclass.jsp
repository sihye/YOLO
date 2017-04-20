<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Continuous Scroll - fullPage.js</title>
<meta name="author" content="Matthew Howell" />
<meta name="description" content="fullPage continuous scrolling demo." />
<meta name="keywords"
	content="fullpage,jquery,demo,scroll,loop,continuous" />
<meta name="Resource-type" content="Document" />


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery.fullpage.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/examples.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/creCla.css" />


<!--[if IE]>
		<script type="text/javascript">
			 var console = { log: function() {} };
		</script>
	<![endif]-->

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/scrolloverflow.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.fullpage.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/examples.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/css/bootstrap.min.css"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(document).ready(
			function() {
				$('#fullpage').fullpage(
						{
							/* sectionsColor : [ '#1bbc9b', '#4BBFC3', '#7BAABE',
									'whitesmoke', '#ccddff' ], */
							anchors : [ 'firstPage', 'secondPage', '3rdPage',
									'4thpage', '5thpage', '6thpage' ],
							menu : '#menu',
							continuousVertical : false
						});
			});
</script>
<style>
  #image_preview {
    display:none;
}
 #image_preview1 {
    display:none;
}
 #image_preview2 {
    display:none;
}
 #image_preview3 {
    display:none;
}

#preview{
	width: 300px;
}
#preview1{
	width: 300px;
}
#preview2{
	width: 300px;
}
#preview3{
	width: 300px;
}
#map{
	margin: 0 auto;
}

</style>
</head>
<body>

	<ul id="menu">
		<li data-menuanchor="firstPage" class="active"><a
			href="#firstPage">클래스 기본정보 1</a></li>
		<li data-menuanchor="secondPage"><a href="#secondPage">클래스
				기본정보 2</a></li>
		<li data-menuanchor="3rdPage"><a href="#3rdPage">클래스 추가정보 1</a></li>
		<li data-menuanchor="4thpage"><a href="#4thPage">클래스 추가정보 2</a></li>
		<li data-menuanchor="5thpage"><a href="#5thpage">클래스 추가정보 3</a></li>
		<li data-menuanchor="6thpage"><a href="#6thpage">스케줄 등록</a></li>
	</ul>
	<form action="<c:url value="/class/clacre.do"/>" class="form-inline" enctype="multipart/form-data"
		method="post" id="claCre" name="claCre">
		<div id="fullpage" class="container">
			<div class="section " id="section0">
				<h1>클래스 기본정보</h1>
				<hr>
				<br>
				<p>클래스 이름을 입력해 주세요.</p>
				<div class="form-group">
					<div class="col-xs-4">
						<input type="text" class="form-control" id="" name="cName"
							placeholder="이름등록">
					</div>
				</div>
				<p>클래스를 대표할 카테고리를 선택하세요.</p>
				<!-- 카테고리 셀렉트 -->
				<c:forEach var="cateG" items="${gCateList }">
					<select class="form-control" name="kNo">
						<option value="0">:: ${cateG.kgName} ::</option>
						<c:forEach var="cageVO" items="${cateList }">
							<c:if test="${cateG.kgNo==cageVO.kgNo }">
								<option value="${cageVO.kNo}">${cageVO.kName}</option>
							</c:if>
						</c:forEach>
					</select>
				</c:forEach>
				<%-- <span><input type="checkbox" name="cbox" value="1" offsrc="<c:url value='/img/off.png'/>" onsrc="<c:url value='/img/on.png'/>" /> 1번 박스</span>
				<span><input type="checkbox" name="cbox" value="2" offsrc="<c:url value='/img/off.png'/>" onsrc="<c:url value='/img/on.png'/>" /> 2번 박스</span>
				<script>imgCbox("cbox");</script>
				<input id="LTC09_00" type="checkbox" name="category" value="LTC09_00" />
                <label class="midCategoryBox" for="LTC09_00"># 육아</label> --%>
				<!-- 카테고리 셀렉트 끝 -->
				<p>결제방법을 선택하세요.</p>
				<div class="radio">
					<label> <input type="radio" name="cPaymentway"
						id="optionsRadios1" value="온라인" checked> 온라인 결제
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="cPaymentway"
						id="optionsRadios2"  value="현장"> 현장 결제
					</label>
				</div>
			</div>
			<div class="section" id="section1">
				<div class="intro">
					<p>비용을 입력해 주세요.(0원 입력시 협의)</p>
					<input type="text" class="form-control" id="" name="cPrice"
						placeholder="">
					<p>특기사항을 입력해 주세요.</p>
					<input type="text" class="form-control" id="" name="cSpevialty"
						placeholder="">
					<p>최대 인원을 입력해 주세요.</p>
					<input type="text" class="form-control" id="" name="cMaxperson"
						placeholder="">
				</div>
			</div>
			<div class="section" id="section2">
				<div class="intro">
					<p>목표을 입력해 주세요.</p>
					<input type="text" class="form-control" id="" name="cGoal"
						placeholder="">
					<p>대상을 선택해 주세요.</p>
					<input type="text" class="form-control" id="" name="cTarget"
						placeholder="">
					<p>상세 설명을 입력해 주세요.</p>
					<textarea id="introContents"style="width: 70%;" class="form-control" name="cDetailinfo" rows="10" placeholder="
						• 강사님을 소개해주세요.(이력, 자기소개 등).
						• 커리큘럼, 경력, 장점을 표현해주세요.
						• 회원님의 모꼬지의 대해 설명해주세요.
						• 비교 선택시 중요한 정보입니다.">
	Q.수업에 어떤 분들이 참여하면 좋을까요?
	A. 
	
	Q.일정에 대해 알려주세요.(날짜, 시간, 소요시간, 횟수 등)
	A. 
	
	Q.참여시 준비물이 필요한가요?
	A. 
	
	Q.참여하는 인원이 보통 몇 명인가요?
	A. 
	
	Q.결제는 어떤 방식으로 이루어지나요?
	A. 
	
	Q.수업 내용을 소개해주세요.(커리큘럼, 결과물 등)
	A. 
	
	Q. 강사님을 소개해주세요.(이력, 자기소개 등)
	A. 
					</textarea>

				</div>
			</div>
			<div class="section" id="section3">
				<div class="intro">
					<h1>Scroll Down</h1>
					<p>And it will animate down to the first section</p>
					<input type="hidden" id="sample5_address" placeholder="주소"> 
					<input type="button" onclick="sample5_execDaumPostcode()"
						value="주소 검색"><br>
					<div id="map"
						style="width: 80%; height: 500px; margin-top: 10px; display: none"></div>

					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script src="//apis.daum.net/maps/maps3.js?apikey=ae9a8f33df751fe70e8df23049bf7573&libraries=services"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div
						mapOption = {
							center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
							level : 5
						// 지도의 확대 레벨
						};

						//지도를 미리 생성
						var map = new daum.maps.Map(mapContainer, mapOption);
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new daum.maps.MapTypeControl();

						// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
						// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
						map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						var zoomControl = new daum.maps.ZoomControl();
						map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
						
						
						
						//주소-좌표 변환 객체를 생성
						var geocoder = new daum.maps.services.Geocoder();
						//마커를 미리 생성
						var marker = new daum.maps.Marker({
							position : new daum.maps.LatLng(37.537187,127.005476),
							map : map
						});

						function sample5_execDaumPostcode() {
							new daum.Postcode(
									{oncomplete : function(data) {
											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var fullAddr = data.address; // 최종 주소 변수
											var extraAddr = ''; // 조합형 주소 변수

											// 기본 주소가 도로명 타입일때 조합한다.
											if (data.addressType === 'R') {
												//법정동명이 있을 경우 추가한다.
												if (data.bname !== '') {
													extraAddr += data.bname;
												}
												// 건물명이 있을 경우 추가한다.
												if (data.buildingName !== '') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
												fullAddr += (extraAddr !== '' ? ' ('
														+ extraAddr + ')'
														: '');
												
											}
											console.log(fullAddr)
											// 주소 정보를 해당 필드에 넣는다.
											document.getElementById("sample5_address").value = fullAddr;
											document.getElementById("add").value = fullAddr;
											// 주소로 좌표를 검색
											geocoder.addr2coord(data.address,function(status,result) {
																// 정상적으로 검색이 완료됐으면
																if (status === daum.maps.services.Status.OK) {
																	// 해당 주소에 대한 좌표를 받아서
																	var coords = new daum.maps.LatLng(
																			result.addr[0].lat,
																			result.addr[0].lng);
																	console.log(coords)
																	// 지도를 보여준다.
																	mapContainer.style.display = "block";
																	map.relayout();
																	// 지도 중심을 변경한다.
																	map.setCenter(coords);
																	// 마커를 결과값으로 받은 위치로 옮긴다.
																	marker.setPosition(coords);
																	document.getElementById("location").value = coords;
																	//var markerPosition  = new daum.maps.LatLng(126.8093163099, 37.7452339591); 
																	//console.log(markerPosition)
																}
															});
										}
									}).open();
						}
					</script>
					주소: <input type="text" id="add" name=cplace1> 
					상세주소: <input type="text" id="addDetail" name="cplace2">
					좌표: <input type="text" id="location" name="cLocation">
				</div>
			</div>
			<div class="section" id="section4">
				<div class="intro">
					<h1>갤러리</h1>
					<p>어떤 클래스인지 미리 볼 수 있도록 사진을 보여주세요.</p>
					<p>
						<label for="image">커버사진:</label> <input type="file" name="fileMap[0]"
							id="image" />
					</p>
					<p>
						<label for="image">갤러리1:</label> <input type="file" name="fileMap[1]"
							id="image1" />
					</p>
					<p>
						<label for="image">갤러리2:</label> <input type="file" name="fileMap[2]"
							id="image2" />
					</p>
					<p>
						<label for="image">갤러리3:</label> <input type="file" name="fileMap[3]"
							id="image3" />
					</p>

				</div>
				<div id="image_preview">
    	<b>커버사진 미리보기</b><br>
        <img src="#" id="preview" />
        <br />
        <a href="#">Remove</a>
    </div>
    <div id="image_preview1">
        <b>갤러리 1 미리보기</b>
        <img src="#" id="preview1" />
        <br />
        <a href="#">Remove</a>
    </div>
    <div id="image_preview2">
    	<b>갤러리 2 미리보기</b>
        <img src="#" id="preview2" />
        <br />
        <a href="#">Remove</a>
    </div>
    <div id="image_preview3">
    	<b>갤러리 3 미리보기</b>
        <img src="#" id="preview3" />
        <br />
        <a href="#">Remove</a>
    </div>


    <script type="text/javascript">

    $('#image').on('change', function() {
        
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#image').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#image_preview img').attr('src', blobURL);
            $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
            //$(this).slideUp(); //파일 양식 감춤
        }
    });
    $('#image1').on('change', function() {
        
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#image1').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#image_preview1 img').attr('src', blobURL);
            $('#image_preview1').slideDown(); //업로드한 이미지 미리보기 
            //$(this).slideUp(); //파일 양식 감춤
        }
    });
    $('#image2').on('change', function() {
        
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#image2').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#image_preview2 img').attr('src', blobURL);
            $('#image_preview2').slideDown(); //업로드한 이미지 미리보기 
            //$(this).slideUp(); //파일 양식 감춤
        }
    });
    $('#image3').on('change', function() {
        
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#image').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#image_preview3 img').attr('src', blobURL);
            $('#image_preview3').slideDown(); //업로드한 이미지 미리보기 
            //$(this).slideUp(); //파일 양식 감춤
        }
    });

    $('#image_preview a').bind('click', function() {
        resetFormElement($('#image')); //전달한 양식 초기화
        $('#image').slideDown(); //파일 양식 보여줌
        $(this).parent().slideUp(); //미리 보기 영역 감춤
        return false; //기본 이벤트 막음
    });
    $('#image_preview1 a').bind('click', function() {
        resetFormElement($('#image1')); //전달한 양식 초기화
        $('#image1').slideDown(); //파일 양식 보여줌
        $(this).parent().slideUp(); //미리 보기 영역 감춤
        return false; //기본 이벤트 막음
    });
    $('#image_preview2 a').bind('click', function() {
        resetFormElement($('#image2')); //전달한 양식 초기화
        $('#image2').slideDown(); //파일 양식 보여줌
        $(this).parent().slideUp(); //미리 보기 영역 감춤
        return false; //기본 이벤트 막음
    });
    $('#image_preview3 a').bind('click', function() {
        resetFormElement($('#image3')); //전달한 양식 초기화
        $('#image3').slideDown(); //파일 양식 보여줌
        $(this).parent().slideUp(); //미리 보기 영역 감춤
        return false; //기본 이벤트 막음
    });
        

    /** 
    * 폼요소 초기화 
    * Reset form element
    * 
    * @param e jQuery object
    */
    function resetFormElement(e) {
        e.wrap('<form>').closest('form').get(0).reset(); 
        //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
        //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
        //DOM에서 제공하는 초기화 메서드 reset()을 호출
        e.unwrap(); //감싼 <form> 태그를 제거
    }
    </script>
			</div>
			<div class="section " id="section5">
			스케줄줄
			<input type="submit" value="제출">
			</div>
		</div>
		
	</form>
	
	
</body>
</html>

