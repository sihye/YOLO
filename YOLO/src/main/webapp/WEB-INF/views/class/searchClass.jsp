<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style>
.searchClass{	
	background-color: #f5f5f5;
}
.searchDetail{
	background-color: #f5f5f5;
	padding-top: 15px;
}
.condition{
	background-color: white;
	padding: 10px
	
}
.searchMap{
	background-color: #f5f5f5;
	padding-top: 15px;
}
footer{
	clear: both;
}
</style>
<style>
body{
	position: fixed; 
	overflow-y: scroll;
	width: 100%;
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$( function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 1000000,
      values: [ 0,1000000 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( ui.values[ 0 ] + "원 - " + ui.values[ 1 ]+"원" );
        $( "#searchStartPrice" ).val(ui.values[ 0 ])
        $( "#searchEndPrice" ).val(ui.values[ 1 ])
      }
    });
    $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) +
      "원 - " + $( "#slider-range" ).slider( "values", 1 )+"원" );
  });
  
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	frmPage.submit();
}
</script>
<form name="frmPage" method="post"
	action='<c:url value="/class/searchClass.do" />'>
	<input type="hidden" name="currentPage">  <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchplace" id="searchplace" value="${param.searchplace}">
	<input type="hidden" name="searchStartPrice" value="${param.searchStartPrice}">
	<input type="hidden" name="searchEndPrice" value="${param.searchEndPrice}">
	<input type="hidden" name="searchKno" value="${searchclassVo.searchKno }">
</form>
<section class="searchClass">
	<section class="searchDetail col-md-7" style="overflow-y:scroll; height:830px">
		<form action="" class="" id="" method="post">
			<div class="condition">
		 	   <input type="text" name="searchKeyword" class="form-control" placeholder="키워드" value="${param.searchKeyword}">
			</div>
			<div class="condition">
				 <input type="text" name="searchplace" class="form-control" placeholder="장소" value="${param.searchplace}">
			</div>
			<div class="condition">
				<select id="searchKno" class="form-control" name="searchKno">
					<option value="0" style="color:#afafaf ">카테고리를 선택하세요</option>
					<c:forEach var="cateG" items="${gCateList }">
						<optgroup label="${cateG.kgName}">::${cateG.kgName}::
						</optgroup>
						<c:forEach var="cageVO" items="${cateList }">
							<c:if test="${cateG.kgNo==cageVO.kgNo}">
								<option value="${cageVO.kNo}"
								<c:if test="${cageVO.kNo==param.searchKno}">
									selected="selected"
								</c:if>
								>${cageVO.kName}</option>
							</c:if>
						</c:forEach>
					</c:forEach>
				</select>
			</div>
			<div class="condition">
				<p>
				  <label for="amount" style="color: #afafaf">Price range:</label>
				  <input type="text" id="amount" readonly style="border:0; color:#95badf; font-weight:bold;">
				</p>
	 
	<div id="slider-range"></div>
	<input type="hidden" name="searchStartPrice" id="searchStartPrice">
	<input type="hidden" name="searchEndPrice" id="searchEndPrice">
			</div>
			<button type="submit" class="btn btn-primary btn-lg btn-block">검색</button>
		</form>
		<section class="listings">
		<div class="wrapper">
			<ul class="properties_list">
			<c:forEach var="map" items="${classList }">
				<li>
					<a href="<c:url value='/class/claDetail.do?cNo=${map["C_NO"] }' />">
						<img src="<c:url value='/upload/${map["C_MAINIMG"] }' />" alt="" title="" width="100%" height="250px"/>
					</a>
					<span class="price"><fmt:formatNumber value="${map['C_PRICE'] }" />원</span>
					<div class="property_details">
						<h1>
							${map["C_NAME"] }
						</h1>
						<c:set var="arr" value="${fn:split(map['C_PLACE'],'(') }" />
						<h2><c:out value="${arr[0]}"/><br>(<c:out value="${arr[1]}"/></h2>
						<h2 style="text-align: right;">
											<i class="fa fa-eye " aria-hidden="true"></i>${map["C_HITS"]}
											<i class="fa fa-heart-o" aria-hidden="true"></i>
											<span class="property_size">${map["FCOUNT"] }</span>
						</h2>

						
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
	</section>	<!--  end listing section  -->
	<div class="divList">
	<div class="divPage" style="text-align: center">
	<!-- 페이지 번호 추가 -->
	<!-- 이전 블럭으로 이동 ◀-->
	<nav>
		<ul class="pagination">
			<c:if test="${pagingInfo.firstPage>1 }">
				<li><a href="#" aria-label="Previous" 
				onclick="pageFunc(${pagingInfo.firstPage-1})">
				<span aria-hidden="true">&laquo;</span></a></li>
			</c:if>

			<c:forEach var="i" begin="${pagingInfo.firstPage }"
				end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
					<li class="active"><a href="#"> ${i}<span class="sr-only">${i }</span></a></li>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<li><a href="#" onclick="pageFunc(${i})">${i}</a></li>
				</c:if>
			</c:forEach>

			<!-- 다음 블럭으로 이동 ▶-->
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
				<li><a href="#" aria-label="Previous" 
				onclick="pageFunc(${pagingInfo.lastPage+1})">
				<span aria-hidden="true">&raquo;</span></a></li>			
			</c:if>

			<!--  페이지 번호 끝 -->
		</ul>
	</nav>
</div>

	
	</section>
	<section class="searchMap col-md-5" style=height:830px;">
<div id="map" style="width:100%;height:830px;"></div>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=ae9a8f33df751fe70e8df23049bf7573&libraries=services"></script>
<script>
    var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
        level : 13 // 지도의 확대 레벨 
    });
    
    // 마커 클러스터러를 생성합니다 
    // 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
    // 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다 
    // 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
    // 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다 
    var clusterer = new daum.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10, // 클러스터 할 최소 지도 레벨 
        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다 
    });
 
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    $.get("/download/web/data/chicken.json", function(data) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        var markers = $(data.positions).map(function(i, position) {
            return new daum.maps.Marker({
                position : new daum.maps.LatLng(position.lat, position.lng)
            });
        });

        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
    });

    // 마커 클러스터러에 클릭이벤트를 등록합니다 
    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우 
    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다 
    daum.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

        // 현재 지도 레벨에서 1레벨 확대한 레벨 
        var level = map.getLevel()-1;

        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다 
        map.setLevel(level, {anchor: cluster.getCenter()});  
    });
</script>
	</section>
</section>
