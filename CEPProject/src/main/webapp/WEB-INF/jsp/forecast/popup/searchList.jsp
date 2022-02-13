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
		background-image: none;
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
		padding-left: 34px;
		padding-top: 33px;
		margin-right: 34px;
	}
	.popContainer .contents {
		position: absolute;
		width: 100%;
		height: 601px;
		top: 107px;
		left: 0;			
		z-index: 3;
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
		text-overflow: ellipsis;
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
	.middle table tbody tr td > span {
		display: inline-block;
        overflow:hidden; 
        text-overflow:ellipsis; 
        white-space:nowrap;
        width: 84%;
        max-width: 158px;
        margin: 0 auto;
	}
	.popContainer .middle table thead th, .middle table tbody td {
		width: 78px;
		padding: 10px 0;
    	border: 1px solid #edebef;
	}
	.popContainer .middle table thead th:first-child, 
	.popContainer .middle table tbody td:first-child {
		width: 42px;
	}
	.popContainer .middle table thead th:nth-child(2), 
	.popContainer .middle table tbody td:nth-child(2){
		width: 120px;
	}
	.popContainer .middle table thead th:nth-child(3), 
	.popContainer .middle table tbody td:nth-child(3) {
		width: 191px;
	}
	.popContainer .middle table thead th:nth-child(4), 
	.popContainer .middle table tbody td:nth-child(4) {
		width: 121px;
	}
	.popContainer .middle table thead th:nth-child(5),
	.popContainer .middle table tbody td:nth-child(5) {
		width: 183px;
	}
	.popContainer .middle table thead th:nth-child(6),
	.popContainer .middle table tbody td:nth-child(6) {
		width: 58px;
	}
	.popContainer .middle table thead th:nth-child(7),
	.popContainer .middle table tbody td:nth-child(7),
	.popContainer .middle table thead th:nth-child(8),
	.popContainer .middle table tbody td:nth-child(8) {
		width: 82px;
	}
	.popContainer .middle table thead th:nth-child(9),
	.popContainer .middle table tbody td:nth-child(9) {
		width: 36px;
	}
	
	.popContainer .top .floatR select {
		height: 38px;
		width: 130px;
		border: 1px solid #e9e9e9;
		padding: 0 10px;
		-webkit-appearance: none;
		background: url('/images/arrow_down.png') no-repeat 91% 50%;
		background-color: #fff;
		color: #535353;
		font-size: 15px;
	}
	
	.popContainer .top .floatR input[type="text"] {
		width: 200px;
		height: 38px;
		border: 1px solid #e9e9e9;
		padding: 0 10px;
		background-color: #fff;
		font-size: 15px;
		margin-top: 3px;
	}
		
</style>
<script type="text/javaScript">
	$(document).ready(function(){
	
	});
	
	function fn_ForecastSelect(id, nm, salesAmount)
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
			
			<c:if test="${returnType == 'F2' }">
			opener.${returnFunctionNm}(id,nm, salesAmount);
			</c:if>
			//alert('ID : ' + id + ', NM : ' + nm);
			
			
		}
		catch(e)
		{}
		
		close();
	   /*  var dialogLayer = $('#dialogId').val();
	    $("#" +dialogLayer).dialog('close'); */
	}
	
	function fn_searchList()
	{
		document.forecastForm.action = "/forecast/popup/searchList.do";
       	document.forecastForm.submit(); 
	}
	
</script>	
<form:form id="forecastForm" name="forecastForm" modelAttribute="searchVO" method="post" onsubmit="return false" >
<fieldset>
	<div class="popContainer">
		<div class="top">
			<div class="floatL">
				<div class="floatL ftw500">Forecast 목록</div>
			</div>
			<div class="floatR">
				<form:select path="spState">
					<form:option value="">상태</form:option>
					<form:option value="A">A</form:option>
					<form:option value="B">B</form:option>
					<form:option value="C">C</form:option>
					<form:option value="ET">기타</form:option>
				</form:select>
				<form:select path="pmFlag">
					<form:option value="">구분</form:option>
					<form:option value="ST">Storage</form:option>
					<form:option value="SV">Server</form:option>
					<form:option value="BK">Backup</form:option>
					<form:option value="SW">S/W</form:option>
					<form:option value="ET">기타</form:option>
				</form:select>
				<form:select path="searchFlag">
					<form:option value="">검색조건</form:option>
					<form:option value="AC">거래처명</form:option>
					<form:option value="BN">사업명</form:option>
				</form:select>
				<form:input path="searchValue" type="text" placeholder="검색값"/>
				<span id="span_search" class="veralignB" onclick="javascript:fn_searchList();"><img src="/images/icon_search.png" /></span>
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
							<th scope="row">사업명</th>
							<th scope="row">매출처</th>
							<th scope="row">제품</th>
							<th scope="row">담당자</th>
							<th scope="row">매출액</th>
							<th scope="row">매입액</th>
							<th scope="row">상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${forecastList}" varStatus="status">
	            			<tr>
	            				<td><a href="#"    onclick="javascript:fn_ForecastSelect('${result.spKey}', '${result.spBusiNm}',  '${result.fcSalesAmount}');" class="btn btn_gray">선택</a></td>
	            				<td align="center" class="listtd">&nbsp;<span style="max-width: 121px;" title="${result.mfAcNm}"><c:out value="${result.mfAcNm}"/></span></td>
	            				<td align="left"   class="listtd">&nbsp;<span style="max-width: 182px;" title="${result.spBusiNm}"><c:out value="${result.spBusiNm}"/></span>&nbsp;</td>
	            				<td align="left"   class="listtd">&nbsp;<span style="max-width: 121px;" title="${result.salesAcNm}"><c:out value="${result.salesAcNm}"/></span>&nbsp;</td>
	            				<td align="left"   class="listtd">&nbsp;<span style="max-width: 182px;" title="${result.pmDetail}"><c:out value="${result.pmDetail}"/></span>&nbsp;</td>
	            				<td align="center"   class="listtd">&nbsp;<span title="${result.empNm}"><c:out value="${result.empNm}"/></span>&nbsp;</td>
	            				<td align="center" class="listtd">&nbsp;<span title="${displayUtil.commaStr(result.fcSalesAmount)}"><c:out value="${displayUtil.commaStr(result.fcSalesAmount)}"/></span>&nbsp;</td>
	            				<td align="center" class="listtd">&nbsp;<span title="${displayUtil.commaStr(result.fcBuyAmount)}"><c:out value="${displayUtil.commaStr(result.fcBuyAmount)}"/></span>&nbsp;</td>
	            				<td align="center" class="listtd">&nbsp;<span title="${result.spState}"><c:out value="${result.spState}"/></span>&nbsp;</td>
	            			</tr>
	        			</c:forEach>						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</fieldset>
</form:form>
            