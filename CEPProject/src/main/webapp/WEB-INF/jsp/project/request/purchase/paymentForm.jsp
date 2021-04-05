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
		}
		.sfcnt {
			height: 91px;
		}
		.btnWrap {
			position: absolute;
			bottom: 31px;
		}
		.btnWrap.rt {
			right: 0px;
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
			border-bottom: 2px solid #c4c4c4;
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
			height: 408px;
		}
		.dtl tbody tr {
			border: 1px solid #ebe9ee;
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
		
		function fn_chkVali(kind) {
			if ($("#reqForm")[0].checkValidity()){
	            if ($("#reqForm")[0].checkValidity()){
	               //필수값 모두 통과하여 저장 프로세스 호출.
	               fn_save(kind);
	            } else {
	            	$("#reqForm")[0].reportValidity();   
	            }            
	         }  else {
	             //Validate Form
	              $("#reqForm")[0].reportValidity();   
	         }
		}
		
		function fn_save(kind) {
			
			if(kind == "req") {
				$("#paymentStatusCd").val("PYST2000");
			} else if(kind == "mod") {
				$("#paymentStatusCd").val("");
			} else if(kind == "check") {
				$("#paymentStatusCd").val("PYST3000");
			}
			
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
				alert("회차 금액이 전체 매입금보다 큽니다.");	
				$("#callAmount").focus();
			} else if(sum + Number(removeCommas($("#callAmount").val())) > Number(removeCommas($("#buyAmount", parent.document).val()))) {
				alert("회차별 금액 합계가 전체 매입금보다 큽니다.");	
				$("#callAmount").focus();
			} else {
				console.log(sendData);
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
				    		if($("#paymentStatusCd").val() == "PYST2000" && kind == "req") {
				    			alert($("#paymentTurn").val() + '회차 지급이 요청되었습니다.');
				    		} else {
				    			alert('지급 정보가 수정되었습니다.');
				    		}
				    		location.reload();
				    	} else {
				    		if($("#paymentStatusCd").val() == "PYST2000") {
				    			alert($("#paymentTurn").val() + '회차 지급이 요청이 실패하였습니다.');
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
		<form id="reqForm" name="reqForm" method="post">
			<input type="hidden" id="paymentBuyFkKey" name="paymentBuyFkKey" value="<c:out value="${purchaseVO.buyKey}"/>" />
			<input type="hidden" name="paymentAcFkKey" value="<c:out value="${orderVO.orderAcKey}"/>" />
			<input type="hidden" name="paymentKey" id="paymentKey" value="<c:out value="${paymentList[0].paymentKey}"/>" />
			<input type="hidden" name="paymentStatusCd" id="paymentStatusCd" value="<c:out value="${paymentList[0].paymentStatusCd}"/>" />
			<input type="hidden" id="donePaymentAmount" name="donePaymentAmount" value="" />
			<input type="hidden" id="yetPaymentAmount" name="yetPaymentAmount" value="" />
			<input type="hidden" name="pjKey" value="${mainKey }" />
			<input type="hidden" name="pjNm" value="${resultList[0].pjNm }" />
			<input type="hidden" name="pjSaleEmpKey" value="${resultList[0].pjSaleEmpKey }" />
			<input type="hidden" name="link" id="link" value="" />
			<table class="dtl" id="info0">
				<c:choose>
					<c:when test="${!empty paymentList }">
						<tr>
							<td>회차</td>
							<td>
								<select name="paymentTurn" id="paymentTurn" style="width:80px;">
									<c:forEach var="result" items="${paymentList }" varStatus="status">
										<option value="${result.paymentTurn }"><c:out value="${result.paymentTurn}" />회차</option>
									</c:forEach>
								</select> 
							</td>
						</tr>
						<tr>
							<td><label>*</label>금액</td>
							<td>
								<input type="text" name="callAmount" id="callAmount" value="<c:out value="${displayUtil.commaStr(paymentList[0].callAmount)}"/>" amountOnly required/>
								<c:forEach var="result" items="${paymentList }" varStatus="status">
									<input type="hidden" id="turnAmount${status.count }" value="${result.callAmount }" />
								</c:forEach>
								<input type='checkbox' class='tCheck' id='callAmountTaxYn' name="callAmountTaxYn" value='<c:choose><c:when test="${paymentList[0].callAmountTaxYn== 'Y'}">Y</c:when><c:otherwise>N</c:otherwise></c:choose>' <c:if test="${paymentList[0].callAmountTaxYn== 'Y'}">checked</c:if>/>
								<label for='callAmountTaxYn' class='cursorP tclabel'></label>
								<span class="cbspan">부가세 포함</span>
							</td>
						</tr>
						<tr>
							<td><label>*</label>요청지급일</td>	
							<td>
								<input type="text"  class="calendar" name="paymentCallDt" id="paymentCallDt" value="<c:out value="${displayUtil.displayDate(paymentList[0].paymentCallDt)}"/>" required/>
							</td>
						</tr>
						<tr>
							<td>계산서정보</td>
							<td>
								<button type="button"><img src="<c:url value='/images/btn_view.png'/>" /></button>
								<input type="hidden" name="billFkKey" value="${result.billFkKey }" />
							</td>
						</tr>
						<tr>
							<td>지급계좌</td>
							<td>
								<select name="paymentAccSeqFkKey" id="paymentAccSeqFkKey">
									<c:forEach var="result" items="${depositList }" varStatus="status">
										<option <c:if test="${paymentList[0].paymentAccSeqFkKey == result.acAdSeq }">selected</c:if> value="${result.acAdSeq }"><c:out value="${result.acBkno}" /> / <c:out value="${result.acBankNm}" /> / <c:out value="${result.acAcholder}" /></option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>요청사항</td>
							<td><textarea name="remark" id="remark"><c:out value="${paymentList[0].remark}"/></textarea></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td style="width: 956px;">요청할 회차 정보가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</form>
	</div>
	<div class="btnWrap rt">
		<div class="floatR">
			<c:choose>
				<c:when test="${!empty paymentList }">
					<button type="button" id="req" value="매입금 지급 요청" onclick="fn_chkVali('req');" style="<c:if test="${paymentList[0].paymentStatusCd == 'PYST2000' }">cursor: default;</c:if>" <c:if test="${paymentList[0].paymentStatusCd == 'PYST2000' }">disabled</c:if>><img class="<c:if test="${paymentList[0].paymentStatusCd != 'PYST2000' }">cursorP</c:if>" src="<c:url value='/images/btn_req_purchase.png'/>" style="<c:if test="${paymentList[0].paymentStatusCd == 'PYST2000' }">filter: opacity(0.2) drop-shadow(black 0px 0px 0px);</c:if>"/></button>
					<button type="button" id="mod" value="수정" onclick="fn_chkVali('mod');" style="<c:if test="${paymentList[0].paymentStatusCd == 'PYST1000' }">cursor: default;</c:if>" <c:if test="${paymentList[0].paymentStatusCd == 'PYST1000' }">disabled</c:if>><img class="<c:if test="${paymentList[0].paymentStatusCd != 'PYST1000' }">cursorP</c:if>" src="<c:url value='/images/btn_mod.png'/>" style="<c:if test="${paymentList[0].paymentStatusCd == 'PYST1000' }">filter: opacity(0.2) drop-shadow(black 0px 0px 0px);</c:if>"/></button>
					<button type="button" id="check" value="매입금 지급 승인" onclick="fn_chkVali('check');"style="<c:if test="${paymentList[0].paymentStatusCd == 'PYST1000' }">cursor: default;</c:if>" <c:if test="${paymentList[0].paymentStatusCd == 'PYST1000' }">disabled</c:if>><img class="<c:if test="${paymentList[0].paymentStatusCd != 'PYST1000' }">cursorP</c:if>" src="<c:url value='/images/btn_ack_pay.jpg'/>" style="<c:if test="${paymentList[0].paymentStatusCd == 'PYST1000' }">filter: opacity(0.2) drop-shadow(black 0px 0px 0px);</c:if>"/></button>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
		</div>
	</div> 
</body>
</html>