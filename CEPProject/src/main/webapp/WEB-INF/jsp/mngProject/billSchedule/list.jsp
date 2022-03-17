<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>계산서 일정</title>
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
		.middle table tbody tr td > span,
		.bottom table tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 100%;
			margin: 0 auto;
		}
		.middle table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle table thead th, .middle table tbody tr td {
			padding: 10px;
			border: 1px solid #edebef;
			color: #535353;
		}
		.middle table thead th:first-child,
		.middle table tbody td:first-child,
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5),
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6),
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7) {
			width: 112px;
			max-width: 112px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2){
			/* width: 200px;
			max-width: 200px; */
			width : 320px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 200px;
			max-width: 200px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 50px;
			max-width: 50px;
		}
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(8) {
			width: 68px;
			max-width: 68px;
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
		}
		.bottom table tr td {
			padding: 10px;
			color: #26a07d;
			background-color: #ccf4d7;
			text-align: right;
			width: 119px;
		}
		.bottom table tr td:nth-child(2) {
			width: 353px;
			max-width: 353px;
		}
		.bottom table tr td:nth-child(3) {
			width: 213px;
			max-width: 213px;
		}
		.bottom table tr td:nth-child(4) {
			width: 39px;
			max-width: 39px;
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
	</style>
	<script>
	
		function fn_searchList()
		{                
			document.listForm.action = "/mngProject/billSchedule/list.do";
	       	document.listForm.submit(); 
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
						<div class="title floatL"><label class="ftw500">계산서 일정</label></div>
						<%-- <div class="addBtn floatL cursorP" onclick="javascript:fn_addView('writeBasic')"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>
					</div>
					<div class="floatR">
						<form:select path="billType">
							<form:option value="SD">매출</form:option>
							<form:option value="PC">매입</form:option>
						</form:select>
						<form:select path="">
							<option value="">선택</option>
							<option value="1">1분기</option>
							<option value="2">2분기</option>
							<option value="3">3분기</option>
							<option value="4">4분기</option>
						</form:select>
						<form:input type="text" path="searchFromDt" class="calendar" placeholder="from" value="${searchParam.searchFromDt}"/>
						<label><img class="veralignM" src="/images/icon_fromTo.png" /></label>
						<form:input type="text" path="searchToDt" class="calendar" placeholder="to" value="${searchParam.searchToDt}"/>
						<form:input type="text" path="searchAcNm" class="search" placeholder="거래처명" onKeyPress="if(event.keyCode==13){fn_searchList();}"/>
						<form:input type="text" path="searchPjNm" class="search" style="width: 250px;" placeholder="프로젝트명" onKeyPress="if(event.keyCode==13){fn_searchList();}"/>
						<span onclick="javascript:fn_searchList();"><img src="<c:url value='/images/icon_search.png'/>" /></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">거래일자</th>
								<th scope="row">프로젝트</th>
								<th scope="row">거래처명</th>
								<th scope="row">구분</th>
								<th scope="row">금액</th>
								<th scope="row">부가세</th>
								<th scope="row">계산서일정</th>
								<th scope="row">담당자</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="totalAmount" value="0" />
							<c:set var="totalTax" value="0" />
							<c:forEach var="result" items="${billList}" varStatus="status">
								<tr>
									<td><c:out value="${displayUtil.displayDate(result.regDt)}" /></td>
									<td align="left"><span class="textalignL" title="${result.pjNm }" style="max-width: 320px;"><c:out value="${result.pjNm}" /></span></td>
									<td><span title="${result.acNm }" style="max-width: 200px;"><c:out value="${result.acNm}" /></span></td>
									<td>
										<c:choose>
											<c:when test="${result.kind eq 'SD' }">
												매출
											</c:when>
											<c:otherwise>
												매입
											</c:otherwise>
										</c:choose>
									</td>
									<td><span class="textalignR"><c:out value="${displayUtil.commaStr(result.salesAmount)}" /></span></td>
									<td><span class="textalignR"><c:out value="${displayUtil.commaStr(result.salesTax)}" /></span></td>
									<td><c:out value="${displayUtil.displayDate(result.billDate)}" /></td>
									<td><c:out value="${result.empNm}" /></td>
								</tr>
								<c:set var="totalAmount" value="${totalAmount + result.salesAmount }" />
								<c:set var="totalTax" value="${totalTax + result.salesTax }" />
							</c:forEach>
							<!--
							<tr>
								<td>2018-12-12</td>
								<td><span title="통일부 2020 북한방송수신체계 증설" class="textalignL">통일부 2020 북한방송수신체계 증설</span></td>
								<td><span title="코오롱베니트(주)">코오롱베니트(주)</span></td>
								<td>구매</td>
								<td><span title="5,000,000" class="textalignR">5,000,000</span></td>
								<td><span title="5,000,000" class="textalignR">5,000,000</span></td>
								<td>2018-12-12</td>
								<td>홍길동</td>
							</tr> 
							 -->
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<table>
						<tbody class="ftw400">
							<tr>
								<td></td><td></td><td></td>
								<td  class="ftw400">합계</td>
								<td><span class="ftw400"><c:out value="${displayUtil.commaStr(totalAmount) }"/></span></td>
								<td><span class="ftw400"><c:out value="${displayUtil.commaStr(totalTax) }"/></span></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>