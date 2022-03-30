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
		width: 926px;
	}
	.popContainer .middle table thead tr {
		display: table;
		width: 926px;
	}
	.popContainer .middle table tbody {
		width: 926px;
		height: 504px;
		overflow-y: auto;
		overflow-x: hidden;
		float: left;
	}
	.middle table tbody tr {
		display: table;
		width: 926px;
		background-color: #fff;
	}
	.popContainer .middle table thead th, .middle table tbody td {
		width: 79px;
		padding: 10px;
    	border: 1px solid #edebef;
	}
	.popContainer .middle table thead th:first-child, 
	.popContainer .middle table tbody td:first-child {
		width: 42px;
	}
	.popContainer .middle table thead th:nth-child(2), 
	.popContainer .middle table tbody td:nth-child(2) {
		width: 50px;
	}
	.popContainer .middle table thead th:nth-child(3), 
	.popContainer .middle table tbody td:nth-child(3) {
		width: 100px;
	}
	
	.popContainer .middle table thead th:nth-child(4), 
	.popContainer .middle table tbody td:nth-child(4) {
	    width: 135px;
	}
	
	.popContainer .middle table thead th:nth-child(5),
	.popContainer .middle table tbody td:nth-child(5) {
		width: 180px;
	}
	
	.popContainer .middle table thead th:nth-child(6),
	.popContainer .middle table tbody td:nth-child(6) {
		width: 156px;
	}
	
	.popContainer .middle table tbody tr td span {
		display: block;
		overflow:hidden; 
		text-overflow:ellipsis; 
		white-space:nowrap;
		vertical-align: middle;
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
		width: 170px;
		height: 40px;
		border: 1px solid #e9e9e9;
		padding: 0 10px;
		background-color: #fff;
		font-size: 15px;
	}
		
</style>
<script type="text/javaScript">
	$(document).ready(function(){
	});
	
	function Request(){
	    var requestParam ="";
		 
		this.getParameter = function(param){
	        var url = unescape(location.href); 
	        var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&"); 
	        
	        for(var i = 0 ; i < paramArr.length ; i++){
	           var temp = paramArr[i].split("="); 
	        
	           if(temp[0].toUpperCase() == param.toUpperCase()){
	             requestParam = paramArr[i].split("=")[1]; 
	             break;
	           }
	        }
	        return requestParam;
	    }
	}
	
	function fn_ProductSelect(id, nm)
	{
		
		var request = new Request();
		
		var lstReturnType = request.getParameter("returnType");
		var pmKeyDomId = request.getParameter("pmKeyDomId");
		var pmNmDomId = request.getParameter("pmNmDomId");
		
		/*var lstReturnType = '${returnType}';
		var pmKeyDomId    = '${returnKey}';
		var pmNmDomId     = '${returnNm}'; */
		
		console.log(pmKeyDomId + ' : ID : ' + id + '\n'  + pmNmDomId  + ' : NM : ' + nm);

		try
		{
			if(lstReturnType == 'O')
			{
				opener.document.getElementById(pmKeyDomId).value = id;
				opener.document.getElementById(pmNmDomId).value  = nm;	
			}
			else if(lstReturnType == "F")
			{
				window.opener.fnSetProductInfo(id, no);
			}
		}
		catch(e)
		{
			alert(e);
		}
	
		close();
	}
	
	function fn_searchList()
	{
		var request = new Request();
		
		var lstReturnType = request.getParameter("returnType");
		var pmKeyDomId = request.getParameter("pmKeyDomId");
		var pmNmDomId = request.getParameter("pmNmDomId");
		
		document.productForm.action = "/mngCommon/product/popup/searchListPopup.do?pmNmDomId="+pmNmDomId+"&pmKeyDomId="+pmKeyDomId+"&returnType="+lstReturnType;
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
					<form:option value="PROD1000">H/W</form:option>
					<form:option value="PROD2000">S/W</form:option>
					<form:option value="PROD3000">용역</form:option>
					<form:option value="PROD4000">기타</form:option>
				</form:select>
				<form:select path="productFlag">
					<form:option value="">상태</form:option>
					<form:option value="SALE">판매중</form:option>
					<form:option value="EOL">EOL</form:option>
					<form:option value="EOSL">EOSL</form:option>
				</form:select>
				<form:input path="productMake" type="text" placeholder="제조사" onKeyPress="if(event.keyCode==13){fn_searchList();}"/>
				<form:input path="productName" type="text" placeholder="모델명" class="veralignB" onKeyPress="if(event.keyCode==13){fn_searchList();}"/>
				<span id="span_search" class="veralignB" onclick="javascript:fn_searchList()"><img src="/images/icon_search.png" /></span>
			</div>
			<!-- <div class="floatC"></div>  -->
		</div>
		<div class="contents">
			<div class="middle">
				<table class="textalignC ftw200" id="pl">
					<thead class="ftw400">
						<tr>
							<th scope="row">선택</th>
							<th scope="row">구분</th>
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
	            				<td align="center" class="listtd">
	            					<c:choose>
										<c:when test="${result.pmClassCd eq 'PROD1000'}">H/W</c:when>
										<c:when test="${result.pmClassCd eq 'PROD2000'}">S/W</c:when>
										<c:when test="${result.pmClassCd eq 'PROD3000'}">용역</c:when>
										<c:when test="${result.pmClassCd eq 'PROD4000'}">기타</c:when>
									</c:choose>
								</td>
	            				<td align="center" class="listtd">
	            					<c:choose>
										<c:when test="${result.pmDetailClassCd eq 'PROD1001'}">스토리지</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD1002'}">서버</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD1003'}">네트워크</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD1099'}">기타</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD2001'}">FCore 제품</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD2099'}">기타</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD3001'}">기술지원</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD3002'}">인력파견</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD3099'}">기타</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD4099'}">기타</c:when>
									</c:choose>
	            				</td>
	            				<td align="center"   class="listtd"><span style="max-width: 126px;" title="${result.acNm }"><c:out value="${result.acNm}"/></span></td>
	            				<td align="left"   class="listtd"><span style="max-width: 179px;" title="${result.pmLineCd }"><c:out value="${result.pmLineCd}"/></span></td>
	            				<td align="left"   class="listtd"><span style="max-width: 156px;" title="${result.pmNmCd }"><c:out value="${result.pmNmCd}"/></span></td>
	            				<td align="center" class="listtd"><c:out value="${displayUtil.displayDate(result.pmReleaseDt)}"/>&nbsp;</td>
	            			</tr>
	        			</c:forEach>						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</fieldset>
</form:form>
            