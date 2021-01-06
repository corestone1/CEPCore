<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/popup.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/datepicker.min.css'/>"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value='/js/popup.js'/>"></script>
<script src="<c:url value='/js/common.js'/>"></script>
<style>
	fieldset {
		border: none;
		marign: 0;
		padding: 0;
	}
	.btn_gray {
		border: 1px solid #d2d2d2;
		border-radius: 5px;
		background-color: #d2d2d2;
		padding: 2px 8px;
		font-size: 13px;
	}
	.popContainer .top {
		width: 100%;
		height: 103px;
		position: absolute;
		top: 0;
		left: 0;
	}
	.popContainer .top > div {
		font-size: 24px;
		padding-left: 34px;
		padding-top: 43px;
	}
	.popContainer .contents {
		position: absolute;
		width: 100%;
		height: 601px;
		top: 107px;
		left: 0;			
		z-index: 3;
		background-color: #f6f7fc;
		overflow-y: auto;
	}
	.popContainer .contents > div {
		width: calc(100% - 80px);
		margin: 10px 40px 15px 40px;
	}
	.popContainer .contents > div:first-child {
		min-height: 519px;
	}
	.ui-datepicker.ui-widget-content {
		z-index: 102 !important;
	 }
	.popContainer .middle table,
	.popContainer .middle table thead,
	.popContainer .middle table thead tr,
	.popContainer .middle table tbody,
	.popContainer .middle table tbody tr {
		width: 100%;
	}
	.popContainer .middle table {
		border: none;
		font-size: 15px;
		margin-top: 16px;
		border-collapse: collapse;
		overflow: hidden;
		border-bottom: 2px solid #6a5bae;
	}
	.popContainer .middle table thead {
		background-color: #e1dff5;
		float: left;
		border-bottom: 3.5px solid #6a5bae;
	}
	.popContainer .middle table thead tr {
		display: table;
	}
	.popContainer .middle table tbody {
		height: 504px;
		overflow-y: auto;
		overflow-x: hidden;
		float: left;
	}
	.popContainer .middle table tbody span {
		display: inline-block;
		overflow:hidden; 
		text-overflow:ellipsis; 
		white-space:nowrap;
		vertical-align: middle;
	}
	.middle table tbody tr {
		display: table;
	}
	.popContainer .middle table thead th, .middle table tbody td {
		width: 100px;
		padding: 10px 0;
    	border: 1px solid #edebef;
	}
	.popContainer .middle table thead th:first-child, 
	.popContainer .middle table tbody td:first-child {
		width: 50px;
	}
	.popContainer .middle table thead th:nth-child(4), 
	.popContainer .middle table tbody td:nth-child(4) {
		width: 307px;
	}
	.popContainer .middle table thead th:nth-child(7),
	.popContainer .middle table tbody td:nth-child(7),
	.popContainer .middle table thead th:nth-child(8),
	.popContainer .middle table tbody td:nth-child(8) {
		width: 80px;
	}
</style>
<script type="text/javaScript">
	$(document).ready(function(){
	
	});
	
	function fn_ProjectSelect(id, no){
		opener.document.getElementById('id').value = id;
		opener.document.getElementById('no').value = no;
		close();
	   /*  var dialogLayer = $('#dialogId').val();
	    $("#" +dialogLayer).dialog('close'); */
	}
</script>	
<form:form id="projectForm" name="projectForm" modelAttribute="searchVO" method="post" onsubmit="return false" >
<fieldset>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">프로젝트 목록</div>
			</div>
		</div>
		<div class="contents">
			<div class="middle">
				<table class="textalignC ftw200" id="pl">
					<thead class="ftw400">
						<tr>
							<th scope="row">선택</th>
							<th scope="row">계약번호</th>
							<th scope="row">고객사</th>
							<th scope="row">프로젝트명</th>
							<th scope="row">프로젝트기간</th>
							<th scope="row">남은기간</th>
							<th scope="row">상태</th>
							<th scope="row">영업담당자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${resultList}" varStatus="status">
	            			<tr>
	            				<td>
									<a href="#" onclick="javascript:fn_ProjectSelect('${result.pjKey}', '${result.pjNm}');" class="btn btn_gray">선택</a>
	            				</td>
	            				<td align="center" class="listtd">
	            					<%-- <c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/> --%>
	            					<c:out value="${result.pjKey}"/>
	            				</td>
	            				<td align="center" class="listtd"><span><c:out value="${result.acKey}"/></span>&nbsp;</td>
	            				<td align="center" class="listtd"><span><c:out value="${result.pjNm}"/></span>&nbsp;</td>
	            				<td align="center" class="listtd"><c:out value="${result.pjStartDt}"/>&nbsp;</td>
	            				<td align="center" class="listtd"><c:out value="${result.pjEndDt}"/>&nbsp;</td>
	            				<td align="center" class="listtd"><c:out value="${result.pjStatusCd}"/>&nbsp;</td>
	            				<td align="center" class="listtd"><c:out value="${result.pjSaleEmpKey}"/>&nbsp;</td>
	            			</tr>
	        			</c:forEach>
						<!-- <tr>
							<td onclick="event.cancelBubble = true;"></td>
							<td>002-2018-1220</td>
							<td>미래에셋생명</td>
							<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
							<td>2018-12-12</td>
							<td>2018-12-12</td>
							<td>71일</td>
							<td>71일</td>
							<td><input type="hidden" value="PF" />수행</td>
							<td>홍길동차장</td>
						</tr> -->
					</tbody>
				</table>
			</div>
		</div>
	</div>
</fieldset>
</form:form>
            