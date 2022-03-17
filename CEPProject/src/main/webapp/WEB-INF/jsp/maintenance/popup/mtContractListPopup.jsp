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
	body {
		overflow: hidden !important;
	}
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
		height: 83px;
		position: absolute;
		top: 0;
		left: 0;
	}
	.popContainer .top > div {
		font-size: 24px;
		padding-left: 45px;
		padding-top: 43px;
		margin-right: 37px;
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
	.middle table tbody tr {
		display: table;
	}
	.popContainer .middle table thead th, .middle table tbody td {
		/* width: 100px; */
		padding: 10px 0;
    	border: 1px solid #edebef;
	}
	.popContainer .middle table thead th:first-child, 
	.popContainer .middle table tbody td:first-child {
		width: 53px;
	}
	.popContainer .middle table thead th:nth-child(2), 
	.popContainer .middle table tbody td:nth-child(2) {
		width: 158px;
		max-width: 158px;
	}
	.popContainer .middle table thead th:nth-child(3), 
	.popContainer .middle table tbody td:nth-child(3) {
		width: 388px;
		max-width: 388px;
	}
	
	.popContainer .middle table thead th:nth-child(4),
	.popContainer .middle table tbody td:nth-child(4),
	.popContainer .middle table thead th:nth-child(5),
	.popContainer .middle table tbody td:nth-child(5) {
		width: 107px;
		max-width: 107px;
	}
	
	.popContainer .top .floatR select {
		height: 38px;
		width: 110px;
		border: 1px solid #e9e9e9;
		padding: 0 10px;
		-webkit-appearance: none;
		background: url('/images/arrow_down.png') no-repeat 91% 50%;
		background-color: #fff;
		color: #535353;
		font-size: 15px;
		margin-top: 4px;
	}
	
	.popContainer .top .floatR input[type="text"] {
		/* width: 133px; */
		height: 38px;
		border: 1px solid #e9e9e9;
		padding: 0 10px;
		background-color: #fff;
		/* background-image: url('/images/search_icon.png'); */
		background-repeat: no-repeat;
		background-position: 95% 50%;
		font-size: 15px;
		margin-bottom: -4px;
	}
	.popContainer .top input[class^="calendar"] {
		width: 126px;
		height: 38px;
		background-image: url('/images/calendar_icon.png');
		background-repeat: no-repeat;
		background-position: 95% 50%;
	}	
	.popContainer .top input[class^="search"] {
		background-image: url('/images/search_icon.png');
		width:250px;
	}	
	.middle table tbody tr:hover {
		background-color: #ddf0ec;
	}	
	
	.middle table tbody tr td span {
		display: inline-block;
		overflow:hidden; 
		text-overflow:ellipsis; 
		white-space:nowrap;
		margin-left: 15px;
		vertical-align: middle;
   		width: 97%;
   		margin: 0 auto;
	}
</style>
<script type="text/javaScript">
	$(document).ready(function(){
	
	});
	
	function fn_selectItem(id, nm) {
		try {			
			opener.document.getElementById($('#codeId').val()).value = id;
			opener.document.getElementById($('#nameId').val()).value = nm;
			window.opener.fn_selectAcInfo();
		} catch(e){}
		
		close();
	}
	
	function fn_searchList() {
		document.listForm.action = "/maintenance/contract/popup/contractList.do";
       	document.listForm.submit(); 
	}
	
</script>	
<form:form id="listForm" name="listForm" modelAttribute="searchVO" method="post" onsubmit="return false" >
<input type="hidden" id="codeId" name="codeId" value="<c:out value="${searchParam.codeId}"/>" />
<input type="hidden" id="nameId" name="nameId" value="<c:out value="${searchParam.nameId}"/>" />
<fieldset>
	<div class="popContainer">
		<div class="top">
			<div class="floatL">
				<div class="floatL ftw500">유지보수계약 목록</div>
			</div>
			<div class="floatR" style="padding-top: 40px;padding-left: 1px">
				<form:input path="fromDate" type="text" placeholder="계약시작일자" class="calendar fromDt" value="${searchParam.fromDate}"/> ~ <form:input path="toDate" type="text" placeholder="계약종료일자" class="calendar toDt" value="${searchParam.toDate}"/>
				<form:select path="searchGubun">
					<form:option value="PJ" label="유지보수명" />
					<form:option value="CU" label="고객사" />
				</form:select>
				<form:input path="searchWord" type="text" class="search" placeholder="검색어" />
				<span style="vertical-align: bottom;"><button><img src="<c:url value='/images/icon_search.png'/>" onclick="fn_searchList();" style="width: 37px; height: 37px;"/></button></span>
			</div>
			<!-- <div class="floatC"></div>  -->
		</div>
		<div class="contents">
			<div class="middle">
				<table class="textalignC ftw200" id="pl">
					<thead class="ftw400">
						<tr>
							<th scope="row">선택</th>
							<th scope="row">고객사</th>
							<th scope="row">유지보수명</th>
							<th scope="row">계약일자</th>
							<th scope="row">시작일</th>
							<th scope="row">종료일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${resultList}" varStatus="status">
	            			<tr>
	            				<td><a href="#" onclick="javascript:fn_selectItem('${result.mtIntegrateKey}', '${result.mtNm}');" class="btn btn_gray">선택</a></td>
								<td class="textalignL"><span title="${result.mtAcNm}">&nbsp;<c:out value="${result.mtAcNm}"/></span></td>
								<td class="textalignL"><span title="${result.mtNm}">&nbsp;<c:out value="${result.mtNm}"/></span></td>
								<td><c:out value="${displayUtil.displayDate(result.mtCtDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.mtStartDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.mtEndDt)}"/></td>
	            			</tr>
	        			</c:forEach>						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</fieldset>
</form:form>
            