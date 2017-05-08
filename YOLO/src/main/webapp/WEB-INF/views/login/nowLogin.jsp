<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.button {
    background-color: #BFD9F2 ;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    /* margin: 10px 2px 20px 30px; */
    cursor: pointer;
    border-radius: 4px;
    width: 421px;
    height: 50px;
    }
#loginTable td{
	padding: 10px 20px 10px 20px;
}
hr{
	margin: 0;
}
/* #findid a{
	 text-decoration: none;
	color: #BFD9F2 ;
} */
</style>
<div id="wrp">
	<div class="contaner">
		<table style="width: 90%;" id="loginTable">
			<tr><td>
				<input name="userid" value="${cookie.ck_userid.value}" class="form-control" placeholder="아이디" >
			<td></tr>
			<tr><td>
				<input name="pwd" class="form-control" placeholder="비밀번호" >
			<td></tr>
			<tr><td>
				<button name="login" class="button" value="로그인"></button>
			<td></tr>
			<tr><td>
				<input type="checkbox" name="chkSaveId" id="chkId"<c:if test="${!empty cookie.ck_userid }">
                  checked="checked"
               </c:if>>
				<label style="color: #23527c;">아이디 저장하기</label>
			<td></tr>
			<tr><td>
			<hr>
			<div  id="findid" style="text-align: center;   margin-top: 15px;">
				<a href="${pageContext.request.contextPath}/member/findUserid.do">아이디 찾기</a>  |
				<a href="${pageContext.request.contextPath}/member/findPwd.do">비밀번호 찾기</a>   |
				<a href="${pageContext.request.contextPath}/member/register.do">회원가입</a>
			</div>
			<td></tr>
			<tr><td>
			<div style=" text-align: center;">
				<img alt="YOLO LOGO" src="${pageContext.request.contextPath}/img/3.png" style="width: 40px;">
				<span style="font-size: 11px;">Copyright © YOLO Corp. All Rights Reserved.</span>
			</div>
			<td></tr>
		</table>
	</div>
</div>