<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		.ui-dialog {
			top: 81px !important;
    		position: absolute !important;
		}
		.popContainer .top {
			width: 100%;
			height: 103px;
			border-bottom: 4px solid #4b3a93;
			position: absolute;
			top: 0;
		}
		.popContainer .top > div {
			font-size: 24px;
			padding-left: 34px;
			padding-top: 43px;
		}
		.popContainer .contents {
			position: absolute;
			width: 100%;
			height: 440px;
			top: 107px;
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
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
	  		width: 100%;
	  		border-bottom: none;
		}
		.popContainer .contents > div > table tr td {
			padding: 10px 20px;
		}
		.popContainer .contents select {
			width: 326px;
			height: 40px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 95% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.popContainer .contents select.wdts {
			width: 135px;
		}
		.popContainer .contents input {
			width: 177px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="pname"] {
			width: 400px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
		}
		.popContainer .contents input[class^="calendar"] {
			height: 40px;
			background-image: url('/images/icon_calendar.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: calc(100% - 20px);
			height: 113px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}
		.popContainer .contents td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer .contents td.tdTitle {
			margin-top: 11px;
			font-size: 14px;
			color: #525252;
			padding-right: 20px;
			width: 17%;
		}
		.popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
		}
		.popContainer .contents td.tdContents {
			width: 87%;
			font-size: 14px;
		} 
		.ui-datepicker.ui-widget-content {
			z-index: 102 !important;
		 }
		 .btnWrap {
		 	text-align: center;
		 }
		 .btnSave {
		 	width: calc(100% - 365px);
		 	float: left;
		 	text-align: right;
		 }
		#m_div_accountList {
			left: 152px;
    		margin-top: 38px;
		}
		#sp_delete_forecast {
			position: absolute;
		    right: 40px;
		    top: 20px;
		}
	</style>
	<script>
		function fn_chkVali() {
			if ($("#infoForm")[0].checkValidity()){
	            if ($("#infoForm")[0].checkValidity()){
	               //필수값 모두 통과하여 저장 프로세스 호출.
	               fn_save();
	            } else {
	                $("#infoForm")[0].reportValidity();   
	            }            
	            
	         }  else {
	             //Validate Form
	              $("#infoForm")[0].reportValidity();   
	         }
		}
		
		var countSave = 0;
		
		function fn_save() {
			var object = {};
			var formData = $("#infoForm").serializeArray();
			var form = document.infoForm;
			
			if(Number(removeCommas($("#callAmount").val())) > Number(removeCommas($("#buyAmount", parent.document).val()))) {
				alert("요청 금액이 전체 매입금보다 큽니다.");	
				$("#callAmount").focus();
			} else {
				for (var i = 0; i<formData.length; i++){
				    if("callAmount" == formData[i]['name']){
	                	//컴마제거
	                	object[formData[i]['name']] = removeData(formData[i]['value'], ",");
	                } else if("paymentCallDt" == formData[i]['name']){
	                	//날짜 - 제거
	                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
	                } else {
	                	object[formData[i]['name']] = formData[i]['value'];
	                }     
				 }
				
				var sendData = JSON.stringify(object);
				
				$.ajax({
					url:"/project/request/insert/paymentInfo.do",
				    dataType: 'json', 
				    type:"POST",  
				    data: sendData,
				 	contentType: "application/json; charset=UTF-8", 
					beforeSend: function(xhr) {
						xhr.setRequestHeader("AJAX", true);
						//xhr.setRequestHeader(header, token);
						
					},
				    success:function(response){	
				    	if(response!= null && response.successYN == 'Y') {
			    			alert("지급 정보가 저장되었습니다.");
			    			location.reload();
			    		} else {
			    			alert("지급 정보 저장이 실패하였습니다.");
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
		
		$(document).ready(function() {
			
		});
	
			
	</script>
</head>
<body>
	<form:form commandName="infoForm" id="infoForm" name="infoForm" method="post">
		<input type="hidden" name="buyOrderFkKey" value="${orderKey }"/>
		<input type="hidden" name="paymentAcFkKey" value="${acKey }"/>
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">지급정보 등록</div>
				</div>
			</div>
			<div class="contents">
				<!-- <input type="text" id="id" style="border: 1px solid #000; width: 200px;"/>
				<input type="text" id="no" style="border: 1px solid #000; width: 200px;"/> -->
				<input type="hidden" id="dialogId" />
				<div>  
					<table>
						<tr>
							<td class="tdTitle"><label>*</label>금액</td>
							<td class="tdContents">
								<input type="text" name="callAmount" id="callAmount" amountOnly required/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>요청지급일</td>
							<td class="tdContents">
								<input type="text"  class="calendar" name="paymentCallDt" id="paymentCallDt" readOnly required/>	
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>지급계좌</td>
							<td class="tdContents">
								<select name="paymentAccSeqFkKey" id="paymentAccSeqFkKey">
									<c:forEach var="result" items="${depositList }" varStatus="status">
										<option value="${result.acAdSeq }"><c:out value="${result.acBkno}" /> / <c:out value="${result.acBankNm}" /> / <c:out value="${result.acAcholder}" /></option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>요청사항</td>
							<td class="tdContents">
								<textarea name="remark" id="remark"></textarea>
							</td>
						</tr>
					</table>
				</div>
				<div class="btnWrap">
					<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>