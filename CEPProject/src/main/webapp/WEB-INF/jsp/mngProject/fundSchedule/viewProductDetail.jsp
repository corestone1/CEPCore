<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		.popContainer .top {
			width: 100%;
			height: 101px;
			border-bottom: 4px solid #4b3a93;
			position: absolute;
			top: 0;
		}
		.popContainer .top > div {
			font-size: 24px;
			padding-left: 34px;
			padding-top: 43px;
		}
		.popContainer .contents {
			position: absolute;
			width: 100%;
			height: 388px;
			top: 107px;
			right: 0;
			z-index: 3;
		}
		.popContainer .contents > div {
			margin: 32px auto;
			width: 1050px;
		}
		.popContainer .contents > div > table {
			border-collapse: collapse;
	  		border-spacing: 0 3px;
	  		width: 100%;
		}
		.popContainer .contents > div > table thead {
			width: 1050px;
		}
		.popContainer .contents > div > table tbody {
			overflow-y: auto;
			overflow-x: hidden;
			width: 1050px;
			height: 453px;
			border-bottom: 2px solid #c4c4c4;
		}
		.popContainer .contents > div > table tr {
			display: table;
			width: 1050px;
		}
		.popContainer .contents > div > table tr th {
			font-weight: 300 !important;
			background-color: #e2e0f5;
			border-top: 4px solid #6a5baf !important;
		}
		.popContainer .contents > div > table tr th,
		.popContainer .contents > div > table tr td {
			font-weight: 200;
			padding: 10px 18px;
			border: 1px solid #edecef;
			border-bottom: none;
			border-top: none;
			width: 100px;
			max-width: 100px;
			font-size: 15px;
		}
		.popContainer .contents > div > table tr td {
			text-align: right;
		}
		.popContainer .contents > div > table tr th:nth-child(2),
		.popContainer .contents > div > table tr td:nth-child(2) {
			width: 50px;
		}
		.popContainer .contents > div > table tr td:first-child,
		.popContainer .contents > div > table tr td:nth-child(2) {
			text-align: center;
		}
		.popContainer .contents > div > table tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 92%;
			margin: 0 auto;
		}
		.popContainer .contents select.wdts {
			width: 135px;
		}
	</style>
	<script>
		function fn_addView(link){
			if(link == "forecastList") {
				location.href="<c:url value='/forecastList.do'/>";
			} else {
				var url = '/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
		
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:495px'); 
			}
		}
	</script>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">제품 상세 정보</div>
			</div>
		</div>
		<div class="contents">
			<div>
				<table>
					<thead class="ftw400 floatL">
						<tr>
							<th scope="row">품목명</th>
							<th scope="row">수량</th>
							<th scope="row">단가</th>
							<th scope="row">공급가액</th>
							<th scope="row">부가세</th>
							<th scope="row">합계</th>
						</tr>
					</thead>
					<tbody class="floatL">
						<tr>
							<td><span title="ISILON X210">ISILON X210</span></td>
							<td>1</td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
						</tr>
						<tr>
							<td><span title="ISILON X210">ISILON X210</span></td>
							<td>1</td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
						</tr>
						<tr>
							<td><span title="ISILON X210">ISILON X210</span></td>
							<td>1</td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
						</tr>
						<tr>
							<td><span title="ISILON X210">ISILON X210</span></td>
							<td>1</td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
						</tr>
						<tr>
							<td><span title="ISILON X210">ISILON X210</span></td>
							<td>1</td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
						</tr>
						<tr>
							<td><span title="ISILON X210">ISILON X210</span></td>
							<td>1</td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
						</tr>
						<tr>
							<td><span title="ISILON X210">ISILON X210</span></td>
							<td>1</td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
						</tr>
						<tr>
							<td><span title="ISILON X210">ISILON X210</span></td>
							<td>1</td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
						</tr>
						<tr>
							<td><span title="ISILON X210">ISILON X210</span></td>
							<td>1</td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
						</tr>
						<tr>
							<td><span title="ISILON X210">ISILON X210</span></td>
							<td>1</td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
						</tr>
						<tr>
							<td><span title="ISILON X210">ISILON X210</span></td>
							<td>1</td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
						</tr>
						<tr>
							<td><span title="ISILON X210">ISILON X210</span></td>
							<td>1</td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
						</tr>
						<tr>
							<td><span title="ISILON X210">ISILON X210</span></td>
							<td>1</td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
							<td><span title="100,000,000">100,000,000</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>