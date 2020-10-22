<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>CEP 샘플 화면(forecast list)</title>
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
			background: url('http://172.10.122.10:8888/images/arrow_down.png') no-repeat 91% 50%;
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
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 50px;
			max-width: 50px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 100px;
			max-width: 100px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 200px;
			max-width: 200px;
		}
		.middle table tbody tr td:nth-child(4) {
			font-weight: 400;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 150px;
			max-width: 150px;
		}
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6) {
			width: 120px;
			max-width: 120px;
		}
		.middle table thead th:nth-child(7),
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(7),
		.middle table tbody td:nth-child(8),
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9) {
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
		    background-image: url('http://172.10.122.10:8888/images/calendar_icon.png');
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		input[class="search"] {
			width: 150px;
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
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">발주 - 계산서 매핑</label></div>
						<%-- <div class="addBtn floatL cursorP" onclick="javascript:fn_addView('writeBasic')"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>
					</div>
					<div class="floatR">
						<select>
							<option value="">담당자</option>
						</select>
						<input type="text" class="calendar" placeholder="from"/><label> ~ </label><input type="text" class="calendar" placeholder="to"/>
						<input type="text" class="search" placeholder="사업자번호" />
						<input type="text" class="search" placeholder="거래처상호" />
						<span><img src="<c:url value='/images/icon_search.png'/>" /></span>
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
								<th scope="row">프로젝트명</th>
								<th scope="row">제품</th>
								<th scope="row">거래처 상호</th>
								<th scope="row">사업자번호</th>
								<th scope="row">합계</th>
								<th scope="row">담당자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>2018-12-12</td>
								<td>N</td>
								<td><span title="기간계 응답속도 개선을 위한 인프라 교체">기간계 응답속도 개선을 위한 인프라 교체</span></td>
								<td><span title="VMAX250F">VMAX250F</span></td>
								<td><span title="DB Inc.">DB Inc.</span></td>
								<td><span>555-66-88888</span></td>
								<td><span title="100,000,000">100,000,000</span></td>
								<td><span>홍길동</span></td>
							</tr>
							<tr>
								<td>2</td>
								<td>2018-12-12</td>
								<td>N</td>
								<td><span title="기간계 응답속도 개선을 위한 인프라 교체">기간계 응답속도 개선을 위한 인프라 교체</span></td>
								<td><span title="VMAX250F">VMAX250F</span></td>
								<td><span title="DB Inc.">DB Inc.</span></td>
								<td><span>555-66-88888</span></td>
								<td><span title="100,000,000">100,000,000</span></td>
								<td><span>홍길동</span></td>
							</tr>
							<tr>
								<td>3</td>
								<td>2018-12-12</td>
								<td>N</td>
								<td><span title="기간계 응답속도 개선을 위한 인프라 교체">기간계 응답속도 개선을 위한 인프라 교체</span></td>
								<td><span title="VMAX250F">VMAX250F</span></td>
								<td><span title="DB Inc.">DB Inc.</span></td>
								<td><span>555-66-88888</span></td>
								<td><span title="100,000,000">100,000,000</span></td>
								<td><span>홍길동</span></td>
							</tr>
							<tr>
								<td>4</td>
								<td>2018-12-12</td>
								<td>N</td>
								<td><span title="기간계 응답속도 개선을 위한 인프라 교체">기간계 응답속도 개선을 위한 인프라 교체</span></td>
								<td><span title="VMAX250F">VMAX250F</span></td>
								<td><span title="DB Inc.">DB Inc.</span></td>
								<td><span>555-66-88888</span></td>
								<td><span title="100,000,000">100,000,000</span></td>
								<td><span>홍길동</span></td>
							</tr>
							<tr>
								<td>5</td>
								<td>2018-12-12</td>
								<td>N</td>
								<td><span title="기간계 응답속도 개선을 위한 인프라 교체">기간계 응답속도 개선을 위한 인프라 교체</span></td>
								<td><span title="VMAX250F">VMAX250F</span></td>
								<td><span title="DB Inc.">DB Inc.</span></td>
								<td><span>555-66-88888</span></td>
								<td><span title="100,000,000">100,000,000</span></td>
								<td><span>홍길동</span></td>
							</tr>
							<tr>
								<td>6</td>
								<td>2018-12-12</td>
								<td>N</td>
								<td><span title="기간계 응답속도 개선을 위한 인프라 교체">기간계 응답속도 개선을 위한 인프라 교체</span></td>
								<td><span title="VMAX250F">VMAX250F</span></td>
								<td><span title="DB Inc.">DB Inc.</span></td>
								<td><span>555-66-88888</span></td>
								<td><span title="100,000,000">100,000,000</span></td>
								<td><span>홍길동</span></td>
							</tr>
							<tr>
								<td>7</td>
								<td>2018-12-12</td>
								<td>N</td>
								<td><span title="기간계 응답속도 개선을 위한 인프라 교체">기간계 응답속도 개선을 위한 인프라 교체</span></td>
								<td><span title="VMAX250F">VMAX250F</span></td>
								<td><span title="DB Inc.">DB Inc.</span></td>
								<td><span>555-66-88888</span></td>
								<td><span title="100,000,000">100,000,000</span></td>
								<td><span>홍길동</span></td>
							</tr>
							<tr>
								<td>8</td>
								<td>2018-12-12</td>
								<td>N</td>
								<td><span title="기간계 응답속도 개선을 위한 인프라 교체">기간계 응답속도 개선을 위한 인프라 교체</span></td>
								<td><span title="VMAX250F">VMAX250F</span></td>
								<td><span title="DB Inc.">DB Inc.</span></td>
								<td><span>555-66-88888</span></td>
								<td><span title="100,000,000">100,000,000</span></td>
								<td><span>홍길동</span></td>
							</tr>
							<tr>
								<td>9</td>
								<td>2018-12-12</td>
								<td>N</td>
								<td><span title="기간계 응답속도 개선을 위한 인프라 교체">기간계 응답속도 개선을 위한 인프라 교체</span></td>
								<td><span title="VMAX250F">VMAX250F</span></td>
								<td><span title="DB Inc.">DB Inc.</span></td>
								<td><span>555-66-88888</span></td>
								<td><span title="100,000,000">100,000,000</span></td>
								<td><span>홍길동</span></td>
							</tr>
							<tr>
								<td>10</td>
								<td>2018-12-12</td>
								<td>N</td>
								<td><span title="기간계 응답속도 개선을 위한 인프라 교체">기간계 응답속도 개선을 위한 인프라 교체</span></td>
								<td><span title="VMAX250F">VMAX250F</span></td>
								<td><span title="DB Inc.">DB Inc.</span></td>
								<td><span>555-66-88888</span></td>
								<td><span title="100,000,000">100,000,000</span></td>
								<td><span>홍길동</span></td>
							</tr>
							<tr>
								<td>11</td>
								<td>2018-12-12</td>
								<td>N</td>
								<td><span title="기간계 응답속도 개선을 위한 인프라 교체">기간계 응답속도 개선을 위한 인프라 교체</span></td>
								<td><span title="VMAX250F">VMAX250F</span></td>
								<td><span title="DB Inc.">DB Inc.</span></td>
								<td><span>555-66-88888</span></td>
								<td><span title="100,000,000">100,000,000</span></td>
								<td><span>홍길동</span></td>
							</tr>
							<tr>
								<td>12</td>
								<td>2018-12-12</td>
								<td>N</td>
								<td><span title="기간계 응답속도 개선을 위한 인프라 교체">기간계 응답속도 개선을 위한 인프라 교체</span></td>
								<td><span title="VMAX250F">VMAX250F</span></td>
								<td><span title="DB Inc.">DB Inc.</span></td>
								<td><span>555-66-88888</span></td>
								<td><span title="100,000,000">100,000,000</span></td>
								<td><span>홍길동</span></td>
							</tr>
							<tr>
								<td>13</td>
								<td>2018-12-12</td>
								<td>N</td>
								<td><span title="기간계 응답속도 개선을 위한 인프라 교체">기간계 응답속도 개선을 위한 인프라 교체</span></td>
								<td><span title="VMAX250F">VMAX250F</span></td>
								<td><span title="DB Inc.">DB Inc.</span></td>
								<td><span>555-66-88888</span></td>
								<td><span title="100,000,000">100,000,000</span></td>
								<td><span>홍길동</span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<div class="floatR">
						<button type="button" value="완료"><img class="cursorP" src="<c:url value='/images/btn_complete.png'/>" /></button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>