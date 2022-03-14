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
		/* #info2 tbody {
			height: 540px;
			width: 997px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			border-bottom: 2px solid #c4c4c4;
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
		} */


		.mContents .dtl {
			width: 997px;
			font-size: 14px;
			border-collapse: collapse;
			font-weight: 300;
			overflow: hidden;
		}
		.mContents .dtl thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
		}
		.mContents .dtl thead tr {
			display: table;
			width: 997px;
		}
		.mContents .dtl tbody {
			width: 997px;
			height: 536px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			border-bottom: 2px solid #c4c4c4;
		}
		.mContents .dtl tbody tr {
			display: table;
			width: 997px;
			/* cursor: pointer; */
		}
		.mContents .dtl tbody tr:hover {
			background-color: #ddf0ec
		}
		.mContents .dtl tbody tr td:nth-child(4) {
			font-weight: 400;
		}
		.mContents .dtl thead th, .mContents .dtl tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
		}

		.mContents .dtl thead th:first-child,
		.mContents .dtl tbody td:first-child {
			width: 30px;
		}
		.mContents .dtl thead th:nth-child(2),
		.mContents .dtl tbody td:nth-child(2){
			width: 200px;
			max-width: 200px;
		}
		.mContents .dtl thead th:nth-child(3),
		.mContents .dtl tbody td:nth-child(3) {
			width: 75px;
			max-width: 75px;
		}
		.mContents .dtl thead th:nth-child(4),
		.mContents .dtl tbody td:nth-child(4) {
			width: 135px;
		}
		.mContents .dtl thead th:nth-child(5),
		.mContents .dtl tbody td:nth-child(5) {
			width: 85px;
		}
		.mContents .dtl thead th:nth-child(6),
		.mContents .dtl tbody td:nth-child(6) {
			width: 105px;
		}
		.mContents .dtl thead th:nth-child(7),
		.mContents .dtl tbody td:nth-child(7) {
			width: 63px;
		}
		.mContents .dtl thead th:nth-child(8),
		.mContents .dtl tbody td:nth-child(8) {
			width: 60px;
		}
		/* .mContents .dtl thead th:nth-child(9),
		.mContents .dtl tbody td:nth-child(9) {
			width: 90px;
		}	 */	
		.mContents .dtl tbody tr td a {
		    color: #000;
		}
		#frm_reqForm .dtl tbody tr {
		    display: table;
		    width: 999px;
		    cursor: pointer;
		}
	</style>
	<script>
		$(document).ready(function() {
			$('#info2 tr').click(function() {
				//console.log("====>"+$(this).children().eq(0).text())
				/* location.href = "/maintenance/detail/prodInfo.do"; */
				
				/* $('#ipt_billTurnNo').val($(this).children().eq(0).text());				
				document.reqForm.action = "/mngMaint/bill/detail/billForm.do";
	            document.reqForm.submit(); */
	            
				window.parent.document.getElementById("m_iframGubun").value="detail";
	    		window.parent.document.getElementById("m_billTurnNo").value=$(this).children().eq(0).text();
	    			
	    		window.parent.changeIframeUrl();
			});
			                
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
			
			/* form = document.reqForm;
			form.action = "<c:url value='/mngMaint/bill/detail/billForm.do'/>";
			form.submit();  */
	 		window.parent.document.getElementById("m_iframGubun").value="detail";
    		window.parent.document.getElementById("m_billTurnNo").value=$('#ipt_billTurnNo').val();
    			
    		window.parent.changeIframeUrl();
		}
	 	
	 	function fnComplete(pstPjKey, pstBillCallKey, pstSalesKey, billIssueStatus, turnNo){
	 		
 			if(billIssueStatus == 'M') {
 				if(confirm(turnNo+"회차에 대한 수금완료처리를 하시겠습니까?")) {
 					var billInfo = {'pjKey' : pstPjKey, 'billCallKey' : pstBillCallKey, 'salesKey' : pstSalesKey, 'billIssueStatus' : 'E'};
 					
 					$.ajax({
 				        	url :"/mngMaint/bill/detail/updateSdCollectStatus.do",
 				        	type:"POST",  
 				            data: billInfo,
 				     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
 				     	    dataType: 'json',
 				            async : false,
 				        	success:function(data){		  
 				        		
 				        		if(data.successYN=='Y') {
 				        			alert(turnNo+"회차에 대한 수금완료처리를 성공했습니다.");
 				        			form = document.reqForm;
 	 				    			form.action = "<c:url value='/mngMaint/bill/detail/preBillList.do'/>";
 	 				    			form.submit(); 
 				        		} else {
 				        			alert(turnNo+"회차에 대한 수금완료처리를 실패했습니다.");
 				        		}
 				        		
 				        		
 				        		
 				        		
 				            },
 				        	error: function(request, status, error) {
 				        		if(request.status != '0') {
 				        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
 				        		}
 				        	} 
 				    });
 				}
 			} else {
 				if(billIssueStatus == 'R') {
 					alert("현재 세금계산서 요청상태 입니다. \n수금완료는 세금계산서 맵핑 후 완료할 수 있습니다.")
 				} else if(billIssueStatus == 'I') {
 					alert("현재 세금계산서 발행상태 입니다. \n수금완료는 세금계산서 맵핑 후 완료할 수 있습니다.")
 				}
 			}
			
	 	}
	 	

		 
		 function fnViewBillInsert(billCtFkKey) {
			 var url = '/mngMaint/bill/popup/viewWriteSdBilling.do';
			 var dialogId = 'program_layer';
			 var varParam = {"billCtFkKey" : billCtFkKey};
			
			 var button = new Array;
			 button = [];
			 
			 
			 
			 /* showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:495px'); */ 
			 parent.showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:545px');
			
		 }
	 	
	</script>
</head>
<body>
	<form id="frm_reqForm" name="reqForm" method="post">
		<div class="stitle">
			<ul id="infoList">
				<li><a class="on" id="A_TOPMenu_PRE" title="/mngMaint/bill/detail/preBillList.do">기존 계산서 정보</a></li>
				<li><a id="A_TOPMenu_FORM" onclick="javascript:fnMoveBillForm();"  title="/mngMaint/bill/detail/billForm.do">계산서 요청 정보</a></li>
				<li></li>
			</ul>
		</div>
		<div class="mContents floatC">
			<input type="hidden" id="ipt_pjKey"  name="pjKey" value="${pjKey}" />
			<input type="hidden" id="ipt_acKey"  name="acKey" value="${acKey}" />
			<input type="hidden" id="ipt_billTurnNo"  name="billTurnNo" value="${billTurnNo}" />
			<input type="hidden" id="ipt_totalTurn" name="totalTurn" value="${totalTurn}" />
			<table class="dtl" id="info2">
				<thead class="ftw400">
					<tr>
						<th scope="row">회차</th>
						<th scope="row">계산서 번호</th>
						<th scope="row">발행일자</th>
						<th scope="row">매출처</th>
						<th scope="row">매출처 담당자</th>
						<th scope="row">계산서 금액</th>
						<!-- <th scope="row">수금 금액</th> -->
						<th scope="row">발행구분</th>
						<th scope="row">진행상태</th>
						<th scope="row">수금완료일</th>
						<th style="max-width: 0px; display: none;">billTurnNo</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="result" items="${prePaymentList }" varStatus="status">
					<tr>
						<%-- <td>${status.count }</td> --%>
						<td>${result.billTurnNo }</td>
						<td><span>${result.billNo }</span></td>
						<td><span>${displayUtil.displayDate(result.billIssueDt) }</span></td>
						<td><span><c:out value="${result.billAcNm}"/></span></td>
						<%-- <td><span><a href="javascript:fnViewBillInsert('${result.salesKey}')" ><c:out value="${result.billAcNm}"/></a></span></td> --%>
						<td><span>${result.billAcDirectorNm }</span></td>
						<td class="textalignR"><span>${displayUtil.commaStr(result.billAmount) }</span></td>
						<%-- <td class="textalignR"><span>${displayUtil.commaStr(result.billTotalAmount) }</span></td> --%>
						<td>
							<%-- <span>${result.billTaxYn }</span> --%>
					<c:choose>
						<c:when test="${result.billIssueType eq 'Y'}">
							<span>정발행</span>
						</c:when>
						<c:when test="${result.billIssueType eq 'N'}">
							<span>역발행</span>
						</c:when>
						<c:otherwise>
							<span>${result.billIssueType}</span>
						</c:otherwise>
					</c:choose>
						</td>
						<td>
						<!-- R:요청, I:발급, M:매핑, E:지급완료(수금완료) -->
					<c:choose>
						<c:when test="${result.billIssueStatus eq 'R'}">
							<span>요청</span>
						</c:when>
						<c:when test="${result.billIssueStatus eq 'I'}">
							<span>발급</span>
						</c:when>
						<c:when test="${result.billIssueStatus eq 'M'}">
							<span>매핑</span>
						</c:when>
						<c:when test="${result.billIssueStatus eq 'E'}">
							<span>수금완료</span>
						</c:when>
						<c:otherwise>
							<span>${result.billIssueStatus}</span>
						</c:otherwise>
					</c:choose>
							
						</td>
						<td>
							<span>${displayUtil.displayDate(result.salesCollectFinishDt) }</span>
							<%-- <c:choose>
								<c:when test="${empty result.salesCollectFinishDt }">
									<c:set var="key" value="${result.salesCollectFinishDt }" />
									<button type="button" class="btnComp" onclick="javascript:fnComplete('${result.mtKey}', '${result.billCallKey}' ,'${result.salesKey}','${result.billIssueStatus}', '${status.count}');">
										<img src="<c:url value='/images/btn_end_pay.png'/>" />
									</button>
								</c:when>
								<c:otherwise>
									<span>${displayUtil.displayDate(result.salesCollectFinishDt) }</span>
								</c:otherwise>
							</c:choose> --%>
						</td>
						<td style="max-width: 0px; display: none;"><c:out value="${result.billTurnNo}"/></td>
					</tr>
				</c:forEach>
					<!-- <tr>
						<td>10</td>
						<td><span>20210310155031508</span></td>
						<td><span>2021-03-10</span></td>
						<td><span>미래홍길동</span></td>
						<td><span>010-2651-1234</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td><span>Y</span></td>
						<td><span>수금완료</span></td>
						<td>	
							<button type="button" class="btnComp" onclick="javascript:fnComplete('', 'MB210010' ,'MS210019');">
								<img src="/images/btn_end_pay.png"></button>
						</td>
					</tr>
					<tr>
						<td>11</td>
						<td><span>20210310155031508</span></td>
						<td><span>2021-03-10</span></td>
						<td><span>미래홍길동</span></td>
						<td><span>010-2651-1234</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td><span>Y</span></td>
						<td><span>수금완료</span></td>
						<td>	
							<button type="button" class="btnComp" onclick="javascript:fnComplete('', 'MB210010' ,'MS210019');">
								<img src="/images/btn_end_pay.png"></button>
						</td>
					</tr>
					<tr>
						<td>12</td>
						<td><span></span></td>
						<td><span></span></td>
						<td><span>미래홍길동</span></td>
						<td><span>010-2651-1234</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td><span>Y</span></td>
						<td><span>수금완료</span></td>
						<td>	
							<button type="button" class="btnComp" onclick="javascript:fnComplete('', 'MB210010' ,'MS210019');">
								<img src="/images/btn_end_pay.png"></button>
						</td>
					</tr>
					<tr>
						<td>13</td>
						<td><span></span></td>
						<td><span></span></td>
						<td><span>미래홍길동</span></td>
						<td><span>010-2651-1234</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td><span>Y</span></td>
						<td><span>수금완료</span></td>
						<td>	
							<button type="button" class="btnComp" onclick="javascript:fnComplete('', 'MB210010' ,'MS210019');">
								<img src="/images/btn_end_pay.png"></button>
						</td>
					</tr>
					<tr>
						<td>14</td>
						<td><span></span></td>
						<td><span></span></td>
						<td><span>미래홍길동</span></td>
						<td><span>010-2651-1234</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td><span>Y</span></td>
						<td><span>수금완료</span></td>
						<td>	
							<button type="button" class="btnComp" onclick="javascript:fnComplete('', 'MB210010' ,'MS210019');">
								<img src="/images/btn_end_pay.png"></button>
						</td>
					</tr>
					<tr>
						<td>15</td>
						<td><span></span></td>
						<td><span></span></td>
						<td><span>미래홍길동</span></td>
						<td><span>010-2651-1234</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td><span>Y</span></td>
						<td><span>수금완료</span></td>
						<td>	
							<button type="button" class="btnComp" onclick="javascript:fnComplete('', 'MB210010' ,'MS210019');">
								<img src="/images/btn_end_pay.png"></button>
						</td>
					</tr>
					<tr>
						<td>16</td>
						<td><span></span></td>
						<td><span></span></td>
						<td><span>미래홍길동</span></td>
						<td><span>010-2651-1234</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td><span>Y</span></td>
						<td><span>수금완료</span></td>
						<td>	
							<button type="button" class="btnComp" onclick="javascript:fnComplete('', 'MB210010' ,'MS210019');">
								<img src="/images/btn_end_pay.png"></button>
						</td>
					</tr>
					<tr>
						<td>17</td>
						<td><span></span></td>
						<td><span></span></td>
						<td><span>미래홍길동</span></td>
						<td><span>010-2651-1234</span></td>
						<td><span>1,000,000</span></td>
						<td><span>1,000,000</span></td>
						<td><span>Y</span></td>
						<td><span>수금완료</span></td>
						<td>	
							<button type="button" class="btnComp" onclick="javascript:fnComplete('', 'MB210010' ,'MS210019');">
								<img src="/images/btn_end_pay.png"></button>
						</td>
					</tr>
					<tr>
						<td>18</td>
						<td><span></span></td>
						<td><span></span></td>
						<td><span>미래홍길동</span></td>
						<td><span>010-2651-1234</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td><span>Y</span></td>
						<td><span>수금완료</span></td>
						<td>	
							<button type="button" class="btnComp" onclick="javascript:fnComplete('', 'MB210010' ,'MS210019');">
								<img src="/images/btn_end_pay.png"></button>
						</td>
					</tr>
					<tr>
						<td>19</td>
						<td><span></span></td>
						<td><span></span></td>
						<td><span>미래홍길동</span></td>
						<td><span>010-2651-1234</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td class="textalignR"><span>901,000,000</span></td>
						<td><span>Y</span></td>
						<td><span>수금완료</span></td>
						<td>	
							<button type="button" class="btnComp" onclick="javascript:fnComplete('', 'MB210010' ,'MS210019');">
								<img src="/images/btn_end_pay.png"></button>
						</td>
					</tr> -->				
				</tbody>
				
			
			</table>
		</div>
	</form>
</body>
</html>