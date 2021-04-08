<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<%@include file="/WEB-INF/jsp/cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>영업회의</title>
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
		.contentsWrap .contents .top select {
			height: 40px;
			width: 130px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('./images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.contentsWrap .contents .top input[type="text"] {
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			background-repeat: no-repeat;
			background-position: 95% 50%;
			font-size: 15px;
			margin-bottom: 3px;
		}
		
		
		
		
		
		.middle1 table {
			width: 1662px;
			font-size: 14px;
			margin-top: 16px;
			border-collapse: collapse;
			overflow: hidden;
			border-bottom: 2px solid #6a5bae;
		}
		.middle1 table thead {
			background-color: #e1dff5;
			float: left;
			width: 1662px;
			border-bottom: 3.5px solid #6a5bae;
		}
		.middle1 table thead tr {
			display: table;
			width: 1662px;
		}
		.middle1 table tbody {
			width: 1662px;
			/* height: 545px; */
			height: 270px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.middle1 table tbody tr {
			display: table;
			width: 1662px;
			cursor: pointer;
		}
		.middle1 table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle1 table tbody tr td:nth-child(3) {
			font-weight: 400;
		}
		.middle1 table thead th, 
		.middle1 table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
		}
		.middle1 table thead th:first-child,
		.middle1 table tbody td:first-child {
			width: 50px;
		}
		.middle1 table thead th:nth-child(2),
		.middle1 table tbody td:nth-child(2) {
			width: 150px;
		}
		.middle1 table thead th:nth-child(3),
		.middle1 table tbody td:nth-child(3) {
			width: 250px;
		}
		.middle1 table thead th:nth-child(4),
		.middle1 table tbody td:nth-child(4) {
			width: 152px;
		}
		.middle1 table thead th:nth-child(5),
		.middle1 table tbody td:nth-child(5) {
			width: 80px;
		}
		.middle1 table thead th:nth-child(6),
		.middle1 table tbody td:nth-child(6) {
			width: 110px;
		}
		.middle1 table thead th:nth-child(7),
		.middle1 table tbody td:nth-child(7) {
			width: 130px;
		}
		.middle1 table thead th:nth-child(8),
		.middle1 table tbody td:nth-child(8) {
			width: 130px;
		}
		.middle1 table thead th:nth-child(9),
		.middle1 table tbody td:nth-child(9) {
			width: 130px;
		}
		.middle1 table thead th:nth-child(10),
		.middle1 table tbody td:nth-child(10) {
			width: 100px;
		}
		.middle1 table thead th:nth-child(11),
		.middle1 table tbody td:nth-child(11) {
			width: 100px;
		}
		.middle1 table thead th:nth-child(12),
		.middle1 table tbody td:nth-child(12) {
			width: 100px;
		}
		.middle1 table thead th:nth-child(13),
		.middle1 table tbody td:nth-child(13) {
			width: 100px;
		}
		.middle1 table tbody tr td > img {
			width: 25px;
			vertical-align: middle;
		}
		
		.totalAmount {
			text-align: right !important;
			font-size: 13px !important;
		}
		.totalAmount table tbody td:first-child {
			width: 492px !important;
		}
		.totalAmount table tbody td:nth-child(2) {
			width: 305px !important;
		}
		.totalAmount table tbody td:nth-child(3) {
			width: 305px !important;
		}
		.totalAmount table tbody td:nth-child(4) {
			width: 305px !important;
		}
		.totalAmount1 table tbody td:nth-child(5) {
			width: 190px !important;
		}
		
		
		
		
		.middle2 table {
			width: 1662px;
			font-size: 14px;
			margin-top: 16px;
			border-collapse: collapse;
			overflow: hidden;
			border-bottom: 2px solid #6a5bae;
		}
		.middle2 table thead {
			background-color: #e1dff5;
			float: left;
			width: 1662px;
			border-bottom: 3.5px solid #6a5bae;
		}
		.middle2 table thead tr {
			display: table;
			width: 1662px;
		}
		.middle2 table tbody {
			width: 1662px;
			/* height: 545px; */
			height: 170px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.middle2 table tbody tr {
			display: table;
			width: 1662px;
			cursor: pointer;
		}
		.middle2 table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle2 table tbody tr td:nth-child(3) {
			font-weight: 400;
		}
		.middle2 table thead th, 
		.middle2 table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
		}
		.middle2 table thead th:first-child,
		.middle2 table tbody td:first-child {
			width: 50px;
		}
		.middle2 table thead th:nth-child(2),
		.middle2 table tbody td:nth-child(2) {
			width: 152px;
		}
		.middle2 table thead th:nth-child(3),
		.middle2 table tbody td:nth-child(3) {
			width: 250px;
		}
		.middle2 table thead th:nth-child(4),
		.middle2 table tbody td:nth-child(4) {
			width: 155px;
		}
		.middle2 table thead th:nth-child(5),
		.middle2 table tbody td:nth-child(5) {
			width: 80px;
		}
		.middle2 table thead th:nth-child(6),
		.middle2 table tbody td:nth-child(6) {
			width: 110px;
		}
		.middle2 table thead th:nth-child(7),
		.middle2 table tbody td:nth-child(7) {
			width: 140px;
		}
		.middle2 table thead th:nth-child(8),
		.middle2 table tbody td:nth-child(8) {
			width: 140px;
		}
		.middle2 table thead th:nth-child(9),
		.middle2 table tbody td:nth-child(9) {
			width: 140px;
		}
		.middle2 table thead th:nth-child(10),
		.middle2 table tbody td:nth-child(10) {
			width: 95px;
		}
		.middle2 table thead th:nth-child(11),
		.middle2 table tbody td:nth-child(11) {
			width: 95px;
		}
		.middle2 table thead th:nth-child(12),
		.middle2 table tbody td:nth-child(12) {
			width: 95px;
		}
		.middle2 table thead th:nth-child(13),
		.middle2 table tbody td:nth-child(13) {
			width: 95px;
		}
		.middle2 table tbody tr td > img {
			width: 25px;
			vertical-align: middle;
		}
		
		
		
		
		
		
		.middle3 table {
			width: 1662px;
			font-size: 14px;
			margin-top: 16px;
			border-collapse: collapse;
			overflow: hidden;
			border-bottom: 2px solid #6a5bae;
		}
		.middle3 table thead {
			background-color: #e1dff5;
			float: left;
			width: 1662px;
			border-bottom: 3.5px solid #6a5bae;
		}
		.middle3 table thead tr {
			display: table;
			width: 1662px;
		}
		.middle3 table tbody {
			width: 1662px;
			/* height: 545px; */
			height: 230px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.middle3 table tbody tr {
			display: table;
			width: 1662px;
			cursor: pointer;
		}
		.middle3 table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle3 table tbody tr td:nth-child(3) {
			font-weight: 400;
		}
		.middle3 table thead th, 
		.middle3 table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
		}
		.middle3 table thead th:first-child,
		.middle3 table tbody td:first-child {
			width: 50px;
		}
		.middle3 table thead th:nth-child(2),
		.middle3 table tbody td:nth-child(2) {
			width: 150px;
		}
		.middle3 table thead th:nth-child(3),
		.middle3 table tbody td:nth-child(3) {
			width: 250px;
		}
		.middle3 table thead th:nth-child(4),
		.middle3 table tbody td:nth-child(4) {
			width: 180px;
		}
		.middle3 table thead th:nth-child(5),
		.middle3 table tbody td:nth-child(5) {
			width: 100px;
		}
		.middle3 table thead th:nth-child(6),
		.middle3 table tbody td:nth-child(6) {
			width: 100px;
		}
		.middle3 table thead th:nth-child(7),
		.middle3 table tbody td:nth-child(7) {
			width: 100px;
		}
		.middle3 table thead th:nth-child(8),
		.middle3 table tbody td:nth-child(8) {
			width: 100px;
		}
		.middle3 table thead th:nth-child(9),
		.middle3 table tbody td:nth-child(9) {
			width: 100px;
		}
		.middle3 table thead th:nth-child(10),
		.middle3 table tbody td:nth-child(10) {
			width: 100px;
		}
		.middle3 table thead th:nth-child(11),
		.middle3 table tbody td:nth-child(11) {
			width: 100px;
		}
		.middle3 table thead th:nth-child(12),
		.middle3 table tbody td:nth-child(12) {
			width: 100px;
		}
		.middle3 table thead th:nth-child(13),
		.middle3 table tbody td:nth-child(13) {
			width: 167px;
		}
		.middle3 table tbody tr td > img {
			width: 25px;
			vertical-align: middle;
		}
		
		
		
		
		
		.detailList li {
			/* float: left; */
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
		}
		.detailList li:nth-child(2n-1) {
			width: 82px;
			font-weight: 400;
			color: #158566;
			margin-left: 100px;
		}
		.detailList li:nth-child(2n) {
			width: 305px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
			margin-left: 150px;
		}
		.detailList li:last-child {
			width: 1409px;
   			height: 56px;
   			word-break: break-all;
   			white-space: normal;
   			overflow: auto;
   			line-height: 1.5;
		}
		.bottom > div {
			margin-top: 22px;
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
		
		
		.topMargin {
			margin-top: 40px;
		}
		
	</style>
	<script>
		$(document).ready(function() {
			/* 
			var html = '';
			$('.middle table tbody tr').click(function() {
				if($(this).attr('class') != "viewOpen") {
					html = '<div style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>매출처</li>'
					       + '<li title="키스채권평가">키스채권평가</li>'
					       + '<li>매입처</li>'
					       + '<li title="코오롱베니트">코오롱베니트</li>'
					       + '<li>수주확률</li>'
					       + '<li title="80%">80%</li>'
					       + '<li>제품상세</li>'
					       + '<li title="Avamar, Data Domain 외, 디스크, DP4400">Avamar, Data Domain 외, 디스크, DP4400</li>' 
					       + '<li>진행사항</li>'
					       + '<li>RFP 작업중</li>'
					       + '</ul>'
					       + '</div>'
					       + '</div>';
					$(this).after(html);
					$(this).attr('class', 'viewOpen');
				} else {
					$(this).removeClass('viewOpen');
					$(this).next().remove();
				}
			});
			 */
			
			$('.middle1 table tbody tr').click(function() {
				
				if($(this).next().hasClass("dpNone")) {
					$(this).next().removeClass("dpNone");
				}
				else {
					$(this).next().addClass("dpNone");
				}
				
				
			});
			 
			/*  
			$('.middle2 table tbody tr').click(function() {
				
				if($(this).next().hasClass("dpNone")) {
					$(this).next().removeClass("dpNone");
				}
				else {
					$(this).next().addClass("dpNone");
				}
				
				
			});
			 */
		});

				
	</script>
</head>
<body>
	<form id="listForm" name="listForm" method="post">
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap" style="overflow-y: scroll; overflow-x: hidden;">
			<div class="contents mgauto">
			
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">Forecast list</label></div>
					</div>
					<div class="floatR">
						<select>
							<option value="">담당영업</option>
						</select>
						<select>
							<option value="">구분</option>
						</select>
						<select>
							<option value="">진행상태</option>
						</select>
						<input type="text" path="searchFromDt" class="calendar" placeholder="from"/><label> ~ </label><input type="text" path="searchToDt" class="calendar" placeholder="to"/>
						<span id="span_search" class="veralignT" onclick="javascript:fn_searchList()"><img src="/images/icon_search.png" /></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle1">
					<table class="textalignC ftw200" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">No</th>
								<th scope="row">고객사</th>
								<th scope="row">사업명</th>
								<th scope="row">제품</th>
								<th scope="row">상태</th>
								<th scope="row">수주확정</th>
								<th scope="row">매출액</th>
								<th scope="row">매입액</th>
								<th scope="row">매출총이익</th>
								<th scope="row">매출일정</th>
								<th scope="row">수금일정</th>
								<th scope="row">매입일정</th>
								<th scope="row">매입결제일</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="result" items="${forecastList}" varStatus="status">
							<tr class="mchkbox">
								<td><c:out value="${status.count}" /></td>
								<td><c:out value="${result.mfAcNm}"/></td>
								<td><c:out value="${result.spBusiNm}"/> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
								<td><c:out value="${result.pmNm}"/></td>
								<td><c:out value="${result.spState}"/></td>
								<td><c:out value="${result.fcSjConfQt}"/> Q</td>
								<td><c:out value="${displayUtil.commaStr(result.fcSalesAmount)}"/></td>
								<td><c:out value="${displayUtil.commaStr(result.fcBuyAmount)}"/></td>
								<td><c:out value="${displayUtil.commaStr(result.fcSalesProfit)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.fcSalesDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.fcCollectDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.fcBuyPayDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.fcBuyPayDt)}"/></td>
							</tr>
							<tr class="dpNone" style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">
								<td colspan="12" style="margin: 5px 71px;">
									<ul class="detailList">
										<li>제품상세</li>
										<li title='<c:out value="${result.remark}"/>'><c:out value="${result.remark}"/></li>
										<li>진행사항</li>
										<li>RFP 작업중</li>
									</ul>
								</td>
							</tr>
							<input type='hidden' name='spKey' value='<c:out value="${result.spKey}"/>' />
						</c:forEach>
						</tbody>
					</table>
					<div class="bottom totalAmount">
						<table>
							<tbody class="ftw400">
								<tr>
									<td colspan="6">총합계(부가세별도)</td>
									<td><label class="paySum">매출 : <c:out value='${displayUtil.commaStr(forecastAmount.fcSalesAmount) }'/> 원</label></td>
									<td><label class="paySum">매입 : <c:out value='${displayUtil.commaStr(forecastAmount.fcPurchaseAmount) }'/> 원</label></td>
									<td><label class="paySum">이익 : <c:out value='${displayUtil.commaStr(forecastAmount.fcProfitAmount) }'/> 원</label></td>
									<td colspan="4"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<div class="top topMargin">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">입찰 목록</label></div>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle2">
					<table class="textalignC ftw200" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">No</th>
								<th scope="row">고객사</th>
								<th scope="row">사업명</th>
								<th scope="row">제품</th>
								<th scope="row">제안발표</th>
								<th scope="row">입찰기한</th>
								<th scope="row">매출액</th>
								<th scope="row">매입액</th>
								<th scope="row">매출총이익</th>
								<th scope="row">매출일정</th>
								<th scope="row">수금일정</th>
								<th scope="row">매입일정</th>
								<th scope="row">매입결재일정</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach var="result" items="${biddingList}" varStatus="status">
							<tr class="mchkbox">
								<td><c:out value="${status.count}" /></td>
								<td><c:out value="${result.acNm}"/></td>
								<td><c:out value="${result.pjNm}"/> <!-- <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /> --></td>
								<td><c:out value="${result.pmNm}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.bdProposalPresentDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.bdLimitDt)}"/></td>
								<td><c:out value="${displayUtil.commaStr(result.salesAmount)}"/></td>
								<td><c:out value="${displayUtil.commaStr(result.buyAmount)}"/></td>
								<td><c:out value="${displayUtil.commaStr(result.salesProfit)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.salesDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.collectDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.buyPayDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.fcBuyPayDt)}"/></td>
							</tr>
							<!-- 
							<tr class="dpNone" style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">
								<td colspan="12" style="margin: 5px 71px;">
									<ul class="detailList">
										<li>제품상세</li>
										<li title='<c:out value="${result.remark}"/>'><c:out value="${result.remark}"/></li>
										<li>진행사항</li>
										<li>RFP 작업중</li>
									</ul>
								</td>
							</tr>
							 -->
							<input type='hidden' name='spKey' value='<c:out value="${result.spKey}"/>' />
						</c:forEach>
						</tbody>
					</table>
					<div class="bottom totalAmount">
						<table>
							<tbody class="ftw400">
								<tr>
									<td colspan="6">총합계(부가세별도)</td>
									<td><label class="paySum">매출 : <c:out value='${displayUtil.commaStr(biddingAmount.bdSalesAmount) }'/> 원</label></td>
									<td><label class="paySum">매입 : <c:out value='${displayUtil.commaStr(biddingAmount.bdPurchaseAmount) }'/> 원</label></td>
									<td><label class="paySum">이익 : <c:out value='${displayUtil.commaStr(biddingAmount.bdProfitAmount) }'/> 원</label></td>
									<td colspan="4"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<div class="top topMargin">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">프로젝트</label></div>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle3">
					<table class="textalignC ftw200" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">No</th>
								<th scope="row">고객사</th>
								<th scope="row">사업명</th>
								<th scope="row">기간</th>
								<th scope="row">진행상태</th>
								<th scope="row">매출액</th>
								<th scope="row">매입액</th>
								<th scope="row">매출총이익</th>
								<th scope="row">수금액</th>
								<th scope="row">미수금액</th>
								<th scope="row">매입지급액</th>
								<th scope="row">매입미지급액</th>
								<th scope="row">제품</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="result" items="${projectList}" varStatus="status">
							<tr class="mchkbox">
								<td><c:out value="${status.count}" /></td>
								<td><c:out value="${result.acNm}"/></td>
								<td><c:out value="${result.pjNm}"/> <!-- <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /> --></td>
								<td><c:out value="${result.pmNm}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.bdProposalPresentDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.bdLimitDt)}"/></td>
								<td><c:out value="${displayUtil.commaStr(result.salesAmount)}"/></td>
								<td><c:out value="${displayUtil.commaStr(result.buyAmount)}"/></td>
								<td><c:out value="${displayUtil.commaStr(result.salesProfit)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.salesDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.collectDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.buyPayDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.fcBuyPayDt)}"/></td>
							</tr>
							<tr class="dpNone" style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">
								<td colspan="12" style="margin: 5px 71px;">
									<ul class="detailList">
										<li>매출처</li>
										<li title='<c:out value="${result.salesAcNm}"/>'><c:out value="${result.salesAcNm}"/></li>
										<li>매입처</li>
										<li title='<c:out value="${result.buyAcNm}"/>'><c:out value="${result.buyAcNm}"/></li>
										<li>수주확률</li>
										<li title='<c:out value="${result.spState}"/>'><c:out value="${result.spState}"/></li>
										<li>제품상세</li>
										<li title='<c:out value="${result.remark}"/>'><c:out value="${result.remark}"/></li>
										<li>진행사항</li>
										<li>RFP 작업중</li>
									</ul>
								</td>
							</tr>
							<input type='hidden' name='spKey' value='<c:out value="${result.spKey}"/>' />
						</c:forEach>
						</tbody>
					</table>
					<div class="bottom totalAmount">
						<table>
							<tbody class="ftw400">
								<tr>
									<td colspan="6">총합계(부가세별도)</td>
									<td><label class="paySum">매출 : <c:out value='${displayUtil.commaStr(projectAmount.bdSalesAmount) }'/> 원</label></td>
									<td><label class="paySum">매입 : <c:out value='${displayUtil.commaStr(projectAmount.bdPurchaseAmount) }'/> 원</label></td>
									<td><label class="paySum">이익 : <c:out value='${displayUtil.commaStr(projectAmount.bdProfitAmount) }'/> 원</label></td>
									<td colspan="4"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="bottom">
					<div class="floatR">
						<button type="button" value="엑셀 다운로드"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>