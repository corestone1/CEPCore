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
		#info2 tbody {
			height: 540px;
		}
		#info2 tr th,
		#info2 tr td {
			padding: 10px;
			text-align: center;
			border-right: 1px solid #edecef;
		} 
		#info2 tr th {
			font-weight: 400;
			color: #535353;
			background-color: #e1dff5;
		}
		#info2 tr td {
			font-weight: 200;
			width: auto;
			background: #fff;
			border-bottom: 1px solid #edecef;
		}
		#info2 tr td:last-child {
			border-right: none;
		}
		#info2 tr td span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
		}
		#compForm .dtl {
		    font-size: 15px;
		    border-collapse: collapse;
		    overflow: hidden;
		    border-bottom: 2px solid #6a5bae;
		    width: 997px;
		}
		#compForm .dtl thead {
			background-color: #e1dff5;
		    float: left;
		    width: 999px;
		}
		#compForm .dtl thead tr {
			display: table;
			width: 999px;
		}
		#compForm .dtl thead th, 
		#compForm .dtl tbody tr td {
		    padding: 10px 0;
		    border: 1px solid #edebef;
		}
		#compForm .dtl thead th:first-child, 
		#compForm .dtl tbody td:first-child {
		    width: 41px;
		    max-width: 41px;
		}
		#compForm .dtl thead th:nth-child(7), 
		#compForm .dtl tbody td:nth-child(7) {
		    width: 181px;
		    max-width: 181px;
		}
		#compForm .dtl thead th:nth-child(6), 
		#compForm .dtl tbody td:nth-child(6) {
		    width: 139px;
		    max-width: 139px;
		}
		#compForm .dtl thead th:nth-child(5), 
		#compForm .dtl tbody td:nth-child(5) {
		    width: 142px;
		    max-width: 142px;
		}
		#compForm .dtl thead th:nth-child(4), 
		#compForm .dtl tbody td:nth-child(4) {
		    width: 122px;
		    max-width: 122px;
		}
		#compForm .dtl thead th:nth-child(3), 
		#compForm .dtl tbody td:nth-child(3) {
		    width: 122px;
		    max-width: 122px;
		}
		#compForm .dtl thead th:nth-child(2), 
		#compForm .dtl tbody td:nth-child(2) {
		    width: 100px;
		    max-width: 100px;
		}
		#compForm .dtl tbody {
		    height: 545px;
		    overflow-y: auto;
		    overflow-x: hidden;
		    float: left;
		}
		#compForm .dtl tbody tr {
		    display: table;
		    width: 999px;
		    cursor: pointer;
		}
		#compForm .dtl tbody tr:hover td {
			background-color: #ddf0ec;
		}
		#compForm .dtl tr td span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 90%;
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
			
			$('a[id^=A_TOPMenu_]').each(function() {
				var title = $(this).attr("title");	
				$(this).attr("title", title + location.search);
			})
			
			$('a[id^=A_TOPMenu_]').click(function(event){ location.href = this.title; });
			
		});
		function fn_comp(key, amount, obj) {
			if($("input[id="+key+"]").val().length == 0) {
	 			alert("지급 날짜를 입력해주세요.");
	 			$("input[id="+key+"]").focus();
	 		} else {
				var pSum = parent.document.getElementById("buyAmount").value;
				var pDone = parent.document.getElementById("originDonePaymentAmount").value;
				var pYet = parent.document.getElementById("originYetPaymentAmount").value;
				
				var object = {};
				
				object['paymentKey'] = key;
				if($(obj).next().val() !="PYST4000") {
					object['paymentStatusCd'] = "PYST4000";
				}
				object['donePaymentAmount'] = Number(pDone) + Number(amount);
				object['yetPaymentAmount'] = Number(pYet) - Number(amount);
				object['buyKey'] = $('#buyKey').val();
				object['paymentDt'] = removeData($("input[id="+key+"]").val(),"-");
				object['pjKey'] = parent.document.getElementById("pjKey").value;
				object['pjNm'] = parent.document.getElementById("ipt_pjNm").value;
				object['link'] = window.location.pathname.replace("/","");
	
				var sendData = JSON.stringify(object);
				if(confirm("지급 " +$(obj).val()+ " 처리하시겠습니까?")) {
					$.ajax({
						url:"/project/request/update/paymentInfo.do",
						dataType: 'json', 
					    type:"POST",  
					    data: sendData,
					    async:true, 
					 	contentType: "application/json; charset=UTF-8", 
					 	beforeSend:function(){
					        $('.wrap-loading', parent.document).removeClass('dpNone');
					    },
		
					   	complete:function(){
					        $('.wrap-loading', parent.document).addClass('dpNone');
					    }, 
					    success:function(response){	
					    	if(response!= null && response.successYN == 'Y') {
					    		alert('지급 '+ $(obj).val() +' 처리되었습니다.');
					    		parent.document.location.reload()
					    	} else {
					    		alert('지급 '+ $(obj).val() +' 처리에 실패하였습니다.');
					    		parent.document.location.reload()
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
		}
	</script>
</head>
<body>
	<div class="stitle">
		<ul id="infoList">
			<li><a class="on" id="A_TOPMenu_PAY" title="/project/request/purchase/prePaymentList.do">지급 승인 목록</a></li>
			<li><a id="A_TOPMenu_FORM" title="/project/request/purchase/paymentForm.do">미 지급 목록</a></li>
			<li></li>
		</ul>
	</div>
	<div class="floatC">
		<form id="compForm" name="compForm" method="post">
			<input type="hidden" id="buyKey" value="${ prePaymentList[0].paymentBuyFkKey }" />
			<table class="dtl" id="info2">
				<thead>
					<tr>
						<th>No</th>
						<th>계산서 발행일자</th>
						<th>계산서 금액</th>
						<th>지급 금액</th>
						<th>사업자번호</th>
						<th>상호</th>
						<%
							if (session.getAttribute("empAuthCd").equals("EMAU1001")) {
						%>
						<th>완료</th>
						<% } else { %>
						<th>상태</th>
						<% } %>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${prePaymentList }" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td><span title="${displayUtil.displayDate(result.billIssueDt) }">${displayUtil.displayDate(result.billIssueDt) }</span></td>
							<td><span title="${displayUtil.commaStr(result.billAmount) }">${displayUtil.commaStr(result.billAmount) }</span></td>
							<td><span title="${displayUtil.commaStr(result.callAmount) }">${displayUtil.commaStr(result.callAmount) }</span></td>
							<td><span title="${result.billAcKey }">${result.billAcKey }</span></td>
							<td><span title="${result.acNm }">${result.acNm }</span></td>
							<%
								if (session.getAttribute("empAuthCd").equals("EMAU1001")) {
							%>
							<td>
								<c:choose>
									<c:when test="${result.paymentStatusCd ne 'PYST4000'}">
										<c:choose>
											<c:when test="${result.billIssueStatus eq null }">
												<span>계산서 요청을 해주세요.</span>
											</c:when>
											<c:otherwise>
												<c:if test="${result.billIssueStatus eq 'R' }">계산서 등록을 해주세요.</c:if>
												<c:if test="${result.billIssueStatus eq 'I' }">계산서 매핑을 해주세요.</c:if>
												<c:if test="${result.billIssueStatus eq 'M' }">
													<c:set var="key" value="${result.paymentKey }" />
													<input type="text" class="calendar" value="${displayUtil.displayDate(result.paymentDt) }" id="${result.paymentKey }"/>
													<button type="button" class="btnComp" value="완료" onclick="fn_comp('${result.paymentKey }',  '${result.callAmount }', this)"><img src="<c:url value='/images/btn_end_pay.png'/>" /></button>
													<input type="hidden" value="${result.paymentStatusCd }" />
												</c:if>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<input type="text" class="calendar" value="${displayUtil.displayDate(result.paymentDt) }" id="${result.paymentKey }"/>
										<button type="button" class="btnComp" value="수정" onclick="fn_comp('${result.paymentKey }',  '${result.callAmount }', this)"><img src="<c:url value='/images/btn_blue_mod.png'/>" /></button>
										<input type="hidden" value="${result.paymentStatusCd }" />
									</c:otherwise>
								</c:choose>
							</td>
							<% } else { %>
							<td>
								<c:if test="${result.paymentStatusCd eq 'PYST3000' }">
									미지급<br />
									(예상 일자: ${displayUtil.displayDate(result.paymentCallDt) })
								</c:if>
								<c:if test="${result.paymentStatusCd eq 'PYST4000' }">
									지급 완료(${displayUtil.displayDate(result.paymentDt) })
								</c:if>
							</td>
							<% } %>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>