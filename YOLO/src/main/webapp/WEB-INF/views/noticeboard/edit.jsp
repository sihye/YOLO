<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="boardtop.jsp" %>	 

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

</head>
<br>
<br>
<div class="col-md-10">
<h2 align="center">공지사항수정</h2>
<br>
<br>
<form id="frmEdit" name="frmEdit" method="post" 
	action='<c:url value="/noticeboard/edit.do" />' > 
	
	<input type="hidden" name="nbNo" 
            	value="${vo.nbNo}" />
   	<input type="hidden" name="bgNo" 
        		value="${vo.bgNo}" />
            	
    <fieldset>
        <div class="col-md-10">
            <label class="col-sm-2 control-label" for="title">제목</label>
            <div class="col-sm-8">
            <input type="text" id="nbTitle" name="nbTitle" class="form-control" placeholder="제목"
            	value="${vo.nbTitle}" />
            </div>
        </div>
        <br>
        <div class="col-md-10">
            <label class="col-sm-2 control-label" for="mUserid">작성자</label>
            <div class="col-sm-8">
            <input type="text" id="mUserid" name="mUserid" class="form-control" placeholder="작성자" readonly
            	value="${vo.mUserid}"/>
            </div>
        </div>
        <br>
        <div class="col-md-10"> 
        	<label class="col-sm-2 control-label" for="content">내용</label>
       <!-- ckeditor 반영  -->
        	<div class="col-sm-8">   
        	<textarea class="ckeditor" id="nbContent" name="nbContent" placeholder="내용" >${vo.nbContent}</textarea>
 			</div>
        </div>
        <br>
        
     	<div class="col-md-10" align="center">
            <input class="btn btn-default" type = "submit" value="수정"/>
            <input class="btn btn-default"type = "Button" value="목록" 
   onclick="location.href='<c:url value="/noticeboard/list.do"/>'" />         
        </div>
	</fieldset>
</form>    
</div>

<%@ include file="boardbottom.jsp" %> 
</body>
</html>