<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypagemessagetop.jsp"%>

<script>
    var editor;
    CKEDITOR.on( 'instanceReady', function( ev ) {
        editor = ev.editor;
        document.getElementById( 'readOnlyOn' ).style.display = '';
        editor.on( 'readOnly', function() {
            document.getElementById( 'readOnlyOn' ).style.display = this.readOnly ? 'none' : '';
            document.getElementById( 'readOnlyOff' ).style.display = this.readOnly ? '' : 'none';
        });
    });
   
    function toggleReadOnly( isReadOnly ) {
        editor.setReadOnly( isReadOnly );
    }
</script>
<script type="text/javascript">
    CKEDITOR.replace('Contents',{
            toolbar: 'Full',
            uiColor: '',
        }
    );
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

	<form>
			<div class="container">
				<div class="row">
					<div class="col-md-1" style="text-align: center;">
						<label for="getName">받는사람</label>
					</div>
					<div class="col-md-8">
						<input type="text" class="form-control" id="getName"
							placeholder="받는 사람을 선택하거나 직접 입력해주세요.">
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-default" data-toggle="modal" data-target=".bs-example-modal-sm">받는사람</button>
						
					</div>
				</div>
			</div>
			<br>
			<div class="container">
				<div class="row">
					<div class="col-md-1" style="text-align: center;">
						<label for="getTitle">제목</label>
					</div>
					<div class="col-md-8">
						<input type="text" class="form-control" id="getName"
							placeholder="제목을 입력하세요.">
					</div>				
				</div>
			</div>
			<br>
		<textarea class="ckeditor" id="Content" name="Content"></textarea>



		<div style="text-align: center;">
			<button type="submit" class="btn btn-default">보내기</button>
		</div>
	</form>
	<br> <br>


</div>
<%@ include file="../mypagebottom.jsp"%>