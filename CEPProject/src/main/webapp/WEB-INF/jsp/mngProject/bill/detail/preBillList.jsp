<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/datepicker.min.css'/>"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<style>
		body {
			width: 100%;
			background-color: #f6f7fc;
			overflow: hidden !important;
		}
		.btnWrap {
			position: absolute;
			bottom: 31px;
		}
		.btnWrap.lt {
			left: 127px;
		}
		.btnWrap.rt {
			right: 127px;
		}
		table {
			width: 100%;
		}
		.stitle {
	    	margin-bottom: 0;
	    	font-size: 18px;
		    font-weight: 500;
		    margin-bottom: 10px;
		    margin-top: 30px;
		    width: 997px;
		}
		.stitle ul {
			width: 100%;
		}
		.stitle ul li {
		    float: left;
		    text-align: center;
		    font-size: 17px;
		    cursor: pointer;
		    width: 50%;
		}
		.stitle ul li a {
		    color: #a3a3a4;
		    padding-bottom: 10px;
		    border-bottom: 4px solid #a3a3a4;
		    display: block;
		}
		.stitle ul li a.on {
		    color: #000;
		    border-bottom: 4px solid #6a5bae;
		}
		.stitle ul li a:hover {
			color: #000;
			border-bottom: 4px solid #6a5bae;
		}
		.sdContent .dtl {
			width: 997px;
		    font-size: 14px;
		    border-collapse: collapse;
		    font-weight: 300;
		    overflow: hidden;
		}
		.sdContent .dtl thead {
			background-color: #e1dff5;
		    float: left;
		    width: 997px;
		}
		.sdContent .dtl thead tr {
		    display: table;
		    width: 997px;
		}
		.sdContent .dtl tbody {
		    width: 997px;
		    height: 536px;
		    overflow-y: auto;
		    overflow-x: hidden;
		    float: left;
		    border-bottom: 2px solid #c4c4c4;
		}
		.sdContent .dtl tbody tr {
		    display: table;
		    width: 997px;
		    cursor: pointer; 
		}
		.sdContent .dtl tbody tr:hover {
			background-color: #ddf0ec;
		}
		.sdContent .dtl thead th, .sdContent .dtl tbody tr td {
		    padding: 10px 7px;
		    border: 1px solid #edebef;
		    text-align: center;
		}
		.sdContent .dtl thead th:first-child, 
		.sdContent .dtl tbody td:first-child {
		    width: 25px;
		}
		.sdContent .dtl thead th:nth-child(2), 
		.sdContent .dtl tbody td:nth-child(2) {
		    width: 84px;
		    max-width: 84px;
		}
		.sdContent .dtl thead th:nth-child(3), 
		.sdContent .dtl tbody td:nth-child(3) {
		    width: 111px;
		    max-width: 111px;
		}
		.sdContent .dtl thead th:nth-child(4), 
		.sdContent .dtl tbody td:nth-child(4) {
		    width: 89px;
		}
		.sdContent .dtl tbody tr td:nth-child(4) {
		    font-weight: 400;
		}
		.sdContent .dtl tbody tr td a {
			color: #000;
		}
		.sdContent .dtl tbody tr td a:hover {
			color: #007AAE;
			text-decoration: underline;
		}
		.sdContent .dtl thead th:nth-child(5), 
		.sdContent .dtl tbody td:nth-child(5) {
		    width: 145px;
		}
		.sdContent .dtl thead th:nth-child(6), 
		.sdContent .dtl tbody td:nth-child(6) {
		    width: 93px;
		}
		.sdContent .dtl thead th:nth-child(7), 
		.sdContent .dtl tbody td:nth-child(7) {
		    width: 58px;
		}
		.sdContent .dtl thead th:nth-child(8), 
		.sdContent .dtl tbody td:nth-child(8) {
	    	width: 58px;
		}
		.sdContent .dtl thead th:nth-child(9),
		.sdContent .dtl tbody td:nth-child(9) {
		    width: 194px;
		}
		
		.sdContent .dtl tbody td span {
			display: inline-block;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		    width: 84%;
		    min-width: 55px;
		    max-width: 203px;
		    margin: 0 auto;
		}
		
		input[class^="calendar"] {
		    width: 96px;
		    height: 27px;
		    vertical-align: top;
		    border: 1px solid #ddd;
		}
		
	</style>
	<script>
		$(document).ready(function() {
			$("._pjNm").each(function() {
				$(this).val(parent.$("#pjNm").val());
			});
			
			$(".calendar").on("change", function() {
				$(this).next().next().find("#_salesCollectFinishDt").val($(this).val())
			});
			                
		});
		
	 	function fnMoveBillForm(billTurnNo) {
			if(billTurnNo != null) {
				$("#ipt_acKey").after("<input type='hidden' name='billTurnNo' value='"+billTurnNo+"' />");
			}
			form = document.reqForm;
			form.action = "<c:url value='/mngProject/bill/detail/billForm.do'/>";
			form.submit();  
		}
	 
	 	
	 	function fnComplete(obj) {
	 		var billInfo = {};

	 		if($(obj).next().find("#_salesCollectFinishDt").val().length == 0) {
	 			alert("수금 날짜를 입력해주세요.");
	 			$(obj).prev().focus();
	 		} else {
		 		$(obj).next().children().each(function() {
		 			if(removeData($(this).attr('id'),"_")   == "salesCollectFinishDt") {
		 				billInfo[removeData($(this).attr('id'),"_")] = removeData($(this).val(),"-");
		 			} else {
		 				billInfo[removeData($(this).attr('id'),"_")] = $(this).val();
		 			}
		 		});
		 		
				$.ajax({
		        	url :"/mngProject/bill/detail/writePaymentsComplate.do",
		        	type:"POST",  
		            data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            //async : false,
		            beforeSend: function() {
				 		parent.$(".wrap-loading").removeClass("dpNone");
				 	}, complete: function() {
				 		parent.$(".wrap-loading").addClass("dpNone");
				 	}, success:function(data){		  
		        		
		        		if(data.successYN == "Y") {
		        			if(billInfo.billIssueStatus == "E") {
		        				alert("수금 날짜가 수정 되었습니다.")
		        			} else {
		        				alert("수금 완료 처리되었습니다.");
		        			}
		        			
		        			location.reload();
		        		} else {
		        			if(billInfo.billIssueStatus == "E") {
		        				alert("수금 날짜 수정이 실패하였습니다.");
		        			} else {
		        				alert("수금 완료 처리에 실패하였습니다.");
		        			}
		        		}
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
			    });   
	 		}
	 	}
	 	
	 	function fnViewBillInsert(billCtFkKey) {
			 var url = '/mngProject/bill/popup/viewWriteSdBilling.do';
			 var dialogId = 'program_layer';
			 var varParam = {"billCtFkKey" : billCtFkKey};
			
			 var button = new Array;
			 button = [];
			 
			 parent.showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:545px');
		 }
	</script>
</head>
<body>
	<form id="frm_reqForm" name="reqForm" method="post">
		<div class="stitle">
			<ul id="infoList">
				<li><a class="on" id="A_TOPMenu_PRE" title="/mngProject/bill/detail/preBillList.do">기존 계산서 정보</a></li>
				<li><a id="A_TOPMenu_FORM" onclick="javascript:fnMoveBillForm(null);"  title="/mngProject/bill/detail/billForm.do">계산서 요청 정보</a></li>
				<li></li>
			</ul>
		</div>
		<div class="floatC sdContent">
			<input type="hidden" id="ipt_pjKey"            name="pjKey"       value="${pjKey}" />
			<input type="hidden" id="ipt_acKey"            name="acKey"       value="${acKey}" />
			<table class="dtl" id="info2">
				<thead>
					<tr>
						<th>No</th>
						<!-- <th>계산서 번호</th> -->
						<th>발행일자</th>
						<th>매출처</th>
						<th>매출처 담당자</th>
						<th>발행 이메일</th>
						<th>계산서 금액</th>
						<th>발행구분</th>
						<th>진행</th>
						<%
							if (session.getAttribute("empAuthCd").equals("EMAU1001")) {
						%>
						<th>완료</th>
						<% } %>
						<%
							if (!session.getAttribute("empAuthCd").equals("EMAU1001")) {
						%>
						<th>수금일자</th>
						<% } %>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${prePaymentList }" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<%-- <td><span>${result.billNo }</span></td> --%>
							<td><span>${displayUtil.displayDate(result.billIssueDt) }</span></td> 
							<td><a href="javascript:fnMoveBillForm('${result.billTurnNo}')"><span><c:out value="${result.billAcNm }"></c:out></span></a></td>
							<td><span>${result.billAcDirectorName }</span></td>
							<td><span style="width: 108px;" title="${result.billIssueEmail }">${result.billIssueEmail }</span></td>
							<td class="textalignR"><span>${displayUtil.commaStr(result.billAmount) }</span></td>
							<td>
								<c:choose>
									<c:when test="${result.billIssueType == 'Y' }">
										<span>정발행</span>
									</c:when>
									<c:when test="${result.billIssueType eq null }">
										<span></span>
									</c:when>
									<c:otherwise>
										<span>역발행</span>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${result.billIssueStatus == 'R' }">
										<span>요청</span>
									</c:when>
									<c:when test="${result.billIssueStatus == 'M' }">
										<span>매핑<br /><img src="/images/btn_cancel_mapping_green.png" onclick="javascript:fnViewBillInsert('${result.salesKey }');" /></span>
									</c:when>
									<c:when test="${result.billIssueStatus == 'I' }">
										<span>
											발행<br />
											<% if(session.getAttribute("empAuthCd").equals("EMAU1001")) { %>
											<img src="/images/btn_cancel_bill_green.png" onclick="javascript:fnMoveBillForm('${result.billTurnNo}')" title="발행 취소"/>
											<% } %>
										</span>
									</c:when>
									<c:when test="${result.billIssueStatus == 'E' }">
										<span>수금</span>
									</c:when>
									<c:otherwise>
										<span></span>
									</c:otherwise>
								</c:choose>
							</td>
							<%
								if (session.getAttribute("empAuthCd").equals("EMAU1001")) {
							%>
							<td>
								<c:choose>
									<c:when test="${result.billIssueStatus == 'R' }">
										<button type="button" class="btnComp" onclick="javascript:fnMoveBillForm('${result.billTurnNo}');">
											<img src="<c:url value='/images/btn_end_bill_gray.png'/>" />
										</button>
									</c:when>
									<c:when test="${result.billIssueStatus == 'M' }">
										<button type="button" class="btnComp" onclick="javascript:fnMoveBillForm('${result.billTurnNo}');">
											<img src="<c:url value='/images/btn_end_bill_gray.png'/>" />
										</button>
									</c:when>
									<c:when test="${result.billIssueStatus == 'I' }">
										<c:set var="key" value="${result.salesCollectFinishDt }" />
										<input type="text" class="calendar" value="${displayUtil.displayDate(result.salesCollectFinishDt) }" />
										<button type="button" class="btnComp"  onclick="javascript:fnComplete(this);">
										<%-- onclick="javascript:fnComplete('${result.pjKey }', '${result.billCallKey}' ,'${result.salesKey }');"> --%>
											<img src='/images/btn_end_col.png' />
										</button>
										<div class="dpNone">
											<input type="hidden" id="_pjKey" value="${result.pjKey }" />
											<input type="hidden" id="_billCallKey" value="${result.billCallKey }" />
											<input type="hidden" id="_salesKey" value="${result.salesKey }" />
											<input type="hidden" id="_billTurnNo" value="${result.billTurnNo }" />
											<input type="hidden" id="_pjNm" class="_pjNm" value="" />
											<input type="hidden" id="_salesCollectFinishDt" class="_salesCollectFinishDt" value="<c:if test="${result.salesCollectFinishDt ne null}">${result.salesCollectFinishDt}</c:if>" />
											<input type="hidden" id="_billIssueStatus" class="_billIssueStatus" value="${result.billIssueStatus}" />
										</div>
									</c:when>
									<c:when test="${result.billIssueStatus == 'E' }">
										<input type="text" class="calendar" value="${displayUtil.displayDate(result.salesCollectFinishDt) }" />
										<button type="button" class="btnComp"  onclick="javascript:fnComplete(this);">
										<%-- onclick="javascript:fnComplete('${result.pjKey }', '${result.billCallKey}' ,'${result.salesKey }');"> --%>
											<img src='/images/btn_blue_mod.png' />
										</button>
										<div class="dpNone">
											<input type="hidden" id="_pjKey" value="${result.pjKey }" />
											<input type="hidden" id="_billCallKey" value="${result.billCallKey }" />
											<input type="hidden" id="_salesKey" value="${result.salesKey }" />
											<input type="hidden" id="_billTurnNo" value="${result.billTurnNo }" />
											<input type="hidden" id="_pjNm" class="_pjNm" value="" />
											<input type="hidden" id="_salesCollectFinishDt" class="_salesCollectFinishDt" value="<c:if test="${result.salesCollectFinishDt ne null}">${result.salesCollectFinishDt}</c:if>" />
											<input type="hidden" id="_billIssueStatus" class="_billIssueStatus" value="${result.billIssueStatus}" />
										</div>
									</c:when>
									<%-- <c:when test="${empty result.salesCollectFinishDt }">
										<c:set var="key" value="${result.salesCollectFinishDt }" />
										<button type="button" class="btnComp" onclick="javascript:fnComplete('${result.pjKey }', '${result.billCallKey}' ,'${result.salesKey }');">
											<img src="<c:url value='/images/btn_end_col.png'/>" />
										</button>
									</c:when> --%>
									
									<%-- <c:otherwise>
										<span>${displayUtil.displayDate(result.salesCollectFinishDt) }</span>
									</c:otherwise> --%>
								</c:choose>
							</td>
							<% } %>
							<%
								if (!session.getAttribute("empAuthCd").equals("EMAU1001")) {
							%>
							<td>
								<c:choose>
									<c:when test="${result.billIssueStatus == 'R' }">
										미수금<br />(예상일자: ${displayUtil.displayDate(result.salesCollectFcDt) })
									</c:when>
									<c:when test="${result.billIssueStatus == 'M' }">
										미수금<br />(예상일자: ${displayUtil.displayDate(result.salesCollectFcDt) })
									</c:when>
									<c:when test="${result.billIssueStatus == 'I' }">
										미수금<br />(예상일자: ${displayUtil.displayDate(result.salesCollectFcDt) })
									</c:when>
									<c:when test="${result.billIssueStatus == 'E' }">
										${displayUtil.displayDate(result.salesCollectFinishDt) }<br />(예상일자: ${displayUtil.displayDate(result.salesCollectFcDt) })
									</c:when>
								</c:choose>
							</td>
							<% } %>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>