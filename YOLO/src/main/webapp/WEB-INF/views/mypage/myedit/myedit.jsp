<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp" %>

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
	<div class="container" style="margin-top: 40px;">
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
			
			<br>
			<h2>회원정보수정</h2>
			<br>
			<div class="divForm">
	<div class="col-md-2" align="left"></div>
	<div class="col-md-10">
	<form id="frm1" name="frm1" method="post"
		action='<c:url value="/member/join.do" />'>

			<div>
				<label for="name">성명</label> 
				<span>${vo.mName}</span> 
			</div>
			<div>
				<label for="userid">회원ID</label> 
				<span>${sessionScope.userid}${vo.mName}</span>
			</div>
			<div>
				<label for="pwd">비밀번호</label> 
				<input type="Password" name="mPwd" id="pwdreg">
			</div>
			<div>
				<label for="pwd2">비밀번호 확인</label> 
				<input type="Password" name="mPwd2" id="pwd2"> 
			</div>
			<div>
				<label for="zipcode" name="zipcode">주소</label> 
				<input type="text" name="zipcode" id="zipcode" ReadOnly title="우편번호" class="width_80 postcodify_postcode" value="${vo.mAddress}"> 
				<button type="button" class="btn btn-primary" id="postcodify_search_button" title="새창열림">우편번호 찾기</button><br />
				<span class="sp1">&nbsp;</span> 
				<input type="text" name="address" ReadOnly title="주소" class="width_350 postcodify_address" id="address" value=""><br /> 
				<span class="sp1">&nbsp;</span> 
				<input type="text" name="mAddressdetail" title="상세주소" class="width_350 postcodify_details" value="${vo.mAddressdetail}">
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
				<input type="text" name="mTel2" id="hp2" maxlength="4" title="휴대폰 가운데자리" class="width_80">- 
				<input type="text" name="mTel3" id="hp3" maxlength="4" title="휴대폰 뒷자리" class="width_80">
			</div>
			<div>
				<label for="birth">생년월일</label> 
				<input type="text" name="mBirth1" id="birth1" title="생년" style="width: 50px" maxlength="4">&nbsp;년&nbsp;
				<select name="mBirth2" id="birth2" title="월" style="width: 50px; height: 22px;"
					title="월">
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>&nbsp;월&nbsp;
				<select name="mBirth3" id="birth3" title="일" style="width: 50px; height: 22px;"
					title="월">
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select>&nbsp;월&nbsp;
				<!-- <input type="text" name="mBirth3" id="birth3" title="일" style="width: 25px" maxlength="2">&nbsp;일&nbsp; -->
				<input type="hidden" name="mBirth" id="mBirth" value="">
			</div>
			<div>
				<label for="gender">성별</label>
				<input type="radio" name="mGender" value="M">&nbsp;남자&nbsp; 
				<input type="radio" name="mGender" value="F">&nbsp;여자&nbsp; 
			</div>
			<div>
				<label for="email1">이메일 주소</label> <input type="text" name="mEmail1"
					id="email1" title="이메일주소 앞자리">@ <select name="mEmail2"
					id="email2" title="이메일주소 뒷자리" style="height: 25px">
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="etc">직접입력</option>
				</select> <input type="text" name="mEmail3" id="email3"
					title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden">
			</div>
			<div>
				<label for="hobby">관심사</label> 3개까지 선택 가능
			</div>
			<div>
				<FORM action=# method=post name="kNo">
				<c:forEach var="cg" items="${cgList }">
					<label for="hobby">${cg.kgName}</label>	
					<c:forEach var="c" items="${cList }">
						<c:if test ="${cg.kgNo == c.kgNo}">
							<input value='${c.kNo}' onclick=CountChecked(this) id="hobby"
							type=checkbox name="kno">${c.kName}
						</c:if>
					</c:forEach><br>
				</c:forEach><br>
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
				<button type="submit" class="btn btn-primary" id="wr_submit">회원 수정</button>
				<button type="button" class="btn btn-primary" id="cancle1">취소</button>	 		
			</div>

		</fieldset>

		<input type="hidden" name="chkId" id="chkId" >

	</form>
	</div>
</div>

</div>
</div>		
<%@ include file="../mypagebottom.jsp"%>