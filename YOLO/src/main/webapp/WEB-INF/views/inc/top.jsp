<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/sihye/reset.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/sihye/responsive.css">

<script type="text/javascript"
   src="${pageContext.request.contextPath}/js/sihye/jquery.js"></script>
<script type="text/javascript"
   src="${pageContext.request.contextPath}/js/sihye/main.js"></script>
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
   href="${pageContext.request.contextPath}/css/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 시간선택 -->
<script
	src="${pageContext.request.contextPath}/js/jquery.clockpick.1.2.9.js"></script>
<link rel="stylesheet"
	href="<c:url value='/css/jquery.clockpick.1.2.9.css'/>" type="text/css">
<script
   src="${pageContext.request.contextPath}/woocommerce-FlexSlider-0690ec2/jquery.flexslider-min.js"></script>
<script type="text/javascript">   
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
      
      $("#cancle").click(function() {
         $('#myModal').modal('hide')
      })
      if($("#loginCheck").val()=="Y"){
    	  $('#Login').trigger('click'); 
      }
   }); 

</script>
<style type="text/css">
#SEARCHDIV {
   border: 1PX solid white;
}
</style>
<title>:: YOLO ::</title>
</head>
<body>
	<input type="hidden" id="loginCheck" name="loginCheck" value="${param.loginCheck }">
   <section class="hero"> <header>
   <div class="wrapper">
      <%-- <a href="${pageContext.request.contextPath}/index2.do" class="logo"
         style="font-size: 30px;">YOLO</a> <a href="#" class="hamburger"></a> --%>
      <a href="${pageContext.request.contextPath}/index2.do"><img style="    width: 130px;
    margin: 18px 0 0 70px;" alt="logo image" src="${pageContext.request.contextPath}/img/3.png"></a>


      <nav>

      <ul>
         <!-- 상단 네비 -->

         <li><a href="${pageContext.request.contextPath}/about.do">About</a></li>
         <li><a href="${pageContext.request.contextPath}/noticeboard/list.do">Notice</a></li>
         <li><a href="${pageContext.request.contextPath}/contact.do">Contact</a></li>
      </ul>

      <!-- 로그인 전 --> <c:if test="${empty sessionScope.userid }">
         <!-- <a class="btn btn-primary btn-lg login_btn" data-toggle="modal"
            data-target="#myModal2">Join</a> -->
         <a class="btn btn-primary btn-lg login_btn"
            href="${pageContext.request.contextPath}/member/agreement.do">Join</a>

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
                  <div class="modal-body">...</div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-default"
                        data-dismiss="modal">Close</button>
                     <button type="button" class="btn btn-primary">Save
                        changes</button>
                  </div>
               </div>
            </div>
         </div>



         <a class="btn btn-primary btn-lg login_btn" id="Login" data-toggle="modal"
            data-target="#myModal">Login</a>

         <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm">
               <div class="modal-content" style="width: 500px; height: 480px;">
                  <div class="modal-header" style="height: 110px">
                     <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span> <span class="sr-only">Close</span>
                     </button>
                     <h4 class="modal-title" id="myModalLabel"><img style="width: 170px;
    margin-left: 140px;" alt="" src="${pageContext.request.contextPath}/img/3.png"></h4>
                  </div>
                  <div class="modal-body">
                     <form name="frmLogin" id="frmLogin" method="post"
                        action="<c:url value='/login/login.do'/>">
                        <%@ include file="../login/nowLogin.jsp" %> 
                         

                           <%-- <div>
                              <label for="userid" style="margin-right: 14px">&nbsp;&nbsp;&nbsp;아이디</label>
                              <input type="text" name="userid" id="userid"
                                 style="width: 160px" value="${cookie.ck_userid.value}">
                           </div>
                           <div>
                              <label for="pwd">&nbsp;&nbsp;&nbsp;비밀번호</label> <input
                                 type="password" name="pwd" id="pwd" style="width: 160px">
                           </div>
                           <div class="align_right" style="padding-left: 145px">
                              <input type="checkbox" name="chkSaveId" id="chkId"
                                 <c:if test="${!empty cookie.ck_userid }">
                  checked="checked"
               </c:if>>
                              <label for="chkId">아이디 저장하기</label><br>
                           </div>
                           <div class="align_center" style="padding-left: 70px;">
                              <button type="submit" class="btn btn-primary">로그인</button>
                              <button type="button" class="btn btn-primary" id="cancle">
                                 취소 <span class="sr-only">Close</span>
                              </button>

                           </div> --%>

                         
                     </form>

                  </div>
               </div>
            </div>
         </div>
   </div>


   </c:if> <!-- 로그인 후 --> <c:if test="${!empty sessionScope.userid }">

      <a href="${pageContext.request.contextPath}/login/logout.do"
         class="btn btn-primary btn-lg login_btn">로그아웃</a>

      <%-- <a data-toggle="dropdown" class="btn btn-primary login_btn">
         ${sessionScope.userName} 님</a>
      <ul class="dropdown-menu" role="menu">
         <li><a
            href="${pageContext.request.contextPath}/mypage/Favorite/FavoriteClass.do">마이페이지</a></li>
         <li><a href="#">쪽지함</a></li>
         <li class="divider"></li>
         <li><a href="${pageContext.request.contextPath}/login/logout.do">로그아웃</a></li>
         <li><a
            href="${pageContext.request.contextPath}/member/memberOut.do">회원탈퇴</a></li>
      </ul>
      </a> --%>

      
      
      <div class="btn-group" style="padding-left: 30px">
  <button type="button" class="btn btn-default dropdown-toggle btn-primary btn-lg login_btn" data-toggle="dropdown" aria-expanded="false">
    ${sessionScope.userName} 님</span>
  </button>
  <ul class="dropdown-menu" role="menu">
    <li><a href="${pageContext.request.contextPath}/mypage/Favorite/FavoriteClass.do">마이페이지</a></li>
               <li><a href="${pageContext.request.contextPath}/mypage/message/messageSend.do">쪽지함</a></li>
               <li><a href="${pageContext.request.contextPath}/class/clacre.do">클래스등록</a></li>
               <li><a href="${pageContext.request.contextPath}/member/memberOut.do">회원탈퇴</a></li>
  </ul>
</div>

   </c:if> </nav>
   </div>

   </header><!--  end header section  -->