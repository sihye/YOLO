<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%-- <head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mainstyle.css" /> 
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/clear.css" /> 
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout.css" />  
 	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mystyle.css" /> 

</head> --%>

<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout.css" />
</head>

<style>
	h2{
		font-size: 25px;
		webkit-margin-before: 1.67em;
	    webkit-margin-after: 1.67em;
	    webkit-margin-start: 0px;
	    webkit-margin-end: 0px;
	    font-weight: bold;
	    color: rgb(63, 148, 7);
	}
	
</style>
<scRIPT language=Javascript>
<!--
	var maxChecked = 3; //선택가능 갯수
	var totalChecked = 0; // 설정 끝
	function CountChecked(field) {
		if (field.checked)
			totalChecked += 1;
		else
			totalChecked -= 1;
		if (totalChecked > maxChecked) {
			alert("최대 3개 까지만 가능합니다.");
			field.checked = false;
			totalChecked -= 1;
		}

	}
	function ResetCount() {
		totalChecked = 0;
	}
//-->
</scRIPT>
<script>
	/* document.write(maxChecked); */
</script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript" src='<c:url value="/js/member.js" />'></script>

<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>


<script type="text/javascript">
	$(document).ready(function(){		
		$("#frm1").submit(function(){
			if(!$("#pwdreg").val()){
				alert('비밀번호를 입력하세요');
				$("#pwdreg").focus();
				return false;
			}else if(!validate_pwd($("#pwdreg").val())){
				alert('비밀번호는 6자리 이상 영문이나 숫자로 입력해 주셔야 합니다.(대소문자 구별)');
				$("#pwdreg").focus();
				return false;
			}else if($("#pwdreg").val()!=$("#pwd2").val()){
				alert('비밀번호가 일치하지 않습니다');
				$("#pwd2").focus();
				return false;
			}else if(!validate_hp($("#hp2").val()) || 
					!validate_hp($("#hp3").val())){
				alert('휴대폰은 숫자를 입력하셔야 합니다');
				$("#hp2").focus();
				return false;
			}else if(!$("#birth1").val()){
				alert('생년월일을 입력해 주세요');
				$('#btnChkId').focus();
				return false;
			}else if($("#birth1").val().length != 4){
				alert('태어난 연도를 4자리로 입력해주세요.');
				$('#btnChkId').focus();
				return false;
			}else if(!$("#email1").val()){
				alert('이메일을 입력하세요');
				$("#email1").focus();
				return false;
			}else if($("#email2").val()=="etc"){
				if(!$("#email3").val()){
					alert('이메일을 입력하세요');
					$("#email3").focus();
					return false;
				}
				
			}else if(!$("input:checkbox[id='hobby']").is(":checked") == true){
				alert("관심사는 하나 이상 체크하셔야 합니다");	
				return false;
			}
			
			 $("#mAddress").val($("#zipcode").val()+" / "+$("#address").val());
			 
			 $("#mBirth").val($("#birth1").val()+$("#birth2").val()+$("#birth3").val());
			
		});

		
		
		
		$("#cancle1").click(function() {
			location.href="<c:url value='/index2.do'/>"
		})
		
	});
	 
	
	 
</script>

<script>
var $checkedList = $("form[name=kNo] input[type=checkbox]").prop("selected", true);

$.each($checkedList , function() {
    alert($(this).text());
    
});

</script>


<div class="container" style="margin-top: 40px; font-size: 14px;">
		<div class="row">
			<div class="col-md-2">
				<ul class="nav nav-pills nav-stacked">
					<li><a href='<c:url value="/mypage/Favorite/FavoriteClass.do"/>'>나의관심</a></li>
					<li><a href='<c:url value="/mypage/MyClass/HostClass.do"/>'>나의클래스</a></li>
					<li><a href='<c:url value="/mypage/Mybbs/qnaboard.do"/>'>내가쓴글</a></li>				
					<li><a href='<c:url value="/mypage/message/messageSend.do"/>'>쪽지함</a></li>				
					<li class="active"><a href='<c:url value="/mypage/myedit/myedit.do"/>'>회원정보수정</a></li>				
				</ul>
			</div>	
			
			<div class="col-md-10">
				<h2>회원정보수정</h2>
				<div class="divForm">
			<!-- <div class="col-md-2" align="left"></div> -->
			<div class="col-md-12">
			<form id="frm1" name="frm1" method="post"
						action='<c:url value="/mypage/myedit/myedit.do" />'>

			<div>
				<label for="name">성명</label> 
				<span>${vo.mName}</span> 
			</div>
			<div>	
				<label for="userid">회원ID</label> 
				<span>${sessionScope.userid}</span>
			</div>
			<div>
				<label for="pwd">비밀번호</label> 
				<input type="Password" name="mPwd" id="pwdreg" value="${vo.mPwd}">
			</div>
			<div>
				<label for="pwd2">비밀번호 확인</label> 
				<input type="Password" name="mPwd2" id="pwd2"> 
			</div>
			<div>
				<c:set var="add" value="${vo.mAddress }" />
	            <c:set var="addArr" value="${fn:split(add,'/')[1]}" />
	           <%-- 	<input type="text" value="${fn:split(address,'/')[0]}" />
	            <input type="text" value="${fn:split(address,'/')[1]}" />  --%>
     
				<label for="zipcode" name="zipcode">주소</label> 
				<input type="text" name="zipcode" id="zipcode" ReadOnly title="우편번호" class="width_80 postcodify_postcode" value="${fn:split(add,'/')[0]}"> 
				<button type="button" class="btn btn-primary" id="postcodify_search_button" title="새창열림">우편번호 찾기</button><br />
				<span class="sp1">&nbsp;</span> 
				<input type="text" name="address" ReadOnly title="주소" style="width: 55%" class="width_350 postcodify_address" id="address" value="${fn:split(add,'/')[1]}"><br /> 
				<span class="sp1">&nbsp;</span> 
				<input type="text" name="mAddressdetail" title="상세주소" style="width: 55%" class="width_350 postcodify_details" value="${vo.mAddressdetail}">
			</div>
			<div>
				<label for="hp1">핸드폰</label>&nbsp; <select name="mTel1" id="hp1"
					title="휴대폰 앞자리">
				<option value="010"
	            	<c:if test="${vo.mTel1 == '010'}">            	
	            		selected="selected"
	            	</c:if>
            	>010</option>
            	<option value="011"
	            	<c:if test="${vo.mTel1 == '011'}">
	            		selected="selected"
	            	</c:if>
	            >011</option>
	            <option value="016"
	            	<c:if test="${vo.mTel1 == '016'}">
	            		selected="selected"
	            	</c:if>
	            >016</option>
	            <option value="017"
	            	<c:if test="${vo.mTel1 == '017'}">
	            		selected="selected"
	            	</c:if>
	            >017</option>
	            <option value="018"
	            	<c:if test="${vo.mTel1 == '018'}">
	            		selected="selected"
	            	</c:if>
	            >018</option>
	            <option value="019"
	            	<c:if test="${vo.mTel1 == '019'}">
	            		selected="selected"
	            	</c:if>
	            >019</option>
				</select> - 
				<input type="text" name="mTel2" id="hp2" maxlength="4" 
				title="휴대폰 가운데자리" class="width_80" value="${vo.mTel2}">- 
				<input type="text" name="mTel3" id="hp3" maxlength="4" 
				title="휴대폰 뒷자리" class="width_80" value="${vo.mTel3}">
			</div>
			<div>
			
			<!-- 01234567
			19901111 -->
				<c:set var="birth" value="${vo.mBirth }" />
	            <c:set var="year" value="${birth.substring(0,4	) }" />
	            <c:set var="month" value="${birth.substring(4,6	) }" />
	            <c:set var="day" value="${birth.substring(6	) }" />
	        
				
				<label for="birth">생년월일</label> 
				<input type="text" name="mBirth1" id="birth1" title="생년" style="width: 50px" maxlength="4"
					value="${year }"
				>&nbsp;년&nbsp;
				<select name="mBirth2" id="birth2" title="월" style="width: 50px; height: 22px;"
					title="월" value="${month }">
					<option value="01"
						<c:if test="${month == '01'}">
	            		selected="selected"
	            		</c:if>
					>1</option>
					<option value="02"
						<c:if test="${month == '02'}">
	            		selected="selected"
	            		</c:if>
					>2</option>
					<option value="03"
						<c:if test="${month == '03'}">
	            		selected="selected"
	            		</c:if>
					>3</option>
					<option value="04"
						<c:if test="${month == '04'}">
	            		selected="selected"
	            		</c:if>
					>4</option>
					<option value="05"
						<c:if test="${month == '05'}">
	            		selected="selected"
	            		</c:if>
					>5</option>
					<option value="06"
						<c:if test="${month == '06'}">
	            		selected="selected"
	            		</c:if>
					>6</option>
					<option value="07"
						<c:if test="${month == '07'}">
	            		selected="selected"
	            		</c:if>
					>7</option>
					<option value="08"
						<c:if test="${month == '08'}">
	            		selected="selected"
	            		</c:if>
					>8</option>
					<option value="09"
						<c:if test="${month == '09'}">
	            		selected="selected"
	            		</c:if>
					>9</option>
					<option value="10"
						<c:if test="${month == '10'}">
	            		selected="selected"
	            		</c:if>
					>10</option>
					<option value="11"
						<c:if test="${month == '11'}">
	            		selected="selected"
	            		</c:if>
					>11</option>
					<option value="12"
						<c:if test="${month == '12'}">
	            		selected="selected"
	            		</c:if>
					>12</option>
				</select>&nbsp;월&nbsp;
				<select name="mBirth3" id="birth3" title="일" style="width: 50px; height: 22px;"
					 value="${day }">
					<option value="01"
						<c:if test="${day == '01'}">
	            		selected="selected"
	            		</c:if>
					>1</option>
					<option value="02"
						<c:if test="${day == '02'}">
	            		selected="selected"
	            		</c:if>
					>2</option>
					<option value="03"
						<c:if test="${day == '03'}">
	            		selected="selected"
	            		</c:if>
					>3</option>
					<option value="04"
						<c:if test="${day == '04'}">
	            		selected="selected"
	            		</c:if>
					>4</option>
					<option value="05"
						<c:if test="${day == '05'}">
	            		selected="selected"
	            		</c:if>
					>5</option>
					<option value="06"
						<c:if test="${day == '06'}">
	            		selected="selected"
	            		</c:if>
					>6</option>
					<option value="07"
						<c:if test="${day == '07'}">
	            		selected="selected"
	            		</c:if>
					>7</option>
					<option value="08"
						<c:if test="${day == '08'}">
	            		selected="selected"
	            		</c:if>
					>8</option>
					<option value="09"
						<c:if test="${day == '09'}">
	            		selected="selected"
	            		</c:if>
					>9</option>
					<option value="10"
						<c:if test="${day == '10'}">
	            		selected="selected"
	            		</c:if>
					>10</option>
					<option value="11"
						<c:if test="${day == '11'}">
	            		selected="selected"
	            		</c:if>
					>11</option>
					<option value="12"
						<c:if test="${day == '12'}">
	            		selected="selected"
	            		</c:if>
					>12</option>
					<option value="13"
						<c:if test="${day == '13'}">
	            		selected="selected"
	            		</c:if>
					>13</option>
					<option value="14"
						<c:if test="${day == '14'}">
	            		selected="selected"
	            		</c:if>
					>14</option>
					<option value="15"
						<c:if test="${day == '15'}">
	            		selected="selected"
	            		</c:if>
					>15</option>
					<option value="16"
						<c:if test="${day == '16'}">
	            		selected="selected"
	            		</c:if>
					>16</option>
					<option value="17"
						<c:if test="${day == '17'}">
	            		selected="selected"
	            		</c:if>
					>17</option>
					<option value="18"
						<c:if test="${day == '18'}">
	            		selected="selected"
	            		</c:if>
					>18</option>
					<option value="19"
						<c:if test="${day == '19'}">
	            		selected="selected"
	            		</c:if>
					>19</option>
					<option value="20"
						<c:if test="${day == '20'}">
	            		selected="selected"
	            		</c:if>
					>20</option>
					<option value="21"
						<c:if test="${day == '21'}">
	            		selected="selected"
	            		</c:if>
					>21</option>
					<option value="22"
						<c:if test="${day == '22'}">
	            		selected="selected"
	            		</c:if>
					>22</option>
					<option value="23"
						<c:if test="${day == '23'}">
	            		selected="selected"
	            		</c:if>
					>23</option>
					<option value="24"
						<c:if test="${day == '24'}">
	            		selected="selected"
	            		</c:if>
					>24</option>
					<option value="25"
						<c:if test="${day == '25'}">
	            		selected="selected"
	            		</c:if>
					>25</option>
					<option value="26"
						<c:if test="${day == '26'}">
	            		selected="selected"
	            		</c:if>	
					>26</option>
					<option value="27"
						<c:if test="${day == '27'}">
	            		selected="selected"
	            		</c:if>
					>27</option>
					<option value="28"
						<c:if test="${day == '28'}">
	            		selected="selected"
	            		</c:if>
					>28</option>
					<option value="29"
						<c:if test="${day == '29'}">
	            		selected="selected"
	            		</c:if>
					>29</option>
					<option value="30"
						<c:if test="${day == '30'}">
	            		selected="selected"
	            		</c:if>
					>30</option>
					<option value="31"
						<c:if test="${day == '31'}">
	            		selected="selected"
	            		</c:if>
					>31</option>
				</select>&nbsp;일&nbsp;
				<!-- <input type="text" name="mBirth3" id="birth3" title="일" style="width: 25px" maxlength="2">&nbsp;일&nbsp; -->
				<input type="hidden" name="mBirth" id="mBirth" value="">
			</div>
			<div>
				<label for="gender">성별</label>
				<input type="radio" name="mGender" value="M"
					<c:if test="${vo.mGender == 'M'}">
	            		checked="checked"
	            	</c:if>
				>&nbsp;남자&nbsp; 
				<input type="radio" name="mGender" value="F"
					<c:if test="${vo.mGender == 'F'}">
	            		checked="checked"
	            	</c:if>
				>&nbsp;여자&nbsp; 
			</div>
			<div>
				
		    
			
				<label for="email1">이메일 주소</label> 
				<input type="text" name="mEmail1" id="email1" title="이메일주소 앞자리" 
					value="${vo.mEmail1 }">@ 
					<select name="mEmail2" id="email2" title="이메일주소 뒷자리" style="height: 25px">
					<option value="naver.com"
						<c:if test="${vo.mEmail2 == 'naver.com'}">
		            		selected="selected"
		            	</c:if>
					>naver.com</option>
					<option value="hanmail.net"
						<c:if test="${vo.mEmail2 == 'hanmail.net'}">
		            		selected="selected"
		            	</c:if>
					>hanmail.net</option>
					<option value="nate.com"
						<c:if test="${vo.mEmail2 == 'nate.com'}">
		            		selected="selected"
		            	</c:if>
					>nate.com</option>
					<option value="gmail.com"
						<c:if test="${vo.mEmail2 == 'gmail.com'}">
		            		selected="selected"
		            	</c:if>
					>gmail.com</option>
					<option value="etc">직접입력</option>
	        </select>
	        
	        <input type="text" name="mEmail3" id="email3"
					title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden">
	        
  
			</div>
			<div>
				<label for="hobby">관심사</label> 3개까지 선택 가능(최소 1개 선택바람)
			</div>
			<div>
				<FORM action=# method=post name="kNo">
				
				<c:forEach var="cg" items="${cgList }">
				<table>
					<label for="hobby" style="padding-top: 14px">${cg.kgName}</label>	
					<tr><c:forEach var="c" items="${cList }">
						<td><c:if test ="${cg.kgNo == c.kgNo}"><br>
							<input value='${c.kNo}' onclick=CountChecked(this) id="hobby"
							type=checkbox name="kno">${c.kName}&nbsp;
						</c:if></td>
					</c:forEach></tr>
					</table>
				</c:forEach>
				
				</FORM>
			<div> 
				<input type="hidden" name="mgNo2" id="mgNo2" style="ime-mode: active" value="2">
			</div>	
				
			</div>
			<div>
				<label for="qQuestionno">비밀번호 찾기 질문</label> 
				<c:import url="/question/questionList.do"></c:import><br>
				비밀번호 분실시 본인 확인을 위해 사용될 질문입니다
			</div>
			<div>
				<label for="qQuestionanswer">비밀번호 찾기 답</label>
				<input type="text" name="mQuestionanswer"><br>
				비밀번호 분실시 본인 인증을 위한 답변을 입력해 주세요
			</div>

			<div class="center">
				<button type="submit" class="btn btn-primary">회원 수정</button>
				<button type="button" class="btn btn-primary" id="cancle1">취소</button>	 		
			</div>

		</fieldset>

		<input type="hidden" name="chkId" id="chkId" >

	</form>
	
	
	</div>
</div><!--  -->
				
		   </div>
	</div>
</div>		
<%@ include file="../mypagebottom.jsp"%>