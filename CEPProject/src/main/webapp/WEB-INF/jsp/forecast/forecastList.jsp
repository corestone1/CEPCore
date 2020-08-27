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
		.contentsWrap .contents .top select {
			height: 40px;
			width: 130px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('./images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.contentsWrap .contents .top input[type="text"] {
			width: 260px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			background-image: url('./images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
			font-size: 15px;
			margin-bottom: 3px;
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
		.middle table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle table tbody tr td:nth-child(3) {
			font-weight: 400;
		}
		.middle table thead th, .middle table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
		}
		.middle table thead th:first-child,
		.middle table tbody td:first-child {
			width: 51px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 125px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 316px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 162px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 102px;
		}
		.middle table thead th:nth-child(6),
		.middle table thead th:nth-child(7),
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(6),
		.middle table tbody td:nth-child(7),
		.middle table tbody td:nth-child(8) {
			width: 146px;
		}
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9) {
			width: 100px;
		}
		.middle table thead th:nth-child(10),
		.middle table thead th:nth-child(11),
		.middle table thead th:nth-child(12),
		.middle table tbody td:nth-child(10),
		.middle table tbody td:nth-child(11),
		.middle table tbody td:nth-child(12) {
			width: 101px;
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
			width: 275px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
		.detailList li:last-child {
			width: 1409px;
   			height: 56px;
   			word-break: break-all;
   			white-space: normal;
   			overflow: auto;
   			line-height: 1.5;
		}
		.bottom > div {
			margin-top: 22px;
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
					       + '<li>매출처</li>'
					       + '<li title="키스채권평가">키스채권평가</li>'
					       + '<li>매입처</li>'
					       + '<li title="코오롱베니트">코오롱베니트</li>'
					       + '<li>수주확률</li>'
					       + '<li title="80%">80%</li>'
					       + '<li>제품상세</li>'
					       + '<li title="Avamar, Data Domain 외, 디스크, DP4400">Avamar, Data Domain 외, 디스크, DP4400</li>' 
					       + '<li>진행사항</li>'
					       + '<li>RFP 작업중</li>'
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

		function fn_addView(){
			var url = '/writeForecast.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:495px'); 
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
						<div class="title floatL"><label class="ftw500">Forecast list</label></div>
						<div class="addBtn floatL cursorP" onclick="fn_addView();"><img src="<c:url value='/images/btn_add.png'/>" /></div>
					</div>
					<div class="floatR">
						<select>
							<option value="">진행상태</option>
						</select>
						<select>
							<option value="">구분</option>
						</select>
						<select>
							<option value="">검색조건</option>
						</select>
						<input type="text" />
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">No</th>
								<th scope="row">고객사</th>
								<th scope="row">사업명</th>
								<th scope="row">제품</th>
								<th scope="row">수주확정</th>
								<th scope="row">매출액</th>
								<th scope="row">매입액</th>
								<th scope="row">매출총이익</th>
								<th scope="row">매출일정</th>
								<th scope="row">수금일정</th>
								<th scope="row">매입일정</th>
								<th scope="row">매입결제일</th>
								<th scope="row">상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td>경신홀딩스</td>
								<td>경신홀딩스 백업시스템 구축1 <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
								<td>백업/스토리지</td>
								<td>확정(2Q)</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>진행</td>
							</tr>
							<tr>
								<td></td>
								<td>경신홀딩스</td>
								<td>경신홀딩스 백업시스템 구축2</td>
								<td>백업/스토리지</td>
								<td>확정(2Q)</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>진행</td>
							</tr>
							<tr>
								<td></td>
								<td>경신홀딩스</td>
								<td>경신홀딩스 백업시스템 구축3</td>
								<td>백업/스토리지</td>
								<td>확정(2Q)</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>진행</td>
							</tr>
							<tr>
								<td></td>
								<td>경신홀딩스</td>
								<td>경신홀딩스 백업시스템 구축4</td>
								<td>백업/스토리지</td>
								<td>확정(2Q)</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>진행</td>
							</tr>
							<tr>
								<td></td>
								<td>경신홀딩스</td>
								<td>경신홀딩스 백업시스템 구축5</td>
								<td>백업/스토리지</td>
								<td>확정(2Q)</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>진행</td>
							</tr>
							<tr>
								<td></td>
								<td>경신홀딩스</td>
								<td>경신홀딩스 백업시스템 구축6</td>
								<td>백업/스토리지</td>
								<td>확정(2Q)</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>진행</td>
							</tr>
							<tr>
								<td></td>
								<td>경신홀딩스</td>
								<td>경신홀딩스 백업시스템 구축7</td>
								<td>백업/스토리지</td>
								<td>확정(2Q)</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>진행</td>
							</tr>
							<tr>
								<td></td>
								<td>경신홀딩스</td>
								<td>경신홀딩스 백업시스템 구축8</td>
								<td>백업/스토리지</td>
								<td>확정(2Q)</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>진행</td>
							</tr>
							<tr>
								<td></td>
								<td>경신홀딩스</td>
								<td>경신홀딩스 백업시스템 구축9</td>
								<td>백업/스토리지</td>
								<td>확정(2Q)</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>진행</td>
							</tr>
							<tr>
								<td></td>
								<td>경신홀딩스</td>
								<td>경신홀딩스 백업시스템 구축10</td>
								<td>백업/스토리지</td>
								<td>확정(2Q)</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>진행</td>
							</tr>
							<tr>
								<td></td>
								<td>경신홀딩스</td>
								<td>경신홀딩스 백업시스템 구축11</td>
								<td>백업/스토리지</td>
								<td>확정(2Q)</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>진행</td>
							</tr>
							<tr>
								<td></td>
								<td>경신홀딩스</td>
								<td>경신홀딩스 백업시스템 구축12</td>
								<td>백업/스토리지</td>
								<td>확정(2Q)</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>진행</td>
							</tr>
							<tr>
								<td></td>
								<td>경신홀딩스</td>
								<td>경신홀딩스 백업시스템 구축13</td>
								<td>백업/스토리지</td>
								<td>확정(2Q)</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>144,000,000</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>2018/12</td>
								<td>진행</td>
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