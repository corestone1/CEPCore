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
	
	
	<style>
		.sfcnt {
			height: 91px;
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
			/* box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1); */
			height: 830px;
		}
		form .contentsWrap .contents {
			/* padding: 38px 71px;  */
			/* width: 1662px; */
			width: 997px;
		}
		form .title {
			height: 50px;
		}
		form .title > label {
			font-size: 26px;
		}
		form .contents > div:first-child {
			/* width: 45%; */
			width: 100%;
		}
		form .contents > .fxd {
			/* width: 55%; */
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
			width: 140px;
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
			width: 997px;
		}
		#detailForm .stitle ul li {
			width: 150px;
		}
		#detailForm .stitle ul li a {
			color: #a3a3a4;
			padding-bottom: 10px;
		    display: block;
		    width: 498.5px;
		    border-bottom: 4px solid #c3c3c3;
		}
		#detailForm .stitle ul li a.on {
		    color: #000;
		    border-bottom: 4px solid #6a5bae;
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
			overflow: hidden;
			margin-top: -10px;
			border-top: 4px solid #6a5bae;
		}
		form .contents .dtl tbody {
			overflow-y: auto;
			overflow-x: hidden;
			height: auto;
			float: left;
			background-color: #fff;
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
			width: 774px;
		}
		
		
		form .contents .dtl2 {
		    width: 997px;
		    font-size: 14px;
		    border-collapse: collapse;
		    font-weight: 300;
		    overflow: hidden;
		    margin-top: -10px;
	        border-top: 4px solid #6a5baf;
		}
		form .contents .dtl2 thead {
		    background-color: #e1dff5;
		    float: left;
		    width: 997px;
		}
		form .contents .dtl2 thead tr {
		    display: table;
		    width: 997px;
		}
		form .contents .dtl2 tbody {
		    width: 997px;
		    /* height: 532px; */
		    overflow-y: auto;
		    overflow-x: hidden;
		    float: left;
		    border-bottom: 2px solid #c4c4c4;
		}
		form .contents .dtl2 tbody tr {
		    display: table;
		    width: 997px;
		    cursor: pointer;
		}
		form .contents .dtl2 tbody tr:hover {
		    background-color: #ddf0ec !important;
		}
		form .contents .dtl2 tbody tr td {
		    font-weight: 200;
		}
		form .contents .dtl2 thead th:first-child, 
		form .contents .dtl2 tbody td:first-child {
		    width: 45px;
		    padding: 0;
		}
		form .contents .dtl2 thead th:nth-child(2), 
		form .contents .dtl2 tbody td:nth-child(2) {
		    width: 75px;
		}
		form .contents .dtl2 thead th:nth-child(3), 
		form .contents .dtl2 tbody td:nth-child(3) {
		    width: *;
		}
		form .contents .dtl2 thead th, 
		form .contents .dtl2 tbody tr td {
		    padding: 10px 7px;
		    border: 1px solid #edebef;
		    text-align: center;
		    border-top: none;
		}
		form .contents .dtl2 tbody tr td:nth-child(3) {
		    font-weight: 400;
		}
		form .contents .dtl2 thead th:nth-child(4), 
		form .contents .dtl2 tbody td:nth-child(4), 
		form .contents .dtl2 thead th:nth-child(5), 
		form .contents .dtl2 tbody td:nth-child(5) {
		    width: 182px;
		}
		
		
		
		form .contents .dtl3 {
			width: 997px;
			font-size: 14px;
			border-collapse: collapse;
			font-weight: 300;
			overflow: hidden;
			border-top: 4px solid #6a5baf;
		}
		form .contents .dtl3 thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
		}
		form .contents .dtl3 thead tr {
			display: table;
			width: 997px;
		}
		form .contents .dtl3 tbody {
			width: 997px;
			/* height: 532px; */
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			border-bottom: 2px solid #c4c4c4;
		}
		form .contents .dtl3 tbody tr {
			display: table;
			width: 997px;
			cursor: pointer;
		}
		form .contents .dtl3 tbody tr:hover {
			background-color: #ddf0ec
		}
		form .contents .dtl3 tbody tr td:nth-child(2) {
			font-weight: 400;
		}
		form .contents .dtl3 thead th, 
		form .contents .dtl3 tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
		}
		form .contents .dtl3 tbody tr td {
			font-weight: 200;
		}
		form .contents .dtl3 thead th:first-child,
		form .contents .dtl3 tbody td:first-child {
			width: 45px;
			padding: 0;
		}
		form .contents .dtl3 thead th:nth-child(2),
		form .contents .dtl3 tbody td:nth-child(2){
			width: 183px;
		}
		form .contents .dtl3 thead th:nth-child(3),
		form .contents .dtl3 tbody td:nth-child(3) {
			width: 150px;
		}
		form .contents .dtl3 thead th:nth-child(4),
		form .contents .dtl3 tbody td:nth-child(4) {
			width: 99px;
			max-width: 99px;
		}
		form .contents .dtl3 thead th:nth-child(5),
		form .contents .dtl3 tbody td:nth-child(5){
			width: 122px;
		}
		form .contents .dtl3 thead th:nth-child(6),
		form .contents .dtl3 tbody td:nth-child(6) {
			width: 122px;
		}
		form .contents .dtl3 tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 90%;
			margin: 0 auto;
		}
		form .contents .dtl3 tbody tr td img {
			/* width: 13px; */
			vertical-align: middle;
			align: right;
			/* margin-bottom: 5px; */
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
		
	</style>
	<script>
		$(document).ready(function() {
			var index = $('form .contents > .fxd .title ul li.on').index() + 2;
			var length = $('form .contents > .fxd .title ul li').length;
			$('form .contents > .fxd .title ul li:nth-child(' + index + ')').toggleClass("liArrow");
		
			for(var i = 0; i < length; i++) {
				if(i < index) {
					$('form .contents > .fxd .title ul li:nth-child(' + i + ')').css("background-color","#4c3d92");
					$('form .contents > .fxd .title ul li:nth-child(' + i + ')').addClass('liAfterNone');
				}
			}
			
			$('li[id^=LI_TOPBar]').click(function(event){ location.href = this.title; event.preventDefault();});
			
			$('form .contents > .fxd .title ul li').mouseover(function(){ 
				var index2 = $('form .contents > .fxd .title ul li').index(this);
				for(var i = (index - 1); i <= index2; i++) {
					if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on') {
						$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').css('background-color','#b9b9b9');
					} 
					if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on' && (i + 1) <= index2) {
						$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').addClass('liAfter');
					}
				}
			});
			
			$('form .contents > .fxd .title ul li').mouseout(function(){ 
				var index2 = $('form .contents > .fxd .title ul li').index(this);
				for(var i = (index - 1); i <= index2; i++) {
					if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on') {
						$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').css('background-color','#d3d3d3');
					}
					if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on' && (i + 1) <= index2) {
					 	$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').removeClass('liAfter'); 
					}
				}
			});
			
			if("${salesList[0].salesKey}" != null && "${salesList[0].salesKey}" != "")
				fnSearchGuarantyBondList("${salesList[0].salesKey}");
			
			//$(".contents .dtl tbody tr:first-child").css("background-color", "#ddf0ec");
			
			$(".contents .dtl2 tbody tr").click(function() {
				$(".contents .dtl2 tbody tr").each(function() {
					$(this).css("background-color", "#fff");
				});
				$(this).css("background-color", "#ddf0ec");
			})
			
			$(parent.document).find("#modMinInfo").removeClass("dpNone");
			$(parent.document).find("#delMinInfo").removeClass("dpNone");
			
		});
		
		function fnCallContrect()
		{
			location.href = "/project/detail/contractMin2.do?pjKey=${projectInfo.pjKey}";
		}
		
		function fnSearchGuarantyBondList(pstSalesKey) {
			//alert(pstSalesKey);
			
			var jsonData = {'salesKey' : pstSalesKey};
			
			$.ajax ({
				  url:"/project/detail/selectGuarantyBondList.do"
				, type:'POST'
				, data: jsonData
				, dataType:'json'
				, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
				, success:function(data){	
					fnMakeGuarantyBondList(data.guarantyBondList);
	            	//location.href = "/project/detail/main.do?pjKey=" + $('#iph_pjKey').val();
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
			});
		}
		
		function fnMakeGuarantyBondList(pltGBList) {
			
			$('#tbl_guarantyBondList').remove();
			
			
			var html = '';
			var litListCnt = pltGBList.length;
			
			html = '<table id="tbl_guarantyBondList" class="dtl3 tbl2Width">'
			     + '<thead class="ftw400">'
			     +     '<tr>'
			     +        '<th scope="row">No</th>'
			     +        '<th scope="row">보증 증권명</th>'
			     +        '<th scope="row">발행 상태</th>'
			     +        '<th scope="row">발행일</th>'
			     +        '<th scope="row">보험료</th>'
			     +        '<th scope="row"></th>'
			     +     '</tr>'
			     +  '</thead>'
			     +  '<tbody>'
			     ;
			
			var lstStatus;
			var lstBtn;
			var lstBtnImg;
			var lstOnclick;
			var lstStyle;
		    for(var i = 0; i < litListCnt; i++)
			{
		    	
		    	//보증증권 발행 상태 및 버튼
		    	if(pltGBList[i].gbIssueStatus == 'Y')
		    	{
		    		lstStatus  = '발행 완료';
		    		lstBtnImg  = "/images/btn_stock_detail.png";
		    		lstOnclick = "javascript:fnShowStock('" + pltGBList[i].gbKey + "', '" + pltGBList[i].gbKindCd + "');";
		    	}
		    	else if(pltGBList[i].gbIssueStatus == 'R')
		    	{
		    		lstStatus = '승인 중';
		    		lstBtnImg  = "/images/btn_blue_reqInfo.png";
		    		lstOnclick = "javascript:fnShowStock('" + pltGBList[i].gbKey + "', '" + pltGBList[i].gbKindCd + "');";
		    	}	
		    	else
		    	{
		    		lstStatus = '신청 전';
	    			lstBtnImg  = "/images/btn_stock_publish.png";
	    			
	    			if($("#empAuthCd").val() != "EMAU1001") {
		    			lstOnclick = "javascript:fnShowStock('" + pltGBList[i].gbKey + "', '" + pltGBList[i].gbKindCd + "');";
		    			lstStyle = "cursor:hand";
	    			} else {
	    				lstOnclick = "";
	    				lstStyle = "cursor:default; filter:grayscale(1);"
	    			}
		    	}
		    	
		    	lstBtn     = '<img onclick="' + lstOnclick + '" src="' + lstBtnImg + '" style="'+lstStyle+'"/>';
		    	
				html += '<tr>'
				     +     '<td class="textalignC">' + (i+1) + '</td>'
				     +     '<td class="textalignC">' + pltGBList[i].gbKindCd + ' 이행 보증증권</td>'
				     +     '<td class="textalignC">' + lstStatus + '</td>'
				     +     '<td class="textalignC">' + addDateMinus(pltGBList[i].gbPublishDt) + '</td>'
				     +     '<td class="textalignR">' + addCommas(pltGBList[i].gbAmount) + '</td>'
				     +     '<td class="textalignC">' + lstBtn + '</td>'
				     +  '</tr>'
				;
				
			}
			
			html += '</tbody>'
			     +  '</table>';    
			     
			$('#div_guarantyBondList').append(html);
		}
		
		function fnShowStock(pstGbKey, pstGbKindCd) {
			//alert('fnShowStockMod(' + pstGbKey + ')');
			
			var lstUrl;
			
			if(pstGbKindCd == '계약')
			{
				lstUrl = "/project/detail/viewStockPublishCT.do";
			}
			else if(pstGbKindCd == '하자')
			{
				lstUrl = "/project/detail/viewStockPublishHJ.do";
			}                             
			else
			{
				lstUrl = "/project/detail/viewStockPublishSK.do";
			}
			
			fnViewModal(lstUrl, pstGbKey);
		}
		
		function fnViewModal(pstUrl, pstGbKey){
			
			/* var dialogId = 'program_layer';
			
			var varParam = {'gbKey' : pstGbKey};
			
			var button = new Array;
			button = [];
			showModalPop(dialogId, pstUrl, varParam, button, '', 'width:648px;height:575px');  */
			
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
			
			window.open(pstUrl + "?gbKey="+ pstGbKey,'GUARANTY_INFO', strOption);
		}
		
		
		function fnViewDelete() {
			if(confirm("삭제하시겠습니까?")) {
				
				var jsonData = {'pjKey' : $('#ipt_pjKey').val(), 'ctKey' :  $('#ipt_CtKey').val()};
			
				$.ajax({
		        	url :"/project/detail/contractDelete.do",
		        	type:"POST",  
		            data: jsonData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		//alert(data.accountList[0].acNm);
		        		//선택 목록 생성
		        		alert("삭제 되었습니다.!");
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
		
		
		function fnViewModify() {
			
			var dialogId = 'program_layer';
			
			var varParam = {'pjKey' : $('#ipt_pjKey').val()};
			
			var button = new Array;
			button = [];
			
			parent.showModalPop(dialogId, "/project/write/contractInfo.do", varParam, button, '', 'width:1144px;height:708px');
			
		}
		
	</script>
</head>
<body>
	<form id="listForm" name="listForm" method="post">
		
		<input type="hidden" id="ipt_pjKey" name="pjKey" value="${projectVO.pjKey}" />
		<input type="hidden" id="ipt_CtKey" name="ctKey" value="${contractInfo.ctKey}" />
		<input type="hidden" id="empAuthCd" value="<%=session.getAttribute("empAuthCd") %>" />
		
		<div class="contentsWrap">
			<div class="contents">
				<div class="floatL dpBlock fxd">
					<div id="detailForm">
						<!-- <div class="stitle">
							<ul>
								<li style="width: 50%;"><a class="on">계약정보</a></li> 
								<li style="width: 50%;"><a onclick="javascript:fnCallContrect();">수금계획</a></li>
								<li></li>
							</ul>
						</div>   -->
						<div class="floatC" style="margin-top: 76px;">
							<!-- 계약정보 표기 시작 -->
							<table class="dtl" style="width: 100%;" id="selectTable">
								<tr style="width: 100%;">
									<td>계약금액</td>
									<td><c:out value="${displayUtil.commaStr(contractInfo.ctAmount)}" /> 원</td>
								</tr>
								<tr>
									<td>결재조건</td>
									<td><c:out value="${contractInfo.ctPayTerms}" /></td>
								</tr>
								<tr>
									<td>지급 회차</td>
									<td><c:out value="${contractInfo.collectTurn}" />회</td>
								</tr>
								<tr>
									<td>계약일</td>
									<td><c:out value="${displayUtil.displayDate(contractInfo.ctDt)}" /></td>
								</tr>
							</table>
							<!-- 계약정보 표기 끝 -->
							
							<!-- 계약정보 수정 시작 -->
							<table class="dtl dpNone" id="modTable">
								<tr style="width: 100%;">
									<td>계약금액</td>
									<td>
										<input type="text" name="ctAmount" value='<c:out value="${displayUtil.commaStr(contractInfo.ctAmount)}" />' />
									</td>
								</tr>
								<tr>
									<td>결재조건</td>
									<td>
										<input type="text" name="ctPayTerms" value='<c:out value="${contractInfo.ctPayTerms}" />' />
									</td>
								</tr>
								<tr>
									<td>지급 회차</td>
									<td>
										<input type="text" name="collectTurn" value='<c:out value="${contractInfo.collectTurn}" />' />회
									</td>
								</tr>
								<tr>
									<td>계약일</td>
									<td>
										<input type="text" name="ctDt" value='<c:out value="${displayUtil.displayDate(contractInfo.ctDt)}" />' class="calendar"/>
									</td>
								</tr>
							
							</table>
							<!-- 계약정보 수기 끝 -->
							
							
							
							<div class="stitle cg colorBlack">매출 정보</div>
							<table class="dtl2 tblWidth" style="width: 100%;">
								<thead class="ftw400">
									<tr>
										<th scope="row">선택</th>
										<th scope="row">회차</th>
										<th scope="row">비율/금액</th>
										<th scope="row">발행일(계산서예상일)</th>
										<th scope="row">수금일(수금예상일)</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="salesList" items="${salesList}" varStatus="status">
										<tr>
											<td class="textalignC" onclick="event.cancelBubble = true;">
												<input type="radio" class="tCheck" name="m_gubun" id="check1_${status.count}" />
												<label for="check1_${status.count}" class="cursorP"/>
											</td>
											<td class="textalignC"><c:out value="${salesList.salesTurn}"/> 회차</td>
											<td class="textalignC">
												<span title="" onclick="javascript:fnSearchGuarantyBondList('${salesList.salesKey}');" >
													<c:out value="${salesList.salesCollectRate}"/>% / <c:out value="${displayUtil.commaStr(salesList.salesTurnAmount)}"/> 원
												</span>
											</td>
											<td class="textalignC">
												<c:out value="${displayUtil.displayDate(salesList.salesBillFcDt)}"/>
												<c:if test="${not empty salesList.billIssueDt}">
													(<c:out value="${displayUtil.displayDate(salesList.billIssueDt)}"/>)
												</c:if>
											</td>
											<td class="textalignC">
												<c:out value="${displayUtil.displayDate(salesList.salesCollectFcDt)}"/>
												<c:if test="${not empty salesList.salesCollectFinishDt}">
													(<c:out value="${displayUtil.displayDate(salesList.salesCollectFinishDt)}"/>)
												</c:if>
											</td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
							
							
							
							<div class="stitle cg colorBlack">보증증권 정보</div>
							<div id="div_guarantyBondList" class="floatC">
								<table id="tbl_guarantyBondList" class="dtl3 tbl2Width">
									<thead class="ftw400">
										<tr>
											<th scope="row">No</th>
											<th scope="row">보증 증권명</th>
											<th scope="row">발행 상태</th>
											<th scope="row">발행일</th>
											<th scope="row">보험료</th>
											<th scope="row"></th>
										</tr>
									</thead>
									<tbody>
									
										<c:forEach var="guarantyBondList" items="${guarantyBondList}" varStatus="status">
											<tr>
												<td class="textalignC"><c:out value="${guarantyBondList.gbKindCd}"/> 이행 보증증권</td>
												<td class="textalignC">
													<c:choose>
														<c:when test='${guarantyBondList.gbIssueYn eq "N" }'>발행전</c:when>
														<c:when test='${guarantyBondList.gbIssueYn eq "R" }'>발행요청</c:when>
														<c:when test='${guarantyBondList.gbIssueYn eq "Y" }'>발행완료</c:when>
													</c:choose>
												</td>
													
												<td class="textalignC"><c:out value="${displayUtil.displayDate(guarantyBondList.gbPublishDt)}" /></td>
												<td class="textalignC"><c:out value="${displayUtil.commaStr(guarantyBondList.gbAmount)}"/></td>
												<td class="textalignC">
													<c:choose>
														<c:when test='${guarantyBondList.gbIssueYn eq "N" }'>발행요청버튼</c:when>
														<c:when test='${guarantyBondList.gbIssueYn eq "R" }'>발행완료버튼</c:when>
														<c:when test='${guarantyBondList.gbIssueYn eq "Y" }'>증권정보수정버튼</c:when>
													</c:choose>
												</td>
												
											</tr>
										</c:forEach>
										<c:if test="${guarantyBondList eq null }">
											<tr><td colspan="6" style="padding: 10px 7px;">정보가 없습니다.</td></tr>
										</c:if>
										<!-- 
										<tr>
											<td class="textalignC" onclick="event.cancelBubble = true;">
												<input type="radio" class="tCheck" name="m_gubun2" id="check21" />
												<label for="check21" class="cursorP"/>
											</td>
											<td class="textalignC">1</td>
											<td class="textalignL"><span title="PowerEdge R640">PowerEdge R740</span></td>
											<td class="textalignC">3</td>
											<td class="textalignR">600,000,000</td>
											<td class="textalignR">1,800,000,000</td>
										</tr>
										<tr>
											<td class="textalignC" onclick="event.cancelBubble = true;">
												<input type="radio" class="tCheck" name="m_gubun2" id="check22" />
												<label for="check22" class="cursorP"/>
											</td>
											<td class="textalignC">2</td>
											<td class="textalignL"><span title="PowerEdge R640">PowerEdge R740</span></td>
											<td class="textalignC">3</td>
											<td class="textalignR">600,000,000</td>
											<td class="textalignR">1,800,000,000</td>
										</tr>
										 -->
									</tbody>
								</table>
							</div>	
						</div>
					</div>
				</div>
				<div class="floatC"></div>
			</div>
		</div>	
	</form>
</body>
</html>