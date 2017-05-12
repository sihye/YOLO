<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<%@include file="../inc/admin/top.jsp" %>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>	 

<script type="text/javascript">
	$(document).ready(function(){
		$('#nbTitle').focus();
		
		$("#frmWrite").submit(function(){
			if($("#nbTitle").val()==""){
				alert("제목을 입력하세요");
				$('#nbTitle').focus();
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
<h2>공지사항 쓰기</h2>

<form id="frmWrite" name="frmWrite" method="post" 
	action='<c:url value="/noticeboard/write.do"/>'  enctype="multipart/form-data">
<%-- 	<input type="text" name="mUserid" value="${vo.mUserid}" /> --%>
	
		<%-- <input type="hidden" name="bgNo" value="${bgNo}" /> --%>
        <div class="col-md-12">
            <label class="col-sm-1 control-label" for="title">제목</label>
            <div class="col-sm-11	">  
            <input type="text" id="nbTitle" name="nbTitle" class="form-control" placeholder="제목을 입력하세요"/>
            </div>
        </div><br><br>
        <div class="col-md-12">
            <label class="col-sm-1 control-label" for="name" >작성자</label>
            <div class="col-sm-11">  
            <input type="text" id="mUserid" name="mUserid" class="form-control" readonly
            	value="${sessionScope.userid}"/>
            </div>
        </div><br><br>
        <div class="col-md-12">  
        	<!-- <label class="col-sm-1 control-label" for="content">내용</label>  -->
        	<!-- <div class="col-sm-10">    -->
        	<!-- ckeditor 반영  -->
        	<textarea class="ckeditor" id="nbContent" name="nbContent" cols="130" rows="15">${vo.nbContent}</textarea>
 			<!-- </div> -->
        </div>
        <div class="col-md-10">
        <br>
        <div align="left" class="col-md-6"></div>
            <input class="btn btn-primary" type = "submit" value="등록"/>
            <input class="btn btn-primary" type = "Button" value="글목록" 
            onclick
           ="location.href='<c:url value="/admin/noticeBoard.do"/>'" />       
        </div><br><br>
 
		<div class="col-md-12"> 
			<div>
				<label for="uploadFile">첨부파일</label><br>
				<input type="file" name="fileMap[0]" id="upfile" size="36">
				<input type="file" name="fileMap[1]" id="upfile" size="36">
				<input type="file" name="fileMap[2]" id="upfile" size="36">
			</div>
		</div>

</form>
</div>  
</div>
 

<%@ include file="../inc/admin/bottom.jsp" %>	             
</body>
</html>




