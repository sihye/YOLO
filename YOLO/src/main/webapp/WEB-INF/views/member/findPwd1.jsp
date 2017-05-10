<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../member/findtop2.jsp" %>       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checkUserid.jsp</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mainstyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mystyle.css" />

<script type="text/javascript" 
   src='<c:url value="/jquery/jquery-3.1.1.min.js" />'></script>


</head>
<body>
<div style="padding-left: 280px">
<img src="${pageContext.request.contextPath}/img/pwd1.jpg">
</div> 
<article style="padding-left: 30%">
   <div>
   <span style="font-size: 22px">${result}</span>
      <form name="frmId" method="post" id="frm2"
      action="<c:url value='/member/findPwd1.do'/>">
      <div>
      <br>
      	<input type="hidden" value="mUserid">
        <input type="text" class="form-control" placeholder="답변을 입력하세요" aria-describedby="sizing-addon2" style="width: 50%"
              name="mQuestionanswer" id="mQuestionanswer" value="${param.mQuestionanswer}">
      </div><br>
      <div style="float: left">
        <input type="text" class="form-control" placeholder="이메일 @ 앞부분" style="width: 90%; float: left"
              name="mEmail1" id="mEmail1" value="${param.email1}"><label>&nbsp;@</label>
        </div>
        <div style="float: rigth">      
        <input type="text" class="form-control" placeholder="이메일 @ 뒷부분"  style="width: 25%; float: rigth"
              name="mEmail2" id="mEmail2" value="${param.email2}">         
        </div>   <br>
      <div style="padding-left: 20%">            
         <button type="button" class="btn btn-primary btn-sm" id="form_btn" data-backdrop="true">비밀번호 찾기</button>
		
      </div>
      </form><br>

      


<!-- Modal -->
<div class="modal fade" id="myModal11" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullsize">
    <div class="modal-content">
      <div class="modal-body">
        <h3 style="font-size: 20px">비밀번호를 가입시 입력하신 이메일로 전송중입니다.</h3><br>
        <h3 style="font-size: 20px">잠시만 기다려 주세요.</h3>
      </div>
    </div>
  </div>
</div>

      
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<script type="text/javascript">
    $('#form_btn').click(function(){
       
          if($("#mQuestionanswer").val()==''){
             alert('답변을 입력하세요');
             $("mQuestionanswer").focus();
             return false;
          }else if($("#mEmail1").val()==''){
             alert('이메일을 입력하세요');
             $("#mEmail1").focus();
             return false;
          }else if($("#mEmail2").val()==''){
             alert('이메일을 끝까지 입력하세요');
             $("#mEmail2").focus();
             return false;
          }      
          $('#myModal11').modal("show");
          setTimeout($.fn.send, 1000);
    });
     
     
$.fn.send = function(){
	 $.ajax({
            url : '<c:url value="/member/findPwd1.do"/>',
            type : "POST",
            async: true,
            data : $('#frm2').serializeArray(),
            dataType : "text",
            success : function(data) {
              //alert(data);
               if(data == 2){
            	   $('#myModal11').modal("hide");
                  alert("답변 또는 이메일이 틀렸습니다");
                  $('#mQuestionanswer').val('');
                  $('#mEmail1').val('');
                  $('#mEmail2').val('');
               }else{
            	   $('#myModal11').modal("hide");
                  setTimeout(function(){
                  		alert("가입시 입력하신 이메일로 비밀번호가 발송되었습니다.");
                  		location.href="/yolo/index2.do";
                  		
                  }, 500);
                  
               }
            },
            fail : function(request,status,error){
                alert("요청 code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"실패:"+error);
              },
            error:function(request,status,error){
                alert("요청 code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"에러:"+error);
              }
     });
}
</script>

   </div>
</article>
</body>
</html>
</div>
</div>
<%@ include file="../inc/bottom.jsp" %>