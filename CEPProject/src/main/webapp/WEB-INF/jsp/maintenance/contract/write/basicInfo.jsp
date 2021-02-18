<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
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
			width: calc(100% - 201px);
			height: 601px;
			top: 107px;
			left: 201px;			
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto;
		}
		.popContainer .contents > div {
			width: calc(100% - 80px);
			/* margin: 10px 40px 15px 40px; */
			margin: 10px 40px 15px 45px;
		}
		.popContainer .contents > div:first-child {
			min-height: 519px;
		}
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
		}
		/* .popContainer .contents > div > table tr:first-child td {
			margin-bottom: 100px;
		} */
		.popContainer .contents select {
			width: 220px;
			height: 38px;
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
		.popContainer .contents input {
			width: calc(100% - 37px);
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="search"] {
			width: 200px;
			height: 38px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class="pname"] {
			width: 380px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 198px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: calc(100% - 37px);
			height: 114px;
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
			width: 99px;
		}					
		.popContainer .contents td.tdSubTitle {
		    margin-top: 11px;
		    font-size: 14px;
		    color: #525252;
		    padding-right: 9px;
		    padding-left: 19px;
		    width: 87px;
		}	
		.popContainer .contents td.tdContents {
			width: 720px;
			font-size: 14px;
    		color: #525252;
		} 
		.popContainer .contents .btnWrap {
			margin : 10px 48px 15px 48px;
		}
		.btnCenter {
			width : calc(100% - 90px);
			text-align: center;
		}
		.popContainer .contents td label {
			color: red;
			vertical-align: middle;
      	}
      	.accountList li {
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
			font-size: 14px;
			color: #21a17e;
		}
		/* .search_in{display: block;margin: 4px 79px 0 10px;}  

		.search_in input{width:100%} */


	</style>
	<script>
		$(document).ready(function() {
			'<c:if test="${basicContractInfo != null }">'
				//고객사 담당자 셋팅
				$('#mtAcDirectorKey').val("${basicContractInfo.mtAcDirectorKey}").attr("selected", "true");
				//관리담당자 셋팅
				$('#mtMngEmpKey').val("${basicContractInfo.mtMngEmpKey}").attr("selected", "true");
				//지원담당자 셋팅
				$('#mtSupportEmpKey').val("${basicContractInfo.mtSupportEmpKey}").attr("selected", "true");
				//영업담당자 셋팅
				$('#mtSaleEmpKey').val("${basicContractInfo.mtSaleEmpKey}").attr("selected", "true");
				//부가세 포함 셋팅
				$("input:radio[name='taxYn']:radio[value='${basicContractInfo.taxYn}']").prop('checked', true);
				//검수방법 셋팅
				//$('#mtImCd').val("${basicContractInfo.mtImCd}").attr("selected", "true");
				$("input:radio[name='mtImCd']:radio[value='${basicContractInfo.mtImCd}']").prop('checked', true);
				//백계약유무셋팅
				//$('#mtSbCtYn').val("${basicContractInfo.mtSbCtYn}").attr("selected", "true");
				$("input:radio[name='mtSbCtYn']:radio[value='${basicContractInfo.mtSbCtYn}']").prop('checked', true);
								
				if("Y" == "${basicContractInfo.mtSbCtYn}"){
					$('#back_order').show();
					$('#back_buy').show();
				} else {
					$('#back_order').hide();
					$('#back_buy').hide();
				}				
				//보증증권유무 셋팅
				//$('#gbYn').val("${basicContractInfo.gbYn}").attr("selected", "true");
				$("input:radio[name='gbYn']:radio[value='${basicContractInfo.gbYn}']").prop('checked', true);
			'</c:if>'
			
			'<c:if test="${basicContractInfo.mtForcastLinkVo.mtLinkKey != null }">'
				$('#delete_forecast').show();
			'</c:if>'
			
				//거래처 검색
				$("#mtAcNm").on("keydown", function(event){
					
					if(event.keyCode == 13) {		
						
						fnSearchAccoutList(this, $(this).val());
					}						
				});
			
		});//end $(document).ready()
		
		$(function(){			
			//var acDirectorList; // 고객 담당자 정보 리스트

			/* 고객사 선택하면 고객담당자 정보 가져오기. */
			$('#mtAcKey').change(function(){
				
		        $.ajax({
		        	url:"/maintenance/contract/selectAcDirectorList.do",
		            dataType: 'json',
		            type:"post",  
		            data: $('#mtAcKey').val(),
		     	   	contentType: "application/json; charset=UTF-8",
		     	  	beforeSend: function(xhr) {
		        		xhr.setRequestHeader("AJAX", true);
		        		//xhr.setRequestHeader(header, token);
		        	},
		            success:function(data){		            	
						if ( data.acDirectorList.length > 0 ) {
							//acDirectorList = data.acDirectorList;/* 값이 있는 경우  전역변수에 넣는다. */
							//console.log("===============>"+data.acDirectorList[0].acDirectorInfo);
							$('#acDirectorInfo').val(data.acDirectorList[0].acDirectorInfo);/* 첫번째 값을 셋팅해준다. */
							$ ('#mtAcDirectorKey' ).find ( 'option' ).remove (); /* select box 의 ID 기존의  option항목을 삭제 */
							for ( var idx = 0 ; idx < data.acDirectorList.length ; idx++ ) {
                        		$ ('#mtAcDirectorKey' ).append ( "<option value='"+data.acDirectorList[idx].acDirectorKey+"'>" + data.acDirectorList[idx].acDirectorNm + '</option>' );
                      		}
							
							$ ('#mtAcDirectorCheck' ).find ( 'option' ).remove (); /* select box 의 ID 기존의  option항목을 삭제 */
							for ( var idx = 0 ; idx < data.acDirectorList.length ; idx++ ) {
                        		$ ('#mtAcDirectorCheck' ).append ( "<option value='"+data.acDirectorList[idx].acDirectorKey+"'>" + data.acDirectorList[idx].acDirectorInfo + '</option>' );
                      		}
		                }else{
		                	//acDirectorList = null;
							$ ( '#mtAcDirectorKey' ).find ( 'option' ).remove ();
		                 	$ ( '#mtAcDirectorKey' ).append ( "<option value=''>담당자</option>" );
		                 	//acDirectorInfo 값 지움
		                 	$('#acDirectorInfo').val('');
		                 	
		                 	$( '#mtAcDirectorCheck' ).find ( 'option' ).remove ();
		                }
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		        });
				
			}); 
			
			/* 고객담당자 선택하면 고객담당자 정보 변경하기  */			
			$('#mtAcDirectorKey').change(function(){
				var checkVal = $('#mtAcDirectorKey option:selected').val();
				
				$('#mtAcDirectorCheck option').each(function() { 
					if (this.value == $('#mtAcDirectorKey').val()) { 
						
						$('#acDirectorInfo').val(this.text);
						return false;
					}
				});
				
				/* if(acDirectorList.length>0){
					for ( var idx = 0 ; idx < acDirectorList.length ; idx++ ) {
						if(checkVal == acDirectorList[idx].mtAcDirectorKey ){
							$('#acDirectorInfo').val(acDirectorList[idx].acDirectorInfo);
							break;
						}
					}					
				}	 */			
			});			
			
		}); // end $(function(){}
		
		//거래처 검색
		function fnSearchAccoutList(pObject, pstAccountNm) {
			$('#div_accountList').remove();
		
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
		/* var fnViewAccountList = function(pObject, pjAccountList){ */
			function fnViewAccountList(pObject, pjAccountList){
			var html = '<div id="div_accountList" style="width:179px; padding-top: 7px; margin-left: 112px; padding-bottom: 7px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1); position: absolute;">'
			         + '<ul class="accountList">'
			       ;//+ '<div style="margin: 5px;">';
			       
			       for(var i=0; i < pjAccountList.length; i++) {			    	  
			    	   //console.log("=====>"+pjAccountList[i].acKey+" / "+pjAccountList[i].acNm)
			    	   html += '<li id="li_account" title="'+ pjAccountList[i].acKey +'">' + pjAccountList[i].acNm + '</li>';
			    	}
			       
			       
			    html +=  '</ul>'
			          + '</div>'
			         ;//+ '</div>';
			//$('#td_account').after(html);
			$('#tr_account').after(html);
			
			
			$("[id^='li_account']").click(function(event) {
				
				$('#mtAcNm').val(this.innerText); 
				$('#mtAcKey').val(this.title);
				$('#mtAcKey').change();
				$('#div_accountList').remove();
			});
		};
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
					if(confirm("유지보수계약 제품정보 화면으로 이동하시겠습니까?")){
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
						alert(" 유지보수계약 제품정보가 등록되지 않았습니다.\n 유지보수계약 제품정보를 먼저 등록하세요.");
						return false;
					}					
					
				} else if(varUrl == "backOrderInfoView"){
					if("${basicContractInfo.mtSbCtYn}" == "Y"){
						
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
					
					if("${basicContractInfo.mtSbCtYn}" == "Y"){
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
		
		
		function fn_saveBtn(){
			//필수값 체크를 완료하면 저장 프로세스 시작.
			if ($("#mtBasicForm")[0].checkValidity()){
				if($('#mtIntegrateKey').val() !=''){
					if(confirm("유지보수계약 기본정보를 수정하시겠습니까?")) {
						saveBasicInfo();
					}
				} else {
					if(confirm("유지보수계약 기본정보를 저장하시겠습니까?")) {
						saveBasicInfo();
					}
				}
				
			}  else {
				 //Validate Form
		        $("#mtBasicForm")[0].reportValidity();	
			}
		}
		/*
		*내용을 저장한다.
		*/
		function saveBasicInfo(){
			$('#mtAmount').val(removeCommas($('#mtAmount').val()))
           	var object = {};
			var linkObject = {};
           	var formData = $("#mtBasicForm").serializeArray();
           	for (var i = 0; i<formData.length; i++){
                
           		if("mtCtDt" == formData[i]['name'] || "mtStartDt" == formData[i]['name'] || "mtEndDt" == formData[i]['name']) {
                	//날짜 - 제거
                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
                } else if("mtAmount" == formData[i]['name']){
                	//컴마제거
                	object[formData[i]['name']] = removeData(formData[i]['value'], ",");
                } else {
                	object[formData[i]['name']] = formData[i]['value'];
                }      
             }
           	
           	if($('#mtLinkCtKey').val() !='' || $('#linkDeleteKey').val() !='') {
           		linkObject['mtLinkKey'] = $('#mtLinkKey').val();
           		linkObject['mtLinkCtKey'] = $('#mtLinkCtKey').val();
           		linkObject['linkDeleteKey'] = $('#linkDeleteKey').val();
           		
           		object["mtForcastLinkVo"]=linkObject;     
           	}
           	var sendData = JSON.stringify(object);
           	
           	 $.ajax({
	        	url:"/maintenance/contract/write/basicInfo.do",
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
	            		if($('#mtIntegrateKey').val() !=''){
	            			alert("유지보수계약 기본정보 수정을 성공하였습니다.");
	            		} else {
	            			alert("유지보수계약 기본정보 등록을 성공하였습니다.");
	            			//유지보수 계약정보 관리키를 셋팅한다.
	            			//$('#mtIntegrateKey').val(paramData.mtIntegrateKey);
	            		}
	            		
		            	var url = '/maintenance/contract/write/basicInfoView.do';
		    			var dialogId = 'program_layer';
		    			var varParam = JSON.parse(data)
		    			var button = new Array;
		    			button = [];
		    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
	            	} else {
	            		if($('#mtIntegrateKey').val() !=''){
	            			alert("유지보수계약 기본정보 수정을 실패하였습니다.");
	            		} else {
	            			alert("유지보수계약 기본정보 등록을 실패하였습니다.");
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
		
		
		function fn_nextBtn(){
			if($('#mtIntegrateKey').val() !=''){
				if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수계약 제품정보 등록화면으로 이동하시겠습니까?")) {
					//saveBasicInfo();
					var url = '/maintenance/contract/write/productInfoView.do';
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
				alert(" 유지보수계약 기본정보가 등록되지 않았습니다.\n 유지보수계약 기본정보를 먼저 등록하세요.");
			}
		}
		

		
		
		function gbYnClick(param) {
			if("Y" == param){
				$('#file_upload').show();
			} else {
				$('#file_upload').hide();
			}
		}
		
		function mtSbCtYnClick(param) {
			if("Y" == param){
				$('#back_order').show();
				$('#back_buy').show();
			} else {
				$('#back_order').hide();
				$('#back_buy').hide();
			}
		}
		
		
		
		function fn_forecastPop() {
			//window.open('/forecast/popup/searchList.do?returnType=F&returnKey=mtLinkCtKey&returnNm=mtLinkCtKeyNm&pjFlag=M','FORECAST_LIST','width=1000px,height=713px,left=600');
			window.open('/forecast/popup/searchList.do?returnType=F&returnFunctionNm=pop_forecastCall&pjFlag=M','FORECAST_LIST','width=1000px,height=713px,left=600');
		}
		
		function pop_forecastCall(returnKey,returnNm) {
			
			$('#mtLinkCtKey').val(returnKey);
			$('#mtLinkCtKeyNm').val(returnNm);
			if($('#mtLinkCtKey').val() !='') {
				$('#delete_forecast').show();
			}
		}
		
		function fn_deleteForecast() {
			if(confirm("FORECAST 연계정보를 삭제하시겠습니까?")) {
				
				if($('#mtLinkKey').val() !='') {
					$('#linkDeleteKey').val($('#mtLinkKey').val());
					$('#mtLinkKey').val('');
				}
				$('#mtLinkCtKey').val('');
				$('#mtLinkCtKeyNm').val('');
				$('#delete_forecast').hide();
			} else {
				return false;
			}
			
		}
		
	    /*
	      hidden값 변경하면 이벤트 발생
	    */
		/* survey('#mtLinkCtKey', function(){
			//console.log('changed');
			//mtLinkCtKey값이 존재하면 삭제 이미지 활성화 시킴.
			if($('#mtLinkCtKey').val() !='') {
				$('#delete_forecast').show();
			}
		}); */
		
	</script>
</head>
<body>
	<form action="/" id="mtBasicForm" name="mtBasicForm"  method="post">
	<%-- <form:form commandName="mtBasicForm" id="mtBasicForm" name="mtBasicForm" method="post"> --%>		 
		<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>"/> <!-- 유지보수 계약 관리키  -->
		<input type="hidden" id="parmMtSbCtYn" name="parmMtSbCtYn" value="<c:out value="${basicContractInfo.mtSbCtYn}"/>"/><!-- 백계약여부 --> 
		<input type="hidden" id="linkDeleteKey" name="linkDeleteKey"/>				
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">유지보수 등록</div>
				</div>
			</div>
			<div class="left">
				<ul class="ftw400">
					<li class="colorWhite cursorP on">기본정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('productInfoView');">제품정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('salesInfoView');">매출정보</li>
					
					<li id="back_order" class="colorWhite cursorP" onclick="fn_changeView('backOrderInfoView');" style="display:none">백계약정보</li>
					<li id="back_buy" class="colorWhite cursorP" onclick="fn_changeView('purchaseAmountView');" style="display:none">매입정보</li>
				</ul>
			</div>
			<div class="contents">
				<div>
					<table>
						<%-- <tr>
							<td class="btnFc" colspan="2">
								<button type="button" onclick="javascript:fn_forecastPop()"><img src="<c:url value='/images/forecast.png'/>" /></button>
								<input type="text" name="pmNm" id="pmNm" class="pname" value="<c:out value="${basicContractInfo.acDirectorInfo}"/>" readonly/>
								<input type="hidden" name="pmKey" id="pmKey"  value="<c:out value="${basicContractInfo.mtAcKey}"/>" />
							</td>
							
						</tr> --%>
						<tr>
							<td class="tdTitle">FORECAST명</td>
							<td class="tdContents">
								<button type="button" onclick="javascript:fn_forecastPop()" style="vertical-align: middle;">
									<img src="<c:url value='/images/forecast_icon.png'/>" />
								</button>
								<input type="text" name="mtLinkCtKeyNm" id="mtLinkCtKeyNm" class="pname" value="<c:out value="${basicContractInfo.mtForcastLinkVo.mtLinkCtKeyNm}"/>" readonly="readonly"/>
								
								<input type="hidden" name="mtLinkCtKey" id="mtLinkCtKey"  value="<c:out value="${basicContractInfo.mtForcastLinkVo.mtLinkCtKey}"/>" />
								<input type="hidden" name="mtLinkKey" id="mtLinkKey"  value="<c:out value="${basicContractInfo.mtForcastLinkVo.mtLinkKey}"/>" />
								<img id="delete_forecast" src="<c:url value='/images/popup_close.png'/>" onclick="fn_deleteForecast();" style="width: 11px;display:none"/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 프로젝트명</td>
							<td class="tdContents">
								<input type="text" name="mtNm" value="<c:out value="${basicContractInfo.mtNm}"/>" required/>
							</td>
						</tr>
						<tr id="tr_account">
							<td class="tdTitle"><label>*</label> 고객사</td>
							<td class="tdContents">
								<input type="text" name="mtAcNm" id="mtAcNm" class="search" value="<c:out value="${basicContractInfo.mtAcNm}" />" autocomplete="off"  required/>	
								<input type="hidden" name="mtAcKey" id="mtAcKey"  value="<c:out value="${basicContractInfo.mtAcKey}"/>" />	
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 고객사담당자</td>
							<td class="tdContents">
								<select id="mtAcDirectorKey" name="mtAcDirectorKey" required>									
									<c:forEach var="item" items="${acDirectorList}" varStatus="status">										
									<option value="<c:out value="${item.acDirectorKey}"/>"><c:out value="${item.acDirectorNm}"/></option>
									</c:forEach>									
								</select>
								<select id="mtAcDirectorCheck"  style="display:none">															
									<c:forEach var="item" items="${acDirectorList}" varStatus="status">
										<option value="<c:out value="${item.acDirectorKey}"/>"><c:out value="${item.acDirectorInfo}"/></option>
									</c:forEach>							
								</select>		
								<input type="text" id="acDirectorInfo" class="pname" value="<c:out value="${basicContractInfo.acDirectorInfo}"/>" readonly/>
							</td>
						</tr>						
						<tr>
							<td class="tdTitle"><label>*</label> 관리담당자</td>
							<td class="tdContents">
								<select id="mtMngEmpKey" name="mtMngEmpKey" required>
									<c:forEach var="emp" items="${empList}" varStatus="status">										
									<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
									</c:forEach>	
								</select>
							</td>
						</tr>
						
						<tr>
							<td class="tdTitle"><label>*</label> 지원담당</td>
							<td class="tdContents">
								<select id="mtSupportEmpKey" name="mtSupportEmpKey" required>
									<c:forEach var="emp" items="${empList}" varStatus="status">										
									<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
									</c:forEach>	
								</select>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 영업담당</td>
							<td class="tdContents">
								<select id="mtSaleEmpKey" name="mtSaleEmpKey" required>
									<c:forEach var="emp" items="${empList}" varStatus="status">										
									<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
									</c:forEach>	
								</select>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 계약일자</td>
							<td class="tdContents">
								<input type="text" name="mtCtDt" class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(basicContractInfo.mtCtDt)}"/>" required/>
							</td>
						</tr>
						
						<tr>
							<td class="tdTitle"><label>*</label> 유지보수기간</td>
							<td class="tdContents">
								<input type="text" name="mtStartDt" placeholder="from" class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(basicContractInfo.mtStartDt)}"/>" required/> ~ 
								<input type="text" name="mtEndDt" placeholder="to" class="calendar toDt" value="<c:out value="${displayUtil.displayDate(basicContractInfo.mtEndDt)}"/>" required/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 유지보수금액</td>
							<td class="tdContents">
								<input type="text"  id="mtAmount" name="mtAmount" value="<c:out value="${displayUtil.commaStr(basicContractInfo.mtAmount)}"/>" amountOnly required style="width: 198px; text-align: right;"/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 부가세 포함</td>
							<td class="tdContents">
								<input type="radio" class="tRadio" name="taxYn" value="Y" id="hasVAT1" /><label for="hasVAT1" class="cursorP"></label>&nbsp;&nbsp;Y
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" class="tRadio" name="taxYn" value="N" id="hasVAT2" checked="checked"/><label for="hasVAT2" class="cursorP"></label>&nbsp;&nbsp;N
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 결재조건</td>
							<td class="tdContents">
								<input type="text"  id="mtPayTerms" name="mtPayTerms" style="width: 198px" value="<c:out value="${basicContractInfo.mtPayTerms}"/>" required/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 검수방법</td>
							<td class="tdContents">
								<!-- <select id="mtImCd" name="mtImCd" required>
									<option value="온라인">온라인</option>
									<option value="오프라인">오프라인</option>
								</select> -->
								<input type="radio" class="tRadio" name="mtImCd" value="온라인" id="hasImCd1" /><label for="hasImCd1" class="cursorP"></label>&nbsp;&nbsp;온라인
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" class="tRadio" name="mtImCd" value="오프라인" id="hasImCd2" checked="checked"/><label for="hasImCd2" class="cursorP"></label>&nbsp;&nbsp;오프라인
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 정기점검횟수</td>
							<td class="tdContents">
								<input type="text"  name="mtRgInspectCnt" numberOnly style="width: 198px" value="<c:out value="${basicContractInfo.mtRgInspectCnt}"/>" required/>&nbsp;회								
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 백계약유무</td>
							<td class="tdContents">
								<!-- <select id="mtSbCtYn" name="mtSbCtYn" style="width: 56px" required>
									<option value="N">N</option>
									<option value="Y">Y</option>
								</select> -->
								<input type="radio" class="tRadio" name="mtSbCtYn" value="Y" id="hasSbCt1" onclick="mtSbCtYnClick('Y');"/><label for="hasSbCt1" class="cursorP"></label>&nbsp;&nbsp;Y
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" class="tRadio" name="mtSbCtYn" value="N" id="hasSbCt2" checked="checked" onclick="mtSbCtYnClick('N');"/><label for="hasSbCt2" class="cursorP"></label>&nbsp;&nbsp;N
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 보증증권유무</td>
							<td class="tdContents">								
								<!-- <select name="gbYn" id="gbYn" style="width: 56px" required>
									<option value="N">N</option>
									<option value="Y">Y</option>
								</select> -->	
								<input type="radio" class="tRadio" name="gbYn" value="Y" id="hasGbYn1" /><label for="hasGbYn1" class="cursorP"></label>&nbsp;&nbsp;Y
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" class="tRadio" name="gbYn" value="N" id="hasGbYn2" checked="checked"/><label for="hasGbYn2" class="cursorP"></label>&nbsp;&nbsp;N
							</td>
						</tr>
						<tr>
							<td class="tdTitle veralignT">비고</td>
							<td class="tdContents" ><textarea name="remark"><c:out value="${basicContractInfo.remark}"/></textarea></td>
						</tr>
						<tr>
							<td class="tdTitle veralignT">첨부파일</td>
							<td class="tdContents"><button type="button"><img src="<c:url value='/images/btn_file.png'/>" /></button></td>
						</tr>
					</table>
				</div>
				<div class="btnWrap floatL">
					<%-- <div class="floatL">
						<button type="button"><img src="<c:url value='/images/btn_file.png'/>" /></button>
					</div> --%>
					<div class="floatL btnCenter">
						<button type="button" onclick="fn_saveBtn();"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<c:choose>
						<c:when test="${basicContractInfo !=null}">
					<div class="floatR"  style="margin-right: 22px;">
						<button type="button" onclick="fn_nextBtn();"><img src="<c:url value='/images/btn_next.png'/>"/></button>
					</div>
						</c:when>
						<c:otherwise>
					<div class="floatR"  style="margin-right: 22px;">
						<img src="<c:url value='/images/btn_non_next.png'/>"/>
					</div>						
						</c:otherwise>
					</c:choose>
					<%-- <div class="floatR" style="margin-right: 22px;">
						<button type="button" onclick="fn_saveBtn();"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div> --%>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</div>	
	</form>
	<%-- </form:form> --%> 
</body>
</html>