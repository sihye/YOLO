<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="mypageMYBBStop.jsp"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
</style>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<script>                

        $(document).ready(function() {

            //datepicker 한국어로 사용하기 위한 언어설정
            $.datepicker.setDefaults($.datepicker.regional['ko']);     
        
            // Datepicker            
            $(".datepicker").datepicker({
                showButtonPanel: true,
                dateFormat: "yy-mm-dd",
                onClose : function ( selectedDate ) {
                
                    var eleId = $(this).attr("id");
                    var optionName = "";

                    if(eleId.indexOf("StartDate") > 0) {
                        eleId = eleId.replace("StartDate", "EndDate");
                        optionName = "minDate";
                    } else {
                        eleId = eleId.replace("EndDate", "StartDate");
                        optionName = "maxDate";
                    }

                    $("#"+eleId).datepicker( "option", optionName, selectedDate );        
                    $(".searchDate").find(".chkbox2").removeClass("on"); 
                }
            }); 

            //시작일.
            /*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
                // 시작일 datepicker가 닫힐때
                // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
                $(".searchDate").find(".chkbox2").removeClass("on");
            });
            */

            //종료일.
            /*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
                // 종료일 datepicker가 닫힐때
                // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
                $(".searchDate").find(".chkbox2").removeClass("on");
            });
            */

            $(".dateclick").dateclick();    // DateClick
            $(".searchDate").schDate();        // searchDate
            
        });

        // Search Date
        jQuery.fn.schDate = function(){
            var $obj = $(this);
            var $chk = $obj.find("input[type=radio]");
            $chk.click(function(){                
                $('input:not(:checked)').parent(".chkbox2").removeClass("on");
                $('input:checked').parent(".chkbox2").addClass("on");                    
            });
        };

        // DateClick
        jQuery.fn.dateclick = function(){
            var $obj = $(this);
            $obj.click(function(){
                $(this).parent().find("input").focus();
            });
        }    

        
        function setSearchDate(start){

            var num = start.substring(0,1);
            var str = start.substring(1,2);

            var today = new Date();

            //var year = today.getFullYear();
            //var month = today.getMonth() + 1;
            //var day = today.getDate();
            
            var endDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#searchEndDate').val(endDate);
            
            if(str == 'd'){
                today.setDate(today.getDate() - num);
            }else if (str == 'w'){
                today.setDate(today.getDate() - (num*7));
            }else if (str == 'm'){
                today.setMonth(today.getMonth() - num);
                today.setDate(today.getDate() + 1);
            }

            var startDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#searchStartDate').val(startDate);
                    
            // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
            $("#searchEndDate").datepicker( "option", "minDate", startDate );
            
            // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
            $("#searchStartDate").datepicker( "option", "maxDate", endDate );

        }
        function pageFunc(curPage){
    		document.frmPage.currentPage.value=curPage;
    		frmPage.submit();
    	}
            
        </script>

<!-- 페이징 처리를 위한 form 태그 -->
<form name="frmPage" method="post"
	action='<c:url value="/mypage/Mybbs/reviewboard.do" />'>
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchCondition" value="${param.searchCondition }"> <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchStartDate"
		value="${param.searchStartDate}"> <input type="hidden"
		name="searchEndDate" value="${param.searchEndDate}">
</form>



<div class="col-md-10">
	<ul class="nav nav-tabs nav-justified">
		<li><a href='<c:url value="/mypage/Mybbs/qnaboard.do"/>'>문의/답변</a></li>
		<li class="active"><a
			href='<c:url value="/mypage/Mybbs/reviewboard.do"/>'>후기</a></li>
	</ul>
	<br>
	<h2>후기</h2>
	<form>

		<!-- search -->
		<table class="searchBox">
			<caption>조회</caption>
			<colgroup>
				<col width="123px">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>조회기간</th>
					<td>
						<ul class="searchDate">
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType1" onclick="setSearchDate('0d')" />
									<label for="dateType1">당일</label>
							</span></li>
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType2" onclick="setSearchDate('3d')" />
									<label for="dateType2">3일</label>
							</span></li>
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType3" onclick="setSearchDate('1w')" />
									<label for="dateType3">1주</label>
							</span></li>
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType4" onclick="setSearchDate('2w')" />
									<label for="dateType4">2주</label>
							</span></li>
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType5" onclick="setSearchDate('1m')" />
									<label for="dateType5">1개월</label>
							</span></li>
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType6" onclick="setSearchDate('3m')" />
									<label for="dateType6">3개월</label>
							</span></li>
							<li><span class="chkbox2"> <input type="radio"
									name="dateType" id="dateType7" onclick="setSearchDate('6m')" />
									<label for="dateType7">6개월</label>
							</span></li>
						</ul>

						<div class="clearfix">
							<!-- 시작일 -->
							<span class="dset"> <input type="text"
								class="datepicker inpType" name="searchStartDate"
								id="searchStartDate"> 
							</span> <span class="demi">~</span>
							<!-- 종료일 -->
							<span class="dset"> <input type="text"
								class="datepicker inpType" name="searchEndDate"
								id="searchEndDate"> 
							</span> 
						</div>
						<div class="search1" style="margin-top: 10px;">
							<select class="selec" id="searchCondition" name="searchCondition"><option
									selected="selected" value="C_NAME">클래스명</option>
								<option value="CB_CONTENT">내용</option>
							</select> <input class="txt" id="searchKeyword" name="searchKeyword" type="text"/> 
							<input type="submit" value="조회하기">
						</div>
					</td>
				</tr>
			<tbody>
		</table>
	</form>

	<br>
	<!-- //기간별조회 -->
	<table class="table table-hover">
		<thead>
			<tr style="background: skyblue">
				<th>번호</th>
				<th>클래스명</th>
				<th>내용</th>
				<th>문의일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="map" items="${alist }">
				<tr>
					<td>${map["CB_NO"] }</td>
					<td>
					<a href='<c:url value="/class/boardDetail.do?cbNo=${map['CB_NO'] }"/>'>${map["C_NAME"] }</a>
					</td>
					<c:if test="${fn:length(map['CB_CONTENT'])>15 }">
							<td>${fn:substring(map["CB_CONTENT"], 0, 15) }...</a></td>
						</c:if>
						<c:if test="${fn:length(map['CB_CONTENT'])<=15 }">
							<td>${map["CB_CONTENT"] }</a></td>
						</c:if>
					<td>${map["CB_REGDATE"] }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="divPage" style="text-align: center">
	<!-- 페이지 번호 추가 -->
	<!-- 이전 블럭으로 이동 ◀-->
	<nav>
		<ul class="pagination">

			<c:if test="${pagingInfo.firstPage>1 }">
				<li><a href="#" aria-label="Previous" 
				onclick="pageFunc(${pagingInfo.firstPage-1})">
				<span aria-hidden="true">&laquo;</span></a></li>
			</c:if>

			<c:forEach var="i" begin="${pagingInfo.firstPage }"
				end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
					<li class="active"><a href="#"> ${i}<span class="sr-only">${i }</span></a></li>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<li><a href="#" onclick="pageFunc(${i})">${i}</a></li>
				</c:if>
			</c:forEach>

			<!-- 다음 블럭으로 이동 ▶-->
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
				<li><a href="#" aria-label="Previous" 
				onclick="pageFunc(${pagingInfo.lastPage+1})">
				<span aria-hidden="true">&raquo;</span></a></li>			
			</c:if>

			<!--  페이지 번호 끝 -->
		</ul>
	</nav>
</div>
</div>

<%@ include file="../mypagebottom.jsp"%>