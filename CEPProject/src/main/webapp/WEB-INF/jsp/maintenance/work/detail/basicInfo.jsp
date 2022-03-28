<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<%@include file="../../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수작업 상세</title>
	
	<style>
		.sfcnt {
			height: 91px;
		}
		.bottom > div {
			margin-top: 22px;
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
			box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);
			height: 830px;
		}
		form .contentsWrap .contents {
			padding: 38px 71px; 
			width: 1662px;
		}
		form .title {
			height: 50px;
		}
		form .title > label {
			font-size: 26px;
		}
		form .contents > .fxd {
			width: 60%;
		}
		form .contents .stitle {
			font-size: 18px;
			font-weight: 500;
			margin-bottom: 12px;
			margin-top: 26px;
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
		 
		form .contents .dtl2 tr td {
			padding: 6px 20px;
		}
		form .contents > div > div > div > table tr td:first-child {
			width: 130px;
			font-weight: 400;
		} 
		form .contents > div > div > div > table tr td:last-child {
			width: 400px;
			font-weight: 200;
		}
		form .contents .bsc tr td:last-child {
			width: 400px;
			font-weight: 200;
			box-shadow: inset 7px 0 6px -4px #d0e2de;
		}
		/* 기본정보 내용 글자 굵기 */
		form .bsc tr td:last-child {
			width: 400px;
			font-weight: 200;
		}
		/* 기본정보 틀 */
		form .contents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			/* border: 1px solid #bee2da; */
		    border-bottom: 2px solid #bfe3db;
		    width: 614px;
		}
		
		form .contents .bsc tbody {			
			height: 576px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		form .contents .bsc tr td {
			/* color: #0e8a67; */
			color: #26a07d;
		}
		/* 기본정보 세로줄 나오는것 */
		form .contents .bsc tr td:first-child {
			/* box-shadow: inset -7px 0 9px -4px #d0e2de; */			
			padding: 13px 13px 13px 20px;
		}
		form .contents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
			background-color: #d3d3d3;
		}
		form .contents > .fxd .title ul li {
			width: 33.3%;
			line-height: 46px;
			color: #777777;
			background-color: #d3d3d3;
			border-radius: 35px;
		}
		form .contents > .fxd .title ul li:last-child,
		form .contents > .fxd .stitle ul li:last-child {
			clear: both;
			float: none;
			width: 0 !important;
		}
		.liAfter:after {
			border-color: #b9b9b9 #b9b9b9 #b9b9b9 #b9b9b9 !important;
		}
		.liAfterNone:after {
			display: none !important;
		}
		.liArrow {
			background-image: url('/images/step_arrow.png');
			background-repeat: no-repeat;
		}
/* 		form .contents > .fxd .title ul li:first-child {
			border-radius: 35px 0 0 35px;
		}
		form .contents > .fxd .title ul li:nth-last-child(2)  {
			border-radius: 0 35px 35px 0;
		} */
		
		form .contents .title ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		}
		form .contents .title ul li:last-child {
			clear: both;
			float: none;
			width: 0 !important;
		}
		form .contents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
			background-color: #d3d3d3;
		}
		form .contents > .fxd .title ul li > label {
			display: inline-block;
    		width: 100%;
    		/* cursor: pointer; */
		}
		/* form .contents > .fxd .title ul li.on,
		form .contents > .fxd .title ul li:hover  {
			color: #fff  !important;
			background-color: #4c3d92;
		} */
		
		form .contents > .fxd .title ul li.on {
			color: #fff  !important;
			background-color: #4c3d92 !important;
		}
		
		
		form .contents > .fxd .title ul li:hover  {
			color: #777777 ;
			background-color: #b9b9b9;
		}
		
		form .contents .dtl, form .contents .dtl2 {
			border-top: 4px solid #6a5baf;
			overflow: hidden;
		}
		form .contents .dtl tbody, form .contents .dtl2 tbody {
			overflow-y: auto;
			overflow-x: hidden;
			height: 577px;
			float: left;
			border-bottom: 2px solid #c4c4c4;
		}
		form .contents .dtl tbody tr, form .contents .dtl2 tbody tr {
			border: 1px solid #ebe9ee;
		}
		form .contents .dtl td, form .contents .dtl2 td {
			color: #000;
		}
		form .contents .dtl tr td:first-child, form .contents .dtl2 tr td:first-child {
			background-color: #e1dff5;
			border-right: 1px solid #ebe9ee;
		}
		form .contents .dtl tr td:last-child, form .contents .dtl2 tr td:last-child {
			width: 784px;
		}
		
		.dtl2 input[class="pname"] {
			width: 300px;
			border : none;
			outline: none;
			/* background-color: #f6f7fc; */
		}
		input[type="text"] {
		 	width: 138px;
		    height: 34px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 4px;
		}
		input[class^="calendar"] {
		    background-image: url(/images/calendar_icon.png);
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		select {
			height: 35px;
		    width: 160px;
		    border: 1px solid #e9e9e9;
		    padding: 0 10px;
		    -webkit-appearance: none;
		    background: url(/images/arrow_down.png) no-repeat 91% 50%;
		    background-color: #fff;
		    color: #535353;
		    font-size: 15px;
		}
		textarea {
			border: 1px solid #e6e6e6;
			padding: 0 10px;
			width: 746px;		
			resize: none;
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
		form .contents .dtl#modTable ul li {
			float: left;
			width: 261px;		
			line-height: 2;
		}
		.contents .bsc tbody tr td > span {
			display: list-item;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 99%;
			margin: 0 auto;
		}
	</style>
	<script>
		$(document).ready(function() {
			
			var jsonData;
			//고객담당자 정보를 저장한다.
			var acDirectorList = new Array();
			<c:forEach var="director" items="${acDirectorList}" varStatus="status">		
			
				jsonData = new Object();
				jsonData.acDirectorKey = "${director.acDirectorKey}";
				jsonData.acDirectorNm = "${director.acDirectorNm}";
				jsonData.acDirectorInfo = "${director.acDirectorInfo}";
				acDirectorList.push(jsonData);
			</c:forEach>
			//고객담당자 정보 셋팅
			 if(acDirectorList.length>0){
				$('#m_mtWorkAcDirectorKey').val("${basicWorkInfo.mtWorkAcDirectorKey}").attr("selected", "true");
				for ( var idx = 0 ; idx < acDirectorList.length ; idx++ ) {					
					if("${basicWorkInfo.mtWorkAcDirectorKey}" == acDirectorList[idx].acDirectorKey ){
						$('#m_acDirectorInfo').val(acDirectorList[idx].acDirectorInfo);
						
						break;
					}
				}					
			}
			//지원담당자정보 셋팅
			$('#mtWorkEmpKey').val("${basicWorkInfo.mtWorkEmpKey}").attr("selected", "true");
			
			//작업유형 셋팅
			$('#mtWorkTypeCd').val("${basicWorkInfo.mtWorkTypeCd}").attr("selected", "true");
			
			//조치결과
			$('#mtWorkResultCd').val("${basicWorkInfo.mtWorkResultCd}").attr("selected", "true");
			
			//제품등록여부
			//$('#mtWorkPmYn').val("${basicWorkInfo.mtWorkPmYn}").attr("selected", "true");
			$("input:radio[name='mtWorkPmYn']:radio[value='${basicWorkInfo.mtWorkPmYn}']").prop('checked', true);
			
			//추가발주여부
			//$('#mtWorkOrderYn').val("${basicWorkInfo.mtWorkOrderYn}").attr("selected", "true");
			$("input:radio[name='mtWorkOrderYn']:radio[value='${basicWorkInfo.mtWorkOrderYn}']").prop('checked', true);
			
			//장비별작업정보 커서 생성
			if("Y"=="${basicWorkInfo.mtWorkPmYn}"){
				$("#productLabel").css('cursor','pointer');
			}
			//발주정보 커서 생성.
			if("Y"=="${basicWorkInfo.mtWorkOrderYn}"){
				$("#orderLabel").css('cursor','pointer');				
			}
			
			
			
			$('li[id^=LI_TOPBar]').click(function(event){
				//location.href = this.title; event.preventDefault();
				if(this.title == "basicInfo"){
					document.m_mtBasicForm.action = "/maintenance/work/detail/basicInfo.do";
		           	document.m_mtBasicForm.submit();
				} else if(this.title == "productInfo"){
					//console.log("productInfo===>${basicWorkInfo.mtWorkPmYn}")
					if("${basicWorkInfo.mtWorkPmYn}" == "Y"){
						document.m_mtBasicForm.action = "/maintenance/work/detail/productInfo.do";
			           	document.m_mtBasicForm.submit();
					} else {
						alert("장비별작업정보가 없습니다.\n 제품등록여부를 Y로 변경 후 장비별작업정보를 등록하세요.")
					}
				} else if(this.title == "orderInfo"){
					//console.log("orderInfo===>${basicWorkInfo.mtWorkOrderYn}")
					if("${basicWorkInfo.mtWorkOrderYn}" == "Y"){
						document.m_mtBasicForm.action = "/maintenance/work/detail/orderInfo.do";
			           	document.m_mtBasicForm.submit();
					} else {
						alert("발주정보가 없습니다.\n 추가발주유무를 Y로 변경 후 발주정보를 등록하세요.")
					}
				}
				
			});
			
			
			
			
			/*
			 수정버튼 클릭
			 기존 detail 수정화면으로 변경에서 팝업화면으로 변경함.
			*/
			$('#modInfo').click(function() {
				var url = '/maintenance/work/write/basicInfoView.do';
				var dialogId = 'program_layer';
				var varParam = {
						"mtIntegrateKey":'<c:out value="${basicContractInfo.mtIntegrateKey}"/>',
						"mtWorkKey":'<c:out value="${basicWorkInfo.mtWorkKey}"/>'					
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 

			});
			/* $('#modInfo').click(function() {
				console.log($('#editMode').val())
				if($('#editMode').val()=="0"){
					$('#modTable').show();
					$('#selectTable').hide();
					
					$('#editMode').val(1);
				} else {
					// update 수행.
					var object = {};
		           	var formData = $("#m_mtBasicForm").serializeArray();
		           	//console.log("formData===>"+formData);
		           	for (var i = 0; i<formData.length; i++){
		                
		                object[formData[i]['name']] = formData[i]['value'];
		             }
		           	var sendData = JSON.stringify(object);
		           	
		           	 $.ajax({
			        	url:"/maintenance/work/edit/basicInfo.do",
			            dataType: 'text', 
			            type:"post",  
			            data: sendData,
			            
			     	   	contentType: "application/json; charset=UTF-8", 
			     	  	beforeSend: function(xhr) {
			        		xhr.setRequestHeader("AJAX", true);	        		
			        	},
			            success:function(data){	
			            	var paramData = JSON.parse(data);
			            	console.log("data===>"+paramData.successYN);
			            	//console.log("successYN===>"+paramData);
			            	//console.log("data.mtWorkKey==>"+paramData.mtWorkKey);
			            	if("Y"==paramData.successYN){
			            		alert("기본정보 수정을 성공하였습니다.")
				            	$('#modTable').hide();
								$('#selectTable').show();
						
								$('#editMode').val(0);
								
				            	document.m_mtBasicForm.action = "/maintenance/work/detail/basicInfo.do";
				        		//document.m_mtBasicForm.method="get";
				                document.m_mtBasicForm.submit(); 
			            	} else {
			            		alert("기본정보 수정을 실패하였습니다.")
			            	}
			            	
			            	
			            	
			            },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
			        }
		           	 
		           	);
				}

			}); */
			
			/* 고객담당자 선택하면 고객담당자 정보 변경하기  */			
			$('#m_mtWorkAcDirectorKey').change(function(){
				var checkVal = $('#m_mtWorkAcDirectorKey option:selected').val();
				//console.log("checkVal===>"+acDirectorList.length);
				if(acDirectorList.length>0){
					for ( var idx = 0 ; idx < acDirectorList.length ; idx++ ) {
						//console.log("acDirectorList[idx].acDirectorKey===>"+acDirectorList[idx].acDirectorKey);
						if(checkVal == acDirectorList[idx].acDirectorKey ){
							$('#m_acDirectorInfo').val(acDirectorList[idx].acDirectorInfo);
							break;
						}
					}					
				}				
			});
			
		});
		
		function fn_addView(){
			/* if(link == "forecastList") {
				location.href="<c:url value='/forecastList.do'/>";
			} else { */
				var url = '/maintenance/work/write/basicInfo.do';
				var dialogId = 'program_layer';
				var varParam = {
		
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px'); 
			/* } */
		}
		
		//유지보수 작업 삭제.
		function fn_deleteBtn(){
			if(confirm("유지보수작업 내용을 삭제하시겠습니까?")){
				/* document.listForm.btnOption.value='delete';
				document.listForm.selectWorkKey.value=$('input[name="gubun"]:checked').val();

				document.listForm.action = "/maintenance/work/deleteWork.do";
	           	document.listForm.submit();  */
	           	var sendData = {
	           			"selectWorkKey":$('#m_mtWorkKey').val()
	           	}
				$.ajax({
	           		url: "/maintenance/work/deleteWork.do",
	           		dataType: 'text', 
	           		type:"post",  
	           		//data: JSON.parse(sendData),
	           		data: JSON.stringify(sendData),
	           		//data: sendData,
	           		contentType: "application/json; charset=UTF-8", 
	           		beforeSend: function(xhr) {
	           			xhr.setRequestHeader("AJAX", true);	        		
	           		},
	           		success:function(data){	
	           			var paramData = JSON.parse(data);
	           		
	           			//console.log("paramData===>"+paramData);
	           			//console.log("data.mtWorkKey==>"+paramData.mtWorkKey);
	           			if("Y" == paramData.successYN){
	           				alert("유지보수작업 삭제를 성공하였습니다.");
	           				
	           				document.m_mtBasicForm.action = "/maintenance/work/workList.do";
	        	           	document.m_mtBasicForm.submit();
	           				
	           			} else {
	           				alert("유지보수작업 삭제를 실패하였습니다.");
	           				
	           			}
	           		},
	           		error: function(request, status, error) {
	           			if(request.status != '0') {
	           				alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	           			}
	           		} 
	           	});          
			} else {
				return false;
			}
		
		}
		
		// 파일다운로드 관련
		function fn_downFile(fileKey, fileOrgNm) {
			var form = document.viewForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm; 
			var data = $('#viewForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data);  
		}

	</script>
</head>
<body>
	<form id="m_mtBasicForm" name="m_mtBasicForm" method="post">
		<input type="hidden" id="m_mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>"/>
		<input type="hidden" id="m_mtWorkKey" name="mtWorkKey" value="<c:out value="${basicWorkInfo.mtWorkKey}"/>"/>
		<input type="hidden" id="orderCtFkKey" name="orderCtFkKey" value="<c:out value="${basicWorkInfo.mtWorkKey}"/>"/>
		<input type="hidden" id="editMode" name="editMode"  value="0"/>
		<!-- <div class="sfcnt"></div>
		<div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="floatL">
					<div class="title"><label class="ftw500">유지보수작업 상세정보</label></div>
					<div>
						<div class="stitle cg">기본정보</div>
						<div id="basicForm">
							<table class="bsc" id="selectBasicTable">
								<tr>
									<td>FORECAST명</td>
									<td><c:out value="${basicContractInfo.mtForcastLinkVo.mtLinkCtKeyNm}"/></td>
								</tr>
								<tr>
									<td>PROJECT명</td>
									<td><c:out value="${basicContractInfo.mtProjectLinkVo.mtLinkCtKeyNm}"/></td>
								</tr>
								<tr>
									<td>유지보수명</td>
									<td><c:out value="${basicContractInfo.mtNm}"/></td>
								</tr>
								<tr>
									<td>고객사</td>
									<td><c:out value="${basicContractInfo.mtAcNm}"/></td>
								</tr>
								<tr>
									<td>고객사담당자</td>
									<td><c:out value="${basicContractInfo.mtAcDirectorNm}"/> / <c:out value="${basicContractInfo.acDirectorInfo}"/></td>
								</tr>
								<tr>
									<td>계약일자</td>
									<td><c:out value="${displayUtil.displayDate(basicContractInfo.mtCtDt)}"/></td>
								</tr>
								<tr>
									<td>유지보수 기간</td>
									<td><c:out value="${displayUtil.displayDate(basicContractInfo.mtStartDt)}"/> ~ <c:out value="${displayUtil.displayDate(basicContractInfo.mtEndDt)}"/></td>
								</tr>
								<tr>
									<td>총계약금액</td>
									<td><c:out value="${displayUtil.commaStr(basicContractInfo.mtAmount)}"/></td>
								</tr>
								<%-- <tr>
									<td>부가세포함</td>
									<td><c:out value="${basicContractInfo.taxYn}"/></td>
								</tr> --%>
								<tr>
									<td>결제조건</td>
									<td><c:out value="${basicContractInfo.mtPayTerms}"/></td>
								</tr>
								<tr>
									<td>검수방법</td>
									<td><c:out value="${basicContractInfo.mtImCd}"/></td>
								</tr>
								<tr>
									<td>정기점검 횟수</td>
									<td><c:out value="${basicContractInfo.mtRgInspectCnt}"/> 회</td>
								</tr>
								<tr>
									<td>백계약 유무</td>
									<td><c:out value="${basicContractInfo.mtSbCtYn}"/></td>
								</tr>
								<tr>
									<td>보증증권 유무</td>
									<td><c:out value="${basicContractInfo.gbYn}"/></td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td><c:out value="${basicContractInfo.supportEmpNm}"/></td>
								</tr>
								<tr>
									<td>관리담당자</td>
									<td><c:out value="${basicContractInfo.mngEmpNm}"/></td>
								</tr>
								<tr>
									<td>영업담당자</td>
									<td><c:out value="${basicContractInfo.saleEmpNm}"/></td>
								</tr>
								<tr>
									<td>비고</td>
									<td ><pre style="width: 390px"><c:out value="${basicContractInfo.remark}"/></pre></td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td >
										<c:forEach var="result" items="${mtContractFileList }" varStatus="status">
											<%-- <input class="upload-name cursorP" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/> --%>
											<%-- <a href="javascript:fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')"><c:out value="${result.fileOrgNm}"/></a> --%>
											<button type="button" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>');" style="color: #26a07d;">
												<B><I><u><c:out value="${result.fileOrgNm}"/></u></I></B>
											</button>
											<c:if test="${status.last eq false}"><br /></c:if>
										</c:forEach>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="floatR dpBlock fxd">
					<div class="title">
						<ul>
							<li id="LI_TOPBar_WB" class="on" title="basicInfo"><label style="cursor: pointer;">작업정보</label></li>
							<li id="LI_TOPBar_WP" title="productInfo"><label id="productLabel">장비별작업정보</label></li>
							<li id="LI_TOPBar_WO" title="orderInfo"><label id="orderLabel">발주정보</label></li>
							<li></li>
						</ul>
					</div>
					<div id="detailForm">
						<div class="stitle cg colorBlack">작업정보</div>
						<div class="floatC">
							<table class="dtl" id="selectTable">
								<tr>
									<td>고객담당자</td>
									<td><c:out value="${basicWorkInfo.acDirectorNm}"/>&nbsp;/&nbsp;<c:out value="${basicWorkInfo.acDirectorInfo}"/></td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td><c:out value="${basicWorkInfo.mtWorkEmpNm}"/></td>
								</tr>
								<tr>
									<td>작업유형</td>
									<td><c:out value="${basicWorkInfo.mtWorkTypeCd}"/></td>
								</tr>
								<tr>
									<td>작업기간</td>
									<td><c:out value="${basicWorkInfo.viewWorkStartDt}"/> <c:out value="${basicWorkInfo.viewWorkStartTm}"/> ~ <c:out value="${basicWorkInfo.viewWorkEndDt}"/> <c:out value="${basicWorkInfo.viewWorkEndTm}"/></td>
								</tr>
								<tr>
									<td>조치결과</td>
									<td><c:out value="${basicWorkInfo.mtWorkResultCd}"/></td>
								</tr>
								<tr>
									<td>제품등록여부</td>
									<td><c:out value="${basicWorkInfo.mtWorkPmYn}"/></td>
								</tr>	
								<tr>
									<td>추가발주유무</td>
									<td><c:out value="${basicWorkInfo.mtWorkOrderYn}"/></td>
								</tr>								
								<tr style="height: 117px">
									<td>지원내용</td>
									<td>
										<pre><c:out value="${basicWorkInfo.mtWorkCont}"/></pre>
									</td>
								</tr>
								<tr style="height: 116px">
									<td>비고</td>
									<td><pre><c:out value="${basicWorkInfo.remark}"/></pre></td>
								</tr>
								
								<tr>
									<td>첨부파일</td>
									<td >
										<c:forEach var="result" items="${mtWorkFileList }" varStatus="status">
											<%-- <input class="upload-name cursorP" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/> --%>
											<%-- <a href="javascript:fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')"><c:out value="${result.fileOrgNm}"/></a> --%>
											<button type="button" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>');" style="color: #26a07d;">
												<B><u><c:out value="${result.fileOrgNm}"/></u></B>
											</button>
											<c:if test="${status.last eq false}"><br /></c:if>
										</c:forEach>
									</td>
								</tr>
							</table>
							<table class="dtl2" id="modTable" style="display:none">
								<tr>
									<td>고객담당자</td>
									<td>
										<select id="m_mtWorkAcDirectorKey" name="mtWorkAcDirectorKey" >
										<!-- <option value="">선택</option> -->
										<c:forEach var="director" items="${acDirectorList}" varStatus="status">										
										<option value="<c:out value="${director.acDirectorKey}"/>"><c:out value="${director.acDirectorNm}"/></option>
										</c:forEach>									
										</select>	
										<input type="text" id="m_acDirectorInfo" class="pname" readonly/>
									</td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td>
										<select id="mtWorkEmpKey" name="mtWorkEmpKey">
											<!-- <option value="">선택</option> -->
											<c:forEach var="emp" items="${empList}" varStatus="status">										
											<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
											</c:forEach>	
										</select>									
									</td>
								</tr>
								<tr>
									<td>작업유형</td>
									<td>
										<select id="mtWorkTypeCd" name="mtWorkTypeCd">
											<option value="정기점검">정기점검</option>
											<option value="장애처리">장애처리</option>
											<option value="기술지원">기술지원</option>
										</select>									
									</td>
								</tr>
								<tr>
									<td>작업기간</td>
									<td>										
										<input type="text" name="mtWorkStartDt" placeholder="from" class="calendar fromDt" value="<c:out value="${basicWorkInfo.viewWorkStartDt}"/>"/>&nbsp;<input type="text" name="mtWorkStartTm" value="<c:out value="${basicWorkInfo.viewWorkStartTm}"/>" style="width: 50px" />&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp; 
										<input type="text" name="mtWorkEndDt" placeholder="to" class="calendar toDt" value="<c:out value="${basicWorkInfo.viewWorkEndDt}"/>"/>&nbsp;<input type="text" name="mtWorkEndTm" value="<c:out value="${basicWorkInfo.viewWorkEndTm}"/>" style="width: 50px" />
									</td>
								</tr>
								<tr>
									<td>조치결과</td>
									<td>
										<select id="mtWorkResultCd" name="mtWorkResultCd">
											<option value="준비">준비</option>
											<option value="진행">진행</option>
											<option value="완료">완료</option>
										</select>									
									</td>
								</tr>
								<tr>
									<td>제품등록여부</td>
									<td>
										<!-- <select id="mtWorkPmYn" name="mtWorkPmYn">
											<option value="N">N</option>
											<option value="Y">Y</option>
										</select> -->
										<input type="radio" class="tRadio" name="mtWorkPmYn" value="Y" id="m_workPmYn1"/><label for="m_workPmYn1" class="cursorP"></label>&nbsp;&nbsp;Y
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" class="tRadio" name="mtWorkPmYn" value="N" id="m_workPmYn2" checked="checked"/><label for="m_workPmYn2" class="cursorP"></label>&nbsp;&nbsp;N					
									</td>
								</tr>	
								<tr>
									<td>추가발주유무</td>
									<td>
										<!-- <select id="mtWorkOrderYn" name="mtWorkOrderYn">
											<option value="N">N</option>
											<option value="Y">Y</option>
										</select> -->
										<input type="radio" class="tRadio" name="mtWorkOrderYn" value="Y" id="m_workOrderYn1"/><label for="m_workOrderYn1" class="cursorP"></label>&nbsp;&nbsp;Y
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" class="tRadio" name="mtWorkOrderYn" value="N" id="m_workOrderYn2" checked="checked"/><label for="m_workOrderYn2" class="cursorP"></label>&nbsp;&nbsp;N									
									</td>
								</tr>	
								<tr>
									<td>지원내용</td>
									<td>
										<textarea name="mtWorkCont"style="height: 116px"><c:out value="${basicWorkInfo.mtWorkCont}"/></textarea>
									</td>
								</tr>
								<tr>
									<td>비고</td>
									<td>
										<textarea name="remark" style="height: 90px"><c:out value="${basicWorkInfo.remark}"/></textarea>
									</td>
								</tr>
							</table>
						</div>
						<div class="bottom">
							<div class="floatR">
							<c:if test='${loginID eq basicWorkInfo.mtWorkEmpKey or loginID eq basicWorkInfo.regEmpKey}'>
								<button type="button" value="수정" id="modInfo"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
							</c:if>
								<%-- <button type="button" value="수정" id="modInfo"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button> --%>
								<%-- <button type="button" value="삭제" onclick="fn_deleteBtn();"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button> --%>
								<%-- <button type="button" value="Excel"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button> --%>
								
								<input type="hidden" id="mtWorkEmpKey"  name="mtWorkEmpKey" value="${basicWorkInfo.mtWorkEmpKey}" />
								<input type="hidden" id="regEmpKey"  name="regEmpKey" value="${basicWorkInfo.regEmpKey}" />
							</div>
						</div>
					</div>
				</div>
				<div class="floatC"></div>
			</div>
		</div>	
	</form>
	<form:form id="viewForm" name="viewForm" method="POST">
		<input type="hidden" name="fileKey" value=""/>
		<input type="hidden" name="fileOrgNm" value=""/>
	</form:form>
</body>
</html>