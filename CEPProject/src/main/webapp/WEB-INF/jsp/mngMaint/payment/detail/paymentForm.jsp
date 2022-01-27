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
		.bottom > div {
			margin-top: 20px;
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
		.dtl tbody tr:nth-child(6) {
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
		    height: 32px;
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
			height: 279px;
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
		input[class="pname"] {
			
			border : none;
			outline: none;
			padding : 0px;
			
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
	</style>
	<script>
		var payNoList = new Array();
		var amount = new Array();
		
		$(document).ready(function() {
			/* $('#infoList').find('li').bind('click',function () {
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
			}); */
			$("#slt_paymentTurn").on("change", function(){
				//changeParantIframUrl();
				
				/* form = document.reqForm;
				form.action = "<c:url value='/mngMaint/bill/detail/billForm.do'/>";
				form.submit();  */
				window.parent.document.getElementById("m_iframGubun").value="detail";
     			window.parent.document.getElementById("m_proceedTurn").value=$('#slt_paymentTurn').val();
				//window.parent.document.getElementById("m_paymentKey").value=$('#m0_paymentKey').val();
     			
     			window.parent.changeIframeUrl();
			});
		});
		/*
		지급요청 상태 변경
		PYST2000 : 지급확인 취소
		PYST3000
		  - PYST2000 ==> PYST3000: 지급확인 처리.
		  - PYST4000 ==> PYST3000: 지급완료 취소 처리.
		PYST4000 : 지급완료 처리.
		*/
		function fn_updateStatus(currentStatus, requestStatus) {
			  
			var parentReloadYN ="N";
			var title ="";
			var processGubun = "";
			/* if(stautsGubun=="Y") {
				processGubun="확인";
			} else if(stautsGubun=="N") {
				processGubun="취소";
			} */
			if(currentStatus>requestStatus) {
				processGubun="취소";
			} else {
				processGubun="확인";
			}
			
			if(requestStatus == "R") {
				title = "매입금 지급확인에 대한 "+processGubun;
			} else if(requestStatus == "C") {
				if(currentStatus<requestStatus) {
					title = "매입금 지급확인에 대한 "+processGubun;
				} else {
					title = "매입금 지급완료에 대한 "+processGubun;
					//지급액, 미지급액 변동으로 부모창 새로고침 필요
					parentReloadYN="Y";
				}				
			} else if(requestStatus == "E") {
				title = "매입금  지급완료에 대한 "+processGubun;
				//지급액, 미지급액 변동으로 부모창 새로고침 필요
				parentReloadYN="Y";
			}
			

			if(confirm(title+" 처리하시겠습니까?")) {
				var object = {};
	           	var formData = $("#paymentReqForm").serializeArray();
	           	for (var i = 0; i<formData.length; i++){
	                
	           		if("paymentCallDt" == formData[i]['name']) {
	                	//날짜 - 제거
	                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
	                } else if("callAmount" == formData[i]['name']){
	                	//컴마제거
	                	object[formData[i]['name']] = removeData(formData[i]['value'], ",");
	                } else {
	                	object[formData[i]['name']] = formData[i]['value'];
	                }      
	            }
	           	object['currentStatus'] = currentStatus;
	           	object['requestStatus'] = requestStatus;
	           	var sendData = JSON.stringify(object);
	           	//console.log("sendData======>"+sendData);
	           	 $.ajax({
		        	url:"/mngMaint/payment/detail/updatePaymentRequestStatus.do",
		            dataType: 'text', 
		            type:"post",  
		            data: sendData,
		            
		     	   	contentType: "application/json; charset=UTF-8", 
		     	  	beforeSend: function(xhr) {
		        		xhr.setRequestHeader("AJAX", true);
		        		
		        	},
		            success:function(data){	

		            	var paramData = JSON.parse(data);
		            	
		            	if("Y" == paramData.successYN){
		            		
		            		var varParam = JSON.parse(data);
		            		
		            		alert(title+" 성공하였습니다.");
		            		
		            		if(parentReloadYN=="Y") {
		            			//window.parent.location.reload();
		            			window.parent.document.getElementById("m_iframGubun").value="detail";
		            			//window.parent.document.getElementById("m_paymentKey").value=$('#m0_paymentKey').val();
		            			window.parent.document.getElementById("m_proceedTurn").value=$('#slt_paymentTurn').val();
		            			window.parent.changeIframeUrl();
		            		} else {
		            			/* var url = '/mngMaint/payment/detail/paymentForm.do';
				    			var dialogId = 'program_layer';
				    			
				    			var button = new Array;
				    			button = [];
				    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');    */       
				    				            		
				    			form = document.paymentReqForm;
				    			form.action = "/mngMaint/payment/detail/paymentForm.do";
				    			form.submit(); 
		            		}
		            		
		            		
		            		
			            	
		            		
		            	} else {
		            		alert(title+" 실패하였습니다.");
		            		
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
		
		//지급정보 삭제.
		function fn_deleteBtn(){
			if(confirm("유지보수 매입금 지급요청을 삭제하시겠습니까?")) {
				var object = {};
	           	var formData = $("#paymentReqForm").serializeArray();
	           	for (var i = 0; i<formData.length; i++){
	                
	           		if("paymentCallDt" == formData[i]['name']) {
	                	//날짜 - 제거
	                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
	                } else if("callAmount" == formData[i]['name']){
	                	//컴마제거
	                	object[formData[i]['name']] = removeData(formData[i]['value'], ",");
	                } else {
	                	object[formData[i]['name']] = formData[i]['value'];
	                }      
	            }
	           	var sendData = JSON.stringify(object);
	           	//console.log("sendData======>"+sendData);
	           	 $.ajax({
		        	url:"/mngMaint/payment/detail/deletePaymentRequestInfo.do",
		            dataType: 'text', 
		            type:"post",  
		            data: sendData,
		            
		     	   	contentType: "application/json; charset=UTF-8", 
		     	  	beforeSend: function(xhr) {
		        		xhr.setRequestHeader("AJAX", true);
		        		
		        	},
		            success:function(data){	

		            	var paramData = JSON.parse(data);
		            	
		            	if("Y" == paramData.successYN){
		            		
		            		var varParam = JSON.parse(data);
		            		
		            		alert("유지보수 매입금 지급요청 삭제를 성공하였습니다.");
		            		
			            	/* var url = '/mngMaint/payment/detail/paymentForm.do';
			    			var dialogId = 'program_layer';
			    			
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');    */       
			    				            		
			    			/* form = document.paymentReqForm;
			    			form.action = "/mngMaint/payment/detail/prePaymentList.do";
			    			form.submit(); */ 
			    			
		            		window.parent.document.getElementById("m_iframGubun").value="list";	            			
		            		window.parent.changeIframeUrl();
		            		
		            	} else {
		            		alert("유지보수 매입금 지급요청 삭제를 실패하였습니다.");
		            		
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

		/* function fn_saveBtn(){
			window.parent.aaaa();
			window.parent.document.getElementById("m_iframGubun").value="detail";
			alert("1111===>"+window.parent.document.getElementById("m_iframGubun").value);
			window.parent.aaaa();
		} */
		//지급정보 등록 OR 수정.
		function fn_saveBtn(){
			//alert("upFileName====>"+$('#upFileName').val());
			//필수값 체크를 완료하면 저장 프로세스 시작.
			if ($("#paymentReqForm")[0].checkValidity()){
				if($('#billFkKey').val() !=''){
					if($('#m0_paymentKey').val() !=''){
						if(confirm("유지보수 매입금 지급요청을 수정하시겠습니까?")) {
							savePaymentReqInfo();
						}
					} else {
						if(confirm("유지보수 매입금 지급요청을 등록하시겠습니까?")) {
							savePaymentReqInfo();
						}
					}
				} else {
					alert("저장하기전 세금계산서 정보를 맵핑해주세요!!");
				}
				
				
			}  else {
				 //Validate Form
		        $("#paymentReqForm")[0].reportValidity();	
			}
		}
		/*
		*내용을 저장한다.
		*/
		
		
		function savePaymentReqInfo(){		
			
           	var object = {};
           	var formData = $("#paymentReqForm").serializeArray();
           	for (var i = 0; i<formData.length; i++){
                
           		if("paymentCallDt" == formData[i]['name']) {
                	//날짜 - 제거
                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
                } else if("callAmount" == formData[i]['name']){
                	//컴마제거
                	object[formData[i]['name']] = removeData(formData[i]['value'], ",");
                } else {
                	object[formData[i]['name']] = formData[i]['value'];
                }      
            }
           	var sendData = JSON.stringify(object);
           	//console.log("sendData======>"+sendData);
           	 $.ajax({
	        	url:"/mngMaint/payment/detail/writePaymentRequestInfo.do",
	            dataType: 'text', 
	            type:"post",  
	            data: sendData,
	            
	     	   	contentType: "application/json; charset=UTF-8", 
	     	  	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);
	        		
	        	},
	            success:function(data){	

	            	var paramData = JSON.parse(data);
	            	
	            	if("Y" == paramData.successYN){
	            		
	            		var varParam = JSON.parse(data);
	            		
	            		//업로드 파일을 선택하지 않은 경우
            			if($('#m0_paymentKey').val() !=''){
	            			alert("유지보수 매입금 지급요청 수정을 성공하였습니다.");
	            			/*
	            			form = document.paymentReqForm;
			    			form.action = "/mngMaint/payment/detail/paymentForm.do";
			    			form.submit(); 
			    			*/
	            			window.parent.document.getElementById("m_iframGubun").value="detail";
	             			window.parent.document.getElementById("m_proceedTurn").value=$('#slt_paymentTurn').val();
	             			
	             			window.parent.changeIframeUrl();
	            		} else {
	            			alert("유지보수 매입금 지급요청 등록을 성공하였습니다.");
	            			// 관리키를 셋팅한다.
	            			$('#m0_paymentKey').val(paramData.paymentKey)
	            			
	            			window.parent.document.getElementById("m_iframGubun").value="detail";
	            			//window.parent.document.getElementById("m_paymentKey").value=paramData.paymentKey;
	            			window.parent.document.getElementById("m_proceedTurn").value=$('#slt_paymentTurn').val();
	            			
	            			window.parent.changeIframeUrl();
	            			
	            		}
            			

		            	/* var url = '/mngMaint/payment/detail/paymentForm.do';
		    			var dialogId = 'program_layer';
		    			
		    			var button = new Array;
		    			button = [];
		    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');    */       
		    				            		
		    			
	            		
	            	} else {
	            		if($('#m0_paymentKey').val() !=''){
	            			alert("유지보수 매입금 지급요청 수정을 실패하였습니다.");
	            		} else {
	            			alert("유지보수 매입금 지급요청 등록을 실패하였습니다.");
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
		
		
		
		//세금계산서 매핑정보조회.
		function fn_mappingBill() {
			var nWidth = "980";
	        var nHeight = "450";
			var curX = window.screenLeft;
			var curY = window.screenTop;
			var curWidth = document.body.clientWidth;
			var curHeight = document.body.clientHeight;
			
			var nLeft = curX + (curWidth/2)-(nWidth/2)+900;
			var nTop = curY + (curHeight/2)-(nHeight/2 -91); 
			var strOption = "";
			strOption += "left=" + nLeft + "px,";
			strOption += "left=" + nLeft + "px,";
			strOption += "top=" + nTop + "px,";
			strOption += "width=" + nWidth + "px,";
			strOption += "height=" + nHeight + "px,";
			strOption += "toolbar=no,menubar=no,location=no,";
			strOption += "resizable=yes,status=yes";
			
			//var url = "/mngMaint/payment/popup/popBillMappingList.do?returnType=O&billAcKey=${paymentRequestInfo.paymentAcFkKey}&returnBillNo=billFkKey&returnAmount=callAmount";
			var url = "/mngMaint/payment/popup/popBillMappingList.do?returnType=F&billAcKey=${paymentRequestInfo.paymentAcFkKey}&returnFunctionNm=mtMappingBill";
            var name = "BILL_MAPPING_LIST";
            //var option = "width = 980, height = 400, top = 235, left = 300, location = no"
            window.open(url, name, strOption);
			//window.open('/mngMaint/payment/popup/popBillMappingList.do?returnType=O&billAcKey=${billAcKey}&returnBillNo=billFkKey&returnAmount=callAmount','BILL_MAPPING_LIST','width=980,height=400,left=300,top=235');
		}
		
		function mtMappingBill(billNo,billAmount) {
			//console.log("billNo====>"+billNo+", billAmount====>"+billAmount+", billAmount====>"+removeData(billAmount, ",")+", billAmount====>"+(removeData(billAmount, ",")*1+removeData(billAmount, ",")*1));
			//console.log("mtOrderAmount====>"+$('#m0_mtOrderAmount').val()+", m0_callTotalAmount====>"+$('#m0_callTotalAmount').val()+"=======>"+($('#m0_mtOrderAmount').val()-$('#m0_callTotalAmount').val()));
			var remainRequestAmount = ($('#m0_mtOrderAmount').val()-$('#m0_callTotalAmount').val())*1;
			var requestAmount = removeData(billAmount, ",")*1;
			//alert(remainRequestAmount+"/"+requestAmount);
			if(remainRequestAmount <requestAmount){
				//요청금액이 남은 요청금액보다 큰경우 경고
				alert("선택한 세금계산서 금액이 전체 지급총액을 초과하여 해당 세금서는 맵핑할수 없습니다.\n - 현재 총 요청금액      : "+addCommas($('#m0_callTotalAmount').val())+"\n - 요청 가능 맵핑금액   : "+addCommas(remainRequestAmount)+"\n - 맵핑 세금계산서금액 : "+billAmount+"\n 확인 후 다시 맵핑하세요 !!");
			} else {
				//요청금액이 남은 요청금액보다 작은 경우 맵핑
				$('#billFkKey').val(billNo);
				$('#callAmount').val(billAmount);
			}
			
			
		}
		
		function fn_mappingBill_modal() {
			var url = '/mngMaint/payment/popup/popBillMappingList.do';
			var dialogId = 'program_layer2';
			var varParam = {
				"billAcKey":$('#m0_billAcKey').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:980px;height:400px;background-color: #f6f7fc;'); 
		}
		
		//세금계산서 정보조회.
		function fn_showBillInfo(billKey) {
			var url = '/project/request/purchase/viewBillInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"billNo":billKey
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:657px;height:373px;reload:false'); 
		}
		//지급정보 목록이동
		function fnMovePaymentList() {			
			form = document.paymentReqForm;
			form.action = "/mngMaint/payment/detail/prePaymentList.do";
			form.submit(); 
		}
		//지급정보 등록화면 이동.
		function fnMovePaymentForm() {			
			form = document.paymentReqForm;
			form.action = "/mngMaint/payment/detail/paymentForm.do";
			form.submit(); 
		}
	</script>
</head>
<body>
	<form id="checkForm" name="checkForm" method="post">
			<input type="hidden" id="m0_mtOrderAmount" name="mtOrderAmount" value="<c:out value="${orderAmountInfo.mtOrderAmount}"/>"/>
			<input type="hidden" id="m0_yetPaymentAmount" name="yetPaymentAmount" value="<c:out value="${orderAmountInfo.yetPaymentAmount}"/>"/>
			<input type="hidden" id="m0_donePaymentAmount" name="donePaymentAmount" value="<c:out value="${orderAmountInfo.donePaymentAmount}"/>"/>
			<input type="hidden" id="m0_callTotalAmount" name="callTotalAmount" value="<c:out value="${orderAmountInfo.callTotalAmount}"/>"/>
	</form>
	<div class="stitle">
		<ul id="infoList">
			<li><a id="A_TOPMenu_PAY" onclick="javascript:fnMovePaymentList();">지급요청목록</a></li>
			<li><a id="A_TOPMenu_FORM" class="on" onclick="javascript:fnMovePaymentForm();">지급정보</a></li>
			<li></li>
		</ul>
	</div>

	<div class="floatC">
		<form id="paymentReqForm" name="paymentReqForm" method="post">
			<input type="hidden" id="m0_mtOrderType" name="mtOrderType" value="<c:out value="${paymentRequestInfo.mtOrderType}"/>"/>
			<input type="hidden" id="m0_mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${paymentRequestInfo.mtIntegrateKey}"/>"/>
			<input type="hidden" id="m0_mtWorkKey" name="mtWorkKey" value="<c:out value="${paymentRequestInfo.mtWorkKey}"/>"/>		
			<input type="hidden" id="m0_mtOrderKey" name="mtOrderKey" value="<c:out value="${paymentRequestInfo.paymentBuyFkKey}"/>"/>	
			<input type="hidden" id="m0_paymentDtFkKey" name="paymentDtFkKey" value="<c:out value="${paymentRequestInfo.paymentDtFkKey}"/>"/>	
			<input type="hidden" id="m0_billAcKey" name="billAcKey" value="<c:out value="${paymentRequestInfo.paymentAcFkKey}"/>"/>	
			<input type="hidden" id="m0_paymentBuyFkKey" name="paymentBuyFkKey" value="<c:out value="${paymentRequestInfo.paymentBuyFkKey}"/>"/>	
			<input type="hidden" id="m0_paymentAcFkKey" name="paymentAcFkKey" value="<c:out value="${paymentRequestInfo.paymentAcFkKey}"/>"/>
			<input type="hidden" id="m0_paymentKey" name="paymentKey" value="<c:out value="${paymentRequestInfo.paymentKey}"/>"/>	
			<input type="hidden" id="m0_totalTurn" name="totalTurn" value="${totalTurn}" />
			<input type="hidden" id="m0_proceedTurn" name="proceedTurn" value="${proceedTurn}" />
			<input type="hidden" id="m0_proceedTurn" name="paymentStatusCd" value="R" />
			<input type="hidden" id="m0_paymentYearMonth" name="paymentYearMonth" value="<c:out value="${paymentRequestInfo.paymentYearMonth}"/>"/>	
			<div class="pmWrap">
				<table class="dtl" id="info0">
					<tr>
						<td class="backgroundpurple"><label>*</label>회차</td>
						<td>
							<select id="slt_paymentTurn" name="paymentTurn" style="width:120px;" required>
								<c:forEach var="i" begin="1" end="${totalTurn}" step="1">
									<option value="${i}" <c:if test='${paymentRequestInfo.paymentTurn == i}'>selected</c:if>>
										<c:out value="${i}" />회차
									</option>
								</c:forEach>
							</select> 
							
						</td>
					</tr>
					<tr>
						<td><label>*</label>계산서정보</td>
						<td>
							<input type="text" id="billFkKey" name="billFkKey" value="${paymentRequestInfo.billFkKey }" readOnly required/>
							<c:choose>
								<c:when test="${paymentRequestInfo.billFkKey eq null }">
									<button type="button" onclick="fn_mappingBill('${paymentRequestInfo.paymentKey}');" style="vertical-align: middle;"><img src="<c:url value='/images/btn_mapping_bill.png'/>" /></button>
								</c:when>
								<c:otherwise>
									<button type="button" onclick="fn_showBillInfo('${paymentRequestInfo.billFkKey}');" style="vertical-align: middle;"><img src="<c:url value='/images/btn_view.png'/>" /></button>
								</c:otherwise>
							</c:choose>
							
						</td>
					</tr>
					<tr>
						<td><label>*</label>금액</td>
						<td>
							<input type="text" name="callAmount" id="callAmount" value="<c:out value="${displayUtil.commaStr(paymentRequestInfo.callAmount)}"/>" class="pname" readonly required />
							
						</td>
					</tr>
					<tr>
						<td><label>*</label>요청지급일</td>	
						<td>
							<input type="text"  class="calendar" id="paymentCallDt"  name="paymentCallDt" value="<c:out value="${displayUtil.displayDate(paymentRequestInfo.paymentCallDt)}"/>" autocomplete="off" required/>
						</td>
					</tr>
					<tr>
						<td><label>*</label>지급계좌</td>
						<td>
							<select name="paymentAccSeqFkKey" id="paymentAccSeqFkKey" required>
								<c:forEach var="dresult" items="${depositList}" varStatus="status">
									<option <c:if test="${paymentRequestInfo.paymentAccSeqFkKey == dresult.acAdSeq }">selected</c:if> value="${dresult.acAdSeq }"><c:out value="${dresult.acBkno}" /> / <c:out value="${dresult.acBankNm}" /> / <c:out value="${dresult.acAcholder}" /></option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;요청상태</td>	
						<td>
							<c:choose>
								<c:when test="${paymentRequestInfo.paymentStatusCd eq 'W'}">
									<input type="text"  id="paymentStatusCdNm"  name="paymentStatusCdNm" value="요청대기" class="pname" readOnly/>									
								</c:when>
								<c:when test="${paymentRequestInfo.paymentStatusCd eq 'M'}">
									<input type="text"  id="paymentStatusCdNm"  name="paymentStatusCdNm" value="계산서매핑" class="pname" readOnly/>
								</c:when>
								<c:when test="${paymentRequestInfo.paymentStatusCd eq 'R'}">
									<input type="text"  id="paymentStatusCdNm"  name="paymentStatusCdNm" value="지급요청" class="pname" readOnly/>
								</c:when>
								<c:when test="${paymentRequestInfo.paymentStatusCd eq 'C'}">
									<input type="text"  id="paymentStatusCdNm"  name="paymentStatusCdNm" value="지급확인" class="pname" readOnly/>
								</c:when>
								<c:when test="${paymentRequestInfo.paymentStatusCd eq 'E'}">
									<input type="text"  id="paymentStatusCdNm"  name="paymentStatusCdNm" value="지급완료" class="pname" readOnly/>
								</c:when>
								<c:when test="${paymentRequestInfo.paymentStatusCd == null }">
									<input type="text"  id="paymentStatusCdNm"  name="paymentStatusCdNm" value="지급요청전" class="pname" readOnly/>
								</c:when>
								<c:otherwise>
									<input type="text"  id="paymentStatusCdNm"  name="pamentStatusCdNm" value="<c:out value="${paymentRequestInfo.paymentStatusCd}"/>" class="pname" readOnly/>
									
								</c:otherwise>
							</c:choose>
							
							
						</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;요청사항</td>
						<td><textarea name="remark" id="remark"><c:out value="${paymentRequestInfo.remark}"/></textarea></td>
					</tr>
				</table>
			</div>
			<div class="bottom">
				<div class="floatR">
					<c:if test='${paymentRequestInfo.paymentStatusCd eq null}'>
					<button type="button" title="매입금 지급요청 등록" onclick="fn_saveBtn()">
						<img class="cursorP" src="<c:url value='/images/btn_req_purchase.png'/>" />
					</button>
					</c:if>
					<c:if test='${paymentRequestInfo.paymentStatusCd == "R"}'><!--요청상태  -->
					<button type="button" title="매입금 지급요청 삭제" onclick="fn_deleteBtn()">
						<img class="cursorP" src="<c:url value='/images/btn_del.png'/>" />
					</button>
					<button type="button" title="매입금 지급요청 수정" onclick="fn_saveBtn()">
						<img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" />
					</button>
					<button type="button" title="매입금 지급요청확인" onclick="fn_updateStatus('${paymentRequestInfo.paymentStatusCd}', 'C')">
						<img class="cursorP" src="<c:url value='/images/btn_ack_pay.png'/>" />
					</button>
					</c:if>
					
					<c:if test='${paymentRequestInfo.paymentStatusCd == "C"}'><!--확인상태  -->
					<button type="button" title="매입금 지급요청 확인취소" class="rqPmInfo" onclick="fn_updateStatus('${paymentRequestInfo.paymentStatusCd}', 'R')">확인취소</button>
					<button type="button" title="매입금 지급요청 지급완료" class="rqPmInfo" onclick="fn_updateStatus('${paymentRequestInfo.paymentStatusCd}', 'E')">지급완료</button>
					
					</c:if>
					
					<c:if test='${paymentRequestInfo.paymentStatusCd == "E"}'><!--완료상태  -->
					<button type="button" title="매입금 지급요청 지급취소" class="rqPmInfo" onclick="fn_updateStatus('${paymentRequestInfo.paymentStatusCd}', 'C')">지급완료취소</button>					
					</c:if>
					
				</div>
			</div>
		</form>
	</div>
</body>
</html>