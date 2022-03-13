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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<script src="<c:url value='/js/popup.js'/>"></script>
	<script src="<c:url value='/js/file.js'/>"></script>
	<script src="<c:url value='/js/jquery.fileDownload.js'/>"></script>
	
	<style>
		body {
			width: 100%;
			background-color: #f6f7fc;
			overflow: hidden !important;
		}
		.sfcnt {
			height: 91px;
		}
		.btnWrap {
			position: absolute;
			bottom: 75px;
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
		table {
			border-collapse: collapse;
			font-size: 14px;
			border-bottom: 2px solid #c4c4c4;
			table-layout: fixed;
		} 
		table tr td {
			padding: 13px 20px;
			height: 40px;
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
			min-height: 486px;
			max-height: 539px;
		}
		.dtl tbody tr {
			border: 1px solid #ebe9ee;
		}
		.dtl tbody tr:last-child {
		    border-bottom: none;
		}
		.dtl td {
			color: #000;
		}
		.dtl tr td {
			padding: 6px 20px;
			min-height: 48px;
		}
		.dtl tr td:first-child {
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
			height: 100px;
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
		
		.backgroundpurple {
			background-color: #e1dff5;
		}
		
		.backgroundgray {
			background-color: #d5d5d6;
		}
		#m_div_accountList {
			margin-top: -2px;
			margin-left: 0px;
		}
	</style>
	<script>
		
		$(document).ready(function() {
			
			$("#slt_billTurnNo").on("change", function(){
				fnReload();
			});
			
			$("#acNm").on("keyup", function(event){
				fn_searchAccoutList(this, $(this).val());					
			}); 
			
			$("#ipt_pjNm").val(parent.$("#pjNm").val());
		});
			
		/* 
		alert('${billInfo.billIssueType == "Y"}'
				+'\n'+
				'${billInfo.billIssueType == ""}' 
				+'\n'+
				'${billInfo.billIssueType == null}');
		
		alert('${billInfo.billIssueType == "Y" || billInfo.billIssueType == "" || billInfo.billIssueType == null}');
		 */
		 
		 function fn_searchAccoutList(pObject, pstAccountNm) {
			$('#m_div_accountList').remove();
		
			var jsonData = {'acNm' : pstAccountNm, 'acSalesYN' : 'Y'};
			
			 $.ajax({
		        	url :"/mngCommon/account/searchList.do",
		        	type:"POST",  
		            data: jsonData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		//alert(data.accountList[0].acNm);
		        		//선택 목록 생성
		        		fnViewAccountList(pObject, data.accountList);
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    }); 
		}
		 
		 function fnViewAccountList(pObject, pjAccountList) {
				
				var html = '<div id="m_div_accountList">'
				         + '<ul class="accountList">'
				       ;
				       
		        for(var i=0; i < pjAccountList.length; i++)
		    	{
		    	   html += '<li id="m_li_account" title="'+ pjAccountList[i].acKey +'">' + pjAccountList[i].acNm + '</li>'
		    	        ;
		    	} 
				       
				       
				html +=  '</ul>'
				     + '</div>'
				     ;//+ '</div>';
				//$('#m_td_account').after(html);
				$('#acNm').after(html);
				
				$("[id^='m_li_account']").click(function(event)
				{
					//alert(this.title);
					
					$('#billAcKey').val(this.title); 
					$('#acNm').val(this.innerText);
					
					$('#m_div_accountList').remove();
				});
				
			}
		 
		 
		 
		 function fnBillRequest(mode) {
			var text = "";
			 
			switch(mode) {
				case 'req': text = "요청";break;
				case 'mod': text = "수정";break;
			}
			
			
			if ($("#frm_reqForm")[0].checkValidity()){
				if(confirm("계산서 정보를 " + text + "하시겠습니까?")) {
	               	//필수값 모두 통과하여 저장 프로세스 호출.
	               	var object = {};
	            	var formData = $("#frm_reqForm").serializeArray();
	            	
					for (var i = 0; i<formData.length; i++){
					    if("billRequestDt" == formData[i]['name'] || "billIssueDt" == formData[i]['name']) {
		                	//날짜 - 제거
		                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
		                } else if("billAmount" == formData[i]['name']) {
		                	// 금액 , 제거
		                	object[formData[i]['name']] = removeData(formData[i]['value'],",");
		                } else {
		                	object[formData[i]['name']] = formData[i]['value'];
		                }
					 }
					
					var sendData = JSON.stringify(object);
					$.ajax({
				     	url :"/mngProject/bill/detail/writeBillReqeust.do",
				     	dataType: 'json', 
					    type:"POST",  
					    data: sendData,
					   // async:false, 
					 	contentType: "application/json; charset=UTF-8", 
					 	beforeSend: function() {
					 		parent.$(".wrap-loading").removeClass("dpNone");
					 	}
					 	, complete: function() {
					 		parent.$(".wrap-loading").addClass("dpNone");
					 	}
				     	, success:function(data){	
				     		if(data.successYN == "Y" && mode == "req") {
				     			alert("계산서 발행 요청이 완료되었습니다.");
				     		} else if(data.successYN == "N" && mode == "req") {
				     			alert("계산서 발행 요청이 실패하였습니다.");
				     		} else if(data.successYN == "Y" && mode == "mod") {
				     			alert("계산서 정보가 수정되었습니다.");
				     		} else {
				     			alert("계산서 정보 수정이 실패하였습니다.");
				     		}
				     		
				     		fnReload();
				         },
				     	error: function(request, status, error) {
				     		if(request.status != '0') {
				     			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
				     		}
				     	} 
					});    
				}
			}  else {
				//Validate Form
				$("#frm_reqForm")[0].reportValidity();   
			}
			
		 }
		 
		 
		function fnBillComplate() {
			
			if ($("#frm_reqForm")[0].checkValidity()) {
				if(confirm("계산서 발행을 승인하시겠습니까?")) {
					var billInfo = $("#frm_reqForm").serializeArray();
					 
		
					for(var i = 0; i < billInfo.length; i++) {
						 
						 //발행예정일
						 if('billRequestDt' == billInfo[i]['name'] || 'billIssueDt' == billInfo[i]['name']){
							 billInfo[i]['value'] = removeData(billInfo[i]['value'], '-');
						 }
						 
						 //금액
						 if('billAmount' == billInfo[i]['name']){
							 billInfo[i]['value'] = removeCommas(billInfo[i]['value']);
						 }
						
					 }
					 
					 
					$.ajax ({
				        	url :"/mngProject/bill/detail/writeBillComplate.do",
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
						 		if(data.successYN == 'Y') {
						 			alert("계산서 발행이 완료되었습니다.");	
						 		} else {
						 			alert("계산서 발행이 실패하였습니다.");
						 		}
				        		fnReload();
				            },
				        	error: function(request, status, error) {
				        		if(request.status != '0') {
				        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
				        		}
				        	} 
					});  
				}
			 } else {
                $("#frm_reqForm")[0].reportValidity();   
            }         
			
		 }
		 
		 function fnCancelBillComplete() {
 			if(confirm("계산서 발행을 취소하시겠습니까?")) {
				 var billInfo = $("#frm_reqForm").serializeArray();
	
				 for(var i = 0; i < billInfo.length; i++) {
					 
					 //발행예정일
					 if('billRequestDt' == billInfo[i]['name'] || 'billIssueDt' == billInfo[i]['name']){
						 billInfo[i]['value'] = removeData(billInfo[i]['value'], '-');
					 }
					 
					 //금액
					 if('billAmount' == billInfo[i]['name']){
						 billInfo[i]['value'] = removeCommas(billInfo[i]['value']);
					 }
					
				 }
				 
				 $.ajax({
		        	url :"/mngProject/bill/detail/deleteBillComplete.do",
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
				 		if(data.successYN == 'Y') {
				 			alert("계산서 발행이 취소되었습니다.");	
				 		} else {
				 			alert("계산서 발행 취소를 실패하였습니다.");	
				 		}
		        		
		        		fnReload();
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
			    });  
 			}
		 }
		 
		 function fnReload() {
			$("#billAmount").val(removeCommas($("#billAmount").val()));
			 
			 form = document.reqForm;
			 form.action = "<c:url value='/mngProject/bill/detail/billForm.do'/>";
			 form.submit();
		 }
		 
		 function fnMovePreBillList() {
			
			$("#billAmount").val(removeCommas($("#billAmount").val()));
			
			form = document.reqForm;
			form.action = "<c:url value='/mngProject/bill/detail/preBillList.do'/>";
			form.submit();

		 }
		 
		 function fnBillInsert() {
			 
			 var billInfo = $("#frm_reqForm").serializeArray();
			 
			 for(var i = 0; i < billInfo.length; i++)
			 {
				 //부가세 정보
				 /* if('billTaxYn' == billInfo[i]['name']){
					 
					 if('on' == billInfo[i]['value'])
						 billInfo[i]['value'] = 'Y';
					 else
						 billInfo[i]['value'] = 'N';
				 } */
				 
				 //발행예정일
				 if('billRequestDt' == billInfo[i]['name']){
					 billInfo[i]['value'] = removeData(billInfo[i]['value'], '-');
				 }
				 
				 //금액
				 if('billAmount' == billInfo[i]['name']){
					 billInfo[i]['value'] = removeCommas(billInfo[i]['value']);
				 }
				 
			 }
			 
			 $.ajax({
		        	url :"/mngProject/bill/detail/writeBillInsert.do",
		        	type:"POST",  
		            data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		alert("계산서 등록이 완료되었습니다.")
		        		
		        		fnReload();
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    });  
		 }
		 
		 function fnUpdateContract() {
			 var url='/project/write/contractInfo.do';
 			var dialogId = 'program_layer';
 			var varParam = {
					"pjKey":$("#ipt_pjKey").val()
 			}
 			var button = new Array;
 			button = [];
 			parent.showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
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
				<li><a id="A_TOPMenu_PRE" onclick="javascript:fnMovePreBillList();" title="/mngProject/bill/detail/preBillList.do">기존 계산서 정보</a></li>
				<li><a class="on" id="A_TOPMenu_FORM" title="/mngProject/bill/detail/billForm.do">계산서 요청 정보</a></li>
				<li></li>
			</ul>
		</div>
		<div class="floatC">
		
			<input type="hidden" id="ipt_pjKey"            name="pjKey"           value="${billInfo.pjKey}" />
			<%-- <input type="hidden" id="ipt_acKey"            name="acKey"           value="${acKey}" /> --%>
			<input type="hidden" id="ipt_pjNm"			  name="pjNm"	 />
			<input type="hidden" id="billCallKey" name="billCallKey" value="${billInfo.billCallKey}" />
			<input type="hidden" id="salesKey" name="salesKey" 
				<c:choose>
					<c:when test="${billInfo.billCtFkKey eq null }">
					value="${billInfo.salesKey }"
					</c:when>
					<c:otherwise>
					value="${billInfo.billCtFkKey }"
					</c:otherwise>
				</c:choose>
			
			 />
			
			<table class="dtl">
				<tr>
					<td class="backgroundpurple">상태</td>
					<td>
						<c:choose>
							<c:when test="${billInfo.billIssueStatus eq null }">
								대기(요청 전)
							</c:when>
							<c:when test="${billInfo.billIssueStatus eq 'M' }">
								매핑
							</c:when>
							<c:when test="${billInfo.billIssueStatus eq 'R'}">
								요청
							</c:when>
							<c:when test="${billInfo.billIssueStatus eq 'I'}">
								승인
							</c:when>
							<c:when test="${billInfo.billIssueStatus eq 'E'}">
								수금
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple">회차</td>
					<td>
						<select id="slt_billTurnNo" name="billTurnNo" style="width:120px;">
							<c:forEach var="i" begin="1" end="${collectTurn}" step="1">
								<option value="${i}" <c:if test='${billInfo.billTurnNo == i}'>selected</c:if>>
									<c:out value="${i}" />회차
								</option>
							</c:forEach>
						</select> 
						&nbsp
						<select id="slt_billIssueType" name="billIssueType" style="width:120px;" >
							<option value="Y" selected>정발행</option>
							<option value="N" <c:if test='${billInfo.billIssueType == "N"}'>selected </c:if>>역발행</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple"><label>*</label>금액</td>
					<td onclick="javascript:fnUpdateContract();">
						<input type="text" id="billAmount" name="billAmount" value="${displayUtil.commaStr(billInfo.billAmount) }" required amountonly readonly/>
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple"><label>*</label>매출거래처</td>	
					<td>
						<input type="text" class="search" name="billAcNm" id="acNm" value="<c:out value="${billInfo.billAcNm}"/>" required autocomplete="off" />	
						<input type="hidden" name="billAcKey" id="billAcKey" value="<c:out value="${billInfo.billAcKey}"/>" required />
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple">매출처 담당자</td>	
					<td><input type="text" id="billAcDirectorName" name="billAcDirectorName" value="${billInfo.billAcDirectorName }" /></td>
				</tr>
				<tr>
					<td class="backgroundpurple">매출처 연락처</td>	
					<td>
						<input type="text" id="ipt_billAcDirectorTel" name="billAcDirectorTel" value="<c:out value="${billInfo.billAcDirectorTel}"/>"/>
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple"><label>*</label>발행이메일</td>	
					<td>
						<input type="text" id="ipt_billIssueEmail" name="billIssueEmail" value="<c:out value="${billInfo.billIssueEmail}"/>" required />
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple"><label>*</label>발행요청일</td>	
					<td>
						<input type="text" id="ipt_billRequestDt" name="billRequestDt" class="calendar" value="<c:out value="${displayUtil.displayDate(billInfo.billRequestDt)}"/>" required />
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple">요청사항</td>
					<td><textarea id="txt_remark" name="remark"><c:out value="${billInfo.remark}"/></textarea></td>
				</tr>
				
				<%-- <tr>
					<td class="backgroundgray">계산서번호</td>	
					<td>
						<c:if test="${billInfo.billNo eq null and billInfo.billIssueStatus eq 'R'}">
							<button type="button" class="btnComp" onclick="javascript:fnViewBillInsert('${billInfo.billCtFkKey }');">
								<img src="<c:url value='/images/btn_mapping_bill.png'/>" />
							</button>
						</c:if>
						<c:if test="${billInfo.billNo ne null}">
							<c:out value="${billInfo.billNo}"/>
						</c:if>
					</td>
				</tr> --%>
				<tr>
					<td class="backgroundgray"><% if (session.getAttribute("empAuthCd").equals("EMAU1001")) {%><label>*</label><%} %>발행일자</td>	
					<td>
						<%
							if (session.getAttribute("empAuthCd").equals("EMAU1001")) {
						%>
						<input type="text" id="ipt_billIssueDt" name="billIssueDt" class="calendar" value="<c:out value="${displayUtil.displayDate(billInfo.billIssueDt)}"/>" required />
						<% } else { %>
						<c:out value="${displayUtil.displayDate(billInfo.billIssueDt)}"/>
						<% } %>
					</td>
				</tr>
			</table>
			
		</div>
		<div class="btnWrap rt">
			<div class="floatR">
				<!-- 	 
				<button type="button" id="req"   value="계산서 발행 요청" onclick="javascript:fnBillInsert();" style="" >계산서등록임시</button>
				 -->
				 <c:choose>
					<c:when test="${billInfo.billIssueStatus eq null }">
						<%
							if (!session.getAttribute("empAuthCd").equals("EMAU1001")) {
						%>
						<button type="button" id="req"   value="계산서 발행 요청" onclick="javascript:fnBillRequest('req');" style="" ><img class="cursorP" src="<c:url value='/images/btn_bill_request.png'/>" style=""/></button>
						<% } %>
					</c:when>
					<c:when test="${billInfo.billIssueStatus eq 'M' }">
						<%
							if (session.getAttribute("empAuthCd").equals("EMAU1001")) {
						%>
						<button type="button" id="check" value="발행완료"      onclick="javascript:fnBillComplate();" style="" ><img class="cursorP" src="<c:url value='/images/btn_bill_end.png'/>"     style=""/></button>
						<% } %>
						<button type="button" id="req" value="수정"      onclick="javascript:fnBillRequest('mod');" style="" ><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>"     style=""/></button>
					</c:when>
					<c:when test="${billInfo.billIssueStatus eq 'R'}">
						<%
							if (session.getAttribute("empAuthCd").equals("EMAU1001")) {
						%>
						<button type="button" id="check" value="발행완료"      onclick="javascript:fnBillComplate();" style="" ><img class="cursorP" src="<c:url value='/images/btn_bill_end.png'/>"     style=""/></button>
						<% } %>
						<button type="button" id="req" value="수정"      onclick="javascript:fnBillRequest('mod');" style="" ><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>"     style=""/></button>
					</c:when>
					<c:when test="${billInfo.billIssueStatus eq 'I'}">
						<%
							if (session.getAttribute("empAuthCd").equals("EMAU1001")) {
						%>
						<button type="button" id="check" value="발행취소"      onclick="javascript:fnCancelBillComplete();" style="" ><img class="cursorP" src="<c:url value='/images/btn_cancel_bill.png'/>"     style=""/></button>
						<% } %>
					</c:when>
				</c:choose>
			</div>
		</div>
	</form> 
</body>
</html>