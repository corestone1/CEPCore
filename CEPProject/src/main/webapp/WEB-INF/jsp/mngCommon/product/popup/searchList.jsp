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
		width: 100px;
		padding: 10px 0;
    	border: 1px solid #edebef;
	}
	.popContainer .middle table thead th:first-child, 
	.popContainer .middle table tbody td:first-child {
		width: 50px;
	}
	.popContainer .middle table thead th:nth-child(3), 
	.popContainer .middle table tbody td:nth-child(3) {
		width: 120px;
	}
	
	.popContainer .middle table thead th:nth-child(5),
	.popContainer .middle table tbody td:nth-child(5) {
		width: 180px;
	}
	
	.popContainer .middle table thead th:nth-child(6),
	.popContainer .middle table tbody td:nth-child(6) {
		width: 80px;
	}
	
	.popContainer .top .floatR select {
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
	
	.popContainer .top .floatR input[type="text"] {
		width: 260px;
		height: 38px;
		border: 1px solid #e9e9e9;
		padding: 0 10px;
		background-color: #fff;
		background-image: url('/images/search_icon.png');
		background-repeat: no-repeat;
		background-position: 95% 50%;
		font-size: 15px;
		margin-bottom: 3px;
	}
		
</style>
<script type="text/javaScript">
	$(document).ready(function(){
	
	});
	
	function fn_ProductSelect(id, nm)
	{
		var pmKeyDomId = '${pmKeyDomId}';
		var pmNmDomId  = '${pmNmDomId}';
		
		//var parentId = getParameter("parentNm");
		
		alert(pmKeyDomId + ' : ID : ' + id + '\n' 
			+ pmNmDomId  + ' : NM : ' + nm);
		/* 
		try
		{
		
			opener.document.getElementById(""+parentId+"").value  = nm;
		}
		catch(e)
		{
			alert(e);
		}
		 */
		try
		{
			opener.document.getElementById(pmKeyDomId).value = id;
			opener.document.getElementById(pmNmDomId).value  = nm;
		}
		catch(e)
		{
			alert(e);
		}
	
		close();
	   /*  var dialogLayer = $('#dialogId').val();
	    $("#" +dialogLayer).dialog('close'); */
	}
	
	function fn_searchList()
	{
		document.productForm.action = "/mngCommon/product/popup/searchListPopup.do";
       	document.productForm.submit(); 
	}

	
</script>	
<form:form id="productForm" name="productForm" modelAttribute="searchVO" method="post" onsubmit="return false" >
<fieldset>
	<div class="popContainer">
		<div class="top">
			<div class="floatL">
				<div class="floatL ftw500">제품 목록</div>
			</div>
			<div class="floatR">
				<form:select path="productDivision">
					<form:option value="">구분</form:option>
					<form:option value="HW">H/W</form:option>
					<form:option value="SW">S/W</form:option>
					<form:option value="SV">용역</form:option>
					<form:option value="ET">기타</form:option>
				</form:select>
				<form:select path="productFlag">
					<option value="">상태</option>
					<option value="SALE">판매중</option>
					<option value="EOL">EOL</option>
					<option value="EOSS">EOSS</option>
				</form:select>
				<form:select path="productMake">
					<option value="">제조사</option>
				</form:select>
				<form:input path="productName" type="text" placeholder="모델명"/>
				<span id="span_search" class="veralignT" onclick="javascript:fn_searchList()"><img src="/images/icon_search.png" /></span>
			</div>
			<!-- <div class="floatC"></div>  -->
		</div>
		<div class="contents">
			<div class="middle">
				<table class="textalignC ftw200" id="pl">
					<thead class="ftw400">
						<tr>
							<th scope="row">선택</th>
							<th scope="row">상세구분</th>
							<th scope="row">제조사</th>
							<th scope="row">모델명</th>
							<th scope="row">세부모델명</th>
							<th scope="row">출시일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${productList}" varStatus="status">
	            			<tr>
	            				<td><a href="#"    onclick="javascript:fn_ProductSelect('${result.pmKey}', '${result.pmNmCd}');" class="btn btn_gray">선택</a></td>
	            				<td align="center" class="listtd">&nbsp;<c:out value="${result.pmDetailClassCd}"/></td>
	            				<td align="left"   class="listtd">&nbsp;<c:out value="${result.acNm}"/>&nbsp;</td>
	            				<td align="left"   class="listtd">&nbsp;<c:out value="${result.pmLineCd}"/>&nbsp;</td>
	            				<td align="left"   class="listtd">&nbsp;<span><c:out value="${result.pmNmCd}"/></span>&nbsp;</td>
	            				<td align="center" class="listtd"><c:out value="${result.pmReleaseDt}"/>&nbsp;</td>
	            			</tr>
	        			</c:forEach>						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</fieldset>
</form:form>
            