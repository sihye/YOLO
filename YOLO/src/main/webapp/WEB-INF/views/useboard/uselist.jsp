<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="boardtop.jsp" %>

<script type="text/javascript">
	function pageFunc(curPage) {
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
 	function typeFunc(type) {
		document.frmPage.ubType.value=type;
		document.frmPage.currentPage.value=1;
		frmPage.submit(); 
	}  
	
	function showContent($obj) {
		if($("pre", $obj).css('display') === 'none') {
			$("pre", $obj).show();
		}
		else {
			$("pre", $obj).hide();
		}
	}
	
</script>

<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" 
	action='<c:url value="/useboard/list.do"/>'>
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="ubType" value="${param.ubType}">
	<input type="hidden" id="context" value="${pageContext.request.contextPath}">
</form>

<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.searchKeyword}, 
	${pagingInfo.totalRecord}건 검색되었습니다</p>
</c:if>

<!-- 페이징 처리 form 끝 -->	

<!-- <body> -->
<!-- <h2>공지사항</h2> -->
<style>
.tab-pane table{width:100%;}
</style>
</head>	
<br>
<br>
	<div class="container">
		<div class="col-md-10">
			<ul class="nav nav-tabs nav-justified">
				<li><a href='<c:url value="/useboard/list.do"/>'  role="tab" data-toggle="tab" 
				onclick="typeFunc(1);"> 자주묻는 질문</a></li>
				<li class="active"><a href='<c:url value="/useboard/uselist.do"/>'  role="tab" data-toggle="tab" 
				onclick="typeFunc(2);">이용 관련</a></li>
				<li><a href='<c:url value="/useboard/paylist.do"/>'  role="tab" data-toggle="tab" 
				onclick="typeFunc(3);">결제 관련</a></li>
			</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane" id="/useboard/uselist.do">
						<ul id="ulTemp">
							<c:forEach var="vo" items="${uList }" varStatus="status">
								<li onclick="showContent($(this))">
									<span>${status.index+1}  ${vo.ubTitle}</span>
									<pre style="display: none;">${vo.ubContent}</pre>
								</li>
							</c:forEach>
						</ul>
						

						
						</div>
					</div>
						


<div class="col-md-10" align="center">
   	<form name="frmSearch" method="post" 
   		action="<c:url value='/useboard/uselist.do' />" >
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
    <a href="<c:url value='/useboard/write.do'/>" >이용안내추가</a>
</div>

<%@ include file="../noticeboard/boardbottom.jsp" %>
</body>
</html>








