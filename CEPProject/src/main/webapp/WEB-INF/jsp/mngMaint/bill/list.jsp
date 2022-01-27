<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수 세금계산서 목록</title>
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
			width: 84%;
			margin: 0 auto;
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
		.middle table tbody td:first-child,
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 50px;
			max-width: 50px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3){
			width: 180px;
			max-width: 180px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4),
		.middle table thead th:nth-child(11),
		.middle table tbody td:nth-child(11){
			width: 90px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5),
		.middle table thead th:nth-child(12),
		.middle table tbody td:nth-child(12) {
			width: 160px;
			max-width: 160px;
		}
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6) {
			width: 110px;
		}
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7) {
			width: 95px;
		}
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(8) {
			width: 105px;
		}
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9),
		.middle table thead th:nth-child(10),
		.middle table tbody td:nth-child(10) {
			width: 100px;
			max-width: 100px;
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
			width: 260px;
		}
	</style>
	<script>
		$(document).ready(function() {
			
		});

		function fn_searchList(){
			
			document.listForm.action = "/mngMaint/bill/list.do";
           	document.listForm.submit(); 
		}

		 function fnViewBillInsert(billCtFkKey) {
			 var url = '/mngMaint/bill/popup/viewWriteSdBilling.do';
			 var dialogId = 'program_layer';
			 var varParam = {"billCtFkKey" : billCtFkKey};
			
			 var button = new Array;
			 button = [];
			 
			 /* showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:495px'); */ 
			 parent.showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:545px');
			
		 }
	</script>
</head>
<body>
	<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">계산서 목록</label></div>
						<%-- <div class="addBtn floatL cursorP" onclick="javascript:fn_addView('writeBasic')"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>
					</div>
					<div class="floatR">
						<form:select path="searchBillGroup">
							<form:option value="" label="전체" />
							<form:option value="PC" label="매입" />
							<form:option value="SD" label="매출" />
						</form:select>
						<form:input path="searchAcNm" type="text" placeholder="매입/매출처"/>
						<form:input path="searchFromDate" type="text" placeholder="계산서발행일(from)" class="calendar fromDt" value="${searchParam.searchFromDate}"/> ~ <form:input path="searchToDate" type="text" placeholder="계산서발행일(to)" class="calendar toDt" value="${searchParam.searchToDate}"/>
						<form:select path="searchGubun">
							<form:option value="PJ" label="프로젝트명" />
							<form:option value="CU" label="고객사" />
						</form:select>
						<form:input path="searchWord" type="text" placeholder="검색어"/>
						<span><button><img src="<c:url value='/images/icon_search.png'/>" onclick="fn_searchList();"/></button></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200" id="fl">
						<thead class="ftw400">
							<tr>
								<!-- <th scope="row">No</th>
								<th scope="row">구분</th>
								<th scope="row">작성일자</th>
								<th scope="row">사업자(주민)번호</th>
								<th scope="row">상호</th>
								<th scope="row">대표자명</th>
								<th scope="row">공급가액</th>
								<th scope="row">세액</th>
								<th scope="row">합계</th>
								<th scope="row">비고</th>
								<th scope="row">승인번호</th>
								<th scope="row">발급일자</th>
								<th scope="row">발급유형</th> -->
								<th scope="row">No</th>
								<th scope="row">구분</th>
								<th scope="row">계산서 번호</th>
								<th scope="row">발행일자</th>
								<th scope="row">거래처</th>
								<th scope="row">사업자번호</th>
								<th scope="row">거래처 담당자</th>
								<th scope="row">계산서 금액</th>
								<th scope="row">발행구분</th>
								<th scope="row">진행상태</th>
								<th scope="row">수금완료</th>
								<th scope="row">고객사</th>
								<th scope="row">프로젝트명</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="result" items="${billList}" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>
							<c:choose>
								<c:when test="${result.billGroup eq 'PC'}">
									<span>매입</span>
								</c:when>
								<c:when test="${result.billGroup eq 'SD'}">
									<span>매출</span>
								</c:when>
								<c:otherwise>
									<span>${result.billGroup}</span>
								</c:otherwise>
							</c:choose>
								</td>
								<td><span title="${result.billNo}">${result.billNo}</span></td>
								<td><span>${displayUtil.displayDate(result.billIssueDt) }</span></td>
								<td><span title="${result.billAcNm}"><a href="javascript:fnViewBillInsert('${result.salesKey}')" style="color: #0c35ff;"><c:out value="${result.billAcNm}"/></a></span></td>
								<td><span>${displayUtil.makeActypeForm(result.billAcKey) }</span></td>
								<td><span>${result.billAcDirectorNm }</span></td>
								<td class="textalignR"><span>${displayUtil.commaStr(result.billAmount) }</span></td>
								<td>
							<c:choose>
								<c:when test="${result.billIssueType eq 'Y'}">
									<span>정발행</span>
								</c:when>
								<c:when test="${result.billIssueType eq 'N'}">
									<span>역발행</span>
								</c:when>
								<c:otherwise>
									<span>${result.billIssueType}</span>
								</c:otherwise>
							</c:choose>
								</td>
								<td>
								<!-- R:요청, I:발급, M:매핑, E:지급완료(수금완료) -->
							<c:choose>
								<c:when test="${result.billIssueStatus eq 'R'}">
									<span>요청</span>
								</c:when>
								<c:when test="${result.billIssueStatus eq 'I'}">
									<span>발급</span>
								</c:when>
								<c:when test="${result.billIssueStatus eq 'M'}">
									<span>매핑</span>
								</c:when>
								<c:when test="${result.billIssueStatus eq 'E'}">
									<span>수금완료</span>
								</c:when>
								<c:otherwise>
									<span>${result.billIssueStatus}</span>
								</c:otherwise>
							</c:choose>									
								</td>
								<td>
									<c:choose>
										<c:when test="${empty result.salesCollectFinishDt }">
											<span>미완료</span>
										</c:when>
										<c:otherwise>
											<span>${displayUtil.displayDate(result.salesCollectFinishDt) }</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td><span title="${result.mtAcNm}">${result.mtAcNm}</span></td>
								<td><span title="${result.mtNm}">${result.mtNm}</span></td>
							</tr>
						</c:forEach>
							<!-- <tr>
								<td>2</td>
								<td>매입</td>
								<td>2018-12-12</td>
								<td>254-66-45879</td>
								<td><span title="에이제이파크 주식회사">에이제이파크 주식회사</span></td>
								<td>홍길동</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="디비손해보험(디비손해보험)">디비손해보험(디비손해보험)</span></td>
								<td><span title="202004512100009845600254">승인번호</span></td>
								<td>2018-12-12</td>
								<td></td>
							</tr>
							<tr>
								<td>3</td>
								<td>매입</td>
								<td>2018-12-12</td>
								<td>254-66-45879</td>
								<td><span title="에이제이파크 주식회사">에이제이파크 주식회사</span></td>
								<td>홍길동</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="디비손해보험(디비손해보험)">디비손해보험(디비손해보험)</span></td>
								<td><span title="202004512100009845600254">승인번호</span></td>
								<td>2018-12-12</td>
								<td></td>
							</tr>
							<tr>
								<td>4</td>
								<td>매입</td>
								<td>2018-12-12</td>
								<td>254-66-45879</td>
								<td><span title="에이제이파크 주식회사">에이제이파크 주식회사</span></td>
								<td>홍길동</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="디비손해보험(디비손해보험)">디비손해보험(디비손해보험)</span></td>
								<td><span title="202004512100009845600254">승인번호</span></td>
								<td>2018-12-12</td>
								<td></td>
							</tr>
							<tr>
								<td>5</td>
								<td>매입</td>
								<td>2018-12-12</td>
								<td>254-66-45879</td>
								<td><span title="에이제이파크 주식회사">에이제이파크 주식회사</span></td>
								<td>홍길동</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="디비손해보험(디비손해보험)">디비손해보험(디비손해보험)</span></td>
								<td><span title="202004512100009845600254">승인번호</span></td>
								<td>2018-12-12</td>
								<td></td>
							</tr>
							<tr>
								<td>6</td>
								<td>매입</td>
								<td>2018-12-12</td>
								<td>254-66-45879</td>
								<td><span title="에이제이파크 주식회사">에이제이파크 주식회사</span></td>
								<td>홍길동</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="디비손해보험(디비손해보험)">디비손해보험(디비손해보험)</span></td>
								<td><span title="202004512100009845600254">승인번호</span></td>
								<td>2018-12-12</td>
								<td></td>
							</tr>
							<tr>
								<td>7</td>
								<td>매입</td>
								<td>2018-12-12</td>
								<td>254-66-45879</td>
								<td><span title="에이제이파크 주식회사">에이제이파크 주식회사</span></td>
								<td>홍길동</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="디비손해보험(디비손해보험)">디비손해보험(디비손해보험)</span></td>
								<td><span title="202004512100009845600254">승인번호</span></td>
								<td>2018-12-12</td>
								<td></td>
							</tr>
							<tr>
								<td>8</td>
								<td>매입</td>
								<td>2018-12-12</td>
								<td>254-66-45879</td>
								<td><span title="에이제이파크 주식회사">에이제이파크 주식회사</span></td>
								<td>홍길동</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="디비손해보험(디비손해보험)">디비손해보험(디비손해보험)</span></td>
								<td><span title="202004512100009845600254">승인번호</span></td>
								<td>2018-12-12</td>
								<td></td>
							</tr>
							<tr>
								<td>9</td>
								<td>매입</td>
								<td>2018-12-12</td>
								<td>254-66-45879</td>
								<td><span title="에이제이파크 주식회사">에이제이파크 주식회사</span></td>
								<td>홍길동</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="디비손해보험(디비손해보험)">디비손해보험(디비손해보험)</span></td>
								<td><span title="202004512100009845600254">승인번호</span></td>
								<td>2018-12-12</td>
								<td></td>
							</tr>
							<tr>
								<td>10</td>
								<td>매입</td>
								<td>2018-12-12</td>
								<td>254-66-45879</td>
								<td><span title="에이제이파크 주식회사">에이제이파크 주식회사</span></td>
								<td>홍길동</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="디비손해보험(디비손해보험)">디비손해보험(디비손해보험)</span></td>
								<td><span title="202004512100009845600254">승인번호</span></td>
								<td>2018-12-12</td>
								<td></td>
							</tr>
							<tr>
								<td>11</td>
								<td>매입</td>
								<td>2018-12-12</td>
								<td>254-66-45879</td>
								<td><span title="에이제이파크 주식회사">에이제이파크 주식회사</span></td>
								<td>홍길동</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="디비손해보험(디비손해보험)">디비손해보험(디비손해보험)</span></td>
								<td><span title="202004512100009845600254">승인번호</span></td>
								<td>2018-12-12</td>
								<td></td>
							</tr>
							<tr>
								<td>12</td>
								<td>매입</td>
								<td>2018-12-12</td>
								<td>254-66-45879</td>
								<td><span title="에이제이파크 주식회사">에이제이파크 주식회사</span></td>
								<td>홍길동</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="디비손해보험(디비손해보험)">디비손해보험(디비손해보험)</span></td>
								<td><span title="202004512100009845600254">승인번호</span></td>
								<td>2018-12-12</td>
								<td></td>
							</tr>
							<tr>
								<td>13</td>
								<td>매입</td>
								<td>2018-12-12</td>
								<td>254-66-45879</td>
								<td><span title="에이제이파크 주식회사">에이제이파크 주식회사</span></td>
								<td>홍길동</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="디비손해보험(디비손해보험)">디비손해보험(디비손해보험)</span></td>
								<td><span title="202004512100009845600254">승인번호</span></td>
								<td>2018-12-12</td>
								<td></td>
							</tr> -->
						
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<div class="floatR">
						<button value="수정"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
						<button value="삭제"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
						<button value="엑셀 다운로드"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>