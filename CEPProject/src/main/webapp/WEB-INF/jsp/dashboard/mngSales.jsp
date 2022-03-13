<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../cmm/inc.jsp" %>
<%@include file="../cmm/header.jsp" %>
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
			height: 830px;
		}
		form .contentsWrap .contents {
			padding: 38px 71px; 
			width: 1662px;
		}
		form .title >  div:first-child > label {
			font-size: 26px;
		}
		form .title >  div:nth-child(3),
		form .title >  div:nth-child(4) {
			border-radius: 20px;
			color: #fff;
			width: 215px;
			height: 36px;
			line-height: 35px;
			margin-top: 12px;
			margin-left: 12px;
		}
		form .title >  div:nth-child(3) {
			background-color: #9284d1;
		}
		form .title >  div:nth-child(4) {
			background-color: #32bc94;
		}
		form .title >  div:nth-child(2) {
			margin-top: 12px;
		}
		form .title >  div:nth-child(2) > span {
			color: #535353;
			font-size: 18px;
		}
		.contentsWrap .contents .top > div:nth-child(2) {
			position: relative;
			height: 86px;
			width: 762px;
		}
		.contentsWrap .contents .top > div:nth-child(2) > div {
			position: absolute;
			bottom: 0;
		}
		.contentsWrap .contents .top > div:nth-child(2) > div > * {
			vertical-align: top;
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
			height: 360px;
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
		.middle table thead tr:last-child th:first-child,
		.middle table tbody td:first-child,
		.middle table thead tr:last-child th:nth-child(2),
		.middle table tbody td:nth-child(2),
		.middle table thead tr:last-child th:nth-child(4),
		.middle table tbody td:nth-child(4),
		.middle table thead tr:last-child th:nth-child(7),
		.middle table tbody td:nth-child(7) {
			width: 100px;
			max-width: 100px;
		}
		.middle table thead tr:last-child th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 200px;
			max-width: 200px;
		}
		.middle table thead tr:last-child th:nth-child(5),
		.middle table tbody td:nth-child(5),
		.middle table thead tr:last-child th:nth-child(8),
		.middle table tbody td:nth-child(8) {
			width: 150px;
			max-width: 150px;
		}
		.middle table thead tr:last-child th:nth-child(6),
		.middle table tbody td:nth-child(6),
		.middle table thead tr:last-child th:nth-child(9),
		.middle table tbody td:nth-child(9) {
			width: 120px;
			max-width: 120px;
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
			border-collapse: collapse;
		}
		.bottom table tr td {
			padding: 4px 9px;
			color: #26a07d;
			background-color: #ecf6f4;
			text-align: right;
			width: 120px;
			font-weight: 200;
			border: 1px solid #d7ede9;
			border-right: 1px solid #edecef;
			font-size: 15px;
		}
		.bottom table tr td:first-child {
			width: 131px;
			background-color: #e0f1ee;
			border-bottom: 1px solid #bee3db;
		}
		.bottom table tr:last-child td {
			background-color: #d7ede9;
		}
		.bottom table tr:last-child td:first-child {
			background-color: #bee3db;
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
			width: 150px;
		}
	</style>
	<script>
	</script>
</head>
<body>
	<form id="listForm" name="listForm" method="post">
		<div class="sfcnt"></div>
		<!-- <div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL">
							<div><label class="ftw500">월별 매출</label></div>
							<div class="floatL">
								<span class="ftw500">
									지난해 동분기 (
									<c:set var="now" value="<%=new java.util.Date() %>" />
									<c:set var="sysYear"><fmt:formatDate value="${now }" pattern="yyyy" /></c:set>
									<c:set var="sysMonth"><fmt:formatDate value="${now }" pattern="MM" /></c:set>
									<c:out value="${sysYear - 1}" />.
									<c:if test="${sysMonth eq 1 or sysMonth eq 2 or sysMonth eq 3 }">
										1Q
									</c:if>
									<c:if test="${sysMonth eq 4 or sysMonth eq 5 or sysMonth eq 6 }">
										2Q
									</c:if>
									<c:if test="${sysMonth eq 7 or sysMonth eq 8 or sysMonth eq 9 }">
										3Q
									</c:if>
									<c:if test="${sysMonth eq 10 or sysMonth eq 11 or sysMonth eq 12 }">
										4Q
									</c:if> )
								</span>
							</div>
							<div class="floatL textalignC">매출 10,000,000원 증가</div>
							<div class="floatL textalignC">매입 10,000,000원 증가</div>
						</div>
						<%-- <div class="addBtn floatL cursorP" onclick="javascript:fn_addView('writeBasic')"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>
					</div>
					<div class="floatR">
						<div>
							<%-- <select>
								<option value="">부서</option>
							</select>
							<select>
								<option value="">구분</option>
							</select>
							<input type="text" class="calendar" placeholder="날짜"/>
							<input type="text" class="search" style="width: 250px;" placeholder="프로젝트명" />
							<span><img src="<c:url value='/images/icon_search.png'/>" /></span> --%>
						</div>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<!-- <table class="textalignC ftw200" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row" colspan="3" width="399px">프로젝트 담당</th>
								<th scope="row" colspan="3" width="369px">매출</th>
								<th scope="row" colspan="3" width="370px">매입</th>
							</tr>
							<tr>
								<th scope="row">소속</th>
								<th scope="row">담당자</th>
								<th scope="row">프로젝트</th>
								<th scope="row">매출일자</th>
								<th scope="row">매출처</th>
								<th scope="row">매출액(VAT별도)</th>
								<th scope="row">매입일자</th>
								<th scope="row">매입처</th>
								<th scope="row">매입액(VAT별도)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>IT운영본부</td>
								<td>최재용</td>
								<td class="ftw400"><span class="textalignL" title="DB손해보험보상 PRM R430 2식">DB손해보험보상 PRM R430 2식</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
							</tr>
							<tr>
								<td>IT운영본부</td>
								<td>최재용</td>
								<td class="ftw400"><span class="textalignL" title="DB손해보험보상 PRM R430 2식">DB손해보험보상 PRM R430 2식</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
							</tr>
							<tr>
								<td>IT운영본부</td>
								<td>최재용</td>
								<td class="ftw400"><span class="textalignL" title="DB손해보험보상 PRM R430 2식">DB손해보험보상 PRM R430 2식</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
							</tr>
							<tr>
								<td>IT운영본부</td>
								<td>최재용</td>
								<td class="ftw400"><span class="textalignL" title="DB손해보험보상 PRM R430 2식">DB손해보험보상 PRM R430 2식</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
							</tr>
							<tr>
								<td>IT운영본부</td>
								<td>최재용</td>
								<td class="ftw400"><span class="textalignL" title="DB손해보험보상 PRM R430 2식">DB손해보험보상 PRM R430 2식</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
							</tr>
							<tr>
								<td>IT운영본부</td>
								<td>최재용</td>
								<td class="ftw400"><span class="textalignL" title="DB손해보험보상 PRM R430 2식">DB손해보험보상 PRM R430 2식</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
							</tr>
							<tr>
								<td>IT운영본부</td>
								<td>최재용</td>
								<td class="ftw400"><span class="textalignL" title="DB손해보험보상 PRM R430 2식">DB손해보험보상 PRM R430 2식</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
							</tr>
							<tr>
								<td>IT운영본부</td>
								<td>최재용</td>
								<td class="ftw400"><span class="textalignL" title="DB손해보험보상 PRM R430 2식">DB손해보험보상 PRM R430 2식</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
							</tr>
							<tr>
								<td>IT운영본부</td>
								<td>최재용</td>
								<td class="ftw400"><span class="textalignL" title="DB손해보험보상 PRM R430 2식">DB손해보험보상 PRM R430 2식</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
							</tr>
							<tr>
								<td>IT운영본부</td>
								<td>최재용</td>
								<td class="ftw400"><span class="textalignL" title="DB손해보험보상 PRM R430 2식">DB손해보험보상 PRM R430 2식</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
							</tr>
							<tr>
								<td>IT운영본부</td>
								<td>최재용</td>
								<td class="ftw400"><span class="textalignL" title="DB손해보험보상 PRM R430 2식">DB손해보험보상 PRM R430 2식</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
							</tr>
							<tr>
								<td>IT운영본부</td>
								<td>최재용</td>
								<td class="ftw400"><span class="textalignL" title="DB손해보험보상 PRM R430 2식">DB손해보험보상 PRM R430 2식</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
							</tr>
							<tr>
								<td>IT운영본부</td>
								<td>최재용</td>
								<td class="ftw400"><span class="textalignL" title="DB손해보험보상 PRM R430 2식">DB손해보험보상 PRM R430 2식</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
								<td>2020-12-12</td>
								<td><span title="아데나소프트주식회사" class="textalignL">아데나소프트주식회사</span></td>
								<td><span title="5,000,000" class="textalignR">100,000,000</span></td>
							</tr>
						</tbody>
					</table> -->
				    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
				    <script type="text/javascript">
				      google.charts.load('current', {'packages':['corechart']});
				      google.charts.setOnLoadCallback(drawChart);
				
				      function drawChart() {
				        var data = google.visualization.arrayToDataTable([
				          ['Month', 'Sales', 'Expenses'],
				          ['1Q',  1000,      400],
				          ['2Q',  1170,      460],
				          ['3Q',  660,       1120],
				          ['4Q',  1030,      540]
				        ]);
				
				        var options = {
				          title: 'Company Performance',
				          curveType: 'function',
				          legend: { position: 'bottom' }
				        };
				
				        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
				
				        chart.draw(data, options);
				      }
				    </script>
				    <div id="curve_chart" style="width: 1500px; height: 500px; margin-top: 30px;"></div>
					
				</div>
				<div class="bottom">
					<!-- <table>
						<tbody class="ftw400">
							<tr>
								<td colspan="3" class="textalignC">사업총괄</td>
								<td colspan="3"><span>10,000,000,000</span></td>
								<td colspan="3"><span>10,000,000,000</span></td>
							</tr>
							<tr>
								<td colspan="3" class="textalignC">DPS사업본부</td>
								<td colspan="3"><span>10,000,000,000</span></td>
								<td colspan="3"><span>10,000,000,000</span></td>
							</tr>
							<tr>
								<td colspan="3" class="textalignC">IT인프라사업본부</td>
								<td colspan="3"><span>10,000,000,000</span></td>
								<td colspan="3"><span>10,000,000,000</span></td>
							</tr>
							<tr>
								<td colspan="3" class="ftw400 textalignC">1월 합계</td>
								<td colspan="3" class="ftw400"><span>10,000,000,000</span></td>
								<td colspan="3" class="ftw400"><span>10,000,000,000</span></td>
							</tr>
						</tbody>
					</table> -->
				</div>
			</div>
		</div>
	</form>
</body>
</html>