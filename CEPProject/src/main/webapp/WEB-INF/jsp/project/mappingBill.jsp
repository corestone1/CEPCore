<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		.popContainer .top {
			width: 100%;
			height: 103px;
			border-bottom: 4px solid #6a5bae;
			position: absolute;
			top: 0;
		}
		.popContainer .top > div {
			font-size: 24px;
			padding-left: 34px;
			padding-top: 43px;
		}
		.popContainer .contents1 input[class="calendar"] {
			width: 150px;
			height: 32px;
			background-image: url('./images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
			font-size: 15px;
			padding-left: 13px;
		}
				
		.popContainer .subCalendar { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  					
			padding-top: 17px;	  					
			padding-bottom: 3px;
			margin-left: 38px;
			padding-right: 40px;
		}
		.popContainer .contents1 {
			position: absolute;
			width: 100%;
			height: 237px;
			top: 107px;
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto;
			overflow-x: hidden;
		}		
		.popContainer .subTitle { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  					
			padding-top: 24px;	  					
			padding-bottom: 3px;
			font-size: 18px;
			margin-left: 38px;
			/* float: left; */
		}
		.popContainer .contents1 table {
			width: calc(100% - 201px);
			font-size: 15px;
			margin-top: 16px;
			margin-left: 38px;
			border-collapse: collapse;
			overflow: hidden;
		}
		.popContainer table thead {
			background-color: #e1dff5;
			float: left;
			width: 1067px;
			border-top: 3.5px solid #6a5bae;
		}
		.popContainer table thead {
			display: table-header-group;
		}
		.popContainer .contents1 table tbody {
			width: 1067px;
			//height: 200px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.popContainer table tbody tr {
			display: table;
			width: 1066px;
			/* cursor: pointer; */
		}
		/* .popContainer .contents2 table thead th, .popContainer .contents2 table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
		} */
		.popContainer table thead th, .popContainer table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
		}
		.popContainer .contents1 tr:first-child td { 
			border-bottom:2px solid #e5e5e5;	
		}	
		.contents1 table thead th:first-child,
		.contents1 table tbody td:first-child {
			width: 163px;
		}	
		.contents1 table thead th:nth-child(2),
		.contents1 table tbody td:nth-child(2) {
			width: 80px;
		}
		.contents1 table thead th:nth-child(3),
		.contents1 table tbody td:nth-child(3) {
			width: 250px;
		}
		.contents1 table thead th:nth-child(4),
		.contents1 table tbody td:nth-child(4) {
			width: 160px;
		}
		.contents1 table thead th:nth-child(5),
		.contents1 table tbody td:nth-child(5) {
			width: 164px;
		}
		.contents1 table thead th:nth-child(6),
		.contents1 table tbody td:nth-child(6) {
			width: 250px;
		}
		
		.popContainer .contents2 {
			position: absolute;
			width: 100%;
			height: 316px;
			top: 322px;
			z-index: 3;
			background-color: #f6f7fc;
			/* overflow-y: auto;
			overflow-x: hidden; */
		}
		
		.popContainer .contents2 select {
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
		
		.popContainer .contents2 table {
			width: 1068px;
			font-size: 15px;
			margin-top: 16px;
			margin-left: 38px;
			border-collapse: collapse;
			overflow: hidden;
		}
		
		.popContainer .contents2 table tbody {
			width: 1067px;
			height: 250px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.popContainer .contents2 table tbody tr:hover {
			background-color: #ddf0ec
		}
		.popContainer .contents2 table thead th, .popContainer .contents1 table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
		}
		.popContainer .contents2 table { 
			border-bottom:2px solid #e5e5e5;	
		}	
		.contents2 table thead th:first-child,
		.contents2 table tbody td:first-child {
			width: 45px;
		}	
		.contents2 table thead th:nth-child(2),
		.contents2 table tbody td:nth-child(2) {
			width: 90px;
		}
		.contents2 table thead th:nth-child(3),
		.contents2 table tbody td:nth-child(3) {
			width: 60px;
		}
		.contents2 table thead th:nth-child(4),
		.contents2 table tbody td:nth-child(4) {
			width: 280px;
		}
		.contents2 table thead th:nth-child(5),
		.contents2 table tbody td:nth-child(5) {
			width: 190px;
		}
		.contents2 table thead th:nth-child(6),
		.contents2 table tbody td:nth-child(6) {
			width: 110px;
		}
		.contents2 table thead th:nth-child(7),
		.contents2 table tbody td:nth-child(7) {
			width: 103px;
		}
		.contents2 table thead th:nth-child(8),
		.contents2 table tbody td:nth-child(8) {
			width: 105px;
		}
		.contents2 table thead th:nth-child(9),
		.contents2 table tbody td:nth-child(9) {
			width: 80px;
		}
		
		.popContainer .bottomBtn {
			position: absolute;
			width: 1064px;
			height: 52px;
			top: 622px;
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: hidden;
			overflow-x: hidden;
			padding-top: 18px;
			padding-right: 40px;
		}	
	</style>
	<script>
	$(document).ready(function() {
				
		$('#fl tr').each(function(index, item) {
			if(index != 0) {
				$(this).children().eq(0).append('<input type="radio" class="tCheck" name="gubun" id="popCheck'+ index +'"/><label for="popCheck'+index+'" class="cursorP"/>');
			}
		});
	});	
		function fn_addBuildView(){
			var url = '/writeFinishInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_preBiddingView(){
			var url = '/writeBuildInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
	</script>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">계산서 -발주 매핑</div>
			</div>
		</div>
		<div class="contents1">
			<div>
				<div class="subTitle">계산서 정보</div>
			</div>
			<div>
				<table class="textalignC ftw200" >
					<thead class="ftw400">
						<tr>
							<th scope="row">발급일자</th>
							<th scope="row">매핑상태</th>
							<th scope="row">매입처</th>
							<th scope="row">사업자번호</th>
							<th scope="row">합계금액</th>
							<th scope="row">승인번호</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td> 2020-12-12</td>
							<td>N</td>
							<td>DB Inc.</td>
							<td>111-22-33333</td>
							<td>144,000,000</td>
							<td>208765112000008fsd0h0kx</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<div class="subTitle floatL">발주정보</div>
				<div class="subCalendar floatR">
					<input type="text" placeholder="from" class="calendar" />&nbsp; ~&nbsp; 
							<input type="text" placeholder="to" class="calendar" />
				</div>
			</div>
		</div>
		<div class="contents2">			
			<div>
				<table class="textalignC ftw200" id="fl">
					<thead class="ftw400">
						<tr>
							<th scope="row">선택</th>
							<th scope="row">발주일자</th>
							<th scope="row">매핑상태</th>
							<th scope="row">프로젝트명</th>
							<th scope="row">제품</th>
							<th scope="row">거래처</th>
							<th scope="row">사업자번호</th>
							<th scope="row">합계금액</th>
							<th scope="row">담당자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td>2020-10-12</td>
							<td>N</td>
							<td>기간계 응답속도 개선을 위한 인프라 교체</td>
							<td>POWERMAX2000 U120TB</td>
							<td>코오롱베니트가</td>
							<td>555-66-77777</td>
							<td>144,000,000</td>
							<td>홍길동</td>
						</tr>
						<tr>
							<td></td>
							<td>2020-10-12</td>
							<td>Y</td>
							<td>기간계 응답속도 개선을 위한 인프라 교체</td>
							<td>VMAX250F</td>
							<td>DB Inc.</td>
							<td>555-66-77777</td>
							<td>144,000,000</td>
							<td>홍길동</td>
						</tr>
						<tr>
							<td></td>
							<td>2020-10-12</td>
							<td>N</td>
							<td>기간계 응답속도 개선을 위한 인프라 교체</td>
							<td>VMAX250F</td>
							<td>DB Inc.</td>
							<td>555-66-77777</td>
							<td>144,000,000</td>
							<td>홍길동</td>
						</tr>
						<tr>
							<td></td>
							<td>2020-10-12</td>
							<td>N</td>
							<td>기간계 응답속도 개선을 위한 인프라 교체</td>
							<td>VMAX250F</td>
							<td>DB Inc.</td>
							<td>555-66-77777</td>
							<td>144,000,000</td>
							<td>홍길동</td>
						</tr>
						<tr>
							<td></td>
							<td>2020-10-12</td>
							<td>N</td>
							<td>기간계 응답속도 개선을 위한 인프라 교체</td>
							<td>VMAX250F</td>
							<td>DB Inc.</td>
							<td>555-66-77777</td>
							<td>144,000,000</td>
							<td>홍길동</td>
						</tr>
						<tr>
							<td></td>
							<td>2020-10-12</td>
							<td>N</td>
							<td>기간계 응답속도 개선을 위한 인프라 교체</td>
							<td>VMAX250F</td>
							<td>DB Inc.</td>
							<td>555-66-77777</td>
							<td>144,000,000</td>
							<td>홍길동동</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>		
		<dir class="bottomBtn">		
			<div class="btnWrap">
				<div class="floatR">
					<button onclick="fn_preBiddingView();"><img src="<c:url value='/images/btn_bill_mapping.png'/>" /></button>
				</div>				
			</div>
		</dir>
	</div>
</body>
</html>