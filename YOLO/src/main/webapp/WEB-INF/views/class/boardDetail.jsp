<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/top.jsp"%>
<style>
.total-box {
	border-color: #e5e5e5;
	width: 100%;
	border-style: solid;
	border-width: 1px;
}

.board-box-line-dashed {
	border-color: #666666;
	border-bottom-style: dashed;
	border-bottom-width: 1px;
	display: block;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#btDel").click(function(){
		if(!confirm("삭제하시겠습니까?")){
			history.back;
		}else{
			location.href="<c:url value='/class/boardDel.do?cNo=${vo.cNo}&cbNo=${vo.cbNo}' />"; 
		}
	
	});
	$("#btEdit").click(function(){
		location.href="<c:url value='/class/classBoardEdit.do?cbNo=${vo.cbNo}' />"; 

	});
});
</script>
<div class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<br>
			<div class="total-box">
				<table style="width: 100%;">
					<tbody>
						<tr>
							<th><span class="b m-tcol-c" style="margin-left: 5px;">${vo.cbTitle }</span>
								<p style="float: right; margin-right: 10px;"><fmt:formatDate value="${vo.cbRegdate }" pattern='yyyy-MM-dd'/>
									</p></th>
						</tr>
						<tr>
							<td><div class="board-box-line-dashed"></div></td>
						</tr>
						<tr style="font-weight: bold">
							<td><label>아이디:</label><span style="color: #b6b6b6">${vo.mUserid }</span>
								<label>조회수:</label><span style="color: #b6b6b6">${vo.cbReadcount }</span></td>
						</tr>
						<tr>
							<td>
							<div style="height: 400px">
							<div class="row">
								<c:if test="${!empty fileList}">
									<c:forEach var="file" items="${fileList }">
									<c:if test="${file.fFilename != '' && file.fFilename != null }">
								    <div class="col-md-4">
								    <img  src="../upload/${file.fFilename }">
								    </div>
								    </c:if>
								    </c:forEach>
								</c:if>
    							</div>
    							<br><br>
									${vo.cbContent }
							</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>

			<div id="btnAll">
		
				<div class="btnRight" style="float: right;">
				<c:if test="${vo.mUserid  eq sessionScope.userid}">
					<button type="button" class="btn btn-default btn-xs"  id="btEdit" >수정</button>
					<button type="button" class="btn btn-default btn-xs" id="btDel" >삭제</button>
				</c:if>
					<button type="button" class="btn btn-default btn-xs" onclick="location.href='<c:url value="/class/claDetail.do?cNo=${vo.cNo }&boardtype=cb"/>'">목록</button>
				</div>

			</div>
		</div>

		<div class="col-md-1"></div>
	</div>
</div>
<br>
<%@ include file="../inc/bottom.jsp"%>