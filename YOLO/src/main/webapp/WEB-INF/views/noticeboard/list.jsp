<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="boardtop.jsp" %>			

<script type="text/javascript">
	function pageFunc(curPage) {
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>

<!-- 페이징 처리를 위한 form 시작-->
		<form name="frmPage" method="post"
			action='<c:url value="/noticeboard/list.do"/>'>
			<input type="hidden" name="currentPage"> <input type="hidden"
				name="searchCondition" value="${param.searchCondition }"> <input
				type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		</form>
<%-- <c:if test="${!empty param.searchKeyword }">
<p>검색어 : ${param.searchKeyword}, 
${pagingInfo.totalRecord}건 검색되었습니다</p>
	</c:if> --%>	

<div class="col-md-10">
	<div class="container">
	<div class="col-md-2" align="left"></div>
	<h2>공지사항</h2>	
	<div class="col-md-10">
		
		<table class="table table-hover"
		 	summary="공지사항 게시판이며  번호, 제목, 내용, 작성자, 작성일, 조회수에 대한 정보를 제공">
		
		<thead>
		  <tr style="background: skyblue">
		    <th width="10%" style="text-align: center;">번호</th>
		    <th width="30%" style="text-align: center;">제목</th>
		    <th width="40%" style="text-align: center;">내용</th>
		    <th width="10%" style="text-align: center;">작성일</th>
		    <th width="10%" style="text-align: center;">조회수</th>
		  </tr>
		</thead> 
		<tbody>
		  <c:if test="${empty nList}">
		  	<tr>
		  		<td colspan="6" class="align_center">
		  			데이터가 존재하지 않습니다.</td>
		  	</tr>
		  </c:if> 
		  <!--게시판 내용 반복문 시작  -->
		  <c:forEach var="vo" items="${nList }">	
			<tr  style="text-align:center">
				<td>${vo.nbNo}</td>
				<%-- <td>
					<a href
					='<c:url value="/noticeboard/updateCount.do?no=${vo.nbNo}"/>'>${vo.nbTitle}</a>
				</td> --%>
			   	<td>
				<!-- 제목이 긴 경우 일부만 보여주기 -->
					<a href
					='<c:url value="/noticeboard/updateCount.do?no=${vo.nbNo}"/>'>
						<c:if test="${fn:length(vo.nbTitle)>30 }">
							${fn:substring(vo.nbTitle, 0, 30) }...
						</c:if>
						<c:if test="${fn:length(vo.nbTitle)<=30 }">
							${vo.nbTitle}
						</c:if>
					</a>	
				</td>
				<td style="text-align: left;">
					<c:if test="${fn:length(vo.nbContent)>50 }">
						${fn:substring(vo.nbContent, 0, 50) }
					</c:if>
					<c:if test="${fn:length(vo.nbTitle)<=30 }">
							${vo.nbTitle}
					</c:if>
				</td>
				
					
				<td><fmt:formatDate value="${vo.nbRegdate}" pattern="yyyy-MM-dd"/> </td>
				<td>${vo.nbReadcount}</td>		
			</tr>
		  </c:forEach>	
		  <!--반복처리 끝  -->
		  </tbody>
	</table>	   
	</div>
	<div class="col-md-8">
	<div align="left" class="col-md-2"></div>
	<div class="divPage" style="text-align: center" >
		<!-- 페이지 번호 추가 -->
		<!-- 이전 블럭으로 이동 ◀-->
		<div class="col-md-10">
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

<div class="col-md-10">
	<div class="col-md-2" align="left"></div>
		<div class="col-md-10">
	   	<form name="frmSearch" method="post" align="center"
	   		action="<c:url value='/noticeboard/list.do' />" >
	        <select name="searchCondition" class="btn btn-default"><!-- ${vo.nbTitle} -->
	            <option value="nb_title"
	            	<c:if test="${'nb_title'==param.searchCondition }">
	            		selected            	
	            	</c:if>
	            	>제목</option><!-- ${vo.nbContent} -->
	            <option value="nb_content"
	            	<c:if test="${'nb_content'==param.searchCondition }">
	            		selected            	
	            	</c:if>
	            >내용</option><!-- ${vo.mUserid} -->
	         <%--    <option value="m_userid" 
	            	<c:if test="${'m_userid'==param.searchCondition }">
	            		selected            	
	            	</c:if>
	            >작성자</option>--%>
	        </select>  
	        <%-- searchCondition option 제거함 --%>
	        <input class="btn btn-default" type="text" name="searchKeyword" title="검색어 입력" placeholder="Notice Search..."
	        	value="${param.searchKeyword }">
	        <input class="btn btn-primary" type="submit" value="검색">
	
			<!-- <input type="submit" value="검색"> -->

				<div style="text-align: right;">
					<a href="<c:url value='/noticeboard/write.do'/>">공지사항추가</a>
				</div>
			</form>
	</div>
</div>

</div>
	

<br><br>
<%@ include file="boardbottom.jsp" %>
</body>
</html>








