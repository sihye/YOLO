<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>  

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
<h2>공지사항 쓰기</h2>
<br>
<br>
<form id="frmWrite" name="frmWrite" method="post" 
	action='<c:url value="/noticeboard/write.do"/>'>
 <fieldset>
		<%-- <input type="hidden" name="bgNo" value="${bgNo}" /> --%>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="title">제목</label>
            <div class="col-sm-6">  
            <input type="text" id="nbTitle" name="nbTitle" class="form-control" placeholder="제목"/>
            </div>
        </div><br>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="name">작성자</label>
            <div class="col-sm-6">  
            <input type="text" id="mUserid" name="mUserid" class="form-control" readonly 
            placeholder="작성자" <%-- value="${vo.mUserid}" --%>>
            </div>
        </div><br>
        <div class="form-group">  
        	<label class="col-sm-2 control-label" for="content">내용</label> 
        	<!-- ckeditor 반영  -->
        	<div class="col-sm-6">   
        	<textarea class="ckeditor" id="nbContent" name="nbContent" placeholder="내용" >${vo.nbContent}</textarea>
 			</div>
        </div><br>
        <div align="center">
            <input class="btn btn-default" type = "submit" value="등록"/>
            <input class="btn btn-default" type = "Button" value="글목록" 
            onclick
           ="location.href='<c:url value="/noticeboard/list.do"/>'" />        
        </div>
    </fieldset>
</form>
</div>   

<%@ include file="../inc/bottom.jsp" %>	              
</body>
</html>




