<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<%@include file="/WEB-INF/jsp/cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>계산서 발행 정보</title>
	<style>
		.fl {
			float: left;
		}
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
		.listForm .nav {
			width: 100%;
			height: 49px;
		}
		.listForm .contentsWrap {
			background-color: #f6f7fc;
			box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);
			height: 802px;
		}
		.listForm .contentsWrap .contents {
			padding: 38px 71px; 
			width: 1662px;
		}
		.listForm .title {
			height: 50px;
		}
		.listForm .title > label {
			font-size: 26px;
		}
		.listForm .contents > div:first-child {
			width: 37%;
		}
		.listForm .contents > div:nth-child(2) {
			margin-top: 51px;
		}
		.listForm .contents > .fxd {
			width: 60%;
		}
		.listForm .contents .stitle {
			font-size: 18px;
			font-weight: 500;
			margin-bottom: 10px;
			margin-top: 30px;
		}
		.listForm .contents .cg {
			color: #24a37e;
		}
		.listForm .contents > div > div > div > form > table {
			border-collapse: collapse;
			font-size: 14px;
			border-bottom: 2px solid #c4c4c4;
			table-layout: fixed;
		} 
		.listForm .contents > div > div > div > form > table tr td {
			padding: 13px 20px;
		}
		.listForm .contents > div > div > div > form > table tr td:first-child {
			width: 130px;
			font-weight: 400;
		} 
		.listForm .contents > div > div > div > form > table tr td:last-child {
			width: 400px;
			font-weight: 200;
		}
		.listForm .contents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			border: 1px solid #bee2da;
		}
		.listForm .contents .bsc tbody {
			border-bottom: 2px solid #bfe3db;
			height: 580px;
		}
		.listForm .contents .bsc tr td {
			color: #0e8a67;
		}
		.listForm .contents .bsc tr td:first-child {
			box-shadow: inset -7px 0 9px -4px #d0e2de;
		}
		.listForm .contents > .fxd .title ul li,
		.listForm .contents > .fxd .stitle ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		}
		.listForm .contents > .fxd .title ul li:last-child,
		.listForm .contents > .fxd .stitle ul li:last-child {
			clear: both;
			float: none;
			width: 0 !important;
		}
		.listForm .contents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
		}
		.listForm .contents > .fxd .title ul li {
			width: 20%;
			line-height: 46px;
			/* color: #b1a5ec; */
			color: #777777;
			background-color: #d3d3d3;
		}
		.liArrow {
			background-image: url('/images/step_arrow.png');
			background-repeat: no-repeat;
		}
		.listForm .contents > .fxd .title ul li:first-child {
			border-radius: 35px 0 0 35px;
		}
		.listForm .contents > .fxd .title ul li:nth-last-child(2)  {
			border-radius: 0 35px 35px 0;
		}
		.listForm .contents > .fxd .title ul li.on  {
			color: #fff  !important;
			background-color: #4c3d92;
		}
		#detailForm .stitle {
			margin-bottom: 0;
		}
		#detailForm .stitle ul {
			width: 100%;
		}
		#detailForm .stitle ul li {
			width: 50%;
		}
		#detailForm .stitle ul li a {
			color: #a3a3a4;
			padding-bottom: 10px;
			border-bottom: 4px solid #a3a3a4;
			display: block;
		}
		#detailForm .stitle ul li a:hover {
			color: #000;
			border-bottom: 4px solid #6a5bae;
		}
		#detailForm .stitle ul li a.on {
			color: #000;
			border-bottom: 4px solid #6a5bae;
		}
		.listForm .contents .dtl {
			overflow: hidden;
		}
		.listForm .contents .dtl tbody {
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			height: 418px;
		}
		.listForm .contents .dtl tbody tr {
			border: 1px solid #ebe9ee;
		}
		.listForm .contents .dtl td {
			color: #000;
		}
		.listForm .contents .dtl tr td {
			padding: 6px 20px;
			min-height: 48px;
		}
		.listForm .contents .dtl tr td:first-child {
			background-color: #e1dff5;
			border-right: 1px solid #ebe9ee;
			color: #535353;
		}
		.listForm .contents .dtl tr td:last-child {
			width: 784px;
		}
		.listForm .contents .dtl p {
			height: 34px;
			display: block;
			line-height: 34px;
		}
		.listForm .contents .dtl .tclabel {
			margin: 0 3px 0 10px;
		}
		#info2 tbody {
			height: 540px;
		}
		#info2 tr th,
		#info2 tr td {
			padding: 10px;
			text-align: center;
			border-right: 1px solid #edecef;
		} 
		#info2 tr th {
			font-weight: 400;
			color: #535353;
			background-color: #e1dff5;
		}
		#info2 tr td {
			font-weight: 200;
			width: auto;
		}
		#info2 tr td:first-child {
			background-color: #fff;
		}
		#info2 tr td:first-child,
		#info2 tr td:first-child span {
			width: 40px;
		}
		#info2 tr td:nth-child(2),
		#info2 tr td:nth-child(9),
		#info2 tr td:nth-child(2) span,
		#info2 tr td:nth-child(9) span {
			width: 60px;
		}
		#info2 tr td:nth-child(3),
		#info2 tr td:nth-child(3) span {
			width: 195px;
		}
		#info2 tr td:nth-child(4),
		#info2 tr td:nth-child(6),
		#info2 tr td:nth-child(7),
		#info2 tr td:nth-child(4) span,
		#info2 tr td:nth-child(6) span,
		#info2 tr td:nth-child(7) span {
			width: 82px;
		}
		#info2 tr td:nth-child(8),
		#info2 tr td:nth-child(8) span {
			width: 20px;
		}
		#info2 tr td:nth-child(5),
		#info2 tr td:nth-child(10),
		#info2 tr td:nth-child(5) span,
		#info2 tr td:nth-child(10) span {
			width: 74px;
		}
		#info2 tr td span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
		}
		input[type="text"] {
		 	width: 191px;
		    height: 34px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
		}
		input[class="calendar"] {
		    background-image: url(/images/calendar_icon.png);
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		select {
			height: 37px;
		    width: 213px;
		    border: 1px solid #e9e9e9;
		    padding: 0 10px;
		    -webkit-appearance: none;
		    background: url(/images/arrow_down.png) no-repeat 91% 50%;
		    background-color: #fff;
		    color: #535353;
		}
		textarea {
			border: 1px solid #e6e6e6;
			padding: 0 10px;
		}
		select.nrslct {
			width: 100px !important;
		}
		.listForm .contents .dtl label.title {
			margin: 0 8px 0 20px;
		}
		label.radio {
		   overflow: hidden;
		   position: relative;
		   height: 26px;
		   box-sizing: border-box;
		   cursor: pointer;
		   margin-right: 17px;
		}
		label.radio input[type='radio'] {
			-webkit-appearance: none;
			width: 26px;
			height: 26px;
			border: 1px solid #e6e6e6;
			border-radius: 50%;
			outline: none;
			background: #e6e6e6;
			margin: 0 15px 0 0;
		}
		label.radio input[type='radio']:before {
			content:'';
			display: block;
			width: 60%;
			height: 60%;
			margin: 20% auto;  
			border-radius: 50%;  
		}
		label.radio input[type='radio']:checked {
			background: #7764cb;
		}
		label.radio input[type='radio']:checked:before {
		  	content: "\2713";
			color: #fff;
			line-height: 1.2;
			text-align: center;
		}
		input[class="calendar"] {
			width: 191px;
		}
		input[class="search"] {
			width: 191px;
			height: 38px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		textarea {
			width: calc(100% - 20px);
			height: 150px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}
		#info1 textarea {
			height: 200px;
		}
		select {
			width: 310px;
		}
		.listForm .contents .dtl tr td:first-child label {
			color: red;
			vertical-align: middle;
		}
	</style>
	<script>
		$(document).ready(function() {			
			
			//var newUrl = "/mngMaint/bill/detail/billForm.do?pjKey=${basicInfo.mtKey}&acKey=${basicInfo.mtAcKey}&billTurnNo=${basicInfo.proceedTurn}&totalTurn=${basicInfo.totalTurn}";
			
			//$("iframe").attr("src", newUrl);
		});
		
		/* function changeIframUrl(newUrl) {
			$("iframe").attr("src", newUrl);
		} */
		
		
		function goDetailInfo(mtKey) {
			if(confirm("유지보수계약 상세화면으로 이동하시겠습니까?")){
				window.location.href = "/maintenance/contract/detail/productInfo.do?mtIntegrateKey="+mtKey;
			}
			
		}
	</script>
</head>
<body>
	<div id="listForm" class="listForm">
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="floatL">
					<div class="title"><label class="ftw500">계산서 발행요청</label></div>
					<div>
						<div class="stitle cg">기본정보</div>
						<div id="basicForm">
							<form>
								<table class="bsc" id="selectBasicTable">
									<tr>
										<td>고객사</td>
										<td>
											<label><c:out value="${basicInfo.acNm}"/></label>
										</td>
									</tr>
									<tr>
										<td>프로젝트명</td>
										<td>
											<label><c:out value="${basicInfo.mtNm}"/></label>
										</td>
									</tr>
									<tr>
										<td>영업담당자</td>
										<td>
											<label><c:out value="${basicInfo.mtSaleEmpNm}"/></label>
										</td>
									</tr>
									<tr>
										<td>부가세여부</td>
										<td>
											<label><c:out value="${displayUtil.commaStr(basicInfo.taxYn)}"/></label>
										</td>
									</tr>
									<tr>
										<td>계약금액</td>
										<td>
											<label><c:out value="${displayUtil.commaStr(basicInfo.mtAmount)}"/>원</label>
										</td>
									</tr>
									<tr>
										<td>수금계획금액</td>
										<td>
											<label><c:out value="${displayUtil.commaStr(basicInfo.totalTurnAmount)}"/>원</label>
										</td>
									</tr>
									<tr>
										<td>기간</td>
										<td>
											<label><c:out value="${displayUtil.displayDate(basicInfo.mtStartDt)}"/></label>
											<label> ~ <c:out value="${displayUtil.displayDate(basicInfo.mtEndDt)}"/></label>
										</td>
									</tr>
									<tr>
										<td>수금계획</td>
										<td>
											<label><c:out value="${basicInfo.totalTurn}"/> 회</label>
											<%-- <label>(<c:out value="${basicInfo.collectPlan}"/>)</label> --%>
										</td>
									</tr>
									<tr>
										<td>기수금액</td>
										<td>
											<label><c:out value="${displayUtil.commaStr(basicInfo.completedAmount)}"/>원</label>
										</td>
									</tr>
									<tr>
										<td>미수금액</td>
										<td>
											<label><c:out value="${displayUtil.commaStr(basicInfo.receivableAmount)}"/>원</label>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
					<div class="floatL" style="margin-top: 21px">
							<button type="button" title="기본정보수정" value="수정" onclick="goDetailInfo('<c:out value="${basicInfo.mtKey}"/>')"><img class="cursorP" src="<c:url value='/images/btn_basic_mod.png'/>" /></button>
						</div>
				</div>
				<div class="floatR dpBlock fxd">
					<iframe src="/mngMaint/bill/detail/billForm.do?pjKey=${basicInfo.mtKey}&acKey=${basicInfo.mtAcKey}&billTurnNo=${basicInfo.proceedTurn}&totalTurn=${basicInfo.totalTurn}" width="100%" height="710"></iframe>
				</div>
				<div class="floatC"></div>
			</div>
		</div>	
	</div>
</body>
</html>