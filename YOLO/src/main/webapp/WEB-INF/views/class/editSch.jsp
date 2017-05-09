<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>::YOLO - 클래스 수정하기::</title>
<meta name="Resource-type" content="Document" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/examples.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- 시간선택 -->
<script
	src="${pageContext.request.contextPath}/js/jquery.clockpick.1.2.9.js"></script>
<link rel="stylesheet"
	href="<c:url value='/css/jquery.clockpick.1.2.9.css'/>" type="text/css">
<script type="text/javascript">
	$(function() {
		$("#claSchFrm").submit(function() {
			if($("#searchStartDate").val()==''){
				alert("클래스 실행 기간을 입력해주세요!");
				$("#searchStartDate").focus();
				return false;
			}else if($("#searchEndDate").val()==''){
				alert("클래스 실행 기간을 입력해주세요!");
				$("#searchEndDate").focus();
				return false;
			}else if($("#scStarttime1").val()==''){
				alert("하나 이상의 시간을 등록해야 합니다!");
				$("#scStarttime1").focus();
				return false;
			}else if($("#scEndtime1").val()==''){
				alert("하나 이상의 시간을 등록해야 합니다!");
				$("#scEndtime1").focus();
				return false;
			}
		})		
	})
</script>
<style>
.section {
	height: 900px;
	margin-top: 50px;
}

.form-control {
	margin-bottom: 10px;
}

h1 {
	border-bottom: 3px solid #F2F2F2;
	padding-bottom: 5px;
}

body {
	background-image: url("<c:url value='/img/images.jpg'/>");
	background-repeat: no-repeat;
	background-size: cover;
}
#single{
	margin-left: 1060px;
    margin-top: 20px;
}
.before{
	margin-left: 1000px;
}
</style>

</head>
<form action="<c:url value='/class/schEdit.do'/>" name="claSchFrm" id="claSchFrm" method="post" >
<div class="section container" style="height: 500px;" id="section3">
				<div class="intro">
					<h1>스케줄 수정하기</h1>
					<br>
					<hr>
					<input type="text" name="cNo" value="${cNO}">
					<div id="oneDay" class="sch">
						<!-- 기간 -->
						<script>
							$(document).ready(function() {	
								//datepicker 한국어로 사용하기 위한 언어설정
								$.datepicker.setDefaults($.datepicker.regional['ko']);
								// Datepicker            
								$(".datepicker").datepicker({
									showButtonPanel : true,
									dateFormat : "yy-mm-dd",
									onClose : function(selectedDate) {
										var eleId = $(this).attr("id");
										var optionName = "";
										if (eleId.indexOf("StartDate") > 0) {
											eleId = eleId.replace("StartDate","EndDate");
											optionName = "minDate";
										} else {
											eleId = eleId.replace("EndDate","StartDate");
											optionName = "maxDate";
										}

										$("#"+ eleId).datepicker("option",optionName,selectedDate);
										$(".searchDate").find(".chkbox2").removeClass("on");
									}
								});
								
								$(".dateclick").dateclick(); // DateClick
								$(".searchDate").schDate(); // searchDate

							});

							// Search Date
							jQuery.fn.schDate = function() {
								var $obj = $(this);
								var $chk = $obj.find("input[type=radio]");
								$chk.click(function() {
									$('input:not(:checked)').parent(".chkbox2")
											.removeClass("on");
									$('input:checked').parent(".chkbox2")
											.addClass("on");
								});
							};

							// DateClick
							jQuery.fn.dateclick = function() {
								var $obj = $(this);
								$obj.click(function() {
									$(this).parent().find("input").focus();
								});
							}

							function setSearchDate(start) {

								var num = start.substring(0, 1);
								var str = start.substring(1, 2);

								var today = new Date();
								var endDate = $.datepicker.formatDate('yy-mm-dd', today);
								$('#searchEndDate').val(endDate);

								if (str == 'd') {
									today.setDate(today.getDate() - num);
								} else if (str == 'w') {
									today.setDate(today.getDate() - (num * 7));
								} else if (str == 'm') {
									today.setMonth(today.getMonth() - num);
									today.setDate(today.getDate() + 1);
								}

								var startDate = $.datepicker.formatDate(
										'yy-mm-dd', today);
								$('#searchStartDate').val(startDate);

								// 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
								$("#searchEndDate").datepicker("option",
										"minDate", startDate);

								// 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
								$("#searchStartDate").datepicker("option",
										"maxDate", endDate);
								var now = $.datepicker.formatDate('yy-mm-dd',
										new Date());
								$("#searchStartDate").datepicker("option",
										"minDate", now);

							}
						</script>

						<div class="clearfix container">
							<!-- 시작일 -->
							<span class="dset"> 
							<label for="searchStartDate" class="col-sm-1 control-label">기간</label>
							<input type="text"
								class="datepicker inpType" name="scStartdate"
								id="searchStartDate">
							</span> <span class="demi">~</span>
							<!-- 종료일 -->
							<span class="dset"> <input type="text"
								class="datepicker inpType" name="scEnddate"
								id="searchEndDate">
							</span>
						</div>
						<!-- 요일 -->
						<bR>
						<div class="container">
							<label for="blankCheckbox" class="col-sm-1 control-label">요일</label>
							<div class="checkbox" style="">
								<label><input type="checkbox" id="blankCheckbox"
									value="월" aria-label="...">월 </label> <label><input
									type="checkbox" id="blankCheckbox" value="화" name="scWeek"
									aria-label="...">화 </label> <label><input
									type="checkbox" id="blankCheckbox" value="수" name="scWeek"
									aria-label="...">수 </label> <label><input
									type="checkbox" id="blankCheckbox" value="목" name="scWeek"
									aria-label="...">목 </label> <label><input
									type="checkbox" id="blankCheckbox" value="금" name="scWeek"
									aria-label="...">금 </label> <label><input
									type="checkbox" id="blankCheckbox" value="토" name="scWeek"
									aria-label="...">토 </label> <label><input
									type="checkbox" id="blankCheckbox" value="일" name="scWeek"
									aria-label="...">일 </label>
							</div>
						</div>
						<!-- 시간 -->

						<script type="text/javascript">
							var i = 2;
							$(function() {
								$("#remove").click(function() {
									if($(".wrp > div") .size()==1){
										alert("최소 하나의 시간은 입력해야 합니다.");
										return false;
									}
									$(".wrp div:last").last().remove();
									i--;
								})
								$("#add1").click(function() {
									if($(".wrp > div") .size()==3){
										alert("시간은 최대 3개까지 입력할 수 있습니다.");
										return false;
									}
									$(".wrp").append($("#clock").html());
									$(".wrp div:last input:first").attr({'name':"scStarttime"+ i,'id':"scStarttime"+ i});
									$(".wrp div:last input:last").attr({'name':"scEndtime"+ i,'id':"scEndtime"+ i});
									i++;
									$(".clockpick").clockpick({
										starthour : 0,
										endhour : 23,
										showminutes : false,
										layout : 'Horizontal'
									});
									$("#scEndtime2").click(function(){
										var sTime=0;	
										var arr=$("#scStarttime2").val().split(' ');//12:00 , PM
										console.log(arr);
										if(arr[1]=='PM'){
											var arr2=arr[0].split(":");//12,00
											sTime=Number(arr2[0])+13;
											console.log(sTime);
										}else if(arr[1]=='AM'){
											var arr2=arr[0].split(":");//12,00											
											sTime=Number(arr2[0])+1;
										}
										$("#scEndtime2").clockpick({
											starthour : sTime,
											endhour : 23,
											showminutes : false,
											layout : 'Horizontal'
										});
									})
									$("#scEndtime3").click(function(){
										var sTime=0;	
										var arr=$("#scStarttime3").val().split(' ');//12:00 , PM
										console.log(arr);
										if(arr[1]=='PM'){
											var arr2=arr[0].split(":");//12,00
											sTime=Number(arr2[0])+13;
											console.log(sTime);
										}else if(arr[1]=='AM'){
											var arr2=arr[0].split(":");//12,00											
											sTime=Number(arr2[0])+1;
										}
										$("#scEndtime3").clockpick({
											starthour : sTime,
											endhour : 23,
											showminutes : false,
											layout : 'Horizontal'
										});
									})
									
								})
								$(".clockpick").clockpick({
									starthour : 0,
									endhour : 23,
									showminutes : false,
									layout : 'Horizontal'
								});
								
								$("#scEndtime1").click(function(){
									var sTime=0;
									
									var arr=$("#scStarttime1").val().split(' ');//12:00 , PM
									console.log(arr);
									if(arr[1]=='PM'){
										var arr2=arr[0].split(":");//12,00
										console.log(arr2);
										sTime=Number(arr2[0])+13;
										console.log(sTime);
									}else if(arr[1]=='AM'){
										var arr2=arr[0].split(":");//12,00
										
										sTime=Number(arr2[0])+1;
										console.log(sTime);
									}
									$("#scEndtime1").clockpick({
										starthour : sTime,
										endhour : 23,
										showminutes : false,
										layout : 'Horizontal'
									});
								})								
							})
						</script>
						<div class="wrp" style="margin: 0 auto;">
							<div class="container" id="clock">
							
								<div id="clock1" class="container"><br>
									<label for="scStarttime1" class="col-sm-1 control-label">시작시간</label>
									<input type="text" class="form-control clockpick" id="scStarttime1" style="width: 100px;"
										name="scStarttime1">
									<label for="scStarttime1" class="col-sm-1 control-label">끝시간</label>
									<input type="text" class="form-control endClockpick" id="scEndtime1" style="width: 100px;"
										name="scEndtime1">
								</div>
							</div>
						</div>
					
						<!-- <input type="button" id="add" value="추가">	 -->
						<input type="button" id="add1" class="btn btn-default" value="추가"> 
						<input type="button" id="remove"  class="btn btn-default" value="삭제">
					</div>
					<a class="btn btn-default before" href="#section2">이전</a>
					<input type="submit" id="classSub" name="classSub" class="btn btn-info" value="수정완료">
				</div>
			</div>
			</form>