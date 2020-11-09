<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../cmm/inc.jsp" %>
<%@include file="../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>CEP 샘플 화면(프로젝트 상세보기)</title>
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
			box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);
			height: 830px;
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
		form .contents > div:nth-child(2) > div:first-child table tbody tr:last-child td {
			background-color: #ecf6f4;
			font-weight: 400;
			color: #21a17e;
			border: none;
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
	</style>
	<script>
	</script>
</head>
<body>
	<form id="listForm" name="listForm" method="post">
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="">
					<div class="title"><label class="ftw500">판매품의서</label></div>
					<div>
						<div class="stitle cg">기본정보</div>
						<div id="basicForm">
							<table class="bsc" style="width: 100%;">
								<tr>
									<td>프로젝트명</td>
									<td>VDI중요단말 환경구축 및 노후장비 교체</td>
									<td>계약일자</td>
									<td>2020-12-12</td>
									<td>영업담당자</td>
									<td>홍길동</td>
								</tr>
								<tr>
									<td>고객사</td>
									<td>미래에셋생명 / 담당자 : 홍길동</td>
									<td>검수일자</td>
									<td>2020-12-12</td>
									<td>비고</td>
									<td>비고 내용</td>
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
							<table class="dtl" style="width: 100%;">
								<thead>
									<tr>
										<th>계산서 일자</th>
										<th>매출처</th>
										<th>매출구분</th>
										<th>매출제조사</th>
										<th>제품</th>
										<th>단가</th>
										<th>수량</th>
										<th>합계</th>
										<th>수금일자</th>
									</tr>
								</thead>
								<tr>
									<td>2018-12-12</td>
									<td>미래에셋생명</td>
									<td>하드웨어</td>
									<td>Dell Tech</td>
									<td>MX4000</td>
									<td class="textalignR">000.000.000</td>
									<td>1</td>
									<td class="textalignR">000.000.000</td>
									<td>2018-12-12</td>
								</tr>
								<tr>
									<td>2018-12-12</td>
									<td>미래에셋생명</td>
									<td>하드웨어</td>
									<td>Dell Tech</td>
									<td>MX4000</td>
									<td class="textalignR">000.000.000</td>
									<td>1</td>
									<td class="textalignR">000.000.000</td>
									<td>2018-12-12</td>
								</tr>
								<tr>
									<td colspan="7" class="textalignR">매출액 합계</td>
									<td class="textalignR">000.000.000</td>
									<td></td>
								</tr>
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
										<th>발행여부</th>
										<th>증권발행일자</th>
										<th>보험료</th>
									</tr>
								</thead>
								<tr>
									<td>선급금</td>
									<td>Y</td>
									<td>2020-12-12</td>
									<td class="textalignR">000.000.000</td>
								</tr>
								<tr>
									<td>선급금</td>
									<td>Y</td>
									<td>2020-12-12</td>
									<td class="textalignR">000.000.000</td>
								</tr>
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
										<th>영업이익</th>
										<th>매출총이익</th>
										<th>마진율</th>
									</tr>
								</thead>
								<tr>
									<td class="textalignR">000.000.000</td>
									<td class="textalignR">000.000.000</td>
									<td>00%</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="btnWrap rt">
					<div class="floatR">
						<button value="Excel"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div>
				</div>
			</div>
		</div>	
	</form>
</body>
</html>