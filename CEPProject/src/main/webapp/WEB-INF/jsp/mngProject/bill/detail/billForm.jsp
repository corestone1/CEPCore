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
			height: 538px;
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
	</style>
	<script>
		
		$(document).ready(function() {
			
			$("#slt_billTurnNo").on("change", function(){
				
				form = document.reqForm;
				form.action = "<c:url value='/mngProject/bill/detail/billForm.do'/>";
				form.submit(); 
			});
			
		});
			
		/* 
		alert('${billInfo.billIssueType == "Y"}'
				+'\n'+
				'${billInfo.billIssueType == ""}' 
				+'\n'+
				'${billInfo.billIssueType == null}');
		
		alert('${billInfo.billIssueType == "Y" || billInfo.billIssueType == "" || billInfo.billIssueType == null}');
		 */
		 
		 
		 function fnBillRequest() {
			 
			 var billInfo = $("#frm_reqForm").serializeArray();
			 
			 console.log("========= billInfo =======\n" + billInfo);
			 
			 
			 for(var i = 0; i < billInfo.length; i++)
			 {
				 //부가세 정보
				 if('billTaxYn' == billInfo[i]['name']){
					 
					 if('on' == billInfo[i]['value'])
						 billInfo[i]['value'] = 'Y';
					 else
						 billInfo[i]['value'] = 'N';
				 }
				 
				 //발행예정일
				 if('billRequestDt' == billInfo[i]['name']){
					 billInfo[i]['value'] = removeData(billInfo[i]['value'], '-');
				 }
				 
				 //금액
				 if('billAmount' == billInfo[i]['name']){
					 billInfo[i]['value'] = removeCommas(billInfo[i]['value']);
				 }
				 
				
				 console.log(i+" : " + billInfo[i]['name'] + " : " + billInfo[i]['value']);
			 }
			 
			 
			 $.ajax({
		        	url :"/mngProject/bill/detail/writeBillReqeust.do",
		        	type:"POST",  
		        	data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            //data: JSON.stringify(object),
		     	    //contentType: "application/json; charset=UTF-8",
		     	    
		     	    dataType: 'text',
		            async : false,
		        	success:function(data){		  
		        		alert("계산서 발행 요청이 완료되었습니다.!")
		        		fnReload();
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    });  
		 }
		 
		 
		 function fnBillComplate() {
 			
			 var billInfo = $("#frm_reqForm").serializeArray();
			 

			 for(var i = 0; i < billInfo.length; i++)
			 {
				 //부가세 정보
				 if('billTaxYn' == billInfo[i]['name']){
					 
					 if('on' == billInfo[i]['value'])
						 billInfo[i]['value'] = 'Y';
					 else
						 billInfo[i]['value'] = 'N';
				 }
				 
				 //발행예정일
				 if('billRequestDt' == billInfo[i]['name']){
					 billInfo[i]['value'] = removeData(billInfo[i]['value'], '-');
				 }
				 
				 //금액
				 if('billAmount' == billInfo[i]['name']){
					 billInfo[i]['value'] = removeCommas(billInfo[i]['value']);
				 }
				 
				
				 console.log(i+" : " + billInfo[i]['name'] + " : " + billInfo[i]['value']);
			 }
			 
			 console.log("========= billInfo =======\n" + billInfo);
			 
			 $.ajax({
		        	url :"/mngProject/bill/detail/writeBillComplate.do",
		        	type:"POST",  
		            data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		alert("계산서 발행 요청이 완료되었습니다.!")
		        		fnReload();
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    });  
		 }
		 
		 function fnReload() {
			 form = document.reqForm;
			 form.action = "<c:url value='/mngProject/bill/detail/billForm.do'/>";
			 form.submit();
		 }
		 
		 function fnMovePreBillList() {
			
			form = document.reqForm;
			form.action = "<c:url value='/mngProject/bill/detail/preBillList.do'/>";
			form.submit(); 
		 }
		 
		 function fnViewBillInsert() {
			 var url = '/mngProject/bill/popup/viewWriteSdBilling.do';
			 var dialogId = 'program_layer';
			 var varParam = {"pjKey" : $('#ipt_pjKey').val(), "billCallKey" : $('#ipt_billCallKey').val()};
			
			 var button = new Array;
			 button = [];
			 
			 
			 
			 /* showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:495px'); */ 
			 parent.showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:545px');
			
		 }
		 
		 function fnBillInsert() {
			 
			 var billInfo = $("#frm_reqForm").serializeArray();
			 
			 console.log("========= billInfo =======\n" + billInfo);
			 
			 for(var i = 0; i < billInfo.length; i++)
			 {
				 //부가세 정보
				 if('billTaxYn' == billInfo[i]['name']){
					 
					 if('on' == billInfo[i]['value'])
						 billInfo[i]['value'] = 'Y';
					 else
						 billInfo[i]['value'] = 'N';
				 }
				 
				 //발행예정일
				 if('billRequestDt' == billInfo[i]['name']){
					 billInfo[i]['value'] = removeData(billInfo[i]['value'], '-');
				 }
				 
				 //금액
				 if('billAmount' == billInfo[i]['name']){
					 billInfo[i]['value'] = removeCommas(billInfo[i]['value']);
				 }
				 
				 console.log(i+" : " + billInfo[i]['name'] + " : " + billInfo[i]['value']);
			 }
			 
			 $.ajax({
		        	url :"/mngProject/bill/detail/writeBillInsert.do",
		        	type:"POST",  
		            data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		alert("계산서 등록이 완료되었습니다.!")
		        		
		        		fnReload();
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
				<li><a class="on" id="A_TOPMenu_FORM" title="/mngProject/bill/detail/billForm.do">계산서 요청 정보</a></li>
				<li><a id="A_TOPMenu_PRE" onclick="javascript:fnMovePreBillList();" title="/mngProject/bill/detail/preBillList.do">기존 계산서 정보</a></li>
				<li></li>
			</ul>
		</div>
		<div class="floatC">
		
			<input type="hidden" id="ipt_pjKey"            name="pjKey"           value="${billInfo.pjKey}" />
			<input type="hidden" id="ipt_billCallKey"      name="billCallKey"     value="${billInfo.billCallKey}" />
			<input type="hidden" id="ipt_acKey"            name="acKey"           value="${acKey}" />
			<input type="hidden" id="ipt_billIssue_status" name="billIssueStatus" value="${billInfo.billIssueStatus}" />
			
			<table class="dtl">
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
					<td>
						<input type="text"     id="ipt_billAmount" name="billAmount" value="<c:out value="${displayUtil.commaStr(billInfo.billAmount)}"/>" />
						<input type="checkbox" id="ipt_billTaxYn"  name="billTaxYn" class="tCheck"  <c:if test="${billInfo.billTaxYn == 'Y'}">checked</c:if>/>
						<label for='ipt_billTaxYn' class='cursorP tclabel'></label>
						<span class="cbspan">부가세 포함</span>
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple"><label>*</label>고객담당자</td>	
					<td>
						<select id="ipt_billAcDirectorKey" name="billAcDirectorKey" style="width:120px;">
							<c:forEach var="directorList" items="${directorList}" varStatus="status">
								<option value='${directorList.acDirectorKey}' <c:if test="${billInfo.billAcDirectorKey == directorList.acDirectorKey}">selected </c:if>>
									<c:out value="${directorList.acDirectorNm}"/>
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple"><label>*</label>연락처</td>	
					<td>
						<input type="text" id="ipt_billAcDirectorTel" name="billAcDirectorTel" value="<c:out value="${billInfo.billAcDirectorTel}"/>"/>
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple"><label>*</label>발행이메일</td>	
					<td>
						<input type="text" id="ipt_billIssueEmail" name="billIssueEmail" value="<c:out value="${billInfo.billIssueEmail}"/>" />
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple"><label>*</label>발행일(예정일)</td>	
					<td>
						<input type="text" id="ipt_billRequestDt" name="billRequestDt" class="calendar" value="<c:out value="${displayUtil.displayDate(billInfo.billRequestDt)}"/>" />
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple">요청사항</td>
					<td><textarea id="txt_remark" name="remark"><c:out value="${billInfo.remark}"/></textarea></td>
				</tr>
				
				<tr>
					<td class="backgroundgray">계산서번호</td>	
					<td>
						<c:out value="${billInfo.billNo}"/>
					</td>
				</tr>
				<tr>
					<td class="backgroundgray">발행일자</td>	
					<td>
						<c:out value="${displayUtil.displayDate(billInfo.billIssueDt)}"/>
					</td>
				</tr>
					
			</table>
			
		</div>
		<div class="btnWrap rt">
			<div class="floatR">
				<!-- 	 
				<button type="button" id="req"   value="계산서 발행 요청" onclick="javascript:fnBillInsert();" style="" >계산서등록임시</button>
				 -->
				<button type="button" id="req"   value="계산서 XML등록" onclick="javascript:fnViewBillInsert();" style="" ><img class="cursorP" src="<c:url value='/images/btn_bill_xml.png'/>" style=""/></button>
				<button type="button" id="req"   value="계산서 발행 요청" onclick="javascript:fnBillRequest();" style="" ><img class="cursorP" src="<c:url value='/images/btn_bill_request.png'/>" style=""/></button>
				<button type="button" id="check" value="발행완료"      onclick="javascript:fnBillComplate();" style="" ><img class="cursorP" src="<c:url value='/images/btn_bill_end.png'/>"     style=""/></button>
			</div>
		</div>
	</form> 
</body>
</html>