<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/mypage.css" />'>

<style>

#image_preview {
	display: none;
}

#image_preview1 {
	display: none;
}

#image_preview2 {
	display: none;
}
#preview div {
	float:left;
	width: 300px;
	height: 300px;
	margin: 50px;
}




</style>

<script type="text/javascript">
$(document).ready(function() {
	$("#cbTitle").focus();
	
	$("#sendfrm").submit(function() {
		 if($("#cbTitle").val().length<1){
			alert('제목을 입력하세요');
			$("#cbTitle").focus();
			return false;
		}
	$("#sendfrm").submit(function() {
		 if($("#cbContent").val().length<1){
			alert('내용을 입력하세요');
			$("#cbContent").focus();
			return false;
		}
	});
	
	
});
</script>
<div class="container" style="margin-top: 40px;">
		<div class="row">
<div class="col-md-10">
	
	<br>
	<h2>후기작성</h2>
	<br>

	<form id="sendfrm" action='<c:url value="/class/classBoardWrith.do"/>' enctype="multipart/form-data" method="post">
		<br>
		<input type="hidden" value="${cNo }" name="cNo" id ="cNo">
		<div class="container">
			<div class="row">
				<div class="col-md-1" style="text-align: center;">
					<label for="msTitle">제목</label>
				</div>
				<div class="col-md-8">
					<input type="text" class="form-control" name="cbTitle" id="cbTitle"
						placeholder="제목을 입력하세요.">
				</div>
			</div>
		</div>
		<br>
		
		
		<div class="section" id="section2">
				<div class="intro container">
					<p>
						<label for="image">이미지등록1:</label> <input type="file"
							name="fileMap[0]" id="image" />
					</p>
					<p>
						<label for="image">이미지등록2:</label> <input type="file"
							name="fileMap[1]" id="image1" />
					</p>
					<p>
						<label for="image">이미지등록3:</label> <input type="file"
							name="fileMap[2]" id="image2" />
					</p>

				</div>
				<br>
				<br>
				<div id="preview" >
					<div id="image_preview">
						<b>이미지1 미리보기</b><br> <img src="#" id="preview" class="preImg" height="300px"/>
						<br /> <a href="#">Remove</a>
					</div>
					<div id="image_preview1">
						<b>이미지 2 미리보기</b> <img src="#" id="preview1" class="preImg" height="300px"/> <br />
						<a href="#">Remove</a>
					</div>
					<div id="image_preview2">
						<b>이미지3 미리보기</b> <img src="#" id="preview2" class="preImg" height="300px"/> <br />
						<a href="#">Remove</a>
					</div>
				
				</div>


				<script type="text/javascript">
					$('#image').on('change',function() {
										ext = $(this).val().split('.').pop().toLowerCase(); //확장자
										
										//배열에 추출한 확장자가 존재하는지 체크
										if ($.inArray(ext, [ 'gif', 'png',
												'jpg', 'jpeg' ]) == -1) {
											resetFormElement($(this)); //폼 초기화
											window
													.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
										} else {
											file = $('#image').prop("files")[0];
											blobURL = window.URL
													.createObjectURL(file);
											$('#image_preview img').visibility
											$('#image_preview img').attr('src',
													blobURL);
											$('#image_preview').slideDown(); //업로드한 이미지 미리보기 
											//$(this).slideUp(); //파일 양식 감춤
										}
									});
					$('#image1').on('change',function() {
										ext = $(this).val().split('.').pop()
												.toLowerCase(); //확장자

										//배열에 추출한 확장자가 존재하는지 체크
										if ($.inArray(ext, [ 'gif', 'png',
												'jpg', 'jpeg' ]) == -1) {
											resetFormElement($(this)); //폼 초기화
											window
													.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
										} else {
											file = $('#image1').prop("files")[0];
											blobURL = window.URL
													.createObjectURL(file);
											$('#image_preview1 img').attr(
													'src', blobURL);
											$('#image_preview1').slideDown(); //업로드한 이미지 미리보기 
											//$(this).slideUp(); //파일 양식 감춤
										}
									});
					$('#image2').on('change',function() {
										ext = $(this).val().split('.').pop()
												.toLowerCase(); //확장자

										//배열에 추출한 확장자가 존재하는지 체크
										if ($.inArray(ext, [ 'gif', 'png',
												'jpg', 'jpeg' ]) == -1) {
											resetFormElement($(this)); //폼 초기화
											window
													.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
										} else {
											file = $('#image2').prop("files")[0];
											blobURL = window.URL
													.createObjectURL(file);
											$('#image_preview2 img').attr(
													'src', blobURL);
											$('#image_preview2').slideDown(); //업로드한 이미지 미리보기 
											//$(this).slideUp(); //파일 양식 감춤
										}
									});
					

					$('#image_preview a').bind('click', function() {
						resetFormElement($('#image')); //전달한 양식 초기화
						$('#image').slideDown(); //파일 양식 보여줌
						$(this).parent().slideUp(); //미리 보기 영역 감춤
						return false; //기본 이벤트 막음
					});
					$('#image_preview1 a').bind('click', function() {
						resetFormElement($('#image1')); //전달한 양식 초기화
						$('#image1').slideDown(); //파일 양식 보여줌
						$(this).parent().slideUp(); //미리 보기 영역 감춤
						return false; //기본 이벤트 막음
					});
					$('#image_preview2 a').bind('click', function() {
						resetFormElement($('#image2')); //전달한 양식 초기화
						$('#image2').slideDown(); //파일 양식 보여줌
						$(this).parent().slideUp(); //미리 보기 영역 감춤
						return false; //기본 이벤트 막음
					});
	

					/** 
					 * 폼요소 초기화 
					 * Reset form element
					 * 
					 * @param e jQuery object
					 */
					function resetFormElement(e) {
						e.wrap('<form>').closest('form').get(0).reset();
						//리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
						//요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
						//DOM에서 제공하는 초기화 메서드 reset()을 호출
						e.unwrap(); //감싼 <form> 태그를 제거
					}
				</script>
				</div>


	<div class="col-md-10">
<textarea class="ckeditor" id="cbContent" name="cbContent" style="margin-top: 400px"></textarea>
<script type="text/javascript">
	CKEDITOR.replace( 'Contents',{
		 height : '600px',
		 weigth : '100%'
	});
	
</script>
		
			<button type="submit" class="btn btn-default" style="float: right;">보내기</button>
	
	<br> <br>	
	</div>

	</form>
	</div>
	</div>
	</div>
	



<%@ include file="../mypage/mypagebottom.jsp"%>