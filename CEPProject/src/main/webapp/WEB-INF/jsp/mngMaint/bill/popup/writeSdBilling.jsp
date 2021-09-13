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
		.popContainer td:first-child label {
		    color: red;
		    vertical-align: middle;
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
			width: 368px;
			height: 34px;
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
			height: 34px;
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
    		color: #525252;
			width : 401px
		} 
		
		.popContainer td.tdTitle {
			margin-top: 11px;
			font-size: 14px;
			color: #525252;
			padding-right: 20px;
			width : 160px;
			height: 40px;
		}
		
		.accountList li {
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
			font-size: 14px;
			color: #21a17e;
		}
		
		
	/* 파일업로드 관련 */
		#fileForm {
			position: absolute;
			bottom: 74px;;
			left: 37px;
			z-index: 99;
		}
		#fileForm .exFileLabel {
			background-image: url('/images/btn_file.png');
			background-repeat: no-repeat;
			width: 110px;
			height: 26px;
			cursor: pointer;
			float: left;
			margin-top: 1px;
			margin-right: 7px;
		}
		#fileForm .uploadName {
			font-size: 12px; 
			font-weight: 200;
			font-family: inherit; 
			line-height: normal; 
			vertical-align: middle; 
			border: 1px solid #ebebeb; 
			width: 184px;
			height: 26px;
		}
		#fileForm .exFile {
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip: rect(0,0,0,0);
			border: 0;
		}
		#fileForm .upload-name {
		    background: transparent;
		    border: none;
		    font-size: 13px;
		    width: 320px;
		    height: 17px;
		    text-overflow: ellipsis;
		}
		#fileForm .close {
			vertical-align: middle;
		} 
		
	</style>
	
	
	<script>
				
		$(document).ready(function() {
			
			//파일 업로드
			var fileTarget = $(".exFile");
			
			fileTarget.on('change', function() {
				var filename = $(this)[0].files[0].name;
				$(this).siblings('.uploadName').val(filename)
			});
			
		});	//end $(document).ready()
		
		
		function fnBillingSava() {
			if ($("#m_frm_billing")[0].checkValidity()){
				if(confirm("세금계산서 발행정보를 저장 하시겠습니까?")) {
					fn_saveBtn();
				}
			}  else {
				 //Validate Form
		        $("#m_frm_billing")[0].reportValidity();	
			}
			
		}
		
		function fn_saveBtn(){
			var formData = $("#m_frm_billing").serializeArray();
			
			for(var i = 0; i < formData.length; i++)
			{
				//발행일 ,  계산서 번호
				if('billIssueDt'   == formData[i]['name'] || 'billNo'   == formData[i]['name']) {
					formData[i]['value'] = removeData(formData[i]['value'], '-');
				} else {
					formData[i]['value'] = formData[i]['value'];
				}
				
				console.log(i+" : " + formData[i]['name'] + " : " + formData[i]['value']);
			}
			
			$.ajax({
	        	url :"/mngMaint/bill/saveXmlBilling.do",
	        	type:"POST",  
	            data: formData,
	     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType: 'json',
	            async : false,
	        	success:function(data){		  
	        		console.log("data.====>"+data);
	        		console.log("data.successYN=1====>"+data.successYN);
	        		//var paramData = JSON.parse(data);
	        		//console.log("paramData.successYN=====>"+paramData.successYN);
	        		if("Y" == data.successYN){
	        			
	        			var varParam = {};
	        			if($("#upFileName").val() == null || $("#upFileName").val() == "" || $("#upFileName").val().length == 0) {
	        				console.log("step3.====>"+data.successYN);
	        				//업로드 파일을 선택하지 않은 경우
	        				alert("세금계산서 발행정보 저장를 성공하였습니다.");
	        				
	        				var url = '/mngMaint/bill/popup/viewWriteSdBilling.do';
			    			var dialogId = 'program_layer';
			    			//첨부파일 workClass정보 추가.
    		    			varParam['workClass'] = $('#workClass').val();		
    		    			varParam['billCtFkKey'] = $('#m_ipt_salesKey').val();	
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:545px');
	        			} else {
	        				//저장 할 파일 선택함.
	        				$("#fileCtKey").val($("#m_ipt_salesKey").val());
	        				//console.log("m_ipt_salesKey========>"+$("#m_ipt_salesKey").val());
	            			//업로프 파일을 선택한 경우 파일 업로드 프로세스 수행
	            			fileFormData = new FormData($('#fileForm')[0]); 
			       			$.ajax({ 
			       				type: "POST", 
			       				enctype: 'multipart/form-data',  
			       				url: '/file/upload.do', 
			       				data: fileFormData, // 필수 
			       				processData: false, // 필수 
			       				contentType: false, // 필수 
			       				cache: false, 
			       				success: function (data) {
			       					//console.log("data.successYN2=====>"+data.successYN);
			       					if(data.successYN=='Y') {
			       						alert("세금계산서 발행정보 저장를 성공하였습니다.");		    			    		
			       						
			       					} else {
			       						alert("첨부파일 저장이 실패하였습니다.")
			       					}
			       					//현재는 파일저장이 실패해도 기본정보는 저장되도록 화면 이동시킴.
			       					var url2 = '/mngMaint/bill/popup/viewWriteSdBilling.do';
		    		    			var dialogId2 = 'program_layer';
		    		    			//첨부파일 workClass정보 추가.
		    		    			varParam['workClass'] = $('#workClass').val();		
		    		    			varParam['billCtFkKey'] = $('#m_ipt_salesKey').val();	
		    		    			var button2 = new Array;
		    		    			button2 = [];
		    		    			showModalPop(dialogId2, url2, varParam, button2, '', 'width:726px;height:545px');
			       				}, 
			       				error: function(request, status, error) {
			       					if(request.status != '0') {
			       						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			       					}
			       				}
			       			});	        				
	        			}
	        		} else {
	        			alert("세금계산서 발행정보 저장을 실패하였습니다.");
	        		}
	        		
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	    	});
		}
		
		
		function fnComplete(){
			var varParam = {};
	 		//console.log("mtKey=====>${billingOpInfo.mtKey}");
	 		//console.log("billCallKey=====>${billingOpInfo.billCallKey}");
	 		//console.log("salesKey=====>${billingOpInfo.salesKey}");
	 		//console.log("billTurnNo=====>${billingOpInfo.billTurnNo}");
	 		//console.log("billIssueStatus=====>${billingOpInfo.billIssueStatus}");
 			if('${billingOpInfo.billIssueStatus}' == 'M') {
 				if(confirm("${billingOpInfo.billTurnNo}회차에 대한 수금완료처리를 하시겠습니까?")) {
 					/* 수금완료시 시  billIssueStatus 상태값을  E 로 변경한다. */
 					var billInfo = {
 							'pjKey' : '${billingOpInfo.mtKey}'
 							, 'billCallKey' : '${billingOpInfo.billCallKey}'
 							, 'salesKey' : '${billingOpInfo.salesKey}'
 							, 'billIssueStatus' : 'E'
 					}
 					
 					$.ajax({
 				        	url :"/mngMaint/bill/detail/updateSdPaymentStatus.do",
 				        	type:"POST",  
 				            data: billInfo,
 				     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
 				     	    dataType: 'json',
 				            async : false,
 				        	success:function(data){	
 				        		if(data.successYN=='Y') {
 				        			alert("${billingOpInfo.billTurnNo}회차에 대한 수금완료처리를 성공했습니다.");
 				        			
 				        			var url2 = '/mngMaint/bill/popup/viewWriteSdBilling.do';
 					    			var dialogId2 = 'program_layer';
 					    			//첨부파일 workClass정보 추가.
 		    		    			varParam['workClass'] = $('#workClass').val();		
 		    		    			varParam['billCtFkKey'] = $('#m_ipt_salesKey').val();	
 					    			var button = new Array;
 					    			button = [];
 					    			showModalPop(dialogId2, url2, varParam, button, '', 'width:726px;height:545px');
 				        		} else {
 				        			alert(turnNo+"회차에 대한 수금완료처리를 실패했습니다.");
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
		
		function fnCompleteCancel() {
			var varParam = {};
			if(confirm("${billingOpInfo.billTurnNo}회차에 대한 수금완료처리를 취소 하시겠습니까?")) {
				/* 수금취소시  billIssueStatus 상태값을  E 에서 M으로 변경한다. */
				var billInfo = {
						'pjKey' : '${billingOpInfo.mtKey}'
						, 'billCallKey' : '${billingOpInfo.billCallKey}'
						, 'salesKey' : '${billingOpInfo.salesKey}'
 						, 'billIssueStatus' : 'M'
				}
				
				$.ajax({
		        	url :"/mngMaint/bill/detail/updateSdPaymentStatus.do",
		        	type:"POST",  
		            data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){	  
		        		console.log("step1.====>"+data.successYN);
		        		if(data.successYN=='Y') {
		        			alert("${billingOpInfo.billTurnNo}회차에 대한 수금취소처리를 성공했습니다.");
		        			
		        			var url2 = '/mngMaint/bill/popup/viewWriteSdBilling.do';
			    			var dialogId2 = 'program_layer';
			    			//첨부파일 workClass정보 추가.
    		    			varParam['workClass'] = $('#workClass').val();		
    		    			varParam['billCtFkKey'] = $('#m_ipt_salesKey').val();	
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId2, url2, varParam, button, '', 'width:726px;height:545px');
		        		} else {
		        			alert(turnNo+"회차에 대한 수금취소처리를 실패했습니다.");
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
		
		/* function fnChooseXml(){
			
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
		
			
		} */

		// 파일업로드 관련
		function fn_downFilePopUp(fileKey, fileOrgNm) {
			var form = document.viewPopUpForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm; 
			var data = $('#viewPopUpForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data);  
		}
		
		function fn_deleteFile(fileKey, fileNm) {
			if('${billingOpInfo.billIssueStatus}' == 'E') {
				alert("수금완료 상태에서는 첨부파일 삭제를 할 수 없습니다. \n수금취소 후 첨부파일을 삭제하세요 !!");
			} else {
				var result = confirm("첨부파일 " + fileNm + " 을 삭제하시겠습니까?");
				if(result) {
					var form = document.viewPopUpForm;
					form.fileKey.value = fileKey;
					var data = JSON.stringify({"fileKey":fileKey});
					$.ajax({ 
		   				url: '/file/delete.do', 
		   				dataType:'json',
		   				type: "POST", 
		   				data: data, // 필수 
		   				contentType: "application/json; charset=UTF-8", 
		   				success: function (response) { 
			   				if(response.successYN=='Y') {
								alert('첨부파일이 삭제되었습니다.');
								$("#file"+fileKey).next().remove();
								$("#file"+fileKey).remove();
							} else {
								alert('첨부파일 삭제가 실패되었습니다.');
							}
		   				},
		   				error: function(request, status, error) {
		   					if(request.status != '0') {
		   						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		   					}
		   				}
		   			});
				}
			} //end else
			
		}
		
	</script>
</head>
<body>			
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">매출계산서 정보 등록</div>
			</div>
		</div>
		<div class="contents">
			<div>
				<form id="m_frm_billing" name="billingForm" method="post">
					<input type="hidden" id="m_ipt_salesKey" name="salesKey" value="${billingOpInfo.salesKey}" />
					<input type="hidden" id="m_ipt_billCallKey" name="billCallKey" value="${billingOpInfo.billCallKey}" />		
					<input type="hidden" id="workClass" name="workClass" value="mtSdBill"/>
					<table  style="width: 651px;">						
						<tr>
							<td class="tdTitle">프로젝트명</td>
							<td class="tdContents"><c:out value="${billingOpInfo.mtNm}"/></td>
					
						<tr>
							<td class="tdTitle">고객사</td>
							<td class="tdContents"><c:out value="${billingOpInfo.mtAcNm}"/></td>
						</tr>
						
						<tr>
							<td class="tdTitle">매출처 / 사업자번호</td>
							<td class="tdContents">
								<c:out value="${billingOpInfo.billAcNm}"/>
								&nbsp;/&nbsp;
								<c:out value="${displayUtil.makeActypeForm(billingOpInfo.billAcKey)}"/> 
							</td>
						</tr>							
						<tr>
							<td class="tdTitle">고객담당자(성명/Email)</td>
							<td class="tdContents">
								<c:out value="${billingOpInfo.billAcDirectorNm}"/> 님
								&nbsp;/&nbsp;
								<c:out value="${billingOpInfo.billIssueEmail}"/> 
							</td>
						</tr>
						
						<tr>
							<td class="tdTitle">공급가액/세액</td>
							<td class="tdContents">
								<c:out value="${displayUtil.commaStr(billingOpInfo.supplyValue)}"/> 원 
								&nbsp;/&nbsp;
								<c:out value="${displayUtil.commaStr(billingOpInfo.billTax)}"/> 원
							</td>
						</tr>
						
						<tr>
							<td class="tdTitle">합계</td>
							<td class="tdContents">
								<c:out value="${displayUtil.commaStr(billingOpInfo.billTotalAmount)}"/> 원
							</td>
						</tr>							
						<tr>
							<td class="tdTitle">								
								<c:choose>									
									<c:when test="${billingOpInfo.billIssueStatus eq 'E'}">
										진행상태/완료일자
									</c:when>
									<c:otherwise>
										진행상태
									</c:otherwise>
								</c:choose>
							</td>
							<td class="tdContents">
							<c:choose>
								<c:when test="${billingOpInfo.billIssueStatus eq 'R'}">
									<span>요청</span>
								</c:when>
								<c:when test="${billingOpInfo.billIssueStatus eq 'I'}">
									<span>발급</span>
								</c:when>
								<c:when test="${billingOpInfo.billIssueStatus eq 'M'}">
									<span>매핑</span>
								</c:when>
								<c:when test="${billingOpInfo.billIssueStatus eq 'E'}">
									<span>수금완료 / <c:out value="${displayUtil.displayDate(billingOpInfo.salesCollectFinishDt)}"/> </span>
								</c:when>
								<c:otherwise>
									<span>${billingOpInfo.billIssueStatus}</span>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>					
							
						<tr>
							<td class="tdTitle"><label>*</label>계산서 번호</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_billNo" name="billNo" value="<c:out value="${billingOpInfo.billNo}"/>" required/> 
							</td>
						</tr>
					
						<tr>
							<td class="tdTitle"><label>*</label>발행일</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_billIssueDt" name="billIssueDt" class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(billingOpInfo.billIssueDt)}"/>"/>
							</td>
						</tr>					
					</table>
				</form>		
					
				<form id="fileForm" method="post" enctype="multipart/form-data"> 
					<input type="hidden" name="docTypeNm" value="mtSdBill" />
					<input type="hidden" name="fileCtKey" id="fileCtKey" value="${billingOpInfo.salesKey}" />
					<input type="hidden" name="pjNm" id="filePjNm" value="<c:out value="${resultList[0].pjNm}"/>"/> 
					<input type="hidden" name="atchFileCnt" id="atchFileCnt" title="첨부된갯수" value="${fn:length(fileList)}" />
					<input type="hidden" name="maxFileCnt" id="maxFileCnt" title="첨부가능최대갯수" value="<c:out value='${maxFileCnt}'/>" />
					<input type="hidden" name="maxFileSize" id="maxFileSize" title="파일사이즈" value="<c:out value='${maxFileSize}'/>" />
					<table>					
						<tr>		
							<td class="tdTitle  veralignT">세금계산서파일</td>		
							<td class="tdContents" style="padding-left: 26px">			
								<div class="uploadContainer" >
									<input class="uploadName" id="upFileName" placeholder="파일선택" disabled="disabled" />
									<label for="exFile" class="exFileLabel"></label>
									
									<input type="file" id="exFile" class="exFile" multiple="multiple" name="file"/>
								</div>
								<div style="width: 364px; height: 25px; clear:both;">
									<c:forEach var="result" items="${fileList }" varStatus="status">
										<input class="upload-name cursorP" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFilePopUp('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/>
										<a class="close cursorP" onclick="fn_deleteFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm }" />')"><img src="/images/btn_close.png" /></a>
										<c:if test="${status.last eq false}"><br /></c:if>
									</c:forEach>
								</div>
							</td>
						</tr>
					</table>
				</form>
				<form:form id="viewPopUpForm" name="viewPopUpForm" method="POST">
					<input type="hidden" name="fileKey" value=""/>
					<input type="hidden" name="fileOrgNm" value=""/>
				</form:form>
			</div>
			<div class="btnWrap floatR">
				<div id="m_btn_save" class="floatR" style="margin-bottom: -14px; margin-right: 52px;">						
					<c:if test='${billingOpInfo.billIssueStatus eq "R"}'>
						<button type="button" onclick="javascript:fnBillingSava();">
							<img src="<c:url value='/images/btn_save.png'/>" />
						</button>
					</c:if>
					<c:if test='${billingOpInfo.billIssueStatus eq "M"}'>
						<button type="button" onclick="javascript:fnBillingSava();">
							<img src="<c:url value='/images/btn_save.png'/>" />
						</button>
						<!-- 매핑이 완료되면 수금완료 버튼  -->
						<button type="button" class="btnComp" onclick="javascript:fnComplete();">
							<img src="<c:url value='/images/btn_end_pay.png'/>" />
						</button>
					</c:if>
					<c:if test='${billingOpInfo.billIssueStatus eq "E"}'>
						<!-- 수금이 완료되면 수금완료 취소 버튼  -->
						<a href="javascript:fnCompleteCancel()" style="color: #0c35ff;">수금취소</a>
					</c:if>					
				</div>
				<div class="floatN floatC"></div>
			</div>
		</div>
	</div>		
</body>
</html>