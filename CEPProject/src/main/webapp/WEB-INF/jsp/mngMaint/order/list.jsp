<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수 발주목록리스트</title>
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
			width: 115px;
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
			margin-left: 15px;
			vertical-align: middle;
		}
		.middle table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle table tbody tr td:nth-child(4) {
			font-weight: 400;
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
			width: 88px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3),
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 175px;
			max-width: 175px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 320px;
			max-width: 320px;
		}
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6) {
			width: 110px;
		}
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7) {
			width: 90px;
		}
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(8) {
			width: 120px;
		}
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9) {
			width: 100px;
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
			width: 654px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
		.bottom > div {
			margin-top: 22px;
		}
		.contentsWrap .contents .top input[type="text"] {
		    height: 36px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
			color: #000;
		}
/* 		.contentsWrap .contents .top input[type="text"]::placeholder {
			color: #535353;
		} */
		.contentsWrap .contents .top input[class^="calendar"] {
			width: 120px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.contentsWrap .contents .top input[class="search"] {
			width: 260px;
		}
		.bottom table tr td {
			padding: 10px;
			color: #26a07d;
			background-color: #ccf4d7;
			text-align: right;
			width: 121px;
		}
	</style>
	<script>
		$(document).ready(function() {
			
			$('.middle table tbody tr').click(function() {
				
				var mtIntegrateKey = $(this).children().eq(11).text();
				var mtOrderKey = $(this).children().eq(12).text();
				var orderCtFkKey = $(this).children().eq(13).text();
				
				
				
				$('#mtIntegrateKey').val($(this).children().eq(11).text());
				$('#mtOrderKey').val($(this).children().eq(12).text());
				$('#orderCtFkKey').val($(this).children().eq(13).text());
				if('BO' == $(this).children().eq(10).text()){					
					//백계약 상세
					document.listForm.action = '/maintenance/contract/detail/backOrderInfo.do';
					//window.open("/maintenance/contract/detail/backOrderInfo.do?mtIntegrateKey="+mtIntegrateKey+"&mtOrderKey="+mtOrderKey+"&orderCtFkKey="+orderCtFkKey);
				} else if('PO' == $(this).children().eq(10).text()){
					//작업발주.
					document.listForm.action = '/maintenance/work/detail/orderInfo.do';
					//window.open("/maintenance/work/detail/orderInfo.do?mtIntegrateKey="+mtIntegrateKey+"&mtOrderKey="+mtOrderKey+"&orderCtFkKey="+orderCtFkKey);
				}

				document.listForm.submit(); 
				
				//alert("===>"+mtOrderType+"/"+mtIntegrateKey+"/"+mtOrderKey+"/"+mtWorkKey);
			});
			
			/* $('#fl tr').each(function(index, item) {
				if(index != 0) {
					$(this).children().eq(0).append('<input type="checkbox" class="tCheck" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
				}
			}); */
		});

		function fn_addView(link){
			/* if(link == "forecastList") {
				location.href="<c:url value='/forecastList.do'/>";
			} else { */
				var url = '/mngMaint/order/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
		
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px'); 
			/* } */
		}
		
		function fn_searchList(){
		
			document.listForm.action = "/mngMaint/order/list.do";
           	document.listForm.submit(); 
		}

	</script>
</head>
<body>
	<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
		<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey"/>
		<input type="hidden" id="mtOrderKey" name="mtOrderKey"/>
		<input type="hidden" id="orderCtFkKey" name="orderCtFkKey"/>
		<!-- <div class="sfcnt"></div>
		<div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">유지보수 발주목록</label></div>
						<%-- <div class="addBtn floatL cursorP" onclick="javascript:fn_addView('addInfo')"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>
					</div>
					<div class="floatR">
						<form:select path="mtOrderType">
							<form:option value="" label="전체" />
							<form:option value="BO" label="백계약발주" />
							<form:option value="PO" label="작업발주" />
						</form:select>
						<!-- <select>
							<option value="">전체</option>
							<option value="BO">백계약발주</option>
							<option value="PO">작업발주</option>
						</select> -->
						<form:input path="searchOderAcKeyNm" type="text" placeholder="매입처명"/>
						<form:input path="orderDtFrom" type="text" placeholder="발주일자(from)" class="calendar fromDt" value="${searchParam.orderDtFrom}"/><label style="vertical-align: -webkit-baseline-middle;"> ~ </label><form:input path="orderDtTo" type="text" placeholder="발주일자(to)" class="calendar toDt" value="${searchParam.orderDtTo}"/>
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
					<table class="textalignC ftw200 excelSheet" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">No</th>
								<th scope="row">발주구분</th>
								<th scope="row">고객사</th>
								<th scope="row">유지보수명</th>
								<th scope="row">발주처</th>
								<th scope="row">발주처담당</th>
								<th scope="row">발주일자</th>
								<th scope="row">발주금액</th>
								<th scope="row">영업담당자</th>
								<th scope="row">결재조건</th>
								<th style="max-width: 0px; display: none;">mtOrderType</th>
								<th style="max-width: 0px; display: none;">mtIntegrateKey</th>
								<th style="max-width: 0px; display: none;">mtOrderKey</th>
								<th style="max-width: 0px; display: none;">mtWorkKey</th>
							</tr>
						</thead>
						<tbody>
						<c:set var = "totalAmount" value="0" />
						<c:forEach var="list" items="${orderList}" varStatus="status">
							<c:set var = "totalAmount" value="${totalAmount + list.mtOrderAmount}" />
							<tr>
								<td><c:out value="${status.count}"/></td>
								<td>
							<c:choose>
								<c:when test="${list.mtOrderType eq 'BO'}">
									백계약발주
								</c:when>
								<c:when test="${list.mtOrderType eq 'PO'}">
									작업발주
								</c:when>
								<c:otherwise>
									<c:out value="${list.mtOrderType}"/>
								</c:otherwise>
							</c:choose>	
								</td>
								<td class="textalignL"><span title="${list.mtAcNm}"><c:out value="${list.mtAcNm}"/></span></td>
								<td class="textalignL"><span title="${list.mtNm}"><c:out value="${list.mtNm}"/></span></td>
								<td class="textalignL"><span title="${list.mtOrderAcKeyNm}"><c:out value="${list.mtOrderAcKeyNm}"/></span></td>
								<td><c:out value="${list.mtAcDirectorNm}"/></td>
								<td><c:out value="${displayUtil.displayDate(list.mtOrderDt)}"/></td>
								<td class="textalignR">
									<span title="${displayUtil.commaStr(list.mtOrderAmount)}" style="margin-right:10px"><c:out value="${displayUtil.commaStr(list.mtOrderAmount)}"/></span>
								</td>
								<td><c:out value="${list.saleEmpNm}"/></td>
								<td class="textalignL"><span title="${list.mtOrderPayTerms}"><c:out value="${list.mtOrderPayTerms}"/></span></td>
								<td style="max-width: 0px; display: none;"><c:out value="${list.mtOrderType}"/></td>
								<td style="max-width: 0px; display: none;"><c:out value="${list.mtIntegrateKey}"/></td>
								<td style="max-width: 0px; display: none;"><c:out value="${list.mtOrderKey}"/></td>
								<td style="max-width: 0px; display: none;"><c:out value="${list.mtWorkKey}"/></td>
							</tr>
						</c:forEach>
							
							<!-- <tr>
								<td>2</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체">VDI 중요단말기 환경 구축 및 노후장비 교체</span></td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>78945612</td>
								<td><span title="DellTech">DellTech</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>5</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>김규민</td>
								<td>박영수</td>
							</tr>
							<tr>
								<td>3</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체">VDI 중요단말기 환경 구축 및 노후장비 교체</span></td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>78945612</td>
								<td><span title="DellTech">DellTech</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>5</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>김규민</td>
								<td>박영수</td>
							</tr>
							<tr>
								<td>4</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체">VDI 중요단말기 환경 구축 및 노후장비 교체</span></td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>78945612</td>
								<td><span title="DellTech">DellTech</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>5</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>김규민</td>
								<td>박영수</td>
							</tr>
							<tr>
								<td>5</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체">VDI 중요단말기 환경 구축 및 노후장비 교체</span></td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>78945612</td>
								<td><span title="DellTech">DellTech</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>5</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>김규민</td>
								<td>박영수</td>
							</tr>
							<tr>
								<td>6</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체">VDI 중요단말기 환경 구축 및 노후장비 교체</span></td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>78945612</td>
								<td><span title="DellTech">DellTech</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>5</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>김규민</td>
								<td>박영수</td>
							</tr>
							<tr>
								<td></td>
								<td>7</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체">VDI 중요단말기 환경 구축 및 노후장비 교체</span></td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>78945612</td>
								<td><span title="DellTech">DellTech</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>5</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>김규민</td>
								<td>박영수</td>
							</tr>
							<tr>
								<td>8</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체">VDI 중요단말기 환경 구축 및 노후장비 교체</span></td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>78945612</td>
								<td><span title="DellTech">DellTech</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>5</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>김규민</td>
								<td>박영수</td>
							</tr>
							<tr>
								<td>9</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체">VDI 중요단말기 환경 구축 및 노후장비 교체</span></td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>78945612</td>
								<td><span title="DellTech">DellTech</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>5</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>김규민</td>
								<td>박영수</td>
							</tr>
							<tr>
								<td>10</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체">VDI 중요단말기 환경 구축 및 노후장비 교체</span></td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>78945612</td>
								<td><span title="DellTech">DellTech</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>5</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>김규민</td>
								<td>박영수</td>
							</tr>
							<tr>
								<td>11</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체">VDI 중요단말기 환경 구축 및 노후장비 교체</span></td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>78945612</td>
								<td><span title="DellTech">DellTech</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>5</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>김규민</td>
								<td>박영수</td>
							</tr>
							<tr>
								<td>12</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체">VDI 중요단말기 환경 구축 및 노후장비 교체</span></td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>78945612</td>
								<td><span title="DellTech">DellTech</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>5</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>김규민</td>
								<td>박영수</td>
							</tr>
							<tr>
								<td>13</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체">VDI 중요단말기 환경 구축 및 노후장비 교체</span></td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>78945612</td>
								<td><span title="DellTech">DellTech</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>5</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>김규민</td>
								<td>박영수</td>
							</tr> -->
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<table>
						<tbody class="ftw400">
							<tr>								
								<td style="width:1006px;">합계 :</td>
								
								<td style="text-align: left;width: 615px;"><span><c:out value="${displayUtil.commaStr(totalAmount)}"/> 원</span></td>
							</tr>
						</tbody>
					</table>
					<div class="floatR">
						<button type="button" value="엑셀 다운로드" id="excelExport" ><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>"/></button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>