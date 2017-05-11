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
	<input type="hidden" name="searchKno" value="${param.searchKno }">
</form>
<section class="searchClass">
	<section class="searchDetail col-md-7" >
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
	<section class="searchMap col-md-5">
	지도지도
	</section>
</section>
<%@ include file="../inc/bottom.jsp"%>