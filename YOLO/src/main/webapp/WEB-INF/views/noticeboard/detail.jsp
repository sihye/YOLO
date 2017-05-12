<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<%@ include file="../inc/admin/top.jsp" %>

<!--파일 이미지  -->

<script type="text/javascript">
	$(document).ready(function(){
		$("#file1").click(function(){
			fileDownload($("#fileName1").val(), $("#oFileName1").val());
		});
		$("#file2").click(function(){
			fileDownload($("#fileName2").val(), $("#oFileName2").val());
		});
		$("#file3").click(function(){
			fileDownload($("#fileName3").val(), $("#oFileName3").val());
		});
	});
	
	function fileDownload(fileName, oFileName){
		 var url = $("#context").val() + "/noticeboard/download.do";
         inputHtmls = "<input type='text' name='fileName' value='"+ fileName +"'>"
         inputHtmls += "<input type='text' name='oFileName' value='"+ oFileName +"'>"
         $('<form action="'+ url +'" method="post">'+inputHtmls+'</form>').appendTo('body').submit();	
		
	}
</script>



<div class="container" id="cont1">

	
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
						<span id="file1" style="cursor: pointer;">
						<i class="fa fa-file-o" aria-hidden="true">
						${uv1.fOriginalfilename }(${uv1.fFilesize }byte)</i></span>
					</c:if>	
					<c:if test="${!empty uv2.fFilename }">	
						<span id="file2" style="cursor: pointer;">
						<i class="fa fa-file-o" aria-hidden="true"> ${uv2.fOriginalfilename }(${uv2.fFilesize }byte)</i></span>
					</c:if>	
					<c:if test="${!empty uv3.fFilename }">
						<span id="file3" style="cursor: pointer;">
						<i class="fa fa-file-o" aria-hidden="true"> ${uv3.fOriginalfilename }(${uv3.fFilesize }byte)</i></span>
					</c:if>	
					</span> 
					<input type="hidden" id="fileName1" value= "${uv1.fFilename }">
					<input type="hidden" id="oFileName1" value= "${uv1.fOriginalfilename }">
					<input type="hidden" id="fileName2" value= "${uv2.fFilename }">
					<input type="hidden" id="oFileName2" value= "${uv2.fOriginalfilename }">
					<input type="hidden" id="fileName3" value= "${uv3.fFilename }">
					<input type="hidden" id="oFileName3" value= "${uv3.fOriginalfilename }">
					<input type="hidden" id="context" value="${pageContext.request.contextPath}">
					
				</div>
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>내용 : </td>
			<td>
			
			<% pageContext.setAttribute("newLine", "\r\n"); %>
			${fn:replace(vo.nbContent, newLine, "<br>")}
		
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		<tr>
	</tbody>
	</table>


</div>
</div>
		<div class="col-md-12">
		<div class="col-md-1"></div>
		<div align="center" class="col-md-7">
			<input class="btn btn-primary" type = "Button" value="수정"
			 onclick
           ="location.href='<c:url  value="/noticeboard/edit.do?no=${vo.nbNo}"/>'" />
			<input class="btn btn-primary" type = "Button" value="삭제"
			 onclick
           ="location.href='<c:url value="/noticeboard/delete.do?no=${vo.nbNo}"/>'" /> 
           <input class="btn btn-primary" type = "Button" value="글목록" 
            onclick
           ="location.href='<c:url value="/admin/noticeBoard.do"/>'" /> 
		</div>      	 			
		</div>	

</div>



<%@ include file="../inc/admin/bottom.jsp" %>	












