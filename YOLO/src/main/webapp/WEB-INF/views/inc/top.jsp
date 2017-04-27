<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
		
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sihye/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sihye/responsive.css">

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sihye/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sihye/main.js"></script>
	<!-- ckeditor -->
	<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
		rel="stylesheet">
		
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/woocommerce-FlexSlider-0690ec2/flexslider.css"
		type="text/css">
	<link rel="stylesheet"
		href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/woocommerce-FlexSlider-0690ec2/jquery.flexslider-min.js"></script>
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
			}else if(!$("input:checkbox[id='hobby']").is(":checked") == true){
				alert("관심사는 하나 이상 체크하셔야 합니다");	
				return false;
			}
			
			 $("#mAddress").val($("#zipcode").val()+" - "+$("#address").val()+" / ");
			 
			 $("#mBirth").val($("#birth1").val()+$("#birth2").val()+$("#birth3").val());
			
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
	/* document.write(maxChecked); */
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.flexslider').flexslider({
			animation : "slide"
		});

	})
	
	$(document).ready(function(){
		$("#frmLogin").submit(function(){
			if($("#userid").val()==''){
				alert('아이디를 입력하세요');
				$("#userid").focus();
				return false;
			}else if($("#pwd").val()==''){
				alert('비밀번호를 입력하세요');
				$("#pwd").focus();
				return false;
			}
			
		});
	});
</script>
<style type="text/css">
#SEARCHDIV{
	border: 1PX solid white;
}
</style>
<title>:: YOLO ::</title>
</head>
<body>
<section class="hero">
 <header>
	<div class="wrapper">
		<a href="${pageContext.request.contextPath}/index2.do" class="logo"
			style="font-size: 30px;">YOLO</a> <a href="#" class="hamburger"></a>


		<nav>

		<ul>
			<!-- 상단 네비 -->

			<li><a href="#">About</a></li>
			<li><a href="#">Notice</a></li>
			<li><a href="#">Guide</a></li>
			<li><a href="#">Contact</a></li>
		</ul>

		<!-- 로그인 전 --> <c:if test="${empty sessionScope.userid }">
			<a class="btn btn-primary btn-lg login_btn" data-toggle="modal"
				data-target="#myModal2">Join</a>

			<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="divForm modal-body">
	<form id="frm1" name="frm1" method="post"
		action='<c:url value="/member/join.do" />'>
		<fieldset>
			<legend>회원 가입</legend>


			<div>
				<label for="name">성명</label> 
				<input type="text" name="mName" id="name" style="ime-mode: active">
			</div>
			<div>
				<label for="userid">회원ID</label> 
				<input type="text" name="mUserid" id="userid1" style="ime-mode: inactive">&nbsp; 
				<button type="button" class="btn btn-primary" id="btnChkId" title="새창열림">중복확인</button>
			</div>
			<div>
				<label for="pwd">비밀번호</label> 
				<input type="Password" name="mPwd" id="pwd1">
			</div>
			<div>
				<label for="pwd2">비밀번호 확인</label> 
				<input type="Password" name="mPwd2" id="pwd2"> 
			</div>
			<div>
				<label for="zipcode" name="zipcode">주소</label> 
				<input type="text" name="zipcode" id="zipcode" ReadOnly title="우편번호" class="width_80 postcodify_postcode" value=""> 
				<button type="button" class="btn btn-primary" id="postcodify_search_button" title="새창열림">우편번호 찾기</button><br />
				<span class="sp1">&nbsp;</span> 
				<input type="text" name="address" ReadOnly title="주소" class="width_350 postcodify_address" id="address" value=""><br /> 
				<span class="sp1">&nbsp;</span> 
				<input type="text" name="mAddressdetail" title="상세주소" class="width_350 postcodify_details">
				<input type="hidden" name="mAddress" id="mAddress" value="">
			</div>
			<div>
				<label for="hp1">핸드폰</label>&nbsp; <select name="mTel1" id="hp1"
					title="휴대폰 앞자리">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
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
				<input type="text" name="mBirth3" id="birth3" title="일" style="width: 25px" maxlength="2">&nbsp;일&nbsp;
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
					id="email2" title="이메일주소 뒷자리">
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
				<button type="submit" class="btn btn-primary" id="wr_submit">회원 가입</button>
				  <button type="button" class="btn btn-primary">취소</button>			
			</div>

		</fieldset>

		<input type="hidden" name="chkId" id="chkId" >

	</form>
	
</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>



			<a class="btn btn-primary btn-lg login_btn" data-toggle="modal"
				data-target="#myModal">Login</a>

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">로그인</h4>
						</div>
						<div class="modal-body">
							<form name="frmLogin" id="frmLogin" method="post"
								action="<c:url value='/login/login.do'/>">
								<fieldset>

									<div>
										<label for="userid" style="margin-right: 14px">&nbsp;&nbsp;&nbsp;아이디</label>
										<input type="text" name="userid" id="userid"
											style="width: 160px" value="${cookie.ck_userid.value}">
									</div>
									<div>
										<label for="pwd">&nbsp;&nbsp;&nbsp;비밀번호</label> <input
											type="password" name="pwd" id="pwd" style="width: 160px">
									</div>
									<div class="align_right">
										<input type="checkbox" name="chkSaveId" id="chkId"
											<c:if test="${!empty cookie.ck_userid }">
						checked="checked"
					</c:if>>
										<label for="chkId">아이디 저장하기</label><br>
									</div>
									<div class="align_center">
										<button type="submit" class="btn btn-primary">로그인</button>
										<button type="button" class="btn btn-primary" data-dismiss="modal">취소
										<span class="sr-only">Close</span>
										</button>

									</div>
   
								</fieldset>
							</form>

						</div>
					</div>
				</div>
			</div>
	</div>


	</c:if> 
		<!-- 로그인 후 -->
		<c:if test="${!empty sessionScope.userid }">
			
			<a href="${pageContext.request.contextPath}/member/memberEdit.do"
				class="login_btn">회원탈퇴</a>
			<a class="dropdown">
			<a data-toggle="dropdown" href="#" style="color: white;" class="login_btn"> ${sessionScope.userName} 님</a>
					<ul class="dropdown-menu" role="menu">
						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="${pageContext.request.contextPath}/mypage/Favorite/FavoriteClass.do">마이페이지</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="#">쪽지함</a></li>
						<li role="presentation" class="divider"></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" 
						href="${pageContext.request.contextPath}/login/logout.do">로그아웃</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" 
						href="${pageContext.request.contextPath}/member/memberOut.do">회원탈퇴</a></li>
					</ul>
				</a>
				
				
				
		</c:if> 
		 </nav>
	</div>

</header><!--  end header section  -->
