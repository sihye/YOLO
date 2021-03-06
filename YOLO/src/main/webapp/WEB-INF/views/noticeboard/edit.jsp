<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@include file="../inc/admin/top.jsp" %>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>		 

<script type="text/javascript">
	$(document).ready(function(){
		$('#frmEdit').submit(function(){
			if($("#title").val()==""){
				alert("제목을 입력하세요");
				$('#title').focus();
				event.preventDefault();
			}else if($('#nbContent').val()==""){
				alert("내용를 입력하세요");
				$('#nbContent').focus();
				event.preventDefault();
			}				
		});
	});
		
</script>
  <!-- ckeditor 반영  -->
<script type="text/javascript">
	CKEDITOR.replace('Contents', {
		toolbar : 'Full',
		uiColor : '',
	});
</script>

<div class="container" id="cont1">

<div class="col-md-10">
<h2>공지사항수정</h2>
<form id="frmEdit" name="frmEdit" method="post" 
	action='<c:url value="/noticeboard/edit.do" />' enctype="multipart/form-data"> 
	<input type="hidden" name="nbNo" 
            	value="${vo.nbNo}" />
   	<input type="hidden" name="bgNo" 
        		value="${vo.bgNo}" />
   	<input type="hidden" name="fOriginalfilename" 
        		value="${uv1.fOriginalfilename}" />
            	
    <fieldset>
        <div class="col-md-12">
            <label class="col-sm-1 control-label" for="title">제목</label>
            <div class="col-sm-11">
            <input type="text" id="nbTitle" name="nbTitle" class="form-control" placeholder="제목"
            	value="${vo.nbTitle}" />
            </div>
        </div>
      	<br><br>
        <div class="col-md-12">
            <label class="col-sm-1 control-label" for="mUserid">작성자</label>
            <div class="col-sm-11">
            <input type="text" id="mUserid" name="mUserid" class="form-control" placeholder="작성자" readonly
            	value="${vo.mUserid}"/>
            </div>
        </div>
        <br><br>
        <div class="col-md-12"> 
        	<label class="col-sm-1 control-label" for="content">내용</label>
       <!-- ckeditor 반영  -->
        	<div class="col-sm-10">   
        	<textarea class="ckeditor" id="nbContent" name="nbContent" placeholder="내용" >${vo.nbContent}</textarea>
 			</div>
        </div>
        <br><br>
        
     	<div class="col-md-10">
     	<br>
     	<div align="left" class="col-md-5"></div>
     	<div class="col-md-5" align="center">
            <input class="btn btn-primary" type = "submit" value="수정"/>
            <input class="btn btn-primary" type = "Button" value="글목록" 
            onclick
           ="location.href='<c:url value="/admin/noticeBoard.do"/>'" />       
        </div>
        </div>
  
        <div class="col-md-12">
        <div align="left" class="col-md-1"></div>
	    <div class="col-md-10">
			<label for="uploadFile">첨부파일</label>        
			<input type="file" name="fileMap[0]" id="upfile" size="36" >
			<c:if test="${!empty uv1.fFilename }">
	            <span class="sp1"></span>
	            <span style="color:darkgreen;font-weight: bold">
	            	※ 첨부 파일을 새로 지정할 경우 기존파일 
	            	<i class="fa fa-file-o" aria-hidden="true">
	            	${uv1.fOriginalfilename }</i> 은 삭제됩니다.	
	            </span>
            </c:if>
		</div>
		</div>
		<div class="col-md-12">
		<div class="col-md-1"></div>
		<div class="col-md-10"> 
			<input type="file" name="fileMap[1]" id="upfile" size="36" >
			<c:if test="${!empty uv2.fFilename }">
	            <span class="sp1"></span>
	            <span style="color:darkgreen;font-weight: bold">
	            	※ 첨부 파일을 새로 지정할 경우 기존파일 
	            	<i class="fa fa-file-o" aria-hidden="true">
	            	${uv2.fOriginalfilename }</i> 은 삭제됩니다.	
	            </span>
            </c:if>
		</div> 
		</div>
		<div class="col-md-12">
		<div class="col-md-1"></div>
		<div class="col-md-10"> 
			<input type="file" name="fileMap[2]" id="upfile" size="36" >
				<c:if test="${!empty uv3.fFilename }">
	            <span class="sp1"></span>
	            <span style="color:darkgreen;font-weight: bold">
	            	※ 첨부 파일을 새로 지정할 경우 기존파일 
	            	<i class="fa fa-file-o" aria-hidden="true">
	            	${uv3.fOriginalfilename }</i> 은 삭제됩니다.	
	            </span>
            </c:if>
		</div>
		</div>
	</fieldset>
</form>    
</div>


<%@ include file="../inc/admin/bottom.jsp" %>
</body>
</html>