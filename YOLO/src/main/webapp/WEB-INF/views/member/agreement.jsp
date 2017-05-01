<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript" src='<c:url value="/js/member.js" />'></script>

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
	<form id="frmAgree" name="frmAgree" method="get" 
		action='<c:url value="/member/memberOut.do" />' >
		<div class="align_right">
			<input type="checkbox" name="chkAgree" id="chkAgree" >
			<label for="chkAgree">약관에 동의합니다.</label>
		</div>
		
		<div class="container"> 
		<h3>탈퇴 사유</h3> 
		<select class="form-control" style="width: 60%" id="email2" name="mReason"> 
		<option value="1">잣같아서</option> 
		<option value="2">그냥</option> 
		<option value="3">쏘쏘</option> 
		<option value="4">엑쏘</option> 
		<option value="5">트와이스</option> 
		<option value="etc">직접입력</option>
		</select><br>
		<input type="text" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        	style="visibility:hidden; width: 60%">
		</div>
		<br>
		<div class="align_center">
			<input type="submit" value="확인">
			<input type="reset" value="취소">			
		</div>
		
	</form>
</div>
</div>

<%@ include file="../inc/bottom.jsp" %>






