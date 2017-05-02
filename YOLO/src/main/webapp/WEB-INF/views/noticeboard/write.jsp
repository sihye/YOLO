<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="boardtop.jsp" %>	 

<script type="text/javascript">
	$(document).ready(function(){
		$("#frmWrite").submit(function(event){
			if($("#title").val()==""){
				alert("제목을 입력하세요");
				$('#title').focus();
				event.preventDefault();
			}else if($('#content').val()==""){
				alert("내용를 입력하세요");
				$('#content').focus();
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
<h2 align="center">공지사항 쓰기</h2>
<br>
<br>
<form id="frmWrite" name="frmWrite" method="post" 
	action='<c:url value="/noticeboard/write.do"/>'  enctype="multipart/form-data">
 <fieldset>
		<%-- <input type="hidden" name="bgNo" value="${bgNo}" /> --%>
        <div class="col-md-12">
            <label class="col-sm-1 control-label" for="title">제목</label>
            <div class="col-sm-10	">  
            <input type="text" id="nbTitle" name="nbTitle" class="form-control" placeholder="제목"/>
            </div>
        </div><br><br>
        <div class="col-md-12">
            <label class="col-sm-1 control-label" for="name">작성자</label>
            <div class="col-sm-10">  
            <input type="text" id="mUserid" name="mUserid" class="form-control" placeholder="작성자"/>
            </div>
        </div><br><br>
        <div class="col-md-12">  
        	<label class="col-sm-1 control-label" for="content">내용</label> 
        	<!-- ckeditor 반영  -->
        	<div class="col-sm-10">   
        	<textarea class="ckeditor" id="nbContent" name="nbContent" placeholder="내용" >${vo.nbContent}</textarea>
 			</div>
        </div>
        <div class="col-md-10">
        <br>
        <div align="left" class="col-md-6"></div>
            <input class="btn btn-default" type = "submit" value="등록"/>
            <input class="btn btn-default" type = "Button" value="글목록" 
            onclick
           ="location.href='<c:url value="/noticeboard/list.do"/>'" />        
        </div><br><br>
 
		<div class="col-md-12">
        <div align="left" class="col-md-1"></div>
        <div class="col-md-10">
			<label for="uploadFile">첨부파일</label>        
			<input type="file" name="fileMap[0]" id="upfile" size="36">
		</div>
		</div>
		<div class="col-md-12">
        <div align="left" class="col-md-1"></div> 
			<input type="file" name="fileMap[1]" id="upfile" size="36">
			</div>
		<div class="col-md-12">
        <div align="left" class="col-md-1"></div> 
			<input type="file" name="fileMap[2]" id="upfile" size="36">
			</div>
		</div>

    </fieldset>
</form>
</div>   

<%@ include file="boardbottom.jsp" %>             
</body>
</html>




