<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../inc/admin/top.jsp"%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

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
</script>


<script type="text/javascript">
$(document).ready(function() {
	
	if($("#searchCondition").val()=='N_REGDATE'){
		$("#searchKeyword").hide();
		$(".clearfix").show();
	}else{
		$("#searchKeyword").show();
		$("#searchStartDate").val('');
		$("#searchEndDate").val('');
		$(".clearfix").hide();
	}
	
	
	
	
	$("#searchCondition").change(function() {
		var selCondition = $(this).val();
		if(selCondition == 'N_REGDATE'){
			$("#searchKeyword").hide();
			$(".clearfix").show();
		}else{
			$("#searchKeyword").show();
			$("#searchStartDate").val('');
			$("#searchEndDate").val('');
			$(".clearfix").hide();
		}
	});
	
	
	
		
	
	
});
function pageFunc(curPage){
	document.frmPage.currentPage.value=curPage;
	frmPage.submit();
}
function detail(no) {
	var popupX = (window.screen.width / 2) - (400 / 2);
	var popupY= (window.screen.height /2) - (200 / 2);
	 window.open(
			"<c:url value='/admin/badClassDetail.do?cno="+no+ "'/>", '신고내용',
						'width=400,height=200,left='+popupX+',top='+(popupY)+',screenX='+popupX+',screenY='+popupY+',location=yes,resizable=yes'); 
}
 
	
</script>
<style>
.bootstrap-select>.dropdown-toggle {
	width: 60%;
}

th {
	text-align: left;
	width: 200px;
}

#cont1 {
	height: 100%;
}

element.style {
	width: 770%;
}

a {
	color: black;
}

#downA {
	color: blue;
}

#membersave {
	color: blue;
}

#frm1 {
	width: 400px;
	margin: 0 auto;
}

#searchSel {
	margin: 0 auto;
}

#filelabel {
	font-size: 10px;
}
</style>







<div class="container" id="cont1">

	<!-- 페이징 처리를 위한 form 태그 -->
	<form name="frmPage" method="post"
		action='<c:url value="/admin/operatorBadClass.do" />'>
		<input type="hidden" name="currentPage"> <input type="hidden"
			name="searchCondition" value="${param.searchCondition }"> <input
			type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="searchStartDate"
			value="${param.searchStartDate}"> <input type="hidden"
			name="searchEndDate" value="${param.searchEndDate}">
	</form>


	<h2>신고 클래스 관리</h2>
	<br>

	<table class="table table-hover">
		<tr>
			<th>NO</th>
			<th>카테고리</th>
			<th>신고 클래스</th>
			<th>클래스 호스트</th>
			<th>신고 유형</th>
			<th>신고접수일</th>
			<th>클래스처리여부</th>
			<th>처리</th>
		</tr>
		<c:if test="${!empty alist }">
			<c:forEach var="map" items="${alist }">
				<tr>
					<td>${map["C_NO"]}</td>
					<td>${map["K_NAME"]}</td>
					<td>${map["C_NAME"]}</td>
					<td>${map["M_USERID"] }</td>
					<td><a href="#" onclick="detail(${map['C_NO']} )">${map["N_CODE"] }</a></td>
					<td><fmt:formatDate value="${map['N_REGDATE'] }"
							pattern="yyyy-MM-dd" /></td>
					<td>${map["C_DEL"] }</td>
					<td><c:if test="${map['C_DEL'] eq 'N' }">
							<a
								href="<c:url value='/admin/editBadclass.do?type=del&cNo=${map["C_NO"] }'/>"
								onclick="return confirm(&quot;정말 ${map['C_NAME']} 클래스를 삭제하시겠습니까 ?&quot;)">삭제</a>
						</c:if> <c:if test="${map['C_DEL'] eq 'Y' }">
							<a
								href="<c:url value='/admin/editBadclass.do?type=reset&cNo=${map["C_NO"] }'/>"
								onclick="return confirm(&quot;정말  ${map['C_NAME']} 클래스에 대한 삭제취소를 하시겠습니까 ?&quot;)">삭제취소</a>
						</c:if></td>
			</c:forEach>
		</c:if>
	</table>
	<c:if test="${empty alist }">
		<span class="center">검색에 대한 정보가 존재하지 않습니다.</span>
	</c:if>

	<hr>



	<div class="divList">
		<div class="divPage" style="text-align: center">
			<!-- 페이지 번호 추가 -->
			<!-- 이전 블럭으로 이동 ◀-->
			<nav>
				<ul class="pagination">
					<c:if test="${pagingInfo.firstPage>1 }">
						<li><a href="#" aria-label="Previous"
							onclick="pageFunc(${pagingInfo.firstPage-1})"> <span
								aria-hidden="true">&laquo;</span></a></li>
					</c:if>

					<c:forEach var="i" begin="${pagingInfo.firstPage }"
						end="${pagingInfo.lastPage }">
						<c:if test="${i==pagingInfo.currentPage }">
							<li class="active"><a href="#"> ${i}<span
									class="sr-only">${i }</span></a></li>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<li><a href="#" onclick="pageFunc(${i})">${i}</a></li>
						</c:if>
					</c:forEach>

					<!-- 다음 블럭으로 이동 ▶-->
					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
						<li><a href="#" aria-label="Previous"
							onclick="pageFunc(${pagingInfo.lastPage+1})"> <span
								aria-hidden="true">&raquo;</span></a></li>
					</c:if>

					<!--  페이지 번호 끝 -->
				</ul>
			</nav>
		</div>
	</div>






	<div class="divlist">
		<form id="frm1" name="frm1" method="post">
			<select id="searchCondition" name="searchCondition"
				style="height: 26px">
				<option value="C_NAME"
					<c:if test="${param.searchCondition eq 'C_NAME' }" >selected="selected"</c:if>>
					클래스명 검색</option>
				<option value="M_USERID"
					<c:if test="${param.searchCondition eq 'M_USERID' }" >selected="selected"</c:if>>
					호스트명 검색</option>
				<option value="N_REGDATE"
					<c:if test="${param.searchCondition eq 'N_REGDATE' }" >selected="selected"</c:if>>
					신고일 검색</option>
			</select> <input type="text" id="searchKeyword" name="searchKeyword"
				style="height: 25px" value="${param.searchKeyword}">
			<div class="clearfix">
				<!-- 시작일 -->
				<span class="dset"> <input type="text"
					class="datepicker inpType" name="searchStartDate"
					id="searchStartDate" value="${param.searchStartDate}">
				</span> <span class="demi">~</span>
				<!-- 종료일 -->
				<span class="dset"> <input type="text"
					class="datepicker inpType" name="searchEndDate" id="searchEndDate"
					value="${param.searchEndDate}">
				</span>
			</div>
			<input type="submit" value="검색" style="height: 25px">
		</form>
	</div>


</div>
</form>






<%@include file="../inc/admin/bottom.jsp"%>