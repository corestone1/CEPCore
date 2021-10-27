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
			bottom: 14px;
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
			height: 578px;
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
			height: 85px;
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
		/* 거래처 스크롤 위치지정 */
		#m_div_accountList {
			left: 187px;
    		margin-top: -7px;
		}
		/* 파랑버튼이미지  */
		.blueBtnStyle {
			width: 115px;
		    height: 26px;
		    background-color: #91a6f2;
		    color: #ffffff;
		    font-weight: bold;
		    border: 1px solid #91a6f2;
		    padding-bottom: 2px;
		    vertical-align: top;
		}
		/* 보라버튼이미지  */
		.purpleBtnStyle {
			width: 115px;
		    height: 26px;
		    background-color: #a392f2;
		    color: #ffffff;
		    font-weight: bold;
		    border: 1px solid #a392f2;
		    padding-bottom: 2px;
		    vertical-align: top;
		}
	</style>
	<script>
		
		$(document).ready(function() {
			
			$("#slt_billTurnNo").on("change", function(){
				//changeParantIframUrl();
				
				/* form = document.reqForm;
				form.action = "<c:url value='/mngMaint/bill/detail/billForm.do'/>";
				form.submit();  */
				window.parent.document.getElementById("m_iframGubun").value="detail";
     			window.parent.document.getElementById("m_billTurnNo").value=$('#slt_billTurnNo').val();
     			
     			window.parent.changeIframeUrl();
			});
			
			//거래처 검색
			$("#ipt_billAcNm").on("keydown", function(event){
				
				if(event.keyCode == 13) {		
					
					fnSearchAccoutList(this, $(this).val());
				}						
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
		 
		
		function changeParantIframUrl() {
			 alert($("#slt_billTurnNo").val());
			 //var turnNo = $("#slt_billTurnNo").val();
			 var newUrl = "/mngMaint/bill/detail/billForm.do?pjKey=${billInfo.pjKey}&acKey=${billInfo.billAcKey}&billTurnNo="+$("#slt_billTurnNo").val()+"&totalTurn=${collectTurn}";
			 //alert(newUrl);
			 parent.$("iframe").attr("src", newUrl);
			 //parent.changeIframUrl(newUrl);
			 
		 }
		/* 세금계산서 발행 취소 */
		function fnDeleteBillRequest() {
			if(confirm("계산서 요청 정보를 삭제하시겠습니까?")) {
				var billInfo = {
						'billCallKey':'${billInfo.billCallKey}'
						, 'billCtFkKey':'${billInfo.billCtFkKey}'
					
				}
				
				$.ajax({
		        	url :"/mngMaint/bill/detail/deleteBillReqeust.do",
		        	type:"POST",  
		        	data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            //data: JSON.stringify(object),
		     	    //contentType: "application/json; charset=UTF-8",
		     	    
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		if(data.successYN=='Y') {
		        			
		        					
		        			alert("계산서 삭제 요청이 완료되었습니다.!")
		        			
		        			/* 화면 새로고침. */
		        			document.reqForm.action = "<c:url value='/mngMaint/bill/detail/billForm.do'/>";
		        			document.reqForm.submit(); 
		        		} else {
	   						alert("계산서 삭제 요청이 실패하였습니다.")
	   					}
		        		
		        		//fnReload();
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    	});  
			}

		}
		
		
		/* 세금계산서 발행요청  */ 
		function fnBillRequest() {
			if ($("#frm_reqForm")[0].checkValidity()){
				if(confirm("계산서 요청 정보를 저장하시겠습니까?")) {
					fn_saveBtn();		
					
				}
			} else {
				 //Validate Form
				$("#frm_reqForm")[0].reportValidity();
			}
		 }
		 
		 function fn_saveBtn() {
			 
			 var billInfo = $("#frm_reqForm").serializeArray();			 
			 //console.log("========= billInfo =======\n" + billInfo);			 
			 for(var i = 0; i < billInfo.length; i++) {
				 //부가세 정보
				/*  if('billTaxYn' == billInfo[i]['name']){
					 
					 if('on' == billInfo[i]['value'])
						 billInfo[i]['value'] = 'Y';
					 else
						 billInfo[i]['value'] = 'N';
				 } */
				 
				 //발행예정일
				 if('billRequestDt' == billInfo[i]['name']) {
					 billInfo[i]['value'] = removeData(billInfo[i]['value'], '-');
				 }
				 
				 //금액
				 if('billAmount' == billInfo[i]['name']) {
					 billInfo[i]['value'] = removeCommas(billInfo[i]['value']);
				 }
				 
				
				 console.log(i+" : " + billInfo[i]['name'] + " : " + billInfo[i]['value']);
			 }
			 
			
			 
			 $.ajax({
		        	url :"/mngMaint/bill/detail/writeBillReqeust.do",
		        	type:"POST",  
		        	data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            //data: JSON.stringify(object),
		     	    //contentType: "application/json; charset=UTF-8",
		     	    
		     	    dataType: 'text',
		            async : false,
		        	success:function(data){		  
		        		var paramData = JSON.parse(data);
		        		if(paramData.successYN=='Y') {
		        			
		        			$("#ipt_billCallKey").val(paramData.billCallKey);
		        			$("#ipt_billIssueStatus").val(paramData.billIssueStatus);
		        					
		        			alert("계산서 발행 요청이 완료되었습니다.!")
		        			
		        			form = document.reqForm;
		    				form.action = "<c:url value='/mngMaint/bill/detail/billForm.do'/>";
		    				form.submit(); 
		        		} else {
       						alert("계산서 발행 요청이 실패하였습니다.")
       					}
		        		
		        		//fnReload();
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
			 form.action = "<c:url value='/mngMaint/bill/detail/billForm.do'/>";
			 form.submit();
		 }
		 
		 function fnMovePreBillList() {
			
			form = document.reqForm;
			form.action = "<c:url value='/mngMaint/bill/detail/preBillList.do'/>";
			form.submit(); 
		 }
		 
		 function fnViewBill() {
			 //alert("=========>"+ $('#ipt_billCtFkKey').val());
			 window.parent.document.getElementById("m_iframGubun").value="detail";
		     window.parent.document.getElementById("m_billTurnNo").value=$('#slt_billTurnNo').val();
		     
			 var url = '/mngMaint/bill/popup/viewWriteSdBilling.do';
			 var dialogId = 'program_layer';
			 var varParam = {"billCtFkKey" : $('#ipt_billCtFkKey').val()};
			
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
				 
				 console.log(i+" : " + billInfo[i]['name'] + " : " + billInfo[i]['value']);
			 }
			 
			 $.ajax({
		        	url :"/mngMaint/bill/detail/writeBillInsert.do",
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


		
		//거래처 검색
		var fnSearchAccoutList = function(pObject, pstAccountNm) {
			$('#m_div_accountList').remove();
		
			var jsonData = {'acNm' : pstAccountNm, 'acBuyYN' : 'Y'};
			
			 $.ajax({
		        	url :"/mngCommon/account/searchList.do",
		        	type:"POST",  
		            data: jsonData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		
		        		//선택 목록 생성
		        		fnViewAccountList(pObject, data.accountList);
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    }); 
		};
		//거래처 검색
		var fnViewAccountList = function(pObject, pjAccountList){
			var html = '<div id="m_div_accountList">'
		         + '<ul class="accountList">' ;
			/* var html = '<div id="m_div_accountList" style="width:179px; padding-top: 7px; margin-left: 189px; padding-bottom: 7px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1); position: absolute;">'
			         + '<ul class="accountList">'
			       ;//+ '<div style="margin: 5px;">'; */
			       
			       for(var i=0; i < pjAccountList.length; i++) {
			    	   html += '<li id="m_li_account" title="'+ pjAccountList[i].acKey +'">' + pjAccountList[i].acNm + '</li>'
			    	        ;
			    	}			       
			       
			    html +=  '</ul>'
			          + '</div>'
			         ;//+ '</div>';
			//$('#m_td_account').after(html);
			$('#m_tr_account').after(html);
			
			
			$("[id^='m_li_account']").click(function(event) {
				
				$('#ipt_billAcNm').val(this.innerText); 
				$('#ipt_billAcKey').val(this.title);
				$('#ipt_billAcKey').change();
				$('#m_div_accountList').remove();
			});
		};
		
		/* 계산서 정보추가 */
		function fnBillInsert(billCtFkKey) {
			window.parent.document.getElementById("m_iframGubun").value="detail";
    		window.parent.document.getElementById("m_billTurnNo").value=$('#slt_billTurnNo').val();
    		
			var url = '/mngMaint/bill/popup/viewWriteSdBilling.do';
			var dialogId = 'program_layer';
			var varParam = {"billCtFkKey" : billCtFkKey};
			
			var button = new Array;
			button = [];			 
			 
			 /* showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:495px'); */ 
			 parent.showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:545px;');
			
		 }
		
		/* 매핑취소. */
		function fnMappingCancel() {
			//alert("====>"+$('#slt_billTurnNo').val());
			var varParam = {};
			if(confirm($('#slt_billTurnNo').val()+"회차에 대한 매핑취소처리를  하시겠습니까?")) {
				/* 매핑취소시  billIssueStatus 상태값을  M 에서 R으로 변경한다. */
				var billInfo = {
						'pjKey' : $('#ipt_pjKey').val()
						, 'billCallKey' : $('#ipt_billCallKey').val()
						, 'billCtFkKey' : $('#ipt_billCtFkKey').val()
 						, 'billIssueStatus' : 'R'
 	 					, 'billMappingYn' : 'N'
				}
				
				$.ajax({
		        	url :"/mngMaint/bill/detail/cancelSdBillMapping.do",
		        	type:"POST",  
		            data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){	  
		        		//console.log("step1.====>"+data.successYN);
		        		if(data.successYN=='Y') {
		        			alert($('#slt_billTurnNo').val()+"회차에 대한 세금계산서매핑 취소처리를 성공했습니다.");
		        			
		        			/* form = document.reqForm;
			    			form.action = "/mngMaint/bill/detail/billForm.do";
			    			form.submit();  */			
		        			window.parent.document.getElementById("m_iframGubun").value="detail";
		            		window.parent.document.getElementById("m_billTurnNo").value=$('#slt_billTurnNo').val();
		            			
		            		window.parent.changeIframeUrl();
		        		} else {
		        			alert($('#slt_billTurnNo').val()+"회차에 대한 세금계산서매핑 취소처리를 실패했습니다.");
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
		
		/* 수금완료 */
		function fnComplete(){
			var varParam = {};
			var billIssueStatus = '${billInfo.billIssueStatus}';
 			if(billIssueStatus == 'M') {
 				if(confirm($('#slt_billTurnNo').val()+"회차에 대한 수금완료처리를 하시겠습니까?")) {
 					/* 수금완료시 시  billIssueStatus 상태값을  E 로 변경한다. */
 					var billInfo = {
 							'pjKey' : $('#ipt_pjKey').val()
 							, 'billCallKey' : $('#ipt_billCallKey').val()
 							, 'salesKey' : $('#ipt_billCtFkKey').val()
 							, 'billIssueStatus' : 'E'
 					}
 					
 					$.ajax({
 				        	url :"/mngMaint/bill/detail/updateSdCollectStatus.do",
 				        	type:"POST",  
 				            data: billInfo,
 				     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
 				     	    dataType: 'json',
 				            async : false,
 				        	success:function(data){	
 				        		if(data.successYN=='Y') {
 				        			alert($('#slt_billTurnNo').val()+"회차에 대한 수금완료처리를 성공했습니다.");
 				        			
 				        			/* form = document.reqForm;
 					    			form.action = "/mngMaint/bill/detail/main.do";
 					    			form.submit(); 	 */		    			
 				        			window.parent.document.getElementById("m_iframGubun").value="detail";
 			            			window.parent.document.getElementById("m_billTurnNo").value=$('#slt_billTurnNo').val();
 			            			
 			            			window.parent.changeIframeUrl();
 				        		} else {
 				        			alert($('#slt_billTurnNo').val()+"회차에 대한 수금완료처리를 실패했습니다.");
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
		/* 수금완료취소  */
		function fnCompleteCancel() {
			//alert("====>"+$('#slt_billTurnNo').val());
			var varParam = {};
			if(confirm($('#slt_billTurnNo').val()+"회차에 대한 수금완료처리를 취소 하시겠습니까?")) {
				/* 수금취소시  billIssueStatus 상태값을  E 에서 M으로 변경한다. */
				var billInfo = {
						'pjKey' : $('#ipt_pjKey').val()
						, 'billCallKey' : $('#ipt_billCallKey').val()
						, 'salesKey' : $('#ipt_billCtFkKey').val()
 						, 'billIssueStatus' : 'M'
				}
				
				$.ajax({
		        	url :"/mngMaint/bill/detail/updateSdCollectStatus.do",
		        	type:"POST",  
		            data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){	  
		        		//console.log("step1.====>"+data.successYN);
		        		if(data.successYN=='Y') {
		        			alert($('#slt_billTurnNo').val()+"회차에 대한 수금취소처리를 성공했습니다.");
		        			
		        			/* form = document.reqForm;
			    			form.action = "/mngMaint/bill/detail/billForm.do";
			    			form.submit();  */			
		        			window.parent.document.getElementById("m_iframGubun").value="detail";
		            		window.parent.document.getElementById("m_billTurnNo").value=$('#slt_billTurnNo').val();
		            			
		            		window.parent.changeIframeUrl();
		        		} else {
		        			alert($('#slt_billTurnNo').val()+"회차에 대한 수금취소처리를 실패했습니다.");
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
		
			<input type="hidden" id="ipt_pjKey"  name="pjKey" value="${pjKey}" />
			<input type="hidden" id="ipt_acKey"  name="acKey" value="${acKey}" />
			<input type="hidden" id="ipt_billCallKey"      name="billCallKey"     value="${billInfo.billCallKey}" />
			<%-- <input type="hidden" id="ipt_billAcKey"        name="billAcKey"           value="${billAcKey}" /> --%>
			<input type="hidden" id="ipt_billIssueStatus" name="billIssueStatus" value="${billInfo.billIssueStatus}" />
			<input type="hidden" id="ipt_billCtFkKey" name="billCtFkKey" value="${billInfo.billCtFkKey}" />
			<input type="hidden" id="ipt_totalTurn" name="totalTurn" value="${collectTurn}" />
			
			<table class="dtl">
				<tr>
					<td class="backgroundpurple"><label>*</label>회차</td>
					<td>
						<select id="slt_billTurnNo" name="billTurnNo" style="width:120px;" required>
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
						
						<!-- R:요청, I:발급, M:매핑, E:지급완료(수금완료) -->
						<c:choose>
							<c:when test="${billInfo.billIssueStatus eq 'R'}">
								<span>(요청)</span>
							</c:when>
							<c:when test="${billInfo.billIssueStatus eq 'I'}">
								<span>(발급)</span>
							</c:when>
							<c:when test="${billInfo.billIssueStatus eq 'M'}">
								<span>(매핑)</span>
							</c:when>
							<c:when test="${billInfo.billIssueStatus eq 'E'}">
								<span>(수금완료)</span>
							</c:when>
							<c:when test="${billInfo.billIssueStatus == null }">
								<span>(발행전)</span>
							</c:when>
							<c:otherwise>
								<span>${billInfo.billIssueStatus}</span>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple"><label>*</label>금액</td>
					<td>
						<input type="text"     id="ipt_billAmount" name="billAmount" value="<c:out value="${displayUtil.commaStr(billInfo.billAmount)}"/>" style="text-align: right;" required/>
						<%-- <input type="checkbox" id="ipt_billTaxYn"  name="billTaxYn" class="tCheck"  <c:if test="${billInfo.billTaxYn == 'Y'}">checked</c:if>/>
						<label for='ipt_billTaxYn' class='cursorP tclabel'></label>
						<span class="cbspan">부가세 포함</span> --%>
					</td>
				</tr>
				<tr id="m_tr_account">
					<td class="backgroundpurple"><label>*</label>매출거래처</td>	
					<td>
						<%-- <select id="ipt_billAcDirectorKey" name="billAcDirectorName" style="width:120px;">
							<c:forEach var="directorList" items="${directorList}" varStatus="status">
								<option value='${directorList.acDirectorKey}' <c:if test="${billInfo.billAcDirectorKey == directorList.acDirectorKey}">selected </c:if>>
									<c:out value="${directorList.acDirectorNm}"/>
								</option>
							</c:forEach>
						</select> --%>
						<input type="text" id="ipt_billAcNm" name="billAcNm" class="search" value="<c:out value="${billInfo.billAcNm}"/>" autocomplete="off" required/>
						<input type="hidden" id="ipt_billAcKey" name="billAcKey" value="<c:out value="${billInfo.billAcKey}"/>" />
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple">매출처담당자</td>	
					<td>
						<%-- <select id="ipt_billAcDirectorKey" name="billAcDirectorName" style="width:120px;">
							<c:forEach var="directorList" items="${directorList}" varStatus="status">
								<option value='${directorList.acDirectorKey}' <c:if test="${billInfo.billAcDirectorKey == directorList.acDirectorKey}">selected </c:if>>
									<c:out value="${directorList.acDirectorNm}"/>
								</option>
							</c:forEach>
						</select> --%>
						<input type="text" id="ipt_billAcDirectorName" name="billAcDirectorName" value="<c:out value="${billInfo.billAcDirectorName}"/>" />
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple">매출처담연락처</td>	
					<td>
						<input type="text" id="ipt_billAcDirectorTel" name="billAcDirectorTel" value="<c:out value="${billInfo.billAcDirectorTel}"/>" />
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple"><label>*</label>발행이메일</td>	
					<td>
						<input type="text" id="ipt_billIssueEmail" name="billIssueEmail" value="<c:out value="${billInfo.billIssueEmail}"/>" required/>
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple"><label>*</label>발행일(예정일)</td>	
					<td>
						<input type="text" id="ipt_billRequestDt" name="billRequestDt" class="calendar" value="<c:out value="${displayUtil.displayDate(billInfo.billRequestDt)}"/>" required/>
					</td>
				</tr>
				<tr>
					<td class="backgroundpurple">요청사항</td>
					<td><textarea id="txt_remark" name="remark"><c:out value="${billInfo.remark}"/></textarea></td>
				</tr>
				
				<tr>
					<td class="backgroundgray">계산서번호</td>	
					<td>
						<c:if test="${billInfo.billNo eq null and billInfo.billIssueStatus eq 'R'}">
							<button type="button" class="btnComp" onclick="javascript:fnBillInsert('${billInfo.billCtFkKey }');">
								<img src="<c:url value='/images/btn_mapping_bill.png'/>" />
							</button>
						</c:if>
						<c:if test="${billInfo.billNo ne null}">
							<c:out value="${billInfo.billNo}"/>
						</c:if>
						<%-- <c:out value="${billInfo.billNo}"/> --%>
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
				<c:if test='${billInfo.billIssueStatus == null}'>
					<!--계산서 요청 등록 전.  -->
					<button type="button" id="req"   value="계산서 발행 요청" onclick="javascript:fnBillRequest();" style="" ><img class="cursorP" src="<c:url value='/images/btn_bill_request.png'/>" style=""/></button>
				</c:if>
				<c:if test='${billInfo.billIssueStatus eq "R"}'>
					<button type="button" id="req"   value="계산서 요청 수정" onclick="javascript:fnBillRequest();" style="" ><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" style=""/></button>
					<!--계산서 요청 등록 후 삭제.  -->
					<button type="button" id="req"   value="계산서 요청 취소" onclick="javascript:fnDeleteBillRequest();" style="" ><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" style=""/></button>
					<button type="button" title="계산서정보보기" class="blueBtnStyle" onclick="javascript:fnViewBill()">계산서매핑</button>
				</c:if>
				
				<c:if test='${billInfo.billIssueStatus eq "M"}'>
				<!-- 매핑완료인경우  -->
					<button type="button" title="계산서맵핑취소" class="purpleBtnStyle" onclick="javascript:fnMappingCancel()">계산서맵핑취소</button>
					<button type="button" title="수금완료" class="blueBtnStyle" onclick="javascript:fnComplete()">수금완료</button>
				</c:if>
				<c:if test='${billInfo.billIssueStatus eq "E"}'>
					<!-- 수금완료인경우  -->
					<button type="button" title="수금완료취소" class="purpleBtnStyle" onclick="javascript:fnCompleteCancel()">수금완료취소</button>
				</c:if>
				<c:if test='${billInfo.billIssueStatus != null && billInfo.billNo != null}'>
				
				<button type="button" title="계산서정보보기" class="blueBtnStyle" onclick="javascript:fnViewBill()">계산서정보보기</button>
				<%-- <button type="button" id="req"   value="계산서 XML등록" onclick="javascript:fnViewBillInsert();" style="" ><img class="cursorP" src="<c:url value='/images/btn_bill_xml.png'/>" style=""/></button> --%>
				<%-- <button type="button" id="check" value="발행완료"      onclick="javascript:fnBillPublish();" style="" ><img class="cursorP" src="<c:url value='/images/btn_bill_end.png'/>"  style=""/></button> --%>
				</c:if>
				
			</div>
		</div>
	</form> 
</body>
</html>