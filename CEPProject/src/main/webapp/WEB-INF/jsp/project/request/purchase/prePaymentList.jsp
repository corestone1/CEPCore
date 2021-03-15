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
	</style>
	<script>
		$(document).ready(function() {
			$('a[id^=A_TOPMenu_]').each(function() {
				var title = $(this).attr("title");	
				$(this).attr("title", title + location.search);
			})
			
			$('a[id^=A_TOPMenu_]').click(function(event){ location.href = this.title; });

		});
		function fn_comp(key, amount) {
			var pSum = parent.document.getElementById("buyAmount").value;
			var pDone = parent.document.getElementById("originDonePaymentAmount").value;
			var pYet = parent.document.getElementById("originYetPaymentAmount").value;
			
			var object = {};
			
			object['paymentKey'] = key;
			object['paymentStatusCd'] = "PYST4000";
			object['donePaymentAmount'] = Number(pDone) + Number(amount);
			object['yetPaymentAmount'] = Number(pYet) - Number(amount);
			object['buyKey'] = $('#buyKey').val();

			var sendData = JSON.stringify(object);
			 
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
	</script>
</head>
<body>
	<div class="stitle">
		<ul id="infoList">
			<li><a id="A_TOPMenu_FORM" title="/project/request/purchase/paymentForm.do">지급정보</a></li>
			<li><a class="on" id="A_TOPMenu_PAY" title="/project/request/purchase/prePaymentList.do">기지급정보</a></li>
			<li></li>
		</ul>
	</div>
	<div class="floatC">
		<form id="compForm" name="compForm" method="post">
			<input type="hidden" id="buyKey" value="${ prePaymentList[0].paymentBuyFkKey }" />
			<table class="dtl" id="info2">
				<tr>
					<th>No</th>
					<th>계산서 번호</th>
					<th>계산서 발행일자</th>
					<th>계산서 금액</th>
					<th>지급 금액</th>
					<th>부가세 여부</th>
					<th>지급완료</th>
				</tr>
				<c:forEach var="result" items="${prePaymentList }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td><span>${result.billNo }</span></td>
						<td><span>${displayUtil.displayDate(result.billIssueDt) }</span></td>
						<td><span>${displayUtil.commaStr(result.billAmount) }</span></td>
						<td><span>${displayUtil.commaStr(result.callAmount) }</span></td>
						<td><span>${result.callAmountTaxYn }</span></td>
						<td>
							<c:choose>
								<c:when test="${empty result.paymentDt }">
									<c:set var="key" value="${result.paymentKey }" />
									<button type="button" class="btnComp" onclick="fn_comp('${result.paymentKey }',  '${result.callAmount }')"><img src="<c:url value='/images/btn_end_pay.png'/>" /></button>
								</c:when>
								<c:otherwise>
									<span>${displayUtil.displayDate(result.paymentDt) }</span>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</body>
</html>