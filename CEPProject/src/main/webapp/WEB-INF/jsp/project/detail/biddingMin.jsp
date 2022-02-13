<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>프로젝트 상세</title>

	<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/popup.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/datepicker.min.css'/>"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<c:url value='/js/popup.js'/>"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<script src="<c:url value='/js/file.js'/>"></script>
	<script src="<c:url value='/js/jquery.fileDownload.js'/>"></script>
	
	<style>
		.sfcnt {
			height: 91px;
		}
		#fileUploader {
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip: rect(0,0,0,0);
			border: 0;
		}
		.btnWrap {
			position: absolute;
			bottom: 31px;
		}
		.btnWrap.lt {
			left: 127px;
		}
		.btnWrap.rt {
			right: 127px;
		}
		form .nav {
			width: 100%;
			height: 49px;
		}
		form .contentsWrap {
			background-color: #f6f7fc;
			height: 830px;
		}
		form .contentsWrap .contents {
			/* padding: 38px 71px; */
			width: 997px;
		}
		form .contents > div:first-child {
			width: 100%;
		}
		form .contents > .fxd {
			width: 100%;
		}
		form .contents .stitle {
			font-size: 18px;
			font-weight: 500;
			margin-bottom: 10px;
			margin-top: 30px;
		}
		form .contents .cg {
			color: #24a37e;
		}
		form .contents > div > div > div > table {
			border-collapse: collapse;
			font-size: 15px;
		} 
		form .contents > div > div > div > table tr td {
			padding: 13px 20px;
		}
		form .contents > div > div > div > table tr td:first-child {
			width: 130px;
			font-weight: 400;
		} 
		form .contents > div > div > div > table tr td:last-child {
			width: 400px;
			font-weight: 200;
		}
		form .contents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			border: 1px solid #bee2da;
		}
		form .contents .bsc tr td {
			color: #0e8a67;
		}
		form .contents .bsc tr td:first-child {
			box-shadow: inset -7px 0 9px -4px #d0e2de;
		}
		form .contents > .fxd .stitle ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		}
		form .contents > .fxd .stitle ul li:last-child {
			clear: both;
			float: none;
			width: 0 !important;
		}
		
		
		#detailForm .stitle ul {
			width: 915px;
		}
		#detailForm .stitle ul li {
			width: 150px;
		}
		#detailForm .stitle ul li a {
			color: #a3a3a4;
			padding-bottom: 10px;
		}
		#detailForm .stitle ul li a:hover {
			color: #000;
			border-bottom: 4px solid #6a5bae;
		}
		#detailForm .stitle ul li a.on {
			color: #000;
			border-bottom: 4px solid #6a5bae;
		}
		form .contents .dtl {
			border-top: 4px solid #c3c3c3;;
			overflow: hidden;
		}
		form .contents .dtl tbody {
			overflow-y: auto;
			overflow-x: hidden;
			height: auto;
			float: left;
		}
		form .contents .dtl tbody tr {
			border: 1px solid #ebe9ee;
		}
		form .contents .dtl td {
			color: #000;
		}
		form .contents .dtl tr td:first-child {
			background-color: #e1dff5;
			border-right: 1px solid #ebe9ee;
		}
		form .contents .dtl tr td:last-child {
			width: 784px;
		}
		input[type="text"] {
		 	width: 177px;
		    height: 34px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 4px;
		}
		input[class="calendar"] {
		    background-image: url(./images/calendar_icon.png);
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		select {
			height: 37px;
		    width: 130px;
		    border: 1px solid #e9e9e9;
		    padding: 0 10px;
		    -webkit-appearance: none;
		    background: url(./images/arrow_down.png) no-repeat 91% 50%;
		    background-color: #fff;
		    color: #535353;
		    font-size: 15px;
		}
		textarea {
			border: 1px solid #e6e6e6;
			padding: 0 10px;
		}
		select.nrslct {
			width: 100px !important;
		}
		form .contents .dtl label.title {
			margin: 0 8px 0 20px;
		}
		form .contents .dtl span.cbspan {
			display: inline-block;
			vertical-align: top;
			line-height: 1.8;
			margin-left: 5px;
		}
		
		label.radio {
		   overflow: hidden;
		   position: relative;
		   height: 26px;
		   box-sizing: border-box;
		   cursor: pointer;
		   margin-right: 17px;
		}
		label.radio input[type='radio'] {
			-webkit-appearance: none;
			width: 26px;
			height: 26px;
			border: 1px solid #e6e6e6;
			border-radius: 50%;
			outline: none;
			background: #e6e6e6;
			margin: 0 15px 0 0;
		}
		label.radio input[type='radio']:before {
			content:'';
			display: block;
			width: 60%;
			height: 60%;
			margin: 20% auto;  
			border-radius: 50%;  
		}
		label.radio input[type='radio']:checked {
			background: #7764cb;
		}
		label.radio input[type='radio']:checked:before {
		  	content: "\2713";
			color: #fff;
			line-height: 1.2;
			text-align: center;
		}
		
		form .contents .dtl#modTable ul li {
			float: left;
			width: 261px;		
			line-height: 2;
		}
		form .contents .dtl#modTable ul li:last-child {
			width: 465px;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(1) {
			width: 152px;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(2) {
			display: inline-block;
			font-size: 0;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(2) a {
			background-color: #e4e6f0;
			padding: 0px 10px;
			border: 1px solid #dcdde3;
			font-size: 16px;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(2) label {
			font-size: 16px;
			display: inline-block;
			width: 30px;
			text-align: center;
			border-top: 1px solid #dcdde3;
			border-bottom: 1px solid #dcdde3;
			line-height: 1.5;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(2) input[type="text"] {
			margin-right: 7px;
		}
		form .contents .dtl#modTable .fileName {
			display: inline-block;
			background-image:url('/images/btn_file_upload.png');
			background-repeat: no-repeat;
			width: 130px;
			height: 34px;
			line-height: 32px;
			vertical-align: middle;
			cursor: pointer;
		}
		form .contents .dtl#modTable .upload-name { 
			height: 29px;
			vertical-align: top; 
			border: none; 
			font-size: 16px;
			-webkit-appearance: none; 
			-moz-appearance: none; 
			appearance: none; 
			cursor: pointer;
		}
		form .contents .dtl#modTable .upload-name:hover {
			text-decoration: underline;
		}
		#fileWrap input:first-child {
			margin-top: 0;
		}
		#fileWrap input {
			width: 100%;
			margin-top: 10px;
		    border: none;
		}
		#fileWrap input:hover {
			color: #007AAE;
			text-decoration: underline;
		}
		
	</style>
	<script>
		$(document).ready(function() {
			
			/* 
			var modCh = 1;
			$('#modInfo').click(function() {
				if(modCh % 2 == 1) {
					$("#selectTable").css('display','none'); 
					$("#modTable").removeClass('dpNone');
					$("#selectBasicTable").css('display','none'); 
					$("#modBasicTable").removeClass('dpNone');
					$("#modInfo img").attr('src',"/images/btn_save.png");
				} else {
					// alert('수정되었습니다.'); 
					var object = {};
		           	var formData = $("#viewForm").serializeArray();
		           	for (var i = 0; i<formData.length; i++){
		                
		                object[formData[i]['name']] = formData[i]['value'];
		             }
		           	var data = JSON.stringify(object);
		           
					$.ajax ({
						url:"/project/update/biddingInfo.do",
						type:'post',
						data: data,
						dataType:'json',
						contentType: "application/json; charset=UTF-8", 
						success:function(data){	
			            	alert('첨부파일 저장');
			            	 
			            },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
					});
					// location.reload(); 
				}
				modCh++;
			});
		 	*/
		 	
			$('.decreaseQuantity').click(function(e){
				e.preventDefault();
				var stat = $(this).next().text();
				var num = parseInt(stat,10);
				num--;
				if(num<=0){
					$(this).parent().parent().children().eq(0).children().eq(0).prop('checked', false);
				}
				if(num<=-1) {
					alert('더 이상 줄일 수 없습니다.');
					num =0;
				}
				$(this).next().text(num);
			});
			$('.increaseQuantity').click(function(e){
				e.preventDefault();
				var stat = $(this).prev().text();
				var num = parseInt(stat,10);
				num++;
	
				$(this).prev().text(num);
				$(this).parent().parent().children().eq(0).children().eq(0).prop('checked', true);
				
			});
			
			/* $('input[type="radio"]').click(function() {
				var classNm = $(this).attr('name');
				if($(this).val() == 'Y') {
					$('.'+classNm).css('display','inline-block');
				} else {
					$('.'+classNm).css('display','none');
				}	 
			}); */
			
			var fileTarget = $('#fileUploader'); 
			
			fileTarget.on('change', function() { 
				if(window.FileReader){
					var filename = $(this)[0].files[0].name; 
				} else { 
					var filename = $(this).val().split('/').pop().split('\\').pop(); 
				} 
				
				$(this).siblings('.upload-name').val(filename); 
				$(this).siblings('.upload-name').attr('onclick',''); 
				$(this).siblings('.upload-name').css('cursor','default');
				$(this).siblings('.upload-name').css('pointer-events','none');
			});
			
			if($(parent.document).find(".title ul li.on").attr("id").includes("BD")) {
				$(parent.document).find("#modMinInfo").addClass("dpNone");
				$(parent.document).find("#delMinInfo").addClass("dpNone");
			}
		});
		
		function fn_addView(link){
			/* if(link == "forecastList") {
				location.href="<c:url value='/forecastList.do'/>";
			} else { */
				var url = '/project/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
		
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			/* } */
		}
		
		function fn_check_file(flag) {
	       if (flag=="Y") {
	           $('#file_upload_posbl').show();
	           $('#file_upload_imposbl').hide();          
	       } else {
	           $('#file_upload_posbl').hide();
	           $('#file_upload_imposbl').show();
	       }
		}
		
		function fn_downFile(fileKey, fileOrgNm) {
			var form = document.viewForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm;
			var data = $('#viewForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data); 
		}
		
		
		
		function fnShowStock() {
			
			/* var dialogId = 'program_layer';
			
			var varParam = {'pjKey' : $('#ipt_pjKey').val(), 'bdKey' : $('#ipt_bdKey').val()};
			
			var button = new Array;
			button = [];
			showModalPop(dialogId, "/project/detail/viewStockPublishBD.do", varParam, button, '', 'width:648px;height:575px'); */
			
			var pstUrl = "/project/detail/viewStockPublishBD.do";
			var varParam = 'pjKey='+$('#ipt_pjKey').val()+'&bdKey='+$('#ipt_bdKey').val();
			
			var nWidth = "654";
			var nHeight = "549";
			  
			var curX = window.screenLeft;
			var curY = window.screenTop;
			var curWidth = document.body.clientWidth;
			var curHeight = document.body.clientHeight;
			  
			var nLeft = curX + (curWidth / 2) - (nWidth / 2);
			var nTop = curY + (curHeight / 2) - (nHeight / 2 -71);

			var strOption = "";
			strOption += "left=" + nLeft + "px,";
			strOption += "top=" + nTop + "px,";
			strOption += "width=" + nWidth + "px,";
			strOption += "height=" + nHeight + "px,";
			strOption += "toolbar=no,menubar=no,location=no,";
			strOption += "resizable=yes,status=yes";
			
			window.open(pstUrl + "?"+ varParam,'BD_GUARANTY_INFO', strOption);
		}
		
		
		function fnViewDelete() {
			
			var jsonData = {'pjKey' : $('#ipt_pjKey').val(), 'bdKey' :  $('#ipt_bdKey').val()};
			
			$.ajax({
	        	url :"/project/detail/biddingDelete.do",
	        	type:"POST",  
	            data: jsonData,
	     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType: 'json',
	            async : false,
	        	success:function(data){		  
	        		//alert(data.accountList[0].acNm);
	        		//선택 목록 생성
	        		alert("삭제 되었습니다.");
	        		location.reload();
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	    	});
		}
		
		function fnViewModify() {
		
			var dialogId = 'program_layer';
			
			var varParam = {'pjKey' : $('#ipt_pjKey').val(), "workClass":"입찰_첨부파일"};
			
			var button = new Array;
			button = [];
			
			parent.showModalPop(dialogId, "/project/write/biddingInfo.do", varParam, button, '', 'width:1144px;height:708px');
		}
		
		/* 
		function fnViewModify(){
			
			alert('viewModify()');
			
			var modCh = 1;
			if(modCh % 2 == 1) {
				$("#selectTable").css('display','none'); 
				$("#modTable").removeClass('dpNone');
				$("#modInfo img").attr('src',"/images/btn_save.png");
			} else {
				// alert('수정되었습니다.'); 
				 var object = {};
	           	var formData = $("#viewForm").serializeArray();
	           	for (var i = 0; i<formData.length; i++){
	                
	                object[formData[i]['name']] = formData[i]['value'];
	             }
	           	var data = JSON.stringify(object);
	           
				$.ajax ({
					url:"/project/update/biddingInfo.do",
					type:'post',
					data: data,
					dataType:'json',
					contentType: "application/json; charset=UTF-8", 
					success:function(data){	
		            	alert('첨부파일 저장');
		            	 
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
				}); 
				// location.reload(); 
			}
			modCh++;
		}
		 */
	</script>
</head>
<body>
	<form:form id="listForm" name="listForm" method="post">
		<input type="hidden" id="ipt_pjKey" name="pjKey" value="${pjKey}" />
		<input type="hidden" id="ipt_bdKey" name="bdKey" value="${biddingVO.bdKey}" />
		<input type="hidden" id="ipt_bdFile" name="bdFile" value="${biddingFileList }" />
		<div class="contentsWrap">
			<div class="contents">
				<!-- 입찰정보 시작 -->
				<div class="floatL dpBlock fxd">
					<!-- 입찰정보 시작 -->
					<div id="detailForm">
						
						<div class="stitle">
							입찰정보
						</div>
						<div class="floatC">
							<!-- 입찰정보 표기 시작  -->
							<table class="dtl" id="selectTable">
								<tr>
									<td>입찰보증증권</td>
									<td>
									 	<c:out value="${biddingVO.bdGbYn}"/>
										<%-- <c:if test='${biddingVO.bdGbYn eq "Y"}'>
											&nbsp;&nbsp;
											( 진행상태&nbsp;:&nbsp;
											<c:choose>
												<c:when test='${biddingVO.bdGbFinishYn eq "N"}'>
													발행전 ) &nbsp;&nbsp;
													<span style="cursor: hand;">
														<img src="/images/btn_stock_publish.png" onclick="javascript:fnShowStock();" style="vertical-align: middle;"/>
													</span>
												</c:when>
												<c:when test='${biddingVO.bdGbFinishYn eq "R"}'>
													발행요청 ) &nbsp;&nbsp;
													<span style="cursor: hand;">
														<img src="/images/btn_stock_end.png" onclick="javascript:fnShowStock();" style="vertical-align: middle;"/>
													</span>
												</c:when>
												<c:when test='${biddingVO.bdGbFinishYn eq "Y"}'>
													발행완료 ) &nbsp;&nbsp;
													<span style="cursor: hand;">
														<img src="/images/btn_stock_mod.png"     onclick="javascript:fnShowStock();" style="vertical-align: middle;"/>
													</span>
												</c:when>
											</c:choose>
										</c:if>  --%>
									</td>
								</tr>
								<tr>
									<td>입찰서류</td>	
									<td>
										<ul>
											<c:forEach var="result" items="${biddingFileList}" varStatus="status">
												<li>
													<c:choose>
														<c:when test="${result.bdFileKindCd eq 'BDFL1199'}">
															<c:out value="${result.bdFileDocNm}"/>
														</c:when>
														<c:otherwise>
															<c:out value="${result.cdNm}"/> 
														</c:otherwise>
													</c:choose>
													- <c:out value="${result.bdDocCnt}부"/>
												</li>
											</c:forEach> 
										</ul>
									</td>
								</tr>
								<tr>
									<td>입찰기한</td>
									<td><c:out value="${displayUtil.displayDate(biddingVO.bdLimitDt)}"/>&nbsp<c:out value="${displayUtil.displayTime(biddingVO.bdLimitTm)}"/></td>
								</tr>
								<tr>
									<td>제안서</td>
									<td>
										<c:out value="${biddingVO.bdProposalYn}"/>
										<c:if test='${biddingVO.bdProposalYn.equals("Y")}'> 
											/ 마감기한 : <c:out value="${ displayUtil.displayDate(biddingVO.bdProposalDueDt)}"/>&nbsp<c:out value="${ displayUtil.displayTime(biddingVO.bdProposalDueTm)}"/>
										</c:if>
									</td>
									
									
								</tr>
								<tr>
									<td>제안발표</td>
									<td>
										<c:out value="${biddingVO.bdProposalPresentYn}"/>
										<c:if test='${biddingVO.bdProposalPresentYn.equals("Y")}'> 
											/ 발표일자 : <c:out value="${ displayUtil.displayDate(biddingVO.bdProposalPresentDt)}"/>&nbsp<c:out value="${ displayUtil.displayTime(biddingVO.bdProposalPresentTm)}"/>
										</c:if> 
									</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td>
										<div style="clear:both;" id="fileWrap">
											<c:forEach var="result" items="${fileList }" varStatus="status">
												<input class="upload-name cursorP veralignT" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/>
												<c:if test="${status.last eq false}"><br /></c:if>
											</c:forEach>
										</div>
									</td>
								</tr>
							</table>
							<!-- 입찰정보 표기 끝  -->
							
							<!-- 입찰정보 수정 시작 -->
							<table class="dtl dpNone" id="modTable">
								<tr>
									<td>입찰보증증권</td>
									<td>
										<c:choose>
											<c:when test='${biddingVO.bdGbYn eq "Y"}'>
												<c:set var="bdGbY" value="checked"/>
											</c:when>
											<c:otherwise>
												<c:set var="bdGbN" value="checked"/>
											</c:otherwise>
										</c:choose>
										
										<label class="radio"><input type="radio" name="bdGbYn" value="Y" <c:out value="${bdGbY}" /> /><span class="ico"></span><span class="text">Y</span></label>
										<label class="radio"><input type="radio" name="bdGbYn" value="N" <c:out value="${bdGbN}" /> /><span class="ico"></span><span class="text">N</span></label>
									</td>
								</tr>
								<tr>
									<td>입찰서류</td>	
									<td>
										<ul>
											<c:set var="BDFL1110_Cnt" value="0" />
											<c:set var="BDFL1120_Cnt" value="0" />
											<c:set var="BDFL1130_Cnt" value="0" />
											<c:set var="BDFL1140_Cnt" value="0" />
											<c:set var="BDFL1150_Cnt" value="0" />
											<c:set var="BDFL1160_Cnt" value="0" />
											<c:set var="BDFL1199_Cnt" value="0" />
											<c:forEach var="biddingFile" items="${biddingFileList}" varStatus="status">
												
												<c:choose>
													<c:when test='${biddingFile.bdFileKindCd eq "BDFL1110"}'>
														<c:set var="BDFL1110_Chd"  value="checked" />
														<c:set var="BDFL1110_Cnt" value="${biddingFile.bdDocCnt}" />
													</c:when>
												</c:choose>
												
												<c:choose>
													<c:when test='${biddingFile.bdFileKindCd eq "BDFL1120"}'>
														<c:set var="BDFL1120_Chd"  value="checked" />
														<c:set var="BDFL1120_Cnt"  value="${biddingFile.bdDocCnt}" />
													</c:when>
												</c:choose>
												
												<c:choose>
													<c:when test='${biddingFile.bdFileKindCd eq "BDFL1130"}'>
														<c:set var="BDFL1130_Chd"  value="checked" />
														<c:set var="BDFL1130_Cnt"  value="${biddingFile.bdDocCnt}" />
													</c:when>
												</c:choose>
												
												<c:choose>
													<c:when test='${biddingFile.bdFileKindCd eq "BDFL1140"}'>
														<c:set var="BDFL1140_Chd"  value="checked" />
														<c:set var="BDFL1140_Cnt"  value="${biddingFile.bdDocCnt}" />
													</c:when>
												</c:choose>
												
												<c:choose>
													<c:when test='${biddingFile.bdFileKindCd eq "BDFL1150"}'>
														<c:set var="BDFL1150_Chd"  value="checked" />
														<c:set var="BDFL1150_Cnt"  value="${biddingFile.bdDocCnt}" />
													</c:when>
												</c:choose>
												
												<c:choose>
													<c:when test='${biddingFile.bdFileKindCd eq "BDFL1160"}'>
														<c:set var="BDFL1160_Chd"  value="checked" />
														<c:set var="BDFL1160_Cnt"  value="${biddingFile.bdDocCnt}" />
													</c:when>
												</c:choose>
												
												<c:choose>
													<c:when test='${biddingFile.bdFileKindCd eq "BDFL1199"}'>
														<c:set var="BDFL1199_Chd"  value="checked" />
														<c:set var="BDFL1199_Cnt"  value="${biddingFile.bdDocCnt}" />
														<c:set var="BDFL1199_Nm"   value="${biddingFile.bdFileDocNmEtc}" />
													</c:when>
												</c:choose>
												
											</c:forEach>
											<li>
												<div class="floatL">
													<input class="tCheck" type="checkbox" id ="bdKind1" name=""  value="" <c:out value="${BDFL1110_Chd}"/> />
													<label for="bdKind1" class="cursorP" ></label>
													<span class="cbspan">사업자등록증</span>
												</div>
												<div>
													<a href="#"  class="decreaseQuantity"><img src="<c:url value='/images/ic_minus.png'/>" /></a>
													<label id="numberUpDown">
														<c:out value="${BDFL1110_Cnt}" />
													</label>
													<a href="#"  class="increaseQuantity"><img src="<c:url value='/images/ic_plus.png'/>"/></a>
												</div>
											</li>
											<li>
												<div class="floatL">
													<input class="tCheck" type="checkbox" id ="bdKind2" name=""  value="" <c:out value="${BDFL1120_Chd}"/> />
													<label for="bdKind2" class="cursorP" ></label>
													<span class="cbspan">법인등기부등본</span>
												</div>
												<div>
													<a href="#"  class="decreaseQuantity"><img src="<c:url value='/images/ic_minus.png'/>" /></a>
													<label id="numberUpDown">
														<c:out value="${BDFL1120_Cnt}" />
													</label>
													<a href="#"  class="increaseQuantity"><img src="<c:url value='/images/ic_plus.png'/>"/></a>
												</div>
											</li>
											<li>
												<div class="floatL">
													<input class="tCheck" type="checkbox" id ="bdKind3" name=""  value="" <c:out value="${BDFL1130_Chd}"/> />
													<label for="bdKind3" class="cursorP" ></label>
													<span class="cbspan">법인인감증명서</span>
												</div>
												<div>
													<a href="#"  class="decreaseQuantity"><img src="<c:url value='/images/ic_minus.png'/>" /></a>
													<label id="numberUpDown">
														<c:out value="${BDFL1130_Cnt}" />
													</label>
													<a href="#"  class="increaseQuantity"><img src="<c:url value='/images/ic_plus.png'/>"/></a>
												</div> 
											</li>
											<li>
												<div class="floatL">
													<input class="tCheck" type="checkbox" id ="bdKind4" name=""  value="" <c:out value="${BDFL1140_Chd}"/> />
													<label for="bdKind4" class="cursorP" ></label>
													<span class="cbspan">사용인감계</span>
												</div>
												<div>
													<a href="#"  class="decreaseQuantity"><img src="<c:url value='/images/ic_minus.png'/>"/></a>
													<label id="numberUpDown">
														<c:out value="${BDFL1140_Cnt}" />
													</label>
													<a href="#"  class="increaseQuantity"><img src="<c:url value='/images/ic_plus.png'/>"/></a>
												</div>
											</li>
											<li>
												<div class="floatL">
													<input class="tCheck" type="checkbox" id ="bdKind5" name=""  value="" <c:out value="${BDFL1150_Chd}"/> />
													<label for="bdKind5" class="cursorP" ></label>
													<span class="cbspan">위임장</span>
												</div>
												<div>
													<a href="#"  class="decreaseQuantity"><img src="<c:url value='/images/ic_minus.png'/>"/></a>
													<label id="numberUpDown">
														<c:out value="${BDFL1150_Cnt}" />
													</label>
													<a href="#"  class="increaseQuantity"><img src="<c:url value='/images/ic_plus.png'/>"/></a>
												</div> 
											</li>
											<li>
												<div class="floatL">
													<input class="tCheck" type="checkbox" id ="bdKind6" name=""  value="" <c:out value="${BDFL1160_Chd}"/> />
													<label for="bdKind6" class="cursorP" ></label>
													<span class="cbspan">대리인 명함</span>
												</div>
												<div>
													<a href="#"  class="decreaseQuantity"><img src="<c:url value='/images/ic_minus.png'/>" /></a>
													<label id="numberUpDown">
														<c:out value="${BDFL1160_Cnt}" />
													</label>
													<a href="#"  class="increaseQuantity"><img src="<c:url value='/images/ic_plus.png'/>"/></a>
												</div> 
											</li>
											<li>
												<div class="floatL">
													<input class="tCheck" type="checkbox" id ="bdKind7" name=""  value="" <c:out value="${BDFL1199_Chd}"/> />
													<label for="bdKind7" class="cursorP" ></label>
													<span class="cbspan">기타 서류</span>
												</div>
												<div>
													<input type="text" value="${BDFL1199_Nm}" />
													<a href="#"  class="decreaseQuantity"><img src="<c:url value='/images/ic_minus.png'/>"/></a>
													<label id="numberUpDown">
														<c:out value="${BDFL1199_Cnt}" />
													</label>
													<a href="#"  class="increaseQuantity"><img src="<c:url value='/images/ic_plus.png'/>" /></a>
												</div>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td>입찰기한</td>
									<td>
										<input name="bdLimitDt" class="calendar" type="text" value="${displayUtil.displayDate(biddingVO.bdLimitDt)}" />
										<select name="bdLimitDt">
										
											<option <c:if test='${biddingVO.bdLimitTm eq "0900"}'>selected</c:if>>09:00</option>
											<option <c:if test='${biddingVO.bdLimitTm eq "1000"}'>selected</c:if>>10:00</option>
											<option <c:if test='${biddingVO.bdLimitTm eq "1100"}'>selected</c:if>>11:00</option>
											<option <c:if test='${biddingVO.bdLimitTm eq "1200"}'>selected</c:if>>12:00</option>
											<option <c:if test='${biddingVO.bdLimitTm eq "1300"}'>selected</c:if>>13:00</option>
											<option <c:if test='${biddingVO.bdLimitTm eq "1400"}'>selected</c:if>>14:00</option>
											<option <c:if test='${biddingVO.bdLimitTm eq "1500"}'>selected</c:if>>15:00</option>
											<option <c:if test='${biddingVO.bdLimitTm eq "1600"}'>selected</c:if>>16:00</option>
											<option <c:if test='${biddingVO.bdLimitTm eq "1700"}'>selected</c:if>>17:00</option>
											<option <c:if test='${biddingVO.bdLimitTm eq "1800"}'>selected</c:if>>18:00</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>제안서</td>
									<td>
										<c:if test='${biddingVO.bdProposalYn eq "Y"}'>
											<c:set var="bdProposalY" value="checked"/> 
										</c:if>
										<c:if test='${biddingVO.bdProposalYn eq "N"}'>
											<c:set var="bdProposalN" value="checked"/> 
										</c:if>
										<label class="radio"><input type="radio" name="bdProposalYn" value="Y" <c:out value="${bdProposalY}" /> /><span class="ico"></span><span class="text">Y</span></label>
										<label class="radio"><input type="radio" name="bdProposalYn" value="N" <c:out value="${bdProposalN}" /> /><span class="ico"></span><span class="text">N</span></label>
										
										<span class="bizPlan">
											<c:if test='${biddingVO.bdProposalYn eq "Y"}'>
												<label class="title">접수마감</label>
												<input name="bdProposalDueDt" class="calendar" type="text" value="${displayUtil.displayDate(biddingVO.bdProposalDueDt)}"/>
												<select name="bdProposalDueTm">
													<option <c:if test='${biddingVO.bdProposalDueTm eq "0900"}'>selected</c:if>>09:00</option>
													<option <c:if test='${biddingVO.bdProposalDueTm eq "1000"}'>selected</c:if>>10:00</option>
													<option <c:if test='${biddingVO.bdProposalDueTm eq "1100"}'>selected</c:if>>11:00</option>
													<option <c:if test='${biddingVO.bdProposalDueTm eq "1200"}'>selected</c:if>>12:00</option>
													<option <c:if test='${biddingVO.bdProposalDueTm eq "1300"}'>selected</c:if>>13:00</option>
													<option <c:if test='${biddingVO.bdProposalDueTm eq "1400"}'>selected</c:if>>14:00</option>
													<option <c:if test='${biddingVO.bdProposalDueTm eq "1500"}'>selected</c:if>>15:00</option>
													<option <c:if test='${biddingVO.bdProposalDueTm eq "1600"}'>selected</c:if>>16:00</option>
													<option <c:if test='${biddingVO.bdProposalDueTm eq "1700"}'>selected</c:if>>17:00</option>
													<option <c:if test='${biddingVO.bdProposalDueTm eq "1800"}'>selected</c:if>>18:00</option>
												</select>
											</c:if>
										</span>
									</td>
								</tr>
								<tr>
									<td>제안발표</td>
									<td>
										<c:if test='${biddingVO.bdProposalPresentYn eq "Y"}'>
											<c:set var="bdProposalPresentY" value="checked"/> 
										</c:if>
										<c:if test='${biddingVO.bdProposalPresentYn eq "N"}'>
											<c:set var="bdProposalPresentN" value="checked"/> 
										</c:if>
										
										<label class="radio"><input type="radio" name="bdProposalPresentYn" value="Y" <c:out value="${bdProposalPresentY}" /> /><span class="ico"></span><span class="text">Y</span></label>
										<label class="radio"><input type="radio" name="bdProposalPresentYn" value="N" <c:out value="${bdProposalPresentN}" /> /><span class="ico"></span><span class="text">N</span></label>
										<span class="announce">
											<label class="title">발표시간</label>
											<input name="bdProposalPresentDt" class="calendar" type="text" value="${displayUtil.displayDate(biddingVO.bdProposalPresentDt)}"/>
											<select>
												<option <c:if test='${biddingVO.bdProposalPresentTm eq "0900"}'>selected</c:if>>09:00</option>
												<option <c:if test='${biddingVO.bdProposalPresentTm eq "1000"}'>selected</c:if>>10:00</option>
												<option <c:if test='${biddingVO.bdProposalPresentTm eq "1100"}'>selected</c:if>>11:00</option>
												<option <c:if test='${biddingVO.bdProposalPresentTm eq "1200"}'>selected</c:if>>12:00</option>
												<option <c:if test='${biddingVO.bdProposalPresentTm eq "1300"}'>selected</c:if>>13:00</option>
												<option <c:if test='${biddingVO.bdProposalPresentTm eq "1400"}'>selected</c:if>>14:00</option>
												<option <c:if test='${biddingVO.bdProposalPresentTm eq "1500"}'>selected</c:if>>15:00</option>
												<option <c:if test='${biddingVO.bdProposalPresentTm eq "1600"}'>selected</c:if>>16:00</option>
												<option <c:if test='${biddingVO.bdProposalPresentTm eq "1700"}'>selected</c:if>>17:00</option>
												<option <c:if test='${biddingVO.bdProposalPresentTm eq "1800"}'>selected</c:if>>18:00</option>
											</select>
										</span>
									</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td>
										<%-- <c:forEach var="result" items="${fileList }" varStatus="status">
											<input class="upload-name cursorP" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/>
											<a class="close cursorP" onclick="fn_deleteFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm }" />')"><img src="/images/btn_close.png" /></a>
											<c:if test="${status.last eq false}"><br /></c:if>
										</c:forEach>  --%>
									</td>
								</tr>
							</table>
							<!-- 입찰정보 수정 끝 -->
						</div>
					</div>
					<!-- 입찰정보 끝 -->
				</div>
				<div class="floatC"></div>
				<!-- 입찰정보 끝 -->
			</div>
		</div>
	</form:form>
	<script type="text/javascript">
		var existFileNum = $('#atchFileCnt').val();        
		var maxFileNum = $('#maxFileCnt').val();
		// 첨부한 파일 갯수
		if (existFileNum ==null || existFileNum=="") {
			existFileNum = 0;
		}
		// 최대 첨부가능 갯수
		if(maxFileNum==null || maxFileNum==""){
			maxFileNum = 3;
		} 
		// 남은 첨부가능 갯수
		var uploadableFileNum = maxFileNum - existFileNum;
		
		if (uploadableFileNum<0) {
			uploadableFileNum = 0;
		}               
	    
	    if (uploadableFileNum != 0) {
	        fn_check_file('Y');
	        /* var multi_selector = new MultiSelector(document.getElementById('egovComFileList'), maxFileNum );
	        multi_selector.addElement(document.getElementById('fileUploader')); */   
	    } else{
	    	fn_check_file('N');
	    } 
	             
	</script>
	<form:form id="viewForm" name="viewForm" method="POST">
		<input type="hidden" name="checkedDel" value="" />
		<input type="hidden" name="id" value=""/>
		<input type="hidden" name="atchFileId" value=""/>
		<input type="hidden" name="fileKey" value=""/>
		<input type="hidden" name="fileOrgNm" value=""/>
		<input type="hidden" name="fileType" value="cdc"/>
	</form:form>
</body>
</html>