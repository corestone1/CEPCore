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
			width: calc(100% - 80px);
			min-height: 408px;
			margin: 10px 40px 3px 40px;
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
			width: auto;
			height: 31px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: transparent;
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
			height: 73px;
			vertical-align: bottom;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: transparent;
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
			height: 42px;
			font-weight: 500;
		}
		.popContainer tr:last-child td {
			height: 86px;
		}
		.popContainer td.tdContents label {
			font-weight: 300;
		}
		.accountList li {
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
			font-size: 14px;
			color: #21a17e;
		}
		.btnWrap {
			position: relative !important;
			bottom: 0 !important;
			text-align: center;
		}
		.uploadName {
			font-size: 12px !important;
			line-height: normal;
			vertical-align: middle;
			border: 1px solid #ebebeb;
			width: 184px !important;
			height: 26px !important;
		}
		.exFileLabel {
			background-image: url('/images/btn_file.png');
			background-repeat: no-repeat;
			width: 110px;
			height: 26px;
			cursor: pointer;
			float: left;
			margin-top: 1px;
			margin-right: 7px;
		}
		#xmlFile {
			width: 1px;
			position: absolute;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip: rect(0,0,0,0);
			border: 0;
		}
	</style>
	
	
	<script>
				
		$(document).ready(function() {
			var fileTarget = $("#xmlFile");
			
			fileTarget.on('change', function() {
				var filename = $(this)[0].files[0].name;
				$(this).siblings('.uploadName').val(filename)
			});
		});	
		
		
		function fnBillingSave() {
			
			if($(".uploadName").val() == null || $(".uploadName").val() == "" || $(".uploadName").val().length == 0
					|| $("#m_ipt_billNo").val() == null || $("#m_ipt_billNo").val() == "" || $("#m_ipt_billNo").val().length == 0) {
				alert("첨부파일을 등록해 주세요.");
			} else {
				
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
					/* else if(('remark') == formData[i]['name']){
						formData[i]['value'] = encodeURI(formData[i]['value']);
					} */
					else{
						formData[i]['value'] = formData[i]['value'];
					}
					
				}
				
				$.ajax({
		        	url :"/mngProject/bill/saveXmlBilling.do",
		        	type:"POST",  
		            data: formData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		alert("계산서가 등록 되었습니다.");
		        		
	        			var url = '/mngProject/bill/popup/viewWriteSdBilling.do';
			   			var dialogId = 'program_layer';
			   			var varParam = {"billCtFkKey" : $("#billCtFkKey").val()};
			   			
			   			var button = new Array;
			   			button = [];
			   			 
			   			parent.showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:545px');
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    	}); 
			}
		}
		
		function fnBillingCancel() {
			$("#remark").val("");
			
			var formData = $("#m_frm_billing").serializeArray();
			
			for(var i = 0; i < formData.length; i++) {
				//보증기간, 발행일
				if('billIssueDt'   == formData[i]['name']){
					formData[i]['value'] = removeData(formData[i]['value'], '-');
				}//금액
				else if('billAmount'  == formData[i]['name'] 
				|| 'billTax'     == formData[i]['name']
				|| 'billTotal'   == formData[i]['name']){
					formData[i]['value'] = removeCommas(formData[i]['value']);
				}
				/* else if(('remark') == formData[i]['name']){
					formData[i]['value'] = encodeURI(formData[i]['value']);
				} */
				else{
					formData[i]['value'] = formData[i]['value'];
				}
				
			}
			
			$.ajax({
	        	url :"/mngProject/bill/cancelXmlBilling.do",
	        	type:"POST",  
	            data: formData,
	     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType: 'json',
	            async : false,
	        	success:function(data){		  
	        		alert("계산서가 등록 취소 되었습니다.");
	        		
        			var url = '/mngProject/bill/popup/viewWriteSdBilling.do';
		   			var dialogId = 'program_layer';
		   			var varParam = {"billCtFkKey" : $("#billCtFkKey").val()};
		   			
		   			var button = new Array;
		   			button = [];
		   			 
		   			parent.showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:545px');
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	    	}); 
		}
		
		
		function fnChooseXml(){
			
			var formData = new FormData();
			formData.append("xmlFile", $("#xmlFile")[0].files[0]);
			
			$.ajax({ 
   				type: "POST", 
   				enctype: 'multipart/form-data',  
   				url: '/mngProject/bill/xmlFileUpload.do', 
   				data: formData, // 필수 
   				processData: false, // 필수 
   				contentType: false, // 필수 
   				cache: false, 
   				success: function (response) { 
   					fnIsExistBillNo(response);
   				}, 
   				error: function(request, status, error) {
   					if(request.status != '0') {
   						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
   					}
   				}
   			});
		}
		
		
		function fnIsExistBillNo(pobjData) {
			
			var param = {'billNo' : pobjData.IssueID };
			
			$.ajax({ 
				url :"/mngProject/bill/isExistBill.do",
	        	type:"POST",  
	            data: param,
	     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType: 'json',
	            async : false,	
   				success: function (response) { 
   					if(response.xmlBillList[0] == null || response.xmlBillList[0] == undefined) {
   						fnXmlDataSeting(pobjData);
   					} else {
   						alert("이미 매핑된 계산서 입니다. 다시 첨부해 주세요.");
   						$(".uploadName").val('');
   						$("#m_ipt_billNo").val('');
   						$("#m_ipt_billIssueDt").val('');
   						$("#m_ipt_remark").val('');
   					}
   				}, 
   				error: function(request, status, error) {
   					if(request.status != '0') {
   						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
   					}
   				}
   			});
		}
		
		
		function fnXmlDataSeting(pobjData) {
			if(removeCommas($("#m_ipt_billAmount").val()) != pobjData.ChargeTotalAmount ||
					$("#m_ipt_billAcKey").val() != pobjData.InvoiceePartyID ||
					$("#m_ipt_billAcEmail").val() != pobjData.URICommunication) {
				alert("요청된 계산서 정보와 첨부한 계산서 정보가 맞지 않습니다. 다시 첨부해주세요.");
				$(".uploadName").val('');
				$("#m_ipt_billNo").val('');
				$("#m_ipt_billIssueDt").val('');
				$("#m_ipt_remark").val('');
			} else { 
				
				$('#m_ipt_billNo').val(pobjData.IssueID);                           // 계산서 승인번호
				$('#m_ipt_billAcKey').val(pobjData.InvoiceePartyID);                // 매출처 사업자번호
				$('#m_ipt_billAcNm').val(pobjData.InvoiceePartyNameText);           // 매출처 회사명
				$('#m_ipt_billIssueDt').val(addDateMinus(pobjData.IssueDateTime));  // 세금계산서 발행일
				$('#m_ipt_billAcDirector').val(pobjData.PersonNameText);            // 고객 담당자명
				$('#m_ipt_billAcEmail').val(pobjData.URICommunication);             // 고객 담당자 이메일
				
				$('#m_ipt_billAmount').val(addCommas(pobjData.ChargeTotalAmount));  //공급가액
				$('#m_ipt_billTax').val(addCommas(pobjData.TaxTotalAmount));        //세액
				$('#m_ipt_billTotal').val(addCommas(pobjData.GrandTotalAmount));    //합계
				
				$('#m_ipt_remark').val(pobjData.DescriptionText);        //비고
		 	} 
			
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
		<input type="hidden" id="pjKey" name="pjKey" value="${billingOpInfo.pjKey }" />
		<input type="hidden" id="billCtFkKey" name="billCtFkKey" value="${billingOpInfo.salesKey }" />
		<input type="hidden" id="billCallKey" name="billCallKey" value="${billingOpInfo.billCallKey }" />
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
									<input class="uploadName" placeholder="파일선택" disabled="disabled" />
									<label for="xmlFile" class="exFileLabel"></label>
									<input type="file" name="xmlFile" id="xmlFile" onchange="javascript:fnChooseXml();"/>
								</form> 
							</td>
						</tr>
						<tr>
							<td class="tdTitle">승인번호</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_billNo" name="billNo"  value="${billingOpInfo.billNo}" readonly/>
							</td>
						<tr id="m_tr_account" >
							<td class="tdTitle">매출처 / 사업자번호</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_billAcNm" name="billAcNm"  value="${billingOpInfo.billAcNm}" readonly/> / 
								<input type="text" id="m_ipt_billAcKey" name="billAcKey"  value="${billingOpInfo.billAcKey}" readonly/>
							</td>
						</tr>
						<tr id="m_tr_account" >
							<td class="tdTitle">발행일</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_billIssueDt" name="billIssueDt"  value="${displayUtil.displayDate(billingOpInfo.billIssueDt)}" readonly/>
							</td>
						</tr>
						<tr id="m_tr_account" >
							<td class="tdTitle">매출처 담당자</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_billAcDirector" name="billAcDirectorName"  value="${billingOpInfo.billAcDirectorName}" readonly/>
							</td>
						</tr>
						<tr id="m_tr_account" >
							<td class="tdTitle">발행 이메일</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_billAcEmail" name="billIssueEmail"  value="${billingOpInfo.billIssueEmail}" readonly/>
							</td>
						</tr>
						<tr id="m_tr_account" >
							<td class="tdTitle">공급가액 / 세액</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_billAmount" name="billAmount"  value="${displayUtil.commaStr(billingOpInfo.billAmount)}" readonly/> / 
								<input type="text" id="m_ipt_billTax" value="${displayUtil.commaStr(billingOpInfo.billAmount * 0.1)}" readonly/>
							</td>
						</tr>
						<tr id="m_tr_account" >
							<td class="tdTitle">합계</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_billTotal" value="${displayUtil.commaStr(billingOpInfo.billAmount + billingOpInfo.billAmount * 0.1)}" readonly/>
							</td>
						</tr>
						<tr id="m_tr_afccount" >
							<td class="tdTitle">비고</td>
							<td id="m_td_account" class="tdContents">
								<textarea id="m_ipt_remark" name="remark" readonly><c:out value="${billingOpInfo.remark}"></c:out></textarea>
							</td>
						</tr>
					</table>
				</div>
				<div class="btnWrap">
					<div id="m_btn_save">
					<c:choose>
						<c:when test="${billingOpInfo.billNo eq null}">
							<button type="button" onclick="javascript:fnBillingSave();">
								<img src="<c:url value='/images/btn_save.png'/>" />
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" onclick="javascript:fnBillingCancel();">
								<img src="<c:url value='/images/btn_cancel_mapping.png'/>" />
							</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>	
	</form>
	
</body>
</html>