<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>	

<script type="text/javascript">
	function pageFunc(curPage) {
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>

 <style type="text/css">
	.divList{
		margin:20px 0;
		margin-left: 50px;
		margin-right: 50px;
		font-size: 1.5em;
	}
	
	.align_center{
		text-align: center;
	}
	
	.divSearch{
		text-align:center;		
		padding:10px 0 5px 0;
		font-size: 1em;
	}	
</style>



<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" 
	action='<c:url value="/useboard/list.do"/>'>
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>

<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.searchKeyword}, 
	${pagingInfo.totalRecord}건 검색되었습니다</p>
</c:if>

<!-- 페이징 처리 form 끝 -->	

<!-- <body> -->
<!-- <h2>공지사항</h2> -->
</head>	
<br>
<br>
<div class="divList">
<h2 align="center">이용안내</h2>
	<br>
	<br>
	
	<div class="container">
	  <div class="row">
	    <div class="col-md-12"> 
	      <!-- Nav tabs -->
	      <div class="card">
	        <ul class="nav nav-tabs" role="tablist">
	          <li role="presentation" class="active"><a href="#faq"  role="tab" data-toggle="tab">  
	          <span>자주묻는 질문</span></a></li>
	          <li role="presentation"><a href="#use"  role="tab" data-toggle="tab">  
	          <span>이용 관련</span></a></li>
	          <li role="presentation"><a href="#pay"  role="tab" data-toggle="tab">  
	          <span>결제 관련</span></a></li>
	        </ul>
	        
	        <!-- Tab panes -->
	        <div class="tab-content">
	          <div role="tabpanel" class="tab-pane active" id="faq">
	          	<table class="table table-hover"
			 	summary="이용안내 게시판이며  번호, 제목, 내용, 작성자, 작성일, 조회수에 대한 정보를 제공">
			<thead>
			  <tr>
			    <th width="10%" style="text-align: center">번호</th>
			    <th width="45%" style="text-align: center">제목</th>
			    <th width="45%" style="text-align: center">내용</th>
			  </tr>
			</thead> 
			<tbody>
			  <c:if test="${empty uList}">
			  	<tr>
			  		<td colspan="3" class="align_center">
			  			데이터가 존재하지 않습니다.</td>
			  	</tr>
			  </c:if> 
			 <!--게시판 내용 반복문 시작  --> 
			  <c:forEach var="vo" items="${uList }" varStatus="status">	
				<tr  style="text-align:center">
					<td>${status.index+1}</td>
					<td>${vo.ubTitle}</td>
					<td>${vo.ubContent}</td>		
				</tr>
			  </c:forEach>	
			  <!--반복처리 끝  -->
			  </tbody>
		</table>	   
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
	          
	<div role="tabpanel" class="tab-pane" id="use">
	          
	     <table class="table table-hover"
			 	summary="이용안내 게시판이며  번호, 제목, 내용, 작성자, 작성일, 조회수에 대한 정보를 제공">
			<thead>
			  <tr>
			    <th width="10%" style="text-align: center">번호</th>
			    <th width="45%" style="text-align: center">제목</th>
			    <th width="45%" style="text-align: center">내용</th>
			  </tr>
			</thead> 
			<tbody>
			  <c:if test="${empty uList}">
			  	<tr>
			  		<td colspan="3" class="align_center">
			  			데이터가 존재하지 않습니다.</td>
			  	</tr>
			  </c:if> 
			  <!--게시판 내용 반복문 시작  -->
			  <c:forEach var="vo" items="${uList }">	
				<tr  style="text-align:center">
					<td>${vo.ubNo}</td>
					<td>${vo.ubTitle}</td>
					<td>${vo.ubContent}</td>		
				</tr>
			  </c:forEach>	
			  <!--반복처리 끝  -->
			  </tbody>
		</table>	   
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
	          
	         
	         
	<div role="tabpanel" class="tab-pane" id="pay">
	          
	          
	     <table class="table table-hover"
			 	summary="이용안내 게시판이며  번호, 제목, 내용, 작성자, 작성일, 조회수에 대한 정보를 제공">
			<thead>
			  <tr>
			    <th width="10%" style="text-align: center">번호</th>
			    <th width="45%" style="text-align: center">제목</th>
			    <th width="45%" style="text-align: center">내용</th>
			  </tr>
			</thead> 
			<tbody>
			  <c:if test="${empty uList}">
			  	<tr>
			  		<td colspan="3" class="align_center">
			  			데이터가 존재하지 않습니다.</td>
			  	</tr>
			  </c:if> 
			  <!--게시판 내용 반복문 시작  --> 
			  <c:forEach var="vo" items="${uList }" varStatus="status">	
				<tr  style="text-align:center">
					<td>${status.index+1}</td>
					<td>${vo.ubTitle}</td>
					<td>${vo.ubContent}</td>		
				</tr>
			  </c:forEach>	
			  <!--반복처리 끝  -->
			  </tbody>
		</table>	   
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
	          
</div>
</div>
</div>
</div>
</div>
</div>

			
		

<div class="divSearch">
   	<form name="frmSearch" method="post" 
   		action="<c:url value='/useboard/list.do' />" >
        <select name="searchCondition">
            <option value="ub_title" class="btn btn-default"
            	<c:if test="${'ub_title'==param.searchCondition }">
            		selected            	
            	</c:if>
            	>제목</option>
            <option value="ub_content" class="btn btn-default"
            	<c:if test="${'ub_content'==param.searchCondition }">
            		selected            	
            	</c:if>
            >내용</option>
        </select>
        
        
        <input class="btn btn-default" type="text" name="searchKeyword" title="검색어 입력" placeholder="Use Search..."
        	value="${param.searchKeyword }">
        <input class="btn btn-default" type="submit" value="검색">

		<!-- <input type="submit" value="검색"> -->
	
    </form>
</div>


<div style="text-align:right;">
    <a href="<c:url value='/useboard/write.do'/>" >이용안내</a>
</div>

	
<%@ include file="../inc/bottom.jsp" %>
</body>
</html>








