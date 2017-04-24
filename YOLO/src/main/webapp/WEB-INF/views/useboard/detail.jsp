<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<style type="text/css">
	.divForm{
		margin:20px 0;
		margin-left: 200px;
		margin-right: 200px;
		font-size: 1.5em;	
	 }
</style> 
</head>
<br>
<br>

<div class="divForm">
	<h2>이용안내 상세보기</h2>
	<br>
	<br>
	<fieldset>
	<div class="form-group">
		<span class="col-sm-2 ">제목 : </span>
		<span class="col-sm-4">${vo.ubTitle}</span>
		<span class="col-sm-2">작성자 : </span> 
		<div><span class="col-sm-4">${vo.mUserid}</span></div>
	</div>

	<div class="form-group">
		<span class="col-sm-2">등록일 : </span> 
		<span class="col-sm-4">
		<fmt:formatDate value="${vo.ubRegdate}" pattern="yyyy-MM-dd-hh:mm"/>
		</span>
	
		<span class="col-sm-2">조회수 : </span> 
		<span class="col-sm-4">${vo.ubReadcount}</span>
	</div>
	
	<% pageContext.setAttribute("newLine", "\r\n"); %>
	<div class="form-group">
		<span class="col-sm-2">내용 : </span>		
		<p class="col-sm-8">${fn:replace(vo.ubContent, newLine, "<br>")}</p>
	</div>

	<div class="center">
	<a href="<c:url value='/useboard/edit.do?no=${vo.ubNo}'/>">수정</a> |
      	<a href="<c:url value='/useboard/delete.do?no=${vo.ubNo}'/>">삭제</a> |
      	<a href="<c:url value='/useboard/reply.do?no=${vo.ubNo}'/>">답변</a> |
      	<a href="<c:url value='/useboard/list.do'/>">목록</a>			
	</div>	
	</fieldset>
</div>

<%@ include file="../inc/bottom.jsp" %>	
</body>
</html>










