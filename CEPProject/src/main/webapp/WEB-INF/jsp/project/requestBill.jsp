<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../cmm/inc.jsp" %>
<%@include file="../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>CEP 샘플 화면(프로젝트 상세보기)</title>
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
		form .contents > div:first-child {
			width: 37%;
		}
		form .contents > div:nth-child(2) {
			margin-top: 51px;
		}
		form .contents > .fxd {
			width: 60%;
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
			font-size: 14px;
			border-bottom: 2px solid #c4c4c4;
		} 
		form .contents > div > div > div > table tr td {
			padding: 13px 20px;
		}
		form .contents > div > div > div > table tr td:first-child {
			width: 130px;
			font-weight: 400;
		} 
		form .contents > div > div > div > table tr td:last-child {
			width: 400px;
			font-weight: 200;
		}
		form .contents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			border: 1px solid #bee2da;
		}
		form .contents .bsc tr td {
			color: #0e8a67;
		}
		form .contents .bsc tr td:first-child {
			box-shadow: inset -7px 0 9px -4px #d0e2de;
		}
		form .contents > .fxd .title ul li,
		form .contents > .fxd .stitle ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		}
		form .contents > .fxd .title ul li:last-child,
		form .contents > .fxd .stitle ul li:last-child {
			clear: both;
			float: none;
			width: 0 !important;
		}
		form .contents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
		}
		form .contents > .fxd .title ul li {
			width: 20%;
			line-height: 46px;
			/* color: #b1a5ec; */
			color: #777777;
			background-color: #d3d3d3;
		}
		.liArrow {
			background-image: url('./images/step_arrow.png');
			background-repeat: no-repeat;
		}
		form .contents > .fxd .title ul li:first-child {
			border-radius: 35px 0 0 35px;
		}
		form .contents > .fxd .title ul li:nth-last-child(2)  {
			border-radius: 0 35px 35px 0;
		}
		form .contents > .fxd .title ul li.on  {
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
		form .contents .dtl {
			overflow: hidden;
		}
		form .contents .dtl tbody {
			overflow-y: auto;
			overflow-x: hidden;
			height: 547px;
			float: left;
		}
		form .contents .dtl tbody tr {
			border: 1px solid #ebe9ee;
		}
		form .contents .dtl td {
			color: #000;
		}
		#reqInfo tr td {
			padding: 6px 20px;
			min-height: 48px;
		}
		#reqInfo tr td:first-child {
			background-color: #e1dff5;
			border-right: 1px solid #ebe9ee;
			color: #535353;
		}
		#reqInfo tr:nth-child(8) td:first-child,
		#reqInfo tr:last-child td:first-child {
			background-color: #dddddd;
		}
		#reqInfo tr td:last-child {
			width: 784px;
		}
		#reqInfo p {
			height: 34px;
			display: block;
			line-height: 34px;
		}
		#exsitingInfo tr th,
		#exsitingInfo tr td {
			padding: 10px 18px;
			text-align: center;
			border-right: 1px solid #edecef;
		} 
		#exsitingInfo tr th {
			font-weight: 400;
			color: #535353;
			background-color: #e1dff5;
		}
		#exsitingInfo tr td {
			font-weight: 200;
			width: auto;
		}
		#exsitingInfo tr th:first-child,
		#exsitingInfo tr th:nth-child(2),
		#exsitingInfo tr th:nth-child(7) {
			width: 60px;
		}
		#exsitingInfo tr th:nth-child(3) {
			width: 150px;
		}
		#exsitingInfo tr th:nth-child(4),
		#exsitingInfo tr th:nth-child(5),
		#exsitingInfo tr th:nth-child(6),
		#exsitingInfo tr th:nth-child(8) {
			width: 100px;
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
		    background-image: url(./images/calendar_icon.png);
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		select {
			height: 37px;
		    width: 213px;
		    border: 1px solid #e9e9e9;
		    padding: 0 10px;
		    -webkit-appearance: none;
		    background: url(./images/arrow_down.png) no-repeat 91% 50%;
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
		form .contents .dtl label.title {
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
			background-image: url('./images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		textarea {
			width: calc(100% - 20px);
			height: 160px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}
		
	</style>
	<script>
		$(document).ready(function() {
			$('#infoList li:first-child').click(function() {
				$('#reqInfo').removeClass('dpNone');
				$('#reqInfo').addClass('dpBlock');
				$('#exsitingInfo').removeClass('dpBlock');
				$('#exsitingInfo').addClass('dpNone');
				
				$(this).children().eq(0).addClass('on');
				$('#infoList li:nth-child(2) > a').removeClass('on');
			});
			
			$('#infoList li:nth-child(2)').click(function() {
				$('#reqInfo').removeClass('dpBlock');
				$('#reqInfo').addClass('dpNone');
				$('#exsitingInfo').removeClass('dpNone');
				$('#exsitingInfo').addClass('dpBlock');
				
				$(this).children().eq(0).addClass('on');
				$('#infoList li:first-child > a').removeClass('on');
			});
		});
		
		function fn_req(attr) {
			var value = attr.value;
			var result = confirm(value + ' 처리 하시겠습니까?'); 
			if(result) {
				alert('완료되었습니다.');
				location.href = "/projectDetailBd.do";
			} 
		}
	</script>
</head>
<body>
	<form id="listForm" name="listForm" method="post">
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="floatL">
					<div class="title"><label class="ftw500">계산서 발행요청</label></div>
					<div>
						<div class="stitle cg">기본정보</div>
						<div id="basicForm">
							<table class="bsc" id="selectBasicTable">
								<tr>
									<td>고객사</td>
									<td>KB손해보험</td>
								</tr>
								<tr>
									<td>프로젝트명</td>
									<td>EDMS 이미지 암호화</td>
								</tr>
								<tr>
									<td>계약금액</td>
									<td>2,000,000,000 원(부가세 별도)</td>
								</tr>
								<tr>
									<td>기간</td>
									<td>2017.06 ~ 2017.09</td>
								</tr>
								<tr>
									<td>수금계획</td>
									<td>1회차 : 30%&nbsp;&nbsp;2회차 : 30%&nbsp;&nbsp;3회차 : 40%</td>
								</tr>
								<tr>
									<td>기수금액</td>
									<td>600,000,000 원</td>
								</tr>
								<tr>
									<td>미수금액</td>
									<td>1,400,000,000 원</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="floatR dpBlock fxd">
					<div id="detailForm">
						<div class="stitle">
							<ul id="infoList">
								<li><a class="on">계산서 요청 정보</a></li>
								<li><a>기존 계산서 정보</a></li>
								<li></li>
							</ul>
						</div>
						<div class="floatC">
							<table class="dtl" id="reqInfo">
								<tr>
									<td>금번회차</td>
									<td>
										<select>
											<option>2회차</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>금액</td>	
									<td>
										<input type="text" />
									</td>
								</tr>
								<tr>
									<td>담당자성명</td>
									<td><input type="text" class="search" /></td>
								</tr>
								<tr>
									<td>연락처</td>
									<td><input type="text" /></td>
								</tr>
								<tr>
									<td>발행일</td>
									<td><input class="calendar" type="text" /></td>
								</tr>
								<tr>
									<td>발행이메일</td>
									<td><input type="text" /></td>
								</tr>
								<tr>
									<td>요청사항</td>
									<td><textarea></textarea></td>
								</tr>
								<tr>
									<td>계산서번호</td>
									<td><p>20131289878909</p></td>
								</tr>
								<tr>
									<td>발행일자</td>
									<td><p>2020-12-12</p></td>
								</tr>
							</table>
							<table class="dtl dpNone textalignC" id="exsitingInfo">
								<tr>
									<th>No</th>
									<th>구분</th>
									<th>계산서번호</th>
									<th>계산서발행일</th>
									<th>금액</th>
									<th>세액</th>
									<th>담당자</th>
									<th>수금완료</th>
								</tr>
								<tr>
									<td>1</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td><button type="button"><img src="<c:url value='/images/btn_end_col.png'/>" /></button></td>
								</tr>
								<tr>
									<td>2</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
								<tr>
									<td>3</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
								<tr>
									<td>4</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
								<tr>
									<td>5</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
								<tr>
									<td>6</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
								<tr>
									<td>7</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
								<tr>
									<td>8</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
								<tr>
									<td>9</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
								<tr>
									<td>10</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
								<tr>
									<td>11</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
								<tr>
									<td>12</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
								<tr>
									<td>13</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
								<tr>
									<td>14</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
								<tr>
									<td>15</td>	
									<td>1회차</td>
									<td>2020010341000026zzz0h1sj</td>
									<td>2020-12-12</td>
									<td>600,000,000</td>
									<td>600,000,000</td>
									<td>권용남</td>
									<td>2020-12-12</td>
								</tr>
							</table>
						</div>
						<div class="btnWrap rt">
							<div class="floatR">
								<button type="button" id="req" value="계산서 발행 요청" onclick="fn_req(this);"><img class="cursorP" src="<c:url value='/images/btn_req_bill.png'/>" /></button>
								<button type="button" id="end" value="발행 완료" onclick="fn_req(this);"><img class="cursorP" src="<c:url value='/images/btn_end_bill.png'/>" /></button>
							</div>
						</div>
					</div>
				</div>
				<div class="floatC"></div>
			</div>
		</div>	
	</form>
</body>
</html>