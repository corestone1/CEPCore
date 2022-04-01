<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/popup.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/datepicker.min.css'/>"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script src="<c:url value='/js/popup.js'/>"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<script src="<c:url value='/js/file.js'/>"></script>
	<script src="<c:url value='/js/jquery.fileDownload.js'/>"></script>
	<style>
		body {
			overflow: hidden;
		}
		.popContainer .top {
			width: calc(100% - 1px);
			height: 71px;
			border-bottom: 4px solid #4b3a93;
			position: absolute;
			top: 0;
			left: 0;
		}
		.popContainer .top > div {
			font-size: 24px;
			padding-left: 21px;
			padding-top: 21px;
		}
		.popContainer .contents {
			position: absolute;
			width: 653px;
			height: 486px;
			top: 75px;
		    left: 0;
			z-index: 3;
			background-color: #f6f7fc;
			overflow: hidden;
		}
		.popContainer .contents > div {
			width: 100%;
		}
		.popContainer .contents > div:first-child {
			width: calc(100% - 80px);
			min-height: 408px;
			margin: 10px 40px 0px 40px;
		}
		
		.popContainer .contents > div:last-child {
			width: 583px;
			margin-right: 62px;
    		margin-top: 4px;
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
			width: 56px;
			height: 38px;
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class^="readOnly"] {
			background-color: #f6f7fc; 
			border-color: 1px solid #ddd;
		}
		.popContainer .contents input[class^="readOnlyDt"] {
			width: 146px;
			height: 38px;
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
			width : 301px
		} 
		
		.popContainer td.tdTitle {
			font-size: 14px;
			width : 160px;
		}
		
		.popContainer td.tdTitle label {
			color: red;
		}
		
		.accountList li {
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
			font-size: 14px;
			color: #21a17e;
		}
		
		#altBox {
			position: absolute;
		    bottom: 54px;
		    width: 232px;
		    font-size: 14px;
		    font-weight: 100;
		    padding: 4px;
		    color: #fff;
		    background-image: linear-gradient(96deg,#0c93ed,#6b87e7);
	        text-align: center;
		}
		
		#altBox:after {
			border-width: 9px 7px;
		    left: 50%;
		    margin-left: 0px;
		    border-color: #588AE8 transparent transparent transparent;
		    bottom: -18px;
		    content: ' ';
		    position: absolute;
		    width: 0;
		    height: 0;
		    border-style: solid;
		}
		
		#fileForm {
			position: absolute;
			left: 38px;
			z-index: 99;
			bottom: 17px;
			width: 330px;
		}
		#fileForm .exFileLabel {
			background-image: url('/images/btn_file_upload.png');
			background-repeat: no-repeat;
			width: 119px;
			height: 31px;
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
		    width: 160px;
		    height: 17px;
		    text-overflow: ellipsis;
		}
		#fileForm .upload-name:hover {
			text-decoration: underline;
		}
		#fileForm .close {
			vertical-align: middle;
		}
		#fileWrap {
			height: 41px;
			overflow-y: auto;
		}
		#fileWrap::-webkit-scrollbar-button {
		    width: 0;
		    height: 0;
		}
		#fileWrap::-webkit-scrollbar-thumb {
		    border-radius: 3px;
		    background-color: #7F7F7F;
		    height: 3px;
		}
		#fileWrap::-webkit-scrollbar-track {
		    background-color: transparent;
		}
		#fileWrap::-webkit-scrollbar {
		    width: 6px;
		    height: 31px;
		}
		
	</style>
	<script>
				
		$(document).ready(function() {
			/* $(".altMail").mouseover(function() {
				var html = '<div id="altBox" style="left:'+($(this).offset().left - 120)+'px">'
							+ '관리자에게 알림 메일이 전송됩니다.</div>'
				$(".altMail").after(html);
			});
			$(".altMail").mouseout(function() {
				$("#altBox").remove();
			});    */
			
			var fileTarget = $(".exFile");
			
			fileTarget.on('change', function() {
				var filename = $(this)[0].files[0].name;
				$(this).siblings('.uploadName').val(filename)
			});
		});	
		
		function fn_chkVali() {
			if ($("#m_frm_gb")[0].checkValidity()){
				if($(".uploadName").val() != null && $(".uploadName").val().length != 0) {
					var maxSize = 20 * 1024 * 1024;
					var fileSize = $("#exFile")[0].files[0].size;
            	   
					if(fileSize > maxSize) {
						alert("첨부파일 사이즈는 20MB 이내로 등록 가능합니다.");
						return false;
					} else {
						return true;
					}
				} else {
					return true;
				}
				
			} else {
				//Validate Form
				$("#m_frm_gb")[0].reportValidity();   
			}
		}
		
		
		function fnGbPublish() {
			
			if(fn_chkVali()) {
			
				var formData = $("#m_frm_gb").serializeArray();
				
				var sendData = fnCreateJsonData(formData);
				
				$.ajax({
		        	url :"/project/detail/requestGuarantyBond.do",
		        	type:"POST",  
		            data: sendData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		     	   	beforeSend:function(){
				        $('.wrap-loading').removeClass('dpNone');
				    }

				   	,complete:function(){
				        $('.wrap-loading').addClass('dpNone');
				    },
		        	success:function(data){		  
		        		var mailList = "";
				    	if(data.mailList == "undefined" || data.mailList == null || data.mailList == "") {
				    		mailList = "";
				    	} else {
				    		mailList = "\n메일 수신인: " + data.mailList.join("\n");
				    	}
				    	 
				    	if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'Y') {
				    		if($(".uploadName").val() != null && $(".uploadName").val() != "" && $(".uploadName").length != 0) {
				    			
				    			var formData = new FormData($('#fileForm')[0]); 
				       			
				    			$.ajax({ 
				       				type: "POST", 
				       				enctype: 'multipart/form-data',  
				       				url: '/file/upload.do', 
				       				data: formData, // 필수 
				       				processData: false, // 필수 
				       				contentType: false, // 필수 
				       				cache: false, 
				       				success: function (data) { 
				       					if(data.successYN=='Y') {
							    			alert("보증 증권 발행이 요청되었습니다." + mailList);
				       					} else {
				       						alert("첨부파일 저장이 실패하였습니다.(보증 증권 발행 요청은 완료)");
				       					}
				       				}, 
				       				error: function(request, status, error) {
				       					if(request.status != '0') {
				       						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
				       					}
				       				} 
				    			});
				    		} else {
				    			alert("보증 증권 발행이 요청되었습니다." + mailList);
				    		}
				    	} else if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'N') {
			    			alert("메일 전송이 실패했습니다.(발행 요청 정보 저장은 완료)");
				    	} else {
			    			alert("보증 증권 발행 요청이 실패하였습니다.");
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
			
		}
		
		function fnGbModify() {
			
			if(fn_chkVali()) {
			
				var formData = $("#m_frm_gb").serializeArray();
				
				var sendData = fnCreateJsonData(formData);
				
				$.ajax({
		        	url :"/project/detail/modifyGuarantyBond.do",
		        	type:"POST",  
		            data: sendData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		if(data.successYN == "Y") {
		        			if($(".uploadName").val() != null && $(".uploadName").val() != "" && $(".uploadName").length != 0) {
				    			
				    			var formData = new FormData($('#fileForm')[0]); 
				       			
				    			$.ajax({ 
				       				type: "POST", 
				       				enctype: 'multipart/form-data',  
				       				url: '/file/upload.do', 
				       				data: formData, // 필수 
				       				processData: false, // 필수 
				       				contentType: false, // 필수 
				       				cache: false, 
				       				success: function (data) { 
				       					if(data.successYN=='Y') {
				       						alert("보증증권 정보가 수정되었습니다.");
				       					} else {
				       						alert("첨부파일 저장이 실패하였습니다.(보증 증권 정보 수정은 완료)");
				       					}
				       				}, 
				       				error: function(request, status, error) {
				       					if(request.status != '0') {
				       						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
				       					}
				       				} 
				    			});
		        			} else {
		        				alert("보증증권 정보가 수정되었습니다.");
		        			}
		        			
		        			location.reload();
		        		} else {
		        			alert("보증증권 정보 수정이 실패하였습니다.")
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
		
		
		function fnGbEnd() {
			
			if(fn_chkVali()) {
				var formData = $("#m_frm_gb").serializeArray();
				
				var sendData = fnCreateJsonData(formData);
				
				$.ajax({
		        	url :"/project/detail/endGuarantyBond.do",
		        	type:"POST",  
		            data: sendData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		     	   	beforeSend:function(){
				        $('.wrap-loading').removeClass('dpNone');
				    }

				   	,complete:function(){
				        $('.wrap-loading').addClass('dpNone');
				    },
		        	success:function(data){		  
		        		var mailList = "";
				    	if(data.mailList == "undefined" || data.mailList == null || data.mailList == "") {
				    		mailList = "";
				    	} else {
				    		mailList = "\n메일 수신인:" + data.mailList + "\n";
				    	}
				    	if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'Y') {
				    		if($(".uploadName").val() != null && $(".uploadName").val() != "" && $(".uploadName").length != 0) {
				    			
				    			var formData = new FormData($('#fileForm')[0]); 
				       			
				    			$.ajax({ 
				       				type: "POST", 
				       				enctype: 'multipart/form-data',  
				       				url: '/file/upload.do', 
				       				data: formData, // 필수 
				       				processData: false, // 필수 
				       				contentType: false, // 필수 
				       				cache: false, 
				       				success: function (data) { 
				       					if(data.successYN=='Y') {
				       						alert("보증 증권 발행이 완료 처리되었습니다." + mailList);
				       					} else {
				       						alert("첨부파일 저장이 실패하였습니다.(보증 증권 발행은 완료)");
				       					}
				       				}, 
				       				error: function(request, status, error) {
				       					if(request.status != '0') {
				       						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
				       					}
				       				} 
				    			});
		        			} else {
				    			alert("보증 증권 발행이 완료 처리되었습니다." + mailList);
		        			}
				    	} else if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'N') {
			    			alert("메일 전송이 실패했습니다.(발행 완료 정보 저장은 완료)");
				    	} else {
			    			alert("보증 증권 발행 완료 처리에 실패하였습니다.");
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
		}
		
		function fnCreateJsonData(formData) {
			var jsonData ={};
			
			for(var i = 0; i < formData.length; i++)
			{
				//보증기간, 발행일
				if('gbStartDt'   == formData[i]['name']
				|| 'gbEndDt'     == formData[i]['name']
				|| 'gbPublishDt' == formData[i]['name']
				|| 'gbReqDt' == formData[i]['name']
				|| 'gbInspectDt' == formData[i]['name']){
					
					jsonData[formData[i]['name']]  = removeData(formData[i]['value'], '-');
				}
				// 금액
				else if('gbAmount' == formData[i]['name'] || 'gbContractAmount' == formData[i]['name']){
					jsonData[formData[i]['name']]  = removeCommas(formData[i]['value']);
				}
				
				else if('gbRate' == formData[i]['name']){
					if(formData[i]['value'] == '') {
						jsonData[formData[i]['name']] = 0;
					} else {
						jsonData[formData[i]['name']]  = formData[i]['value'];
					}
				}  
				
				else {                     
					jsonData[formData[i]['name']]  = formData[i]['value'];
				}
					
			}
			
			return jsonData;
			
		}
		
		window.onunload = function() {
			opener.window.location.reload();
		}
		
		function fn_downFile(fileKey, fileOrgNm) {
			var form = document.viewForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm; 
			var data = $('#viewForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data);  
		}
		
		function fn_deleteFile(fileKey, fileNm) {
			var result = confirm("첨부파일 " + fileNm + " 을 삭제하시겠습니까?");
			if(result) {
				var form = document.viewForm;
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
							$("#file"+fileKey).next().next().remove();
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
		}
	</script>
</head>
<body>
	<form id="m_frm_gb" name="gbForm" method="post">
		<input type="hidden" id="pjKey" name="pjKey" value="${gbInfo.pjKey}" />
		<input type="hidden" id="m_ipt_gbKey" name="gbKey" value="${gbInfo.gbKey}" />		
		<input type="hidden" id="m_ipt_gbIssueStatus" name="gbIssueStatus" value="${gbInfo.gbIssueStatus}" />		
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">하자이행 보증증권 발행 정보</div>
				</div>
			</div>
			<div class="contents">
				<div>
					<table  style="width: 551px;">
						<tr id="m_tr_account" >
							<td class="tdTitle">피보험자</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" class="readOnly" value="${gbInfo.salesAcNm}" disabled/> 
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">사업명</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" class="readOnly" value="${gbInfo.pjNm}" disabled/> 
							</td>
						</tr>
					
						
						<tr id="m_tr_account" >
							<td class="tdTitle">계약금액(VAT포함)</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"  name="gbContractAmount" value="<c:choose><c:when test="${gbInfo.gbContractAmount eq null }">${displayUtil.commaStr(gbInfo.ctAmount * 1.1)}</c:when><c:otherwise>${displayUtil.commaStr(gbInfo.gbContractAmount)}</c:otherwise></c:choose>" amountonly required/> 
							</td>
						</tr>
						<tr>
							<td class="tdTitle">계약기간</td>
							<td class="tdContents">
								<input type="text" class="readOnlyDt" value="${displayUtil.displayDate(gbInfo.pjStartDt)}" disabled/>
								&nbsp<img class="veralignM" src="/images/icon_fromTo.png" />&nbsp
								<input type="text" class="readOnlyDt" value="${displayUtil.displayDate(gbInfo.pjEndDt)}" disabled/>
							</td>
						</tr>
						 
						<tr>
							<td class="tdTitle"><label>*</label>하자보증기간</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_gbStartDt" name="gbStartDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbStartDt)}" required/>
								&nbsp<img class="veralignM" src="/images/icon_fromTo.png" />&nbsp
								<input type="text" id="m_ipt_gbEndDt" name="gbEndDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbEndDt)}" required/>
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">검수일자/요율</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"   id="m_ipt_gbInspectDt" name="gbInspectDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbInspectDt)}"/>
								&nbsp/&nbsp
								<input type="text"   id="m_ipt_gbRate"    name="gbRate"    class="tdRate" <c:if test="${gbInfo.gbRate eq 0 }">value="" </c:if> <c:if test="${gbInfo.gbRate ne 0 }">value="${gbInfo.gbRate}"</c:if>/>&nbsp;% 
								
							</td>
						</tr>
						<% if(session.getAttribute("empAuthCd").equals("EMAU1001")) { %>
						<tr id="m_tr_account">
							<td class="tdTitle">제출 예정일</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"  class="readOnlyDt" name="gbReqDt" value="${displayUtil.displayDate(gbInfo.gbReqDt)}" readonly/> 
							</td>
						</tr>
						<tr id="m_tr_account">
							<td class="tdTitle">발행 일자</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_gbPublishDt" name="gbPublishDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbPublishDt)}"/>
							</td>
						</tr>
						<tr id="m_tr_account">
							<td class="tdTitle"><label>*</label>보험료</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_gbAmount" name="gbAmount" <c:if test="${gbInfo.gbAmount eq 0}">value=""</c:if><c:if test="${gbInfo.gbAmount ne 0 }">value="${displayUtil.commaStr(gbInfo.gbAmount) }"</c:if> amountonly required/>
							</td>
						</tr>
						<% } %>
						<% if(!session.getAttribute("empAuthCd").equals("EMAU1001")) { %>
						<tr id="m_tr_account">
							<td class="tdTitle">제출 예정일</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_gbPublishDt" name="gbReqDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbReqDt)}"/>
							</td>
						</tr>
						<tr id="m_tr_account">
							<td class="tdTitle">발행 일자</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"  class="readOnlyDt" value="${displayUtil.commaStr(gbInfo.gbPublishDt)}" disabled/> 
							</td>
						</tr>
						<tr id="m_tr_account">
							<td class="tdTitle">보험료</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"  class="readOnly" <c:if test="${gbInfo.gbAmount eq 0}">value=""</c:if><c:if test="${gbInfo.gbAmount ne 0 }">value="${displayUtil.commaStr(gbInfo.gbAmount) }"</c:if> disabled/> 
							</td>
						</tr>
						<% } %>
					</table>
				</div>
				<div class="btnWrap floatR">
					<div id="m_btn_save" class="floatR" style="">
						<c:choose>
							<c:when test='${gbInfo.gbIssueStatus eq "I"}'>
								<button type="button" class="altMail veralingB" onclick="javascript:fnGbPublish();">
									<img src="<c:url value='/images/btn_stock_publish.png'/>" />
								</button>
							</c:when>
							<c:when test='${gbInfo.gbIssueStatus eq "R"}'>
								<% if(session.getAttribute("empAuthCd").equals("EMAU1001")) { %>
								<button type="button" class="altMail veralingB" onclick="javascript:fnGbEnd();">
									<img src="<c:url value='/images/btn_stock_end.png'/>" />
								</button>
								<% } %>
							</c:when>
							<c:otherwise>
								<% if(session.getAttribute("empAuthCd").equals("EMAU1001")) { %>
								<button type="button" onclick="javascript:fnGbEnd();">
									<img src="<c:url value='/images/btn_stock_mod.png'/>" />
								</button>
								<% } %>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</div>	
	</form>
	<form id="fileForm" method="post" enctype="multipart/form-data"> 
    	<!-- <button type="button" id="add" style="border: 1px solid #000; padding: 5px 10px; ">추가</button><br /> -->
		<input type="hidden" name="docTypeNm" value="보증증권_하자" />
		<input type="hidden" name="fileCtKey" id="fileCtKey" value="${gbInfo.pjKey}" />
		<input type="hidden" name="pjNm" id="filePjNm" value="<c:out value="${gbInfo.pjNm}"/>"/> 
		<input type="hidden" name="atchFileCnt" id="atchFileCnt" title="첨부된갯수" value="${fn:length(fileList)}" />
		<input type="hidden" name="maxFileCnt" id="maxFileCnt" title="첨부가능최대갯수" value="<c:out value='${maxFileCnt}'/>" />
		<input type="hidden" name="maxFileSize" id="maxFileSize" title="파일사이즈" value="<c:out value='${maxFileSize}'/>" />
		<div class="floatL uploadContainer">
			<input class="uploadName" placeholder="파일선택" disabled="disabled" />
			<label for="exFile" class="exFileLabel"></label>
			<input type="file" id="exFile" class="exFile" multiple="multiple" name="file"/>
		</div>
		<div style="width: 307px; clear:both;" id="fileWrap">
			<c:forEach var="result" items="${fileList }" varStatus="status">
				<input class="upload-name cursorP ftw200" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/>
				<a class="close cursorP" onclick="fn_deleteFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm }" />')"><img src="/images/btn_close.png" /></a>
				<c:if test="${status.last eq false}"><br /></c:if>
			</c:forEach>
		</div>
		<!-- <button type="button" id="save" style="border: 1px solid #000; padding: 5px 10px;">저장</button> -->
	</form>
	<form:form id="viewForm" name="viewForm" method="POST">
		<input type="hidden" name="fileKey" value=""/>
		<input type="hidden" name="fileOrgNm" value=""/>
	</form:form>
	<div class="wrap-loading dpNone">
		<div>
			<img src="<c:url value='/images/ajax_loader.gif'/>" />
		</div>
	</div>
</body>
</html>