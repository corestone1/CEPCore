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
		.middle table tbody tr td:nth-child(4) {
			font-weight: 400;
		}
		.middle table thead th, .middle table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
			color: #535353;
		}
		.middle table thead th:first-child,
		.middle table tbody td:first-child,
		.middle table thead th:nth-child(11),
		.middle table tbody td:nth-child(11) {
			width: 50px;
			max-width: 50px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 48px;
			max-width: 48px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 145px;
			max-width: 145px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 320px;
			max-width: 320px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 100px;
			max-width: 100px;
		}
		.middle table thead th:nth-child(6),
		.middle table thead th:nth-child(7),
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(6),
		.middle table tbody td:nth-child(7),
		.middle table tbody td:nth-child(8),
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9),
		.middle table thead th:nth-child(10),
		.middle table tbody td:nth-child(10) {
			width: 100px;
			max-width: 100px;
		}
		.middle table thead th:nth-child(12),
		.middle table tbody td:nth-child(12) {
			width: 140px;
			max-width: 140px;
		}
		.middle table thead th:nth-child(13),
		.middle table tbody td:nth-child(13),
		.middle table thead th:nth-child(14),
		.middle table tbody td:nth-child(14) {
			width: 80px;
			max-width: 80px;
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
			width: 260px;
		}
	</style>
	<script>
		$(document).ready(function() {
			var html = '';
			$('.middle table tbody tr').click(function() {
				if($(this).attr('class') != "viewOpen") {
					html = '<div style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>여신</li>'
					       + '<li title="계산서 발행 후 90일">계산서 발행 후 90일</li>'
					       + '<li>제품명</li>'
					       + '<li title="VXRail">VXRail</li>'
					       + '<li>비고</li>'
					       + '<li title="ECS DR 장비운송 (의왕->안성) / HP Cooling Fan DL360p G8 / A15243621OUUAR">ECS DR 장비운송 (의왕->안성) / HP Cooling Fan DL360p G8 / A15243621OUUAR</li>'
					       + '<li>제품번호</li>'
					       + '<li title="29087564">29087564</li>' 
					       + '</ul>'
					       + '</div>'
					       + '</div>';
					$(this).after(html);
					$(this).attr('class', 'viewOpen');
				} else {
					$(this).removeClass('viewOpen');
					$(this).next().remove();
				}
			});
			
			$('#fl tr').each(function(index, item) {
				if(index != 0) {
					$(this).children().eq(0).append('<input type="checkbox" class="tCheck" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
				}
			});
		});

		function fn_addView(link){
			/* if(link == "forecastList") {
				location.href="<c:url value='/forecastList.do'/>";
			} else { */
				var url = '/mngProject/order/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
		
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px'); 
			/* } */
		}

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
						<div class="title floatL"><label class="ftw500">발주 목록</label></div>
						<div class="addBtn floatL cursorP" onclick="javascript:fn_addView('addInfo')"><img src="<c:url value='/images/btn_add.png'/>" /></div>
					</div>
					<div class="floatR">
						<select>
							<option value="">구분</option>
						</select>
						<select>
							<option value="">상태</option>
						</select>
						<input type="text" class="calendar" placeholder="from"/><label> ~ </label><input type="text" class="calendar" placeholder="to"/>
						<input type="text" placeholder="발주번호" style="width: 80px;"/>
						<input type="text" class="search" placeholder="프로젝트명"/>
						<span><img src="<c:url value='/images/icon_search.png'/>" /></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">선택</th>
								<th scope="row">No</th>
								<th scope="row">고객사</th>
								<th scope="row">프로젝트명</th>
								<th scope="row">발주일</th>
								<th scope="row">입고일</th>
								<th scope="row">계산서일자</th>
								<th scope="row">발주번호</th>
								<th scope="row">매입처</th>
								<th scope="row">단가</th>
								<th scope="row">수량</th>
								<th scope="row">합계(VAT별도)</th>
								<th scope="row">발주자</th>
								<th scope="row">영업담당자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td>1</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체dddddddddddddddddddddddddddddd">VDI 중요단말기 환경 구축 및 노후장비 교체dddddddddddddddddddddddddddddd</span></td>
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
								<td></td>
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
								<td></td>
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
								<td></td>
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
								<td></td>
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
								<td></td>
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
								<td></td>
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
								<td></td>
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
								<td></td>
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
								<td></td>
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
								<td></td>
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
							</tr>
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<div class="floatR">
						<button value="수정"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
						<button value="삭제"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
						<button value="엑셀 다운로드"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>