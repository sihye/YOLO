<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypagemessagetop.jsp"%>

<script>
	var editor;
	CKEDITOR
			.on(
					'instanceReady',
					function(ev) {
						editor = ev.editor;
						document.getElementById('readOnlyOn').style.display = '';
						editor
								.on(
										'readOnly',
										function() {
											document
													.getElementById('readOnlyOn').style.display = this.readOnly ? 'none'
													: '';
											document
													.getElementById('readOnlyOff').style.display = this.readOnly ? ''
													: 'none';
										});
					});

	function toggleReadOnly(isReadOnly) {
		editor.setReadOnly(isReadOnly);
	}
</script>

<script type="text/javascript">
	CKEDITOR.replace('Contents', {
		toolbar : 'Full',
		uiColor : '',
	});
</script>
<script type="text/javascript">
$(document).ready(function() {
	$("#mUserid").focus();
	
	$("#sendfrm").submit(function() {
		if($("#msgUserid").val()==''){
			alert('받는사람을 입력하세요');
			$("#msgUserid").focus();
			return false;
		}else if($("#msTitle").val().length<1){
			alert('제목을 입력하세요');
			$("#msTitle").focus();
			return false;
		}
	});
});
</script>
<div class="col-md-10">
	<ul class="nav nav-tabs nav-justified">
		<li class="active"><a
			href='<c:url value="/mypage/message/messageSend.do"/>'>쪽지보내기</a></li>
		<li><a href='<c:url value="/mypage/message/sendbox.do"/>'>보낸쪽지함</a></li>
		<li><a href='<c:url value="/mypage/message/getbox.do"/>'>받은쪽지함</a></li>
	</ul>
	<br>
	<h2>쪽지쓰기</h2>
	<br>

	<form id="sendfrm" action='<c:url value="/mypage/message/insertMessage.do"/>'>
		<div class="container">
			<div class="row">
				<div class="col-md-1" style="text-align: center;">
					<label for="mUserid">받는사람</label>
				</div>
				<div class="col-md-8">
					<input type="text" class="form-control" name="msgUserid" id="msgUserid"
						placeholder="받는 사람을 선택하거나 직접 입력해주세요.">
				</div>
				<div class="col-md-1">
					<a data-toggle="modal"
						href='<c:url value="/mypage/message/idSelect.do"/>'
						data-target="#modal-get" role="button" data-backdrop="static">
						<span class="btn btn-primary">받는사람</span>
					</a>

					<div id="modal-get" class="modal fade" tabindex="-1" role="dialog"
						aria-labelledby="받는사람 등록" aria-describedby="받는사람추가 모달">
						<div class="modal-dialog" style="width: 500px; height: 500px">
							<div class="modal-content"></div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<br>
		<div class="container">
			<div class="row">
				<div class="col-md-1" style="text-align: center;">
					<label for="msTitle">제목</label>
				</div>
				<div class="col-md-8">
					<input type="text" class="form-control" name="msTitle" id="msTitle"
						placeholder="제목을 입력하세요.">
				</div>
			</div>
		</div>
		<br>
		<textarea class="ckeditor" id="msContent" name="msContent"></textarea>

		<div style="text-align: center;">
			<button type="submit" class="btn btn-default">보내기</button>
		</div>
	</form>
	<br> <br>


</div>
<%@ include file="../mypagebottom.jsp"%>