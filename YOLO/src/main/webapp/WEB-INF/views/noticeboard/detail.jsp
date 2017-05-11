<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="boardtop.jsp" %>
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<!--파일 이미지  -->

</head>
	
<div class="col-md-10">
	<div class="col-md-2" align="left"></div>
	<h2>공지사항 상세보기</h2>

	<div class="row">
	<table class="table table-hover">
	<thead>
	  <tr>
	    <th width="15%" style="text-align: center;"/>
	    <th width="50%" style="text-align: left;"/>
	    <th width="10%" style="text-align: center;"/>
	    <th width="10%" style="text-align: left;"/>
	    <th width="10%" style="text-align: center;"/>
	    <th width="5%" style="text-align: left;"/>
	  </tr>
	</thead>
		
	<tbody>
		<tr>
			<td>제목 : </td>
			<td><c:if test="${fn:length(vo.nbTitle)>50 }">
				${fn:substring(vo.nbTitle, 0, 50) }...
			</c:if>
			<c:if test="${fn:length(vo.nbTitle)<=50 }">
				${vo.nbTitle}
			</c:if></td>
			<td>등록일 :</td>
			<td><fmt:formatDate value="${vo.nbRegdate}" pattern="yyyy-MM-dd"/></td>
			<td>조회수 : </td>
			<td>${vo.nbReadcount}</td>
	
		</tr>
		<tr>
			<td>파일 : </td><!-- 파일관련  -->	
			<td>	
				<div>
					<c:if test="${empty uv1.fFilename }">
						<span style="color:darkgreen ;font-weight: bold" >
							<i class="fa fa-file-o" aria-hidden="true">"첨부파일이 없습니다"</i></span>
					</c:if>
					 
					<span class="col-md-10">
					<c:if test="${!empty uv1.fFilename }">
						<a href="<c:url value='/noticeboard/download.do?no=${uv1.fOriginalfilename}'/>">
						<i class="fa fa-file-o" aria-hidden="true">
						${uv1.fOriginalfilename }(${uv1.fFilesize }byte)</i></a>
					</c:if>	
					<c:if test="${!empty uv2.fFilename }">	
						<i class="fa fa-file-o" aria-hidden="true"> ${uv2.fOriginalfilename }(${uv2.fFilesize }byte)</i>
					</c:if>	
					<c:if test="${!empty uv3.fFilename }">
						<i class="fa fa-file-o" aria-hidden="true"> ${uv3.fOriginalfilename }(${uv3.fFilesize }byte)</i>
					</c:if>	
					</span> 
				</div>
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
			<td>내용 : </td>
			<td>
			<% pageContext.setAttribute("newLine", "\r\n"); %>
			<p> ${fn:replace(vo.nbContent, newLine, "<br>")}</p>
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		<tr>
	</tbody>
	</table>

		<div class="col-md-12">
		<div class="col-md-1"></div>
		<div align="center" class="col-md-7">
			<a href="<c:url value='/noticeboard/edit.do?no=${vo.nbNo}'/>">수정</a> |
		      	<a href="<c:url value='/noticeboard/delete.do?no=${vo.nbNo}'/>">삭제</a> |
		      <%-- 	<a href="<c:url value='/noticeboard/reply.do?no=${vo.nbNo}'/>">답변</a> | --%>
		      	<a href="<c:url value='/noticeboard/list.do'/>">목록</a>	
		</div>      	 			
		</div>	

</div>
</div>





<%@ include file="boardbottom.jsp" %>	
</body>
</html>










