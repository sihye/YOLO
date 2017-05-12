<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="mypagemessagetop.jsp"%>
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
        	
        	
        	$("input[name='chkAll']").click(function(){
    			$("tbody input[type=checkbox]").prop("checked", this.checked);
    		});
    		
    		$("#btDeleteMulti").click(function(){
    			//선택한 쪽지 삭제
    			
    			if($("tbody input[type=checkbox]:checked").length==0){
    				alert("삭제할 쪽지를 선택하셔야 합니다");
    				return;
    			}
    			
    			if (confirm("선택한쪽지를 삭제하시겠습니까?") == true){    //확인
    				$("#frmList").prop("action", 
    				"<c:url value='/mypage/message/deleteMultiGet.do'/>");
    				$("#frmList").submit();
    		    }else{   //취소
    		        return;
    		    }
    			
    		});
        	

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
        $(function() {
        	$(document).on("click","#info a", function(){
        		var trNo=$(this).parent().parent().find('input[type="hidden"]').val();
        		var msNo=$(this).parent().parent().find('input[type="hidden"]').eq(1).val();
        		var msCheck=$(this).parent().parent().find('input[type="hidden"]').eq(2).val();
   			 $.onFunc(trNo,msNo,msCheck);
   		 	});
		});
        
        $.onFunc=function(trNo,msNo,msCheck){
			var tr2Id = document.getElementById("tr2"+trNo);
			var style = window.getComputedStyle(tr2Id,null).getPropertyValue("display");
			if(style=='none'){
				tr2Id.style.display='';	
				//메세지 상태 바꾸기
				if(msCheck=='N'){
				  $.ajax({
					url:"<c:url value='/mypage/message/messageCheck.do'/>",
					type:'post',
					data:'msNo='+msNo,
					success:function(res){
						var msg="";
						var msCheck="";
						if(res>0){
							msCheck="확인";
						}
						$("#td"+trNo).html(msCheck);
					},
					error:function(xhr, status, error){
						alert("error:"+error);
					}
					}); 
				}
				
			}else if(style=='table-row'){
				tr2Id.style.display='none';	
			}
		}
            
        </script>

<!-- 페이징 처리를 위한 form 태그 -->
<form name="frmPage" method="post"
	action='<c:url value="/mypage/message/getbox.do" />'>
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="searchCondition" value="${param.searchCondition }"> <input
		type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	<input type="hidden" name="searchStartDate"
		value="${param.searchStartDate}"> <input type="hidden"
		name="searchEndDate" value="${param.searchEndDate}">
</form>
<div class="col-md-10">
	<ul class="nav nav-tabs nav-justified">
		<li><a href='<c:url value="/mypage/message/messageSend.do"/>'>쪽지보내기</a></li>
		<li><a
			href='<c:url value="/mypage/message/sendbox.do"/>'>보낸쪽지함</a></li>
		<li class="active"><a href='<c:url value="/mypage/message/getbox.do"/>'>받은쪽지함</a></li>
	</ul>
	<br>
	<h2>받은쪽지함</h2>
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
							<label>보낸사람:</label> <input class="txt" id="searchKeyword"
								name="searchKeyword" type="text" /> <input type="submit"
								value="조회하기">
						</div>
					</td>
				</tr>
			<tbody>
		</table>

	</form>
	<br>
	<!-- //기간별조회 -->
	<form name="frmList" id="frmList" method="post">
		<table class="table table-hover">
			<thead>
				<tr style="background: skyblue">
					<th width="10%"><input type="checkbox" value="None" id="chkAll"
						name="chkAll" />
						</div></th>
					<th width="10%">번호</th>
					<th width="15%">보낸사람</th>
					<th width="20%">제목</th>
					<th width="30%">받은시간</th>
					<th width="15%">상태</th>
					
				</tr>
			</thead>
			<tbody>
				
				<c:set var="i" value="0" />
				<c:forEach var="map" items="${alist }">
					<tr id="info">
						<input type="hidden" value="${i }">
						<input type="hidden" value="${map['MS_NO'] }">
						<input type="hidden" value="${map['MS_CHECK'] }">
						<td><input type="checkbox" id="chk_${i}"
							name="msItems[${i}].msNo" value="${map['MS_NO'] }"></td>
						<td>${map["MS_NO"] }</td>
						<td>${map["MS_USERID"] }</td>
						<td><a href="#">${map["MS_TITLE"] }</td>
						<td><fmt:formatDate value="${map['MS_REGDATE'] }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td id="td${i }">
						<c:if test="${map['MS_CHECK']=='N' }">
							미확인
						</c:if>
						<c:if test="${map['MS_CHECK']=='Y' }">
							확인
						</c:if>
						</td>
					</tr>
					<tr id="tr2${i }" style="display: none;">			
					<td colspan="6">
						<label>보낸사람:</label>&nbsp;${map["MSMG_USERID"] }<br>
						<label>받은시간:</label>&nbsp;<fmt:formatDate value="${map['MS_REGDATE'] }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<hr>
						<%-- <table class="table table-bordered" summary="보낸쪽지 내용" >
							<caption>보낸메세지</caption>
							<colgroup>
								<col width="18%;" />
								<col width="33%;" />
								<col width="18%;" />
								<col width="*;" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">보낸사람</th>
									<td>${map["MS_USERID"] }</td>
									<th scope="row">받은사람</th>
									<td>${map["MSG_USERID"] }</td>
								</tr>
								<tr>
									<th scope="row">제목</th>
									<td colspan="3" class="goods">${map["MS_TITLE"] }</td>
								</tr>
							</tbody>
						</table> --%>
						<p style="margin-top: 10px;">${map["MS_CONTENT"] }</p>
					</td>
					</tr>
					<c:set var="i" value="${i+1}" />
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6" style="text-align: center">
						<button id="btDeleteMulti" class="btn btn-primary" type="button">선택한
							쪽지 삭제</button>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
		
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
					<li class="active"><a href="#"> ${i}<span class="sr-only">${i }</span></a></li>
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


<%@ include file="../mypagebottom.jsp"%>