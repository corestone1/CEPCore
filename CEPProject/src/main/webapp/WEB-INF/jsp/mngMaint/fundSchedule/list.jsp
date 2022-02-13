<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수 수금/지급현황</title>
	<style>
		.sfcnt {
			height: 91px;
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
		form .title > label {
			font-size: 26px;
		}
		.contentsWrap .contents .top div:nth-child(2) > * {
			vertical-align: top;
		}
		.contentsWrap .contents .top div:nth-child(2) > label {
			line-height: 34px;
			margin: 5px;
			font-weight: 300;
		}
		.contentsWrap .contents .top select {
			height: 38px;
			width: 112px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.middle table {
			width: 816px;
			font-size: 15px;
			margin-top: 16px;
			border-collapse: collapse;
			overflow: hidden;
			border-bottom: 2px solid #c4c4c4;
		}
		.middle table thead {
			background-color: #e1dff5;
			float: left;
			width: 816px;
			border-bottom: 3.5px solid #6a5bae;
		}
		.middle table thead tr {
			display: table;
			width: 816px;
		}
		.middle table tbody {
			width: 816px;
			height: 545px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.middle table tbody tr {
			display: table;
			width: 816px;
			cursor: pointer;
		}
		.middle table tbody tr td > span,
		.bottom table tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 97%;
			margin: 0 auto;
		}
		.middle table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle table thead th, .middle table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
			color: #535353;
			font-size: 14px;
		}
		.middle table thead th:first-child,
		.middle table tbody td:first-child,
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 95px;
			max-width: 95px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 190px;
			max-width: 190px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 100px;
			max-width: 100px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 65px;
			max-width: 65px;
		}
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6),
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7) {
			width: 80px;
			max-width: 80px;
		}
		
		
		.middle table tbody tr td > img {
			width: 25px;
			vertical-align: middle;
		}
		.detailList li {
			float: left;
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
		}
		.detailList li:nth-child(2n-1) {
			width: 82px;
			font-weight: 400;
			color: #158566;
		}
		.detailList li:nth-child(2n) {
			width: 1396px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
		.bottom table {
			width: 100%;
			margin: 0;
			border: none;
		}
		.bottom table tr td {
			padding: 10px !important;
			color: #26a07d !important;
			background-color: #ecf6f4;
			text-align: center;
			border: none !important;
			font-size: 16px !important;
		}
		.bottom table tbody {
			height: auto;
		}
		.bottom table tbody tr td label {
			margin-left: 70px;
		}
		input[type="text"] {
		    height: 36px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
			color: #000;
		}
		input[type="text"]::placeholder {
			color: #535353;
		}
		input[class="calendar"] {
			width: 150px;
		    background-image: url('/images/calendar_icon.png');
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		input[class="search"] {
			width: 150px;
		}
		
		.contentsWrap .contents input[class^="calendar"] {
			width: 95px;
			height: 36px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
	</style>
	<script>
		$(document).ready(function() {
			//검색어 검색
			$("input[name^='searchWord']").on("keydown", function(event){
				if(event.keyCode == 13) {		
					fn_searchList();
				}						
			});
			
			//영업담당 검색
			$("input[name^='searchSaleEmpNm']").on("keydown", function(event){
				if(event.keyCode == 13) {		
					fn_searchList();
				}						
			});
		});
		
		function fn_searchList()
		{                
			document.listForm.action = "/mngMaint/fundSchedule/list.do";
	       	document.listForm.submit(); 
		}
		
		function fn_viewSalesDetail(pstPjKey){
			
			var url = '/mngMaint/fundSchedule/viewProductDetail.do';
			var dialogId = 'program_layer';
			var varParam = { 'fundGb' : 'S', 'pjKey' : pstPjKey };
			var button = new Array;
			button = [];
			
			showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px'); 
			
		}
		
		function fn_viewPaymentDetail(pstPjKey, pstBuyKey){
			
			var url = '/mngMaint/fundSchedule/viewProductDetail.do';
			var dialogId = 'program_layer';
			var varParam = { 'fundGb' : 'P', 'pjKey' : pstPjKey, 'buyKey' : pstBuyKey };
			var button = new Array;
			button = [];
			
			showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px'); 
			
		}
	</script>
</head>
<body>
	<form:form modelAttribute="searchVO" id="listForm" name="listForm" method="post">
		<!-- <div class="sfcnt"></div>
		<div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">수금/지급 현황</label></div>
						<%-- <div class="addBtn floatL cursorP" onclick="javascript:fn_addView('writeBasic')"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>
					</div>
					<div class="floatR">
						<form:select path="dateSearchType" style="width: 90px;">
							<form:option value="" label="전체" />
							<form:option value="NE" label="미완료" />
							<form:option value="E" label="완료" />
						</form:select>
						<form:input path="fromDate" type="text" class="calendar fromDt" value="${searchParam.fromDate}"/> ~ <form:input path="toDate" type="text" class="calendar toDt" value="${searchParam.toDate}"/>						
						<form:input path="searchSaleEmpNm" type="text" placeholder="영업담당" style="width: 70px"/>
						<form:select path="searchGubun">
							<form:option value="PJ" label="프로젝트명" />
							<form:option value="CU" label="고객사" />
							<form:option value="BA" label="거래처" />
						</form:select>						
						<form:input path="searchWord" type="text" placeholder="검색어"/>
						<span onclick="javascript:fn_searchList();"><img src="<c:url value='/images/icon_search.png'/>" /></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<div class="floatL">
						<table class="textalignC ftw200" id="fl">
							<thead class="ftw400">
								<tr>
									<th scope="row">고객사</th>
									<th scope="row">유지보수명</th>
									<th scope="row">매출처명</th>
									<th scope="row">수금액</th>
									<th scope="row">담당자</th>
									<th scope="row">수금예정일</th>
									<th scope="row">수금완료일</th>
									<th scope="row">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:set var = "callTotalAmount" value="0" />
								<c:forEach var="result" items="${mtCollectRequestList}" varStatus="status">
									<c:set var = "callTotalAmount" value="${callTotalAmount + result.billAmount}" />
									<tr>
										<td class="textalignL"><span title="${result.mtAcNm}">&nbsp;<c:out value="${result.mtAcNm}" /></span></td>
										<td class="textalignL"><span title="${result.mtNm}" >&nbsp;<c:out value="${result.mtNm}" /></span></td>
										<td class="textalignL"><span title="${result.billAcNm}">&nbsp;<c:out value="${result.billAcNm}" /></span></td>
										<td class="textalignR"><span title="${displayUtil.commaStr(result.billAmount)}"><c:out value="${displayUtil.commaStr(result.billAmount)}" />&nbsp;</span></td>
										<td><c:out value="${result.saleEmpNm}" /></td>
										<td><c:out value="${displayUtil.displayDate(result.salesCollectFcDt)}" /></td>
										<td><c:out value="${displayUtil.displayDate(result.billFinishDt)}" /></td>
										<td>
									<c:choose>
										<c:when test="${result.billStatusCd eq 'R'}">
											<span title="발행요청">발행요청</span>
										</c:when>
										<c:when test="${result.billStatusCd eq 'I'}">
											<span title="계산서발급">계산서발급</span>
										</c:when>
										<c:when test="${result.billStatusCd eq 'M'}">
											<span title="계산서맵핑">계산서맵핑</span>
										</c:when>
										<c:when test="${result.billStatusCd eq 'E'}">
											<span title="수금완료">수금완료</span>
										</c:when>
										<c:when test="${result.billStatusCd == null }">
											<span title="발행전">발행전</span>
										</c:when>
										<c:otherwise>
											<span>${result.billStatusCd}</span>
										</c:otherwise>
									</c:choose>
										
										</td>
									</tr>
								</c:forEach>
								<!-- 
								<tr>
									<td>2018-12-12</td>
									<td><span title="통일부 2020 북한방송수신체계 증설" class="textalignL">통일부 2020 북한방송수신체계 증설</span></td>
									<td><span title="코오롱베니트(주)">코오롱베니트(주)</span></td>
									<td><span title="5,000,000" class="textalignR">5,000,000</span></td>
									<td><span title="통일부 2020 북한방송수신체계 증설" class="textalignL">통일부 2020 북한방송수신체계 증설</span></td>
									<td>홍길동</td>
									<td>2018-12-12</td>
								</tr>
								 -->
							</tbody>
						</table>
						<div class="bottom">
							<table>
								<tbody class="ftw400">
									<tr>
										<td colspan="5">수금합계<label class="colSum"><c:out value="${displayUtil.commaStr(callTotalAmount) }"/>원 (부가세별도)</label></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="floatR">
						<table class="textalignC ftw200" id="fl">
							<thead class="ftw400">
								<tr>
									<th scope="row">고객사</th>
									<th scope="row">유지보수명</th>
									<th scope="row">매입처명</th>
									<th scope="row">지급액</th>
									<th scope="row">담당자</th>
									<th scope="row">지급예정일</th>
									<th scope="row">지급완료일</th>
									<th scope="row">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:set var = "paymentTotalAmount" value="0" />
								<c:forEach var="result" items="${mtPaymentRequestList}" varStatus="status">
									<c:set var = "paymentTotalAmount" value="${paymentTotalAmount + result.billAmount}" />
									<tr>
										<td class="textalignL"><span title="${result.mtAcNm}">&nbsp;<c:out value="${result.mtAcNm}" /></span></td>
										<td class="textalignL"><span title="${result.mtNm}" >&nbsp;<c:out value="${result.mtNm}" /></span></td>
										<td class="textalignL"><span title="${result.billAcNm}">&nbsp;<c:out value="${result.billAcNm}" /></span></td>
										<td class="textalignR"><span title="${displayUtil.commaStr(result.billAmount)}"><c:out value="${displayUtil.commaStr(result.billAmount)}" />&nbsp;</span></td>
										<td><c:out value="${result.saleEmpNm}" /></td>
										<td><c:out value="${displayUtil.displayDate(result.billRequestDt)}" /></td>
										<td><c:out value="${displayUtil.displayDate(result.billFinishDt)}" /></td>
										<td>
									<c:choose>
										<c:when test="${result.billStatusCd eq 'W'}">
											<span title="요청대기">요청대기</span>
										</c:when>
										<c:when test="${result.billStatusCd eq 'M'}">
											<span title="계산서매핑">계산서매핑</span>
										</c:when>
										<c:when test="${result.billStatusCd eq 'R'}">
											<span title="지급요청">지급요청</span>
										</c:when>
										<c:when test="${result.billStatusCd eq 'C'}">
											<span title="지급승인">지급승인</span>
										</c:when>
										<c:when test="${result.billStatusCd eq 'E'}">
											<span title="지급완료">지급완료</span>
										</c:when>
										<c:when test="${result.billStatusCd == null }">
											<span title="지급요청전">지급요청전</span>
										</c:when>
										<c:otherwise>
											<span>${result.billStatusCd}</span>
										</c:otherwise>
									</c:choose>
										
										</td>
									</tr>
								</c:forEach>
								<!-- 
								<tr>
									<td>2018-12-12</td>
									<td><span title="통일부 2020 북한방송수신체계 증설" class="textalignL">통일부 2020 북한방송수신체계 증설</span></td>
									<td><span title="코오롱베니트(주)">코오롱베니트(주)</span></td>
									<td><span title="5,000,000" class="textalignR">5,000,000</span></td>
									<td><span title="통일부 2020 북한방송수신체계 증설" class="textalignL">통일부 2020 북한방송수신체계 증설</span></td>
									<td>홍길동</td>
									<td>2018-12-12</td>
								</tr>
								 -->
							</tbody>
						</table>
						<div class="bottom">
							<table>
								<tbody class="ftw400">
									<tr>
										<td colspan="5">지급합계<label class="paySum"><c:out value="${displayUtil.commaStr(paymentTotalAmount) }"/>원 (부가세별도)</label></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>