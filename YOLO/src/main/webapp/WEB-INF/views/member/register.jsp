<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mainstyle.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/clear.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mystyle.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.1.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/js/member.js" />'></script>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		$("#name").focus();
		
		$("#frm1").submit(function(){
			if($("#name").val()==''){
				alert('이름을 입력하세요');
				$("#name").focus();
				return false;
			}else if(!validate_userid($("#userid").val())){
				alert('아이디는 영문대소문자, 숫자, 언더바만 가능합니다');
				$("#userid").focus();
				return false;
			}else if(!$("#pwd").val()){
				alert('비밀번호를 입력하세요');
				$("#pwd").focus();
				return false;
			}else if($("#pwd").val()!=$("#pwd2").val()){
				alert('비밀번호가 일치하지 않습니다');
				$("#pwd2").focus();
				return false;
			}else if($("#chkId").val()!='Y'){
				alert('아이디 중복검사를 해야 합니다.');
				$('#btnChkId').focus();
				return false;
			}else if(!validate_hp($("#hp2").val()) || 
					!validate_hp($("#hp3").val())){
				alert('휴대폰은 숫자를 입력하셔야 합니다');
				$("#hp2").focus();
				return false;
			}	
		});
		
		$("#btnChkId").click(function(){
			window.open("<c:url value='/member/checkUserid.do?userid="+$("#userid").val()+ "'/>", 'chk',
			'width=400,height=300,left=10,top=10,location=yes,resizable=yes');
		});
		
	});
	
</script>


<style type="text/css">
.width_80 {
	width: 80px;
}

.width_350 {
	width: 350px;
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
	document.write(maxChecked);
</script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>

<article>
<div class="divForm">
	<form id="frm1" name="frm1" method="post"
		action='<c:url value="/member/join.do" />'>
		<fieldset>
			<legend>회원 가입</legend>


			<div>
				<label for="name">성명</label> 
				<input type="text" name="name" id="name" style="ime-mode: active">
			</div>
			<div>
				<label for="userid">회원ID</label> 
				<input type="text" name="userid" id="userid" style="ime-mode: inactive">&nbsp; 
				<input type="button" value="중복확인" id="btnChkId" title="새창열림">
			</div>
			<div>
				<label for="pwd">비밀번호</label> 
				<input type="Password" name="pwd" id="pwd">
			</div>
			<div>
				<label for="pwd2">비밀번호 확인</label> 
				<input type="Password" name="pwd2" id="pwd2">
			</div>
			<div>
				<label for="zipcode">주소</label> 
				<input type="text" name="zipcode" id="zipcode" ReadOnly title="우편번호" class="width_80 postcodify_postcode"> 
				<input type="Button" value="우편번호 찾기" id="postcodify_search_button" title="새창열림"><br />
				<span class="sp1">&nbsp;</span> 
				<input type="text" name="address" ReadOnly title="주소" class="width_350 postcodify_address"><br /> 
				<span class="sp1">&nbsp;</span> 
				<input type="text" name="addressDetail" title="상세주소" class="width_350 postcodify_details">
			</div>
			<div>
				<label for="hp1">핸드폰</label>&nbsp; <select name="hp1" id="hp1"
					title="휴대폰 앞자리">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select> - 
				<input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리" class="width_80">- 
				<input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리" class="width_80">
			</div>
			<div>
				<label for="email1">이메일 주소</label> <input type="text" name="email1"
					id="email1" title="이메일주소 앞자리">@ <select name="email2"
					id="email2" title="이메일주소 뒷자리">
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="etc">직접입력</option>
				</select> <input type="text" name="email3" id="email3"
					title="직접입력인 경우 이메일주소 뒷자리" style="visibility: hidden">
			</div>
			<div>
				<label for="hobby">관심사</label> 3개까지 선택 가능
			</div>
			<div>
			
				<FORM action=# method=post name=Check>
				<label for="hobby">라이프 스타일</label>
					<input name='book' value='독서/글쓰기' onclick=CountChecked(this) type=checkbox>독서/글쓰기 
					<input name=design value='디자인' onclick=CountChecked(this) type=checkbox>봉사활동
					<input name=program value='웹표준' onclick=CountChecked(this) type=checkbox>바리스타/바텐더 
					<input name=allow value='웹접근성' onclick=CountChecked(this) type=checkbox>반려동물<BR> 
					<input name=css value='CSS' onclick=CountChecked(this) type=checkbox>사진/영상
					<input name=html value='HTML' onclick=CountChecked(this) type=checkbox>요리/베이킹 
					<input name=community value='커뮤니티' onclick=CountChecked(this) type=checkbox>라이프 스타일 기타<br><br>
				<label for="hobby">외국어</label>
					<input name=program value='프로그램' onclick=CountChecked(this) type=checkbox>영어 
					<input name=program value='디자인' onclick=CountChecked(this) type=checkbox>중국어 
					<input name=program value='웹표준' onclick=CountChecked(this) type=checkbox>일본어
					<input name=allow value='웹접근성' onclick=CountChecked(this) type=checkbox>외국어 기타<BR> <br>
				<label for="hobby">디자인/미술</label>
					<input name=program value='프로그램' onclick=CountChecked(this) type=checkbox>캘리그라피
					<input name=program value='디자인' onclick=CountChecked(this) type=checkbox>일러스트
					<input name=allow value='웹접근성' onclick=CountChecked(this) type=checkbox>디자인 기타<BR> <br>
				<label for="hobby">음악/공연</label>
					<input name=program value='프로그램' onclick=CountChecked(this) type=checkbox>피아노
					<input name=program value='디자인' onclick=CountChecked(this) type=checkbox>기타/우쿨렐라
					<input name=program value='프로그램' onclick=CountChecked(this) type=checkbox>보컬
					<input name=program value='디자인' onclick=CountChecked(this) type=checkbox>댄스/무용
					<input name=allow value='웹접근성' onclick=CountChecked(this) type=checkbox>음악/공연 기타<BR> <br>
				<label for="hobby">뷰티/미용</label>
					<input name=program value='프로그램' onclick=CountChecked(this) type=checkbox>헤어
					<input name=program value='디자인' onclick=CountChecked(this) type=checkbox>네일
					<input name=program value='프로그램' onclick=CountChecked(this) type=checkbox>메이크업
					<input name=allow value='웹접근성' onclick=CountChecked(this) type=checkbox>뷰티/미용 기타<BR> <br>
				<label for="hobby">스포츠</label>
					<input name=program value='프로그램' onclick=CountChecked(this) type=checkbox>축구
					<input name=program value='디자인' onclick=CountChecked(this) type=checkbox>야구
					<input name=program value='프로그램' onclick=CountChecked(this) type=checkbox>테니스
					<input name=program value='디자인' onclick=CountChecked(this) type=checkbox>요가
					<input name=allow value='웹접근성' onclick=CountChecked(this) type=checkbox>스포츠 기타<BR> <br>
				</FORM>
				
			</div>
			<div>
				<label for="email1">비밀번호 찾기 질문</label>
				<select name="question">
					<option value="nate.com">뭐시 중헌디</option>
					<option value="hanmail.net">쫄리면 뒤지시던가</option>
					<option value="nate.com">살려는 드릴게</option>
				</select><br>비밀번호 분실시 본인 확인을 위해 사용될 질문입니다
			</div>
			<div>
				<label for="email1">비밀번호 찾기 답</label>
				<input type="text"><br>
				비밀번호 분실시 본인 인증을 위한 답변을 입력해 주세요
			</div>




			<div class="center">
				<input type="submit" id="wr_submit" value="회원가입">
			</div>
		</fieldset>

		<input type="text" name="chkId" id="chkId">

	</form>
</div>
</article>