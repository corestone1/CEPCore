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
		border-bottom: 4px solid #4b3a93;
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
		margin-top: 25px;
		border-collapse: collapse;
		overflow: hidden;
		border-bottom: 2px solid #6a5bae;
	}
	.popContainer .middle table thead {
		background-color: #e1dff5;
		float: left;
		border-top: 3.5px solid #6a5bae;
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
		width: 100px;
		padding: 10px 0;
    	border: 1px solid #edebef;
	}
	.popContainer .middle table thead th:first-child, 
	.popContainer .middle table tbody td:first-child {
		width: 42px;
	}
	.popContainer .middle table thead th:nth-child(2), 
	.popContainer .middle table tbody td:nth-child(2),
	.popContainer .middle table thead th:nth-child(3), 
	.popContainer .middle table tbody td:nth-child(3) {
		width: 120px;
	}
	
	.popContainer .middle table thead th:nth-child(4), 
	.popContainer .middle table tbody td:nth-child(4) {
		width: 50px;
	}
	
	.popContainer .middle table thead th:nth-child(5), 
	.popContainer .middle table tbody td:nth-child(5) {
		width: 80px;
	}
	
	.popContainer .middle table thead th:nth-child(6), 
	.popContainer .middle table tbody td:nth-child(6) {
		width: 90px;
	}
	.popContainer .middle table thead th:nth-child(7),
	.popContainer .middle table tbody td:nth-child(7) {
		width: 130px;
	}
	
	.popContainer .top input[type="text"] {
		width: 210px;
		height: 34px;
		border: 1px solid #e9e9e9;
		padding: 0 10px;
		background-color: #fff;
		background-repeat: no-repeat;
		background-position: 95% 50%;
		font-size: 15px;
		margin-bottom: 3px;
	}
	/* .popContainer .middle table thead th:nth-child(8),
	.popContainer .middle table tbody td:nth-child(8) {
		max-width: 105px;
	} */
</style>
<script type="text/javaScript">
	$(document).ready(function(){
	
	});
	
	function fn_productSelect(orderPmFkKey,pmNmCd,mtPmSerialNum,mtPmQuantity,mtPmUprice, totalAmount, mtPmStartDt, mtPmEndDt){
		var num = $('#whereNum').val();
		
		opener.document.getElementById('prodList-'+num+'-pmNmCd').value = pmNmCd;
		opener.document.getElementById('prodList-'+num+'-orderPmFkKey').value = orderPmFkKey;
		//opener.document.getElementById('prodList-'+num+'-totalAmount').value = totalAmount;
		opener.document.getElementById('prodList-'+num+'-totalAmount').value = '';
		opener.document.getElementById('prodList-'+num+'-mtOrderPmQuantity').value = mtPmQuantity;
		//opener.document.getElementById('prodList-'+num+'-mtOrderPmUprice').value = mtPmUprice;
		opener.document.getElementById('prodList-'+num+'-mtOrderPmUprice').value = '';
		opener.document.getElementById('prodList-'+num+'-mtPmSerialNum').value = mtPmSerialNum;
		opener.document.getElementById('prodList-'+num+'-mtStartDt').value = mtPmStartDt;
		opener.document.getElementById('prodList-'+num+'-mtEndDt').value = mtPmEndDt;
		close();
	   /*  var dialogLayer = $('#dialogId').val();
	    $("#" +dialogLayer).dialog('close'); */
	}
	function fn_searchList(){
		
		document.listForm.action = "/maintenance/contract/popup/mtProductList.do";
       	document.listForm.submit(); 
	}
</script>	
<form:form id="listForm" name="listForm" modelAttribute="searchVO" method="post" onsubmit="return false" >
<input type="hidden" id="whereNum" name="whereNum" value="<c:out value="${whereNum}"/>" />
<input type="hidden" id="selectIntegrateKey" name="selectIntegrateKey" value="<c:out value="${selectIntegrateKey}"/>" />
<fieldset>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">유지보수 제품 목록</div>
				<div class="floatR" style="margin-right: 40px;">
				
					<span><form:input path="searchPmNmCd" type="text" placeholder="제품명"/></span>					
					<span><form:input path="searchSerialNum" type="text" placeholder="제품시리얼"/></span>
					<span id="span_search" style="vertical-align:top;" >
					
					<img src="<c:url value='/images/icon_search.png'/>" onclick="fn_searchList();"/>
					</span>
					
				</div>
				<%-- <div class="floatR">
					<span><form:input path="searchMtName" type="text" placeholder="제품명"/></span>					
					<span><form:input path="searchMtName" type="text" placeholder="제품시리얼"/></span>
					<span id="span_search" class="veralignT" onclick="javascript:fn_searchList();">
					<img src="<c:url value='/images/icon_search.png'/>" onclick="fn_searchList();"/>
					</span>
				</div> --%>
			</div>
			
		</div>
				
		<div class="contents">

			<div class="middle">
				
				<table class="textalignC ftw200" id="pl">
					<thead class="ftw400">
						<tr>
							<th scope="row">선택</th>
							<th scope="row">제품구분</th>
							<th scope="row">제품상세구분</th>
							<th scope="row">제품군</th>
							<th scope="row">제품명</th>
							<th scope="row">출시 일자</th>
							<th scope="row">거래처</th>
							<!-- <th scope="row">비고</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${mtProductList}" varStatus="status">
	            			<tr>
	            				<td>
									<a href="#" onclick="javascript:fn_productSelect('${item.orderPmFkKey}', '${item.pmNmCd}', '${item.mtPmSerialNum}', '${displayUtil.commaStr(item.mtPmQuantity)}', '${displayUtil.commaStr(item.mtPmUprice)}', '${displayUtil.makeMultiNumber(item.mtPmQuantity,item.mtPmUprice)}', '${displayUtil.displayDate(item.mtPmStartDt)}', '${displayUtil.displayDate(item.mtPmEndDt)}');" class="btn btn_gray">선택</a>
	            				</td>
	            				<td align="center" class="listtd">
	            					<%-- <c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/> --%>
	            					<c:out value="${item.pmNmCd}"/>
	            				</td>
	            				<td align="center" class="listtd"><c:out value="${item.mtPmSerialNum}"/>&nbsp;</td>
	            				<td align="right" class="listtd"><c:out value="${displayUtil.commaStr(item.mtPmQuantity)}"/>&nbsp;</td>
	            				<td align="right" class="listtd"><c:out value="${displayUtil.commaStr(item.mtPmUprice)}"/>&nbsp;</td>
	            				<td align="right" class="listtd"><c:out value="${displayUtil.makeMultiNumber(item.mtPmQuantity,item.mtPmUprice)}"/>&nbsp;</td>
	            				<td align="center" class="listtd"><c:out value="${displayUtil.displayDate(item.mtPmStartDt)}"/> ~ <c:out value="${displayUtil.displayDate(item.mtPmEndDt)}"/>&nbsp;</td>
	            				<%-- <td align="center" class="listtd"><c:out value="${item.remark}"/>&nbsp;</td> --%>
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
            