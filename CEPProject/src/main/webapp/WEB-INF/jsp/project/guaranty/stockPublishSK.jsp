<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
			height: 472px;
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
			width: 56px;
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
		
	</style>
	<script>
				
		$(document).ready(function() {
			$(".altMail").mouseover(function() {
				var html = '<div id="altBox" style="left:'+($(this).offset().left - 120)+'px">'
							+ '관리자에게 알림 메일이 전송됩니다.</div>'
				$(".altMail").after(html);
			});
			$(".altMail").mouseout(function() {
				$("#altBox").remove();
			});   
			
		});	
		
		function fn_chkVali() {
			if ($("#m_frm_gb")[0].checkValidity()){
	            if ($("#m_frm_gb")[0].checkValidity()){
	               //필수값 모두 통과하여 저장 프로세스 호출.
	               return true;
	            } else {
	                $("#m_frm_gb")[0].reportValidity();   
	            }            
	            
	         }  else {
	             //Validate Form
	              $("#m_frm_gb")[0].reportValidity();   
	         }
		}
		
		
		function fnGbPublish() {
			
			if(fn_chkVali()) {
			
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
					if('gbAmount' == formData[i]['name'] || 'gbSkAmount' == formData[i]['name']){
						formData[i]['value'] = removeCommas(formData[i]['value']);
					}
					
				}
				
				$.ajax({
		        	url :"/project/detail/requestGuarantyBond.do",
		        	type:"POST",  
		            data: formData,
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
				    	 
				    	if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'Y') {
				    		alert("보증 증권 발행이 요청되었습니다." + mailList);
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
				
				var jsonDate = {}; 
					
				for(var i = 0; i < formData.length; i++)
				{
					//보증기간, 발행일
					if('gbStartDt'   == formData[i]['name']
					|| 'gbEndDt'     == formData[i]['name']
					|| 'gbPublishDt' == formData[i]['name']){
						
						jsonDate[formData[i]['name']]  = removeData(formData[i]['value'], '-');
					}
					else if('gbAmount' == formData[i]['name'] || 'gbSkAmount' == formData[i]['name']){ //금액
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
						
				}
				
				$.ajax({
		        	url :"/project/detail/modifyGuarantyBond.do",
		        	type:"POST",  
		            data: jsonDate,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		if(data.successYN == "Y") {
		        			alert("보증증권 정보가 수정되었습니다.");
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
				
				for(var i = 0; i < formData.length; i++)
				{
					//보증기간, 발행일
					if('gbStartDt'   == formData[i]['name']
					|| 'gbEndDt'     == formData[i]['name']
					|| 'gbPublishDt' == formData[i]['name']){
						formData[i]['value'] = removeData(formData[i]['value'], '-');
					}
					 
					//금액
					if('gbAmount'   == formData[i]['name']
					|| 'gbSkAmount' == formDate[i]['name']){
						formData[i]['value'] = removeCommas(formData[i]['value']);
					}
					
				}
				
				$.ajax({
		        	url :"/project/detail/endGuarantyBond.do",
		        	type:"POST",  
		            data: formData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		var mailList = "";
				    	if(data.mailList == "undefined" || data.mailList == null || data.mailList == "") {
				    		mailList = "";
				    	} else {
				    		mailList = "\n메일 수신인:" + data.mailList + "\n";
				    	}
				    	if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'Y') {
				    		alert("보증 증권 발행이 완료 처리되었습니다." + mailList);
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
		
		window.onunload = function() {
			opener.window.location.reload();
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
					<div class="floatL ftw500">선급금 보증증권 발행 정보</div>
				</div>
			</div>
			<div class="contents">
				<div>
					<table  style="width: 551px;">
						<tr id="m_tr_account" >
							<td class="tdTitle">고객사</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" class="readOnly" value="${gbInfo.acNm}" disabled/> 
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
								<input type="text"  class="readOnly" value="${displayUtil.commaStr(gbInfo.totalAmount)}(${displayUtil.commaStr(gbInfo.ctAmount)}/${gbInfo.taxYn})" disabled/> 
							</td>
						</tr>
						
						<tr>
							<td class="tdTitle">계약기간</td>
							<td class="tdContents">
								<input type="text" class="readOnlyDt" value="${displayUtil.displayDate(gbInfo.pjStartDt)}" disabled/>
								&nbsp~&nbsp
								<input type="text" class="readOnlyDt" value="${displayUtil.displayDate(gbInfo.pjEndDt)}" disabled/>
							</td>
						</tr>
					
						<tr>
							<td class="tdTitle"><label>*</label>보증기간</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_gbStartDt" name="gbStartDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbStartDt)}" required/>
								&nbsp~&nbsp
								<input type="text" id="m_ipt_gbEndDt" name="gbEndDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbEndDt)}" required/>
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">선급금 금액/요율</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_gbSkAmount" name="gbSkAmount" class="tdSkAmount" <c:if test="${gbInfo.gbSkAmount eq 0}">value=""</c:if><c:if test="${gbInfo.gbSkAmount ne 0 }">value="${displayUtil.commaStr(gbInfo.gbSkAmount) }"</c:if> style="width:200px;" amountonly/>원
								&nbsp/&nbsp
								<input type="text" id="m_ipt_gbRate" name="gbRate" class="tdRate" value="${gbInfo.gbRate}"/>&nbsp% 
							</td>
						</tr>
						<tr id="m_tr_account">
							<td class="tdTitle"><label>*</label>발행일</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_gbPublishDt" name="gbPublishDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbPublishDt)}" required/>
							</td>
						</tr>
						
						<tr id="m_tr_account">
							<td class="tdTitle"><label>*</label>증권금액</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_gbAmount" name="gbAmount" <c:if test="${gbInfo.gbAmount eq 0}">value=""</c:if><c:if test="${gbInfo.gbAmount ne 0 }">value="${displayUtil.commaStr(gbInfo.gbAmount) }"</c:if>amountonly required/>
							</td>
						</tr>
					</table>
				</div>
				<div class="btnWrap floatR">
					<div id="m_btn_save" class="floatR" style="">
						<c:choose>
							<c:when test='${gbInfo.gbIssueStatus eq "I"}'>
								<button type="button" class="altMail" onclick="javascript:fnGbPublish();">
									<img src="<c:url value='/images/btn_stock_publish.png'/>" />
								</button>
								<button type="button" onclick="javascript:fnGbModify();">
									<img src="<c:url value='/images/btn_stock_mod.png'/>" />
								</button>
							</c:when>
							<c:when test='${gbInfo.gbIssueStatus eq "R"}'>
								<button type="button" class="altMail" onclick="javascript:fnGbEnd();">
									<img src="<c:url value='/images/btn_stock_end.png'/>" />
								</button>
								<button type="button" onclick="javascript:fnGbModify();">
									<img src="<c:url value='/images/btn_stock_mod.png'/>" />
								</button>
							</c:when>
						</c:choose>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</div>	
	</form>
	
</body>
</html>