<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
		body {
			width: 100%;
			background-color: #f6f7fc;
		}
		.sfcnt {
			height: 91px;
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
		table {
			border-collapse: collapse;
			font-size: 14px;
			/* border-bottom: 2px solid #c4c4c4; */
			table-layout: fixed;
		} 
		table tr td {
			padding: 13px 20px;
		}
		table tr td:last-child {
			width: 400px;
			font-weight: 200;
		}
		.dtl {
			overflow: hidden;
		}
		.dtl tbody {
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			/* height: 358px; */
			height: auto;
		}
		.dtl tbody tr {
			border: 1px solid #ebe9ee;
		}
		.dtl tbody tr:nth-child(5) {
			border-bottom: 1px solid transparent;
		}
		.dtl td {
			color: #000;
		}
		.dtl tr td {
			padding: 6px 20px;
			min-height: 48px;
		}
		.dtl tr td:first-child {
			background-color: #e1dff5;
			border-right: 1px solid #ebe9ee;
			color: #535353;
			width: 130px;
    		font-weight: 400;
		}
		.dtl tr td:last-child {
			width: 784px;
		}
		.dtl p {
			height: 34px;
			display: block;
			line-height: 34px;
		}
		.dtl .tclabel {
			margin: 0 3px 0 10px;
		}
		input[type="text"] {
		 	width: 191px;
		    height: 34px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
		}
		input[class="calendar"] {
		    background-image: url(/images/calendar_icon.png);
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		select {
			height: 37px;
		    width: 310px;
		    border: 1px solid #e9e9e9;
		    padding: 0 10px;
		    -webkit-appearance: none;
		    background: url(/images/arrow_down.png) no-repeat 91% 50%;
		    background-color: #fff;
		    color: #535353;
		}
		textarea {
			border: 1px solid #e6e6e6;
			padding: 0 10px;
		}
		select.nrslct {
			width: 100px !important;
		}
		.listForm .contents .dtl label.title {
			margin: 0 8px 0 20px;
		}
		label.radio {
		   overflow: hidden;
		   position: relative;
		   height: 26px;
		   box-sizing: border-box;
		   cursor: pointer;
		   margin-right: 17px;
		}
		label.radio input[type='radio'] {
			-webkit-appearance: none;
			width: 26px;
			height: 26px;
			border: 1px solid #e6e6e6;
			border-radius: 50%;
			outline: none;
			background: #e6e6e6;
			margin: 0 15px 0 0;
		}
		label.radio input[type='radio']:before {
			content:'';
			display: block;
			width: 60%;
			height: 60%;
			margin: 20% auto;  
			border-radius: 50%;  
		}
		label.radio input[type='radio']:checked {
			background: #7764cb;
		}
		label.radio input[type='radio']:checked:before {
		  	content: "\2713";
			color: #fff;
			line-height: 1.2;
			text-align: center;
		}
		input[class="calendar"] {
			width: 191px;
		}
		input[class="search"] {
			width: 191px;
			height: 38px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		textarea {
			width: calc(100% - 20px);
			height: 150px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}
		.dtl tr td:first-child label {
			color: red;
			vertical-align: middle;
		}
		.rqPmInfo {
		    width: 115px;
		    height: 30px;
		    background-color: #D6EAEA;
		    color: #2C8A91;
		    font-weight: bold;
		    border: 1px solid #C2DEE1;
		    margin-left: 8px;
		}
		.paymentDetail {
			float: right;
			margin-top: 13px;
			cursor: pointer;
		}
		.pmWrap {
			background: #fff;
			border-bottom: 2px solid #c4c4c4;
		}
	</style>
	<script>
		var payNoList = new Array();
		var amount = new Array();
		
		$(document).ready(function() {
			$('#infoList').find('li').bind('click',function () {
			    $except = $(this);
			    var selected = $("#infoList > li").index(this);
			    var aselected = $(this).children().eq(0);
			    
			  	$('#info' + selected).removeClass('dpNone');
				$('#info' + selected).addClass('dpBlock');
				
				aselected.addClass('on');
				
			    for(i = 0; i < $('#infoList li').not($except).length - 1; i++) {
			    	var nselected = $('#infoList li').index($('#infoList').find('li').not($except)[i]);
			    	
					$('#info' + nselected).removeClass('dpBlock');
					$('#info' + nselected).addClass('dpNone'); 
					
				    var anselected = $('#infoList li').not($except)[i].children[0];
					$(anselected).removeClass('on');
			    }
			    
			});
			
			$('.tCheck').on('click', function() {
				 if($(this).is(":checked") == true) {
					 $(this).val('Y');
				 } else {
					 $(this).val('N');
				 } 
			});
			
			$(".paymentDetail").click(function() {
				if($(this).hasClass("down")) {
					$("."+$(this).attr("id")).removeClass("dpNone");
			    	$(this).children().eq(0).remove();
			    	$(this).append("<img src='/images/arrow_up.png' />");
			    	$(this).removeClass("down");
			    	$(this).addClass("up");
				} else {
					$("."+$(this).attr("id")).addClass("dpNone");
			    	$(this).children().eq(0).remove();
			    	$(this).append("<img src='/images/arrow_down.png' />");
			    	$(this).removeClass("up");
			    	$(this).addClass("down");
				}
		    	
		    });
			
			 /* var turnNoList = new Array();
			
			<c:forEach items="${paymentList}" var="item">
				amount.push(Number("${item.amount}"));
			</c:forEach>
			
			/*회차별 금액 입력하면 전체 매입금과 비교 */
	/*		$("#callAmount").change(function(){
				var sum = 0;
				var inputValue = Number(removeCommas($(this).val()));
				
				for(var i = 0; i < amount.length; i++) {
					sum += amount[i];
				}
				if((sum + inputValue) > Number($("#buyAmount").val())) {
					alert("회차별 금액 합계가 전체 매입금보다 큽니다.");	
					$(this).val('');
					$(this).focus();
				}
			}); */
			
			$("#paymentTurn").change(function(){
				var idx = $("#paymentTurn option").index( $("#paymentTurn option:selected") );
				if(idx > 0) {
					fn_setBtn("check", "true");
				} else {
					fn_setBtn("check", "false");
				}
				
				var responseMap = {};
				var object = {};
				var formData = $("#reqForm").serializeArray();
				
				for (var i = 0; i<formData.length; i++){
				    if("paymentCallDt" == formData[i]['name']) {
	                	//날짜 - 제거
	                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
	                } else if("callAmount" == formData[i]['name']) {
						//숫자에서 컴마를 제거한다.
						object[formData[i]['name']] = removeCommas(formData[i]['value']); 
					} else {
	                	object[formData[i]['name']] = formData[i]['value'];
	                }     
				 }
				
				var sendData = JSON.stringify(object);
				$.ajax({
					url:"/project/request/detail/payment.do",
					dataType:'json',
					type:"POST",
					data:sendData,
					async:false,
					contentType: "application/json; charset=UTF-8", 
					success:function(response){
						if(response != null && response.successYN=='Y') {
							
							for(var key in response) {
								var value = response[key];
								$("#"+key).val(value);
								
								if(key == "callAmountTaxYn") {
									if(value == 'Y') {
										$("#callAmountTaxYn").prop("checked",true);
									} else {
										$("#callAmountTaxYn").prop("checked",false);
									}
								}
							}
							
							/* $("#paymentAccSeqFkKey").val(""+response.paymentAccSeqFkKey+"").attr("selected", "selected"); */ 
							
							if(response.paymentStatusCd == "PYST2000") {
								fn_setBtn("req", "true");
								fn_setBtn("mod", "false");
								fn_setBtn("check", "false");
							} else {
								fn_setBtn("mod", "true");
								fn_setBtn("req", "false");
								fn_setBtn("check", "true");
							}
						}
					},
					error: function(request, status, error) {
						if(request.status != '0') {
							alert("code: " + request.status + "\r\nmessage" + request.responseText + "\r\nerror: " + error)
						}
					}
				});   
				
			});
			
			$('a[id^=A_TOPMenu_]').each(function() {
				var title = $(this).attr("title");	
				$(this).attr("title", title + location.search);
			})
			
			$('a[id^=A_TOPMenu_]').click(function(event){ location.href = this.title; });
			
			$("#link").val(parent.document.location.href);
			
		});
		
		function fn_chkVali(kind, id) {
			if ($("#"+id+"Form")[0].checkValidity()){
	            if ($("#"+id+"Form")[0].checkValidity()){
	               //필수값 모두 통과하여 저장 프로세스 호출.
	               fn_save(kind, id);
	            } else {
	            	$("#"+id+"Form")[0].reportValidity();   
	            }            
	         }  else {
	             //Validate Form
	              $("#"+id+"Form")[0].reportValidity();   
	         }
		}
		
		function fn_save(kind, id) {
			
			if(kind == "req") {
				$("#paymentStatusCd"+id).val("PYST2000");
			} else if(kind == "mod") {
				$("#paymentStatusCd"+id).val("");
			} else if(kind == "check") {
				$("#paymentStatusCd"+id).val("PYST3000");
			}
			
			var object = {};
			var formData = $("#"+id+"Form").serializeArray();
			
			for (var i = 0; i<formData.length; i++){
			    if("paymentCallDt" == formData[i]['name']) {
	            	//날짜 - 제거
	            	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
	            } else if("callAmount" == formData[i]['name']) {
					//숫자에서 컴마를 제거한다.
					object[formData[i]['name']] = removeCommas(formData[i]['value']); 
				} else {
	            	object[formData[i]['name']] = formData[i]['value'];
	            }     
			 }
			
			var sendData = JSON.stringify(object);
			
			var sum = 0;
			var amount = [];
			
			$("input[id*=turnAmount]").each(function() {
				if($("#paymentTurn").val() == $(this).attr('id').replace("turnAmount", "")) {
					$(this).remove();
				} else {
					amount.push(Number($(this).val()));
				}
			});
			
			for(var i = 0; i < amount.length; i++) {
				sum += amount[i];
			}
			
			if(Number(removeCommas($("#callAmount").val())) > Number(removeCommas($("#buyAmount", parent.document).val()))) {
				alert("요청 금액이 전체 매입금보다 큽니다.");	
				$("#callAmount").focus();
			} /* else if(sum + Number(removeCommas($("#callAmount").val())) > Number(removeCommas($("#buyAmount", parent.document).val()))) {
				alert("회차별 금액 합계가 전체 매입금보다 큽니다.");	
				$("#callAmount").focus();
			}  */else {
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
				    		if($("#paymentStatusCd"+id).val() == "PYST2000" && kind == "req") {
				    			alert('지급이 요청되었습니다.');
				    		} else {
				    			alert('지급 정보가 수정되었습니다.');
				    		}
				    		location.reload();
				    	} else {
				    		if($("#paymentStatusCd"+id).val() == "PYST2000") {
				    			alert('지급 요청이 실패하였습니다.');
				    		} else {
				    			alert('지급 정보 수정이 실패하였습니다.');
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
		
		function fn_setBtn(obj, ablable) { 
			if(ablable == "true") {
				$("#"+obj).attr("disabled", true);
				$("#"+obj).css("cursor", "default");
				$("#"+obj+" img").removeClass("cursorP");
				$("#"+obj+" img").css("filter", "opacity(0.2) drop-shadow(0 0 0 black)");
			} else {
				$("#"+obj).attr("disabled", false);
				$("#"+obj).css("cursor", "pointer");
				$("#"+obj+" img").addClass("cursorP");
				$("#"+obj+" img").css("filter", "none");
			}
		}
		
		function fn_requestPmInfo() {
			var url = '/project/request/purchase/writePaymentInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey" : $('#pjKey').val(),
				"orderKey":$('#orderKey').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:657px;height:338px');  
		}
		
		function fn_mappingBill(paymentKey) {
			window.parent.location.href = "/mngProject/mapping/list.do?paymentKey="+paymentKey;
		}
		
		function fn_addView(billKey) {
			var url = '/project/request/purchase/viewBillInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"billNo":billKey
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:657px;height:338px'); 
		}
	</script>
</head>
<body>
	<div class="stitle">
		<ul id="infoList">
			<li><a class="on" id="A_TOPMenu_FORM" title="/project/request/purchase/paymentForm.do">지급정보</a></li>
			<li><a id="A_TOPMenu_PAY" title="/project/request/purchase/prePaymentList.do">기지급정보</a></li>
			<li></li>
		</ul>
	</div>
	<div class="floatC">
		<input type="hidden" id="pjKey" name="pjKey" value="${mainKey }" />
		<input type="hidden" id="orderKey" name="orderKey" value="${orderKey}" />


			
		<c:choose>
			<c:when test="${!empty paymentList }">
				<%-- <tr>
					<td>회차</td>
					<td>
						<select name="paymentTurn" id="paymentTurn" style="width:80px;">
							<c:forEach var="result" items="${paymentList }" varStatus="status">
								<option value="${result.paymentTurn }"><c:out value="${result.paymentTurn}" />회차</option>
							</c:forEach>
						</select> 
					</td>
				</tr> --%>
				<c:forEach var="result" items="${paymentList }" varStatus="status">
					<form id="${result.paymentKey }Form" name="reqForm" method="post">
						<input type="hidden" id="paymentBuyFkKey" name="paymentBuyFkKey" value="<c:out value="${purchaseVO.buyKey}"/>" />
						<input type="hidden" name="paymentAcFkKey" value="<c:out value="${orderVO.orderAcKey}"/>" />
						<input type="hidden" name="paymentKey" id="paymentKey" value="<c:out value="${result.paymentKey}"/>" />
						<input type="hidden" name="paymentStatusCd" id="paymentStatusCd${result.paymentKey }" value="<c:out value="${result.paymentStatusCd}"/>" />
						<input type="hidden" id="donePaymentAmount" name="donePaymentAmount" value="" />
						<input type="hidden" id="yetPaymentAmount" name="yetPaymentAmount" value="" />
						<input type="hidden" name="pjNm" value="${resultList[0].pjNm }" />
						<input type="hidden" name="pjSaleEmpKey" value="${resultList[0].pjSaleEmpKey }" />
						<input type="hidden" name="link" id="link" value="" />
						<div class="pmWrap">
							<table class="dtl" id="info0">
								<tr>
									<td><label>*</label>금액</td>
									<td>
										<input type="text" name="callAmount" id="callAmount" value="<c:out value="${displayUtil.commaStr(result.callAmount)}"/>" amountOnly required/>
										<%-- <c:forEach var="result" items="${paymentList }" varStatus="status"> --%>
										<input type="hidden" id="turnAmount${status.count }" value="${result.callAmount }" />
										<%-- </c:forEach> --%>
										<span class="paymentDetail down" id="${result.paymentKey }"><img src="/images/arrow_down.png" /></span>
									</td>
								</tr>
								<tr class="dpNone ${result.paymentKey }">
									<td><label>*</label>요청지급일</td>	
									<td>
										<input type="text"  class="calendar" name="paymentCallDt" value="<c:out value="${displayUtil.displayDate(result.paymentCallDt)}"/>" required/>
									</td>
								</tr>
								<tr class="dpNone ${result.paymentKey }">
									<td>계산서정보</td>
									<td>
										<c:choose>
											<c:when test="${result.billFkKey eq null }">
												<button type="button" onclick="fn_mappingBill('${result.paymentKey}');"><img src="<c:url value='/images/btn_mapping_bill.png'/>" /></button>
											</c:when>
											<c:otherwise>
												<button type="button" onclick="fn_addView('${result.billFkKey}');"><img src="<c:url value='/images/btn_view.png'/>" /></button>
											</c:otherwise>
										</c:choose>
										<input type="hidden" name="billFkKey" value="${result.billFkKey }" />
									</td>
								</tr>
								<tr class="dpNone ${result.paymentKey }">
									<td>지급계좌</td>
									<td>
										<select name="paymentAccSeqFkKey" id="paymentAccSeqFkKey">
											<c:forEach var="dresult" items="${depositList }" varStatus="status">
												<option <c:if test="${result.paymentAccSeqFkKey == dresult.acAdSeq }">selected</c:if> value="${dresult.acAdSeq }"><c:out value="${dresult.acBkno}" /> / <c:out value="${dresult.acBankNm}" /> / <c:out value="${dresult.acAcholder}" /></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr class="dpNone ${result.paymentKey }">
									<td>요청사항</td>
									<td><textarea name="remark" id="remark"><c:out value="${result.remark}"/></textarea></td>
								</tr>
								<tr class="dpNone ${result.paymentKey }">
									<td></td>
									<td>
										<div class="btnWrap">
											<div class="floatR">
												<c:choose>
													<c:when test="${!empty paymentList and result.billFkKey ne null}">
														<button type="button" id="req" value="매입금 지급 요청" onclick="fn_chkVali('req', '${result.paymentKey}');" style="<c:if test="${result.paymentStatusCd == 'PYST2000' }">cursor: default;</c:if>" <c:if test="${result.paymentStatusCd == 'PYST2000' }">disabled</c:if>><img class="<c:if test="${result.paymentStatusCd != 'PYST2000' }">cursorP</c:if>" src="<c:url value='/images/btn_req_purchase.png'/>" style="<c:if test="${result.paymentStatusCd == 'PYST2000' }">filter: opacity(0.2) drop-shadow(black 0px 0px 0px);</c:if>"/></button>
														<button type="button" id="mod" value="수정" onclick="fn_chkVali('mod', '${result.paymentKey}');" style="<c:if test="${result.paymentStatusCd == 'PYST1000' }">cursor: default;</c:if>" <c:if test="${result.paymentStatusCd == 'PYST1000' }">disabled</c:if>><img class="<c:if test="${result.paymentStatusCd != 'PYST1000' }">cursorP</c:if>" src="<c:url value='/images/btn_mod.png'/>" style="<c:if test="${result.paymentStatusCd == 'PYST1000' }">filter: opacity(0.2) drop-shadow(black 0px 0px 0px);</c:if>"/></button>
														<button type="button" id="check" value="매입금 지급 승인" onclick="fn_chkVali('check', '${result.paymentKey}');"style="<c:if test="${result.paymentStatusCd == 'PYST1000' }">cursor: default;</c:if>" <c:if test="${result.paymentStatusCd == 'PYST1000' }">disabled</c:if>><img class="<c:if test="${result.paymentStatusCd != 'PYST1000' }">cursorP</c:if>" src="<c:url value='/images/btn_ack_pay.jpg'/>" style="<c:if test="${result.paymentStatusCd == 'PYST1000' }">filter: opacity(0.2) drop-shadow(black 0px 0px 0px);</c:if>"/></button>
													</c:when>
													<c:otherwise>
														
													</c:otherwise>
												</c:choose>
											</div>
											<div class="floatC"></div> 
										</div>
									</td>
								</tr>
							</table>
						</div>
					</form>
				</c:forEach>
				<div><button type="button" class="rqPmInfo" onclick="fn_requestPmInfo();" style="margin-left:0; margin-top: 20px;">지급 정보 추가</button></div>
			</c:when>
			<c:otherwise>
				<table class="dtl" id="info0">
					<tr>
						<td style="width: 956px;">
							<c:if test="${empty prePaymentList}">
								요청할 지급 정보가 없습니다. 
								<button type="button" class="rqPmInfo" onclick="fn_requestPmInfo();">지급 정보 등록</button>
							</c:if>
							<c:if test="${!empty prePaymentList}">
								기 지급 정보를 확인해 주세요.
							</c:if>
						</td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>