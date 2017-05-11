<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="boardtop.jsp" %>		 

<script type="text/javascript">
	$(document).ready(function(){
		$('#ubTitle').focus();
		
		$("#frmWrite").submit(function(event){
			if($("#ubTitle").val()==""){
				alert("제목을 입력하세요");
				$('#ubTitle').focus();
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


<div class="col-md-10">
<h2>이용안내 쓰기</h2>

<form id="frmWrite" name="frmWrite" method="post" 
		action='<c:url value="/useboard/write.do"/>' >
 
        <div class="col-md-12">
	            <label class="col-md-1 control-label" for="ubTitle">제목</label>
	            <span class="col-md-11">  
	            <input type="text" id="ubTitle" name="ubTitle" class="form-control" placeholder="제목"/>
	        	
	        	</span>  
        </div>
      	<br><br>
        <div class="col-md-12">
            <label class="col-sm-1 control-label" for="name">작성자</label>
            <span class="col-sm-11">  
            <input type="text" id="mUserid" name="mUserid" class="form-control" readonly 
            placeholder="작성자" value="${sessionScope.userid}">
            </span>
        </div><br><br>
        <div class="col-md-12">  
        	<!-- <label class="col-sm-1 control-label" for="content">내용</label> --> 
        	<!-- <div class="col-sm-8"> -->   
        	<!-- ckeditor 반영  -->
        	
        	<textarea class="ckeditor" id="nbContent" name="ubContent" placeholder="내용" >${vo.ubContent}</textarea>
 			</div>
        </div><br>
        <div class="col-md-10">
        <div align="left" class="col-md-4"></div>
        	<label value="Type">게시판분류</label>
	        <select name="ubType" id="ubType" title="게시판분류" style="height: 25px">
		        <option value="1">자주묻는 질문</option>  
		        <option value="2">이용 관련</option> 
		        <option value="3">결제 관련</option>
			</select>
            <input class="btn btn-primary" type = "submit" value="등록"/>
            <input class="btn btn-primary" type = "Button" value="글목록" 
            onclick
           ="location.href='<c:url value="/useboard/list.do"/>'" />        
        </div>
       
  
</form>
</div>   

<%@ include file="../noticeboard/boardbottom.jsp" %>	            
</body>
</html>




