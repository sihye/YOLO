<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<div class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<br>
			<div class="total-box">
				<table style="width: 100%;">
					<tbody>
						<tr>
							<th><span class="b m-tcol-c" style="margin-left: 5px;">제목</span>
								<p style="float: right; margin-right: 10px;">2017.03.21.
									17:15</p></th>
						</tr>
						<tr>
							<td><div class="board-box-line-dashed"></div></td>
						</tr>
						<tr style="font-weight: bold">
							<td><label>아이디:</label><span style="color: #b6b6b6">hong</span>
								<label>조회수:</label><span style="color: #b6b6b6">20</span></td>
						</tr>
						<tr>
							<td><textarea rows="20"
									style="width: 100%; resize: none; border: none;" readonly>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>

			<div id="btnAll">
				<div class="btnLeft"  style="float: left;">
					<button type="button" class="btn btn-default btn-xs">이전글</button>
					<button type="button" class="btn btn-default btn-xs">다음글</button>
				</div>
				<div class="btnRight" style="float: right;">
					<button type="button" class="btn btn-default btn-xs">수정</button>
					<button type="button" class="btn btn-default btn-xs">삭제</button>
					<button type="button" class="btn btn-default btn-xs">목록</button>
				</div>

			</div>
		</div>

		<div class="col-md-1"></div>
	</div>
</div>
<br>
<%@ include file="../inc/bottom.jsp"%>