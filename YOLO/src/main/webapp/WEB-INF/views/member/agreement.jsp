<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<style type="text/css">
	#divAgree{
		width: 700px;
		margin-top: 10px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#frmAgree").submit(function(){
			if(!$("#chkAgree").is(":checked")){
				alert("약관에 동의하셔야 합니다.");
				$("#chkAgree").focus();
				return false;
			}	
		});
	});
	
</script>


	 
<style> 
	.div { display: table; margin-left: auto; margin-right: auto; } 
	
	
	
</style>

<div class="div">
<h2>회원약관</h2>
<div style="border: 1px solid gray">
<iframe src='<c:url value="/inc2/provision.html" />' width="700" height="400"></iframe>
</div>
<div id="divAgree">
	<form id="frmAgree" name="frmAgree" method="post" 
		action='<c:url value="/index2.do" />' >
		<div class="align_right">
			<input type="checkbox" name="chkAgree" id="chkAgree" >
			<label for="chkAgree">약관에 동의합니다.</label>
		</div>
		<div class="align_center">
			<input type="submit" value="확인">
			<input type="reset" value="취소">			
		</div>
	</form>
</div>
</div>

<%@ include file="../inc/bottom.jsp" %>






