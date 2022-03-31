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
			overflow:hidden;
		}
		.popContainer .top {
			width: calc(100% - 1px);
			height: 71px;
			border-bottom: 4px solid #4b3a93;
			position: absolute;
			top: 0;
			left: 0;
		    background-color: #fff;
		}
		.popContainer .top > div {
			font-size: 24px;
			padding-left: 21px;
			padding-top: 21px;
		}
		.popContainer .contents {
			position: absolute;
			width: 100%;
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
			width: 553px;
			min-height: 428px;
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
			left: 41px;
			z-index: 99;
			top: 513px;
			width: 368px;
		}
		
		#fileForm .subject {
			font-size: 14px;
			width: 142px;
			color: #535353;
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
			font-size: 12px !important; 
			font-weight: 200;
			font-family: inherit !important; 
			line-height: normal; 
			vertical-align: middle; 
			border: 1px solid #ebebeb !important;  
			width: 184px !Important;
			height: 29px !important;
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
		
		#fileWrap {
			height: 62px;
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
			var fileTarget = $(".exFile");
			
			fileTarget.on('change', function() {
				var filename = $(this)[0].files[0].name;
				$(this).siblings('.uploadName').val(filename);
			});
			
			$(".readonly").on('keydown paste focus mousedown', function(e){
		        if(e.keyCode != 9) // ignore tab
		            e.preventDefault();
		    });
		});	
		
		window.onunload = function() {
			opener.location.href="javascript:fnMoveTab('biddingInfo');";
		}
		
		function fn_chkVali() {
            if ($("#m_frm_gb")[0].checkValidity()){
				//필수값 모두 통과하여 저장 프로세스 호출.
				if($("#fileForm")[0].checkValidity()) {
					return fileCheck();
				} else {
					$("#fileForm")[0].reportValidity()
				}
            } else {
                $("#m_frm_gb")[0].reportValidity();   
                return false;
            }            
		}
		
		function fileCheck() {
			var maxSize = 20 * 1024 * 1024;
        	var fileSize = $("#exFile")[0].files[0].size;
        	   
			if(fileSize > maxSize){
				alert("첨부파일 사이즈는 20MB 이내로 등록 가능합니다.");
				return false;
			} else {
				return true;
			}
		}
		
		function fnGbPublish() {
			
			if(fn_chkVali()) {
				var formData = $("#m_frm_gb").serializeArray();
				
				for(var i = 0; i < formData.length; i++)
				{
					//보증기간, 발행일
					if('bdGbFinishDt'   == formData[i]['name']
					|| 'bdGbFinishDt'   == formData[i]['name']){
						formData[i]['value'] = removeData(formData[i]['value'], '-');
					}
					
					if('bdGbReqDt'   == formData[i]['name']
					|| 'bdGbReqDt'   == formData[i]['name']){
						formData[i]['value'] = removeData(formData[i]['value'], '-');
					}
					 
					//금액
					if('bdGbBdAmount' == formData[i]['name']
					|| 'bdGbAmount'   == formData[i]['name']){
						formData[i]['value'] = removeCommas(formData[i]['value']);
					}
					
					// console.log(i+" : " + formData[i]['name'] + " : " + formData[i]['value']);
				}
				
				$('.wrap-loading').removeClass('dpNone');
				setTimeout(function() {
					$.ajax({
			        	url :"/forecast/requestBiddingGb.do",
			        	type:"POST",  
			            data: formData,
			     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			     	    dataType: 'json',
			           	async : false,
			        	success:function(data){	
			        		if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'Y') {
				    			/* if($("#m_ipt_spKey").val() == null || $("#m_ipt_spKey").val() == "" || $("#m_ipt_spKey").val().length == 0) {
					    			$("#fileCtKey").val(data.spKey);
					    			$("#fileSpBusiNm").val($("#spBusiNm").val());
					    		} */
				    			
				    			var formData = new FormData($("#fileForm")[0]);
	
				    			$.ajax({
				    				type:"POST",
				    				enctype:'multipart/form-data',
				    				url:'/file/upload.do',
				    				data:formData,
				    				processData:false,
				    				contentType:false,
				    				cache:false,
				    				async : false,
				    				success:function(response) {
				    					if(response.successYN == 'Y') {
			    							alert("발행 요청되었습니다.");
				    					} else {
				    						alert("첨부파일 저장이 실패하였습니다.");
				    					}
				    				}
				    			});  
					    		
					    	} else if(data.mailSuccessYN == 'N') {
			    				alert("메일 발송이 실패하였습니다.");
					    	} else {
					    		alert("발행 요청이 실패하였습니다.");
					    	}
					    },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
					    , complete:function() {
					    	$('.wrap-loading').addClass('dpNone');
					    }
			    	});
					location.reload();  
				}, 0);
			}
		}
		
		function fnGbModify() {
			
			var formData = $("#m_frm_gb").serializeArray();
			
			var jsonDate = {}; 
			
			for(var i = 0; i < formData.length; i++) {
				//보증기간, 발행일
				if('bdGbFinishDt'   == formData[i]['name']
				|| 'bdGbReqDt'   == formData[i]['name']){
					jsonDate[formData[i]['name']]  = removeData(formData[i]['value'], '-');
				} else if('bdGbBdAmount' == formData[i]['name']){
					if(formData[i]['value'] == '') { 
						//제거
					}
					else {
						jsonDate[formData[i]['name']]  = removeCommas(formData[i]['value']);
					}
				} else {                     
					jsonDate[formData[i]['name']]  = formData[i]['value'];
				}
			}
			
			$('.wrap-loading').removeClass('dpNone');
			setTimeout(function() {
				$.ajax({
		        	url :"/forecast/modifyBiddingGb.do",
		        	type:"POST",  
		            data: jsonDate,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		
		        		if(data!= null && data.successYN == 'Y') {
			    			/* if($("#m_ipt_spKey").val() == null || $("#m_ipt_spKey").val() == "" || $("#m_ipt_spKey").val().length == 0) {
				    			$("#fileCtKey").val(data.spKey);
				    			$("#fileSpBusiNm").val($("#spBusiNm").val());
				    		} */
				    		if($(".uploadName").val() != null && $('.uploadName').val().length != 0) {
				    			if(fileCheck() == true) {
					    			var formData = new FormData($("#fileForm")[0]);
			
					    			$.ajax({
					    				type:"POST",
					    				enctype:'multipart/form-data',
					    				url:'/file/upload.do',
					    				data:formData,
					    				processData:false,
					    				contentType:false,
					    				cache:false,
					    				async : false,
					    				success:function(response) {
					    					console.log(response)
					    					if(response.successYN == 'Y') {
				    							alert("보증증권 정보가 수정되었습니다.");
					    					} else {
					    						alert("첨부파일 저장이 실패하였습니다.");
					    					}
					    				}, error: function(request, status, error) {
					    	        		if(request.status != '0') {
					    	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
					    	        		}
					    	        	} 
					    			});  
				    			}
					    		
					    	} else {
				    			alert("보증증권 정보가 수정되었습니다.");
				    		}
		        		} else {
				    		alert("보증증권 정보 수정이 실패하였습니다.");
				    	}
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		            , complete:function() {
				    	$('.wrap-loading').addClass('dpNone');
				    }
		    	});
				location.reload(); 
			}, 0);
		}
		
		
		function fnGbEnd() {
			if(fn_chkVali()) {
				var formData = $("#m_frm_gb").serializeArray();
				
				for(var i = 0; i < formData.length; i++)
				{
					//보증기간, 발행일
					if('bdGbFinishDt'   == formData[i]['name']
					|| 'bdGbReqDt'   == formData[i]['name']){
						formData[i]['value'] = removeData(formData[i]['value'], '-');
					}
					 
					//금액
					if('bdGbBdAmount' == formData[i]['name']
					|| 'bdGbAmount'   == formData[i]['name']){
						formData[i]['value'] = removeCommas(formData[i]['value']);
					}
					
				}
				
				$('.wrap-loading').removeClass('dpNone');
				setTimeout(function() {
					$.ajax({
			        	url :"/forecast/endBiddingGb.do",
			        	type:"POST",  
			            data: formData,
			     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			     	    dataType: 'json',
			            async : false,
			        	success:function(data){		  
			        		if(data!= null && data.successYN == "Y" && data.mailSuccessYN == "Y") {
			        			var formData = new FormData($("#fileForm")[0]);
								
				    			$.ajax({
				    				type:"POST",
				    				enctype:'multipart/form-data',
				    				url:'/file/upload.do',
				    				data:formData,
				    				processData:false,
				    				contentType:false,
				    				cache:false,
				    				async : false,
				    				success:function(response) {
				    					if(response.successYN == 'Y') {
			    							alert("발행 처리 되었습니다.");
				    					} else {
				    						alert("첨부파일 저장이 실패하였습니다.");
				    					}
				    				}
				    			});   
				    			
					    	} else if(data.mailSuccessYN == 'N') {
			    				alert("메일 발송이 실패하였습니다.");
					    	} else {
					    		alert("발행 처리가 실패하였습니다.");
					    	} 
			            },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
			            , complete:function() {
					    	$('.wrap-loading').addClass('dpNone');
					    }
			    	});
					location.reload();  
				}, 0);
			}
		}
		
		function fn_downFile(fileKey, fileOrgNm) {
			var form = document.fileViewForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm; 
			var data = $('#fileViewForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data);  
		}
		
		function fn_deleteFile(fileKey, fileNm) {
			var result = confirm("첨부파일 " + fileNm + " 을 삭제하시겠습니까?");
			if(result) {
				var form = document.fileViewForm;
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
		<input type="hidden" id="workClass" name="workClass" value="입찰_공고문"/>
		<input type="hidden" name="spKey" id="m_ipt_spKey" value="${gbInfo.spKey }"/>
		<input type="hidden" id="m_ipt_bdKey" name="bdKey" value="${gbInfo.bdKey}" />		
		<input type="hidden" name="spBusiNm" value="${gbInfo.spBusiNm }" />
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">입찰이행 보증증권 발행 정보</div>
				</div>
			</div>
			<div class="contents">
				<div>
					<table  style="width: 551px;">
						<tr id="m_tr_account" >
							<td class="tdTitle">발주처</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" class="readOnly" value="${gbInfo.acNm}" disabled/> 
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">사업명</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" class="readOnly" value="${gbInfo.spBusiNm}" disabled/> 
							</td>
						</tr>
						<tr>
							<td class="tdTitle">발행일자</td>
							<td class="tdContents">
								<input type="text" class="calendar" name="bdGbReqDt" value="${displayUtil.displayDate(gbInfo.bdGbReqDt)}" />
							</td>
						</tr>
						<tr id="m_tr_account" >
							<td class="tdTitle">입찰금액(VAT포함)</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="ipt_bdGbBdAmount" name="bdGbBdAmount" value="<c:if test="${gbInfo.bdGbBdAmount eq null }">${displayUtil.commaStr(gbInfo.fcSalesAmount * 1.1)}</c:if><c:if test="${gbInfo.bdGbBdAmount ne null }">${displayUtil.commaStr(gbInfo.bdGbBdAmount)}</c:if>" />
							</td>
						</tr>
						<tr id="m_tr_account" >
							<td class="tdTitle">요율</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"   id="m_ipt_bdGbRate"    name="bdGbRate" class="tdRate" value="${gbInfo.bdGbRate}" required/>&nbsp;% 
								
							</td>
						</tr>
						<tr id="m_tr_account" >
							<td class="tdTitle">보증기간</td>
							<td id="m_td_account" class="tdContents">
								입찰일로부터&nbsp;
								<input type="text"   id="m_ipt_bdGbDay"    name="bdGbDay" class="tdRate" value="${gbInfo.bdGbDay}"/> 
								&nbsp;일 이상
							</td>
						</tr>
					<%-- <c:choose>
						<c:when test='${gbInfo.bdGbFinishYn ne "N"}'>
							<% if(session.getAttribute("empAuthCd").equals("EMAU1001")) { %>
							<tr id="m_tr_account" <c:if test='${gbInfo.bdGbFinishYn eq "N"}'>style="display: none;" </c:if>>
								<td class="tdTitle">발행일</td>
								<td id="m_td_account" class="tdContents">
									<input type="text" id="m_ipt_bdGbFinishDt" name="bdGbFinishDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.bdGbFinishDt)}" required/>
								</td>
							</tr>
							<% } %>
						</c:when>
					</c:choose> --%>
					</table>
				</div>
				<div class="btnWrap floatR">
					<div id="m_btn_save" class="floatR" style="">
						<c:if test="${param.view eq false}">
						<c:choose>
							<c:when test='${gbInfo.bdGbFinishYn eq "N"}'>
								<button type="button" onclick="javascript:fnGbPublish();">
									<img src="<c:url value='/images/btn_stock_publish.png'/>" />
								</button>
							</c:when>
							<c:when test='${gbInfo.bdGbFinishYn eq "R"}'>
								<% if(session.getAttribute("empAuthCd").equals("EMAU1001")) { %>
								<button type="button" onclick="javascript:fnGbEnd();">
									<img src="<c:url value='/images/btn_stock_end.png'/>" />
								</button>
								<% } %>
								<button type="button" onclick="javascript:fnGbModify();">
									<img src="<c:url value='/images/btn_stock_mod.png'/>" />
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" onclick="javascript:fnGbModify();">
									<img src="<c:url value='/images/btn_stock_mod.png'/>" />
								</button>
							</c:otherwise>
						</c:choose>
						</c:if>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</div>	
	</form>
	<form id="fileForm" method="post" enctype="multipart/form-data"> 
		<input type="hidden" name="docTypeNm" value="입찰_공고문" />
		<input type="hidden" name="fileCtKey" id="fileCtKey" value="${gbInfo.spKey}" />
		<input type="hidden" name="spBusiNm" id="fileSpBusiNm" value="<c:out value="${gbInfo.spBusiNm}"/>"/> 
		<input type="hidden" name="atchFileCnt" id="atchFileCnt" title="첨부된갯수" value="${fn:length(fileList)}" />
		<input type="hidden" name="maxFileCnt" id="maxFileCnt" title="첨부가능최대갯수" value="<c:out value='${maxFileCnt}'/>" />
		<input type="hidden" name="maxFileSize" id="maxFileSize" title="파일사이즈" value="<c:out value='${maxFileSize}'/>" />
		<div class="floatL uploadContainer">
			<input class="uploadName readonly" placeholder="" required />
			<label for="exFile" class="exFileLabel"></label>
			<input type="file" id="exFile" class="exFile" multiple="multiple" name="file"/>
		</div>
		<div style="width: 307px; clear:both; height: 44px; overflow-y: auto;" id="fileWrap">
			<c:forEach var="result" items="${fileList }" varStatus="status">
				<input class="upload-name cursorP" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/>
				<a class="close cursorP" onclick="fn_deleteFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm }" />')"><img class="veralignM" src="/images/btn_close.png" /></a>
				<c:if test="${status.last eq false}"><br /></c:if>
			</c:forEach>
		</div>
		<!-- <button type="button" id="save" style="border: 1px solid #000; padding: 5px 10px;">저장</button> -->
	</form> 
	<form:form id="fileViewForm" name="fileViewForm" method="POST">
		<input type="hidden" name="fileKey" value=""/>
		<input type="hidden" name="fileOrgNm" value=""/>
	</form:form>
	<div class="wrap-loading dpNone">
    	<div><img src="<c:url value='/images/ajax_loader.gif'/>" /></div>
	</div> 
</body>
</html>