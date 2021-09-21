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
				url:"/cmm/update/paymentInfo.do",
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
		
	 	function fnMoveBillForm() {
			
			form = document.reqForm;
			form.action = "<c:url value='/mngProject/bill/detail/billForm.do'/>";
			form.submit(); 
		}
	 	
	 	function fnComplete(pstPjKey, pstBillCallKey, pstSalesKey){
	 		
 			 
			var billInfo = {'pjKey' : pstPjKey, 'billCallKey' : pstBillCallKey, 'salesKey' : pstSalesKey};
			
			 $.ajax({
		        	url :"/mngProject/bill/detail/writePaymentsComplate.do",
		        	type:"POST",  
		            data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		alert("계산서 등록이 완료되었습니다.!")
		        		
		        		form = document.reqForm;
		    			form.action = "<c:url value='/mngProject/bill/detail/preBillList.do'/>";
		    			form.submit(); 
		        		
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
	<form id="frm_reqForm" name="reqForm" method="post">
		<div class="stitle">
			<ul id="infoList">
				<li><a id="A_TOPMenu_FORM" onclick="javascript:fnMoveBillForm();"  title="/mngProject/bill/detail/billForm.do">계산서 요청 정보</a></li>
				<li><a class="on" id="A_TOPMenu_PRE" title="/mngProject/bill/detail/preBillList.do">기존 계산서 정보</a></li>
				<li></li>
			</ul>
		</div>
		<div class="floatC">
			<input type="hidden" id="ipt_pjKey"            name="pjKey"       value="${pjKey}" />
			<input type="hidden" id="ipt_acKey"            name="acKey"       value="${acKey}" />
			<table class="dtl" id="info2">
				<tr>
					<th>No</th>
					<th>계산서 번호</th>
					<th>계산서 발행일자</th>
					<th>계산서 거래처 담당자</th>
					<th>계산서 금액</th>
					<th>지급 금액</th>
					<th>지급완료</th>
				</tr>
				<c:forEach var="result" items="${prePaymentList }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td><span>${result.billNo }</span></td>
						<td><span>${displayUtil.displayDate(result.billIssueDt) }</span></td>
						<td><span>${result.billAcDirectorNm }</span></td>
						<td><span>${displayUtil.commaStr(result.billAmount) }</span></td>
						<td><span>${displayUtil.commaStr(result.billTotalAmount) }</span></td>
						<td>
							<c:choose>
								<c:when test="${empty result.salesCollectFinishDt }">
									<c:set var="key" value="${result.salesCollectFinishDt }" />
									<button type="button" class="btnComp" onclick="javascript:fnComplete('${result.pjKey }', '${result.billCallKey}' ,'${result.salesKey }');">
										<img src="<c:url value='/images/btn_end_pay.png'/>" />
									</button>
								</c:when>
								<c:otherwise>
									<span>${displayUtil.displayDate(result.salesCollectFinishDt) }</span>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>