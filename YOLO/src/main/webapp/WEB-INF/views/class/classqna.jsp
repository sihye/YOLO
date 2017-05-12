<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" />
<style>
.btn1 {
	position: relative;
	display: block;
	float: right;
	text-align: center;
	line-height: 36px;
	margin-top: 12px;
	border-radius: 5px;
	cursor: pointer;
	width: 100px;
	height: 30px;
	color: #fff;
	background-color: #2196f3;
	margin: 0;
	padding: 0;
	border: 0;
	font: inherit;
	vertical-align: baseline;
	font-family: NanumBarunGothic, '나눔바른고딕', 'Apple SD Gothic Neo',
		Helvetica, sans-serif, dotum, '돋움', arial;
	font-size: 14px;
	font-weight: 400;
	-webkit-font-smoothing: antialiased;
	text-shadow: rgba(0, 0, 0, .01) 0 0 1px;
}

.submitqna {
	margin-top: 10px;
	margin-bottom: 10px;
	text-align: right;
}

#textarea {
	display: block;
	float: right;
	width: 100%;
	border: 1px solid #dadada;
	border-radius: 10px;
	padding: 16px 3%;
	background-color: #f5f5f5;
	margin-top: 10px;
	word-wrap: break-word;
}
</style>
<script>
	
	$(function() {
		$("#cqSecretcheck").click(function() {
			if($(this).is(":checked")){
				$(this).val('Y')
			}else{
				$(this).val('N')
			}
			
		});
		$("#qnafrm").submit(function() {
			if($("#qnaarea").val()==''){
				alert('질문 내용을 입력하세요');
				$("#qnaarea").focus();
				return false;
			}
			if($("#qnaarea").val().length>200){
				alert('질문 내용을 200자이내로 입력해주세요');
				$("#qnaarea").focus();
				return false;
			}
		});
		$('#qnaarea').keydown(function(){
	        var rows = $('#qnaarea').val().split('\n').length;
	        var maxRows = 5;
	        if( rows > maxRows){
	            alert('5줄 까지만 가능합니다');
	            modifiedText = $('#qnaarea').val().split("\n").slice(0, maxRows);
	            $('#qnaarea').val(modifiedText.join("\n"));
	        }
	       
	    });
		//답글링크를 눌렀을때 에디터 창을 뿌려주는 이벤트, 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
        $(document).on("click","#textarea a", function(){//동적으로 버튼이 생긴 경우 처리 방식
        	var cqNo =$(this).parent().parent().find('input[type="hidden"]').val();
        	var cqRepaycheck = $("#cqRepaycheck").val();   
            if($(this).attr("name")=="pDel"){
                if (confirm("질문을 삭제 하시면 밑에 답글도 모두 삭제 됩니다. 정말 삭제하시겠습니까?") == true){    //확인
                	$(location).attr('href',"<c:url value='/class/updateqnaDelflag.do?cqNo="+cqNo+"&cNo=${param.cNo}&cqRepaycheck="+cqRepaycheck+"'/>");
                       
                }else{   //취소
                    return;
                }
            }else if($(this).attr("name")=="cDel"){
                if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                	$(location).attr('href',"<c:url value='/class/updaterepayDelflag.do?cqNo="+cqNo+"&cNo=${param.cNo}&cqRepaycheck="+cqRepaycheck+"'/>");
                }else{   //취소
                    return;
                }
            }else if( $("#repayfrm").length > 0){
            	 $("#repayfrm").remove();
            }else{
                //자기 부모의 tr을 알아낸다.
                var parentElement = $(this).parent();
                //댓글달기 창을 없앤다.
                $("#repayfrm").remove();
                //부모의 하단에 댓글달기 창을 삽입
                
                var commentEditor ='<form id="repayfrm" action="<c:url value='/class/insertrepay.do'/>">'+
                	'<input type="hidden" name="cNo" value="${param.cNo }">'+
                	'<input type="hidden" name="cqNo" value="'+cqNo+'">'+
                	'<textarea id="repayarea" class="form-control" rows="5" style="resize: none" name="cqrContent"'+
        				'placeholder="질문에 대한 답변을 작성하세요.(200자이내)"></textarea>'+
        			'<div class="submitqna">'+
        				'<button type="submit" class="btn1">답변하기</button>'+
        			'</div></form>';
                                       
                parentElement.after(commentEditor);
            }
        
            $("#repayfrm").submit(function() {
    			if($("#repayarea").val()==''){
    				alert('답변 내용을 입력하세요');
    				$("#repayarea").focus();
    				return false;
    			}
    			if($("#repayarea").val().length>200){
    				alert('답변 내용을 200자이내로 입력해주세요');
    				$("#repayarea").focus();
    				return false;
    			}
    		});  
    				$('#repayarea').keydown(function(){
    			        var rows = $('#repayarea').val().split('\n').length;
    			        var maxRows = 5;
    			        if( rows > maxRows){
    			            alert('5줄 까지만 가능합니다');
    			            modifiedText = $('#repayarea').val().split("\n").slice(0, maxRows);
    			            $('#repayarea').val(modifiedText.join("\n"));
    			        }
    			    });
        }); 
			
	});

</script>
<div class="qnatitle" style="text-align: center;">
	<h3 style="color: skyblue">궁금한 점이 있으신가요? 문의해 주시면 호스트가 답변을 해드립니다.</h3>
</div>
<hr>
<div class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<c:if test="${param.hostId !=sessionScope.userid }">
				<form id="qnafrm" action='<c:url value="/class/insertqna.do"/>'>
					<input type="hidden" name="cNo" value="${param.cNo }">
					<div class="subtitle">
						<h4 style="color: skyblue">Q&A</h4>
					</div>
					<textarea id="qnaarea" class="form-control" rows="5" style="resize: none"
						name="cqContent" placeholder="문의해 주시면 호스트가 답변을 해드립니다.(200자이내)"></textarea>
					<div class="submitqna">
						<label style="margin-top: 5px; margin-right: 20px;"><input
							type="checkbox" id="cqSecretcheck" name="cqSecretcheck" value="N">
							비밀글 </label>
						<button type="submit" class="btn1">문의하기</button>
					</div>
				</form>
				<hr>
			</c:if>
			<% pageContext.setAttribute("newLine", "\r\n"); %>
			<c:forEach var="vo" items="${qnaList }">
				<c:if test="${vo.cqDelflag=='N' }">
					<c:if test="${param.hostId ==sessionScope.userid }">
						<c:if test="${vo.cqRepaycheck=='N'}">
							<div id="textarea" contentEditable="inherit">
								<input type="hidden" id="cqNo" value="${vo.cqNo }"> 
								<input type="hidden" id="cqRepaycheck" value="${vo.cqRepaycheck }">
								<p style="color: #b6b6b6">${vo.mUserid }님의질문</p>
								<P>${fn:replace(vo.cqContent, newLine, "<br>")}</P>
								<p style="text-align: right; color: #b6b6b6;">
									<fmt:formatDate value="${vo.cRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/><a style="cursor: pointer;" id="cAdd"
										name="cAdd">답변</a> | <a
										style="cursor: pointer;" name="pDel">삭제</a>
								</p>
							</div>
						</c:if>
						<c:if test="${vo.cqRepaycheck=='Y'}">
							<div id="textarea" contentEditable="inherit">
								<input type="hidden" id="cqNo" value="${vo.cqNo }"> <input
									type="hidden" id="cqRepaycheck" value="${vo.cqRepaycheck }">
								<p style="color: #b6b6b6">${vo.mUserid }님의질문</p>
								<P>${fn:replace(vo.cqContent, newLine, "<br>")}</P>
								<p style="text-align: right; color: #b6b6b6;">
								<fmt:formatDate value="${vo.cRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/><a
										style="cursor: pointer;" name="pDel">삭제</a></p>
							</div>
							<c:forEach var="repayVo" items="${repayList }">
								<c:if test="${vo.cqNo==repayVo.cqNo && repayVo.cqrDelflag=='N'}">
									<div class="row">
										<div class="col-md-1">
											<img alt="a이미지" src='<c:url value="/img/aimg.png"/>'
												style="margin: 20px 0px; margin-left: 10px">
										</div>
										<div class="col-md-11">
											<div id="textarea" contentEditable="false">
												<input type="hidden" id="cqNo" value="${vo.cqNo }"> <input
									type="hidden" id="cqRepaycheck" value="${vo.cqRepaycheck }">
												<p style="color: #b6b6b6">호스트 답변</p>
												<p>${fn:replace(repayVo.cqrContent, newLine, "<br>")}</p>
												<p style="text-align: right; color: #b6b6b6;">
												<fmt:formatDate value="${repayVo.cqrRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
												<a style="cursor: pointer;"
														name="cDel">삭제</a>
												</p>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
						
					</c:if>




					<c:if
						test="${param.hostId !=sessionScope.userid &&vo.mUserid ==sessionScope.userid}">
						<c:if test="${vo.cqRepaycheck=='N' }">
							<div id="textarea" contentEditable="inherit">
								<input type="hidden" id="cqNo" value="${vo.cqNo }">
								<input type="hidden" id="cqRepaycheck"
									value="${vo.cqRepaycheck }"> <input type="hidden"
									id="cqNo" value="${vo.cqNo }">
								<p style="color: #b6b6b6">${vo.mUserid }님의질문</p>
								<P>
								${fn:replace(vo.cqContent, newLine, "<br>")}</P>
								<p style="text-align: right; color: #b6b6b6;">
								<fmt:formatDate value="${vo.cRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
								 <a style="cursor: pointer;" name="pDel">삭제</a>
								</p>
							</div>
						</c:if>
						<c:if test="${vo.cqRepaycheck=='Y' }">
							<div id="textarea" contentEditable="inherit">
								<input type="hidden" id="cqNo" value="${vo.cqNo }">
								<p style="color: #b6b6b6">${vo.mUserid }님의질문</p>
								<P>${fn:replace(vo.cqContent, newLine, "<br>")}</P>
								<p style="text-align: right; color: #b6b6b6;">
								<fmt:formatDate value="${vo.cRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
								<a style="cursor: pointer;" name="pDel">삭제</a></p>
							</div>
							<c:forEach var="repayVo" items="${repayList }">
								<c:if test="${vo.cqNo==repayVo.cqNo&&repayVo.cqrDelflag=='N' }">
									<div class="row">
										<div class="col-md-1">
											<img alt="a이미지" src='<c:url value="/img/aimg.png"/>'
												style="margin: 20px 0px; margin-left: 10px">
										</div>
										<div class="col-md-11">
											<div id="textarea" contentEditable="false">
												<input type="hidden" id="cqNo" value="${vo.cqNo }">
												<p style="color: #b6b6b6">호스트 답변</p>
												<p>${fn:replace(repayVo.cqrContent, newLine, "<br>")}</p>
												<p style="text-align: right; color: #b6b6b6;">
													<fmt:formatDate value="${repayVo.cqrRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
													</p>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:if>



					<c:if
						test="${param.hostId !=sessionScope.userid && vo.mUserid !=sessionScope.userid}">
						<c:if test="${vo.cqSecretcheck=='Y'&& vo.cqRepaycheck=='N' }">
							<div id="textarea" contentEditable="false">
								<p style="color: #b6b6b6">${vo.mUserid }의질문</p>
								<p>
									<img alt="look이미지" src='<c:url value="/img/lock.png"/>'>비밀
									글입니다
								</p>
								<p style="text-align: right; color: #b6b6b6;">
								<fmt:formatDate value="${vo.cRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
							</div>
						</c:if>
						<c:if test="${vo.cqSecretcheck=='N'&& vo.cqRepaycheck=='N' }">
							<div id="textarea" contentEditable="inherit">
								<input type="hidden" id="cqNo" value="${vo.cqNo }">
								<p style="color: #b6b6b6">${vo.mUserid }님의질문</p>
								<P>${fn:replace(vo.cqContent, newLine, "<br>")}</P>
								<p style="text-align: right; color: #b6b6b6;">
								<fmt:formatDate value="${vo.cRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
								</p>
							</div>
						</c:if>
						<c:if test="${vo.cqSecretcheck=='N'&& vo.cqRepaycheck=='Y' }">
							<div id="textarea" contentEditable="inherit">
								<input type="hidden" id="cqNo" value="${vo.cqNo }">
								<p style="color: #b6b6b6">${vo.mUserid }님의질문</p>
								<P>${fn:replace(vo.cqContent, newLine, "<br>")}</P>
								<p style="text-align: right; color: #b6b6b6;">
								<fmt:formatDate value="${vo.cRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
								</p>
							</div>
							<c:forEach var="repayVo" items="${repayList }">
								<c:if test="${vo.cqNo==repayVo.cqNo &&repayVo.cqrDelflag=='N' }">
									<div class="row">
										<div class="col-md-1">
											<img alt="a이미지" src='<c:url value="/img/aimg.png"/>'
												style="margin: 20px 0px; margin-left: 10px">
										</div>
										<div class="col-md-11">
											<div id="textarea" contentEditable="false">
												<p style="color: #b6b6b6">호스트 답변</p>
												<p>
													<img alt="look이미지" src='<c:url value="/img/lock.png"/>'>비밀
													글입니다
												</p>
												<p style="text-align: right; color: #b6b6b6;">
												<fmt:formatDate value="${repayVo.cqrRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
												</p>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>

						<c:if test="${vo.cqSecretcheck=='Y'&& vo.cqRepaycheck=='Y' }">
							<div id="textarea" contentEditable="false">
								<p style="color: #b6b6b6">${vo.mUserid }의질문</p>
								<p>
									<img alt="look이미지" src='<c:url value="/img/lock.png"/>'>비밀
									글입니다
								</p>
								<p style="text-align: right; color: #b6b6b6;">
								<fmt:formatDate value="${vo.cRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
								</p>
							</div>
							<c:forEach var="repayVo" items="${repayList }">
								<c:if test="${vo.cqNo==repayVo.cqNo &&repayVo.cqrDelflag=='N'}">
									<div class="row">
										<div class="col-md-1">
											<img alt="a이미지" src='<c:url value="/img/aimg.png"/>'
												style="margin: 20px 0px; margin-left: 10px">
										</div>
										<div class="col-md-11">
											<div id="textarea" contentEditable="false">
												<p style="color: #b6b6b6">호스트 답변</p>
												<p>
													<img alt="look이미지" src='<c:url value="/img/lock.png"/>'>비밀
													글입니다
												</p>
												<p style="text-align: right; color: #b6b6b6;">
												<fmt:formatDate value="${repayVo.cqrRegdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
												</p>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</c:if>
				</c:if>
			</c:forEach>

		</div>
		<div class="col-md-1"></div>
	</div>

</div>