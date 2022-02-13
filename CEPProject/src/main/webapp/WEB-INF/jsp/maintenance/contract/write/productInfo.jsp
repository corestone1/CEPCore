<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>프로젝트 제품목록</title>
	<style>
		/* .firstTd {			
			border-top: 2px solid #e5e5e5;	
			padding-top: 6px;
		} */
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
		.popContainer .contents {
			position: absolute;
			/* width: calc(100% - 201px); */
			width : 943px;
			height: 601px;
			top: 107px;
			left: 201px;			
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto;
		}
		
		.popContainer .contents #prodWrap {
			margin: 0px 47px 0 45px;
			width: 870px;			
			height: 255px;
			/* 
			top: 107px;
			left: 201px;	 		
			z-index: 3;*/
			background-color: #f6f7fc;
			overflow-x: hidden;
			overflow-y: auto;
		}
		.popContainer .contents > div {
			margin: 10px 54px 0 45px;
			width: 850px;
		}
		.popContainer .contents .subjectContainer {
			margin: -15px 47px 0 45px;
		}
		.popContainer .contents .subject {
			width: 850px;
			border-bottom: 2px solid #e5e5e5;
			padding-bottom: 9px;
		}
		.popContainer input[class="search"] {
			height: 34px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents select {
			width: 100px;
			height: 35px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.popContainer .contents select.wdts {
			width: 135px;
		}
		.popContainer input {
			width: 145px;
			/* height: 38px; */
			height: 31px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents2 input[class="numberTy"] {
			width: 27px;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 130px;
		}
		.popContainer .contents td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer td.tdTitle {
			margin-top: 11px;
			font-size: 15px;
			color: #525252;
			padding-left: 5px;
			padding-right: 5px;
			width: 96px;
		}				
		.popContainer td.tdContents {
			width: 174px;
			font-size: 14px;
		} 				
		.popContainer .contents tr:nth-child(1) td {
			padding-top: 10px;
		} 
		.popContainer .contents td.subTitle {
			font-size: 18px;
			padding-right: 20px;
			width: 56px;
			padding-top: 20px;
			padding-bottom: 5px;
		}	
		.popContainer .contents textarea {
			width : 717px !important;
			height: 53px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			/* resize: none; */
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
		.popContainer .contents .btnWrap {
			margin : 35px 0px 15px 45px;
			width : 856px;
		}
		.popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
      	}
		.calculate {
			text-align: right !important;
		}
		.btnCenter {
			width : calc(100% - 46px);
			text-align: center;
		}
		.popContainer .prodTable table {
			border-bottom : 2px solid #e5e5e5;
			width : 844px;
			table-layout: fixed;
		}
		
		.popContainer .contents .subject1, .popContainer .contents .subject2 {
			width: 846px;
			background-color: #f6f7fc;		
			margin-bottom: -5px;
				
			/* position: fixed; */
		} 
		/* 거래처 스크롤 위치지정 */
		#m_div_accountList {
			left: 155px;
    		margin-top: 46px;
		}
	</style>
	
	<script>
		$(document).ready(function() {
			/*
			처음 로딩시  저장된 리스트가 2개보다 많으면  모두 접는다.
			1개까지는 스크롤바가 생성되지 않음.
			*/
			'<c:if test="${listCount > 1 }">'
			fn_viewSummaryUpAll();
			'</c:if>'
			

			'<c:if test="${basicContractInfo.mtProjectLinkVo.mtLinkKey != null }">'
				$('#pj_delete_forecast').show();
			'</c:if>'
			
			// 등록된 거래처 selectBox 맵핑.
			if(parseInt('${salesOrderSelectBox.size()}') >0 ){
				$('#mtSaveOrderAcKey').val("${mtSalesOrderVO.mtSalesOrderKey}").attr("selected", "true");
			}
			/*
				제품추가 시 
				제품 삭제시
			*/
			fn_calculate();
			

			//거래처 검색
			$("#mtSalesAcNm").on("keydown", function(event){
				
				if(event.keyCode == 13) {		
					
					fnSearchAccoutList(this, $(this).val());
				}						
			});
		});
		

		//매출 거래처 검색
		function fnSearchAccoutList(pObject, pstAccountNm) {
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
		/* var fnViewAccountList = function(pObject, pjAccountList){ */
			function fnViewAccountList(pObject, pjAccountList){
			/* var html = '<div id="div_accountList" style="width:179px; padding-top: 7px; margin-left: 112px; padding-bottom: 7px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1); position: absolute;">' */
			var html = '<div id="m_div_accountList" >'         
				+ '<ul class="m_accountList">'
			       ;//+ '<div style="margin: 5px;">';
			       
			       for(var i=0; i < pjAccountList.length; i++) {			    	  
			    	   //console.log("=====>"+pjAccountList[i].acKey+" / "+pjAccountList[i].acNm)
			    	   html += '<li id="m_li_account" title="'+ pjAccountList[i].acKey +'">' + pjAccountList[i].acNm + '</li>';
			    	}
			       
			       
			    html +=  '</ul>'
			          + '</div>'
			         ;//+ '</div>';
			//$('#td_account').after(html);
			$('#tr_account').after(html);
			
			
			$("[id^='m_li_account']").click(function(event) {
				
				$('#mtSalesAcNm').val(this.innerText); 
				$('#mtSalesAcKey').val(this.title);
				$('#mtSalesAcKey').change();
				$('#m_div_accountList').remove();
			});
		};
		
		//등록된 거래처 정보를 선택하면 해당 등록 내역을 가져온다.
		$('#mtSaveOrderAcKey').change(function(){
			
			/* if("Y" == $('#sbCtYn option:selected').val()){
				$('#back_order').show();
				$('#back_buy').show();
			} else {
				$('#back_order').hide();
				$('#back_buy').hide();
			} */
			
			console.log("==================>"+$('#mtSaveOrderAcKey option:selected').val()+"/"+$('#mtSaveOrderAcKey option:selected').text());
			var url = '/maintenance/contract/write/productInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":$('#mtIntegrateKey').val(),
					"selectKey":$('#mtSaveOrderAcKey option:selected').val(),
					"parmMtSbCtYn":$('#parmMtSbCtYn').val(),
					"mtSalesAcNm":$('#mtSaveOrderAcKey option:selected').text()
			}
			var button = new Array;
			button = [];
			// /* showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  */
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			
		});
		
		/* 고객사 선택하면 고객담당자 정보 가져오기. */
		$('#mtSalesAcKey').change(function(){
			var checkOrder = false;
			var selectKey;
			$('#mtSaveOrderCheck option').each(function() { 
				if (this.value == $('#mtSalesAcKey').val()) { 
					checkOrder = true;
					selectKey = this.text;
					return false;
				}
			});
			//console.log("checkOrder==========="+checkOrder+" / "+ selectKey);
			if(checkOrder){
				//등록된 매출계약 업체가 있는 경우 해당 거래처를 불러온다.
				if(confirm("등록된 거래처가 있습니다. 해당 거래처를 불러오시겠습니까?")){
					var url = '/maintenance/contract/write/productInfoView.do';
					var dialogId = 'program_layer';
					var varParam = {
							"mtIntegrateKey":$('#mtIntegrateKey').val(),
							"selectKey":selectKey ,
							"parmMtSbCtYn":$('#parmMtSbCtYn').val()
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
				} else {
					//해당 거래처 정보를 지운다.
					$('#mtSalesAcNm').val("");
					$('#mtSalesAcKey').val("");
				}
			} else {
				$.ajax({
		        	url:"/maintenance/contract/selectAcDirectorList.do",
		            dataType: 'json',
		            type:"post",  
		            data: $('#mtSalesAcKey').val(),
		     	   	contentType: "application/json; charset=UTF-8",
		     	  	beforeSend: function(xhr) {
		        		xhr.setRequestHeader("AJAX", true);
		        		//xhr.setRequestHeader(header, token);
		        	},
		            success:function(data){		            	
						if ( data.acDirectorList.length > 0 ) {						
							$ ('#mtSalesAcDirectorKey' ).find ( 'option' ).remove (); // select box 의 ID 기존의  option항목을 삭제 
							for ( var idx = 0 ; idx < data.acDirectorList.length ; idx++ ) {
	                    		$ ('#mtSalesAcDirectorKey' ).append ( "<option value='"+data.acDirectorList[idx].acDirectorKey+"'>" + data.acDirectorList[idx].acDirectorNm + '</option>' );
	                  		}
		                }else{
		                	acDirectorList = null;
							$ ( '#mtSalesAcDirectorKey' ).find ( 'option' ).remove ();
		                 	$ ( '#mtSalesAcDirectorKey' ).append ( "<option value=''>담당자</option>" );
		                }
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		        });
			}
			
		}); 
		/**
		*  화면을 이동시킨다.
		*  @param {string} varUrl 이동해야할 url
		*/
		function fn_changeView(varUrl) {
			var url;
			/* var reqProductTotalAmount=0;
			//등록된 제품의 전체 total값을 구한다..
			$(".productTotalAmount").each(function(){
				reqProductTotalAmount = reqProductTotalAmount+removeData($(this).val(),",")*1;				
			}); */
			
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
					
				} else if(varUrl == "writeSalesPlanView"){				
					if("${mtContractCountInfo.mtProductCnt}" > 0){
						if(confirm("유지보수계약 계산서계획정보 화면으로 이동하시겠습니까?")){
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
			//console.log("url===>"+url);
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
								
							if(this.name=="mtPmQuantity" || this.name=="mtPmUprice" || this.name=="totalAmount"){
								//숫자에서 컴마를 제거한다.
								obj[this.name] = removeCommas(this.value); 
							} else if(this.name.split('-')[2]=="mtPmStartDt" || this.name.split('-')[2]=="mtPmEndDt") {
								//이름에서 prodList-0-를 제거하고 날짜값에서 -를 제거한다.
								obj[this.name.split('-')[2]] =  removeData(this.value,"-"); 
							} else {
								obj[this.name] = this.value; 
							}
							
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('remark' == this.name){
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
		/* 제품 유지보수 기간과 기본정보 유지보수 기간을 체크한다.*/
		jQuery.fn.checkPmDate = function() {
			var checkDate = '';
			var contractDate =addDateMinus($('#mtContFromDate').val())+" ~ "+addDateMinus($('#mtContEndDate').val());
			var startDate;
			try {
				//console.log("contractDate====>"+contractDate);
				if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
					var arr = this.serializeArray(); 
					if(arr){							
						jQuery.each(arr, function() {
							if(''==checkDate) {
								//console.log("this.name====>"+this.name);
								if('mtPmStartDt' == this.name.split('-')[2]){
									//console.log("mtPmStartDt====>"+this.name);
									//startDate = removeData(this.value,'-')*1;
									startDate = this.value;
									//console.log("mtPmStartDt00000====>"+$('#mtContFromDate').val()+" / "+removeData(this.value,'-')+" / "+this.value+" / "+$('#mtContEndDate').val()+"/"+($('#mtContEndDate').val()*1 < removeData(this.value,'-')*1));
									//console.log("====>"+(false || true) +"/"+(true || true)+"/"+(false || false)+"/"+(true || false))
									if(($('#mtContFromDate').val()*1 > removeData(this.value,'-')*1) | ($('#mtContEndDate').val()*1 < removeData(this.value,'-')*1)) {
										checkDate = this.value+"일자는 계약기간 범위("+contractDate+")에 있지 않습니다. \n확인 후 다시 등록하세요!!";
										//console.log("this.name1111======>"+this.name+" / "+this.value)
										//접혀있으면 포커스 이동이 안되므로 모두 펼친다.
										fn_viewSummaryDownAll();
										$( "#"+this.name ).focus();
										
										return checkDate;
										
									} else {
										//console.log("mtPmStartDt11====>"+$('#mtContFromDate').val()+" / "+removeData(this.value,'-')+" / "+this.value+" / "+$('#mtContEndDate').val()+"/"+($('#mtContEndDate').val()*1 < removeData(this.value,'-')*1));
									}
								} else if('mtPmEndDt' == this.name.split('-')[2]) {

									//console.log("mtPmEndDt====>"+this.name);
									if($('#mtContEndDate').val()*1 < removeData(this.value,'-')*1) {
										checkDate = this.value+"일자는 계약기간 범위("+contractDate+")에 있지 않습니다. \n확인 후 다시 등록하세요!!";
										//접혀있으면 포커스 이동이 안되므로 모두 펼친다.
										fn_viewSummaryDownAll();
										//console.log("this.name222======>"+this.name+" / "+this.value)
										$( "#"+this.name ).focus();
										return checkDate;
									} else if(removeData(startDate,'-')*1 > removeData(this.value,'-')*1) {
										checkDate = this.value+"일자는 시작일자("+startDate+")보다 이전날짜입니다.. \n확인 후 다시 등록하세요!!";
										//접혀있으면 포커스 이동이 안되므로 모두 펼친다.
										fn_viewSummaryDownAll();
										$( "#"+this.name ).focus();
										return checkDate;
									} else {
										//console.log("mtPmEndDt111====>"+$('#mtContEndDate').val()+" / "+removeData(this.value,'-')+" / "+this.value);
									}
								}
							} else {
								//break;
							}

						}); 	              
					} 
				} 
			}catch(e) { 
				alert(e.message); 
			}finally {} 
			return checkDate; 
		}
		
		/* 
			매출정보데이타 업데이트 여부를 확인한다.
			1. 제품별  전체금액이 달라진 경우
			2. 제품별 유지보수 월이 달라진 경우.
		*/
		jQuery.fn.salesUpadteYn = function() {
			var salesUpadteAmountYn = 'N';		
			var totalAmount;
			var startDate;
			var endDate;	
			var beforeTotalAmount;
			var beforeStartDate;
			var beforeEndDate;
			try {
				//console.log("contractDate====>"+contractDate);
				if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
					var arr = this.serializeArray(); 
					if(arr){							
						jQuery.each(arr, function() {
							if('N'==salesUpadteAmountYn) {
								//console.log("this.name====>"+this.name);
								//기존에 입력된 데이타(수정전 데이타.)
								if('beforeTotalAmount' == this.name){ 
									beforeTotalAmount = this.value;	
								} else if('beforeMtPmStartDt' == this.name){
									beforeStartDate = this.value;									
								} else if('beforeMtPmEndDt' == this.name) {
									beforeEndDate = this.value;
								}
								//현재 입력된 데이타(수정된 데이타.)
								if('totalAmount' == this.name){ 
									totalAmount = this.value;	
								} else if('mtPmStartDt' == this.name.split('-')[2]){
									startDate = this.value;									
								} else if('mtPmEndDt' == this.name.split('-')[2]) {
									endDate = this.value;
								}
								
								if('remark' == this.name){
									//console.log("===>"+beforeTotalAmount+"("+totalAmount+"), "+beforeStartDate+"("+startDate+"), "+beforeEndDate+"("+endDate+")");
									//console.log("===>"+beforeTotalAmount+"("+totalAmount+"), "+beforeStartDate.substr(0,7)+"("+startDate.substr(0,7)+"), "+beforeEndDate.substr(0,7)+"("+endDate.substr(0,7)+")");
									if(beforeTotalAmount !=totalAmount ) {
										//console.log("전체금액이 달라지면 매출정보 업데이트");
										//전체금액이 달라지면 매출정보 업데이트
										salesUpadteAmountYn = "Y";
									} else if(beforeStartDate.substr(0,7) != startDate.substr(0,7)) {
										//console.log("시작월이  달라지면 매출정보 업데이트");
										//시작월이  달라지면 매출정보 업데이트
										salesUpadteAmountYn = "Y";
									} else if(beforeEndDate.substr(0,7) != endDate.substr(0,7)) {
										//console.log("종료월이  달라지면 매출정보 업데이트");
										//종료월이  달라지면 매출정보 업데이트
										salesUpadteAmountYn = "Y";
									}
									beforeTotalAmount ='';
									beforeStartDate ='';
									beforeEndDate ='';
									totalAmount='';
									startDate ='';
									endDate ='';
									
								}
								
							} else {
								//break;
								return salesUpadteAmountYn;
							}

						}); 	              
					} 
				} 
			}catch(e) { 
				alert(e.message); 
			}finally {} 
			return salesUpadteAmountYn; 
		}
		
		
		function fn_addInfoTable() {
			
			var type = "prod";
			var originLength = $('#'+type+'Length').val()*1-1;
			
			var lastNum = $("input[name='lastNum']").get($("input[name='lastNum']").length-1).getAttribute('value')*1;
			
	    	$('#'+type+'Length').val($('#'+type+'Length').val()*1 + 1);
	    	
	    	var clones = $('.'+type+'Table').clone();
	    	var clone = new jQuery.fn.init(clones[clones.length - 1]);
			
	    	var str = "";
	    	var nameArr = new Array();
	    	var idArr = new Array();
	    	var forArr = new Array();
	    	var classArr = new Array(); // 접기펴기
	    	
	    	var tr = $('.'+type+'Table tr');
	    	var td = tr.children().children();
	    	
	    	/* var cls = $('.'+type+'Table');
	    	var clscs = cls.children();
	    	console.log("clscs.length===>"+clscs.length);
	    	
	    	for(var i = 0; i < clscs.length; i++) {
	    		console.log("clscs.[i]===>"+JSON.stringify(clscs[i]));
	    	} */
	    	
	    	for(var i = 0; i < td.length; i++) {
	    		if(td[i].getAttribute('name') != null && td[i].getAttribute('name') != undefined && td[i].getAttribute('name') != "" && td[i].getAttribute('name').length != 0) {
	    			nameArr.push(td[i].getAttribute('name')); 	    			
	    		}
	    		if(td[i].getAttribute('id') != null && td[i].getAttribute('id') != undefined && td[i].getAttribute('id') != "" && td[i].getAttribute('id').length != 0) {
	    			idArr.push(td[i].getAttribute('id')); 	    			
	    		}
	    		if(td[i].getAttribute('for') != null && td[i].getAttribute('for') != undefined && td[i].getAttribute('for') != "" && td[i].getAttribute('for').length != 0) {
	    			forArr.push(td[i].getAttribute('for')); 	    			
	    		}
	    		if(td[i].getAttribute('for') != null && td[i].getAttribute('for') != undefined && td[i].getAttribute('for') != "" && td[i].getAttribute('for').length != 0 && td[i].getAttribute('class').includes('calendar')) {
	    			$(this).attr('id','');
	    		} 

	    		//if(td[i].getAttribute('class') != null && td[i].getAttribute('class') != undefined && td[i].getAttribute('class') != "" && td[i].getAttribute('class').length != 0) {
	    		//	classArr.push(td[i].getAttribute('class')); 	    			
	    		//}
	    	}
	    	
	    	var name = type + 'List-' + (lastNum+1) + '-';    	
	    	   	
	    	for(var i = 0; i < classArr.length; i++) {
	    		clone.find('input[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val("");
	    	}
	    	
	    	//name 필드 값 변경 및 값 초기화	    	
	    	for(var i = 0; i < nameArr.length; i++) {
	    		var splitName = nameArr[i].split('-')[2];   			
	    		
	    		//값 초기화
	    		clone.find('input[name="lastNum"]').val(lastNum+1);
				clone.find('input[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val("");
				clone.find('textarea[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 
				clone.find('select[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val("");		
				clone.find('hidden[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 
				
				//날짜필드값 변경
				clone.find('input[name="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('name', name + splitName).val("");
	    	} 
	    	
	    	for(var i = 0; i < idArr.length; i++) {
	    		var splitName = idArr[i].split('-')[2];
				clone.find('input[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);	
				clone.find('textarea[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);	
				clone.find('img[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);	
	    	} 
	    	
	    	for(var i = 0; i < forArr.length; i++) {
	    		
	    		var splitName = forArr[i].split('-')[2];				
				clone.find('label[for="'+ type + 'List[' + lastNum + ']-' + splitName+'"]').attr('for', name + splitName);				
	    	} 
	    	
	    	//펼쳐서 보여주기
	    	clone.find('.dpNone').attr('class', 'dpTbRow');
	    	clone.find('.up').attr('class', 'down').attr('src', '/images/arrow_up.png');
	    	
	    	$('#'+type+'Wrap').append(clone);
	    	fn_calculate();
		}
		
		/* 제품정보 접기/펴기*/
		function fn_viewSummary(obj) {
	         var tbody = obj.parentNode.parentNode.parentNode;
	         var jtbody = $(tbody);
	         var className = obj.getAttribute('class');
	         
	         if(className === "down") {
	            jtbody.find(".dpTbRow").attr('class','dpNone');
	            obj.src = "<c:url value='/images/arrow_down.png'/>";
	            obj.className = "up";
	         } else {
	            jtbody.find(".dpNone").attr('class','dpTbRow');
	            obj.src = "<c:url value='/images/arrow_up.png'/>";
	            obj.className = "down";
	         }
		} 
		
		/* 제품정보 삭제*/
		function fn_delete(obj, type) {
/* 			var table = obj.parentNode.parentNode.parentNode.parentNode.parentNode;
			var nextTable = $(obj.parentNode.parentNode.parentNode.parentNode.parentNode).nextAll();
			var tr = nextTable.children().children().children();
			var td = tr.children().children();
	
			var nameArr = new Array();
			
			for(var i = 0; i < td.length; i++) {
	    		if(td[i].getAttribute('name') != null && td[i].getAttribute('name') != undefined && td[i].getAttribute('name') != "" && td[i].getAttribute('name').length != 0) {
	    			nameArr.push(td[i].getAttribute('name')); 	   
	    		}
	    	} */
	    	var listNum;
			var productName;
			var serialNum;
			var deleteKey;
	    	var table = obj.parentNode.parentNode.parentNode.parentNode.parentNode;
			var selectNum = JSON.stringify($(obj.id).selector);
			var originLength = $('#'+type+'Length').val()*1;
			if(originLength>1){
				/*
				* 전체금액에서 삭제된 테이블 금액을 뺀다.
				* 삭제테이블의 제품정보를 수집한다.
				*/
				listNum = selectNum.split('-')[1];
				serialNum = $('#prodList-'+listNum+'-mtPmSerialNum').val();
				if(serialNum == ''){
					productName = $('#prodList-'+listNum+'-mtPmNmCd').val();
				} else {
					productName = $('#prodList-'+listNum+'-mtPmNmCd').val()+"("+serialNum+")";
				}
				//삭제 key
				deleteKey =  $('#prodList-'+listNum+'-mtSalesPmKey').val();
				if(confirm(productName+" 제품정보를 삭제하시겠습니까?")) {
					//삭제key list를 만든다.
					if(deleteKey !=''){
						$('#deleteListKeys').val($('#deleteListKeys').val()+deleteKey+":");
					}				
					
					//매출총합계 금액에서 삭제된 금액을 뺀다.
					deleteAmount(listNum);
					
					table.remove();
					$('#'+type+'Length').val($('#'+type+'Length').val()*1 - 1);
				}
				
				 
				/* nextTable.each(function() {
					var num = $(this).find('input[name="lastNum"]').val()*1;
					$(this).find('input[name="lastNum"]').val(num-1);
					var newName = type + 'List[' + (num-1) + '].';
					
					for(var i = 0; i < nameArr.length; i++) {
			    		var splitName = nameArr[i].split('.')[1];
			    		$(this).find('input[name="'+ type + 'List[' + (num) + '].' + splitName+'"]').attr('name', newName + splitName);
			    		$(this).find('textarea[name="'+ type + 'List[' + (num) + '].' + splitName+'"]').attr('name', newName + splitName); 
			    		$(this).find('select[name="'+ type + 'List[' + (num) + '].' + splitName+'"]').attr('name', newName + splitName); 
			    	}  
				}); */
			} else {
				alert("제품정보는 한개 이상 존재해야 합니다.");
			}			   
		}
		// 리스트 삭제 누르면 발주합계에서 해당 금액 빼주는 function
		function deleteAmount(num) {
			var deleteUprice = 0;
			var deleteQuantity = 0;
			var totalAmount = removeCommas($('#orderTotalAmount').val())*1;
			var yetPaymentAmount =($('#yetPaymentAmount').val())*1; 
			var oldMtOrderAmount =($('#oldMtOrderAmount').val())*1; 
			deleteUprice = removeCommas($('#prodList-'+num+'-mtPmUprice').val())*1;
			deleteQuantity = removeCommas($('#prodList-'+num+'-mtPmQuantity').val())*1;
			
			//console.log("mtOrderPmUprice * mtOrderPmQuantity =orderAmount ====>"+deleteUprice+" * "+deleteQuantity+" = "+(deleteQuantity*deleteUprice));
			//전체금액에서 삭제금액을 뺀다.
			$('#orderTotalAmount').val(addCommas(totalAmount-(deleteUprice*deleteQuantity)));
			
			//console.log("1==========>"+(totalAmount-(deleteUprice*deleteQuantity)) );
			//console.log("2==========>"+oldMtOrderAmount);
			//console.log("3==========>"+yetPaymentAmount);
			//console.log("4==========>"+( (totalAmount-(deleteUprice*deleteQuantity))-oldMtOrderAmount));
			//console.log("5==========>"+(yetPaymentAmount + ( (totalAmount-(deleteUprice*deleteQuantity))-oldMtOrderAmount) ));
			//yetPaymentAmount금액을 계산한다. (yetPaymentAmount+변경된 금액)
			$('#yetPaymentAmount').val( yetPaymentAmount+ ( (totalAmount-(deleteUprice*deleteQuantity))-oldMtOrderAmount) );
			//이전금액셋팅.
			$('#oldMtOrderAmount').val(totalAmount-(deleteUprice*deleteQuantity));
			
			//발주금액이 지급요청금액보다 작으면 경고문구
			if(removeCommas($('#orderTotalAmount').val())*1 <$('#callTotalAmount').val()*1) {
				alert("발주금액("+$('#orderTotalAmount').val()+")이 지급요청금액 ("+addCommas($('#callTotalAmount').val())+") 보다  작아서 해당내용을 수정할 수 없습니다.");
			}
		}
		
		//이전화면으로 이동
		function fn_prevBtn(){
			if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수계약 기본정보 등록화면으로 이동하시겠습니까?")) {
				var url = '/maintenance/contract/write/basicInfoView.do';
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
			/* var reqProductTotalAmount=0;
			//등록된 제품의 전체 total값을 구한다..
			$(".productTotalAmount").each(function(){
				reqProductTotalAmount = reqProductTotalAmount+removeData($(this).val(),",")*1;				
			}); */
			
			if("${mtContractCountInfo.mtProductCnt}" > 0){
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
			} else {
				alert(" 유지보수계약 매출계약정보가 등록되지 않았습니다.\n 유지보수계약 매출계약정보를 먼저 등록하세요.");
				return false;
			}
			
			
		}

		function fn_saveBtn(){
			var reqProductTotalAmount=0;
			var actionTitle;
			var checkDate;
			var salesUpadteYnGubun;
			//등록된 제품의 전체 total값을 구한다.
			$(".productTotalAmount").each(function(){
				reqProductTotalAmount = reqProductTotalAmount+removeData($(this).val(),",")*1;
				
			});
			//매출합계금액이 수금요청금액보다 큰 경우에만 저장 가능. 수금요청 된 금액보다 작아지면 저장안됨.
			if(reqProductTotalAmount*1 > $('#callTotalAmount').val()*1) {
				if ($("#mtBasicForm")[0].checkValidity()){ //메인 필수값 체크.
					if(''==$('#mtSalesAcKey').val()) {
						alert("저장전 매출처를 선택하세요 !!");
						$('#mtSalesAcNm').val('');
						$('#mtSalesAcNm').focus();
					}else {
						if ($("#mtListForm")[0].checkValidity()){
							//제품에 대한 필수값 체크를 완료하면 저장 프로세스 시작.
							checkDate = $("#mtListForm").checkPmDate();
							//제품 유지보수 기간과 기본정보 계약기간을 비교하여 범위 안에 있는 지 확인한다.
							if('' != checkDate) {
								alert(checkDate);
							}  else {
								if($('#mtSalesOrderKey').val() !=''){
									//mtSalesOrderKey(매출계약관리키)가 있으면 수정.
									actionTitle = "수정";
								} else {
									actionTitle = "저장";
								}
								
								if(confirm("유지보수 매출계약정보를 "+actionTitle+"하시겠습니까?")) {
									
									//수정인 경우 제품총액 및 기간이 달라지는 경우 매출정보테이블을 업데이트함
									if($('#mtSalesOrderKey').val() !=''){
										//제품전체 총액이 달라지고 유지보수 기본정보의 금액(mtAmount)과 같은 경우 업데이트
										if($('#orderTotalAmount').val() != $('#beforeOrderTotalAmount').val()) {
											$('#updateYn').val("Y");
										} else {
											salesUpadteYnGubun = $("#mtListForm").salesUpadteYn();
											//3.  제품별 유지보수 월이 달라진 경우나 제품별  전체금액이 달라진 경우 업데이트
											if("Y"==salesUpadteYnGubun) {
												$('#updateYn').val("Y");
											}
											/* if(reqProductTotalAmount==$('#mtAmount').val()) {
												salesUpadteYnGubun = $("#mtListForm").salesUpadteYn();
												//3.  제품별 유지보수 월이 달라진 경우나 제품별  전체금액이 달라진 경우 업데이트
												if("Y"==salesUpadteYnGubun) {
													$('#updateYn').val("Y");
												}
											} */	
										}
									}else {
										$('#updateYn').val("Y");
									}
									//저장(수정) 한다.
									saveSalesOrder(actionTitle);
									
								} // end if(confirm("유지보수 매출계약정보를 "+actionTitle+"하시겠습니까?"))
								else {
									return false;	
								}
							}
						}  else {
							 //Validate Form
					        $("#mtListForm")[0].reportValidity();	
						} 
						
						
					}
					
					
				}  else {
					if(''==$('#mtSalesAcNm').val()) {
						alert("저장전 매출처를 선택하세요 !!");
						$('#mtSalesAcNm').focus();
					} else if(''==$('#billSalesCd').val()) {
						alert("저장전 매출구분을 선택하세요 !!");
						$('#billSalesCd').focus();
					} else if(''==$('#billMfCd').val()) {
						alert("저장전 제조사구분을 선택하세요 !!");
						$('#billMfCd').focus();
					} else if(''==$('#orderTotalAmount').val()) {
						alert("저장전 매출합계를 입력하세요 !!");
						$('#orderTotalAmount').focus();
					} else if(''==$('#mtSalesPayTerms').val()) {
						alert("저장전 결제조건을 입력하세요 !!");
						$('#mtSalesPayTerms').focus();
					}
					//Validate Form
			       // $("#mtBasicForm")[0].reportValidity();	
			       
				}
			} else {
				//발주금액이 지급요청금액보다 작으면 경고문구
				alert("매출계약금액("+addCommas(reqProductTotalAmount)+")이 수금요청금액 ("+addCommas($('#callTotalAmount').val())+") 보다  작아서 해당내용을 수정할 수 없습니다.");
			}

			/*
				처음등록하는 경우는 무조건 매출정보를 등록하고
				수정인 경우 매출정보 업데이트(updateYn) 하는 기준
				1. 제품전체 금액이 달라진 경우
				2. 제품별  전체금액이 달라진 경우
				3. 제품별 유지보수 월이 달라진 경우.				
			*/
			
			
			
			//console.log("1111111111");
			
			//필수값 체크를 완료하면 저장 프로세스 시작.
	/* 		if ($("#mtListForm")[0].checkValidity()){
				checkDate = $("#mtListForm").checkPmDate();
				
				if('' != checkDate) {
					alert(checkDate);
				} else {
					if($('#rowNum').val()*1 >0){					
						actionTitle = "수정";
					} else {
						actionTitle = "저장";
					}
					
					if(confirm("유지보수 매출계약정보를 "+actionTitle+"하시겠습니까?")) {
						//등록된 갯수가 0보다 크면 수정.
						if($('#rowNum').val()*1 >0) {
							//1. 제품전체 총액이 달라지고 유지보수 기본정보의 금액과 같은 경우 업데이트
							//console.log("===>"+reqProductTotalAmount+"("+$('#beforeProductAmount').val()+"), "+reqProductTotalAmount+"("+$('#mtAmount').val()+")");
							if(reqProductTotalAmount != $('#beforeProductAmount').val() && reqProductTotalAmount==$('#mtAmount').val()) {
								$('#updateYn').val("Y");
							}else {
								//2. 유지보수 기본정보의 금액과 같고
								if(reqProductTotalAmount==$('#mtAmount').val()) {
									salesUpadteYnGubun = $("#mtListForm").salesUpadteYn();
									//3.  제품별 유지보수 월이 달라진 경우나 제품별  전체금액이 달라진 경우 업데이트
									if("Y"==salesUpadteYnGubun) {
										$('#updateYn').val("Y");
									}
								}													
							}				
						}
						//제품정보를 등록(수정) 한다.
						saveSalesOrder(actionTitle);
					} else {
						return false;
					}
				
				}		
			}  else {
				 //Validate Form
		        $("#mtListForm")[0].reportValidity();	
			} */
		}
	
		function saveSalesOrder(actionTitle){

			var object = {};
			var listObject = new Array();
			var obj = new Object();
           	var formData = $("#mtBasicForm").serializeArray();
           	var listData = $("#mtListForm").serializeObject();
            
           	for (var i = 0; i<formData.length; i++){
           		if("mtSalesAmount" == formData[i]['name']){
                	//컴마제거
                	object[formData[i]['name']] = removeData(formData[i]['value'], ",");
                } else {
                	object[formData[i]['name']] = formData[i]['value'];
                }
               
                            
            }
           	//List를 담아준다.			
            object["mtSalesOrderProductVoList"]=listData;           	
			
			var sendData = JSON.stringify(object);
           	//console.log("sendData==>"+sendData);
           	$.ajax({
	        	url:"/maintenance/contract/write/productInfo.do",
	            dataType: 'text', 
	            type:"post",  
	            data: sendData,
				
	            traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.
	            
	     	   	contentType: "application/json; charset=UTF-8", 
	     	  	beforeSend: function(xhr) {
	     	  		//console.log("sendData11=====>"+sendData);
	        		xhr.setRequestHeader("AJAX", true);	        		
	        	},
	            success:function(data){	
	            	var paramData = JSON.parse(data);
	            	//console.log("data.mtIntegrateKey==>"+paramData.mtIntegrateKey);
	            	
	            	if("Y" == paramData.successYN){
	            		if($('#updateYn').val()=="Y") {
	            			alert("유지보수 매출계약 "+actionTitle+"을 성공하였습니다. \n제품정보 변경으로 매출정보가 변경되었습니다. \n매출정보를 확인하세요!!");
	            		} else {
	            			alert("유지보수 매출계약"+actionTitle+"을 성공하였습니다.");
	            		}
	            		
	            		//유지보수작업 발주 등록화면으로 이동
	            		var url='/maintenance/contract/write/productInfoView.do';
	            		            			
		    			var dialogId = 'program_layer';
		    			var varParam = paramData
		    			var button = new Array;
		    			button = [];
		    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
	            	} else {
	            		alert("유지보수 매출계약"+actionTitle+"을 실패하였습니다.");
	            	}
	            	
	            	
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        });			           	
		}
		
		//수량 X 단가 = 합계에 값 넣기
/* 		$(document).on("focusout", ".calculate", function() {
			var beforeAmount=0;
			var num = $(this).attr('id').split('-')[1];
			var quantity = removeCommas($("#prodList-"+num+"-mtPmQuantity").val());
			var pmUprice = removeCommas($("#prodList-"+num+"-mtPmUprice").val());
			$("#prodList-"+num+"-totalAmount").val(addCommas(quantity*pmUprice));
			
			beforeAmount = quantity *pmUprice;
			
			var orderTotalAmount = removeCommas($('#orderTotalAmount').val())*1;
			
		}); */
		

		//단가 * 수량 계산
		function fn_calculate(){
			var beforeAmount=0;
			$(".calculate").unbind('focus');
			$(".calculate").unbind('blur');
			$(".calculate").focus(function() {
				var num = $(this).attr('id').split('-')[1];
				var quantity = removeCommas($("#prodList-"+num+"-mtPmQuantity").val());
				//해당 라인의 단가.
				var pmUprice = removeCommas($("#prodList-"+num+"-mtPmUprice").val());	
				
				beforeAmount = quantity *pmUprice;
				//console.log("beforeAmount====>"+beforeAmount);
			});
			
			$(".calculate").blur(function() {
				var num = $(this).attr('id').split('-')[1];
				//console.log("num====>"+num);
				//해당 라인의 수량
				var quantity = removeCommas($("#prodList-"+num+"-mtPmQuantity").val());
				//해당 라인의 단가.
				var pmUprice = removeCommas($("#prodList-"+num+"-mtPmUprice").val());				
				//매출합계 금액
				var orderTotalAmount = removeCommas($('#orderTotalAmount').val())*1;
				
				var orderAmount = quantity*pmUprice;
				
				//미지급금액 계산 추가 2021-10-15
				var yetPaymentAmount =($('#yetPaymentAmount').val())*1; 
				var oldMtOrderAmount =($('#oldMtOrderAmount').val())*1; 
				
				//console.log("quantity * pmUprice =orderAmount ====>"+quantity+" * "+pmUprice+" = "+(quantity*pmUprice));
				
				//제품별 계산(단가*수량 = 합계)
				$("#prodList-"+num+"-totalAmount").val(addCommas(orderAmount));
				
				/*
				 	매출전체 합계금액 계산
				 	매출전체 합계금액 = 이전 매출전체 합계금액-품목별 변경금액.
				 */
				$('#orderTotalAmount').val(addCommas(orderTotalAmount+(orderAmount-beforeAmount)));
				
				//yetPaymentAmount금액을 계산한다. (yetPaymentAmount+변경된 금액)
				$('#yetPaymentAmount').val( yetPaymentAmount+ ( (orderTotalAmount+(orderAmount-beforeAmount))-oldMtOrderAmount) );
				//이전금액셋팅.
				$('#oldMtOrderAmount').val(orderTotalAmount+(orderAmount-beforeAmount));
				
				//발주금액이 지급요청금액보다 작으면 경고문구
				if(removeCommas($('#orderTotalAmount').val())*1 <$('#callTotalAmount').val()*1) {
					alert("발주금액("+$('#orderTotalAmount').val()+")이 지급요청금액 ("+addCommas($('#callTotalAmount').val())+") 보다  작아서 해당내용을 수정할 수 없습니다.");
				}
				//console.log("num=>"+num);
				//console.log("amount11====>"+ amount+"/"+totalAmount+"/"+beforeAmount);			
			});
			
			/* $(".calculate").focus(function() {
				beforeAmount = removeCommas($(this).val())*1;
			}); */
			/* $(document).on("focus", ".calculate", function() {
				beforeAmount = removeCommas($(this).val())*1;
				//console.log("beforeAmount====>"+ beforeAmount);
			}); */
		}

		function fnUpdateSaleAmount(param) {
			//alert(param);
			$('#updateYn').val(param);
		}
		
		//유지보수계약 제품 찾기 클릭
		function fn_findMtProduct(obj) {
			var num = $(obj).attr('id').split('-')[1];
			//console.log('/maintenance/contract/popup/mtProductList.do?whereNum='+num+'&selectIntegrateKey='+$('#mtIntegrateKey').val());
			
			/* window.open('/maintenance/contract/popup/mtProductList.do?whereNum='+num+'&selectIntegrateKey='+$('#mtIntegrateKey').val()
					,'MT_PRODUCT_POPUP'
					,'width=1000px,height=400,left=600,status=no,title=no,toolbar=no,menubar=no,location=no'); */
			//window.open('/mngCommon/product/popup/searchListPopup.do?returnType=O&returnKey=prodList-'+num+'-mtPmFkKey&returnNm=prodList-'+num+'-pmNmCd','PRODUCT_LIST','width=1000px,height=713px,left=600');
			window.open('/mngCommon/product/popup/searchListPopup.do?pmNmDomId='+obj.id+'&pmKeyDomId='+obj.nextElementSibling.id+'&returnType=O','PRODUCT_LIST','width=1000px,height=713px,left=600');
		}
/* 		function fn_viewSummaryUpAll(){
			$(".dpTbRow").attr('class','dpNone');
			$(".down").attr('class','up');
			$(".up").attr('src','<c:url value='/images/arrow_down.png'/>');
			//$(".up").src = "<c:url value='/images/arrow_down.png'/>";
		} */
		//프로젝트 제품 찾기 클릭
		function fn_addProjectProduct(mtLinkCtKey){
			//var num = $(obj).attr('id').split('-')[1];
			//console.log('/maintenance/contract/popup/mtProductList.do?whereNum='+num+'&selectIntegrateKey='+$('#mtIntegrateKey').val());
			var num = 1;
			window.open('/maintenance/contract/popup/pjProductList.do?searchGubun=workPm&whereNum='+num+'&selectIntegrateKey='+mtLinkCtKey
					,'PJ_PRODUCT_POPUP'
					,'width=1000px,height=700,left=600,status=no,title=no,toolbar=no,menubar=no,location=no');
			
			
		}
		
		function addProjectProduct(mtPmKey,pmNmCd,mtPmQuantity,mtPmUprice, mtRate,enPmDetail) {

			var checkNum;
			var setMtPmUprice = mtPmUprice * (mtRate/100);
			var lastNum = $("input[name='lastNum']").get($("input[name='lastNum']").length-1).getAttribute('value')*1;
			//console.log("lastNum=======>"+lastNum);
			
			if($("#prodList-"+lastNum+"-mtPmFkKey").val()=='') {
				
				checkNum = lastNum;
			} else {
				fn_addInfoTable();
				checkNum = lastNum+1;
			}
			console.log("mtPmKey===="+checkNum+"===>"+mtPmKey);
			console.log("pmNmCd==="+checkNum+"====>"+pmNmCd);
			console.log("mtPmUprice==="+checkNum+"====>"+mtPmUprice);
			console.log("mtRate===="+checkNum+"===>"+mtRate);
			console.log("setMtPmUprice=="+checkNum+"=====>"+mtPmUprice);
			
			$("#prodList-"+checkNum+"-mtPmNmCd").val(pmNmCd);
			$("#prodList-"+checkNum+"-mtPmFkKey").val(mtPmKey);
			$("#prodList-"+checkNum+"-mtPmQuantity").val(addCommas(mtPmQuantity));
			//$("#prodList-"+checkNum+"-mtPmUprice").val(addCommas(setMtPmUprice));
			//$("#prodList-"+checkNum+"-totalAmount").val(addCommas(mtPmQuantity*setMtPmUprice));
			$("#prodList-"+checkNum+"-mtPmUprice").val(addCommas(mtPmUprice));
			$("#prodList-"+checkNum+"-totalAmount").val(addCommas(mtPmQuantity*mtPmUprice));
			if(enPmDetail.length >0) {
				var parsedWordArray = CryptoJS.enc.Base64.parse(enPmDetail);
				var mtPmDetail = parsedWordArray.toString(CryptoJS.enc.Utf8);
				
				console.log("mtPmDetail=======>"+mtPmDetail);
				$("#prodList-"+checkNum+"-mtPmDetail").val(mtPmDetail);
			}
			
			$("#prodList-"+checkNum+"-mtPmUprice").blur();
			
			fn_calculate();
			console.log("fn_calculate call=======>");
			/* prodList-3-pmNmCd
			prodList-3-mtPmFkKey
			prodList-3-mtPmQuantity
			prodList-3-mtPmDetail */
		}

		//해당 거래처의 매출계약 내용을 삭제한다.
		function fn_deleteSalesOrderBtn() {
			var acKeyNm = $('#mtSalesAcNm').val();
			//console.log("selectKey=========>"+$('#popSelectKey').val());
			//console.log("mtOrderAcKeyNm=========>"+$('#mtOrderAcKeyNm').val() );
			if($('#callTotalAmount').val()*1 > 0) {
				//지급요청금액이 존재하면 삭제할 수 없다.
				alert("계산서 발행 요청금액 ("+addCommas($('#callTotalAmount').val())+")이 존재하여 삭제할 수 없습니다.");
			} else {
				if($('#mtSalesOrderKey').val() !='') {
					/* if(confirm(acKeyNm+"의 백계약 정보를 삭제하시겠습니까?")){
						var url = '/maintenance/contract/delete/backOrderAll.do';
						var dialogId = 'program_layer';
						var varParam = {
								"mtIntegrateKey":$('#mtIntegrateKey').val(),
								"selectKey":$('#selectKey').val()
						}
						var button = new Array;
						button = [];
						showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
					} */
					var sendData = {
							"mtIntegrateKey":$('#mtIntegrateKey').val(),
							"salesOrderKey":$('#mtSalesOrderKey').val()
					}				
					
					if(confirm(acKeyNm+"의 매출계약 정보를 삭제하시겠습니까?")){
						$.ajax({
				        	url:"/maintenance/contract/delete/salesOrder.do",
				            dataType: 'text', 
				            type:"post",  
							data: JSON.stringify(sendData),
							
				            traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.
				            
				     	   	contentType: "application/json; charset=UTF-8", 
				     	  	beforeSend: function(xhr) {
				     	  		
				        		xhr.setRequestHeader("AJAX", true);	        		
				        	},
				            success:function(data){	
				            	//console.log("data==>"+data);
				            	var paramData = JSON.parse(data);
				            	
				            	
				            	if("Y" == paramData.successYN){
				            		alert("유지보수 매출계약정보  삭제를 성공하였습니다.");
			            			//유지보수계약 백계약 등록화면으로 이동
				            		var url='/maintenance/contract/write/productInfoView.do';
				            		            			
					    			var dialogId = 'program_layer';
					    			var varParam = paramData
					    			var button = new Array;
					    			button = [];
					    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
					            	
				            	} else {
				            		alert("유지보수 매출계약정보 삭제를 실패하였습니다.");
				            		
				            	}
				            	
				            	
				            },
				        	error: function(request, status, error) {
				        		if(request.status != '0') {
				        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
				        		}
				        	} 
				        }
			           	 
			           	);
					}
					
					
				} else {
					alert("삭제할 거래처 정보를 선택하세요.");
				}
			}						
		}	


		
		//발주합계금액 readOnly해제.
		function fn_editTotalAmount() {
			//console.log('--1111111111111111');
			document.getElementById('orderTotalAmount').readOnly = false;
			alert("매출합계 금액 읽기전용을 해제하여 금액수정이 가능합니다.!!");
			//console.log('11222222222222');
			
		}
		
		//매출처별 계약 추가.
		function fn_addNewSalesOrder(){
			var url = '/maintenance/contract/write/productInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":$('#mtIntegrateKey').val(),					
					"parmMtSbCtYn":$('#parmMtSbCtYn').val(),
					"btnOption" : "newOrder"
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}		
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
					<li class="colorWhite cursorP on">매출계약정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('salesInfoView');">매출정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('writeSalesPlanView');">계산서계획정보</li>
					<c:if test="${parmMtSbCtYn eq 'Y' }">		
					<li class="colorWhite cursorP" onclick="fn_changeView('backOrderInfoView');">백계약정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('purchaseAmountView');">매입정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('writePaymentPlanView');">지급계획정보</li>
					</c:if>
			</ul>
		</div>
		
		
		<div class="contents">			
			<div>
				<table class="subject1">						
					<tr>      
						<td class="subTitle" style="border-top: none;" colspan="6">
							<label class="ftw400">매출등록</label>&nbsp;&nbsp;&nbsp;	
							<img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addNewSalesOrder();" style="vertical-align: middle;cursor: pointer;width: 30px;"/>
							
							<c:if test="${salesOrderSelectBox.size() >0 }">
								<select id="mtSaveOrderAcKey" name="mtSaveOrderAcKey" style="width: 200px; height: 30px;">															
									<c:forEach var="order" items="${salesOrderSelectBox}" varStatus="status">
										<c:choose>
											<c:when test='${order.selectGubun == "FC"}'> 
												<option value="<c:out value="${order.mtSalesOrderKey}"/>" style="color:blue;"><c:out value="${order.mtAcNm}"/></option>
											</c:when>
											<c:otherwise> 
												<option value="<c:out value="${order.mtSalesOrderKey}"/>"><c:out value="${order.mtAcNm}"/></option>
											</c:otherwise>
										</c:choose>
										
									</c:forEach>							
								</select>
								<select id="mtSaveOrderCheck"  style="display:none">															
									<c:forEach var="order" items="${salesOrderSelectBox}" varStatus="status">
										<option value="<c:out value="${order.mtSalesAcKey}"/>"><c:out value="${order.mtSalesOrderKey}"/></option>
									</c:forEach>							
								</select>
							</c:if>
						</td>
					</tr>
				</table>
				<form action="/" id="mtBasicForm" name="mtBasicForm" method="post">
					<c:choose>
						<c:when test="${listCount > 0}">
						<input type="hidden" id="prodLength" name="prodLength" value="<c:out value="${listCount}"/>" />
						</c:when>
						<c:otherwise> 
						<input type="hidden" id="prodLength" name="prodLength" value="1" />
						</c:otherwise>
					</c:choose>
					<input type="hidden" id="parmMtSbCtYn" name="parmMtSbCtYn" value="<c:out value="${parmMtSbCtYn}"/>" />
					<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${mtIntegrateKey}"/>" />
					<input type="hidden" id="rowNum" name="rowNum" value="<c:out value="${listCount}"/>" />
					<input type="hidden" id="mtContFromDate" name="mtContFromDate" value="<c:out value="${mtContFromDate}"/>" />
					<input type="hidden" id="mtContEndDate" name="mtContEndDate" value="<c:out value="${mtContEndDate}"/>" />
					<input type="hidden" id="deleteListKeys" name="deleteListKeys" />
					<input type="hidden" id="updateYn" name="updateYn" value="N"/>
					<input type="hidden" id="mtAmount" name="mtAmount" value="<c:out value="${basicContractInfo.mtAmount}"/>"/>				
					<%-- <input type="hidden" id="beforeProductAmount" name="beforeProductAmount" value="<c:out value="${mtContractCountInfo.productTotalAmount}"/>"/> --%>
					
					<input type="hidden" id="mtSalesOrderKey" name="mtSalesOrderKey" value="<c:out value="${mtSalesOrderVO.mtSalesOrderKey}"/>"/>
					<input type="hidden" id="oldMtOrderAmount" name="oldMtOrderAmount" value="<c:out value="${mtSalesOrderVO.mtSalesAmount}"/>"/>
					<input type="hidden" id="yetPaymentAmount" name="yetCollectAmount" value="<c:out value="${mtSalesOrderVO.yetCollectAmount}"/>"/>
					<input type="hidden" id="callTotalAmount" name="callTotalAmount" value="<c:out value="${mtSalesOrderVO.callTotalAmount}"/>"/>
					<table style="width: 860px;">
						<tr>
							<td class="tdTitle" style="width:106px;"><label>*</label> 매출처</td>
							<td class="tdContents">
								<input type="text" id="mtSalesAcNm" name="mtSalesAcNm" class="search" style="width: 163px" autocomplete="off" value="<c:out value="${mtSalesOrderVO.mtSalesAcNm}"/>" required/>
								<input type="hidden" id="mtSalesAcKey" name="mtSalesAcKey"  value="<c:out value="${mtSalesOrderVO.mtSalesAcKey}"/>"/>
								
							</td>
							<td class="tdTitle"><label>*</label> 매출처담당</td>
							<td class="tdContents" style="width: 70px; max-width: 70px;">
							<c:choose>
								<c:when test="${mtSalesOrderVO.selectKey eq '' ||  mtSalesOrderVO.selectKey eq 'null'||  mtSalesOrderVO.selectKey eq null}">
									<c:choose>
										<c:when test="${empty acDirectorList}">
											
											<select id="mtSalesAcDirectorKey" name="mtSalesAcDirectorKey" required>
												<option value="">선택</option>
											</select>
										</c:when>
										<c:otherwise>
											<select id="mtSalesAcDirectorKey" name="mtSalesAcDirectorKey" required>
											<c:forEach var="emp" items="${acDirectorList}" varStatus="status">	
												
												<option value="<c:out value="${emp.acDirectorKey}"/>"><c:out value="${emp.acDirectorNm}"/></option>
												
											</c:forEach>
											</select>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<select id="mtSalesAcDirectorKey" name="mtSalesAcDirectorKey" required>
										<c:forEach var="emp" items="${acDirectorList}" varStatus="status">		
											<c:choose>
												<c:when test='${mtSalesOrderVO.mtSalesAcDirectorKey == emp.acDirectorKey}'>
													<option value="<c:out value="${emp.acDirectorKey}"/>" selected="selected"><c:out value="${emp.acDirectorNm}"/></option>
												</c:when>
												<c:otherwise>
													<option value="<c:out value="${emp.acDirectorKey}"/>"><c:out value="${emp.acDirectorNm}"/></option>
												</c:otherwise>
											</c:choose>										
											<%-- <option value="<c:out value="${emp.acDirectorKey}"/>"><c:out value="${emp.acDirectorNm}"/></option> --%>
										</c:forEach>
										
									</select>
									
								</c:otherwise>
							</c:choose> &nbsp;
							</td>
							<td class="tdTitle" style="width:50px; max-width:50px;"><label>*</label> 매출구분</td>
							<td class="tdContents" id="tr_account">
								<select id="billSalesCd" name="billSalesCd" style="width:115px;" required>
									<option value="" style="color:#bec3c9;">매출구분</option>
									<c:forEach var="billSalesCode" items="${salesCodeList}" varStatus="status1">			
									<c:choose>
										<c:when test='${mtSalesOrderVO.billSalesCd == billSalesCode.cdKey}'>
										<option value="<c:out value="${billSalesCode.cdKey}"/>" selected="selected"><c:out value="${billSalesCode.cdNm}"/></option>
										</c:when>
										<c:otherwise>
										<option value="<c:out value="${billSalesCode.cdKey}"/>"><c:out value="${billSalesCode.cdNm}"/></option>
										</c:otherwise>
									
									</c:choose>
									<%-- <option value="<c:out value="${billSalesCode.cdKey}"/>" <c:if test='${list.billSalesCd == billSalesCode.cdKey}'>selected="selected" </c:if> ><c:out value="${billSalesCode.cdNm}"/></option> --%>
									</c:forEach>	
								</select>
								<select id="billMfCd" name="billMfCd" style="width:115px;" required>
									<option value="" style="color:#bec3c9;">제조사</option>
									
									<c:forEach var="billMfCd" items="${manufacturerList}" varStatus="status2">										
									<c:choose>
										<c:when test='${mtSalesOrderVO.billMfCd == billMfCd.codeKey}'>
										<option value="<c:out value="${billMfCd.codeKey}"/>" selected="selected"><c:out value="${billMfCd.codeNm}"/></option>
										</c:when>
										<c:otherwise>
										<option value="<c:out value="${billMfCd.codeKey}"/>"><c:out value="${billMfCd.codeNm}"/></option>
										</c:otherwise>
									</c:choose>
									</c:forEach>	
								</select>	
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 매출합계<button type="button" onclick="fn_editTotalAmount();"><img src="<c:url value='/images/edit_icon.png'/>" style="width: 19px;vertical-align: middle;margin-bottom: 1px;margin-left: 4px;"/></button></td>
							<td class="tdContents">
								<input type="text"  id="orderTotalAmount" name="mtSalesAmount" readOnly amountOnly required value="<c:out value="${displayUtil.commaStr(mtSalesOrderVO.mtSalesAmount)}"/>" style="width: 163px;text-align: right;"/>	
								<input type="hidden"  id="beforeOrderTotalAmount" value="<c:out value="${displayUtil.commaStr(mtSalesOrderVO.mtSalesAmount)}"/>"/>
							</td>
							<td class="tdTitle"><label>*</label> 발행구분</td>
							<td class="tdContents" style="width:112px;">
								<select id="billIssueType" name="billIssueType" style="<c:if test='${mtSalesOrderVO.billIssueType == "N"}'>color:red;</c:if>" >
									<option value="Y" <c:if test='${mtSalesOrderVO.billIssueType == "Y"}'>selected </c:if> style="color:black;">정발행</option>
									<option value="N" <c:if test='${mtSalesOrderVO.billIssueType == "N"}'>selected </c:if> style="color:red;">역발행</option>
								</select>
							</td>
							<td class="tdTitle" style="width: 70px"><label>*</label> 결제조건</td>
							<td class="tdContents" >
								<input type="text" id="mtSalesPayTerms" name="mtSalesPayTerms" style="width: 211px" required value="<c:out value="${mtSalesOrderVO.mtSalesPayTerms}"/>" />	
								
							</td>
						</tr>
						<tr >
							<td class="tdTitle">비고</td>
							<td class="tdContents" colspan="5" style="padding-right: 10px"><textarea id="remark" name="remark" ><c:out value="${mtSalesOrderVO.remark}"/></textarea></td>
						</tr>
					</table>
				</form>
			</div>
			
			<form action="/" id="mtListForm" name="mtListForm" method="post">
				
					<div class="subjectContainer">
						<table class="subject" style="padding-top: 15px;">
							<tr>		
								<td class="subTitle" style="border-top: none;">
									<label class="ftw400">제품정보</label>
								</td>
								<td class="subBtn" style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable();" style="cursor: pointer;width: 30px;"/></td>
								<td class="subBtn" colspan="5"  style="border-top: none;text-align: center;vertical-align: middle;">
									<%-- <c:if test="${listCount>0}">
									유지보수 매출금액 업데이트여부 :
									<input type="radio" class="tRadio" name="checkUpdateYn" value="Y" id="updateYn1" onclick="fnUpdateSaleAmount('Y')"/><label for="updateYn1" class="cursorP" style="width: 22px;height: 22px;"></label>&nbsp;&nbsp;Y&nbsp;&nbsp;
									<input type="radio" class="tRadio" name="checkUpdateYn" value="N" id="updateYn2" onclick="fnUpdateSaleAmount('N')"checked="checked"/><label for="updateYn2" class="cursorP" style="width: 22px;height: 22px;"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
									</c:if> --%>
									<c:choose>
										<c:when test="${basicContractInfo.mtProjectLinkVo == null ||  basicContractInfo.mtProjectLinkVo.mtLinkCtKey == null}">
										<img id="project_product" class="floatR" src="<c:url value='/images/project_gray.png'/>"/>
										</c:when>
										<c:otherwise>
										<img id="project_product" class="floatR" src="<c:url value='/images/btn_project_get.png'/>" onclick="fn_addProjectProduct('<c:out value="${basicContractInfo.mtProjectLinkVo.mtLinkCtKey}"/>');" style="cursor: pointer;"/>										
										</c:otherwise>
									</c:choose>
									
								</td>
							</tr>
						</table>
					</div>
					<div id="prodWrap">
					<c:choose>
						<c:when test="${mtSalesOrderVO.mtSalesOrderProductVoList == null ||  mtSalesOrderVO.mtSalesOrderProductVoList.size() == 0}">
						<div class="prodTable">
							<input type="hidden" name="lastNum" value="0" />
							<table>
								<tr>
									<td class="tdTitle firstTd"><label>*</label>&nbsp;제품</td>
									<td class="tdContents firstTd">
										<!-- <input type="text" id="prodList-0-mtPmFkKey" name="mtPmFkKey" class="search" required/>	
										<input type="hidden" id="prodList-0-pmNmCd" name="pmNmCd" /> -->
										<input type="text" id="prodList-0-mtPmNmCd" name="mtPmNmCd" class="search" onclick="fn_findMtProduct(this)" onkeypress="return false;" required/>	
										<input type="hidden" id="prodList-0-mtPmFkKey" name="mtPmFkKey"/>	
										<input type="hidden" id="prodList-0-mtSalesPmKey" name="mtSalesPmKey" />	
									</td>
									<td class="tdTitle firstTd"><label>*</label>&nbsp;시리얼번호</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-0-mtPmSerialNum" name="mtPmSerialNum" required/>
									</td>
									<td class="tdTitle firstTd"><label>*</label>&nbsp;수량</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-0-mtPmQuantity" name="mtPmQuantity" amountOnly style="width: 75px;" class="calculate" required/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
										<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
			                        	<img id="prodList-0-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label>&nbsp;단가</td>
									<td class="tdContents">
										<input type="text" id="prodList-0-mtPmUprice" name="mtPmUprice" class="calculate" amountOnly required/>
									</td>	
									<td class="tdTitle"><label>*</label>&nbsp;합계</td>
									<td class="tdContents" colspan="3">
										<input class="productTotalAmount" type="text" id="prodList-0-totalAmount" name="totalAmount" style="text-align: right;" readonly="readonly"/>	
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label>&nbsp;계약기간</td>
									<td class="tdContents" colspan="3">
										<input type="text" id="prodList-0-mtPmStartDt" name="prodList-0-mtPmStartDt" class="calendar fromDt" required/>&nbsp;&nbsp;~&nbsp;&nbsp;<input type="text" id="prodList-0-mtPmEndDt" name="prodList-0-mtPmEndDt" class="calendar toDt" required/>
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle">상세정보</td>
									<td class="tdContents" colspan="5"><textarea id="prodList-0-mtPmDetail" name="mtPmDetail"></textarea></td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle lastTd">비고</td>
									<td class="tdContents lastTd" colspan="5"><textarea id="prodList-0-remark" name="remark"></textarea></td>
								</tr>
							</table>
						</div>
						</c:when>
						<c:otherwise>
						<c:forEach var="list" items="${mtSalesOrderVO.mtSalesOrderProductVoList}" varStatus="status">
						<div class="prodTable">
							<input type="hidden" name="lastNum" value="<c:out value="${status.index}"/>"/>
							<table>
								<tr>
									<td class="tdTitle firstTd"><label>*</label>&nbsp;제품</td>
									<td class="tdContents firstTd">
										<%-- <input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmFkKey" name="mtPmFkKey" value="<c:out value="${list.mtPmFkKey}"/>" class="search" required/>	
										<input type="hidden" id="prodList-<c:out value="${status.index}"/>-pmNmCd" name="pmNmCd" value="<c:out value="${list.pmNmCd}"/>" /> --%>
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmNmCd" name="mtPmNmCd" value="<c:out value="${list.mtPmNmCd}"/>" class="search" onclick="fn_findMtProduct(this)" onkeypress="return false;" required/>	
										<input type="hidden" id="prodList-<c:out value="${status.index}"/>-mtPmFkKey" name="mtPmFkKey" value="<c:out value="${list.mtPmFkKey}"/>"/>	
										<input type="hidden" id="prodList-<c:out value="${status.index}"/>-mtSalesPmKey" name="mtSalesPmKey" value="<c:out value="${list.mtSalesPmKey}"/>"/>	
									</td>
									<td class="tdTitle firstTd"><label>*</label>&nbsp;시리얼번호</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmSerialNum" name="mtPmSerialNum" value="<c:out value="${list.mtPmSerialNum}"/>" required/>
											
									</td>
									<td class="tdTitle firstTd"><label>*</label>&nbsp;수량</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmQuantity" name="mtPmQuantity" value="<c:out value="${displayUtil.commaStr(list.mtPmQuantity)}"/>" amountOnly style="width: 75px;" class="calculate" required/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
										<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
			                        	<img id="prodList-<c:out value="${status.index}"/>-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label>&nbsp;단가</td>
									<td class="tdContents">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmUprice" name="mtPmUprice" value="<c:out value="${displayUtil.commaStr(list.mtPmUprice)}"/>" class="calculate" amountOnly required/>
									</td>	
									<td class="tdTitle"><label>*</label>&nbsp;합계</td>
									<td class="tdContents" colspan="3">
										<input class="productTotalAmount"  type="text" id="prodList-<c:out value="${status.index}"/>-totalAmount" name="totalAmount" style="text-align: right;" value="<c:out value="${displayUtil.makeMultiNumber(list.mtPmQuantity, list.mtPmUprice)}"/>" readonly="readonly"/>
										<input type="hidden" name="beforeTotalAmount" value="<c:out value="${displayUtil.makeMultiNumber(list.mtPmQuantity, list.mtPmUprice)}"/>" readonly="readonly"/>
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label>&nbsp;계약기간</td>
									<td class="tdContents" colspan="3">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmStartDt" name="prodList-<c:out value="${status.index}"/>-mtPmStartDt" class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(list.mtPmStartDt)}"/>" required/>&nbsp;&nbsp;~&nbsp;&nbsp;<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmEndDt" name="prodList-<c:out value="${status.index}"/>-mtPmEndDt" class="calendar toDt" value="<c:out value="${displayUtil.displayDate(list.mtPmEndDt)}"/>" required/>
										<input type="hidden" name="beforeMtPmStartDt" value="<c:out value="${displayUtil.displayDate(list.mtPmStartDt)}"/>"/>
										<input type="hidden" name="beforeMtPmEndDt" value="<c:out value="${displayUtil.displayDate(list.mtPmEndDt)}"/>"/>
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle">상세정보</td>
									<td class="tdContents" colspan="5"><textarea id="prodList-<c:out value="${status.index}"/>-mtPmDetail" name="mtPmDetail"><c:out value="${list.mtPmDetail}"/></textarea></td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle lastTd">비고</td>
									<td class="tdContents lastTd" colspan="5"><textarea id="prodList-<c:out value="${status.index}"/>-remark" name="remark"><c:out value="${list.remark}"/></textarea></td>
								</tr>
							</table>
						</div>
						</c:forEach>
						</c:otherwise>
					</c:choose>				
						
					
				</div>
				<div class="btnWrap floatL">
				<div class="floatL">
					<button type="button"><img src="<c:url value='/images/btn_prev.png'/>" onclick="fn_prevBtn();"/></button>
				</div>
				<div class="floatL btnCenter">
					<button type="button" onclick="fn_saveBtn();"><img src="<c:url value='/images/btn_save.png'/>" /></button>
				<c:if test="${not empty mtSalesOrderVO.mtSalesOrderKey}">						
					<button type="button" onclick="fn_deleteSalesOrderBtn();"><img src="<c:url value='/images/btn_del.png'/>" /></button>						
				</c:if>
				</div>
				
				<c:choose>
					<c:when test="${mtContractCountInfo.mtProductCnt>0}">
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
				<%-- <c:if test="${mtContractCountInfo.mtProductCnt>0}">
				<div class="floatR" >
					<button type="button"><img src="<c:url value='/images/btn_next.png'/>" onclick="fn_nextBtn();"/></button>
				</div>
				</c:if> --%>
				
				<div class="floatN floatC"></div>
			</div>
			</form>
		</div>		
		
		<%-- <form:form commandName="mtListVO" id="mtListForm" name="mtBasicForm" method="post">		
		</form:form >--%>
	</div>
</body>
</html>