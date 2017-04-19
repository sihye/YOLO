<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href='<c:url value="/css/mainstyle.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/css/clear.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/css/formLayout.css"/>' />
<link rel="stylesheet" type="text/css" href='<c:url value="/css/mystyle.css"/>' />

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-3.1.1.min.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>




<script type="text/javascript">
	function pageFunc(curPage) {
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>

<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }	
</style>

<!-- 페이징 처리를 위한 form 시작-->

<form name="frmPage" method="post" 
	action='<c:url value="/noticeboard/list.do"/>'>
	<input type="text" name="currentPage">
	<input type="text" name="searchCondition" value="${param.searchCondition }">
	<input type="text" name="searchKeyword" value="${param.searchKeyword}">
</form>

<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.searchKeyword}, 
	${pagingInfo.totalRecord}건 검색되었습니다</p>
</c:if>

<!-- 페이징 처리 form 끝 -->	

</head>	
<body>
<h2>공지사항</h2>

<div class="divList">
<table class="box2"
	 	summary="기본 게시판에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
	<caption>공지사항</caption>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:20%;" />
		<col style="width:30%;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">내용</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	    <th scope="col">조회수</th>
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
			<td>
				<a href
				='<c:url value="/noticeboard/updateCount.do?no=${vo.nbNo}"/>'>${vo.nbTitle}</a>
			</td>
			<td>${vo.nbContent}</td>	
			<td>${vo.mUserid}</td>
			<td><fmt:formatDate value="${vo.nbRegdate}" pattern="yyyy-MM-dd"/> </td>
			<td>${vo.nbReadcount}</td>		
		</tr>
	  </c:forEach>	
	  <!--반복처리 끝  -->
	  </tbody>
</table>	   
</div>

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

<div class="divSearch">
   	<form name="frmSearch" method="post" 
   		action="<c:url value='/noticeboard/list.do' />" >
        <select name="searchCondition"><!-- ${vo.nbTitle} -->
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
            <option value="m_userid" 
            	<c:if test="${'m_userid'==param.searchCondition }">
            		selected            	
            	</c:if>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력"
        	value="${param.searchKeyword }">   
		<input type="submit" value="검색">
    </form>
</div>


<div class="divBtn">
    <a href="<c:url value='/noticeboard/write.do'/>" >추가</a>
</div>

</body>
</html>








