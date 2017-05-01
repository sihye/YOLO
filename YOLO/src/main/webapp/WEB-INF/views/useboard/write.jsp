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
<h2 align="center">이용안내 쓰기</h2>
<br>
<br>
<form id="frmWrite" name="frmWrite" method="post" 
	action='<c:url value="/useboard/write.do"/>'>
 <fieldset>
		<%-- <input type="hidden" name="bgNo" value="${bgNo}" /> --%>
        <div class="col-md-10">
            <label class="col-sm-2 control-label" for="title">제목</label>
            <span class="col-sm-8">  
            <input type="text" id="ubTitle" name="ubTitle" class="form-control" placeholder="제목"/>
        	</span>
        </div>
      	<br>
        <div class="col-md-10">
            <label class="col-sm-2 control-label" for="name">작성자</label>
            <span class="col-sm-8">  
            <input type="text" id="mUserid" name="mUserid" class="form-control" readonly 
            placeholder="작성자" <%-- value="${vo.mUserid}" --%>>
            </span>
        </div><br>
        <div class="col-md-10">  
        	<label class="col-sm-2 control-label" for="content">내용</label> 
        	<!-- ckeditor 반영  -->
        	<div class="col-sm-8">   
        	<textarea class="ckeditor" id="nbContent" name="ubContent" placeholder="내용" >${vo.ubContent}</textarea>
 			</div>
        </div><br>
        <div class="col-md-10">
            <input class="btn btn-default" type = "submit" value="등록"/>
            <input class="btn btn-default" type = "Button" value="글목록" 
            onclick
           ="location.href='<c:url value="/useboard/list.do"/>'" />        
        </div>
    </fieldset>
</form>
</div>   

<%@ include file="../noticeboard/boardbottom.jsp" %>	            
</body>
</html>




