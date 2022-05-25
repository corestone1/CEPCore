<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<%@include file="/WEB-INF/jsp/cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>판매품의서(유지보수)</title>
	<style>
		.sfcnt {
			height: 91px;
		}
		.btnWrap {
			padding-bottom: 10px;
			margin-top: 13px;
		}
		form .nav {
			width: 100%;
			height: 49px;
		}
		form .contentsWrap {
			background-color: #f6f7fc;
			box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);
			max-height: 830px;
			overflow-y: scroll;
			overflow-x: hidden;
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
		form .contents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			border: 1px solid #bee2da;
		}
		form .contents .bsc tr td {
			padding: 13px 28px;
			color: #0e8a67;
		}
		form .contents .bsc tr td:nth-child(2n-1) {
			width: 80px;
		}
		form .contents .bsc tr td:nth-child(2n) {
			width: 374px;
			max-width: 374px;
			font-weight: 200;
		}
		/* form .contents .dtl tbody tr:last-child td {
			background-color: #ecf6f4;
			font-weight: 400;
			color: #21a17e;
		} */
		form .contents .dtl thead tr th,
		form .contents .dtl tbody tr td {
			padding: 10px 20px;
			border: 1px solid #ecebef;
			text-align: center;
		}
		form .contents .dtl thead tr th {
			background-color: #e2e0f5;
			font-weight: 400;
			border-bottom: 4px solid #6a5baf;
		}
		form .contents .dtl tbody tr td {
			font-weight: 200;
		}
		input[type="text"] {
		    font-family: "Noto Sans KR", sans-serif !important;
		    font-weight: 200;
		    font-size: 14px;
	        width: 100%;
    		text-align: right;
		}
		
		.middle table tbody {
		    width: 1662px;
		    height: 396px;
		    overflow-y: auto;
		    overflow-x: hidden;
		    float: left;
		}
		
		.middle table thead {
		    width: 1662px;
		    float: left;
		}
		.bottom table {
			width: 100%;
		}
		.bottom table tr td {
		    padding: 10px;
		    color: #26a07d;
		    background-color: #ecf6f4;
		    text-align: right;
		    width: 121px;
		}
		
		.middle table thead th:first-child,
		.middle table tbody td:first-child {
			width: 250px;
			max-width: 250px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 100px;
			max-width: 100px;
		}
		
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 100px;
			max-width: 100px;
		}
		
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 100px;
			max-width: 100px;
		}
		
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 100px;
			max-width: 100px;
		}
		
		
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6) {
			width: 100px;
			max-width: 100px;
		}
		
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7),
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(8),
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9) {
			width: 120px;
			max-width: 120px;
		}
		
		
		.middle table thead th:nth-child(10),
		.middle table tbody td:nth-child(10) {
			width: 153px;
			max-width: 153px;
		}
		.middle table thead tr, .middle table tbody tr {
		    display: table;
		    width: 1662px;
		}
	</style>
	<script>
	</script>
</head>
<body>
	<form id="listForm" name="listForm" method="post">
		<!-- <div class="sfcnt"></div>
		<div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="">
					<div class="title"><label class="ftw500">판매품의서</label></div>
					<div>
						<div class="stitle cg">기본정보</div>
						<div id="basicForm">
							<table class="bsc" style="width: 100%;">
								<tr>
									<td>고객사</td>
									<td>${basicContractInfo.mtAcNm} / 담당자: ${basicContractInfo.mtAcDirectorNm}</td>
									<td>유지보수명</td>
									<td>${basicContractInfo.mtNm}</td>
									<td>계약일자</td>
									<td>${displayUtil.displayDate(basicContractInfo.mtCtDt)}</td>
									<td>영업담당자</td>
									<td>${basicContractInfo.saleEmpNm}</td>
								</tr>
								<tr>
									
									<td>유지보수기간</td>
									<td>${displayUtil.displayDate(basicContractInfo.mtStartDt)} ~ ${displayUtil.displayDate(basicContractInfo.mtEndDt)}</td>
									<td>비고</td>
									<td colspan="5">${basicContractInfo.remark}</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div>
					<div>
						<div class="stitle">
							매출 정보(${salesApprovalList.size()}건)
						</div>
						<div class="middle">
							<table class="dtl" style="width: 100%;">
								<thead>
									<tr>
										<th>매출처</th>
										<th>매출회차</th>
										<th>매출년월</th>
										<th>진행상태</th>
										<th>매출구분</th>
										<th>제조사</th>
										<th>계산서예정일</th>
										<th>계산서일자</th>
										<th>수금완료일자</th>
										<th>금액</th>
									</tr>
								</thead>
								<c:set var = "salesTotalAmount" value = "0" />
								<c:set var = "finishAmount" value = "0" />
								<c:forEach var="list" items="${salesApprovalList}" varStatus="status">
									<c:set var = "salesTotalAmount" value="${salesTotalAmount + list.salesTurnAmount}" />
									<c:if test="${list.salesStatusCd eq 'E'}"> 
										<c:set var = "finishAmount" value="${finishAmount + list.salesTurnAmount}" />
									</c:if>
									<tr>
										<td class="textalignL">${list.billAcNm}</td>
										<td>${list.salesTurn }</td>
										<td>${displayUtil.displayDate(list.salesYearMonth)}</td>
										<td>
											<c:choose>
												<c:when test="${list.salesStatusCd eq 'R'}">
													<span>발행요청</span>
												</c:when>
												<c:when test="${list.salesStatusCd eq 'I'}">
													<span>계산서발급</span>
												</c:when>
												<c:when test="${list.salesStatusCd eq 'M'}">
													<span>계산서맵핑</span>
												</c:when>
												<c:when test="${list.salesStatusCd eq 'E'}">
													<span>수금완료</span>
												</c:when>
												<c:when test="${list.salesStatusCd == null }">
													<span>발행전</span>
												</c:when>
												<c:otherwise>
													<span>${list.salesStatusCd}</span>
												</c:otherwise>
											</c:choose>
										</td>
										<td>${list.billSalesCd}</td>
										<td>${list.billMfCd}</td>
										<td>${displayUtil.displayDate(list.salesBillFcDt) }</td>
										<td>${displayUtil.displayDate(list.billIssueDt)}</td>
										<td>${displayUtil.displayDate(list.salesCollectFinishDt)}</td>
										<td class="textalignR">${displayUtil.commaStr(list.salesTurnAmount) }</td>
									</tr>
								</c:forEach>
								
							</table>
						</div>
						
						<div class="bottom">
							<table>
								<tbody class="ftw400">
									<tr>						
										<td >수금완료 합계 :</td>
										
										<td style="text-align: right;"><span><c:out value="${displayUtil.commaStr(finishAmount)}"/> 원</span></td>		
										<td style="width:829px;">매출액 합계 :</td>
										
										<td style="text-align: right;"><span><c:out value="${displayUtil.commaStr(salesTotalAmount)}"/> 원</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div>
						<div class="stitle">
							매입 정보(${purchaseApprovalList.size()}건)
						</div>
						<div class="middle">
							<table class="dtl" style="width: 100%;">
								<thead>
									<tr>
										<th>매입처</th>
										<th>매입회차</th>
										<th>매입년월</th>
										<th>진행상태</th>
										<th>매입구분</th>
										<th>제조사</th>
										<th>발주구분</th>
										<th>지급예정일</th>
										<th>지급완료일자</th>
										<th>금액</th>
									</tr>
								</thead>
								<c:set var = "purchaseTotalAmount" value = "0" />
								<c:set var = "finishAmount" value = "0" />
								<c:forEach var="list" items="${purchaseApprovalList}" varStatus="status">
									<c:set var = "purchaseTotalAmount" value="${purchaseTotalAmount + list.paymentTurnAmount}" />
									<c:if test="${list.paymentStatusCd eq 'E'}"> 
										<c:set var = "finishAmount" value="${finishAmount + list.paymentTurnAmount}" />
									</c:if>
									<tr>
										<td class="textalignL">${list.billAcNm}</td>
										<td>${list.paymentTurn }</td>
										<td>${displayUtil.displayDate(list.paymentYearMonth)}</td>
										<td>
											<c:choose>
												<c:when test="${list.paymentStatusCd eq 'W'}">
													<span>요청대기</span>
												</c:when>
												<c:when test="${list.paymentStatusCd eq 'M'}">
													<span>계산서매핑</span>
												</c:when>
												<c:when test="${list.paymentStatusCd eq 'R'}">
													<span>지급요청</span>
												</c:when>
												<c:when test="${list.paymentStatusCd eq 'C'}">
													<span>지급승인</span>
												</c:when>
												<c:when test="${list.paymentStatusCd eq 'E'}">
													<span>지급완료</span>
												</c:when>
												<c:when test="${list.paymentStatusCd == null }">
													<span>지급요청전</span>
												</c:when>
												<c:otherwise>
													<span>${list.paymentStatusCd}</span>
												</c:otherwise>
											</c:choose>	
										</td>
										<td>${list.billPurchaseCd}</td>
										<td>${list.billMfCd}</td>
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
										<td>${displayUtil.displayDate(list.paymentFcDt) }</td>
										<td>${displayUtil.displayDate(list.paymentDt)}</td>
										<td class="textalignR">${displayUtil.commaStr(list.paymentTurnAmount) }</td>
									</tr>
								</c:forEach>
								
							</table>
						</div>
						
						<div class="bottom">
							<table>
								<tbody class="ftw400">
									<tr>														
										<td >지급완료 합계 :</td>
										
										<td style="text-align: right;"><span><c:out value="${displayUtil.commaStr(finishAmount)}"/> 원</span></td>	
										
										<td style="width:829px;">매입액 합계 :</td>
										
										<td style="text-align: right;"><span><c:out value="${displayUtil.commaStr(purchaseTotalAmount)}"/> 원</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="floatL">
						<div class="stitle">
							보증 보험 정보
						</div>
						<div class="">
							<table class="dtl" style="width: 983px;">
								<thead>
									<tr>
										<th>보증보험</th>
										<th>진행상태</th>
										<th>증권발행일자</th>
										<th>보험료</th>
									</tr>
								</thead>
								<c:set var = "gSum" value = "0" />
								<c:forEach var="result" items="${guarantyList}" varStatus="status">
									<tr>
										<td>${result.gbKindCd}</td>
										<td>
											<c:choose>
												<c:when test="${result.gbIssueStatus eq  'I'}">
													발행 준비
												</c:when>
												<c:when test="${biddingVO.bdGbFinishYn eq  'R'}">
													발행 요청
												</c:when>
												<c:otherwise>
													발행 완료
												</c:otherwise>
											</c:choose>
										</td>
										<td>${displayUtil.displayDate(result.gbPublishDt)}</td>
										<td class="textalignR">${displayUtil.commaStr(result.gbAmount) }</td>
										<c:set var= "gSum" value="${gSum + result.gbAmount}"/>
									</tr>
								</c:forEach>
								<c:if test="${biddingVO.bdGbYn eq 'Y' }"> 
									<tr>
										<td>입찰</td>
										<td>
											<c:choose>
												<c:when test="${biddingVO.bdGbFinishYn eq  'N'}">
													발행 전
												</c:when>
												<c:when test="${biddingVO.bdGbFinishYn eq  'R'}">
													발행 요청
												</c:when>
												<c:otherwise>
													발행 완료
												</c:otherwise>
											</c:choose>
										</td>
										<td>${displayUtil.displayDate(biddingVO.bdGbFinishDt)}</td>
										<td class="textalignR">${displayUtil.commaStr(biddingVO.bdGbAmount) }</td>
										<c:set var= "gSum" value="${gSum + biddingVO.bdGbAmount}"/>
									</tr>
								</c:if> 
								<tr></tr>
							</table>
						</div>
					</div>
					<div class="floatR">
						<div class="stitle">
							이익
						</div>
						<div class="">
							<table class="dtl" style="width: 637px;">
								<thead>
									<tr>
										<th>구분</th>
										<th>금액</th>
									</tr>
								</thead>
								<tr>
									<td>매출총이익</td>
									<td class="textalignR"><input type="text" value="${displayUtil.commaStr(salesTotalAmount - purchaseTotalAmount) } 원" readonly /></td>									
								</tr>
								<tr>
									<td>영업이익</td>
									<td class="textalignR"><input type="text" value="${displayUtil.commaStr(salesTotalAmount - purchaseTotalAmount - gSum ) } 원" readonly /> </td>									
								</tr>
								
								<tr>
									<td>마진율</td>
									<td class="textalignR"><input type="text" value="${(salesTotalAmount-purchaseTotalAmount) / salesTotalAmount * 100 } %" readonly /></td>									
								</tr>
								<tr></tr>
							</table>
						</div>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="btnWrap rt floatR">
					<%-- <div>
						<button value="Excel"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div> --%>
				</div>
			</div>
		</div>	
	</form>
</body>
</html>