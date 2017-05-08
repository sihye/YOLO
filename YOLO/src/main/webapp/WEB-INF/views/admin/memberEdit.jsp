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


<div class="container" id="cont1">

<h2>회원 정보</h2>
<br><br>
<form class="form-inline" >
  <div class="form-group">
  <div class="container">
    <div class="row">
        <div class="col-sm-1" style="text-align: center;"> <label for="exampleInputName2">이름</label></div>
        <div class="col-md-11"> <input type="text" class="form-control" id="exampleInputName2" disabled="disabled" value="${memberVo.mName }"></div>
       
        <br><br>
        
        <div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">아이디</label></div>
        <div class="col-md-11"><input type="text" class="form-control" id="exampleInputName2" disabled="disabled" value="${memberVo.mUserid }"></div>
        
        <br><br>
        
        <div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">회원등급</label></div>
        <div class="col-md-11"><input type="text" class="form-control" id="exampleInputName2" disabled="disabled" value="MEMBER"></div>
        
        <br><br>
        
        <div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">회원등급</label></div>
        <div class="col-md-11"><input type="text" class="form-control" id="exampleInputName2" disabled="disabled" value="${memberVo.mEmail1 }">
        <label for="exampleInputName2">@&nbsp;</label><input type="text" class="form-control" id="exampleInputName2" disabled="disabled" value="${memberVo.mEmail2 }">
      	</div>
        <br><br>
        
        <div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">생년월일</label></div>
        <c:set var="birth" value="${memberVo.mBirth }"/>
        <c:set var="mbirth" value="${fn:substring(birth,0,4) }-${fn:substring(birth,4,6) }-${fn:substring(birth,6,8) }"/>
        <div class="col-md-11"><input type="text" class="form-control" id="exampleInputName2" disabled="disabled" value="${mbirth }">
        </div>
        
		<br><br>
      	
      	<div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">성별</label></div>
      	<div class="col-md-11">
     	<label class="radio-inline">
	 	<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="M" disabled="disabled"
	 	<c:if test="${memberVo.mGender eq 'M' }">
	 	checked="checked"
	 	</c:if>
	 	> 남
		</label>
		<label class="radio-inline">
	 	<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="F" disabled="disabled"
	 	<c:if test="${memberVo.mGender eq 'F' }">
	 	checked="checked"
	 	</c:if>
	 	> 여
		</label>
        </div> 
        
        <br><br>
             <label for="zipcode" name ="zipcode">주소</label> 
				<input type="text" name="zipcode" id="zipcode" ReadOnly title="우편번호" class="width_80 postcodify_postcode" value=""> 
				<button type="button" class="btn btn-primary" id="postcodify_search_button" title="새창열림">우편번호 찾기</button><br />
				<span class="sp1">&nbsp;</span> 
				<input type="text" name="address" ReadOnly title="주소" class="width_350 postcodify_address" id="address" value=""><br /> 
				<span class="sp1">&nbsp;</span> 
				<input type="text" name="mAddressdetail" title="상세주소" class="width_350 postcodify_details">
				<input type="hidden" name="mAddress" id="mAddress" value="">
        <script> $(function(){ $("#postcodify_search_button").postcodifyPopUp(); }); </script>
        <br><br>
        <div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">가입일자</label></div>
        <div class="col-md-11"><input type="text" class="form-control" id="exampleInputName2" disabled="disabled" value='<fmt:formatDate value="${memberVo.mJoindate }" pattern="yyyy-MM-dd" />'>
        </div>
  	</div>  
    </div>
	</div>
	<br><br>
	<div style="margin-left: 250px">
	<input class="btn btn-default" type="submit" value="정보수정">
  	</div>
 </form>

</div>

	
	
	
	
	
<%@include file="../inc/admin/bottom.jsp" %>	