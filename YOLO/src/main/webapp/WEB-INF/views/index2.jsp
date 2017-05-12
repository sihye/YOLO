<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		$('.flexslider').flexslider({
			animation : "slide"
		});

	});
	function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	var cno=document.frmPage.searchKno.value;
	if(cno==""){
		cno=0; 
		document.frmPage.searchKno.value=cno;
	}
	
	frmPage.submit();
	}
	function bannerFunc(curKno){
		document.frmPage.searchKno.value=curKno;
		document.frmPage.currentPage.value=1;
		frmPage.submit();	
	}

</script>

<!-- 페이징 처리를 위한 form 태그 -->
<form name="frmPage" method="post"
	action='<c:url value="/index2.do" />'>
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchCondition" value="${param.searchCondition }"> <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchStartDate"
		value="${param.searchStartDate}"> <input type="hidden"
		name="searchEndDate" value="${param.searchEndDate}">
	<input type="hidden" name="searchKno" value="${param.searchKno }">
</form>


<section class="caption">
	<div class="flexslider">
		<ul class="slides">
		<c:forEach var="map" items="${bList }">
			<li><a href="#" onclick="bannerFunc(${map['K_NO']})"><img style="height: 400PX;"
				src="${pageContext.request.contextPath}/upload/${map['F_FILENAME'] }" alt="${map['K_NAME'] }"></a></li>
		</c:forEach>
		</ul>
	</div>
</section>
</section><!-- 이거 지우지마세요 탑이랑 연결됨 end hero section  -->


	<section class="search">
		<div class="wrapper" ID="SEARCHDIV">
			<form action="<c:url value='/class/searchClass.do'/>" method="post" name="searchClass" id="searchClass">
				<input type="text" id="search" name="searchKeyword" placeholder="What are you looking for?"  autocomplete="off"/>
				<input type="submit" id="submit_search" name="submit_search"/>
			</form>
			<!-- <a href="#" class="advanced_search_icon" id="advanced_search_btn"></a> -->
		</div>

		<div class="advanced_search">
			<div class="wrapper">
				<!-- <span class="arrow"></span> -->
				<!-- <form action="#" method="post">
					<div class="search_fields">
						<input type="text" class="float" id="check_in_date" name="check_in_date" placeholder="Check In Date"  autocomplete="off">

						<hr class="field_sep float"/>

						<input type="text" class="float" id="check_out_date" name="check_out_date" placeholder="Check Out Date"  autocomplete="off">
					</div>
					<div class="search_fields">
						<input type="text" class="float" id="min_price" name="min_price" placeholder="Min. Price"  autocomplete="off">

						<hr class="field_sep float"/>

						<input type="text" class="float" id="max_price" name="max_price" placeholder="Max. price"  autocomplete="off">
					</div>
					<input type="text" id="keywords" name="keywords" placeholder="Keywords"  autocomplete="off">
					<input type="submit" id="submit_search" name="submit_search"/>
				</form> -->
			</div>
		</div><!--  end advanced search section  -->
	</section><!--  end search section  -->
	<div class="container">
		<div class="col-md-2"></div>   
		<%-- <div class="dropdown">
			<ul class="nav nav-pills">
				<c:forEach var="gvo" items="${gList}">
				<li class="dropdown col-md-2"><a data-toggle="dropdown"
					href="#">${gvo.kgName}<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">						
						<c:forEach var="cvo" items="${cList}">
							<c:if test="${gvo.kgNo== cvo.kgNo}">
							<li><a role="menuitem" href="#">${cvo.kName }</a></li></c:if>
						</c:forEach>
					</ul>
				</li>
				</c:forEach>
			</ul>
		</div> --%>
		<div class="col-md-2"></div>
	</div>
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
</div>
<%@ include file="inc/bottom.jsp" %>

