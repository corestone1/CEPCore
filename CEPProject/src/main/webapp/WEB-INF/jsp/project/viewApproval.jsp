<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<%@include file="/WEB-INF/jsp/cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>판매품의서</title>
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
			font-weight: 200;
		}
		form .contents .bsc tr td .oftext {
		    width: 400px;
		    overflow: hidden;
		    height: 39px;
		    text-overflow: ellipsis;
		    white-space: normal;
		    line-height: 1.4;
		    text-align: left;
		    word-wrap: break-word;
		    display: -webkit-box;
		    -webkit-line-clamp: 2;
		    -webkit-box-orient: vertical;
		}
		form .contents .dtl tbody tr:last-child td {
			background-color: #ecf6f4;
			font-weight: 400;
			color: #21a17e;
		}
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
	</style>
	<script>
		function fn_detail() {
			form = document.moveForm;
			form.workClass.value = "입찰_첨부파일";
			form.action = "<c:url value='/project/detail/main.do'/>";
			
			form.submit(); 
		}
	</script>
</head>
<body>
	<form id="listForm" name="listForm" method="post">
		<!-- <div class="sfcnt"></div>
		<div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="">
					<div class="title floatL"><label class="ftw500">판매품의서</label></div>
					<div class="floatR dpBlock fxd">
						<div class="floatR backWrap cursorP">
							<a onclick="fn_detail();"><img src="/images/btn_todetail.png" /></a>
						</div>
						<div class="floatC"></div>
					</div>
					<div class="floatC"></div>
					<div>
						<div class="stitle cg">기본정보</div>
						<div id="basicForm">
							<table class="bsc excelSheet" style="width: 100%;">
								<tr>
									<td>프로젝트명</td>
									<td><span class="oftext">${pjInfo[0].pjNm }</span></td>
									<td>계약일자</td>
									<td>${displayUtil.displayDate(pjInfo[0].ctDt) }</td>
									<td>영업담당자</td>
									<td>${pjInfo[0].empNm }</td>
								</tr>
								<tr>
									<td>고객사</td>
									<td>${pjInfo[0].acNm } / 담당자: ${pjInfo[0].acDirectorNm }</td>
									<td>검수일자</td>
									<td>${displayUtil.displayDate(pjInfo[0].pjInspectDt) }</td>
									<td>비고</td>
									<td>${pjInfo[0].remark }</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div>
					<div>
						<div class="stitle">
							매출 정보
						</div>
						<div class="">
							<table class="dtl excelSheet" style="width: 100%;">
								<thead>
									<tr>
										<th>매출처</th>
										<th>매출 회차</th>
										<th>매출구분</th>
										<th>제조사</th>
										<th>수금 예상 일자</th>
										<th>수금 완료 일자</th>
										<th>수금 비율</th>
										<th>금액</th>
									</tr>
								</thead>
								<c:set var = "sSum" value = "0" />
								<c:forEach var="result" items="${salesList}" varStatus="status">
									<tr>
										<td>${result.acNm }</td>
										<td>${result.salesTurn }</td>
										<td>${contractVO.billSalesCd }</td>
										<td>${contractVO.billMfCd }</td>
										<td>${displayUtil.displayDate(result.salesCollectFcDt) }</td>
										<td>${displayUtil.displayDate(result.salesCollectFinishDt) }</td>
										<td>${result.salesCollectRate }%</td>
										<td class="textalignR">${displayUtil.commaStr(result.salesTurnAmount) }</td>
									</tr>
									<c:set var= "sSum" value="${sSum + result.salesTurnAmount}"/>
								</c:forEach>
								<tr>
									<td colspan="7" class="textalignR">매출액 합계</td>
									<td class="textalignR">${displayUtil.commaStr(sSum)}</td>
								</tr> 
							</table>
						</div>
					</div>
					<div>
						<div class="stitle">
							매입 정보
						</div>
						<div class="">
							<table class="dtl excelSheet" style="width: 100%;">
								<thead>
									<tr>
										<th width="80px">계산서 매핑</th>
										<th>계산서 발행일자</th>
										<th>매입처</th>
										<th>지급 예상 일자</th>
										<th>지급 일자</th>
										<th>매입구분</th>
										<th>제조사</th>
										<th>매입제품 / 단가 / 수량</th>
										<th>합계</th>
									</tr>
								</thead>
								<c:set var = "pSum" value = "0" />
								<c:forEach var="result" items="${purchaseList}" varStatus="status">
									<tr>
										<td width="80px">${result.billMappingYn}</td>
										<td>${result.billIssueDt }</td>
										<td>${result.acNm }</td>
										<td>${result.paymentCallDt }</td>
										<td>${result.paymentDt }</td>
										<td>${result.billPurchaseCd }</td>
										<td>${result.billMfCd }</td>
										<td>
											${result.orderProduct }
										</td>
										<td class="textalignR">${displayUtil.commaStr(result.orderSum) }</td>
									</tr>
									<c:set var= "pSum" value="${pSum + result.orderSum}"/>
								</c:forEach>
								<tr>
									<td colspan="8" class="textalignR">매입액 합계</td>
									<td class="textalignR">${displayUtil.commaStr(pSum)}</td>
								</tr> 
							</table>
						</div>
					</div>
					<div class="floatL">
						<div class="stitle">
							보증 보험 정보
						</div>
						<div class="">
							<table class="dtl excelSheet" style="width: 983px;">
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
										<td class="textalignR">${displayUtil.commaStr(biddingVO.bdGbBdAmount) }</td>
										<c:set var= "gSum" value="${gSum + biddingVO.bdGbBdAmount}"/>
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
							<table class="dtl excelSheet" style="width: 637px;">
								<thead>
									<tr>
										<th>영업이익</th>
										<th>매출총이익</th>
										<th>마진율</th>
									</tr>
								</thead>
								<tr>
									<td class="textalignR"><c:out value="${displayUtil.commaStr(sSum - pSum - gSum) }"  /></td>
									<td class="textalignR"><c:out value="${displayUtil.commaStr(sSum - pSum) }" /></td>
									<td><c:out value="${(sSum-pSum) / sSum * 100 }%" /></td>
								</tr>
								<tr></tr>
							</table>
						</div>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="btnWrap rt floatR">
					<div>
						<button type="button" value="엑셀 다운로드" id="excelExport"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div>
				</div> 
			</div>
		</div>	
	</form>
	<form id="moveForm" name="moveForm">
		<input type="hidden" id="pjKey" name="pjKey" value="${pjInfo[0].pjKey }"/>
		<input type="hidden" id="workClass" name="workClass" value=""/>
	</form>
</body>
</html>