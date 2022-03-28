<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		.popContainer .contents {
			position: absolute;
			width: 648px;
			height: 573px;
			top: 107px;
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto; 
		}
		.popContainer .contents > div {
			width: 100%;
		}
		.popContainer .contents > div:first-child {
			width: 433px;
			min-height: 408px;
			margin: 10px 40px 15px 40px;
		}
		
		.popContainer .contents > div:last-child {
			width: 583px;
			margin-right: 50px;
		}
		.popContainer .contents > div > table {
			border-collapse: separate; 
	  		border-spacing: 0 3px;
		}
		.popContainer .contents select {
			width: 248px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.popContainer .contents input {
			width: 385px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="search"] {
			width: calc(100% - 20px);
			height: 38px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class="pname"] {
			width: 300px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 115px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class^="tdRate"] {
			width: 115px;
			height: 38px;
			background-repeat: no-repeat;
			background-position: 95% 50%;
			text-align: right;
		}
		.popContainer .contents input[class^="readOnly"] {
			background-color: #f6f7fc; 
			border-color: #f6f7fc;
		}
		.popContainer .contents input[class^="readOnlyDt"] {
			width: 87px;
			height: 38px;
			background-color: #f6f7fc; 
			border-color: #f6f7fc;
		}
		
		
		/* .popContainer .contents textarea {
			width: 433px;
			height: 48px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		} */
		.popContainer .contents td.tdContents {
			font-size: 14px;
			width : 301px
		} 
		
		.popContainer td.tdTitle {
			font-size: 14px;
			width : 160px;
		}
		
		.accountList li {
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
			font-size: 14px;
			color: #21a17e;
		}
		
		
		.popContainer .contents textarea {
			width: calc(100% - 13px);
			height: 106px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: vertical;
		}
		
		.popContainer td.tdTitle label {
			color: red;
		}
		
	</style>
	
	
	<script>
				
		$(document).ready(function() {
			
			
			
		});	
		
		/* 보증증권 발행요청 */
		function fnGbPublish() {
			
			if ($("#m_frm_gb")[0].checkValidity()){
				var formData = $("#m_frm_gb").serializeArray();
				
				for(var i = 0; i < formData.length; i++)
				{
					//보증기간, 발행일
					if('gbStartDt'   == formData[i]['name']
					|| 'gbEndDt'     == formData[i]['name']
					|| 'gbPublishDt' == formData[i]['name']){
						formData[i]['value'] = removeData(formData[i]['value'], '-');
					}
					 
					//금액
					if('gbAmount' == formData[i]['name'] || "gbContractAmount" == formData[i]['name']){
						formData[i]['value'] = removeCommas(formData[i]['value']);
					}
					
					console.log(i+" : " + formData[i]['name'] + " : " + formData[i]['value']);
				}
				
				$.ajax({
		        	url :"/maintenance/contract/detail/requestGuarantyBond.do",
		        	type:"POST",  
		            data: formData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		/* if(data.gbKey !='' && data.gbKey.length >0) {
		        			alert("보증증권 발행이 요청되었습니다.!");
		        			//발행요청이 성공한 경우 발행증권 리턴받은 key값을 해당 필드에 입력한다.
		        			$("#m_ipt_gbKey").val(data.gbKey);
		        		} else {
		        			alert("보증증권 발행요청이 실패하였습니다.!");
		        		} */
		        		
		        		var mailList = "";
				    	if(data.mailList == "undefined" || data.mailList == null || data.mailList == "") {
				    		mailList = "";
				    	} else {
				    		mailList = "\n메일 수신인: " + data.mailList.join("\n");
				    	}
				    	 
				    	if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'Y') {
				    		alert("보증 증권 발행이 요청되었습니다." + mailList);
				    	} else if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'N') {
			    			alert("메일 전송이 실패했습니다.(발행 요청 정보 저장은 완료)");
				    	} else {
			    			alert("보증 증권 발행이 실패하였습니다.");
				    	}
				    	
				    	location.reload();
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    	});
			} else {
				//Validate Form
	              $("#m_frm_gb")[0].reportValidity();   
			}
			
			
			
		}
		
		function fnGbModify() {
			
			var formData = $("#m_frm_gb").serializeArray();
			
			var jsonDate = {}; 
				
			for(var i = 0; i < formData.length; i++)
			{
				console.log(i+" : " + formData[i]['name'] + " : " + formData[i]['value']);
				//보증기간, 발행일
				if('gbStartDt'   == formData[i]['name']
				|| 'gbEndDt'     == formData[i]['name']
				|| 'gbPublishDt' == formData[i]['name']){
					
					jsonDate[formData[i]['name']]  = removeData(formData[i]['value'], '-');
				}
				else if('gbAmount' == formData[i]['name'] || "gbContractAmount" == formData[i]['name']){ //금액
					if(formData[i]['value'] == '') {
						//제거
					}
					else {
						jsonDate[formData[i]['name']]  = removeCommas(formData[i]['value']);
					}
						
				}
				else {                     
					jsonDate[formData[i]['name']]  = formData[i]['value'];
				}
					
				//console.log(i+" : " + jsonDate[i]['name'] + " : " + jsonDate[i]['value']);
			}
			console.log(" ======= \n " + jsonDate);
			//return;
			
			$.ajax({
	        	url :"/maintenance/contract/detail/modifyGuarantyBond.do",
	        	type:"POST",  
	            data: jsonDate,
	     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType: 'json',
	            async : false,
	        	success:function(data){		  
	        		console.log("data.successYN1==>"+data.successYN);
	        		
	        		if("Y" == data.successYN){
	        			alert("보증증권 정보가 수정 되었습니다.!");
	        		} else {
	        			alert("보증증권 정보 수정을 실패하였습니다.!");
	        		}
	        		
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	    	});
			
		}
		
		
		function fnGbEnd() {
			
			var formData = $("#m_frm_gb").serializeArray();
			
			for(var i = 0; i < formData.length; i++)
			{
				//보증기간, 발행일
				if('gbStartDt'   == formData[i]['name']
				|| 'gbEndDt'     == formData[i]['name']
				|| 'gbPublishDt' == formData[i]['name']){
					formData[i]['value'] = removeData(formData[i]['value'], '-');
				}
				 
				//금액
				if('gbAmount' == formData[i]['name'] || "gbContractAmount" == formData[i]['name']){
					formData[i]['value'] = removeCommas(formData[i]['value']);
				}
				
				console.log(i+" : " + formData[i]['name'] + " : " + formData[i]['value']);
			}
			
			$.ajax({
	        	url :"/maintenance/contract/detail/endGuarantyBond.do",
	        	type:"POST",  
	            data: formData,
	     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType: 'json',
	            async : false,
	        	success:function(data){		  
	        		/* console.log("data.successYN==>"+data.successYN);
	        		if("Y" == data.successYN){
	        			alert("발행이  완료 처리되었습니다.!");
	        		} else {
	        			alert("발행이  실패 하였습니다.!");
	        		} */
	        		var mailList = "";
			    	if(data.mailList == "undefined" || data.mailList == null || data.mailList == "") {
			    		mailList = "";
			    	} else {
			    		mailList = "\n메일 수신인: " + data.mailList.join("\n");
			    	}
			    	 
			    	if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'Y') {
			    		alert("보증 증권 발행이 완료처리 되었습니다." + mailList);
			    	} else if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'N') {
		    			alert("메일 전송이 실패했습니다.(발행완료 처리 정보 저장은 완료)");
			    	} else {
		    			alert("보증 증권 완료 처리가 실패하였습니다.");
			    	}
			    	
			    	location.reload();
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
	<form id="m_frm_gb" name="gbForm" method="post">
		<input type="hidden" id="m_ipt_gbKey" name="gbKey" value="${gbInfo.gbKey}" />	
		<input type="hidden" id="m_ipt_mtIntegrateKey" name="mtIntegrateKey" value="${gbInfo.mtIntegrateKey}" />		
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">계약이행 보증증권 발행 정보</div>
				</div>
			</div>
			<div class="contents">
				<div>
					<table  style="width: 551px;">
						<tr id="m_tr_account" >
							<td class="tdTitle">고객사</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" class="readOnly" value="${gbInfo.mtAcNm}" disabled/> 
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">사업명</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" class="readOnly" value="${gbInfo.mtNm}" disabled/> 
								<input type="hidden" name="mtNm" value="${gbInfo.mtNm}" /> 
								<input type="hidden" name="contractRegEmpKey" value="${mtContractVO.regEmpKey}" />
								<input type="hidden" name="contractSalesEmpKey" value="${mtContractVO.mtSaleEmpKey}" />
							</td>
						</tr>
					
						
						<tr id="m_tr_account" >
							<td class="tdTitle">계약금액</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="gbContractAmount" name="gbContractAmount" value="${displayUtil.commaStr(gbInfo.mtAmount)}" style="width: 115px; text-align: right;" amountonly required/> 
							</td>
						</tr>
						
						<tr>
							<td class="tdTitle">계약기간</td>
							<td class="tdContents">
								<input type="text" class="readOnlyDt" value="${displayUtil.displayDate(gbInfo.mtStartDt)}" disabled/>
								&nbsp~&nbsp
								<input type="text" class="readOnlyDt" value="${displayUtil.displayDate(gbInfo.mtEndDt)}" disabled/>
							</td>
						</tr>
					
						<tr>
							<td class="tdTitle"><label>*</label>보증기간</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_gbStartDt" name="gbStartDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbStartDt)}" required/>
								&nbsp~&nbsp
								<input type="text" id="m_ipt_gbEndDt" name="gbEndDt" class="calendar toDt" value="${displayUtil.displayDate(gbInfo.gbEndDt)}" required/>
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">요율</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"   id="m_ipt_gbRate"    name="gbRate" class="tdRate" value="${gbInfo.gbRate}"/>&nbsp% 
								
							</td>
						</tr>
					<%-- <c:choose>
						<c:when test='${gbInfo.gbIssueYn ne "N"}'>
							<tr id="m_tr_account" <c:if test='${gbInfo.gbIssueYn eq "N"}'>style="display: none;" </c:if>>
								<td class="tdTitle">발행일</td>
								<td id="m_td_account" class="tdContents">
									<input type="text" id="m_ipt_gbPublishDt" name="gbPublishDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbPublishDt)}" />
								</td>
							</tr>
							
							<tr id="m_tr_account" <c:if test='${gbInfo.gbIssueYn eq "N"}'>style="display: none;" </c:if>>
								<td class="tdTitle">증권금액</td>
								<td id="m_td_account" class="tdContents">
									<input type="text" id="m_ipt_gbAmount" name="gbAmount" value="${displayUtil.commaStr(gbInfo.gbAmount)}" amountOnly/>
								</td>
							</tr>
						</c:when>
					</c:choose> --%>
					<c:if test='${gbInfo.gbIssueYn ne "N" and sessionScope.empAuthCd == "EMAU1001"}'>
						<tr id="m_tr_account">
							<td class="tdTitle"><label>*</label>발행일</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_gbPublishDt" name="gbPublishDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbPublishDt)}" required/>
							</td>
						</tr>
						
						<tr id="m_tr_account">
							<td class="tdTitle"><label>*</label>증권금액</td>
							<td id="m_td_account" class="tdContents">
								<%-- <input type="text" id="m_ipt_gbAmount" name="gbAmount" value="${displayUtil.commaStr(gbInfo.gbAmount)}" amountOnly required style="width: 115px;text-align: right;"/> --%>
								<input type="text" id="m_ipt_gbAmount" name="gbAmount" <c:if test="${gbInfo.gbAmount eq 0}">value=""</c:if><c:if test="${gbInfo.gbAmount ne 0 }">value="${displayUtil.commaStr(gbInfo.gbAmount) }"</c:if> amountonly required style="width: 115px;text-align: right;"/>
							</td>
						</tr>
					</c:if>						
					<c:if test='${gbInfo.gbIssueYn == "Y" and sessionScope.empAuthCd ne "EMAU1001"}'>
						<tr id="m_tr_account">
							<td class="tdTitle"><label>*</label>발행일</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" class="readOnlyDt" value="${displayUtil.displayDate(gbInfo.gbPublishDt)}" disabled/>
							</td>
						</tr>
						
						<tr id="m_tr_account">
							<td class="tdTitle"><label>*</label>증권금액</td>
							<td id="m_td_account" class="tdContents">
								<%-- <c:out value="${displayUtil.commaStr(gbInfo.gbAmount)"/> --%>	
								<input type="text" class="readOnlyDt" value="${displayUtil.commaStr(gbInfo.gbAmount)}" disabled/>
							</td>
						</tr>
					</c:if>							
						<tr id="m_tr_account" >
							<td class="tdTitle">발급요청사항</td>
							<td id="m_td_account" class="tdContents">
								<textarea name="remark"><c:out value="${gbInfo.remark}"/></textarea>
							</td>
						</tr>
					</table>
				</div>
				<div class="btnWrap floatR">
					<div id="m_btn_save" class="floatR" style="">
						<c:choose>
							<c:when test='${gbInfo.gbIssueYn eq "N"}'>
								<button type="button" onclick="javascript:fnGbPublish();">
									<img src="<c:url value='/images/btn_stock_publish.png'/>" />
								</button>
							</c:when>
							<c:when test='${gbInfo.gbIssueYn eq "R"}'>
								<c:if test='${sessionScope.empAuthCd == "EMAU1001"}'>
									<button type="button" onclick="javascript:fnGbEnd();">
										<img src="<c:url value='/images/btn_stock_end.png'/>" />
									</button>
								</c:if>
								<button type="button" onclick="javascript:fnGbModify();">
									<img src="<c:url value='/images/btn_stock_mod.png'/>" />
								</button>
							</c:when>
							<%-- <c:otherwise>
								<button type="button" onclick="javascript:fnGbModify();">
									<img src="<c:url value='/images/btn_stock_mod.png'/>" />
								</button>
							</c:otherwise> --%>
						</c:choose>
						
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</div>	
	</form>
	
</body>
</html>