<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>::YOLO - 클래스 수정하기::</title>
<meta name="Resource-type" content="Document" />


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/examples.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- 시간선택 -->
<script
	src="${pageContext.request.contextPath}/js/jquery.clockpick.1.2.9.js"></script>
<link rel="stylesheet"
	href="<c:url value='/css/jquery.clockpick.1.2.9.css'/>" type="text/css">


<script type="text/javascript">
	$(function(){
		var st1=$("#scStarttime1").val();
		var et1=$("#scEndtime1").val();
		var st2=$("#scStarttime2").val();
		var et2=$("#scEndtime2").val();
		var st3=$("#scStarttime3").val();
		var et3=$("#scEndtime3").val();
		
		$("#claCre").submit(function(){
			if($("#cName").val()==''){
				alert("클래스명을 입력해주세요!");
				$("#cName").focus();
				return false;
			}else if($("#kNo").val()==0){
				alert("대표 카테고리를 선택해주세요!");
				$("#kNo").focus();
				return false;
			}else if($("#cPaymentway").val()==0){
				alert("결제 방법을 선택해주세요!");
				$("#cPaymentway").focus();
				return false;
			}else if($("#cPrice").val()==''){
				alert("비용을 입력해주세요!");
				$("#cPrice").focus();
				return false;
			}else if($("#cTarget").val()==0){
				alert("대상을 선택해주세요!");
				$("#cTarget").focus();
				return false;
			}else if($("#cTarget").val()=='etc'){
				if($("#cTargetEtc").val()==""){
					alert("대상을 입력해주세요!");
					$("#cTargetEtc").focus();
					return false;
				}else{
					$("#cTargetEtc").atter("name","cTarget");
					$("#cTarget").atter("name","");
					return true;
				}
			}else if($("#cMaxperson").val()==''){
				alert("최대 인원을 입력해주세요!");
				$("#cMaxperson").focus();
				return false;
			}else if($("#add").val()==''){
				alert("주소를 입력해주세요!");
				$("#add").focus();
				return false;
			}else if($("#addDetail").val()==''){
				alert("상세주소를 입력해주세요!");
				$("#addDetail").focus();
				return false;
			}else if($("#image").val()==''){
				alert("메인 사진은 꼭 등록해야 합니다!");
				$("#image").focus();
				return false;
			}
		})
		
	})
</script>

<style>
.section {
	height: 900px;
	margin-top: 50px;
}

#image_preview {
	display: none;
}

#image_preview1 {
	display: none;
}

#image_preview2 {
	display: none;
}

#image_preview3 {
	display: none;
}

#preview div {
	float: left;
	width: 300px;
	height: 500px;
	margin: 10px;
}

#map {
	margin: 0 auto;
}

.preImg {
	width: 300px;
	height: 450px;
}

.form-control {
	margin-bottom: 10px;
}

h1 {
	border-bottom: 3px solid #F2F2F2;
	padding-bottom: 5px;
}

body {
	background-image: url("<c:url value='/img/images.jpg'/>");
	background-repeat: no-repeat;
	background-size: cover;
}
#single{
	margin-left: 1060px;
    margin-top: 20px;
}
.before{
	margin-left: 1000px;
}
</style>
</head>
<body>

	<!-- <ul id="menu">
		<li data-menuanchor="firstPage" class="active"><a
			href="#section0">클래스 기본정보 등록</a></li>
		<li data-menuanchor="secondPage"><a href="#section1">주소 등록</a></li>
		<li data-menuanchor="3rdPage"><a href="#section2">클래스 갤러리 등록</a></li>
		<li data-menuanchor="4thpage"><a href="#section3">클래스 스케줄 등록</a></li>
	</ul> -->
	<form action="<c:url value="/class/edit.do"/>"
		enctype="multipart/form-data" method="post" id="claCre" name="claCre">

		<div id="fullpage">
			<div class="section container" id="section0">
				<h1>01. 클래스 기본정보</h1>
				<br>
				<div class="form-group">
					<label for="cName" class="col-sm-2 control-label">클래스
						이름 </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="cName"
							name="cName" placeholder="Class Name" value="${vo.cName }">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">클래스
						카테고리 </label>
					<div class="col-sm-10">
						<!-- 카테고리 셀렉트 -->
						<select class="form-control" name="kNo" id="kNo">
							<option value="0">카테고리를 선택하세요.</option>
							<c:forEach var="cateG" items="${gCateList }">
								<optgroup label="${cateG.kgName}">::${cateG.kgName}::
								</optgroup>
								<c:forEach var="cageVO" items="${cateList }">
									<c:if test="${cateG.kgNo==cageVO.kgNo }">
										<option value="${cageVO.kNo}">${cageVO.kName}</option>
									</c:if>
								</c:forEach>
							</c:forEach>
						</select>
						<!-- 카테고리 셀렉트 끝 -->
					</div>
				</div>
				<div class="form-group">
					<label for="cPaymentway" class="col-sm-2 control-label">결제
						방법</label>
					<div class="col-sm-10">
						<select class="form-control" name="cPaymentway" id="cPaymentway">
							<option value="0">결제 방법을 선택하세요.</option>
							<option value="현장">현장 결제</option>
							<option value="온라인">온라인 결제</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="cPrice" class="col-sm-2 control-label">비용
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="cPrice"
							name="cPrice" placeholder="0원 입력시 협의" value="${vo.cPrice}">
					</div>
				</div>
				<div class="form-group">
					<label for="cTarget" class="col-sm-2 control-label">대상
					</label>
					<div class="col-sm-10">
						<select class="form-control" name="cTarget" id="cTarget">
							<option value="0">클래스 대상을 선택하세요.</option>
							<option value="학생">학생</option>
							<option value="직장인">직장인</option>
							<option value="누구나">누구나</option>
							<option value="etc">기타</option>						
						</select>
						<script type="text/javascript">
							$(function(){
								$("#cTarget").change(function(){
									if($("#cTarget").val()=='etc'){
										$("#cTargetEtc").show();
										$("#cTargetEtc").focus();								
									}else{
										$("#cTargetEtc").hide();
										$("#cTargetEtc").val("");
									}
								})
								
							})
						</script>
						<input type="text" class="form-control" id="cTargetEtc"
							name="" placeholder="" style="display: none;">
					</div>
				</div>
				<div class="form-group">
					<label for="cSpevialty" class="col-sm-2 control-label">특기사항
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="cSpevialty"
							name="cSpevialty" placeholder="" value="${vo.cSpevialty}">
					</div>
				</div>
				<div class="form-group">
					<label for="cMaxperson" class="col-sm-2 control-label">최대
						인원 </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="cMaxperson"
							name="cMaxperson" placeholder="" value="${vo.cMaxperson}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">목표
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="cGoal"
							name="cGoal" placeholder="" value="${vo.cGoal}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">상세설명
					</label>
					<div class="col-sm-10">
						<textarea id="introContents" class="form-control" 
							name="cDetailinfo" rows="10"
							placeholder="
						• 강사님을 소개해주세요.(이력, 자기소개 등).
						• 커리큘럼, 경력, 장점을 표현해주세요.
						• 회원님의 모꼬지의 대해 설명해주세요.
						• 비교 선택시 중요한 정보입니다.">${vo.cDetailinfo}</textarea>
					</div>
				</div>
				<a class="btn btn-default" id="single" href="#section1">다음</a>
			</div>
			
			<div class="section container" id="section1">
				<div class="intro">
					<h1>02. 클래스 주소 등록</h1>
					<br>
					<div class="form-group">
						<input type="text" id="sample5_address" placeholder="주소" value="${vo.cPlace}">
						<input type="button" class="btn btn-default btn-lg btn-block" id="cPlace"
							onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
						<div id="map"
							style="width: 80%; height: 500px; margin-top: 10px; display: none"></div>

						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script
							src="//apis.daum.net/maps/maps3.js?apikey=ae9a8f33df751fe70e8df23049bf7573&libraries=services"></script>
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div
							mapOption = {
								center : new daum.maps.LatLng(37.537187,
										127.005476), // 지도의 중심좌표
								level : 5
							// 지도의 확대 레벨
							};

							//지도를 미리 생성
							var map = new daum.maps.Map(mapContainer, mapOption);
							// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
							var mapTypeControl = new daum.maps.MapTypeControl();

							// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
							// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
							map.addControl(mapTypeControl,
									daum.maps.ControlPosition.TOPRIGHT);

							// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
							var zoomControl = new daum.maps.ZoomControl();
							map.addControl(zoomControl,
									daum.maps.ControlPosition.RIGHT);

							//주소-좌표 변환 객체를 생성
							var geocoder = new daum.maps.services.Geocoder();
							//마커를 미리 생성
							var marker = new daum.maps.Marker({
								position : new daum.maps.LatLng(37.537187,
										127.005476),
								map : map
							});

							function sample5_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
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
												document
														.getElementById("sample5_address").value = fullAddr;
												document.getElementById("add").value = fullAddr;
												// 주소로 좌표를 검색
												geocoder
														.addr2coord(
																data.address,
																function(
																		status,
																		result) {
																	// 정상적으로 검색이 완료됐으면
																	if (status === daum.maps.services.Status.OK) {
																		// 해당 주소에 대한 좌표를 받아서
																		var coords = new daum.maps.LatLng(
																				result.addr[0].lat,
																				result.addr[0].lng);
																		console
																				.log(coords)
																		// 지도를 보여준다.
																		mapContainer.style.display = "block";
																		map
																				.relayout();
																		// 지도 중심을 변경한다.
																		map
																				.setCenter(coords);
																		// 마커를 결과값으로 받은 위치로 옮긴다.
																		marker
																				.setPosition(coords);
																		document
																				.getElementById("location").value = coords;
																		//var markerPosition  = new daum.maps.LatLng(126.8093163099, 37.7452339591); 
																		//console.log(markerPosition)
																	}
																});
											}
										}).open();
							}
						</script>
						<label for="inputEmail3" class="col-sm-2 control-label">주소</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="add" name="cPlace" value="${vo.cPlace}">
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">상세주소</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="addDetail"
								name="cplacedetail" value="${vo.cplacedetail}">
						</div>
						좌표: <input type="text" id="location" name="cCoordinate" value="${vo.cCoordinate}">
					</div>

				</div>
				<a class="btn btn-default before" href="#section0">이전</a>
				<a class="btn btn-default" href="#section2">다음</a>
			</div>
			

			<div class="section">
				<div class="intro container" id="section2">
					<h1>03. 갤러리 등록하기</h1>
					<p>
						<label for="image">커버사진:</label> <input type="file"
							name="fileMap[0]" id="image" />
					</p>
					<p>
						<label for="image">갤러리1:</label> <input type="file"
							name="fileMap[1]" id="image1" />
					</p>
					<p>
						<label for="image">갤러리2:</label> <input type="file"
							name="fileMap[2]" id="image2" />
					</p>
					<p>
						<label for="image">갤러리3:</label> <input type="file"
							name="fileMap[3]" id="image3" />
					</p>

				</div>
				<div id="preview">
					<div id="image_preview" style="margin-left: 350px;">
						<b>커버사진 미리보기</b><br> <img src="#" id="preview" class="preImg" />
						<br /> <a href="#">Remove</a>
					</div>
					<div id="image_preview1">
						<b>갤러리 1 미리보기</b> <img src="#" id="preview1" class="preImg" /> <br />
						<a href="#">Remove</a>
					</div>
					<div id="image_preview2">
						<b>갤러리 2 미리보기</b> <img src="#" id="preview2" class="preImg" /> <br />
						<a href="#">Remove</a>
					</div>
					<div id="image_preview3">
						<b>갤러리 3 미리보기</b> <img src="#" id="preview3" class="preImg" /> <br />
						<a href="#">Remove</a>
					</div>
				</div>


				<script type="text/javascript">
					$('#image').on('change',function() {
										ext = $(this).val().split('.').pop().toLowerCase(); //확장자

										//배열에 추출한 확장자가 존재하는지 체크
										if ($.inArray(ext, [ 'gif', 'png',
												'jpg', 'jpeg' ]) == -1) {
											resetFormElement($(this)); //폼 초기화
											window
													.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
										} else {
											file = $('#image').prop("files")[0];
											blobURL = window.URL
													.createObjectURL(file);
											$('#image_preview img').attr('src',
													blobURL);
											$('#image_preview').slideDown(); //업로드한 이미지 미리보기 
											//$(this).slideUp(); //파일 양식 감춤
										}
									});
					$('#image1').on('change',function() {
										ext = $(this).val().split('.').pop()
												.toLowerCase(); //확장자

										//배열에 추출한 확장자가 존재하는지 체크
										if ($.inArray(ext, [ 'gif', 'png',
												'jpg', 'jpeg' ]) == -1) {
											resetFormElement($(this)); //폼 초기화
											window
													.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
										} else {
											file = $('#image1').prop("files")[0];
											blobURL = window.URL
													.createObjectURL(file);
											$('#image_preview1 img').attr(
													'src', blobURL);
											$('#image_preview1').slideDown(); //업로드한 이미지 미리보기 
											//$(this).slideUp(); //파일 양식 감춤
										}
									});
					$('#image2').on('change',function() {
										ext = $(this).val().split('.').pop()
												.toLowerCase(); //확장자

										//배열에 추출한 확장자가 존재하는지 체크
										if ($.inArray(ext, [ 'gif', 'png',
												'jpg', 'jpeg' ]) == -1) {
											resetFormElement($(this)); //폼 초기화
											window
													.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
										} else {
											file = $('#image2').prop("files")[0];
											blobURL = window.URL
													.createObjectURL(file);
											$('#image_preview2 img').attr(
													'src', blobURL);
											$('#image_preview2').slideDown(); //업로드한 이미지 미리보기 
											//$(this).slideUp(); //파일 양식 감춤
										}
									});
					$('#image3').on('change',function() {
										ext = $(this).val().split('.').pop()
												.toLowerCase(); //확장자
										//배열에 추출한 확장자가 존재하는지 체크
										if ($.inArray(ext, [ 'gif', 'png',
												'jpg', 'jpeg' ]) == -1) {
											resetFormElement($(this)); //폼 초기화
											window
													.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
										} else {
											file = $('#image3').prop("files")[0];
											blobURL = window.URL
													.createObjectURL(file);
											$('#image_preview3 img').attr(
													'src', blobURL);
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
				<a class="btn btn-default before" href="#section1">이전</a>
			<a class="btn btn-default" href="#section3">다음</a>
			</div>
			
			<input type="submit" id="classSub" name="classSub" class="btn btn-info" value="수정완료">
		</div>
	</form>


</body>
</html>	