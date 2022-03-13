<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="<c:url value='/js/common.js'/>"></script>
	<title>유지보수계약 매출 계산서정보</title>
	<style>
		.firstTd {			
			border-top: 2px solid #e5e5e5;	
			padding-top: 6px;
		}
		.lastTd {			
			padding-bottom: 5px;
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
		.popContainer .left {
			width: 201px;
			height: 601px;
			position: absolute;
			top: 107px;
			box-shadow: 3px -1px 8px 0px rgb(0,0,0,0.3);
			background-color: #32bc94;
			z-index: 4;
		}
		.popContainer .left ul li {
			height: 47px;
			padding-left: 28px;
			line-height: 47px;
		}
		.popContainer .left ul li.on,
		.popContainer .left ul li:hover {
			background-color: #fff;
			color: #32bc94;
		}
		.popContainer .contents1 {
			position: absolute;
			/* width: calc(100% - 201px); */
			width: 943px;
			height: 453px;
			top: 255px;
			left: 201px;			
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: hidden;
			overflow-x: hidden;
		}
		.popContainer .contents1 > div {
			/* margin: 10px 47px 0 37px;
			overflow-y: auto;		 */
			margin-left: 38px;				
			width: calc(100% - 80px);
		}
		.popContainer .contents .subject2 {
			width: 863px;
			/* border-bottom: 2px solid #e5e5e5; */
			padding-bottom: 9px;
		}
		.popContainer input {
			width: 60px;
			height: 30px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents1 input[class="numberTy"] {
			width: 27px;
		}
		.popContainer .contents1 input[class^="calendar"] {
			width: 115px;
		}
		.popContainer .contents1 td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer .salesTable table {
			box-sizing: border-box;
			border-bottom: 2px solid #e5e5e5;
			padding-bottom: 5px;
			margin-top: 5px;
			table-layout: fixed;
			width: 100%;
		}
		.popContainer td.tdTitle {
			/* box-sizing: border-box; */
			margin-top: 11px;
			font-size: 15px;
			color: #525252;
			padding-left: 0px;
			padding-right: 10px;
			width: 40px;
			text-align: right;
		}						
		.popContainer td.tdEtc {
			width: 141px;
			font-size: 14px;
		} 	
		.popContainer tr td.sum {
			padding-top: 15px;
		}		
		.popContainer tr td.sum label {
			color: #32bc94;
			font-size: 15px;
		}			
		/* .popContainer .contents1 tr:nth-child(1) td {
			padding-top: 10px;
		} */ 
		.popContainer .contents td.subTitle, .popContainer .contents1 td.subTitle {
			font-size: 18px;
			padding-right: 20px;
			width: 91px;
			padding-top: 20px;
			padding-bottom: 5px;
		}	
		.popContainer .bottomBtn {
			position: absolute;
			width: 1083px;
			height: 52px;
			top: 638px;
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: hidden;
			overflow-x: hidden;
			padding-top: 18px;
			padding-right: 52px;
		}	
		
		
		.popContainer .contents table thead {
			background-color: #e1dff5;
			float: left;
			width: calc(100% - 8px);
			border-top: 3.5px solid #6a5bae;
		}
		.popContainer .contents table thead {
			display: table-header-group;
		}
		.popContainer .contents table tbody {
			width: calc(100% - 5px);
			height: 68px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.popContainer .contents table tbody tr {
			display: table;
			width: calc(100% - 5px);
			/* cursor: pointer; */
		}

		
		.popContainer .contents {
			position: absolute;
			width: calc(100% - 201px);
			height: 168px;
			top: 107px;
			left : 201px;
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: hidden;
			overflow-x: hidden;
		}		
		.popContainer .contents table {
			box-sizing: border-box;
			width: calc(100% - 72px);
			font-size: 15px;
			margin-top: 9px;
			margin-left: 38px;
			border-collapse: collapse;
			overflow: hidden;
		}
		.popContainer .contents table thead{			
			font-size: 15px;
		}
		.popContainer .contents table tbody{			
			font-size: 14px;
		}
		/* .popContainer .contents1 table tbody {
			width: 1067px;
			//height: 200px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		} */
		.popContainer .contents table thead th {
			padding: 10px 0;
			border: 1px solid #edebef;
		}
		.popContainer .contents table tbody tr td {
			padding: 0px 0;
			border: 1px solid #edebef;
		}

		
		.popContainer input[class="pname"] {
			width: 85px;
			border : none;
			outline: none;
			padding : 0px;
			background-color: #f6f7fc;
		}
		.calculate {
			text-align: right !important;
		}	
		.popContainer .contents1 .btnWrap {
			margin : 20px 36px 15px 38px;
		}
		.btnCenter {
			width : calc(100% - 46px);
			text-align: center;
		}
		/* .popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
      	} */
      			
		.popContainer .contents1 table {
			box-sizing: border-box;
			width: 870px;
			font-size: 15px;
			border-collapse: collapse;
			overflow: hidden;
			/* margin-top: 0px;
			margin-left: 2px; */
		}
		.popContainer .contents1 table thead {
			background-color: #e1dff5;
			float: left;
			width: 870px;
			border-top: 3.5px solid #6a5bae;
		}
		
		.popContainer .contents1 table tbody {
			/* width: calc(100% - -2px); */
			width: 870px;
			max-width: 870px;
			height: 334px; 
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			font-size: 14px;
			background: #ffffff;
		}
		.popContainer .contents1 table tbody tr {
			display: table;
			width: 869px;
		}
		
		.popContainer .contents1 table thead tr {
			display: table;
			width: 870px;
		}
		.popContainer .contents1 table thead{			
			font-size: 15px;
		}
		.popContainer .contents1 table thead th {
			padding: 10px 0px;
			border: 1px solid #edebef;
		}
		.popContainer .contents1 table tbody tr td {
			padding: 0px 0;
			border: 1px solid #edebef;
		}

		.contents1 table thead th:first-child,
		.contents1 table tbody td:first-child {
			width: 105px;
			text-align: center;
		}
		.contents1 table thead th:nth-child(2),
		.contents1 table tbody td:nth-child(2) {
			width: 105px;
			text-align: center;
		}
		.contents1 table thead th:nth-child(3),
		.contents1 table tbody td:nth-child(3) {
			width: 134px;
			text-align: center;
		}
		/* .contents1 table thead th:nth-child(4){
			width: 154px;
		}
		.contents1 table tbody td:nth-child(4) {
			width: 154px;
			text-align: right;			
		} */
		
		.contents1 table thead th:nth-child(4),
		.contents1 table tbody td:nth-child(4) {
			width: 140px;
			text-align: right;			
		}
		.contents1 table thead th:nth-child(5),
		.contents1 table tbody td:nth-child(5), 
		.contents1 table thead th:nth-child(6),
		.contents1 table tbody td:nth-child(6) {
			width: 165px;
			text-align: center;		
		}
				
		.popContainer .contents td.tdTitle {
			margin-top: 11px;
			font-size: 14px;
			color: #525252;
			padding-left: 20px;
			width: 75px;
			text-align: left;
			/* background-color: #e1dff5; */
			background: transparent;
    		border: none;
		}	
		.popContainer .contents td.tdContents {
			width: 160px;
			font-size: 14px;
			border:none;
			padding-left: 10px;
		} 
		/* 파랑버튼이미지  */
		.blueBtnStyle {
			width: 55px;
		    height: 26px;
		    background-color: #91a6f2;
		    color: #ffffff;
		    font-weight: bold;
		    border: 1px solid #91a6f2;
		    padding-bottom: 2px;
		    vertical-align: top;
		}
      	.help {
      		vertical-align: middle;
		    line-height: 1;
		    margin-left: 2px;
      	}
      	.help[data-tooltip-text]:hover {
			position: absolute;
			z-index:9999;
		}
		.help[data-tooltip-text]:hover:after {
			background-color: #000000;
			background-color: rgba(0, 0, 0, 0.8);
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			color: #FFFFFF;
			font-size: 13px;
			font-weight: 200;
			content: attr(data-tooltip-text);
		  	margin-bottom: 10px;
		  	margin-left: -50px;
			top: 110%;
			left: -10;    
			padding: 5px 12px;
			position: absolute;
			width: auto;
			min-width: 340px;
			max-width: 350px;
			word-wrap: break-word;
			z-index: 9999;
		}
		.popContainer .contents select{
			width: 205px;
			height: 30px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
			margin-bottom: 3px;
		}
	</style>
	<script>
	
		$(document).ready(function() {
			//매출계약 목록  selectbox값 셋팅
			/* $('#mtStartDt').val(addDateMinus("${contractAmountInfo.mtStartDt}"));
			$('#mtEndDt').val(addDateMinus("${contractAmountInfo.mtEndDt}"));
			$('#mtPmStartDt').val(addDateMinus("${contractAmountInfo.mtPmStartDt}"));
			$('#mtPmEndDt').val(addDateMinus("${contractAmountInfo.mtPmEndDt}"));
			$('#mtAmount').val(addCommas("${contractAmountInfo.mtAmount}"));
			$('#mtPmTotalAmount').val(addCommas("${contractAmountInfo.mtPmTotalAmount}"));	 */		
			
			
			
			//계산서발행구분 셋팅
			$("input:radio[name='billIssueRule']:radio[value='${billIssueRule}']").prop('checked', true);
		
			$('#mtSaveOrderAcKey').val("${mtSalesOrderKey}").attr("selected", "true");
		});
		
		/* 리스트 데이타 만들기.*/
		jQuery.fn.serializeObject = function() { 
			var obj = null; 
			var objArry = null;
				try { 
					if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
						var arr = this.serializeArray(); 
						if(arr){ 
							obj = {};
							objArry = new Array();
							jQuery.each(arr, function() { 
							
							if(this.name=="salesCollectRate" || this.name=="salesTurnAmount"){
								//숫자에서 컴마를 제거한다.
								obj[this.name] = removeCommas(this.value); 
							} else if(this.name =="salesYearMonth" || this.name=="salesBillFcDt" || this.name=="salesCollectFcDt") {
								//이름에서 prodList-0-를 제거하고 날짜값에서 -를 제거한다.
								obj[this.name] =  removeData(this.value,"-"); 
							} else {
								obj[this.name] = this.value; 
							}
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							* 계산서예정일에서 반복문 초기화.
							*/
							if(this.name == "salesCollectFcDt"){
								objArry.push(obj);
								obj = {};
							}
						}); 	              
					} 
				} 
			}catch(e) { 
				alert(e.message); 
			}finally {} 
			return objArry; 
		}
		/**
		*  화면을 이동시킨다.
		*  @param {string} varUrl 이동해야할 url
		*/
		function fn_changeView(varUrl) {
			var url;
			if($('#mtIntegrateKey').val() !="") {
				if(varUrl == "basicInfoView"){
					if(confirm("유지보수계약 기본정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/contract/write/'+varUrl+'.do';
					} else {
						return false;
					}					
				} else if(varUrl == "productInfoView"){
					if(confirm("유지보수계약 매출계약정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/contract/write/'+varUrl+'.do';
					} else {
						return false;
					}
					
				} else if(varUrl == "salesInfoView"){					
					if("${mtContractCountInfo.mtProductCnt}" > 0){
						if(confirm("유지보수계약 매출정보 화면으로 이동하시겠습니까?")){
							url = '/maintenance/contract/write/'+varUrl+'.do';
						} else {
							return false;
						}
					} else {
						alert(" 유지보수계약 매출계약정보가 등록되지 않았습니다.\n 유지보수계약 매출계약정보를 먼저 등록하세요.");
						return false;
					}					
					
				} else if(varUrl == "backOrderInfoView"){
					if("${parmMtSbCtYn}" == "Y"){
						
						if("${mtContractCountInfo.mtSalesAmountCnt}" > 0){
							if(confirm("유지보수계약 백계약정보 화면으로 이동하시겠습니까?")){
								url = '/maintenance/contract/write/'+varUrl+'.do';
							} else {
								return false;
							}
						} else {
							alert(" 유지보수계약 매출정보가 등록되지 않았습니다.\n 유지보수계약 매출정보를 먼저 등록하세요.");
							return false;
						}						
					} else {
						alert(" 백계약 정보가 N으로 설정되었습니다.\n 기본정보에서 백계약정보를 Y로 변경 후 백계약정보를 등록하세요.");
						return false;
					}					
					
				} else if(varUrl == "purchaseAmountView"){					
					if("${parmMtSbCtYn}" == "Y"){
						if("${mtContractCountInfo.mtBackOrderCnt}" > 0){
							if(confirm("유지보수계약 매입정보 화면으로 이동하시겠습니까?")){
								url = '/maintenance/contract/write/'+varUrl+'.do';
							} else {
								return false;
							}
						} else {
							alert(" 유지보수계약 백계약정보가 등록되지 않았습니다.\n 유지보수계약 백계약정보를 먼저 등록하세요.");
							return false;
						}						
					} else {
						alert(" 백계약 정보가 N으로 설정되었습니다.\n 기본정보에서 백계약정보를 Y로 변경 후 백계약정보를 먼저 등록하세요.");
						return false;
					}
				} else if(varUrl == "writePaymentPlanView"){
					if("${parmMtSbCtYn}" == "Y"){
						if("${mtContractCountInfo.mtBackOrderCnt}" > 0){
							if(confirm("유지보수계약 지급계획정보 화면으로 이동하시겠습니까?")){
								url = '/maintenance/contract/write/'+varUrl+'.do';
							} else {
								return false;
							}
						} else {
							alert(" 유지보수계약 백계약정보가 등록되지 않았습니다.\n 유지보수계약 백계약정보를 먼저 등록하세요.");
							return false;
						}						
					} else {
						alert(" 백계약 정보가 N으로 설정되었습니다.\n 기본정보에서 백계약정보를 Y로 변경 후 백계약정보를 먼저 등록하세요.");
						return false;
					}					
				}
			} else {
				alert(" 유지보수계약 기본정보가 등록되지 않아 화면을 이동할 수 없습니다.");
				return false;
			}
			
			if(url != "") {
				
				var dialogId = 'program_layer';
				var varParam = {
					"mtIntegrateKey": $('#mtIntegrateKey').val(),
					"parmMtSbCtYn":$('#parmMtSbCtYn').val()
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			} else {

				return false;
			}			
		} //end fn_changeView()
		

		
		//이전화면으로 이동
		function fn_prevBtn(){
			if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수계약 매출정보 등록화면으로 이동하시겠습니까?")) {
				var url = '/maintenance/contract/write/salesInfoView.do';
				var dialogId = 'program_layer';
				var varParam = {
						"mtIntegrateKey":$('#mtIntegrateKey').val(),
						"parmMtSbCtYn":$('#parmMtSbCtYn').val()
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			} else {
				return false;
			}
			
		}
		//다음화면으로 이동
		function fn_nextBtn(){
			if("${parmMtSbCtYn}" == "Y"){
				if("${mtContractCountInfo.mtSalesAmountCnt}" > 0){
					if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수계약 백계약정보 등록화면으로 이동하시겠습니까?")) {
						var url = '/maintenance/contract/write/backOrderInfoView.do';
						var dialogId = 'program_layer';
						var varParam = {
								"mtIntegrateKey":$('#mtIntegrateKey').val(),
								"parmMtSbCtYn":$('#parmMtSbCtYn').val()
						}
						var button = new Array;
						button = [];
						showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
					} else {
						return false;
					}
				} else {
					alert(" 유지보수계약 매출정보가 등록되지 않았습니다.\n 유지보수계약 매출정보를 먼저 등록하세요.");
					return false;
				}
			} else {
				alert(" 백계약 정보가 N으로 설정되었습니다.\n 기본정보에서 백계약정보를 Y로 변경 후 백계약정보를 등록하세요.");
				return false;
			}	
			
		}
		
		
		function fn_saveBtn(){
			console.log(document.mtBasicForm.billIssueRule.value)
			if('' !=document.mtBasicForm.billIssueRule.value) {
				if ($("#mtListForm")[0].checkValidity()){
					if(confirm("유지보수 계산서계획정보를 저장 하시겠습니까?")) {
						saveSalesPlanList();
					} else {
						return false;
					}
				} else {
					 //Validate Form
			        $("#mtListForm")[0].reportValidity();	
				}
			} else {
				alert("저장하기 전 계산서 발행구분을 선택하세요!!")
			}
			
			
		}	
		
		function saveSalesPlanList(){
			//var saveUrl;
			var object = {};
			var listObject = new Array();
			var obj = new Object();
           	var formData = $("#mtBasicForm").serializeArray();
           	var listData = $("#mtListForm").serializeObject();
            
           	for (var i = 0; i<formData.length; i++){
                
                object[formData[i]['name']] = formData[i]['value'];
                            
            }
           	//List를 담아준다.			
            object["mtSalesPlanVoList"]=listData;           	
			
			//object["mtWorkProductVoList" = listObject];
           	var sendData = JSON.stringify(object);
           	//console.log("sendData11=====>"+sendData);
           	//console.log("listData=====>"+listData);
           	$.ajax({
	        	url:"/maintenance/contract/write/writeSalesPlan.do",
	            dataType: 'text', 
	            type:"post",  
				data: sendData,
				
	            traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.
	            
	     	   	contentType: "application/json; charset=UTF-8", 
	     	  	beforeSend: function(xhr) {
	     	  		
	        		xhr.setRequestHeader("AJAX", true);	        		
	        	},
	            success:function(data){	
	            	var paramData = JSON.parse(data);
	            	console.log("paramData.successYN==>"+paramData.successYN);
	            	console.log("paramData==>"+paramData);
	            	if("Y" == paramData.successYN){
	            		alert("유지보수 계산서계획 정보 저장을 성공하였습니다.");
	            		//유지보수작업 발주 등록화면으로 이동
	            		var url='/maintenance/contract/write/writeSalesPlanView.do';
	            		            			
		    			var dialogId = 'program_layer';
		    			var varParam = paramData
		    			var button = new Array;
		    			button = [];
		    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
	            	} else {
	            		alert("유지보수 계산서계획 정보 저장을 실패하였습니다.");
	            	}
	            	
	            	
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        });		
		}//end saveSalesPlanList()
		
		function fn_billDate() {
			var billDate = document.getElementsByName("salesBillFcDt");
			var yearVal;
			var monthVal;
			var lastDay;
			var calcuDay;
			 $("input[name='salesBillFcDt']").each(function (i) {
				 //console.log( i + "번째 월 : " + $("input[name='salesYearMonth']").eq(i).attr("value")+"/"+  $("input[name='salesBillFcDt']").eq(i).attr("value") );
				 if($('#billDay').val()*1>28) {
					 yearVal = $("input[name='salesYearMonth']").eq(i).attr("value").substr(0,4);
					 monthVal = $("input[name='salesYearMonth']").eq(i).attr("value").substr(5,2)
					 lastDay = new Date(yearVal, monthVal,0).getDate();
					 //console.log( i + "번째 월 : " + $("input[name='salesYearMonth']").eq(i).attr("value")+"/"+ yearVal +"/"+ monthVal+"/"+ lastDay );
					 if($('#billDay').val()*1>lastDay*1) { //마지막 일자보다 크면 마지막 일자를 셋팅한다.
						 //$("input[name='salesBillFcDt']").eq(i).attr("value",$("input[name='salesYearMonth']").eq(i).attr("value")+"-"+lastDay);
						 calcuDay = $("input[name='salesYearMonth']").eq(i).attr("value")+"-"+lastDay;
					 } else {
						 //$("input[name='salesBillFcDt']").eq(i).attr("value",$("input[name='salesYearMonth']").eq(i).attr("value")+"-"+$('#billDay').val());
						 calcuDay = $("input[name='salesYearMonth']").eq(i).attr("value")+"-"+$('#billDay').val();
					 }
					 
				 } else {
					 //$("input[name='salesBillFcDt']").eq(i).attr("value",$("input[name='salesYearMonth']").eq(i).attr("value")+"-"+$('#billDay').val());
					 calcuDay = $("input[name='salesYearMonth']").eq(i).attr("value")+"-"+$('#billDay').val();
				 }
				 $("input[name='salesBillFcDt']").eq(i).val(calcuDay);
			 });

				 
			//console.log("billDate===>"+billDate.length);
		} //end fn_billDate()
		

		
		function fn_collectDate() {
			var billDate = document.getElementsByName("salesBillFcDt");
			var yearVal;
			var monthVal;
			var calcuDate; //월계산
			var addMonthVal = $('#collectMonth').val()*1;
			var lastDay;
			var calcuYear;
			var calcuMonth;
			var calcuDay;
			console.log("addMonthVal===>"+addMonthVal);
			 $("input[name='salesCollectFcDt']").each(function (i) {
				 console.log("======>"+$("input[name='salesBillFcDt']").eq(i).val());
				 if($("input[name='salesBillFcDt']").eq(i).val().length==10) {
					
					 //console.log( i + "번째 월 : " + $("input[name='salesBillFcDt']").eq(i).attr("value")+"::"+$("input[name='salesBillFcDt']").eq(i).attr("value").substr(0,4)+"::" + $("input[name='salesBillFcDt']").eq(i).attr("value").substr(5,2)+"::");
					 yearVal = $("input[name='salesBillFcDt']").eq(i).val().substr(0,4);
					 monthVal = $("input[name='salesBillFcDt']").eq(i).val().substr(5,2);
					 calcuDate = new Date(yearVal, monthVal,1);
					
					 console.log("calcuDate.getMonth()===>"+calcuDate.getMonth()+"/"+monthVal*1);
					 calcuDate.setMonth(calcuDate.getMonth()+addMonthVal);
					 
					 if(calcuDate.getMonth()==0) {
						 calcuYear = calcuDate.getFullYear()*1 -1;
						 calcuMonth = 12;
					 } else if(calcuDate.getMonth()<10) {
						 calcuYear = calcuDate.getFullYear()
						 calcuMonth = "0"+calcuDate.getMonth();
					 } else {
						 calcuYear = calcuDate.getFullYear()
						 calcuMonth = calcuDate.getMonth();
					 }
					 
					 if($('#collectDay').val()*1>28) {
						 
						 //console.log( i + "번째 월 : " + $("input[name='salesYearMonth']").eq(i).attr("value")+"/"+ calcuDate.getFullYear() +"/"+ calcuDate.getMonth()+"/"+ calcuDate.getDate() );
						 lastDay = new Date(calcuDate.getFullYear(), calcuDate.getMonth(),0).getDate();
						 //console.log( i + "번째 월 : " + $("input[name='salesBillFcDt']").eq(i).attr("value")+"::"+ calcuDate.toLocaleDateString()+"::"+ calcuDate.getFullYear() +"/"+ calcuDate.getMonth()+"/"+ lastDay );
						 
						 
						 
						 if($('#collectDay').val()*1>lastDay*1) { //마지막 일자보다 크면 마지막 일자를 셋팅한다.
							 //$("input[name='salesCollectFcDt']").eq(i).attr("value",calcuYear +"-"+calcuMonth+"-"+lastDay);
							 calcuDay = calcuYear +"-"+calcuMonth+"-"+lastDay;
							 //$("input[name='salesCollectFcDt']").eq(i).val(calcuYear +"-"+calcuMonth+"-"+lastDay);
						 } else {
							 //$("input[name='salesCollectFcDt']").eq(i).attr("value",calcuYear +"-"+calcuMonth+"-"+$('#collectDay').val());
							 calcuDay = calcuYear +"-"+calcuMonth+"-"+$('#collectDay').val();
						 }
						 
					 } else {
						 calcuDay = calcuYear +"-"+calcuMonth+"-"+$('#collectDay').val();
						 //$("input[name='salesCollectFcDt']").eq(i).attr("value",calcuYear +"-"+calcuMonth+"-"+$('#collectDay').val());
					 }
					 $("input[name='salesCollectFcDt']").eq(i).val(calcuDay);
				 }
				 
			 });

				 
			//console.log("billDate===>"+billDate.length);
		}
		
		//등록된 거래처 정보를 선택하면 해당 등록 내역을 가져온다.
		$('#mtSaveOrderAcKey').change(function(){
			var url = '/maintenance/contract/write/writeSalesPlanView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":$('#mtIntegrateKey').val(),
					"mtSalesOrderKey":$('#mtSaveOrderAcKey option:selected').val(),
					"parmMtSbCtYn":$('#parmMtSbCtYn').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			
		});
	</script>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">유지보수 등록</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
					<li class="colorWhite cursorP" onclick="fn_changeView('basicInfoView');">기본정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('productInfoView');">매출계약정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('salesInfoView');">매출정보</li>	
					<li class="colorWhite cursorP on">계산서계획정보</li>	
					<c:if test="${parmMtSbCtYn eq 'Y' }">		
					<li class="colorWhite cursorP" onclick="fn_changeView('backOrderInfoView');">백계약정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('purchaseAmountView');">매입정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('writePaymentPlanView');">지급계획정보</li>
					</c:if>
			</ul>
		</div>
		<form action="/" id="mtBasicForm" name="mtBasicForm" method="post"> 
			<input type="hidden" id="parmMtSbCtYn" name="parmMtSbCtYn" value="<c:out value="${parmMtSbCtYn}"/>" />
			<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${mtIntegrateKey}"/>" />
			<input type="hidden" id="mtSalesOrderKey" name="mtSalesOrderKey" value="<c:out value="${mtSalesOrderKey}"/>" />
			<div class="contents">
				<div class="subjectContainer">
					<table class="subject2">
						<tr>		
							<td class="subTitle" style="border: none;">
								<label class="ftw400">매출 계산서계획정보</label>
								<select id="mtSaveOrderAcKey" name="mtSaveOrderAcKey">																		
									<c:forEach var="order" items="${salesOrderSelectBox}" varStatus="status">
											<option value="<c:out value="${order.mtSalesOrderKey}"/>"><c:out value="${order.mtAcNm}"/></option>
									</c:forEach>									
								</select>
							</td>
							<td style="width:136px; border: none; text-align:right; color: #32bc94; font-size: 15px;padding-top: 20px">
								매출 총금액 : 
								<input type="text" id="mtSaleTotalAmount" style="width:120px;text-align: right;color: #32bc94;" class="pname" value="<c:out value="${displayUtil.commaStr(mtSalesTotalAmount)}"/>" readonly/>
							</td>
							<%-- <td class="subBtn" style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable('sales');"/></td> --%>
						</tr>
					</table>
					<table class="textalignC ftw200" >
						<tr>							
							<td class="tdTitle" style="width:86px">계산서일자 일괄등록</td>
							<td class="tdContents" style="text-align:left;width:145px;">
								<select id="billDay" style="width:147px;height:27px;">
								<c:forEach var="day" begin="1" end="31">
									<c:if test='${day <9}'>
									<option value="0<c:out value="${day}" />">0<c:out value="${day}" />일</option>
									</c:if>
									<c:if test='${day >9}'>
									<option value="<c:out value="${day}" />" <c:if test='${day == 25}'>selected </c:if>><c:out value="${day}"/>일</option>
									</c:if>
								</c:forEach>
									
								</select>
								<button type="button" title="계산서발행일자적용" class="blueBtnStyle" onclick="fn_billDate()">적용</button>
							</td>
							<td class="tdTitle"><label style="color: red;vertical-align: middle;">*</label>계산서발행구분<span class="help" data-tooltip-text="계산서 발행일이 평일이 아닌 경우 계산서일자의 '이전' 또는 '이후'평일을 선택하며 '해당일'은 계산서일자로 발행"><img src="/images/icon_help.png" /></span></td>
							<td class="tdContents" >
								<input type="radio" class="tRadio" name="billIssueRule" value="BF" id="billIssueRule1" /><label for="billIssueRule1" class="cursorP"></label>&nbsp;이전일
								&nbsp;&nbsp;&nbsp;
								<input type="radio" class="tRadio" name="billIssueRule" value="BD" id="billIssueRule2" /><label for="billIssueRule2" class="cursorP"></label>&nbsp;해당일
								&nbsp;&nbsp;&nbsp;
								<input type="radio" class="tRadio" name="billIssueRule" value="AF" id="billIssueRule3" /><label for="billIssueRule3" class="cursorP"></label>&nbsp;이후일
							</td>
						</tr>
						<tr>							
							<td class="tdTitle" style="width:148px">수금예정일자 일괄등록</td>
							<td class="tdContents" style="text-align:left" colspan="3">
								<select id="collectMonth" style="width:80px;height:27px;">
									<option value="0" selected>당월</option>
									<option value="1" >다음월</option>
									<option value="2" >다다음월</option>
								</select>
								<select id="collectDay" style="width:64px;height:27px;">
								<option value="31" selected>말일</option>
								<c:forEach var="day" begin="1" end="31">
									<c:if test='${day <9}'>
									<option value="0<c:out value="${day}" />">0<c:out value="${day}" />일</option>
									</c:if>
									<c:if test='${day >9}'>
									<option value="<c:out value="${day}" />" <c:if test='${day == 25}'> </c:if>><c:out value="${day}"/>일</option>
									</c:if>
								</c:forEach>
									
								</select>
								<button type="button" title="수금예정일자적용" class="blueBtnStyle" onclick="fn_collectDate()">적용</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
			</form>
			<form action="/" id="mtListForm" name="mtListForm" method="post">
			<div class="contents1">
				<div id="salesWrap">
					<%-- <div class="subjectContainer">
						<table class="subject">
							<tr>		
								<td class="subTitle" style="border-top: none;">
									<label class="ftw400">매출 계산서계획정보</label>
								</td>
								<td style="width:136px; text-align:right; color: #32bc94; font-size: 15px">
									매출 총금액 : 
									<input type="text" id="mtSaleTotalAmount" style="width:120px;text-align: right" class="pname" value="<c:out value="${displayUtil.commaStr(mtSalesTotalAmount)}"/>" readonly/>
								</td>
								<td class="subBtn" style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable('sales');"/></td>
							</tr>
						</table>
					</div> --%>
					<div class="floatC middle">
						<table class="dtl" >
							<thead class="ftw400">
								<tr>
									<th scope="row">매출회차</th>
									<th scope="row">회차월</th>
									<th scope="row">회차비율</th>
									<th scope="row" style="text-align: center">회차금액</th>
									<th scope="row">계산서발행요청일</th>
									<th scope="row">수금예정일</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="list" items="${salesPlanList}" varStatus="status">
								<tr>
									<td>										
										<input type="hidden" id="saleList-<c:out value="${status.index}"/>-salesKey" name="salesKey" value="<c:out value="${list.salesKey}"/>"/>	
										<input type="hidden" id="saleList-<c:out value="${status.index}"/>-salesCtFkKey" name="salesCtFkKey" value="<c:out value="${list.salesCtFkKey}"/>"/>	
										<input type="hidden" id="saleList-<c:out value="${status.index}"/>-salesTurn" name="salesTurn" value="<c:out value="${list.salesTurn}"/>"/>
										<input type="hidden" id="saleList-<c:out value="${status.index}"/>-salesYearMonth" name="salesYearMonth" value="<c:out value="${displayUtil.displayDate(list.salesYearMonth)}"/>" />
										<input type="hidden" id="saleList-<c:out value="${status.index}"/>-salesTurnAmount" name="salesTurnAmount" value="<c:out value="${displayUtil.commaStr(list.salesTurnAmount)}"/>" readonly/>
										<c:out value="${list.salesTurn}"/> 회차
									</td>
									<td><c:out value="${displayUtil.displayDate(list.salesYearMonth)}"/></td>
									<td><input type="text" id="saleList-<c:out value="${status.index}"/>-salesCollectRate" name="salesCollectRate" value="<c:out value="${list.salesCollectRate}"/>" style="text-align: right;" amountOnly required/> % </td>
									<td class="textalignR"><c:out value="${displayUtil.commaStr(list.salesTurnAmount)}"/>&nbsp;&nbsp;</td>
									<td><input type="text" id="saleList-<c:out value="${status.index}"/>-salesBillFcDt" name="salesBillFcDt"  class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(list.salesBillFcDt)}"/>" required/></td>
									<td><input type="text" id="saleList-<c:out value="${status.index}"/>-salesCollectFcDt" name="salesCollectFcDt"  class="calendar toDt" value="<c:out value="${displayUtil.displayDate(list.salesCollectFcDt)}"/>" required/></td>
								</tr>
								
							</c:forEach>
							</tbody>
						</table>
					</div>					
				</div>
				<div class="btnWrap floatL">
					<div class="floatL">
						<button type="button" onclick="fn_prevBtn();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					</div>
					<div class="floatL btnCenter">
						<button type="button" onclick="fn_saveBtn();"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<c:choose>
						<c:when test="${parmMtSbCtYn eq 'Y' and mtContractCountInfo.mtSalesAmountCnt>0}">
					<div class="floatR" >
						<button type="button" onclick="fn_nextBtn();"><img src="<c:url value='/images/btn_next.png'/>"/></button>
					</div>
						</c:when>
						<c:otherwise>
					<div class="floatR" >
						<img src="<c:url value='/images/btn_non_next.png'/>"/>
					</div>						
						</c:otherwise>
					</c:choose>
					<%-- <c:if test="${parmMtSbCtYn eq 'Y' and mtContractCountInfo.mtSalesAmountCnt>0}">	
					<div class="floatR" >
						<button type="button" onclick="fn_nextBtn();"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div>
					</c:if> --%>
				<%-- <c:choose>
					<c:when test="${parmMtSbCtYn eq 'Y' }">
						<div id="saveNextBtn" class="floatR" onclick="fn_saveBtn('sn');" >
							<button type="button"><img src="<c:url value='/images/btn_next.png'/>" /></button>
						</div>						
					</c:when>
					<c:otherwise>
						<div class="floatR" onclick="fn_saveBtn('ss');">
							<button type="button"><img src="<c:url value='/images/btn_save.png'/>" /></button>
						</div>				
					</c:otherwise>
				</c:choose>	 --%>	
					<div class="floatN floatC"></div>
				</div>
			</div>		
		</form>
	</div>
</body>
</html>