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
        <div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">기본주소</label></div>
        <div class="col-md-11">
    	<input type="text" class="form-control" id="exampleInputName2" disabled="disabled" style="width: 410px" value="${memberVo.mAddress }">
        </div>
        
        <br><br>
        <div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">상세주소</label></div>
        <div class="col-md-11">
    	<input type="text" class="form-control" id="exampleInputName2" disabled="disabled" style="width: 410px" value="${memberVo.mAddressdetail }">
        </div>           
        
        <br><br>
        <div class="col-md-1" style="text-align: center;"><label for="exampleInputName2">가입일자</label></div>
        <div class="col-md-11"><input type="text" class="form-control" id="exampleInputName2" disabled="disabled" value='<fmt:formatDate value="${memberVo.mJoindate }" pattern="yyyy-MM-dd" />'>
        </div>
  	</div>  
    </div>
	</div>
	<br><br>
	<div style="margin-left: 250px">
  		<a class="btn btn-default" href="<c:url value= '/admin/memberEdit.do?mNo=${memberVo.mNo }'/>" role="button">정보수정</a>
  		<a class="btn btn-default" href="<c:url value= '/admin/memberDelPage.do?mUserid=${memberVo.mUserid }'/>" role="button"
  		 onclick="return confirm(&quot;정말  ${memberVo.mName}회원님을 삭제 하시겠습니까 ?&quot;)">회원삭제</a>
  	</div>
 </form>

</div>


	
	
	
<%@include file="../inc/admin/bottom.jsp" %>	