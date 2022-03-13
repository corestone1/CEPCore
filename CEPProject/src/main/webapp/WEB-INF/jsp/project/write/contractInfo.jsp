<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
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
			margin: 10px 40px 0 40px;
		}
		.popContainer .contents > div:first-child {
			min-height: 529px;
		}
		.popContainer .contents > div > form >table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
	  		width: 769px;
		}
		/* .popContainer .contents > div > table tr:first-child td {
			margin-bottom: 100px;
		} */
		.popContainer .contents .acNm {
			font-size: 18px;
    		color: #535353;
    		margin-bottom: 7px;
		}
		.popContainer .contents td.tdTitle {
			margin-top: 11px;
		    font-size: 14px;
		    color: #525252;
		    padding-right: 20px;
		    width: 13%;
		    font-weight: 400;
		    width: 75px;
		}
		.popContainer .contents td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer .contents td.tdContents {
			width: 691px;
		} 	
		.popContainer .contents td:last-child {
			padding-right: 0px !important;
		} 				
		#salesListForm {
			padding-left: 94px;
			font-size: 15px;
		}
		.popContainer .top div[class="subTitle"] {
			height: 36px;
			width: 124px;
			border-radius: 35px;
			color: #fff;
			background-color: #9284d1;
			margin-left: 150px;
			text-align: center;
			font-weight: 200;
		} 		
		.popContainer .contents td.firstRow { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  			
			font-size: 14px;				
		}
		.popContainer .contents select {
			width: 130px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;	
		}
		.popContainer .contents select option:first-child{
		 	/* color: #a4a4a4; */
		}
		.popContainer .contents input {
			width: 311px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents .disc {
			font-size: 14px;
		    color: #afafaf;
		}
		.popContainer .contents input[class="rateInfo"] {
			width: 34px !important;
			height: 38px;
		}
		.popContainer .contents input[class="amount"] {
			text-align: right;
		}
		.popContainer .contents input[id^="amount"] {
			width: 122px !important;
		}
		.popContainer .contents input[id^="salesBillFcDt"],
		.popContainer .contents input[id^="salesCollectFcDt"] {
			width: 115px !important;
		}
		#m_div_accountList {
			left: 136px;
    		margin-top: 40px;
		}
		.move {
			display: inline-block;
		}
		.move:hover .moveSpan {
			 visibility: visible;
		}
		.move .moveSpan {
		    visibility: hidden;
		    width: 230px;
		    height: 42px;
		    background-color: #404040;
		    color: #ffffff;
		    text-align: center;
		    border-radius: 6px;
		    padding: 5px 0;
		    position: absolute;
		    z-index: 9999;
		    bottom: 57px;
		    right: 15px;
		    font-size: 14px;
		}
		.move .moveSpan::after {
		    content: "";
		    position: absolute;
		    top: 100%;
		    left: 82%;
		    margin-left: -5px;
		    border-width: 5px;
		    border-style: solid;
		    border-color: #404040 transparent transparent transparent;
		}
		.move .moveSpan.right {
		    left: 15px;
		}
		.move .moveSpan.right::after {
			left: 18%;
		}
	</style>
	<script>
		$(document).ready(function() {
			
			$("#acNm").on("keyup", function(event){
				fn_searchAccoutList(this, $(this).val());				
			}); 
			
			$('input[id^=selectKey]').each(function() {
				if($(this).val() != "" || $(this).val().length != 0) {
					$('.btnSave').children().eq(0).html('');
					$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />');
				}
			})
			
			$('input[id^=rate]').change(function(event) { 
				if($('#sum').val() == null || $('#sum').val() == "" || $('#sum').val() == 0) {
					alert('총 계약금액을 입력해주세요.');
					$('#sum').focus();
					$(this).val('');
				} else {
					$('#amount'+$(this).attr('id').substring(4)).val($('#sum').val().replace(/,/g, '') * $(this).val() / 100);	
				}
			});
		});
		
		
		function fn_searchAccoutList(pObject, pstAccountNm) {
			$('#m_div_accountList').remove();
		
			var jsonData = {'acNm' : pstAccountNm, 'acSalesYN' : 'Y' };
			
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
			$(pObject).parent().after(html);
			
			$("[id^='m_li_account']").click(function(event)
			{
				//alert(this.title);
				
				$(pObject).next().val(this.title); 
				$(pObject).val(this.innerText);
				/* if(!pObject.id.includes("sales")) {
					fn_selectAc();
				} */
				
				$('#m_div_accountList').remove();
			});
			
		}
					
		
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
								
							if(this.name=="salesTurnAmount") {
								//숫자에서 컴마를 제거한다.
								obj[this.name] = removeCommas(this.value); 
							} else if(this.name=="salesBillFcDt" || this.name == "salesCollectFcDt") {
								//날짜에서 -를 제거한다.
								obj[this.name] =  removeData(this.value,"-"); 
							} else {
								obj[this.name] = this.value; 
							}
							
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('salesCollectFcDt' == this.name){
								objArry.push(obj);
								obj = {};
							}
						}); 	              
					} 
				} 
			} catch(e) { 
				alert(e.message); 
			} finally {} 
			return objArry; 
		}
		
		function fn_chkVali() {
            if ($("#basicForm")[0].checkValidity()){ 
               //필수값 모두 통과하여 저장 프로세스 호출.
            	if ($("#salesListForm")[0].checkValidity()){ 
               		fn_save();
            	} else {
            		$("#salesListForm")[0].reportValidity();   
            	}
            } else {
                $("#basicForm")[0].reportValidity();   
            }            
		}
		
		function fn_turnChange(){
			var turnVal = document.getElementById("turnInfo");
			var beforeTurn = parseInt(document.getElementById("beforeTurn").value);
			
			var calcuTurn = turnVal.value - beforeTurn;
			
			if(calcuTurn>0) {
				for(i=0; i<calcuTurn; i++){
					var rowItem = "<tr class='ftw200'>";
					rowItem += "<td>"+(beforeTurn+i+1)+ "회차 :&nbsp;&nbsp;";
					/* <form id='form"+(beforeTurn+i)+"' name='form' display: block !important'>"+(beforeTurn+i+1)+ "회차 :&nbsp;&nbsp;"; */
					rowItem += "<input type='text' name='salesCollectRate' id='rate"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 비율' numberOnly class='rateInfo' required/>";
					rowItem += "&nbsp;&nbsp;%&nbsp;&nbsp;&nbsp;&nbsp;";
					rowItem += "<input type='text' name='salesTurnAmount' id='amount"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 금액' amountOnly class='amount' required />&nbsp;원";
					/* rowItem += "<input type='hidden' name='selectKey' value='"+($('#selectKey'+(beforeTurn+i+1)).val()).equals('')?$('#selectKey'+(beforeTurn+i+1)).val(): +"' />"; */
					/* rowItem += "<input type='hidden' name='salesCtClass' value='P' />"; */
					/* rowItem += "<input type='hidden' class='salesChargeDt' name='salesChargeDt' value='"+$('#salesChargeDt').val() +"' />"; */
			/* 		rowItem += "<input type='hidden' name='collectTurn' value='"+(beforeTurn+i+1)+"' />"; */
					rowItem += "<input type='hidden' name='salesTurn' value='"+(beforeTurn+i+1)+"' />";
					/* rowItem += "<input type='hidden' name='salesTurnAmount' id='sAmount"+(beforeTurn+i+1)+"' value='' />"; */
					rowItem += "<input type='hidden' name='salesKey' value='' />";
					rowItem += "<input type='hidden' name='isNew' value='Y' />";
					/* rowItem += "<input type='hidden' name='ctKey' value='' />"; */
					/* </form></td>"; */
					rowItem += "&nbsp;&nbsp;&nbsp;&nbsp;발행일 :&nbsp;<input type='text' id='salesBillFcDt"+(beforeTurn+i+1)+"' class='calendar' name='salesBillFcDt' placeholder='발행일' value='' required/>"; 
					rowItem += "&nbsp;&nbsp;&nbsp;&nbsp;수금일 :&nbsp;<input type='text' id='salesCollectFcDt"+(beforeTurn+i+1)+"' class='calendar' name='salesCollectFcDt' placeholder='수금일' value='' required/></td>"; 
					rowItem += "</tr>";
					
					$('#addRow').append(rowItem);
				}
			} else {
				var deleteRow = document.getElementById("addRow").rows.length -turnVal.value;
				for(i=0; i<deleteRow; i++){
					document.getElementById("addRow").deleteRow(document.getElementById("addRow").rows.length-1);
				}
			}
			document.getElementById("beforeTurn").value= turnVal.value;
			
			$('input[id^=rate]').change(function(event) { 
				if($('#sum').val() == null || $('#sum').val() == "" || $('#sum').val() == 0) {
					alert('총 계약금액을 입력해주세요.');
					$('#sum').focus();
					$(this).val('');
				} else {
					$('#amount'+$(this).attr('id').substring(4)).val($('#sum').val().replace(/,/g, '') * $(this).val() / 100);	
				}
			});
		}
		
		var countSave = 0;
		/* var ctKeyList = "";
		var salesKeyList = []; */
		
		function fn_save() {
			var sum = null;
			
			for(var i = 0; i < parseInt(document.getElementById("beforeTurn").value); i++) {
				sum += parseInt($('#amount'+(i+1)).val().replace(/,/g, ''));
			}
			
			if(sum == null) {
				alert('회차별 정보를 등록해주세요.');
			}else if(sum != $('#sum').val().replace(/,/g, '')) {
				alert('회차별 금액 합계와 총 계약 금액이 일치하지 않습니다.');
			} else {
				
				$("#collectTurn").val($("#beforeTurn").val());
				
				var object = {};
				
				/* $('.salesChargeDt').each(function() {
					$(this).val($('#salesChargeDt').val());	
				}); */
				
				/* for(var i = 1; i <= $('#beforeTurn').val(); i++) {
					$('#sAmount'+i).val($('#amount'+i).val());
				} */
				
				var formData = $("#basicForm").serializeArray();
				var listData = $("form[name=salesListForm]").serializeObject();
			 	
				for (var i = 0; i<formData.length; i++){
					if(formData[i]['name']=="ctAmount") {
						//숫자에서 컴마를 제거한다.
						object[formData[i]['name']] = removeData(formData[i]['value'], ",");
					} else if(formData[i]['name']=="ctDt") {
						//날짜에서 -를 제거한다.
						object[formData[i]['name']] = removeData(formData[i]['value'],"-");
					} else {
						object[formData[i]['name']] = formData[i]['value'];
					}
	            }
				
				object["projectContractSalesVOList"]=listData;
				
				var sendData = JSON.stringify(object);
			 	$.ajax({
					url:"/project/insert/contractInfo.do",
					dataType: 'json', 
				    type:"POST",  
				    data: sendData,
				    async:false, 
				 	contentType: "application/json; charset=UTF-8", 
					beforeSend: function(xhr) {
						xhr.setRequestHeader("AJAX", true);
						//xhr.setRequestHeader(header, token);
						
					},
				    success:function(response){	
				    	if(response!= null && response.successYN == 'Y') {
				    		countSave++; 
				    		/* for(var i = 0; i < response.ctKey.length; i++) {
				    			salesKeyList.push(response.saleKey[i]); 
				    		} 
				    		ctKeyList.push(response.ctKey); */
				    		
				    		if($("input[name=selectKey]").val() == null || $("input[name=selectKey]").val() == "" || $("input[name=selectKey]").val().length == 0) {
					    		alert("프로젝트 계약 정보가 등록되었습니다.");
					    		countSave++;
				    		} else {
				    			alert("프로젝트 계약 정보가 수정되었습니다.");
				    		}
				    		
				    		var url='/project/write/contractInfo.do';
			    			var dialogId = 'program_layer';
			    			var varParam = {
								"pjKey":$("#pjKey").val()
			    			}
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
				    	} else {
				    		if($("#selectKey").val() == null || $("#selectKey").val() == "" || $("#selectKey").val().length == 0) {
				    			alert("프로젝트 계약 정보 등록이 실패하였습니다.");
				    		} else {
				    			alert("프로젝트 계약 정보 수정이 실패하였습니다.");
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
		
		function fn_next(link) {
			if(countSave > 0) {
				var url = '/project/write/'+link+'.do';
				var dialogId = 'program_layer';

				var varParam = {
						"pjKey": $("#pjKey").val()/* ,
						"turnNo": $("#beforeTurn").val(),
						"ctKey": ctKeyList,
						"salesKey": salesKeyList  */
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			}
			else {
				/* if($('#selectKey').val() != "" || $('#selectKey').val().length != 0) { */
					var ctKey = "";
					var salesKey = [];
					for(var i = 0; i < $('#beforeTurn').val(); i++) {
						salesKey.push($('#salesKey'+i).val());
					}
					ctKey = $('#ctKey').val();
					var url = '/project/write/'+link+'.do';
					var dialogId = 'program_layer';
					var varParam = {
							"pjKey": $("#pjKey").val()/* ,
						 	"turnNo": $("#beforeTurn").val(),
							"ctKey":ctKey,
							"salesKey":salesKey  */
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
				/* } else {
					alert('저장을 해주세요.');
				} */
			}
		}
		
		function fn_prevView(){
			var url = '/project/write/basicInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey" : $('#pjKey').val(),
				"workClass":"프로젝트"
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
				<div class="floatL ftw500">프로젝트 등록</div>
				<div class="subTitle">계약</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
				<li class="colorWhite cursorP on">매출정보</li>
				<li class="colorWhite cursorP" onclick="javascript:fn_next('guarantyInfo')">보증증권</li>
			</ul>
		</div>
		<c:set var = "total" value = "0" />
		<c:set var = "max" value = "0" />
		<c:forEach var="result" items="${salesList}" varStatus="status">     
			<c:set var= "total" value="${total + result.ctAmount}"/>
			<c:if test="${max < result.collectTurn }">
				<c:set var="max" value="${result.collectTurn }" />
			</c:if>
		</c:forEach>
		<fmt:formatNumber value="${total }" pattern="#,###" var="totalAmount"/>
		<div class="contents">
			<div>
				<form id="basicForm">
					<c:forEach var="result" items="${salesList}" varStatus="status">     
						<input type="hidden" id="selectKey${status.index }" name="selectKey" value="${result.salesKey }" />
						<input type="hidden" id="salesKey${status.index }" name="salesKey" value="${result.salesKey }" />
					</c:forEach> 
					<input type="hidden" id="selectKey" name="selectKey" value="${contractVO.ctKey }" />
					<input type="hidden" id="ctKey" name="ctKey" value="${contractVO.ctKey }" />
					<input type="hidden" id="pjKey" name="pjKey" value="${pjKey }" /> 
					<input type="hidden" id="collectTurn" name="collectTurn" value="${contractVO.collectTurn }" /> 
					<input type="hidden" name="statusCd" value="PJST2000" />
					<%-- <input type="hidden" name="salesAcKey" value="${forecastVO.salesAcKey }" /> --%>
					<%-- <div class="acNm">
						<c:if test="${forecastVO.salesAcNm ne null}">매출처 - ${forecastVO.salesAcNm}</c:if>
					</div> --%>
					<table>
						<tr class="ftw200">
							<%-- <td>
								<input type="text" id="salesChargeDt" class="calendar" name="salesChargeDt" placeholder="청구일" value="<c:out value="${displayUtil.displayDate(contractVO.salesChargeDt)}"/>" required/> 
							</td> --%>
							<td class="tdTitle">매출구분</td>
							<td style="width: 141px;">
								<select id="billSalesCd" name="billSalesCd" required>
									<c:forEach var="billSalesCode" items="${salesCodeList}" varStatus="status1">			
										<c:choose>
											<c:when test='${contractVO.billSalesCd == billSalesCode.cdKey}'>
												<option value="<c:out value="${billSalesCode.cdKey}"/>" selected="selected"><c:out value="${billSalesCode.cdNm}"/></option>
											</c:when>
											<c:otherwise>
												<option value="<c:out value="${billSalesCode.cdKey}"/>"><c:out value="${billSalesCode.cdNm}"/></option>
											</c:otherwise>
										</c:choose>										
									</c:forEach>	
								</select>
							</td>
							<td class="tdTitle" style="width: 37px;">제조사</td>
							<td>
								<select id="billMfCd" name="billMfCd" required>
									<c:forEach var="billMfCd" items="${manufacturerList}" varStatus="status2">										
										<c:choose>
											<c:when test='${contractVO.billMfCd == billMfCd.codeKey}'>
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
						<tr class="ftw200">
							<td class="tdTitle">매출처</td>
							<td colspan="3">
								<input type="text" id="acNm" class="search" 
									value="<c:choose><c:when test="${salesList[0].salesAcKey eq null}">${forecastVO.salesAcNm}</c:when><c:otherwise>${salesList[0].acNm}</c:otherwise></c:choose>"/>
								<input type="hidden" id="salesAcKey" name="salesAcKey" value="<c:choose><c:when test="${salesList[0].salesAcKey eq null}">${forecastVO.salesAcKey}</c:when><c:otherwise>${salesList[0].salesAcKey}</c:otherwise></c:choose>" />
							</td>
						</tr>
						<tr class="ftw200">
							<td class="tdTitle">총 계약 금액</td>
							<td class="firstRow" colspan="3">
								<input type="text" id="sum" name="ctAmount" placeholder="총 계약금액"  amountOnly class="amount"  
										value="<c:choose><c:when test="${ contractVO.ctAmount eq null }">${displayUtil.commaStr(forecastVO.fcSalesAmount) }</c:when><c:otherwise>${displayUtil.commaStr(contractVO.ctAmount) }</c:otherwise></c:choose>" required/>&nbsp;원
							</td>
						</tr>
						<tr class="ftw200">
							<%-- <td>
								<input type="text" id="salesChargeDt" class="calendar" name="salesChargeDt" placeholder="청구일" value="<c:out value="${displayUtil.displayDate(contractVO.salesChargeDt)}"/>" required/> 
							</td> --%>
							<td class="tdTitle">결제조건</td>
							<td colspan="3">
								<input type="text" id="ctPayTerms" name="ctPayTerms" placeholder="결제조건" value="<c:out value="${contractVO.ctPayTerms}"/>" />
								<label class="disc">&nbsp;&nbsp;&nbsp;ex. 계산서 발행 후 30일</label>
							</td>
						</tr>
						<tr class="ftw200">
							<td class="tdTitle">계약 일자</td>
							<td colspan="3">
								<input type="text" id="ctDt" class="calendar" name="ctDt" placeholder="계약 일자" title="계약 일자" value="<c:out value="${displayUtil.displayDate(contractVO.ctDt)}"/>" required/>
							</td>
						</tr>
						<tr class="ftw200">
							<td class="tdTitle">계약 금액</td>
							<td colspan="3">
								<input type="hidden" id="beforeTurn" value="${contractVO.collectTurn eq null ? 0 : contractVO.collectTurn }">
								<c:set var="turnNo" value="${contractVO.collectTurn eq null ? 0 : contractVO.collectTurn }" />
								<select id="turnInfo" onchange="fn_turnChange()" placeholder="계약금액">
									<option value="0" <c:if test="${contractVO.collectTurn > 0 }">style='display: none;'</c:if>>수금회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 1}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 1 }">style='display: none;'</c:if> value="1">1회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 2}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 2 }">style='display: none;'</c:if> value="2">2회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 3}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 3 }">style='display: none;'</c:if> value="3">3회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 4}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 4 }">style='display: none;'</c:if> value="4">4회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 5}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 5 }">style='display: none;'</c:if> value="5">5회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 6}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 6 }">style='display: none;'</c:if> value="6">6회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 7}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 7 }">style='display: none;'</c:if> value="7">7회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 8}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 8 }">style='display: none;'</c:if> value="8">8회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 9}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 9 }">style='display: none;'</c:if> value="9">9회차</option>
								</select>
							</td>
						</tr>
					</table>
				</form>
				<form id="salesListForm" name="salesListForm">
					<table id="addRow">
						<c:set var="isFinished" value="N" />
						<c:forEach var="result" items="${sdBillList }" varStatus="status">
							<c:if test="${result.billIssueStatus ==  'M' or result.billIssueStatus == 'E'}">
								<c:set var="isFinished" value="Y" />
							</c:if>
						</c:forEach>
						<c:forEach var="result" items="${salesList }" varStatus="status">
							<tr class='ftw200'>
								<td>
									${result.salesTurn }회차 :&nbsp;
									<input type='text' name='salesCollectRate' id='rate${result.salesTurn }' placeholder='${result.salesTurn }회차 비율' numberOnly class='rateInfo' value="${result.salesCollectRate }" required <c:if test="${isFinished eq 'Y' }">disabled</c:if>/>
									&nbsp;%&nbsp;&nbsp;&nbsp;
									<input type='text' name='salesTurnAmount' id='amount${result.salesTurn }' placeholder='${result.salesTurn }회차 금액' amountOnly class='amount' value="${displayUtil.commaStr(result.salesTurnAmount) }" required <c:if test="${isFinished eq 'Y' }">disabled</c:if>/>&nbsp;원
									<%-- <input type='hidden' name='ctKey' value="${result.ctKey }" id='ctKey${result.collectTurn }'/>  --%>
									<input type='hidden' name='salesKey' value="${result.salesKey }" id='salesKey${result.salesTurn }' />
									<!-- <input type='hidden' name='salesCtClass' value='P' /> -->
									<%-- <input type='hidden' class='salesChargeDt' name='salesChargeDt' value='${result.salesChargeDt }' /> --%>
									<%-- <input type='hidden' name='collectTurn' value='${result.collectTurn }' /> --%>
									<input type='hidden' name='salesTurn' value='${result.salesTurn }' />
									<%-- <input type='hidden' name='salesTurnAmount' id="sAmount${status.count }" value='${result.salesTurnAmount }' /> --%>
									<input type='hidden' name='isNew' value='N' />
									&nbsp;&nbsp;&nbsp;발행일 :&nbsp;<input type="text" id="salesBillFcDt${result.salesTurn }" class="calendar" name="salesBillFcDt" placeholder="발행일" value="<c:out value="${displayUtil.displayDate(result.salesBillFcDt)}"/>" required/>
									&nbsp;&nbsp;&nbsp;수금일 :&nbsp;<input type="text" id="salesCollectFcDt${result.salesTurn }" class="calendar" name="salesCollectFcDt" placeholder="수금일" value="<c:out value="${displayUtil.displayDate(result.salesCollectFcDt)}"/>" required/>
								</td>
							</tr>
						</c:forEach>
					</table>
				</form>
			</div>
			<div class="btnWrap floatR">
				<div class="floatL btnPrev">
					<button type="button" class="move" onclick="fn_prevView();">
						<img src="<c:url value='/images/btn_prev.png'/>" />
						<span class="moveSpan right">저장/수정하지 않은 정보는<br>반영되지 않습니다.</span>
					</button>
				</div>
				<c:set var="systemName" value='<%=session.getAttribute("name") %>'/>
				<c:set var="mngName" value="${pjVO[0].empNm }" />
				<c:if test="${systemName eq mngName }">
					<div class="floatL btnSave">
						<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
				</c:if>
				<div class="floatR">
					<button type="button" class="move" onclick="javascript:fn_next('guarantyInfo')">
						<img src="<c:url value='/images/btn_next.png'/>" />
						<span class="moveSpan">저장/수정하지 않은 정보는<br>반영되지 않습니다.</span>
					</button>
				</div>
				<div class="floatN floatC"></div>
			</div>
		</div>
		<%-- <form id="infoForm" name="infoForm">
			<c:choose>
				<c:when test="${resultList eq null || resultList eq '' || resultList eq 'null' || resultList eq '[]'}">
					<input type="hidden" id="selectKey" value="" />
				</c:when>
				<c:otherwise>
					<c:forEach var="result" items="${salesList}" varStatus="status">     
						<input type="hidden" id="selectKey${status.index }" name="selectKey" value="${result.saleKey }" />
						<c:if test="${status.last}">
							<c:set var="lastIndex" value="${status.last }" />
						</c:if>
					</c:forEach>
					<input type="hidden" id="selectKey${lastIndex }" name="selectKey" value="${contractVO.ctKey }" />
				</c:otherwise>
			</c:choose>
			<input type="hidden" id="pjKey" name="pjKey" value="${contractVO.pjKey }" /> 
		</form> --%>
	</div>
</body>
</html>