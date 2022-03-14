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
		overflow: hidden;
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
		width: calc(100% - 86px);
		position: absolute;
		top: 0;
		left: 0;
		padding: 29px 43px 0 43px;
	}
	.popContainer .top > div {
		font-size: 24px;
	}
	.popContainer .top select {
		height: 40px;
		width: 130px;
		border: 1px solid #e9e9e9;
		padding: 0 10px;
		-webkit-appearance: none;
		background: url('/images/arrow_down.png') no-repeat 91% 50%;
		background-color: #fff;
		color: #535353;
		font-size: 15px;
	}
	.popContainer .top input[type="text"] {
		width: 200px;
		height: 40px;
		border: 1px solid #e9e9e9;
		padding: 0 10px;
		background-color: #fff;
		font-size: 15px;
		margin-top: 3px;
	}
	.popContainer .contents {
		position: absolute;
		width: 100%;
		height: 601px;
		top: 86px;
		left: 0;			
		z-index: 3;
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
		width: 918px;
	    font-size: 15px;
	    margin-top: 16px;
	    border-collapse: collapse;
	    overflow: hidden;
	    border-bottom: 2px solid #6a5bae;
	}
	.popContainer .middle table thead {
		background-color: #e1dff5;
	    float: left;
	    width: 918px;
	    border-bottom: 3.5px solid #6a5bae;
	}
	.popContainer .middle table thead tr {
		display: table;
    	width: 918px;
	}
	.popContainer .middle table tbody {
	    width: 918px;
	    height: 522px;
	    overflow-y: auto;
	    overflow-x: hidden;
	    float: left;
	}
	.popContainer .middle table tbody span {
		display: inline-block;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    margin-left: 15px;
	    vertical-align: middle;
	}
	.popContainer .middle table tbody td:nth-child(3) span {
		width: 89px;
	}
	.popContainer .middle table tbody td:nth-child(4) span {
		width: 256px;
	}
	.middle table tbody tr {
		display: table;
	   width: 918px;
	}
	.popContainer .middle table thead th, .middle table tbody tr td {
		padding: 10px 0;
    	border: 1px solid #edebef;
	}
	.popContainer .middle table thead th:first-child,
	.popContainer .middle table tbody td:first-child {
		width: 60px;
	}
	.popContainer .middle table thead th:nth-child(2),
	.popContainer .middle table tbody td:nth-child(2) {
		width: 98px;
	}
	.popContainer .middle table thead th:nth-child(3),
	.popContainer .middle table tbody td:nth-child(3) {
		width: 115px;
	}
	.popContainer .middle table thead th:nth-child(4),
	.popContainer .middle table tbody td:nth-child(4) {
		width: 283px;
	}
	.popContainer .middle table thead th:nth-child(5),
	.popContainer .middle table tbody td:nth-child(5),
	.popContainer .middle table thead th:nth-child(6),
	.popContainer .middle table tbody td:nth-child(6)  {
		width: 100px;
	}
	.popContainer .middle table thead th:nth-child(7),
	.popContainer .middle table tbody td:nth-child(7) {
		width: 67px;
	}
</style>
<script type="text/javaScript">
	$(document).ready(function(){
	
	});
	
	function fn_ProjectSelect(id, nm)
	{
		
		
		//var returnKey = '${returnKey}';
		//var returnNm = '${returnNm}';
		try
		{
			<c:if test="${returnType == 'O' }">
			opener.document.getElementById('${returnKey}').value = id;
			opener.document.getElementById('${returnNm}').value  = nm;
			</c:if>
			
			<c:if test="${returnType == 'F' }">
			opener.${returnFunctionNm}(id,nm);
			</c:if>
			//alert('ID : ' + id + ', NM : ' + nm);
			
			
		}
		catch(e){
			console.log(e);
		}
		
		close(); 
	   /*  var dialogLayer = $('#dialogId').val();
	    $("#" +dialogLayer).dialog('close'); */
	}
	
	function fn_searchList()
	{
		document.projectForm.action = "/project/popup/list.do";
       	document.projectForm.submit(); 
	}
	
	
</script>	
<form:form id="projectForm" name="projectForm" modelAttribute="searchVO" method="post" onsubmit="return false" >
<fieldset>
	<div class="popContainer">
		<div class="top">
			<div class="floatL">
				<div class="floatL ftw500">Project 목록</div>
			</div>
			<div class="floatR">
				<form:select path="searchFlag">
					<form:option value="">검색조건</form:option>
					<form:option value="PK">계약번호</form:option>
					<form:option value="AC">고객사</form:option>
					<form:option value="NM">프로젝트명</form:option>
				</form:select>
				<form:input path="searchValue" type="text" placeholder="검색값"/>
				<span id="span_search" class="veralignB" onclick="javascript:fn_searchList();"><img src="/images/icon_search.png" /></span>
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
							<th scope="row">시작일</th>
							<th scope="row">종료일</th>
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
	            					<c:out value="${result.pjKey}"/>
	            					<input type="hidden" value="<c:out value="${result.pjKey}"/>" />
	            				</td>
	            				<td align="left" class="listtd"><span title="${result.acNm }"><c:out value="${result.acNm}"/></span></td>
	            				<td align="left" class="listtd"><span title="${result.pjNm }"><c:out value="${result.pjNm}"/></span></td>
	            				<td align="center" class="listtd"><c:out value="${displayUtil.displayDate(result.pjStartDt)}"/></td>
	            				<td align="center" class="listtd"><c:out value="${displayUtil.displayDate(result.pjEndDt)}"/></td>
	            				<td align="center" class="listtd"><c:out value="${result.pjStatusCd}"/></td>
	            				<td align="center" class="listtd"><c:out value="${result.pjSaleEmpKey}"/></td>
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
            