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
      }
    });
    $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) +
      "원 - " + $( "#slider-range" ).slider( "values", 1 )+"원" );
  } );
</script>
<section class="searchClass">
	<section class="searchDetail col-md-7" >
		<form action="" class="" id="" method="post">
			<div class="condition">
		 	   <input type="text" class="form-control" placeholder="키워드">
			</div>
			<div class="condition">
				 <input type="text" class="form-control" placeholder="장소">
			</div>
			<div class="condition">
				<select class="form-control" name="kNo">
					<option value="0" style="color:#afafaf ">카테고리를 선택하세요</option>
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
			</div>
			<div class="condition">
				<p>
				  <label for="amount" style="color: #afafaf">Price range:</label>
				  <input type="text" id="amount" readonly style="border:0; color:#95badf; font-weight:bold;">
				</p>
	 
	<div id="slider-range"></div>
			</div>
		</form>
		<div>
		<p>검색결과</p>
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
		</div>
	</section>
	<section class="searchMap col-md-5">
	지도지도
	</section>
</section>
<%@ include file="../inc/bottom.jsp"%>