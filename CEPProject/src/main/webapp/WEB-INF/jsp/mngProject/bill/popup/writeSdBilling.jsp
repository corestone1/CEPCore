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
			width: 726px;
			height: 522px;
			top: 107px;
			z-index: 3;
			background-color: #f6f7fc;
			/* overflow-y: auto; */
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
			width: 683px;
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
			width: 146px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class^="tdRate"] {
			width: 146px;
			height: 38px;
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class^="tdName"] {
			width: 206px;
			height: 38px;
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class^="readOnly"] {
			background-color: #f6f7fc; 
			border-color: #f6f7fc;
		}
		.popContainer .contents input[class^="readOnlyDt"] {
			width: 146px;
			height: 38px;
			background-color: #f6f7fc; 
			border-color: #f6f7fc;
		}
		
		
		.popContainer .contents textarea {
			width: 433px;
			height: 48px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}
		.popContainer .contents td.tdContents {
			font-size: 14px;
			width : 401px
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
		
	</style>
	
	
	<script>
				
		$(document).ready(function() {
			
			
			
		});	
		
		
		function fnBillingSava() {
			
			var formData = $("#m_frm_billing").serializeArray();
			
			for(var i = 0; i < formData.length; i++)
			{
				//보증기간, 발행일
				if('billIssueDt'   == formData[i]['name']){
					formData[i]['value'] = removeData(formData[i]['value'], '-');
				}//금액
				else if('billAmount'  == formData[i]['name'] 
				|| 'billTax'     == formData[i]['name']
				|| 'billTotal'   == formData[i]['name']){
					formData[i]['value'] = removeCommas(formData[i]['value']);
				}
				else if(('remark') == formData[i]['name']){
					formData[i]['value'] = encodeURI(formData[i]['value']);
				}
				else{
					formData[i]['value'] = formData[i]['value'];
				}
				
				console.log(i+" : " + formData[i]['name'] + " : " + formData[i]['value']);
			}
			
			$.ajax({
	        	url :"/mngProject/bill/saveXmlBilling.do",
	        	type:"POST",  
	            data: formData,
	     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType: 'json',
	            async : false,
	        	success:function(data){		  
	        		alert("계산서가 등록 되었습니다.!");
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	    	});
		}
		
		
		function fnChooseXml(){
			
			alert($('#m_ipt_xmlFile').val());
			
			var formData = new FormData();
			formData.append("xmlFile", $("#xmlFile")[0].files[0]);
   			
			console.log(formData);
			
			$.ajax({ 
   				type: "POST", 
   				enctype: 'multipart/form-data',  
   				url: '/mngProject/bill/xmlFileUpload.do', 
   				data: formData, // 필수 
   				processData: false, // 필수 
   				contentType: false, // 필수 
   				cache: false, 
   				success: function (response) { 
   					console.log(response);
   					fnXmlDataSeting(response);
   				}, 
   				error: function(request, status, error) {
   					if(request.status != '0') {
   						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
   					}
   				}
   			});
		}
		
		
		function fnXmlDataSeting(pobjData) {
			
			$('#m_ipt_billNo').val(pobjData.IssueID);                           // 계산서 승인번호
			$('#m_ipt_billAcKey').val(pobjData.InvoiceePartyID);                // 고객 사업자번호
			$('#m_ipt_billAcNm').val(pobjData.InvoiceePartyNameText);           // 고객 회사명
			$('#m_ipt_billIssueDt').val(addDateMinus(pobjData.IssueDateTime));  // 세금계산서 발행일
			$('#m_ipt_billAcDirector').val(pobjData.PersonNameText);            // 고객 담당자명
			$('#m_ipt_billAcEmail').val(pobjData.URICommunication);             // 고객 담당자 이메일
			
			$('#m_ipt_billAmount').val(addCommas(pobjData.ChargeTotalAmount));  //공급가액
			$('#m_ipt_billTax').val(addCommas(pobjData.TaxTotalAmount));        //세액
			$('#m_ipt_billTotal').val(addCommas(pobjData.GrandTotalAmount));    //합계
			
			$('#m_ipt_remark').val(addCommas(pobjData.DescriptionText));        //비고
		
			
		}
		
		function fnOpenPjPopup(){
			
			//프로젝트 목록 조회
			//window.open('/project/popup/list.do','PROJECT_LIST','width=1000px,height=713px,left=600');
			
		}
		
		function fnSetPjInfo(pstKey, pstNm){
			
			//alert("::"+pstKey+"::"+pstNm);
			$('#m_ipt_pjNm').val(pstNm);
			$('#m_ipt_pjKey').val(pstKey);
			
			
			
			//프로젝트
			var jsonData = {'pjKey' : pstKey};
			
			$.ajax({
	        	url         : "/project/detail/getProjectInfo.do",
	        	type        : "POST",  
	            data        : jsonData,
	     	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType    : 'json',
	            async       : false,
	        	success     :function(data){
	        		console.log(data.projectVO.acNm);
	        		
	        		$('#m_ipt_acNm').val(data.projectVO.acNm);
	        		$('#m_ipt_acKey').val(data.projectVO.acKey);
	            	//alert(data.projectVO.pjkey);
	            },
	        	error       : function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        });
			
		}
		
	</script>
</head>
<body>
	<form id="m_frm_billing" name="billingForm" method="post">
		<input type="hidden" id="m_ipt_bdKey" name="bdKey" value="${gbInfo.bdKey}" />		
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">매출계산서 등록</div>
				</div>
			</div>
			<div class="contents">
				<div>
					<table  style="width: 651px;">
						<tr id="m_tr_account" >             
							<td class="tdTitle">XML 파일</td>
							<td id="" class="tdContents">
							<form id="xmlFileForm" name="xmlFileForm" method="post" enctype="multipart/form-data">
								<input type="file" name="xmlFile" id="xmlFile" onchange="javascript:fnChooseXml();"/>
							</form> 
							</td>
						</tr>
						
						<tr>
							<td class="tdTitle">프로젝트</td>
							<td class="tdContents">
								<input type="text"   id="m_ipt_pjNm"  value="${ProjectInfo.pjNm}" onclick="javascript:fnOpenPjPopup();" class="search" style="width: 315px; background-color: #d3d3d3;" readOnly/>
								<input type="hidden" id="m_ipt_pjKey" name="pjKey"  value="${ProjectInfo.pjKey}"/>
								<input type="hidden" id="m_ipt_billCallKey" name="billCallKey" value="${billingOpInfo.billCallKey}"/>
							</td>
					
						<tr id="m_tr_account" >
							<td class="tdTitle">고객사</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"   id="m_ipt_acNm"  value="${ProjectInfo.acNm}" class=""  style="width: 315px; background-color: #d3d3d3;" disabled/>
								<input type="hidden" id="m_ipt_acKey" name="acKey" value="${ProjectInfo.acKey}"/>
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">계산서 고객사 / 사업자번호</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"   id="m_ipt_billAcNm"    class="tdName" value="${gbInfo.bdGbRate}"/>
								&nbsp;/&nbsp;
								<input type="text"   id="m_ipt_billAcKey"   class="tdRate" value="${gbInfo.bdGbRate}"/> 
							</td>
						</tr>
						
						
						
						<tr id="m_tr_account" >
							<td class="tdTitle">계산서 번호</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_billNo" name="billNo" class="" /> 
							</td>
						</tr>
					
						<tr>
							<td class="tdTitle">발행일</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_billIssueDt" name="billIssueDt" class="calendar fromDt" />
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">고객담당자(성명/Email)</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"   id="m_ipt_billAcDirector" name="bdGbRate" class="tdRate" value="${gbInfo.bdGbRate}"/> 님
								&nbsp;/&nbsp;
								<input type="text"   id="m_ipt_billAcEmail"    name="bdGbRate" class="tdName" value="${gbInfo.bdGbRate}"/> 
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">공급가액/세액</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"   id="m_ipt_billAmount" name="billAmount" class="tdRate" value="${gbInfo.bdGbRate}"/> 원 
								&nbsp;/&nbsp;
								<input type="text"   id="m_ipt_billTax"    name="billTax" class="tdRate" value="${gbInfo.bdGbDay}"/> 원
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">합계</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"   id="m_ipt_billTotal"  name="billTotla" class="tdRate"/> 원
							</td>
						</tr>
						
						<input type="hidden" id="m_ipt_remark" name="remark" />
						
					</table>
				</div>
				<div class="btnWrap floatR">
					<div id="m_btn_save" class="floatR" style="">
				
						<button type="button" onclick="javascript:fnBillingSava();">
							<img src="<c:url value='/images/btn_save.png'/>" />
						</button>
						
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</div>	
	</form>
	
</body>
</html>