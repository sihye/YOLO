<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link href="<c:url value='/css/lightbox.css'/>" rel="stylesheet">
<script src="<c:url value='/js/lightbox.js'/>"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/mypage.css" />'>


<script>
$(document).ready(function() {
	
    //datepicker 한국어로 사용하기 위한 언어설정
    $.datepicker.setDefaults($.datepicker.regional['ko']);     
    // Datepicker            
    $(".datepicker").datepicker({
        showButtonPanel: true,
        dateFormat: "yy-mm-dd",
        onClose : function ( selectedDate ) {
        
            var eleId = $(this).attr("id");
            var optionName = "";
            if(eleId.indexOf("StartDate") > 0) {
                eleId = eleId.replace("StartDate", "EndDate");
                optionName = "minDate";
            } else {
                eleId = eleId.replace("EndDate", "StartDate");
                optionName = "maxDate";
            }
            $("#"+eleId).datepicker( "option", optionName, selectedDate );        
            $(".searchDate").find(".chkbox2").removeClass("on"); 
        }
    }); 
    //시작일.
    /*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
        // 시작일 datepicker가 닫힐때
        // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
        $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
        $(".searchDate").find(".chkbox2").removeClass("on");
    });
    */
    //종료일.
    /*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
        // 종료일 datepicker가 닫힐때
        // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
        $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
        $(".searchDate").find(".chkbox2").removeClass("on");
    });
    */
    $(".dateclick").dateclick();    // DateClick
    $(".searchDate").schDate();        // searchDate
    
});
// Search Date
jQuery.fn.schDate = function(){
    var $obj = $(this);
    var $chk = $obj.find("input[type=radio]");
    $chk.click(function(){                
        $('input:not(:checked)').parent(".chkbox2").removeClass("on");
        $('input:checked').parent(".chkbox2").addClass("on");                    
    });
};
// DateClick
jQuery.fn.dateclick = function(){
    var $obj = $(this);
    $obj.click(function(){
        $(this).parent().find("input").focus();
    });
}    
function setSearchDate(start){
    var num = start.substring(0,1);
    var str = start.substring(1,2);
    var today = new Date();
    //var year = today.getFullYear();
    //var month = today.getMonth() + 1;
    //var day = today.getDate();
    
    var endDate = $.datepicker.formatDate('yy-mm-dd', today);
    $('#searchEndDate').val(endDate);
    
    if(str == 'd'){
        today.setDate(today.getDate() - num);
    }else if (str == 'w'){
        today.setDate(today.getDate() - (num*7));
    }else if (str == 'm'){
        today.setMonth(today.getMonth() - num);
        today.setDate(today.getDate() + 1);
    }
    var startDate = $.datepicker.formatDate('yy-mm-dd', today);
    $('#searchStartDate').val(startDate);
            
    // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
    $("#searchEndDate").datepicker( "option", "minDate", startDate );
    
    // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
    $("#searchStartDate").datepicker( "option", "maxDate", endDate );
}
</script>


<script>
$(document).ready(function() {
	var typeboard = '${boardType}';
	var show ;
		if(typeboard == 'main'){
			show =0;
		}else if(typeboard == 'qna'){
			show =1;
		}else if(typeboard == 'cb'){
			show =2;
		}
	$("#tabs").tabs({
		active:show,
	});
	
	
	
});
	
	function pageFunc1(curPage){
		document.frmPage.currentPage.value=curPage;
		document.frmPage.boardtype.value='cb';
		frmPage.submit();
	}
	
</script>
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
	width:100%;
	background-size: 100% 100%;
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
.cal{
	margin-top: 5px;
}
.modal-body{
	height: 300px;
}
/*갤러리*/
.img-thumbnail{
	width: 500px;
	height: 300px;
}

</style>
<form name="frmPage" method="post"
action='<c:url value="/class/claDetail.do?cNo=${claVo.cNo }" />'>
<input type="hidden" name="currentPage"> <input type="hidden"
name="searchCondition" value="${param.searchCondition }"> <input
type="hidden" name="searchKeyword" value="${param.searchKeyword}">
<input type="hidden" name="searchStartDate"
value="${param.searchStartDate}"> <input type="hidden"
name="searchEndDate" value="${param.searchEndDate}">
<input type="hidden" name="boardtype" id="boardtype">
</form>
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
<button type="button" class="btn btn-lg" id="booking" data-toggle="modal" data-target="#myModal1" style="text-align: right;">
  예약하기
</button>

<!-- Modal -->
<form action="<c:url value='/class/booking.do?cNo=${claVo.cNo }'/>" method="post" name="bookingFrm" id="bookingFrm">
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"
      aria-label="Close" aria-hidden="true">×</button>
        
        <h4 class="modal-title" id="myModalLabel" style="color: black;">예약하기</h4>
      </div>
      <div class="modal-body" style="height: 150px;" >
      <h4 class="modal-title" id="myModalLabel" style="color: black;">${claVo.cName}</h4>
      <%-- <h3 style="color: black;">${kName}</h3> --%>
      	<img alt="클릭해서 날짜 선택" src="<c:url value='/images/Time-And-Date-Calendar-icon.png'/>" align="left" class="cal" style="width: 20px;">
      	<div class="col-xs-5">    	
			<select class="form-control" id="dateSel">
				  <option>클릭해서 날짜 선택하기</option>
				  <c:forEach var="day" items="${dayslist}">
				  	<option value="${day}">${day}</option>
				  </c:forEach>
	      	</select>
	      	
      	</div>
      	<div class="col-xs-5">
      		<select class="form-control" id="timeSel">
      			<option>클릭해서 시간 선택하기</option>
      			<c:if test="${! empty sch.scStarttime1 }">
      				<option value="${sch.scStarttime1 }~${sch.scEndtime1 }">${sch.scStarttime1 }~${sch.scEndtime1 }</option>
      			</c:if>
      			<c:if test="${! empty sch.scStarttime2 }">
      				<option value="${sch.scStarttime2 }~${sch.scEndtime2 }">${sch.scStarttime2 }~${sch.scEndtime2 }</option>
      			</c:if>
      			<c:if test="${! empty sch.scStarttime3 }">
      				<option value="${sch.scStarttime3 }~${sch.scEndtime3 }">${sch.scStarttime3 }~${sch.scEndtime3 }</option>
      			</c:if>
      		</select>
      	</div>
      	
      </div>
		
      <div class="modal-footer">
      	<input type="text" name="bkBdate" id="bkBdate"  style="color: black;">
      	<input type="text" name="bkTime" id="bkTime" style="color: black;">
      	<input type="text"  name="scNo" id="scNo"  style="color: black;">
      	<button type="submit" class="btn btn-default" id="pay">예약하기</button>
        <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
        
      </div>
    </div>
  </div>
</div>
</form>
<script type="text/javascript">
			$(function(){
				$("#booking").click(function(){
					console.log("펑션들어옴")
					console.log(${sch.scNo})
					$("#scNo").val(${sch.scNo});
					$("#dateSel").change(function(){
						var selDate=$("#dateSel").val();
						$("#bkBdate").val(selDate);
						console.log(selDate);
					})
					$("#timeSel").change(function(){
						$("#bkTime").val($("#timeSel").val())
					})
				})
			
			})
</script>
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
  	<%-- <c:import url="/class/classqna.do"></c:import> --%>
  </div>
   <div id="tabs-3" >
  	<!-- 후기 -->
  	<div class="col-md-10">
	<br>
	<h2>후기</h2>
	<br>
	<form>
		<!-- search -->
		<table class="searchBox">
			<caption>조회</caption>
			<colgroup>
				<col width="123px">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>조회기간</th>
					<td>
						<ul class="searchDate">
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType1" onclick="setSearchDate('0d')" />
									<label for="dateType1">당일</label>
							</span></li>
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType2" onclick="setSearchDate('3d')" />
									<label for="dateType2">3일</label>
							</span></li>
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType3" onclick="setSearchDate('1w')" />
									<label for="dateType3">1주</label>
							</span></li>
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType4" onclick="setSearchDate('2w')" />
									<label for="dateType4">2주</label>
							</span></li>
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType5" onclick="setSearchDate('1m')" />
									<label for="dateType5">1개월</label>
							</span></li>
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType6" onclick="setSearchDate('3m')" />
									<label for="dateType6">3개월</label>
							</span></li>
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType7" onclick="setSearchDate('6m')" />
									<label for="dateType7">6개월</label>
							</span></li>
						</ul>

						<div class="clearfix">
							<!-- 시작일 -->
							<span class="dset"> <input type="text"
								class="datepicker inpType" name="searchStartDate"
								id="searchStartDate">
							</span> <span class="demi">~</span>
							<!-- 종료일 -->
							<span class="dset"> <input type="text"
								class="datepicker inpType" name="searchEndDate"
								id="searchEndDate">
							</span>
						</div>
						<div class="search1" style="margin-top: 10px;">
							<select class="selec" id="searchCondition" name="searchCondition"><option
									selected="selected" value="M_USERID">ID</option>
								<option value="CB_TITLE">제목</option>
								<option value="CB_CONTENT">내용</option>
							</select> <input class="txt" id="searchKeyword" name="searchKeyword"
								type="text" /> <input type="submit" value="조회하기">
						</div>
					</td>
				</tr>
			<tbody>
		</table>
	</form>
	<br>
	<!-- //기간별조회 -->
	<table class="table table-hover">
		<thead>
			<tr style="background: skyblue">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty claBoardList }">
			<tr>
				<td colspan="5" style="text-align: center;"><span>등록되어 있는 후기가 없습니다!</span></td>
			</tr>
			</c:if>
			<c:if test="${!empty claBoardList }">
			<c:forEach var="list" items="${claBoardList }">
				<tr>
					<td>${list.cbNo }</td>
					<td><a href='#'>${list.cbTitle }</a></td>
					<td>${list.mUserid }</td>
					<td><fmt:formatDate value="${list.cbRegdate }" pattern="yyyy-MM-dd"/></td>
					<td>${list.cbReadcount }</td>
				</tr>
			</c:forEach>
			</c:if>
		</tbody>
	</table>
	<div class="divList">
	<div class="divPage" style="text-align: center">
	<!-- 페이지 번호 추가 -->
	<!-- 이전 블럭으로 이동 ◀-->
	<nav>
		<ul class="pagination">
			<c:if test="${pagingInfo.firstPage>1 }">
				<li><a href="#" aria-label="Previous" 
				onclick="pageFunc1(${pagingInfo.firstPage-1})">
				<span aria-hidden="true">&laquo;</span></a></li>
			</c:if>

			<c:forEach var="i" begin="${pagingInfo.firstPage }"
				end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
					<li class="active"><a href="#"> ${i}<span class="sr-only">${i }</span></a></li>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<li><a href="#" onclick="pageFunc1(${i})">${i}</a></li>
				</c:if>
			</c:forEach>

			<!-- 다음 블럭으로 이동 ▶-->
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
				<li><a href="#" aria-label="Previous" 
				onclick="pageFunc1(${pagingInfo.lastPage+1})">
				<span aria-hidden="true">&raquo;</span></a></li>			
			</c:if>

			<!--  페이지 번호 끝 -->
		</ul>
	</nav>
</div>
</div>
	
	
	
</div>
  	
  </div>
</div>

 





	<%@ include file="../inc/bottom.jsp"%>