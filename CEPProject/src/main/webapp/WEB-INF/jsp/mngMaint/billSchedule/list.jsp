<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수 계산서 일정</title>
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
			width: 85%;
			margin: 0 3px;
		}
		.middle table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle table thead th, .middle table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
			color: #535353;
		}
		.middle table  thead th:first-child,
		.middle table tbody td:first-child {
			width: 50px;
			max-width: 50px
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 60px;
			max-width: 60px
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3),
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 180px;
			max-width: 180px
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 310px;
			max-width: 310px
		}		
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6) {
			width: 235px;
			max-width: 235px
		}		
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7) {
			width: 115px;
			max-width: 115px;
		}
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(8),
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9),
		.middle table thead th:nth-child(10),
		.middle table tbody td:nth-child(10) {
			width: 105px;
			max-width: 105px;
		}		
		.middle table thead th:nth-child(11),
		.middle table tbody td:nth-child(11) {
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
		.bottom table {
			width: 100%;
		}
		.bottom table tr td {
			padding: 10px;
			color: #26a07d;
			background-color: #ccf4d7;
			text-align: right;
			width: 121px;
		}
		.bottom table tr td:nth-child(2) {
			width: 141px;
			max-width: 141px;
		}
		.bottom table tr td:nth-child(3) {
			width: 134px;
			max-width: 134px;
		}
		input[type="text"] {
		    height: 39px;
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
			width: 120px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.contentsWrap .contents .top select {
			height: 41px;
			width: 126px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
	</style>
	<script>
		$(document).ready(function() {
			/* 
				해당 줄을 클릭했을때 해당 화면으로 이동. 
				billType : 매입(PC), 매출(SD) 구분
			*/
			$('.middle table tbody tr').click(function() {
				var mtIntegrateKey = $(this).children().eq(12).text();
				var pjKey = $(this).children().eq(12).text();
				var mtOrderType = $(this).children().eq(13).text();
				var mtWorkKey = $(this).children().eq(14).text();
				var mtOrderKey = $(this).children().eq(15).text();
				var billType = $(this).children().eq(16).text();
				//console.log("==========");
				//console.log("mtIntegrateKey=========="+mtIntegrateKey);
				//console.log("mtOrderType=========="+mtOrderType);
				//console.log("mtWorkKey=========="+mtWorkKey);
				//console.log("mtOrderKey=========="+mtOrderKey);
				//console.log("billType=========="+billType);
				
				$('#mtIntegrateKey').val($(this).children().eq(12).text());
				$('#pjKey').val($(this).children().eq(12).text());
				$('#mtOrderType').val($(this).children().eq(13).text());
				$('#mtWorkKey').val($(this).children().eq(14).text());
				$('#mtOrderKey').val($(this).children().eq(15).text());
				$('#mtSalesOrderKey').val($(this).children().eq(17).text());
				
				
				
				if('SD' == $(this).children().eq(16).text()){
					//제품등록 ==> 매출 ==> 수금요청화면으로 이동
					if(confirm('"'+$(this).children().eq(3).text()+'" 유지보수계약 계산서발행요청 화면으로 이동하시겠습니까?')){
						document.listForm.action = "/mngMaint/bill/detail/main.do";
			           	document.listForm.submit();
					} else {
						return false;
					}
				} else if('PC' == $(this).children().eq(16).text()){
					//발주 ==> 매입  ==> 지급요청화면으로 이동
					//window.open("/mngMaint/payment/detail/main.do?mtIntegrateKey="+mtIntegrateKey+"&mtOrderType="+mtOrderType+"&mtWorkKey="+mtWorkKey+"&mtOrderKey="+mtOrderKey+"&iframGubun=list");
					
					if(confirm('"'+$(this).children().eq(4).text()+' 매입금 지급요청 화면으로 이동하시겠습니까?')){
						document.listForm.action = "/mngMaint/payment/detail/main.do";
			           	document.listForm.submit();
					} else {
						return false;
					}
					
					
				}
				//$('#mtIntegrateKey').val($(this).children().eq(11).text());
				//$('#mtOrderKey').val($(this).children().eq(12).text());
				//$('#orderCtFkKey').val($(this).children().eq(13).text());
				/* if('BO' == $(this).children().eq(10).text()){					
					//백계약 상세
					document.listForm.action = '/maintenance/contract/detail/backOrderInfo.do';
				} else if('PO' == $(this).children().eq(10).text()){
					//작업발주.
					document.listForm.action = '/maintenance/work/detail/orderInfo.do';
				} */
				//alert("mtOrderType==>"+$(this).children().eq(10).text());
				//document.listForm.submit(); 
				//alert("===>"+mtOrderType+"/"+mtIntegrateKey+"/"+mtOrderKey+"/"+mtWorkKey);
			});
			
			/* $('#fl tr').each(function(index, item) {
				if(index != 0) {
					$(this).children().eq(0).append('<input type="checkbox" class="tCheck" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
				}
			}); */
		});	
	</script>
</head>
<body>
	<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
		<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey"/>
		<input type="hidden" id="pjKey" name="pjKey"/><!--mtIntegrateKey == pjKey  -->
		<input type="hidden" id="mtOrderType" name="mtOrderType"/>
		<input type="hidden" id="mtWorkKey" name="mtWorkKey"/>
		<input type="hidden" id="mtOrderKey" name="mtOrderKey"/>
		<input type="hidden" id="iframGubun" name="iframGubun" value="list"/>
		<input type="hidden" id="mtSalesOrderKey" name="mtSalesOrderKey"/>
		<!-- <div class="sfcnt"></div>
		<div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">유지보수 계산서 일정</label></div>
						<%-- <div class="addBtn floatL cursorP" onclick="javascript:fn_addView('writeBasic')"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>
					</div>
					<div class="floatR">
						<form:select path="billType">
							<form:option value="SD" label="매출" />
							<form:option value="PC" label="매입" />
						</form:select>
						<form:select path="dateSearchType">
							<form:option value="BR" label="요청일" />
							<form:option value="BI" label="계산서발행일" />
						</form:select>
						<form:input path="fromDate" type="text" class="calendar fromDt" value="${searchParam.fromDate}"/><label style="vertical-align: -webkit-baseline-middle;"> ~ </label><form:input path="toDate" type="text" class="calendar toDt" value="${searchParam.toDate}"/>
						<form:select path="searchGubun">
							<form:option value="PJ" label="유지보수명" />
							<form:option value="CU" label="거래처" />
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
								<th scope="row">No</th>
								<th scope="row">구분</th>
								<th scope="row">고객사</th>
								<th scope="row">유지보수명</th>
								<th scope="row">거래처</th>
								<th scope="row">계산서번호</th>
								<th scope="row">금액</th>
								<th scope="row">요청일</th>
								<th scope="row">발행일</th>
								<th scope="row">완료일</th>
								<th scope="row">요청상태</th>
								<th scope="row">영업담당</th>
								<th style="max-width: 0px; display: none;">mtIntegrateKey</th>
								<th style="max-width: 0px; display: none;">mtOrderType</th>
								<th style="max-width: 0px; display: none;">mtWorkKey</th>
								<th style="max-width: 0px; display: none;">mtOrderKey</th>
								<th style="max-width: 0px; display: none;">billType</th>
							</tr>
						</thead>
						<tbody>
						<c:set var = "totalAmount" value="0" />
						<c:forEach var="list" items="${mtBillRequestList}" varStatus="status">
							<c:set var = "totalAmount" value="${totalAmount + list.billAmount}" />
							<tr>
								<td><c:out value="${status.count}"/></td>
								<td>
							<c:choose>
								<c:when test="${list.billType eq 'SD'}">
									매출
								</c:when>
								<c:when test="${list.billType eq 'PC'}">
									매입(${list.mtOrderType})
								</c:when>
								<c:otherwise>
									<c:out value="${list.billType}"/>
								</c:otherwise>
							</c:choose>	
								</td>
								<td class="textalignL"><span title="${list.mtAcNm}"><c:out value="${list.mtAcNm}"/></span></td>
								<td class="textalignL"><span class="spBusiNm ftw400" title="${list.mtNm}"><c:out value="${list.mtNm}"/></span></td>
								<td class="textalignL"><span title="${list.billAcNm}"><c:out value="${list.billAcNm}"/></span></td>
								<td><span title="${list.billNo}"><c:out value="${list.billNo}"/></span></td>								
								<td class="textalignR"><span title="${displayUtil.commaStr(list.billAmount)}"><c:out value="${displayUtil.commaStr(list.billAmount)}"/></span></td>
								<td><c:out value="${displayUtil.displayDate(list.billRequestDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(list.billIssueDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(list.billFinishDt)}"/></td>
								<td>
							<c:choose>
								<c:when test="${list.billStatusCd eq 'R' && list.billType eq 'SD'}">
									<span>요청</span>
								</c:when>
								<c:when test="${list.billStatusCd eq 'I' && list.billType eq 'SD'}">
									<span>발급</span>
								</c:when>
								<c:when test="${list.billStatusCd eq 'M' && list.billType eq 'SD'}">
									<span>매핑</span>
								</c:when>
								<c:when test="${list.billStatusCd eq 'E' && list.billType eq 'SD'}">
									<span>수금완료</span>
								</c:when>
								<c:when test="${list.billStatusCd eq 'W' && list.billType eq 'PC'}">
									<span>대기</span>
								</c:when>
								<c:when test="${list.billStatusCd eq 'M' && list.billType eq 'PC'}">
									<span>계산서매핑</span>
								</c:when>
								<c:when test="${list.billStatusCd eq 'R' && list.billType eq 'PC'}">
									<span>요청</span>
								</c:when>
								<c:when test="${list.billStatusCd eq 'C' && list.billType eq 'PC'}">
									<span>확인</span>
								</c:when>
								<c:when test="${list.billStatusCd eq 'E' && list.billType eq 'PC'}">
									<span>지급완료</span>
								</c:when>
								<c:when test="${list.billStatusCd eq null || list.billStatusCd eq ''}">
									<span>대기</span>
								</c:when>
								<c:otherwise>
									<span>${list.billStatusCd}</span>
								</c:otherwise>
							</c:choose>
								</td>
								<td><span title="${list.saleEmpNm}"><c:out value="${list.saleEmpNm}"/></span></td>
								<td style="max-width: 0px; display: none;"><c:out value="${list.mtIntegrateKey}"/></td>
								<td style="max-width: 0px; display: none;"><c:out value="${list.mtOrderType}"/></td>
								<td style="max-width: 0px; display: none;"><c:out value="${list.mtWorkKey}"/></td>
								<td style="max-width: 0px; display: none;"><c:out value="${list.mtOrderKey}"/></td>
								<td style="max-width: 0px; display: none;"><c:out value="${list.billType}"/></td>
								<td style="max-width: 0px; display: none;"><c:out value="${list.mtSalesOrderKey}"/></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<table>
						<tbody class="ftw400">
							<tr>								
								<td style="width:220px;">합계 :</td>
								
								<td style="text-align: left;"><span><c:out value="${displayUtil.commaStr(totalAmount)}"/> 원</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>