<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>지급계획목록(유지보수)</title>
	<style>
		.sfcnt {
			height: 91px;
		}
		form .nav {
			width: 100%;
			height: 49px;
		}
		form .contentsWrap {
			background-color: #f6f7fc;
			box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);
			height: 830px;
		}
		form .contentsWrap .contents {
			padding: 38px 71px; 
			width: 1662px;
		}
		form .title > label {
			font-size: 26px;
		}
		.contentsWrap .contents .top div:nth-child(2) > * {
			vertical-align: top;
		}
		.contentsWrap .contents .top div:nth-child(2) > label {
			line-height: 34px;
			margin: 5px;
			font-weight: 300;
		}
		.middle table {
			width: 1662px;
			font-size: 15px;
			margin-top: 16px;
			border-collapse: collapse;
			overflow: hidden;
			border-bottom: 2px solid #6a5bae;
		}
		.middle table thead {
			background-color: #e1dff5;
			font-size: 15px;
			float: left;
			width: 1662px;
			border-bottom: 3.5px solid #6a5bae;
		}
		.middle table thead tr {
			display: table;
			width: 1662px;
		}
		.middle table tbody {
			width: 1662px;
			height: 545px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.middle table tbody tr {
			display: table;
			width: 1662px;
			/* cursor: pointer; */
		}
		.middle table tbody tr td > span,
		.bottom table tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 95%;
			margin: 0 auto;
		}
		.middle table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle table thead th {
			padding: 10px 0;
			border: 1px solid #edebef;
			color: #535353;
		}
		.middle table tbody tr td {
			padding: 8px 0;
			border: 1px solid #edebef;
			color: #535353;
		}
		.middle table tbody tr td > img {
			width: 25px;
			vertical-align: middle;
		}
		.detailList li {
			float: left;
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
		}
		.detailList li:nth-child(2n-1) {
			width: 82px;
			font-weight: 400;
			color: #158566;
		}
		.detailList li:nth-child(2n) {
			width: 1396px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
		.bottom table {
			width: 100%;
		}
		.bottom table tr td {
			padding: 10px;
			color: #26a07d;
			background-color: #ccf4d7;
			text-align: right;
			width: 121px;
		}
		.bottom table tr td:nth-child(2) {
			width: 141px;
			max-width: 141px;
		}
		.bottom table tr td:nth-child(3) {
			width: 134px;
			max-width: 134px;
		}
		input[type="text"] {
		    height: 36px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
			color: #000;
		}
		input[type="text"]::placeholder {
			color: #535353;
		}
		input[class="calendar"] {
			width: 150px;
		    background-image: url('/images/calendar_icon.png');
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		input[class="search"] {
			width: 135px;
			height: 47.5px;
			/* background-image: url('/images/search_icon.png'); */
			background-repeat: no-repeat;
			background-position: 95% 50%;
			border : none;
			
		}
		
		.contentsWrap .contents input[class^="calendar"] {
			width: 110px;
			height: 29.6px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
			font-size: 15px;
		}
		.contentsWrap .contents select {
			height: 40px;
			width: 126px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		
		.middle table  thead th:first-child,
		.middle table tbody td:first-child {
			width: 30px;
			max-width: 30px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 55px;
			max-width: 55px;
		}
		
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3),
		.middle table thead th:nth-child(11),
		.middle table tbody td:nth-child(11) {
			width: 91px;
			max-width: 91px;
		}
		
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 145px;
			max-width: 145px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 25px;
			max-width: 25px;
		}	
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6) {
			width: 40px;
			max-width: 40px;
		}	
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7) {
			width: 58px;
			max-width: 58px;
		}		
		/* 날짜.*/
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(8){
			width: 53px;
			max-width: 53px;
		}
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9) {
			width: 48px;
			max-width: 48px;
		}		
		.middle table thead th:nth-child(10),
		.middle table tbody td:nth-child(10) {
			width: 43px;
			max-width: 43px;
		}		
		
		/* .middle table thead th:nth-child(12),
		.middle table tbody td:nth-child(12){
			width: 65px;
			max-width: 65px;
		} */
		.middle table thead th:nth-child(12),
		.middle table tbody td:nth-child(12),
		.middle table thead th:nth-child(13),
		.middle table tbody td:nth-child(13){
			width: 60px;
			max-width: 60px;
		}
		.middle table thead th:nth-child(14),
		.middle table tbody td:nth-child(14) {
			width: 80px;
			max-width: 80px;
		}
		
		
		.middle table thead th:nth-child(15),
		.middle table tbody td:nth-child(15) {
			width: 55px;
			max-width: 55px;
		}
		
		
		/* 거래처 스크롤 위치지정 */
		#m_div_accountList {
			width: 240px;
			left: 1265px;
    		margin-top: 0px;
    		text-align: left;
    		
		}
		/* 파랑버튼이미지  */
		.blueBtnStyle {
			width: 60px;
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
			width: 60px;
		    height: 26px;
		    background-color: #eb8282;
		    color: #ffffff;
		    font-weight: bold;
		    border: 1px solid #a392f2;
		    padding-bottom: 2px;
		    vertical-align: top;
		}		
		/* 보라버튼이미지  */
		.grayBtnStyle {
			width: 60px;
		    height: 26px;
		    background-color: #bec3c9;
		    color: #ffffff;
		    font-weight: bold;
		    border: 1px solid #a392f2;
		    padding-bottom: 2px;
		    vertical-align: top;
		    cursor: default;
		    /* -webkit-filter: grayscale(100%); */
		}
	</style>
	<script>
		$(document).ready(function() {			
			
			//검색어 검색
			$("input[name^='searchWord']").on("keydown", function(event){
				if(event.keyCode == 13) {		
					fn_searchList();
				}						
			});
			
			//영업담당 검색
			$("input[name^='searchSaleEmpNm']").on("keydown", function(event){
				if(event.keyCode == 13) {		
					fn_searchList();
				}						
			});
		});	
		
			
		/* 지급완료 */
		function fnPaymentComplete(rowNum){
			var confirmTitle;
			var tempPaymentFinishDt;
			var mtOrderType = $('#'+rowNum+'-mtOrderType').val();
			confirmTitle ="'"+ $('#'+rowNum+'-mtNm').val()+"' 유지보수 "+$('#'+rowNum+'-paymentTurn').val()
			+"회차("+addDateMinus($('#'+rowNum+'-paymentYearMonth').val())+")에";
			var varParam = {};
			
			
			if($('#'+rowNum+'-paymentDt').val() !='' && $('#'+rowNum+'-paymentDt').val().length ==10) {
				//console.log("length========>"+$('#'+rowNum+'-paymentDt').val().length);
				tempPaymentFinishDt = removeData($('#'+rowNum+'-paymentDt').val(),'-');
			} else {
				tempPaymentFinishDt = $('#pp_today').val();
			}
			//console.log("tempPaymentFinishDt========>"+tempPaymentFinishDt);
			/* var paymentConfirmInfo1 = {
					'mtIntegrateKey' : $('#'+rowNum+'-mtIntegrateKey').val()
					, 'paymentStatusCd' : 'E'
					, 'requestStatus' : 'E'
					, 'mtOrderType' : mtOrderType
					, 'paymentKey' :$('#'+rowNum+'-paymentCallKey').val()
					, 'paymentBuyFkKey' :$('#'+rowNum+'-mtOrderKey').val()
					, 'callAmount' : $('#'+rowNum+'-paymentTurnAmount').val()
					, 'paymentDt' : tempPaymentFinishDt
			}
			alert("===>"+JSON.stringify(paymentConfirmInfo1));
			if("BO" == mtOrderType) {
				alert("BO......");
			} else if("PO" == mtOrderType) {
				alert("PO......");
			} */
			if(confirm(confirmTitle+" 대한 지급완료처리를 하시겠습니까?")) {
				/* 수금완료시 시  billIssueStatus 상태값을  E 로 변경한다. */
				/* console.log("mtIntegrateKey========>"+$('#'+rowNum+'-mtIntegrateKey').val());
				console.log("mtOrderKey========>"+$('#'+rowNum+'-mtOrderKey').val());
				console.log("paymentDtKey========>"+$('#'+rowNum+'-paymentDtKey').val());
				console.log("paymentTurn========>"+$('#'+rowNum+'-paymentTurn').val());
				console.log("paymentFcDt========>"+removeData($('#'+rowNum+'-paymentFcDt').val(),'-'));
				console.log("paymentDt========>"+tempPaymentFinishDt);
				console.log("paymentTurnAmount========>"+$('#'+rowNum+'-paymentTurnAmount').val());
				console.log("billAcKey========>"+$('#'+rowNum+'-billAcKey').val());
				console.log("paymentYearMonth========>"+$('#'+rowNum+'-paymentYearMonth').val()); */
				if("BO" == mtOrderType) {
					var paymentConfirmInfo = {
							'mtIntegrateKey' : $('#'+rowNum+'-mtIntegrateKey').val()
							, 'paymentBuyFkKey' :$('#'+rowNum+'-mtOrderKey').val()
							, 'mtOrderType' : mtOrderType
							, 'paymentDtFkKey' : $('#'+rowNum+'-paymentDtKey').val()
							, 'paymentStatusCd' : 'E'
							, 'paymentTurn' : $('#'+rowNum+'-paymentTurn').val()
							, 'paymentCallDt' : removeData($('#'+rowNum+'-paymentFcDt').val(),'-')
							, 'paymentDt' : tempPaymentFinishDt
							, 'callAmount' : $('#'+rowNum+'-paymentTurnAmount').val()
							, 'paymentAcFkKey' : $('#'+rowNum+'-billAcKey').val()
							, 'paymentYearMonth' : $('#'+rowNum+'-paymentYearMonth').val()
							, 'mtNm' : $('#'+rowNum+'-mtNm').val()
							, 'paymentBillAcNm' : $('#'+rowNum+'-billAcNm').val()
					}
					//console.log("paymentTurn========>"+$('#'+rowNum+'-paymentTurn').val());
					//console.log("paymentConfirmInfo====>"+JSON.stringify(paymentConfirmInfo));
					$.ajax({
				        	url :"/mngMaint/payment/detail/writePaymentComplete.do",
				        	type:"POST",  
				            data: paymentConfirmInfo,
				     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				     	    dataType: 'json',
				            async : false,
				        	success:function(data){	
				        		var mailList = "";
						    	if(data.mailList == "undefined" || data.mailList == null || data.mailList == "") {
						    		mailList = "";
						    	} else {
						    		mailList = "\n메일 수신인: " + data.mailList.join("\n");
						    	}
						    	
				        		if(data.successYN=='Y') {
				        			
				        			if(data.mailSuccessYN=='Y') {
				        				alert(confirmTitle+" 대한 지급완료처리를 성공했습니다."+ mailList);
				        			} else {
				        				alert(confirmTitle+" 대한 지급완료처리를 성공했습니다.(메일전송은 실패 !!)");
				        			}
				        			
				        			
				        			
				        			form = document.listForm;
				    				form.action = "/mngMaint/billSchedule/paymentPlanList.do";
				    				form.submit();
				        		} else {
				        			alert(confirmTitle+" 대한 지급완료처리를 실패했습니다.");
				        		}
				        		        		
				        		
				            },
				        	error: function(request, status, error) {
				        		if(request.status != '0') {
				        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
				        		}
				        	} 
				    }); 
				} else if("PO" == mtOrderType) {
					console.log("mtOrderType 2====>PO");
					var paymentConfirmInfo = {
							'mtIntegrateKey' : $('#'+rowNum+'-mtIntegrateKey').val()
							, 'paymentStatusCd' : 'E'
							, 'currentStatus' : $('#'+rowNum+'-currentStatus').val()
							, 'requestStatus' : 'E'
							, 'paymentTurn' : $('#'+rowNum+'-paymentTurn').val()
							, 'mtOrderType' : mtOrderType
							, 'paymentKey' :$('#'+rowNum+'-paymentCallKey').val()
							, 'paymentBuyFkKey' :$('#'+rowNum+'-mtOrderKey').val()
							, 'callAmount' : $('#'+rowNum+'-paymentTurnAmount').val()
							, 'paymentDt' : tempPaymentFinishDt
							, 'mtNm' : $('#'+rowNum+'-mtNm').val()
							, 'paymentBillAcNm' : $('#'+rowNum+'-billAcNm').val()
							, 'mtWorkKey' : $('#'+rowNum+'-mtWorkKey').val()
							, 'paymentAcFkKey' : $('#'+rowNum+'-billAcKey').val()
					}
					//console.log("paymentTurn========>"+$('#'+rowNum+'-paymentTurn').val());
					//console.log("paymentConfirmInfo====>"+JSON.stringify(paymentConfirmInfo));
					//console.log("step 2====>");
					$.ajax({
				        	url :"/mngMaint/payment/detail/updatePaymentRequestStatus2.do",
				        	type:"POST",  
				            data: paymentConfirmInfo,
				     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				     	    dataType: 'json',
				            async : false,
				        	success:function(data){	
				        		var mailList = "";
						    	if(data.mailList == "undefined" || data.mailList == null || data.mailList == "") {
						    		mailList = "";
						    	} else {
						    		mailList = "\n메일 수신인: " + data.mailList.join("\n");
						    	}
						    	
				        		if(data.successYN=='Y') {
				        			if(data.mailSuccessYN=='Y') {
				        				alert(confirmTitle+" 대한 지급완료처리를 성공했습니다."+ mailList);
				        			} else {
				        				alert(confirmTitle+" 대한 지급완료처리를 성공했습니다.(메일전송은 실패 !!)");
				        			}
				        							        			
				        			form = document.listForm;
				    				form.action = "/mngMaint/billSchedule/paymentPlanList.do";
				    				form.submit();
				        		} else {
				        			alert(confirmTitle+" 대한 지급완료처리를 실패했습니다.");
				        		}
				        		        		
				        		
				            },
				        	error: function(request, status, error) {
				        		if(request.status != '0') {
				        			alert(confirmTitle+" 대한 지급완료처리를 실패했습니다. \n code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
				        		}
				        	} 
				    }); 
				}
					
					
			}
			
	 	}
		/* 수금완료취소  */
		function fnPaymentCompleteCancel(rowNum) {
			//alert("====>"+$('#slt_billTurnNo').val());
			var confirmTitle;
			confirmTitle ="'"+ $('#'+rowNum+'-mtNm').val()+"' 유지보수 "+$('#'+rowNum+'-salesTurn').val()
			+"회차("+addDateMinus($('#'+rowNum+'-salesYearMonth').val())+")에";
			
			var mtOrderType = $('#'+rowNum+'-mtOrderType').val();
			var varParam = {};
			if(confirm(confirmTitle+" 대한 수금완료처리를 취소 하시겠습니까?")) {
				
				if("BO" == mtOrderType) {
					/* 수금취소시  billIssueStatus 상태값을  E 에서 M으로 변경한다. */
					var billInfo = {
							'pjKey' : $('#'+rowNum+'-salesCtFkKey').val()
							, 'billCallKey' : $('#'+rowNum+'-billCallKey').val()
							, 'salesKey' : $('#'+rowNum+'-salesKey').val()
	 						, 'billIssueStatus' : 'I'
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
			        			alert(confirmTitle+" 대한 수금취소처리를 성공했습니다.");
			        			
			        			form = document.listForm;
			    				form.action = "/mngMaint/billSchedule/salesBillPlanList.do";
			    				form.submit();
			        		} else {
			        			alert(confirmTitle+" 대한 수금취소처리를 실패했습니다.");
			        		}	        		        		
			        		
			            },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
				    });
				} else if("PO" == mtOrderType) {
					console.log("mtOrderType 2====>PO");
					var paymentConfirmInfo = {
							'mtIntegrateKey' : $('#'+rowNum+'-mtIntegrateKey').val()
							, 'paymentStatusCd' : 'C'
							, 'currentStatus' : $('#'+rowNum+'-currentStatus').val()
							, 'requestStatus' : 'C'
							, 'mtOrderType' : mtOrderType
							, 'paymentKey' :$('#'+rowNum+'-paymentCallKey').val()
							, 'paymentBuyFkKey' :$('#'+rowNum+'-mtOrderKey').val()
							, 'callAmount' : $('#'+rowNum+'-paymentTurnAmount').val()
							, 'paymentDt' : tempPaymentFinishDt
					}
					console.log("paymentTurn========>"+$('#'+rowNum+'-paymentTurn').val());
					console.log("paymentConfirmInfo====>"+JSON.stringify(paymentConfirmInfo));
					console.log("step 2====>");
					$.ajax({
				        	url :"/mngMaint/payment/detail/updatePaymentRequestStatus2.do",
				        	type:"POST",  
				            data: paymentConfirmInfo,
				     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				     	    dataType: 'json',
				            async : false,
				        	success:function(data){	
				        		if(data.successYN=='Y') {
				        			alert(confirmTitle+" 대한 수금취소처리를 성공했습니다.");
				        			
				        			form = document.listForm;
				    				form.action = "/mngMaint/billSchedule/paymentPlanList.do";
				    				form.submit();
				        		} else {
				        			alert(confirmTitle+" 대한 지급취소처리를 실패했습니다.");
				        		}
				        		        		
				        		
				            },
				        	error: function(request, status, error) {
				        		if(request.status != '0') {
				        			alert(confirmTitle+" 대한 지급완료처리를 실패했습니다. \n code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
				        		}
				        	} 
				    }); 
				}
				
				
			}
		}
		

		
		function fn_searchList(){
			
			document.listForm.action = "/mngMaint/billSchedule/paymentPlanList.do";
           	document.listForm.submit(); 
		}
		
		function moveBackOrderDetail(mtIntegrateKey,mtOrderKey, mtWorkKey, mtOrderType ) {
			$('#mtIntegrateKey').val(mtIntegrateKey);
			$('#mtOrderKey').val(mtOrderKey);
			
           	
           	//window.open("/maintenance/contract/detail/backOrderInfo.do?mtIntegrateKey="+mtIntegrateKey+"&mtOrderKey="+mtOrderKey);
           	/* if("BO"==mtOrderType) {
           		window.open("/maintenance/contract/detail/paymentPlanInfo.do?mtIntegrateKey="+mtIntegrateKey+"&mtOrderKey="+mtOrderKey);
           	} else if("PO"==mtOrderType) {
           		//window.open("/maintenance/work/detail/orderInfo.do?mtIntegrateKey="+mtIntegrateKey+"&orderCtFkKey="+mtWorkKey+"&selectKey="+mtOrderKey);
           		window.open("/maintenance/work/detail/orderInfo.do?mtIntegrateKey="+mtIntegrateKey+"&orderCtFkKey="+mtWorkKey);
           	} */
           	
           	if("BO"==mtOrderType) {
           		document.mtMoveForm.action = "/maintenance/contract/detail/paymentPlanInfo.do";
           	} else if("PO"==mtOrderType) {
           		document.mtMoveForm.action = "/maintenance/work/detail/orderInfo.do";
           	}
           	document.mtMoveForm.submit();
		}
	</script>
</head>
<body>
	<form action="/" id="mtMoveForm" name="mtMoveForm" method="post">
		<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey"/>
		<input type="hidden" id="mtOrderKey" name="mtOrderKey"/>
	</form>
	<form action="/" id="mtWriteForm" name="mtWriteForm" method="post">
		<input type="hidden" id="pp_mtIntegrateKey" name="mtIntegrateKey"/><!--mtIntegrateKey == pjKey  -->
		<input type="hidden" id="pp_mtOrderKey" name="mtSalesOrderKey"/><!--매출계약관리키(MT_SALES_ORDER_TB.MT_SALES_ORDER_KEY) -->
		<input type="hidden" id="pp_billIssueStatus" name="billIssueStatus" />
		<input type="hidden" id="pp_billCtFkKey" name="billCtFkKey" />	<!-- 수금계획 관리키(MT_SALES_DETAIL_TB.SALES_KEY) -->
		<input type="hidden" id="pp_billCallKey" name="billCallKey" />	<!-- 매출계산서 요청관리키(MT_SD_BILLING_OP_TB.BILL_CALL_KEY) -->
		<input type="hidden" id="pp_billTurnNo" name="billTurnNo" />	<!-- 회차정보 -->
		<input type="hidden" id="pp_billIssueType" name="billIssueType" />	<!-- 발행구분(정발행:Y,역발행:N) -->
		<input type="hidden" id="pp_billAmount" name="billAmount" /> <!-- 수금금액  -->		
		<input type="hidden" id="pp_billAcKey" name="billAcKey" /> <!-- 매출업체관리키  -->	
		<input type="hidden" id="pp_billSalesCd" name="billSalesCd" /> <!-- 매출구분  -->	
		<input type="hidden" id="pp_billMfCd" name="billMfCd" /> <!-- 제조사  -->	
		<input type="hidden" id="pp_billRequestDt" name="billRequestDt" /> <!-- 발행예정일  -->
		<input type="hidden" id="pp_billIssueDt" name="billIssueDt" /> <!-- 계산서발행일자  -->
		<input type="hidden" id="pp_today"  value="<c:out value="${searchParam.toDay}"/>"/> <!-- 오늘날짜  -->
	</form>
	<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
		<!-- <div class="sfcnt"></div>
		<div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">지급계획정보목록</label></div>
						<%-- <div class="addBtn floatL cursorP" onclick="javascript:fn_addView('writeBasic')"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>
					</div>
					<div class="floatR">
						<form:input path="searchSaleEmpNm" type="text" placeholder="영업담당" style="width: 100px"/>
						<form:input path="fromDate" type="text" class="calendar fromDt" placeholder="계산서일정" style="height: 36px" value="${searchParam.fromDate}"/><label style="vertical-align: -webkit-baseline-middle;"> ~ </label><form:input path="toDate" type="text" class="calendar toDt" placeholder="계산서일정" style="height: 36px" value="${searchParam.toDate}"/>
						<form:select path="searchGubun">
							<form:option value="PJ" label="유지보수명" />
							<form:option value="CU" label="고객사" />
							<form:option value="BA" label="매입처" />
						</form:select>
						<form:input path="searchWord" type="text" placeholder="검색어"/>
						<span><button type="button" onclick="fn_searchList();"><img src="<c:url value='/images/icon_search.png'/>" /></button></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200 excelSheet" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">No</th>
								<th scope="row">발주구분</th>
								<th scope="row">고객사</th>
								<th scope="row">유지보수명</th>
								<th scope="row">회차</th>
								<th scope="row">매입년월</th>
								<th scope="row">회차금액</th>
								<th scope="row">지급예정일</th>
								<th scope="row">상태</th>
								<th scope="row">영업담당</th>
								<th scope="row">매입처</th>
								<th scope="row">매입구분</th>
								<th scope="row">제조사</th>
								<th scope="row">지급완료일</th>
								<th scope="row">지급</th>
								<th style="max-width: 0px; display: none;">mtIntegrateKey</th>
								<th style="max-width: 0px; display: none;">mtOrderKey</th>
								<th style="max-width: 0px; display: none;">paymentDtKey</th>
								<th style="max-width: 0px; display: none;">billAcKey</th>
								<th style="max-width: 0px; display: none;">rowNum</th>
								<th style="max-width: 0px; display: none;">paymentCallKey</th>
							</tr>
						</thead>
						<tbody>
						<c:set var = "totalAmount" value="0" />
						<c:forEach var="list" items="${paymentPlanList}" varStatus="status">
							<c:set var = "totalAmount" value="${totalAmount + list.paymentTurnAmount}" />
							<tr>
								<td><c:out value="${status.count}"/></td>
								<td style="cursor:pointer;" onclick="javascript:moveBackOrderDetail('<c:out value="${list.mtIntegrateKey}"/>','<c:out value="${list.mtOrderKey}"/>','<c:out value="${list.mtWorkKey}"/>','<c:out value="${list.mtOrderType}"/>')">
							<c:choose>
								<c:when test="${list.mtOrderType eq 'BO'}">
									백계약발주
								</c:when>
								<c:when test="${list.mtOrderType eq 'PO'}">
									작업발주
								</c:when>
								<c:otherwise>
									<c:out value="${list.mtOrderType}"/>
								</c:otherwise>
							</c:choose>	
									<input type="hidden" id="<c:out value="${status.index}"/>-mtOrderType"  value="<c:out value="${list.mtOrderType}"/>" />
								</td>
								<td class="textalignL" style="cursor:pointer;" onclick="javascript:moveBackOrderDetail('<c:out value="${list.mtIntegrateKey}"/>','<c:out value="${list.mtOrderKey}"/>','<c:out value="${list.mtWorkKey}"/>','<c:out value="${list.mtOrderType}"/>')"><span title="${list.mtAcNm}">&nbsp;<c:out value="${list.mtAcNm}"/></span></td>
								<td class="textalignL" style="cursor:pointer;" onclick="javascript:moveBackOrderDetail('<c:out value="${list.mtIntegrateKey}"/>','<c:out value="${list.mtOrderKey}"/>','<c:out value="${list.mtWorkKey}"/>','<c:out value="${list.mtOrderType}"/>')">&nbsp;
									<span title="${list.mtNm}"><c:out value="${list.mtNm}"/></span>
									<input type="hidden" id="<c:out value="${status.index}"/>-mtNm"  value="<c:out value="${list.mtNm}"/>" />
								</td>
								<td>
									<span title="${list.salesTurn}"><c:out value="${list.paymentTurn}"/></span>
									<input type="hidden" id="<c:out value="${status.index}"/>-paymentTurn"  value="<c:out value="${list.paymentTurn}"/>" />
								</td>
								<td>
									<span title="${displayUtil.displayDate(list.paymentYearMonth)}"><c:out value="${displayUtil.displayDate(list.paymentYearMonth)}"/></span>
									<input type="hidden" id="<c:out value="${status.index}"/>-paymentYearMonth"  value="<c:out value="${list.paymentYearMonth}"/>" />
								</td>								
								<td class="textalignR">
									<span title="${displayUtil.commaStr(list.paymentTurnAmount)}"><c:out value="${displayUtil.commaStr(list.paymentTurnAmount)}"/>&nbsp;</span>
									<input type="hidden" id="<c:out value="${status.index}"/>-paymentTurnAmount"  value="<c:out value="${list.paymentTurnAmount}"/>" />
								</td>
								<td>
									<c:out value="${displayUtil.displayDate(list.paymentFcDt)}"/>
									<input type="hidden" id="<c:out value="${status.index}"/>-paymentFcDt"  value="<c:out value="${list.paymentFcDt}"/>" />
								</td>
								
								<td>
									<c:choose>
										<c:when test="${list.paymentStatusCd eq 'W'}">
											<span>요청대기</span>
										</c:when>
										<c:when test="${list.paymentStatusCd eq 'M'}">
											<span>계산서매핑</span>
										</c:when>
										<c:when test="${list.paymentStatusCd eq 'R'}">
											<span>지급요청</span>
										</c:when>
										<c:when test="${list.paymentStatusCd eq 'C'}">
											<span>지급승인</span>
										</c:when>
										<c:when test="${list.paymentStatusCd eq 'E'}">
											<span>지급완료</span>
										</c:when>
										<c:when test="${list.paymentStatusCd == null }">
											<span>지급요청전</span>
										</c:when>
										<c:otherwise>
											<span>${list.paymentStatusCd}</span>
										</c:otherwise>
									</c:choose>	
									<input type="hidden" id="<c:out value="${status.index}"/>-currentStatus"  value="<c:out value="${list.paymentStatusCd}"/>" />
								</td>
								<td><c:out value="${list.saleEmpNm}"/></td>
								<td class="textalignL">&nbsp;
									<span title="${list.billAcNm}" ><c:out value="${list.billAcNm}" /></span>
									<input type="hidden" name="billAcNm" id="<c:out value="${status.index}"/>-billAcNm"  value="<c:out value="${list.billAcNm}"/>" />
									<input type="hidden" name="billAcKey" id="<c:out value="${status.index}"/>-billAcKey"  value="<c:out value="${list.billAcKey}"/>" />	
								</td>
								<td><span title="${list.billPurchaseCd}"><c:out value="${list.billPurchaseCd}"/></span></td>
								<td><span title="${list.billMfCd}"><c:out value="${list.billMfCd}"/></span></td>
								
								<td>
									<input type="text" id="<c:out value="${status.index}"/>-paymentDt" name="paymentDt" class="calendar" value="<c:out value="${displayUtil.displayDate(list.paymentDt)}"/>" />
								</td>
								<td>									
									<c:choose>
										<c:when test="${list.paymentStatusCd eq 'W'}">
											<button type="button" title="지급완료" class="blueBtnStyle" onclick="javascript:fnPaymentComplete(<c:out value="${status.index}"/>)">지급완료</button>
										</c:when>
										<c:when test="${list.paymentStatusCd eq 'M'}">
											<button type="button" title="지급완료" class="purpleBtnStyle" onclick="javascript:fnPaymentComplete(<c:out value="${status.index}"/>)">지급완료</button>
										</c:when>
										<c:when test="${list.paymentStatusCd eq 'R'}">
											<button type="button" title="지급완료" class="purpleBtnStyle" onclick="javascript:fnPaymentComplete(<c:out value="${status.index}"/>)">지급완료</button>
										</c:when>
										<c:when test="${list.paymentStatusCd eq 'C'}">
											<button type="button" title="지급완료" class="purpleBtnStyle" onclick="javascript:fnPaymentComplete(<c:out value="${status.index}"/>)">지급완료</button>
										</c:when>
										<c:when test="${list.paymentStatusCd eq 'E'}">
											<%-- <button type="button" title="지급완료취소" class="purpleBtnStyle" onclick="javascript:fnPaymentCompleteCancel(<c:out value="${status.index}"/>)">완료취소</button> --%>
											<button type="button" title="지급완료" class="grayBtnStyle">지급완료</button>
										</c:when>
										<c:when test="${list.paymentStatusCd == null }">
											<button type="button" title="지급완료" class="blueBtnStyle" onclick="javascript:fnPaymentComplete(<c:out value="${status.index}"/>)">지급완료</button>
										</c:when>
										<c:otherwise>
											<span>${list.paymentStatusCd}</span>
										</c:otherwise>
									</c:choose>
									<!-- <button type="button" title="수금완료" class="blueBtnStyle" onclick="javascript:fnPaymentComplete()">발급완료</button> -->
								</td>
								
								<td style="max-width: 0px; display: none;">
									<input type="hidden" id="<c:out value="${status.index}"/>-mtIntegrateKey" value='<c:out value="${list.mtIntegrateKey}"/>'/>
									<input type="hidden" id="<c:out value="${status.index}"/>-paymentCallKey" value="<c:out value="${list.paymentCallKey}"/>"/>
								</td>
								<td style="max-width: 0px; display: none;"><input type="hidden" id="<c:out value="${status.index}"/>-mtOrderKey" value="<c:out value="${list.mtOrderKey}"/>"/></td>
								<td style="max-width: 0px; display: none;"><input type="hidden" id="<c:out value="${status.index}"/>-paymentDtKey" value="<c:out value="${list.paymentDtKey}"/>"/></td>
								<td style="max-width: 0px; display: none;"><input type="hidden" id="<c:out value="${status.index}"/>-billAcKey" value="<c:out value="${list.billAcKey}"/>"/></td>
								<td style="max-width: 0px; display: none;"><c:out value="${status.index}"/></td>
								<td style="max-width: 0px; display: none;">
									<input type="hidden" id="<c:out value="${status.index}"/>-paymentCallKey" value="<c:out value="${list.paymentCallKey}"/>"/>
									<input type="hidden" id="<c:out value="${status.index}"/>-mtWorkKey" value="<c:out value="${list.mtWorkKey}"/>"/>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<table>
						<tbody class="ftw400">
							<tr>								
								<td style="width:50px;">합계 </td>
								
								<td style="text-align: left;"><span><c:out value="${displayUtil.commaStr(totalAmount)}"/> 원</span></td>
							</tr>
						</tbody>
					</table>
					<div class="floatR">
						<button type="button" value="엑셀 다운로드" id="excelExport" style="margin-top: 22px;"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>"/></button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>