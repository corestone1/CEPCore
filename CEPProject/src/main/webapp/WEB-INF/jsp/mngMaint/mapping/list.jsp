<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>발주-계산서 매핑(유지보수)</title>
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
			width: 130px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.middle table {
			width: 1662px;
			font-size: 15px;
			margin-top: 16px;
			border-collapse: collapse;
			overflow: hidden;
			border-bottom: 2px solid #6a5bae;
		}
		.middle table thead {
			background-color: #e1dff5;
			float: left;
			width: 1662px;
			border-bottom: 3.5px solid #6a5bae;
		}
		.middle table thead tr {
			display: table;
			width: 1662px;
		}
		.middle table tbody {
			width: 1662px;
			height: 545px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.middle table tbody tr {
			display: table;
			width: 1662px;
			cursor: pointer;
		}
		.middle table tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 93%;
			margin: auto 5px;
		}
		.middle table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle table thead th, .middle table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
			color: #535353;
		}
		.middle table thead th:first-child,
		.middle table tbody td:first-child {
			width: 50px;
			max-width: 50px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 85px;
			max-width: 85px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 60px;
			max-width: 60px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4),
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7) {
			width: 180px;
			max-width: 180px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 330px;
			max-width: 330px;
		}
		.middle table tbody tr td:nth-child(5) {
			font-weight: 400;
		}
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6) {
			width: 200px;
			max-width: 200px;
		}
		
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(8) {
			width: 120px;
			max-width: 120px;
		}
		
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9),
		.middle table thead th:nth-child(10),
		.middle table tbody td:nth-child(10),
		.middle table thead th:nth-child(11),
		.middle table tbody td:nth-child(11) {
			width: 110px;
			max-width: 110px;
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
		.bottom > div {
			margin-top: 22px;
		}
		input[type="text"] {
		    height: 36px;
		    width: 150px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
			color: #000;
		}
		input[type="text"]::placeholder {
			color: #535353;
		}
		.contentsWrap .contents input[class^="calendar"] {
			max-width: 105px;
		    background-image: url('/images/calendar_icon.png');
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		.bottom table tr td {
			padding: 10px;
			color: #26a07d;
			background-color: #ccf4d7;
			text-align: right;
			width: 125px;
		}
		.bottom table {
		    width: 100%;
		}
		.count {
			font-size: 15px;
			font-weight: 200;
		}
		.count img {
			border: 1px solid #7F7F7F;
		}
	</style>
	<script>
		$(document).ready(function() {
			//$('.middle table tbody tr td').attr('onclick',"fn_addView('mappingBill')");
			$(".top").after($(".count.textalignR"));
		});
		
		function fn_addView(mtOrderKey, mtOrderAcKey){
			/* if(link == "forecastList") {
				location.href="<c:url value='/forecastList.do'/>";
			} else { */
				var url = '/mngMaint/mapping/mappingBill.do';
				var dialogId = 'program_layer';
				var varParam = {
					"mtOrderKey":mtOrderKey
					, "mtOrderAcKey" :mtOrderAcKey
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px'); 
			/* } */
		}
		
		function fn_search() {
			document.listForm.action = "<c:url value='/mngMaint/mapping/list.do'/>";
           	document.listForm.submit(); 
		}
	</script>
</head>
<body>
	<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
		<!-- <div class="sfcnt"></div>
		<div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">발주 - 계산서 매핑</label></div>
					</div>
					<div class="floatR">
						<form:input path="orderDtFrom" type="text" class="calendar fromDt" placeholder="발주일자" value="${searchParam.orderDtFrom}"/>
						<label> ~ </label>
						<form:input path="orderDtTo" type="text" class="calendar toDt" placeholder="발주일자" value="${searchParam.orderDtTo}"/>
						<form:input path="orderEmpNm" type="text" name="" placeholder="담당자" title="담당자" style="width: 90px;"/>
						<form:input path="mtOrderAcKey" type="text" class="search" placeholder="사업자번호" title="사업자번호"/>
						<form:select path="searchGubun">
							<form:option value="PJ" label="유지보수명" />
							<form:option value="CU" label="고객사" />
							<form:option value="BA" label="매입처" />
						</form:select>
						<form:input path="searchWord" type="text" class="search" placeholder="검색어"/>
						<span onclick="fn_search();"><img src="<c:url value='/images/icon_search.png'/>" /></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">No</th>
								<th scope="row">발주일자</th>
								<th scope="row">매핑상태</th>
								<th scope="row">고객사</th>
								<th scope="row">유지보수명</th>
								<th scope="row">제품</th>
								<th scope="row">매입처명</th>
								<th scope="row">사업자번호</th>
								<th scope="row">계산서맵핑합계</th>
								<th scope="row">지급 합계</th>
								<th scope="row">발주 합계</th>
								<th scope="row">담당자</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="count" value="0" />
							<c:set var = "totalAmount" value="0" />
							<c:forEach var="result" items="${orderList}" varStatus="status">
								<c:set var = "totalAmount" value="${totalAmount + result.mtOrderAmount}" />
								<tr onclick="fn_addView('${result.mtOrderKey}', '${result.mtOrderAcKey}')" <c:if test="${result.mtOrderAmount ne result.billMappedAmount }">style="background-color:#f8f1e8;"</c:if>>
									<td>${status.count }</td>
									<td>${displayUtil.displayDate(result.mtOrderDt) }</td>
									<td>
										<c:choose>
											<c:when test="${result.mtOrderAmount eq result.billMappedAmount }">
												<label>Y</label>
											</c:when>
											<c:otherwise>
												<label>N</label>
												<c:set var="count" value="${count + 1 }" />
											</c:otherwise>
										</c:choose>
									</td>
									<td class="textalignL"><span title="${result.mtAcNm }">${result.mtAcNm }</span></td>
									<td class="textalignL"><span title="${result.mtNm }">${result.mtNm }</span></td>
									<td class="textalignL"><span title="${result.mtPmNm }">${result.mtPmNm }</span></td>
									<td class="textalignL"><span title="${result.mtOrderAcKeyNm }">${result.mtOrderAcKeyNm }</span></td>
									<td><span>${displayUtil.makeActypeForm(result.mtOrderAcKey) }</span></td>
									<td class="textalignR"><span title="${displayUtil.commaStr(result.billMappedAmount) }">${displayUtil.commaStr(result.billMappedAmount) }</span></td>
									<td class="textalignR"><span title="${displayUtil.commaStr(result.donePaymentAmount) }">${displayUtil.commaStr(result.donePaymentAmount) }</span></td>
									<td class="textalignR"><span title="${displayUtil.commaStr(result.mtOrderAmount) }">${displayUtil.commaStr(result.mtOrderAmount) }</span></td>
									<td><span>${result.orderEmpNm }</span></td>
								</tr>
							</c:forEach>
								<!-- <tr>
									<td onclick="fn_addView('mappingBill')">1</td>
									<td onclick="fn_addView('mappingBill')">2021-10-28</td>
									<td onclick="fn_addView('mappingBill')"><label>Y</label></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="미래에셋생명">미래에셋생명</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="백업시스템구축">백업시스템구축</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="Unity 35, R740">Unity 35, R740</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="코오롱베니트 주식회사">코오롱베니트 주식회사</span></td>
									<td onclick="fn_addView('mappingBill')"><span>123-81-51422</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td onclick="fn_addView('mappingBill')"><span>최윤창</span></td>
								</tr>
								<tr>
									<td onclick="fn_addView('mappingBill')">1</td>
									<td onclick="fn_addView('mappingBill')">2021-10-28</td>
									<td onclick="fn_addView('mappingBill')"><label>Y</label></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="미래에셋생명">미래에셋생명</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="백업시스템구축">백업시스템구축</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="Unity 35, R740">Unity 35, R740</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="코오롱베니트 주식회사">코오롱베니트 주식회사</span></td>
									<td onclick="fn_addView('mappingBill')"><span>123-81-51422</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td onclick="fn_addView('mappingBill')"><span>최윤창</span></td>
								</tr>
								<tr>
									<td onclick="fn_addView('mappingBill')">1</td>
									<td onclick="fn_addView('mappingBill')">2021-10-28</td>
									<td onclick="fn_addView('mappingBill')"><label>Y</label></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="미래에셋생명">미래에셋생명</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="백업시스템구축">백업시스템구축</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="Unity 35, R740">Unity 35, R740</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="코오롱베니트 주식회사">코오롱베니트 주식회사</span></td>
									<td onclick="fn_addView('mappingBill')"><span>123-81-51422</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td onclick="fn_addView('mappingBill')"><span>최윤창</span></td>
								</tr>
								<tr>
									<td onclick="fn_addView('mappingBill')">1</td>
									<td onclick="fn_addView('mappingBill')">2021-10-28</td>
									<td onclick="fn_addView('mappingBill')"><label>Y</label></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="미래에셋생명">미래에셋생명</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="백업시스템구축">백업시스템구축</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="Unity 35, R740">Unity 35, R740</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="코오롱베니트 주식회사">코오롱베니트 주식회사</span></td>
									<td onclick="fn_addView('mappingBill')"><span>123-81-51422</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td onclick="fn_addView('mappingBill')"><span>최윤창</span></td>
								</tr>
								<tr>
									<td onclick="fn_addView('mappingBill')">1</td>
									<td onclick="fn_addView('mappingBill')">2021-10-28</td>
									<td onclick="fn_addView('mappingBill')"><label>Y</label></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="미래에셋생명">미래에셋생명</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="백업시스템구축">백업시스템구축</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="Unity 35, R740">Unity 35, R740</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="코오롱베니트 주식회사">코오롱베니트 주식회사</span></td>
									<td onclick="fn_addView('mappingBill')"><span>123-81-51422</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td onclick="fn_addView('mappingBill')"><span>최윤창</span></td>
								</tr>
								<tr>
									<td onclick="fn_addView('mappingBill')">1</td>
									<td onclick="fn_addView('mappingBill')">2021-10-28</td>
									<td onclick="fn_addView('mappingBill')"><label>Y</label></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="미래에셋생명">미래에셋생명</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="백업시스템구축">백업시스템구축</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="Unity 35, R740">Unity 35, R740</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="코오롱베니트 주식회사">코오롱베니트 주식회사</span></td>
									<td onclick="fn_addView('mappingBill')"><span>123-81-51422</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td onclick="fn_addView('mappingBill')"><span>최윤창</span></td>
								</tr>
								<tr>
									<td onclick="fn_addView('mappingBill')">1</td>
									<td onclick="fn_addView('mappingBill')">2021-10-28</td>
									<td onclick="fn_addView('mappingBill')"><label>Y</label></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="미래에셋생명">미래에셋생명</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="백업시스템구축">백업시스템구축</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="Unity 35, R740">Unity 35, R740</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="코오롱베니트 주식회사">코오롱베니트 주식회사</span></td>
									<td onclick="fn_addView('mappingBill')"><span>123-81-51422</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td onclick="fn_addView('mappingBill')"><span>최윤창</span></td>
								</tr>
								<tr>
									<td onclick="fn_addView('mappingBill')">1</td>
									<td onclick="fn_addView('mappingBill')">2021-10-28</td>
									<td onclick="fn_addView('mappingBill')"><label>Y</label></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="미래에셋생명">미래에셋생명</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="백업시스템구축">백업시스템구축</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="Unity 35, R740">Unity 35, R740</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="코오롱베니트 주식회사">코오롱베니트 주식회사</span></td>
									<td onclick="fn_addView('mappingBill')"><span>123-81-51422</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td onclick="fn_addView('mappingBill')"><span>최윤창</span></td>
								</tr>
								<tr>
									<td onclick="fn_addView('mappingBill')">1</td>
									<td onclick="fn_addView('mappingBill')">2021-10-28</td>
									<td onclick="fn_addView('mappingBill')"><label>Y</label></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="미래에셋생명">미래에셋생명</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="백업시스템구축">백업시스템구축</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="Unity 35, R740">Unity 35, R740</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="코오롱베니트 주식회사">코오롱베니트 주식회사</span></td>
									<td onclick="fn_addView('mappingBill')"><span>123-81-51422</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td onclick="fn_addView('mappingBill')"><span>최윤창</span></td>
								</tr>
								<tr>
									<td onclick="fn_addView('mappingBill')">1</td>
									<td onclick="fn_addView('mappingBill')">2021-10-28</td>
									<td onclick="fn_addView('mappingBill')"><label>Y</label></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="미래에셋생명">미래에셋생명</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="백업시스템구축">백업시스템구축</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="Unity 35, R740">Unity 35, R740</span></td>
									<td class="textalignL" onclick="fn_addView('mappingBill')"><span title="코오롱베니트 주식회사">코오롱베니트 주식회사</span></td>
									<td onclick="fn_addView('mappingBill')"><span>123-81-51422</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td class="textalignR" onclick="fn_addView('mappingBill')"><span title="1,020,000">1,020,000</span></td>
									<td onclick="fn_addView('mappingBill')"><span>최윤창</span></td>
								</tr> -->
								
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<table>
						<tbody class="ftw400">
							<tr>								
								<td style="width:906px;">발주합계 :</td>
								
								<td style="text-align: left;"><span><c:out value="${displayUtil.commaStr(totalAmount)}"/> 원</span></td>
							</tr>
						</tbody>
					</table>
					<div class="count textalignR"><img src="/images/icon_nonmapping.png" />&nbsp;&nbsp;<c:out value="매핑미완료 (${count }건)" /></div>
				</div>
				
			</div>
		</div>
	</form:form>
</body>
</html>