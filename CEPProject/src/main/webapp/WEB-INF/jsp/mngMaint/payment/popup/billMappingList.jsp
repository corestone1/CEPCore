<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/popup.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/datepicker.min.css'/>"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<script src="<c:url value='/js/popup.js'/>"></script>
	<style>
	<style>
		.ui-dialog {
			top: -530px !important;
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
			height: 347px;
			top: 107px;
			left: 0;			
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto;
		}
		.popContainer .contents > div {
			width: calc(100% - 67px);
			margin: 10px 40px 15px 34px;
		}
		.popContainer .contents > div:first-child {
			/* min-height: 519px; */
		}
		.ui-datepicker.ui-widget-content {
			z-index: 102 !important;
		 }
		.popContainer .middle table,
		.popContainer .middle table thead,
		.popContainer .middle table thead tr,
		.popContainer .middle table tbody,
		.popContainer .middle table tbody tr {
			/* width: 100%; */
			width: 912px;
		}
		.popContainer .middle table {
			border: none;
			font-size: 15px;
			margin-top: 15px;
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
			width: 912px;
		}
		.popContainer .middle table tbody {
			height: 268px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.middle table tbody tr {
			display: table;
		}
		.popContainer .middle table thead th, .middle table tbody td {
			
			padding: 8px 5px 8px 5px;
	    	border: 1px solid #edebef;
		}
		.popContainer .middle table thead th:first-child, 
		.popContainer .middle table tbody td:first-child {
			width: 50px;
		}		
		.popContainer .middle table thead th:nth-child(2), 
		.popContainer .middle table tbody td:nth-child(2) {
			width: 28px;
		}
		.popContainer .middle table thead th:nth-child(3), 
		.popContainer .middle table tbody td:nth-child(3){
			width: 180px;
			max-width: 180px;
		}
		.popContainer .middle table thead th:nth-child(4), 
		.popContainer .middle table tbody td:nth-child(4) {
			width: 75px;
		}
		 
		.popContainer .middle table thead th:nth-child(5), 
		.popContainer .middle table tbody td:nth-child(5) {
			width: 80px;
		}
		
		.popContainer .middle table thead th:nth-child(6), 
		.popContainer .middle table tbody td:nth-child(6) {
			width: 70px;
		}
		.popContainer .middle table thead th:nth-child(7),
		.popContainer .middle table tbody td:nth-child(7) {
			width: 80px;
		}
		.popContainer .middle table thead th:nth-child(8),
		.popContainer .middle table tbody td:nth-child(8) {
			width: 180px;
			max-width: 180px;
		}
		
		.popContainer .middle tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 90%;
			margin: 0 auto;
		}
		/* */
		.popContainer .top input[type="text"] {
			width: 124px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			background-repeat: no-repeat;
			background-position: 95% 50%;
			font-size: 15px;
			margin-bottom: 3px;
		}
		
		.contents input[class^="calendar"] {
			width: 125px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}	
		.popContainer .middle table tbody tr:hover {
			background-color: #ddf0ec;
		}	
		.btn_green {
		    border: 1px solid #d2d2d2;
		    border-radius: 5px;
		    background-color: #D6EAEA;
		    color: #2C8A91;
		    padding: 2px 8px;
		    font-size: 13px;
		}
		/* .popContainer .middle table thead th:nth-child(8),
		.popContainer .middle table tbody td:nth-child(8) {
			max-width: 105px;
		} */
	</style>
	<script type="text/javaScript">
		$(document).ready(function(){
	
		});
		
		//화면을 닫는다.
		/* var button = new Array;
		button = [];
		$('#program_layer2').dialog({
			resizable: "no",
			modal: true,
			title: '',
			open: function() {
				$('.ui-widget-overlay').addClass('custom-overlay');
			},
			close: function(event) {
				if(confirm('세금계산서 맵핑팝업을 닫으시겠습니까?')) {
					$('.ui-widget-overlay').removeClass('custom-overlay');
					$('#program_layer2').remove();
				} else {
					$(this).dialog("open");
				}
			},
			buttons: button
		}); */
		
		function fn_billSelect(billNo,billAmount){
			//alert("billNo====>"+billNo);
			
			try {
				<c:if test="${returnType == 'O' }">
					opener.document.getElementById('${returnBillNo}').value = billNo;
					opener.document.getElementById('${returnAmount}').value = billAmount;
				</c:if>
				
				<c:if test="${returnType == 'F' }">
					opener.${returnFunctionNm}(billNo,billAmount);
				</c:if>
				
			} catch (e) {
				// TODO: handle exception
			}
			
			close();
			/*//모달을 닫을 때 사용함. 
			$('#billFkKey').val(billNo);
			$('#callAmount').val(billAmount);
			
			//화면을 닫는다.
			$('.ui-widget-overlay').removeClass('custom-overlay');
	        $('#program_layer2').remove(); */
	
		}
		function fn_searchList(){
			
			document.listForm.action = "/mngMaint/payment/popup/popBillMappingList.do";
	       	document.listForm.submit(); 
		}
	</script>	
</head>
<body>
<form:form id="listForm" name="listForm" modelAttribute="searchVO" method="post" onsubmit="return false" >
<input type="hidden" id="billAcKey" name="billAcKey" value="<c:out value="${billAcKey}"/>" />
<fieldset>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">세금계산서 목록</div>
				<div class="floatR" style="margin-right: 40px;">				
					<form:input path="fromDate" type="text" placeholder="발급일자(from)" class="calendar fromDt" autocomplete="off"/> ~ <form:input path="toDate" type="text" placeholder="발급일자(to)" class="calendar toDt" />
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
							<th scope="row">맵핑</th>
							<th scope="row">세금계산서번호</th>
							<th scope="row">발급일자</th>
							<th scope="row">공급가액</th>
							<th scope="row">세액</th>
							<th scope="row">금액</th>
							<th scope="row">비고</th>
							<!-- <th scope="row">비고</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${billMappingList}" varStatus="status">
	            			<tr>
	            				<td> 
	            				<c:if test='${item.billMappingYn eq "N"}'>
	       							<a href="#" onclick="javascript:fn_billSelect('${item.billNo}', '${displayUtil.commaStr(item.billAmount)}');" class="btn btn_green">선택</a>     				
								</c:if>
								<c:if test='${item.billMappingYn eq "Y"}'>
	       							<a href="#" class="btn btn_gray" style="cursor: default;">선택</a>     				
								</c:if>	
	            				</td>
	            				<td align="center" class="listtd"><c:out value="${item.billMappingYn}"/></td>
	            				<td align="center" class="listtd"><c:out value="${item.billNo}"/></td>
	            				<td align="center" class="listtd"><c:out value="${displayUtil.displayDate(item.billIssueDt)}"/></td>
	            				<td align="right" class="listtd"><c:out value="${displayUtil.commaStr(item.billAmount)}"/></td>
	            				<td align="right" class="listtd"><c:out value="${displayUtil.commaStr(item.billTaxAmount)}"/></td>
	            				<td align="right" class="listtd"><c:out value="${displayUtil.commaStr(item.billTotalAmount)}"/></td>
	            				<td align="center" class="listtd"><c:out value="${item.remark}"/></td>
	            			</tr>
	        			</c:forEach>
<!-- <tr>
	<td>
		<a href="#" onclick="javascript:fn_billSelect('202108314100009685631628', '803,647,912');" class="btn btn_gray">선택</a>
	</td>	
	<td align="center" class="listtd">Y</td>
	<td align="center" class="listtd">202108314100009685631628</td>
	<td align="center" class="listtd">2021-12-23</td>
	<td align="right" class="listtd">83,647,912</td>
	<td align="right" class="listtd">3,647,912</td>
	<td align="right" class="listtd">85,647,912</td>
	<td align="left" class="listtd"><span title="가나다라마바사가나나다라라 가나다가나다가나다">가나다라마바사가나나다라라 가나다가나다가나다</span></td>
</tr>
<tr>
	<td>
		<a href="#" onclick="javascript:fn_billSelect('202108314100009685631628', '803,647,912');" class="btn btn_gray">선택</a>
	</td>
	<td align="center" class="listtd">Y</td>
	<td align="center" class="listtd">202108314100009685631628</td>
	<td align="center" class="listtd">2021-12-23</td>
	<td align="right" class="listtd">83,647,912</td>
	<td align="right" class="listtd">3,647,912</td>
	<td align="right" class="listtd">85,647,912</td>
	<td align="left" class="listtd"><span title="가나다라마바사가나나다라라 가나다가나다가나다">가나다라마바사가나나다라라 가나다가나다가나다</span></td>
</tr>
<tr>
	<td>
		<a href="#" onclick="javascript:fn_billSelect('202108314100009685631628', '803,647,912');" class="btn btn_gray">선택</a>
	</td>
	<td align="center" class="listtd">Y</td>
	<td align="center" class="listtd">202108314100009685631628</td>
	<td align="center" class="listtd">2021-12-23</td>
	<td align="right" class="listtd">83,647,912</td>
	<td align="right" class="listtd">3,647,912</td>
	<td align="right" class="listtd">85,647,912</td>
	<td align="left" class="listtd"><span title="가나다라마바사가나나다라라 가나다가나다가나다">가나다라마바사가나나다라라 가나다가나다가나다</span></td>
</tr>
<tr>
	<td>
		<a href="#" onclick="javascript:fn_billSelect('202108314100009685631628', '803,647,912');" class="btn btn_gray">선택</a>
	</td>
	<td align="center" class="listtd">Y</td>
	<td align="center" class="listtd">202108314100009685631628</td>
	<td align="center" class="listtd">2021-12-23</td>
	<td align="right" class="listtd">83,647,912</td>
	<td align="right" class="listtd">3,647,912</td>
	<td align="right" class="listtd">85,647,912</td>
	<td align="left" class="listtd"><span title="가나다라마바사가나나다라라 가나다가나다가나다">가나다라마바사가나나다라라 가나다가나다가나다</span></td>
</tr>
<tr>
	<td>
		<a href="#" onclick="javascript:fn_billSelect('202108314100009685631628', '803,647,912');" class="btn btn_gray">선택</a>
	</td>
	<td align="center" class="listtd">Y</td>
	<td align="center" class="listtd">202108314100009685631628</td>
	<td align="center" class="listtd">2021-12-23</td>
	<td align="right" class="listtd">83,647,912</td>
	<td align="right" class="listtd">3,647,912</td>
	<td align="right" class="listtd">85,647,912</td>
	<td align="center" class="listtd"></td>
</tr>
<tr>
	<td>
		<a href="#" onclick="javascript:fn_billSelect('202108314100009685631628', '803,647,912');" class="btn btn_gray">선택</a>
	</td>
	<td align="center" class="listtd">Y</td>
	<td align="center" class="listtd">202108314100009685631628</td>
	<td align="center" class="listtd">2021-12-23</td>
	<td align="right" class="listtd">83,647,912</td>
	<td align="right" class="listtd">3,647,912</td>
	<td align="right" class="listtd">85,647,912</td>
	<td align="left" class="listtd"><span title="가나다라마바사가나나다라라 가나다가나다가나다">가나다라마바사가나나다라라 가나다가나다가나다</span></td>
</tr> -->  			
					</tbody>
				</table>
			</div>
		</div>
	</div>
</fieldset>
</form:form>
</body>
</html>
            