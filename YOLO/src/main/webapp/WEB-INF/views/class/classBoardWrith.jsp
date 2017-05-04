<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/mypage.css" />'>
<div class="container" style="margin-top: 40px;">
		<div class="row">
<style>
#error{
		color:red;
		font-weight: bold;
	    display: none; 
	}
</style>



<script type="text/javascript">
$(document).ready(function() {
	$("#msgUserid").focus();
	
	$("#sendfrm").submit(function() {
		 if($("#msTitle").val().length<1){
			alert('제목을 입력하세요');
			$("#msTitle").focus();
			return false;
		}
	});
	
	
});
</script>
<div class="col-md-10">
	
	<br>
	<h2>후기작성</h2>
	<br>

	<form id="sendfrm" action='<c:url value="/mypage/message/insertMessage.do"/>'>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-md-1" style="text-align: center;">
					<label for="msTitle">제목</label>
				</div>
				<div class="col-md-8">
					<input type="text" class="form-control" name="msTitle" id="msTitle"
						placeholder="제목을 입력하세요.">
				</div>
			</div>
		</div>
		<br>
		<textarea class="ckeditor" id="Contents" name="Contents"></textarea>
		<script type="text/javascript">
	CKEDITOR.replace( 'Contents',{
			 'filebrowserUploadUrl':'/yolo/class/fileup.do'	    
	});
	
	/* var editor;
	CKEDITOR
			.on(
					'instanceReady',
					function(ev) {
						editor = ev.editor;
						document.getElementById('readOnlyOn').style.display = '';
						editor
								.on(
										'readOnly',
										function() {
											document
													.getElementById('readOnlyOn').style.display = this.readOnly ? 'none'
													: '';
											document
													.getElementById('readOnlyOff').style.display = this.readOnly ? ''
													: 'none';
										});
					}); */

/* 	function toggleReadOnly(isReadOnly) {
		editor.setReadOnly(isReadOnly);

	    }); */

	
	
</script>
		<div style="text-align: center;">
			<button type="submit" class="btn btn-default">보내기</button>
		</div>
		<input type ="hidden" name="chkId" id="chkId">
	</form>
	<br> <br>


</div>
<%@ include file="../mypage/mypagebottom.jsp"%>