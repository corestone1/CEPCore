<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<%@include file="../../../cmm/header.jsp" %>
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
			height: 802px;
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
		form .contents .stitle img {
			width: 27px;
			margin-left: 10px;
		}
		form .contents > div > div > div > table {
			border-collapse: collapse;
			font-size: 15px;
		} 
		form .contents > div > div > div > table tr td {
			padding: 13px 20px;
		}
		form .contents > div > div > div > table tr td:first-child {
			width: 124px;
			font-weight: 400;
			padding: 13px 20px 13px 45px;
		} 
		form .contents > div > div > div > table tr td:last-child {
			width: 400px;
			font-weight: 200;
		}
		form .contents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			border: 1px solid #bee2da;
		    border-bottom: 2px solid #bfe3db;
		}
		
		form .contents .bsc tbody {			
			height: 576px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		
		form .contents .bsc tr td {
			color: #0e8a67;
		}
		form .contents .bsc tr td:first-child {
			box-shadow: inset -7px 0 9px -4px #d0e2de;
		}
		form .contents .bsc tr td label.file {
			text-decoration: underline;
		}
		form .contents .title ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		}
		form .contents .title ul li:last-child {
			clear: both;
			float: none;
			width: 0 !important;
		}
		form .contents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
			background-color: #d3d3d3;
		}
		form .contents > .fxd .title ul li {
			width: 25%;
			line-height: 46px;
			color: #777777;
			background-color: #d3d3d3;
			border-radius: 35px;
		}
		form .contents > .fxd .title ul li > label {
			display: inline-block;
    		width: 100%;
    		cursor: pointer;
		}
		form .contents > .fxd .title ul li.on,
		form .contents > .fxd .title ul li:hover  {
			color: #fff  !important;
			background-color: #4c3d92;
		}
		form .contents .dtl {
			width: 997px;
			font-size: 15px;
			border-collapse: collapse;
			font-weight: 300;
			overflow: hidden;
			border-top: 4px solid #6a5baf;
		}
		form .contents .dtl thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
		}
		form .contents .dtl thead tr {
			display: table;
			width: 997px;
		}
		form .contents .dtl tbody {
			width: 997px;
			height: 532px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			border-bottom: 2px solid #c4c4c4;
		}
		form .contents .dtl tbody tr {
			display: table;
			width: 997px;
			cursor: pointer;
		}
		form .contents .dtl tbody tr:hover {
			background-color: #ddf0ec
		}
		form .contents .dtl tbody tr td:nth-child(3) {
			font-weight: 400;
		}
		form .contents .dtl thead th, form .contents .dtl tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
		}
		form .contents .dtl tbody tr td {
			font-weight: 200;
		}
		form .contents .dtl thead th:first-child,
		form .contents .dtl tbody td:first-child {
			width: 51px;
			padding: 0;
		}
		form .contents .dtl thead th:nth-child(2),
		form .contents .dtl tbody td:nth-child(2),
		form .contents .dtl thead th:nth-child(6),
		form .contents .dtl tbody td:nth-child(6) {
			width: 51px;
		}
		form .contents .dtl thead th:nth-child(3),
		form .contents .dtl tbody td:nth-child(3) {
			width: 170px;
		}
		form .contents .dtl thead th:nth-child(4),
		form .contents .dtl tbody td:nth-child(4) {
			width: 216px;
		}
		form .contents .dtl thead th:nth-child(5),
		form .contents .dtl tbody td:nth-child(5),
		form .contents .dtl thead th:nth-child(7),
		form .contents .dtl tbody td:nth-child(7) {
			width: 109px;
		}
		form .contents .dtl thead th:nth-child(8),
		form .contents .dtl tbody td:nth-child(8) {
			width: 78px;
		}
		form .contents .dtl tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 84%;
			margin: 0 auto;
		}
		form .contents .dtl tbody tr td img {
			width: 25px;
			vertical-align: top;
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
			width: 316px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
		.detailList li:last-child {
			width: 734px;
   			height: 56px;
   			word-break: break-all;
   			white-space: normal;
   			overflow: auto;
   			line-height: 1.5;
		}
		#modBasicTable tr td:last-child {
			padding: 5px 20px;
		}
		#modBasicTable input[type="text"],
		#modBasicTable textarea {
			width: 380px; 
		    color: #0e8a67;
		}
		#modBasicTable textarea {
			color: #0e8a67;
		}
		#modBasicTable select {
			font-size: 14px;
			width: 187px;
		   color: #0e8a67;
		}
		#modBasicTable input[class^="calendar"] {
			width: 165px !important;
		}
		/* #modBasicTable label { */
			
	</style>
	<script>
		$(document).ready(function() {
			var index = $('form .contents > .fxd .title ul li.on').index() + 2;
			var length = $('form .contents > .fxd .title ul li').length;
			
			$('li[id^=LI_TOPBar]').click(function(event){
				/* location.href = this.title; 
				event.preventDefault(); 				
				alert(this.title);
				*/
				document.detailForm.action = this.title;
	           	document.detailForm.submit();
				
			});
			
			var html = '';
			$('#prodList table tbody tr').click(function() {
				if($(this).attr('class') != "viewOpen") {
					html = '<div style="width:997px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>제품상세</li>'
					       + '<li title="제품상세 내용 표출 1P/8C, 32GB*2EA">제품상세 내용 표출 1P/8C, 32GB*2EA</li>'
					       + '<li>계약기간</li>'
					       + '<li title="2020.12.12~2021.12.12">2020.12.12~2021.12.12</li>'
					       + '<li>비고</li>'
					       + '<li title="비고내용 표출비고내용 표출비고내용 표출비고내용 표출비고내용 표출비고내용 표출">비고내용 표출비고내용 표출비고내용 표출비고내용 표출비고내용 표출비고내용 표출</li>'
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
			
			$('#modInfo').click(function() {
				if($('.detailList').length === 0) {
					alert('수정할 정보를 선택해 주세요.');
				} else if($('.detailList').length > 1) {
					alert('최대로 수정할 수 있는 개수는 1개 입니다.');
				} else {
					$("#selectTable").css('display','none');
					$('#modTable').css('display','block');
					$("#selectBasicTable").css('display','none');
					$("#modBasicTable").css('display','block');
					$("#modInfo img").attr('src',"/images/btn_save.png");
					$("#modInfo").attr('id','saveInfo');
					/* var carray = new Array();
					var varray = new Array();
					$('.detailList li label').each(function() {
						carray.push($(this).attr('class'));
						varray.push($(this).text());
					});
					$( '.detailList li label' ).contents().unwrap().wrap( '<input type="text"></input>' );
					$('.detailList li input').each(function(index) {
						$(this).attr('class',carray[index]);
						$(this).attr('value',varray[index]);
					}); */
					
					$('#saveInfo').click(function() {
						alert('수정되었습니다.');
						location.reload();
					});
				} 
			});
		});
		
		function fn_addView(link){
			/* if(link == "forecastList") {
				location.href="<c:url value='/forecastList.do'/>";
			} else { */
				var url = '/project/'+link+'.do';
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
	<form id="detailForm" name="detailForm" method="post">
	<input type="hidden" id="selectKey" name="selectKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>"/>
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="floatL">
					<div class="title"><label class="ftw500">유지보수 상세정보</label></div>
					<div>
						<div class="stitle cg">기본정보</div>
						<div id="basicForm">
							<table class="bsc" id="selectBasicTable">
								<tr>
									<td>프로젝트명</td>
									<td><c:out value="${basicContractInfo.mtNm}"/></td>
								</tr>
								<tr>
									<td>고객사</td>
									<td><c:out value="${basicContractInfo.mtAcNm}"/></td>
								</tr>
								<tr>
									<td>고객사담당자</td>
									<td><c:out value="${basicContractInfo.acDirectorInfo}"/></td>
								</tr>
								<tr>
									<td>계약일자</td>
									<td><c:out value="${basicContractInfo.makeDisplayDate(basicContractInfo.mtCtDt)}"/></td>
								</tr>
								<tr>
									<td>유지보수 기간</td>
									<td><c:out value="${basicContractInfo.makeDisplayDate(basicContractInfo.mtStartDt)}"/> ~ <c:out value="${basicContractInfo.makeDisplayDate(basicContractInfo.mtEndDt)}"/></td>
								</tr>
								<tr>
									<td>유지보수 금액</td>
									<td><c:out value="${basicContractInfo.makeDisplayAmount(basicContractInfo.mtAmount)}"/></td>
								</tr>
								<tr>
									<td>부가세 포함여부</td>
									<td><c:out value="${basicContractInfo.taxYn}"/></td>
								</tr>
								<tr>
									<td>결제조건</td>
									<td><c:out value="${basicContractInfo.mtPayTerms}"/></td>
								</tr>
								<tr>
									<td>검수방법</td>
									<td><c:out value="${basicContractInfo.mtImCd}"/></td>
								</tr>
								<tr>
									<td>정기점검 횟수</td>
									<td><c:out value="${basicContractInfo.mtRgInspectCnt}"/> 회</td>
								</tr>
								<tr>
									<td>백계약유무</td>
									<td><c:out value="${basicContractInfo.mtSbCtYn}"/></td>
								</tr>
								<tr>
									<td>보증증권 유무</td>
									<td><c:out value="${basicContractInfo.gbYn}"/></td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td><c:out value="${basicContractInfo.supportEmpNm}"/></td>
								</tr>
								<tr>
									<td>관리담당자</td>
									<td><c:out value="${basicContractInfo.mngEmpNm}"/></td>
								</tr>
								<tr>
									<td>영업담당자</td>
									<td><c:out value="${basicContractInfo.saleEmpNm}"/></td>
								</tr>
								<tr>
									<td>비고</td>
									<td><c:out value="${basicContractInfo.remark}"/></td>
								</tr>
							</table>
							<table class="bsc dpNone" id="modBasicTable">
								<tr>
									<td>프로젝트명</td>
									<td><input type="text" value="VDI중요단말 환경구축 및 노후장비 교체" /></td>
								</tr>
								<tr>
									<td>고객사</td>
									<td>
										<select>
											<option>미래에셋생명</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>고객사담당자</td>
									<td>
										<select class="nrslct">
											<option>홍길동</option>
										</select>
										<label>차장 / 010-9999-8888 / ersdf@naver.com</label>
									</td>
								</tr>
								<tr>
									<td>관리담당자</td>
									<td>
										<select class="nrslct">
											<option>길동이</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td>
										<select class="nrslct">
											<option>김규민</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>영업담당자</td>
									<td>
										<select class="nrslct">
											<option>김규민</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>유지보수 금액</td>
									<td><input type="text" value="100,000,000" /></td>
								</tr>
								<tr>
									<td>결제조건</td>
									<td>
										<select>
											<option>당월25일</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>유지보수 기간</td>
									<td>
										<input class="calendar fromDt" value="2019-12-12" type="text"/>
										&nbsp;&nbsp;~&nbsp;&nbsp;
										<input class="calendar fromDt" value="2020-12-12" type="text"/>
									</td>
								</tr>
								<tr>
									<td>계약일자</td>
									<td><input class="calendar fromDt" value="2020-12-12" type="text"/></td>
								</tr>
								<tr>
									<td>보증증권 유무</td>
									<td>
										<select class="nrslct">
											<option>Y</option>
										</select>
										<button type="button" class="veralignM"><img class="cursorP" src="<c:url value='/images/btn_file_upload.png'/>" /></button>
										<label class="file">보증증권.pdf</label>
									</td>
								</tr>
								<tr>
									<td>비고</td>
									<td>
										<textarea rows="4" cols="45">
											비고 내용
										</textarea>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="floatR dpBlock fxd">
					<div class="title">
						<ul>
							<li id="LI_TOPBar_PD" class="on" title="/maintenance/contract/detail/prodInfo.do"><label>제품정보</label></li>
							<li id="LI_TOPBar_SL" title="/maintenance/contract/detail/salesInfo.do"><label>매출정보</label></li>
							<li id="LI_TOPBar_BC" title="/maintenance/contract/detail/backOrderInfo.do"><label>백계약정보</label></li>
							<li id="LI_TOPBar_PA" title="/maintenance/contract/detail/purchaseAmountInfo.do"><label>매입정보</label></li>
							<li></li>
						</ul>
					</div>
					<div id="prodList">
						<div class="stitle cg colorBlack">제품정보<img class="veralignT" src="<c:url value='/images/btn_add.png'/>" /></div>
						<div class="floatC">
							<table class="dtl">
								<thead class="ftw400">
									<tr>
										<th scope="row">선택</th>
										<th scope="row">No</th>
										<th scope="row">제품</th>
										<th scope="row">시리얼번호</th>
										<th scope="row">단가</th>
										<th scope="row">수량</th>
										<th scope="row">합계</th>
										<th scope="row">부가세포함</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="mtIntegrateKey" id="check1" /><label for="check1" class="cursorP"/>
										</td>
										<td>1</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R642</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td><span title="2020010341000026zzz0h1sj">12341234</span></td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>5</td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>Y</td>
									</tr>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="mtIntegrateKey" id="check2" /><label for="check2" class="cursorP"/>
										</td>
										<td>2</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td><span title="2020010341000026zzz0h1sj">2020010341000026zzz0h1sj</span></td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>5</td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>Y</td>
									</tr>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="mtIntegrateKey" id="check3" /><label for="check3" class="cursorP"/>
										</td>
										<td>3</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td><span title="2020010341000026zzz0h1sj">2020010341000026zzz0h1sj</span></td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>5</td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>Y</td>
									</tr>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="mtIntegrateKey" id="check4" /><label for="check4" class="cursorP"/>
										</td>
										<td>4</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td><span title="2020010341000026zzz0h1sj">2020010341000026zzz0h1sj</span></td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>5</td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>Y</td>
									</tr>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="mtIntegrateKey" id="check5" /><label for="check5" class="cursorP"/>
										</td>
										<td>5</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td><span title="2020010341000026zzz0h1sj">2020010341000026zzz0h1sj</span></td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>5</td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>Y</td>
									</tr>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="mtIntegrateKey" id="check6" /><label for="check6" class="cursorP"/>
										</td>
										<td>6</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td><span title="2020010341000026zzz0h1sj">2020010341000026zzz0h1sj</span></td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>5</td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>Y</td>
									</tr>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="mtIntegrateKey" id="check7" /><label for="check7" class="cursorP"/>
										</td>
										<td>7</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td><span title="2020010341000026zzz0h1sj">2020010341000026zzz0h1sj</span></td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>5</td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>Y</td>
									</tr>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="mtIntegrateKey" id="check8" /><label for="check8" class="cursorP"/>
										</td>
										<td>8</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td><span title="2020010341000026zzz0h1sj">2020010341000026zzz0h1sj</span></td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>5</td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>Y</td>
									</tr>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="mtIntegrateKey" id="check9" /><label for="check9" class="cursorP"/>
										</td>
										<td>9</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td><span title="2020010341000026zzz0h1sj">2020010341000026zzz0h1sj</span></td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>5</td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>Y</td>
									</tr>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="mtIntegrateKey" id="check10" /><label for="check10" class="cursorP"/>
										</td>
										<td>10</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td><span title="2020010341000026zzz0h1sj">2020010341000026zzz0h1sj</span></td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>5</td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>Y</td>
									</tr>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="mtIntegrateKey" id="check11" /><label for="check11" class="cursorP"/>
										</td>
										<td>11</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td><span title="2020010341000026zzz0h1sj">2020010341000026zzz0h1sj</span></td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>5</td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>Y</td>
									</tr>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="mtIntegrateKey" id="check12" /><label for="check12" class="cursorP"/>
										</td>
										<td>12</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td><span title="2020010341000026zzz0h1sj">2020010341000026zzz0h1sj</span></td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>5</td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>Y</td>
									</tr>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="mtIntegrateKey" id="check13" /><label for="check13" class="cursorP"/>
										</td>
										<td>13</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td><span title="2020010341000026zzz0h1sj">2020010341000026zzz0h1sj</span></td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>5</td>
										<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
										<td>Y</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btnWrap rt">
							<div class="floatR">
								<button type="button" value="수정" id="modInfo"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
								<button type="button" value="삭제"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
								<button type="button" value="Excel"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
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