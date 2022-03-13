<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>CEP 샘플 화면(프로젝트 상세보기)</title>

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
		body {
			overflow: hidden !important;
		}
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
		/*
			padding: 38px 71px;
		*/ 
			width: 987px;
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
			border-top: 4px solid #6a5bae;
			overflow: hidden;
		}
		form .contents .dtl tbody {
			overflow-y: auto;
			overflow-x: hidden;
			height: auto;
			float: left;
			border-bottom: 2px solid #c4c4c4;
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
		
		#modBasicTable tr td:last-child {
			padding: 5px 20px;
		}
		#modBasicTable input[type="text"],
		#modBasicTable textarea {
			width: 380px; 
		    color: #0e8a67;
		}
		#modBasicTable textarea {
			color: #0e8a67;
		}
		#modBasicTable select {
			font-size: 14px;
			width: 190px;
		   color: #0e8a67;
		}
		#modBasicTable label {
			margin-left: 15px;
		}
		#modBasicTable input[class="calendar"] {
			width: 168px;
		}
		

		#fileWrap input {
			width: 100%;
			margin-top: 10px;
			border: none;
		}
		#fileWrap input:first-child {
			margin-top: 0;
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
			
			$(parent.document).find("#modMinInfo").removeClass("dpNone");
			$(parent.document).find("#delMinInfo").css("dpNone");
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
		
		function fnViewModify() {
			
			//설치구축 key 구하기
			
			var dialogId = 'program_layer';
			
			var varParam = {'pjKey' : $('#ipt_pjKey').val(), 'workClass' : $("#workClass").val()};
			
			var button = new Array;
			button = [];
			
			parent.showModalPop(dialogId, "/project/write/finishInfo.do", varParam, button, '', 'width:1144px;height:706px');
		}
		
		
		
		
		/* 
		function fnViewModify(){
			
			
			var modCh = 1;
			if(modCh % 2 == 1) {
				$("#selectTable").css('display','none'); 
				$("#modTable").removeClass('dpNone');
				//$("#modInfo img").attr('src',"/images/btn_save.png");
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
		<input type="hidden" id="ipt_pjKey" name="pjKey" value="${projectInfo.pjKey}" />
		<input type="hidden" id="workClass" name="workClass" value="완료_첨부파일" />
		<div class="contentsWrap">
			<div class="contents">
				<!-- 입찰정보 시작 -->
				<div class="floatL dpBlock fxd">
					<!-- 입찰정보 시작 -->
					<div id="detailForm">
						
						<div class="stitle">
							검수정보
						</div>
						<div class="floatC">
							<!-- 입찰정보 표기 시작  -->
							<table class="dtl" id="selectTable">
								<tr>
									<td>검수일자</td>
									<td><c:out value="${displayUtil.displayDate(detailInfo.pjInspectDt)}"/></td>
								</tr>
								<tr>
									<td>비고</td>
									<td>
										<pre style="width: 781px; max-height: 250px; overflow-y: auto;"><c:out value="${detailInfo.finishRemark}"/></pre>
									</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td>
										<div style="clear: both;" id="fileWrap">
											<c:forEach var="result" items="${fileList }" varStatus="status">
												<input class="upload-name cursorP veralignT ftw200" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly />
												<c:if test="${status.last eq false}">
													<br />
												</c:if>
											</c:forEach>
										</div>
									</td>
								</tr>
							</table>
							<!-- 입찰정보 표기 끝  -->
							
							<!-- 입찰정보 수정 시작 -->
							<table class="dtl dpNone" id="modTable">
								<tr>
									<td>검수일자</td>
									<td>
										<input name="pjInspectDt" type="text" class="calendar" value='<c:out value="${displayUtil.displayDate(detailInfo.pjInspectDt)}"/>'/>
									</td>
								</tr>
								<tr>
									<td>비고</td>
									<td>
										<textarea name="finishRemark" style="width:760px; height:130px;">
											<c:out value="${detailInfo.finishRemark}"/>
										</textarea>
									</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td>
										<div style="clear: both;" id="fileWrap">
											<c:forEach var="result" items="${fileList }" varStatus="status">
												<input class="upload-name cursorP" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly />
												<c:if test="${status.last eq false}">
													<br />
												</c:if>
											</c:forEach>
										</div>
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
		/* var existFileNum = $('#atchFileCnt').val();        
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
	        /*var multi_selector = new MultiSelector(document.getElementById('egovComFileList'), maxFileNum );
	        multi_selector.addElement(document.getElementById('fileUploader'));   */
	    /*} else{
	    	fn_check_file('N');
	    }  */
	             
	</script>
	<form:form id="viewForm" name="viewForm" method="POST">
		<input type="hidden" name="fileKey" value="" />
		<input type="hidden" name="fileOrgNm" value="" />
	</form:form>
</body>
</html>