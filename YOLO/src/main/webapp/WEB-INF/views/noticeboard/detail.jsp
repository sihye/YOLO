<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="boardtop.jsp" %>
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css"><!--파일 이미지  -->

</head>



<div class="col-md-10">
	<h2 align="center">공지사항 상세보기</h2>
	<br>
	<br>
	<fieldset>
			<span class="col-md-2">제목 : </span>
			<span class="col-md-3" style="text-align: left;">${vo.nbTitle}</span>
			<span class="col-md-2">등록일 : </span> 
			<span class="col-md-2"style="text-align: left;">
			<fmt:formatDate value="${vo.nbRegdate}" pattern="yyyy-MM-dd"/>
			</span>
			<span class="col-md-2">조회수 : </span> 
			<span class="col-md-1"style="text-align: left;">${vo.nbReadcount}</span>
			<br><br>
			
		<!-- 파일관련  -->	
		<div>
			<span class="col-md-2">파일 : </span>
			<c:if test="${empty uv1.fFilename }">
				<span style="color:darkgreen;font-weight: bold">
					"첨부파일이 없습니다"</span>
			</c:if>
			<span class="col-md-10">
			<c:if test="${!empty uv1.fFilename }">
				<i class="fa fa-file-o" aria-hidden="true">${uv1.fOriginalfilename }(${uv1.fFilesize }byte)</i>
			</c:if>	
			<c:if test="${!empty uv2.fFilename }">	
				<i class="fa fa-file-o" aria-hidden="true"> ${uv2.fOriginalfilename }(${uv2.fFilesize }byte)</i>
			</c:if>	
			<c:if test="${!empty uv3.fFilename }">
				<i class="fa fa-file-o" aria-hidden="true"> ${uv3.fOriginalfilename }(${uv3.fFilesize }byte)</i>
			</c:if>	
			</span> 
		</div>	
		
		
		<% pageContext.setAttribute("newLine", "\r\n"); %>
		<br><br>
			<span class="col-md-2">내용 :</span>	
			<div align="left" class="col-md-10"><p> ${fn:replace(vo.nbContent, newLine, "<br>")}</p></div>
			
		<br><br>
		<div class="col-md-12">
		<div class="col-md-1"></div>
		<div align="center" class="col-md-7">
			<a href="<c:url value='/noticeboard/edit.do?no=${vo.nbNo}'/>">수정</a> |
		      	<a href="<c:url value='/noticeboard/delete.do?no=${vo.nbNo}'/>">삭제</a> |
		      <%-- 	<a href="<c:url value='/noticeboard/reply.do?no=${vo.nbNo}'/>">답변</a> | --%>
		      	<a href="<c:url value='/noticeboard/list.do'/>">목록</a>	
		</div>      	 			
		</div>	
	</fieldset>
</div>



<%@ include file="boardbottom.jsp" %>	
</body>
</html>










