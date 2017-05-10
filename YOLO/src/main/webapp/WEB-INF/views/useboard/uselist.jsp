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
		if(type == 1) {
			document.frmPage.action = $("#context").val() + "/useboard/list.do";
		}
		if(type == 2) {
			document.frmPage.action = $("#context").val() + "/useboard/uselist.do";
		}
		if(type == 3) {
			document.frmPage.action = $("#context").val() + "/useboard/paylist.do";
			///useboard/paylist.do
		}
		
		
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

<style>
ul{
   list-style:none;
   padding-left:0px;
   }
</style>


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

<style>
.tab-pane table{width:100%;}
</style>

<div class="col-md-10">
	<div class="container">
		<div class="col-md-2" align="left"></div>
		<h2>이용안내</h2>
		<div class="col-md-10">
			<ul class="nav nav-tabs nav-justified">
				<li><a role="tab" data-toggle="tab" 
				onclick="typeFunc(1);"> 자주묻는 질문</a></li>
				<li class="active"><a role="tab" data-toggle="tab" 
				onclick="typeFunc(2);">이용 관련</a></li>
				<li><a role="tab" data-toggle="tab" 
				onclick="typeFunc(3);">결제 관련</a></li>
			</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="/useboard/list.do">
							
						

						<!-- <div role="tabpanel" class="tab-pane" id="use"> -->

							
					
						<div class="tab-content">
							
						</div>
						<br>
						<br>
						
						<ul id="ulTemp">
							<c:forEach var="vo" items="${uList }" varStatus="status">
								<li onclick="showContent($(this))">
									<span>0${status.index+1}  ${vo.ubTitle}</span>
									<pre style="display: none;">${vo.ubContent}</pre>
								</li>
							</c:forEach>
						</ul>
						

						<!-- div role="tabpanel" class="tab-pane" id="pay"> -->
						
			</div>
		</div>
	</div>
</div>
						
						
						
						


<div class="col-md-10">
	<div class="col-md-2" align="left"></div>
	<div class="col-md-10">
   	<form name="frmSearch" method="post" align="center"
   		action="<c:url value='/useboard/list.do' />" >
        <select name="searchCondition" class="btn btn-default">
            <option value="ub_title" 
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
        <input class="btn btn-primary" type="submit" value="검색">

		<!-- <input type="submit" value="검색"> -->
		<div style="text-align:right;">
		    <a href="<c:url value='/useboard/write.do'/>" >이용안내추가</a>
		</div>

    </form>
</div>
</div>
</div>



<%@ include file="../noticeboard/boardbottom.jsp" %>
</body>
</html>








