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
			width: 987px;
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
		/*
		form .contents .dtl {
			border-top: 4px solid #c3c3c3;;
			overflow: hidden;
		}
		form .contents .dtl tbody {
			overflow-y: auto;
			overflow-x: hidden;
			height: 547px;
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
			width: 770px;
		}
		*/
		
		
		.contents .dtl {
			width: 997px;
			font-size: 14px;
			border-collapse: collapse;
			font-weight: 300;
			overflow: hidden;
			border-top: 4px solid #6a5baf;
		}
		.contents .dtl thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
		}
		.contents .dtl thead tr {
			display: table;
			width: 997px;
		}
		.contents .dtl tbody {
			width: 997px;
			/* height: 532px; */
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			border-bottom: 2px solid #c4c4c4;
		}
		.contents .dtl tbody tr {
			display: table;
			width: 997px;
			cursor: pointer;
		}
		.contents .dtl tbody tr:hover {
			background-color: #ddf0ec
		}
		.contents .dtl tbody tr td:nth-child(3) {
			font-weight: 400;
		}
		.contents .dtl thead th, 
		.contents .dtl tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
		}
		.contents .dtl tbody tr td {
			font-weight: 200;
		}
		.contents .dtl thead th:first-child,
		.contents .dtl tbody td:first-child {
			width: 45px;
			padding: 0;
		}
		.contents .dtl thead th:nth-child(2),
		.contents .dtl tbody td:nth-child(2){
			width: 75px;
		}
		.contents .dtl thead th:nth-child(3),
		.contents .dtl tbody td:nth-child(3) {
			width: *;
		}
		.contents .dtl thead th:nth-child(4),
		.contents .dtl tbody td:nth-child(4) {
			width: 75px;
			max-width: 75px;
		}
		.contents .dtl thead th:nth-child(5),
		.contents .dtl tbody td:nth-child(5){
			width: 75px;
		}
		.contents .dtl thead th:nth-child(6),
		.contents .dtl tbody td:nth-child(6) {
			width: 182px;
		}
		.contents .dtl thead th:nth-child(7),
		.contents .dtl tbody td:nth-child(7) {
			width: 182px;
		}
		
		.contents .dtl tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 90%;
			margin: 0 auto;
		}
		
		.contents .dtl tbody tr td img {
			/* width: 13px; */
			vertical-align: middle;
			align: right;
			/* margin-bottom: 5px; */
		}
		
		
		
		
		.contents .dtl2 {
			width: 997px;
			font-size: 14px;
			border-collapse: collapse;
			font-weight: 300;
			overflow: hidden;
			border-top: 4px solid #6a5baf;
		}
		.contents .dtl2 thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
		}
		.contents .dtl2 thead tr {
			display: table;
			width: 997px;
		}
		.contents .dtl2 tbody {
			width: 997px;
			/* height: 532px; */
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			border-bottom: 2px solid #c4c4c4;
		}
		.contents .dtl2 tbody tr {
			display: table;
			width: 997px;
			cursor: pointer;
		}
		.contents .dtl2 tbody tr:hover {
			background-color: #ddf0ec
		}
		.contents .dtl2 tbody tr td:nth-child(3) {
			font-weight: 400;
		}
		.contents .dtl2 thead th, 
		.contents .dtl2 tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
		}
		.contents .dtl2 tbody tr td {
			font-weight: 200;
		}
		.contents .dtl2 thead th:first-child,
		.contents .dtl2 tbody td:first-child {
			width: 45px;
			padding: 0;
		}
		.contents .dtl2 thead th:nth-child(2),
		.contents .dtl2 tbody td:nth-child(2){
			width: 122px;
		}
		.contents .dtl2 thead th:nth-child(3),
		.contents .dtl2 tbody td:nth-child(3) {
			width: *;
		}
		.contents .dtl2 thead th:nth-child(4),
		.contents .dtl2 tbody td:nth-child(4) {
			width: 99px;
			max-width: 99px;
		}
		.contents .dtl2 thead th:nth-child(5),
		.contents .dtl2 tbody td:nth-child(5){
			width: 122px;
		}
		.contents .dtl2 thead th:nth-child(6),
		.contents .dtl2 tbody td:nth-child(6) {
			width: 122px;
		}
		.contents .dtl2 thead th:nth-child(7),
		.contents .dtl2 tbody td:nth-child(7) {
			width: 122px;
		}
				
		.contents .dtl2 tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 90%;
			margin: 0 auto;
		}
		
		.contents .dtl2 tbody tr td img {
			/* width: 13px; */
			vertical-align: middle;
			align: right;
			/* margin-bottom: 5px; */
		}
		
	</style>
	<script>
		$(document).ready(function() {
			
			if("${salesList[0].salesKey}" != null && "${salesList[0].salesKey}" != "")
				fnSearchGuarantyBondList("${salesList[0].salesKey}");
			
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
				showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px'); 
			/* } */
		}
		
		function fnCallContrect() {
			location.href = "/project/detail/contractMin.do?pjKey=${projectInfo.pjKey}";
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
			
			html = '<table id="tbl_guarantyBondList" class="dtl2 tbl2Width">'
			     + '<thead class="ftw400">'
			     +     '<tr>'
			     +        '<th scope="row">선택</th>'
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
		    for(var i = 0; i < litListCnt; i++)
			{
		    	
		    	//보증증권 발행 상태 및 버튼
		    	if(pltGBList[i].gbIssueYn == 'Y')
		    	{
		    		lstStatus  = '발행완료';
		    		lstBtnImg  = "/images/btn_stock_mod.png";
		    		lstOnclick = "javascript:fnShowStock('" + pltGBList[i].gbKey + "', '" + pltGBList[i].gbKindCd + "');";
		    	}
		    	else if(pltGBList[i].gbIssueYn == 'R')
		    	{
		    		lstStatus = '발행요청중';
		    		lstBtnImg  = "/images/btn_stock_end.png";
		    		lstOnclick = "javascript:fnShowStock('" + pltGBList[i].gbKey + "', '" + pltGBList[i].gbKindCd + "');";
		    	}	
		    	else
		    	{
		    		lstStatus = '발행전';
		    		lstBtnImg  = "/images/btn_stock_publish.png";
		    		lstOnclick = "javascript:fnShowStock('" + pltGBList[i].gbKey + "', '" + pltGBList[i].gbKindCd + "');";
		    	}
		    	
		    	lstBtn     = '<img onclick="' + lstOnclick + '" src="' + lstBtnImg + '" style="cursor:hand;"/>';
		    	
				html += '<tr>'
				     +     '<td class="textalignC" onclick="event.cancelBubble = true;">'
				     +         '<input type="radio" class="tCheck" name="m_gubun2" id="check2' + i + '"/>'
				     +         '<label for="check2' + i + '" class="cursorP"></label>'
				     +     '</td>'
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
			
			alert(pstUrl);
			var dialogId = 'program_layer';
			
			var varParam = {'gbKey' : pstGbKey};
			
			var button = new Array;
			button = [];
			showModalPop(dialogId, pstUrl, varParam, button, '', 'width:648px;height:575px'); 
		}
	</script>
</head>
<body>
	<form id="listForm" name="listForm" method="post">
		<div class="contentsWrap">
			<div class="contents">
				<div class="floatL dpBlock fxd">
					<div id="detailForm">
						<div class="stitle">
							<ul>
								<li style="width: 50%;"><a onclick="javascript:fnCallContrect();">계약정보</a></li> <!--  height: 35px; border-bottom: 4px solid #6a5bae" -->
								<li style="width: 50%;"><a class="on">수금계획</a></li>
								<li></li>
							</ul>
						</div>
						<div id="detailForm">
							<div class="floatC">
								<table class="dtl tblWidth" style="width: 100%;">
									<thead class="ftw400">
										<tr>
											<th scope="row">선택</th>
											<th scope="row">회차</th>
											<th scope="row">비율/금액</th>
											<th scope="row">부가세포함</th>
											<th scope="row">진행상태</th>
											<th scope="row">계상서예상일(발행일)</th>
											<th scope="row">수금예상일(수금일)</th>
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
												<td class="textalignC"><c:out value="${salesList.taxYn}" /></td>
												<td class="textalignC"><c:out value="${salesList.salesStatusCd}"/></td>
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
							</div>
						</div>
						
						<div class="stitle cg colorBlack">보증증권 정보</div>
							<div id="div_guarantyBondList" class="floatC" style="border-bottom: 2px solid #c4c4c4;">
								<table id="tbl_guarantyBondList" class="dtl2 tbl2Width">
									<thead class="ftw400">
										<tr>
											<th scope="row">선택</th>
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
												<td class="textalignC" onclick="event.cancelBubble = true;">
													<input type="radio" class="tCheck" name="m_gubun" id="check1" />
													<label for="check1" class="cursorP"/>
												</td>
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
				<div class="floatC"></div>
			</div>
		</div>	
	</form>
</body>
</html>