<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../inc/admin/top.jsp" %>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>



<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
	$(document).ready(function(){
		$("#name").focus();
		
		$("#frm1").submit(function(){
			if($("#mName").val()==''){
				alert('이름을 입력하세요');
				$("#name").focus();
				return false;
			}else if($("#mTel1").val()=='' || $("#mTel2").val()=='' || $("#mTel3").val()=='' ){
				alert('전화번호를 입력하세요');
				$("#mTel1").focus();
				return false;
			}else if($("#zipcode").val()=='' || $("#mAddressdetail").val()==''){
				alert('주소를 입력해주세요 ');
				$("#mAddressdetail").focus();
				return false;
			}else if($("#mBankname").val()==''){
				alert("은행명을 입력해주세요");
				$("#mBankname").focus();
				return false;
			}else if($("#mAccount").val()==''){
				alert("계좌번호를 입력해주세요");
				$("mAccount").focus();
				return false;
			}
			 $("#mAddress").val($("#zipcode").val()+"/"+$("#address").val());
			 
		});
	 });
</script>
<div class="container" id="cont1">

<h2>회원 정보수정</h2>
<br><br>
<form class="form-inline" id="frm1" name="frm1" method="post" action='<c:url value="/admin/hostEdit.do"/>' >
<input type="hidden" name="mNo" value="${memberVo.mNo }">
<input type="hidden" name="mUserid" value="${memberVo.mUserid }">
  <div class="form-group">
  <div class="container">
    <div class="row">
        <div class="col-sm-1" style="text-align: center;"> <label for="exampleInputName2">이름</label></div>
        <div class="col-md-11"> <input type="text" class="form-control" id="mName" name="mName" value="${memberVo.mName }"></div>
       
        <br><br>
        
        <div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">아이디</label></div>
        <div class="col-md-11">
        <input type="text" class="form-control" disabled="disabled" value="${memberVo.mUserid }"></div>
        
        <br><br>
        
        <div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">전화번호</label></div>
        <div class="col-md-11">
        <input type="text" class="form-control" id="mTel1" name="mTel1" value="${memberVo.mTel1 }" style="width: 80px">-
        <input type="text" class="form-control" id="mTel2" name="mTel2"  value="${memberVo.mTel2 }" style="width: 80px">-
        <input type="text" class="form-control" id="mTel3" name="mTel3"  value="${memberVo.mTel3 }" style="width: 80px">
        </div>
        
        <br><br>
        
        <div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">EMAIL</label></div>
         <div class="col-md-11"><input type="text" class="form-control" id="mEmail1" name="mEmail1"  value="${memberVo.mEmail1 }">
        <label for="exampleInputName2">@&nbsp;</label><input type="text" class="form-control" id="mEmail2" name="mEmail2"  value="${memberVo.mEmail2 }">
        </div>
        <br><br>
        
        <div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">생년월일</label></div>
        <c:set var="birth" value="${memberVo.mBirth }"/>
        <c:set var="mbirth" value="${fn:substring(birth,0,4) }-${fn:substring(birth,4,6) }-${fn:substring(birth,6,8) }"/>
        <div class="col-md-11"><input type="text" class="form-control" id="exampleInputName2" disabled="disabled" value="${mbirth }">
        </div>
        	<c:set var="address" value="${memberVo.mAddress }" />
			<c:set var="index" value="${fn:split(address,'/' ) }" />
        	<br><br>
            <div class="col-md-1" style="text-align: center;"> <label for="zipcode" name ="zipcode" >주소</label></div>
			<div class="col-md-11">	<input type="text" name="zipcode" id="zipcode" ReadOnly title="우편번호" class="width_80 postcodify_postcode" disabled="disabled" value="${index[0] }"> 
				<button type="button" class="btn btn-primary" id="postcodify_search_button" title="새창열림">우편번호 찾기</button><br />
			</div>
			<div class="col-md-1"></div>	
			<div class="col-md-11">
			
				<input type="text" name="address" style="width: 300px" ReadOnly title="주소" class="width_350 postcodify_address" id="address" disabled="disabled" value="${index[1] }"><br />
				<input type="text" name="mAddressdetail" style="width: 300px" title="상세주소" class="width_350 postcodify_details" value="${memberVo.mAddressdetail }">
				<input type="hidden" name="mAddress" id="mAddress" value="">
        <br><br>
			</div>
			
		<div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">은행명</label></div>
        <div class="col-md-11">
        <input type="text" class="form-control" id="mBankname" name="mBankname" value="${memberVo.mBankname }">
        </div>	
        <br><br>
        
		<div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">계좌번호</label></div>
        <div class="col-md-11">
        <input type="text" class="form-control" id="mAccount" name="mAccount" value="${memberVo.mAccount }">
        </div>	
      
			
			
        <script> $(function(){ $("#postcodify_search_button").postcodifyPopUp(); }); </script>
  	</div>  
    </div>
	</div>
	<br><br>
	<div style="margin-left: 250px">
	<input class="btn btn-default" type="submit" value="정보수정">
	<a class="btn btn-default" href="<c:url value= '/admin/hostDetail.do?mUserid=${memberVo.mUserid }'/>" role="button">이전화면</a>
  	</div>
 </form>

</div>

	
	
	
	
	
<%@include file="../inc/admin/bottom.jsp" %>	