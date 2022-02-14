<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<style>
		body {
			width: 100%;
			background-color: #f6f7fc;
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
		}
		.stitle ul {
			width: 100%;
		}
		.stitle ul li {
		    float: left;
		    text-align: center;
		    font-size: 17px;
		    cursor: pointer;
		    width: 27%;
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
			height: 535px;
			max-height: 535px;
    		width: 100%;
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
		    width: 51px;
		    max-width: 51px;
		}
		#compForm .dtl thead th:nth-child(7), 
		#compForm .dtl tbody td:nth-child(7) {
		    width: 127px;
		    max-width: 127px;
		}
		#compForm .dtl thead th:nth-child(6), 
		#compForm .dtl tbody td:nth-child(6) {
		    width: 100px;
		    max-width: 100px;
		}
		#compForm .dtl thead th:nth-child(5), 
		#compForm .dtl tbody td:nth-child(5) {
		    width: 142px;
		    max-width: 142px;
		}
		#compForm .dtl thead th:nth-child(4), 
		#compForm .dtl tbody td:nth-child(4) {
		    width: 142px;
		    max-width: 142px;
		}
		#compForm .dtl thead th:nth-child(3), 
		#compForm .dtl tbody td:nth-child(3) {
		    width: 122px;
		    max-width: 122px;
		}
		#compForm .dtl thead th:nth-child(2), 
		#compForm .dtl tbody td:nth-child(2) {
		    width: 190px;
		    max-width: 190px;
		}
		#compForm .dtl tbody {
		    /* height: 535px; */
		    overflow-y: auto;
		    overflow-x: hidden;
		    float: left;
		}
		#compForm .dtl tbody tr {
		    display: table;
		    width: 999px;
		    cursor: pointer;
		}
		#compForm .dtl tr td span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 90%;
		}
		.rqPmInfo {
		    width: 115px;
		    height: 27px;
		    background-color: #D6EAEA;
		    color: #2C8A91;
		    font-weight: bold;
		    border: 1px solid #C2DEE1;
		    margin-left: 8px;
		}
		
		button {
		    background: none;
		}
		.btnWrap {
			position: absolute;
			bottom: 14px;
		}
		.btnWrap.rt {
			right: 0px;
		}
	</style>
	<script>
		$(document).ready(function() {
			/* $('a[id^=A_TOPMenu_]').each(function() {
				var title = $(this).attr("title");	
				$(this).attr("title", title + location.search);
			})
			
			$('a[id^=A_TOPMenu_]').click(function(event){ location.href = this.title; }); */

			$('#info2 tr').click(function() {
				 var tdArr = new Array();    // 배열 선언
		            
			        // 현재 클릭된 Row(<tr>)
			       /*  var tr = $(this);
			        var td = tr.children();

			        console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		            
			        console.log("클릭한 select 값 : "+td.eq(1).text());
			        console.log("클릭한 select 값 : "+$('#check'+$(this).children().eq(1).text()).val());
			        
			        // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
			        td.each(function(i){
			            tdArr.push(td.eq(i).text());
			        });
			                
			        console.log("배열에 담긴 값 : "+tdArr); */

				//$("input[name=selectKey]").val($('#check'+$(this).children().eq(1).text()).val());	
			       
				//document.compForm.m0_paymentKey.value=$($(this).children().eq(7).text()).val();
				
				$('#m0_paymentKey').val($(this).children().eq(7).text());
				$('#m0_proceedTurn').val($(this).children().eq(9).text());
				/* location.href = "/maintenance/detail/prodInfo.do"; */
				document.compForm.action = "/mngMaint/payment/detail/paymentForm.do";
	            document.compForm.submit();  
				
			});
		});
		function fn_comp(key, amount, billNo) {
			var pSum = parent.document.getElementById("buyAmount").value;
			var pDone = parent.document.getElementById("originDonePaymentAmount").value;
			var pYet = parent.document.getElementById("originYetPaymentAmount").value;
			
			var object = {};
			
			object['paymentKey'] = key;
			object['paymentStatusCd'] = "PYST4000";
			object['donePaymentAmount'] = Number(pDone) + Number(amount);
			object['yetPaymentAmount'] = Number(pYet) - Number(amount);
			object['buyKey'] = $('#buyKey').val();
			object['billFkKey'] = billNo;

			var sendData = JSON.stringify(object);
			console.log(sendData);
			$.ajax({
				url:"/project/request/update/paymentInfo.do",
				dataType: 'json', 
			    type:"POST",  
			    data: sendData,
			    async:false, 
			 	contentType: "application/json; charset=UTF-8", 
				beforeSend: function(xhr) {
					xhr.setRequestHeader("AJAX", true);
					//xhr.setRequestHeader(header, token);
					
				},
			    success:function(response){	
			    	if(response!= null && response.successYN == 'Y') {
			    		alert('지급 완료 처리되었습니다.');
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
		
		function fnMovePaymentList() {			
			form = document.compForm;
			form.action = "/mngMaint/payment/detail/prePaymentList.do";
			form.submit(); 
		}
		
		function fnMovePaymentForm() {			
			//form = document.compForm;
			//form.action = "/mngMaint/payment/detail/paymentForm.do";
			//form.submit(); 
			window.parent.document.getElementById("m_iframGubun").value="detail";
    		window.parent.document.getElementById("m_proceedTurn").value=$('#m0_proceedTurn').val();
    			
    		window.parent.changeIframeUrl();
		}
	</script>
</head>
<body>
	<div class="stitle">
		<ul id="infoList">
			<li><a class="on" id="A_TOPMenu_PAY" onclick="javascript:fnMovePaymentList();">지급요청목록</a></li>
			<li><a id="A_TOPMenu_FORM" onclick="javascript:fnMovePaymentForm();">지급정보</a></li>
			<li></li>
		</ul>
	</div>
	<div class="floatC">
		<form id="compForm" name="compForm" method="post">
			<input type="hidden" id="m0_mtOrderType" name="mtOrderType" value="<c:out value="${mtOrderType}"/>"/>
			<input type="hidden" id="m0_mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${mtIntegrateKey}"/>"/>
			<input type="hidden" id="m0_mtWorkKey" name="mtWorkKey" value="<c:out value="${mtWorkKey}"/>"/>	
			<input type="hidden" id="m0_mtOrderKey" name="mtOrderKey" value="<c:out value="${mtOrderKey}"/>"/>	
			<input type="hidden" id="m0_billAcKey" name="billAcKey" value="<c:out value="${billAcKey}"/>"/>	
			<input type="hidden" id="m0_proceedTurn"  name="proceedTurn" value="${proceedTurn}" />
			<input type="hidden" id="m0_totalTurn" name="totalTurn" value="${totalTurn}" />
			<input type="hidden" id="m0_paymentKey" name="paymentKey" />	
					
			<%-- <input type="hidden" id="buyKey" value="${ prePaymentList[0].paymentBuyFkKey }" /> --%>
			<table class="dtl" id="info2">
				<thead>
					<tr>
						<th>No</th>
						<th>계산서 번호</th>
						<th>계산서 발행일자</th>
						<th>계산서 금액</th>
						<th>지급요청일</th>
						<th>지급완료일</th>
						<th>계산서 요청 상태</th>
						<th style="max-width: 0px; display: none;"></th>
						<th style="max-width: 0px; display: none;"></th>
						<th style="max-width: 0px; display: none;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${prePaymentList}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td><span>${result.billNo }</span></td>
							<td><span>${displayUtil.displayDate(result.billIssueDt) }</span></td>
							<td><span>${displayUtil.commaStr(result.billAmount) }</span></td>
							<td><span>${displayUtil.displayDate(result.paymentCallDt) }</span></td>
							<td><span>${displayUtil.displayDate(result.paymentDt) }</span></td>
							<td>								
							<c:choose>
								<c:when test="${result.paymentStatusCd eq 'W'}">
									<span>요청대기</span>
								</c:when>
								<c:when test="${result.paymentStatusCd eq 'M'}">
									<span>계산서매핑</span>
								</c:when>
								<c:when test="${result.paymentStatusCd eq 'R'}">
									<span>지급요청</span>
								</c:when>
								<c:when test="${result.paymentStatusCd eq 'C'}">
									<span>지급승인</span>
								</c:when>
								<c:when test="${result.paymentStatusCd eq 'E'}">
									<span>지급완료</span>
								</c:when>
								<c:when test="${result.paymentStatusCd == null }">
									<span>지급요청전</span>
								</c:when>
								<c:otherwise>
									<span>${list.paymentStatusCd}</span>
								</c:otherwise>
							</c:choose>
							</td>
							<td style="max-width: 0px; display: none;">${result.paymentKey}</td>
							<td style="max-width: 0px; display: none;">${result.paymentDtFkKey}</td>
							<td style="max-width: 0px; display: none;">${result.paymentTurn}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
	<div class="btnWrap rt">
		<div class="floatR">
			<button type="button" class="rqPmInfo" onclick="fnMovePaymentForm();">지급 정보 등록</button>
			
		</div>
	</div>
</body>
</html>