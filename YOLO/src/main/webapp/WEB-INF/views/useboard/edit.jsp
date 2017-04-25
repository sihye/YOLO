<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		$('#frmEdit').submit(function(){
			if($("#title").val()==""){
				alert("제목을 입력하세요");
				$('#title').focus();
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
	<!-- 화면 마진  -->
<style type="text/css">
	.divForm{
		margin:20px 0;
		margin-left: 400px;
		margin-right: 400px;
		font-size: 1.5em;
	}
</style>
</head>
<br>
<br>
<div class="divForm">
<h2>이용안내수정</h2>
<br>
<br>
<form id="frmEdit" name="frmEdit" method="post" 
	action='<c:url value="/useboard/edit.do" />' > 
	
	<input type="hidden" name="nbNo" 
            	value="${vo.ubNo}" />
   	<input type="hidden" name="bgNo" 
        		value="${vo.bgNo}" />
            	
    <fieldset>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="title">제목</label>
            <div class="col-sm-6">
            <input type="text" id="ubTitle" name="ubTitle" class="form-control" placeholder="제목"
            	value="${vo.ubTitle}" />
            </div>
        </div>
        <br>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="mUserid">작성자</label>
            <div class="col-sm-6">
            <input type="text" id="mUserid" name="mUserid" class="form-control" placeholder="작성자" readonly
            	value="${vo.mUserid}"/>
            </div>
        </div>
        <br>
        <div class="form-group"> 
        	<label class="col-sm-2 control-label" for="content">내용</label>
       <!-- ckeditor 반영  -->
        	<div class="col-sm-6">   
        	<textarea class="ckeditor" id="ubContent" name="ubContent" placeholder="내용" >${vo.ubContent}</textarea>
 			</div>
        </div>
        <br>
        
     	<div align="center">
            <input class="btn btn-default" type = "submit" value="수정"/>
            <input class="btn btn-default"type = "Button" value="목록" 
   				onclick="location.href='<c:url value="/useboard/list.do"/>'" />         
        </div>
	</fieldset>
</form>    
</div>

<%@ include file="../inc/bottom.jsp" %>	
</body>
</html>