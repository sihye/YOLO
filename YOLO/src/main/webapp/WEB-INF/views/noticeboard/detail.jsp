<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="boardtop.jsp" %>

<!-- <style type="text/css">
	.divForm{
		margin:20px 0;
		margin-left: 200px;
		margin-right: 200px;
		font-size: 1.5em;	
	 }
</style> --> 
</head>
<br>
<br>


<div class="col-md-10">
	<h2>공지사항 상세보기</h2>
	<br>
	<br>
	<fieldset>
			<span class="col-md-1 ">제목  </span>
			<span class="col-md-4">${vo.nbTitle}</span>
			<%-- <span class="col-sm-2">작성자 : </span>
			<div><span class="col-sm-4">${vo.mUserid}</span></div> --%>
	
			<span class="col-md-1">등록일  </span> 
			<span class="col-md-2">
			<fmt:formatDate value="${vo.nbRegdate}" pattern="yyyy-MM-dd"/>
			</span>
			<span class="col-md-1">조회수  </span> 
			<span class="col-md-1">${vo.nbReadcount}</span>
			<br><br>
			<% pageContext.setAttribute("newLine", "\r\n"); %>
			<span class="col-md-1">내용</span>		
			<p class="col-md-9">${fn:replace(vo.nbContent, newLine, "<br>")}</p>

		<div class="center">
		<a href="<c:url value='/noticeboard/edit.do?no=${vo.nbNo}'/>">수정</a> |
	      	<a href="<c:url value='/noticeboard/delete.do?no=${vo.nbNo}'/>">삭제</a> |
	      <%-- 	<a href="<c:url value='/noticeboard/reply.do?no=${vo.nbNo}'/>">답변</a> | --%>
	      	<a href="<c:url value='/noticeboard/list.do'/>">목록</a>			
		</div>	
	</fieldset>
</div>



<%@ include file="boardbottom.jsp" %>	
</body>
</html>










