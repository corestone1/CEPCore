<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<%@include file="../../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수작업 상세</title>
	
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
		/* 상세화면 전체크기 */
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
		/* 화면타이틀(유지보수작업 상세정보) 글자크기 */
		form .title > label {
			font-size: 26px;
		}
		/* 왼쪽기본정보 싸이즈 */
		form .contents > div:first-child {
        	width: 37%;
      	}
		/* 오른쪽 내용(상세정보) 싸이즈 */
		form .contents > .fxd {
			width: 60%;
		}
		/* 소타이틀(기본정보, 발주정보, 제품정보) 관련 css*/
		form .contents .stitle {
			font-size: 18px;
			font-weight: 500;
			margin-bottom: 10px;
			margin-top: 30px;
		}
		/* 기본정보 색상  */
		form .contents .cg {
			color: #24a37e;
		}
		/* 발주추카 이미지 크기 및 위치조정 */
		form .contents .stitle img {
			width: 27px;
			margin-left: 10px;
		}
		form .contents > div > div > div > table {
			border-collapse: collapse;
			font-size: 15px;
		} 
		/* 기본정보 테이블 padding */
		form .contents > div > div > div > table tr td {
			padding: 13px 20px;
		}
		/* 기본정보 타이틀 크기 및 글자크기 */
		form .bsc tr td:first-child {
			width: 124px;
			font-weight: 400;
         	padding: 13px 20px 13px 45px;
		} 
		/* 기본정보 내용 글자 굵기 */
		form .bsc tr td:last-child {
			width: 400px;
			font-weight: 200;
		}
		/* 기본정보 틀 */
		form .contents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			border: 1px solid #bee2da;
          border-bottom: 2px solid #bfe3db;
		}
		
		form .contents .dtl, form .contents .dtl2 {
		    width: 997px;
		    font-size: 15px;
		    border-collapse: collapse;
		    font-weight: 300;
		    overflow: hidden;
		    border-top: 4px solid #6a5baf;
		}

		form .contents .dtl tbody, form .contents .dtl2 tbody {
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			width: 997px;		
		}
		
		form .contents .dtl thead, form .contents .dtl2 thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
		}
		/* 커서포인터 */
		form .contents .dtl tbody tr, form .contents .dtl2 tbody tr {
		    display: table;
		    width: 997px;
		    cursor: pointer;
		}		
		
		
		
		/* 발주정보 테이블 틀 나오게 하는 부분 */
		form .contents .dtl thead th, form .contents .dtl tbody tr td ,form .contents .dtl2 thead th, form .contents .dtl2 tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
		}
			
		
		/* 기본정보 싸이즈 조정 */
		form .contents .bsc tbody {			
			height: 576px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		
		/* 기본정보 글자색 */
		form .contents .bsc tr td {
			color: #0e8a67;
		}
		/* 기본정보 세로줄 나오는것 */
		form .contents .bsc tr td:first-child {
			box-shadow: inset -7px 0 9px -4px #d0e2de;
		}
		form .contents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
			background-color: #d3d3d3;
		}
		/* 제품정보>매출정보>백계약정보>매입정보 버튼 크기및 모양    */
		form .contents > .fxd .title ul li {
			width: 25%;
			line-height: 46px;
			color: #777777;
			background-color: #d3d3d3;
			border-radius: 35px;
		}
		form .contents .title ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		}
		form .contents > .fxd .title ul li > label {
			display: inline-block;
    		width: 100%;
    		/* cursor: pointer; */
		}
		form .contents > .fxd .title ul li.on,
		form .contents > .fxd .title ul li:hover  {
			color: #fff  !important;
			background-color: #4c3d92;
		}		
		
		form .contents .dtl tbody tr:hover, form .contents .dtl2 tbody tr:hover {
			background-color: #ddf0ec
		}
		
		/* 발주정보 세로싸이즈 */
		form .contents .dtl tbody {
			height: 176px;
		}
		
		/* 백계약정보 테이블 크기조정 */
		form .contents .dtl thead th:first-child,
		form .contents .dtl tbody td:first-child {
			width: 51px;
			padding: 0;
		}
		form .contents .dtl thead th:nth-child(2),
		form .contents .dtl tbody td:nth-child(2) {
			width: 51px;
		}
		form .contents .dtl thead th:nth-child(3),
		form .contents .dtl tbody td:nth-child(3) {
			width: 190px;
		}
		form .contents .dtl thead th:nth-child(4),
		form .contents .dtl tbody td:nth-child(4) {
			width: 100px;
		}
		form .contents .dtl thead th:nth-child(5) {
			width: 100px;
		}
		form .contents .dtl tbody td:nth-child(5) {
			width: 100px;
			text-align: right;
		}
		form .contents .dtl thead th:nth-child(6),
		form .contents .dtl tbody td:nth-child(6) {
			width: 80px;
		}
		form .contents .dtl thead th:nth-child(7),
		form .contents .dtl tbody td:nth-child(7){
			width: 100px;
		}
		form .contents .dtl thead th:nth-child(8),
		form .contents .dtl tbody td:nth-child(8) {
			width: 220px;
		}	
		/* 발주정보, 제품정보 글짜크기 */
		.dtl tbody tr td, .dtl2 tbody tr td {
			font-weight: 200;
		}
		
		/* 제품정보 세로싸이즈 */
		form .contents .dtl2 tbody {
			height: 247px;
		}
		/* 제품정보 테이블 크기조정 */
		.dtl2 thead th:first-child,
		.dtl2 tbody td:first-child {
			width: 51px;
		}
		.dtl2 thead th:nth-child(2),
		.dtl2 tbody td:nth-child(2) {
			width: 200px;
		}
		.dtl2 thead th:nth-child(3),
		.dtl2 tbody td:nth-child(3) {
			width: 60px;
		}
		.dtl2 thead th:nth-child(4),
		.dtl2 tbody td:nth-child(4) {
			width: 100px;
		}
		.dtl2 thead th:nth-child(5),
		.dtl2 tbody td:nth-child(5) {
			width: 110px;
		}
		.dtl2 thead th:nth-child(6),
		.dtl2 tbody td:nth-child(6) {
			width: 170px;
		}
		.dtl2 thead th:nth-child(7),
		.dtl2 tbody td:nth-child(7) {
			width: 200px;		
		}
		/* 제품정보에서 제품과 제품상세  ... 으로 표시. */
		.dtl2 tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 84%;
			margin: 0 auto;
		}
		/* 제품정보>제품에서 V 크기 및 위치  */
		.dtl2 tbody tr td img {
			width: 25px;
			vertical-align: top;
		}
		
		/* 제품정보 클릭했을때 나타나는 내용에서 제목(제품상세) */
		.detailList li:nth-child(2n-1) {
		    width: 82px;
		    font-weight: 400;
		    color: #158566;
		}
		/* 제품정보 클릭했을대 나타나는 내용 */
		.detailList li:nth-child(2n) {
			/* width: 316px; */
			overflow: hidden;
			/* text-overflow: ellipsis; */
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
	</style>
	<script>
		$(document).ready(function() {
			/* var index = $('form .contents > .fxd .title ul li.on').index() + 2;
			var length = $('form .contents > .fxd .title ul li').length; */
			
			/* $('li[id^=LI_TOPBar]').click(function(event){ location.href = this.title; event.preventDefault();}); */
			$('li[id^=LI_TOPBar]').click(function(event){
				/* location.href = this.title; 
				event.preventDefault(); 				
				alert(this.title);
				*/
				document.detailForm.action = this.title;
	           	document.detailForm.submit();
				
			});
			var html = '';
			$('#listForm .dtl2 tbody tr').click(function() {
				if($(this).attr('class') != "viewOpen") {
					html = '<div style="width:997px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>제품상세</li>'
					       + '<li>상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용</p> 상세내용 상세내용상세내용 상세내용 상세내용</li>'
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
			
			
			if("Y"==$('#mtWorkOrderYn').val()){
				$("#orderLabel").css('cursor','pointer');
				/* $("#LI_TOPBar_WO"). */
				
			}
			
			$('#listForm .dtl tr').each(function(index, item) {
				if(index != 0) {
					$(this).children().eq(0).append('<input type="radio" name="orderGubun" class="tCheck" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
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
									<td><c:out value="${basicContractInfo.viewCtDt}"/></td>
								</tr>
								<tr>
									<td>유지보수 기간</td>
									<td><c:out value="${basicContractInfo.viewStartDt}"/> ~ <c:out value="${basicContractInfo.viewEndDt}"/></td>
								</tr>
								<tr>
									<td>유지보수 금액</td>
									<td><c:out value="${basicContractInfo.viewAmount}"/></td>
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
						</div>
					</div>
				</div>
				<div class="floatR dpBlock fxd">
					<div class="title">
						<ul>
							<li id="LI_TOPBar_PD" title="/maintenance/contract/detail/productInfo.do"><label>제품정보</label></li>
							<li id="LI_TOPBar_SL" title="/maintenance/contract/detail/productInfo.do"><label>매출정보</label></li>
							<li id="LI_TOPBar_BC" class="on" title="/maintenance/contract/detail/backOrderInfo.do"><label>백계약정보</label></li>
							<li id="LI_TOPBar_PA" title="/maintenance/contract/detail/purchaseAmountInfo.do"><label>매입정보</label></li>
							<li></li>
						</ul>
					</div>
					<div id="listForm">
						<div class="stitle cg colorBlack">백계약정보&nbsp;<img class="veralignT" src="<c:url value='/images/btn_add.png'/>" /></div>
						<div class="floatC">
							<table class="dtl">
								<thead class="ftw400">
									<tr>
										<th scope="row">선택</th>
										<th scope="row">No</th>
										<th scope="row">매입처</th>
										<th scope="row">매입처담당자</th>
										<th scope="row">합계금액</th>
										<th scope="row">부가세포함</th>
										<th scope="row">발주일자</th>
										<th scope="row">결재조건</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td>1</td>
										<td>대원CTS </td>
										<td>홍길동</td>
										<td>6,160,000</td>
										<td>Y</td>
										<td>2020-11-15</td>
										<td>계산서 발행 후 90일</td>
									</tr>
									<tr>
										<td></td>
										<td>2</td>
										<td>케이디아이에스</td>
										<td>김길동</td>
										<td>24,160,000</td>
										<td>Y</td>
										<td>2020-11-01</td>
										<td>프로젝트 원청 수금 조건</td>
									</tr>
									<tr>
										<td></td>
										<td>3</td>
										<td>대원CTS </td>
										<td>홍길동</td>
										<td>7,160,000</td>
										<td>Y</td>
										<td>2020-11-15</td>
										<td>계산서 발행 후 30일</td>
									</tr>
									<tr>
										<td></td>
										<td>4</td>
										<td>케이디아이에스</td>
										<td>김길동</td>
										<td>24,160,000</td>
										<td>N</td>
										<td>2020-11-01</td>
										<td>프로젝트 원청 수금 조건</td>
									</tr>
									<tr>
										<td></td>
										<td>5</td>
										<td>케이디아이에스</td>
										<td>김길동</td>
										<td>24,160,000</td>
										<td>Y</td>
										<td>2020-11-01</td> 
										<td>계산서 발행 후 30일5</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="stitle cg colorBlack">제품정보</div>
						<div class="floatC">
							<table class="dtl2">
								<thead class="ftw400">
									<tr>
										<th scope="row">No</th>
										<th scope="row">제품</th>
										<th scope="row">수량</th>
										<th scope="row">단가</th>
										<th scope="row">합계</th>
										<th scope="row">시리얼번호</th>
										<th scope="row">계약기간</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td class="textalignR">3</td>
										<td class="textalignR">600,000,000</td>
										<td class="textalignR">1,800,000,000</td>
										<td>CKM0014450026112323</td>
										<td>2020-01-01 ~ 2020-12-31</td>
									</tr>
									<tr>
										<td>2</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td class="textalignR">3</td>
										<td class="textalignR">600,000,000</td>
										<td class="textalignR">1,800,000,000</td>
										<td>CKM0014450026112323</td>
										<td>2020-01-01 ~ 2020-12-31</td>
									</tr>
									<tr>
										<td>3</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td class="textalignR">3</td>
										<td class="textalignR">600,000,000</td>
										<td class="textalignR">1,800,000,000</td>
										<td>CKM0014450026112323</td>
										<td>2020-01-01 ~ 2020-12-31</td>
									</tr>
									<tr>
										<td>4</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td class="textalignR">3</td>
										<td class="textalignR">600,000,000</td>
										<td class="textalignR">1,800,000,000</td>
										<td>CKM0014450026112323</td>
										<td>2020-01-01 ~ 2020-12-31</td>
									</tr>
									<tr>
										<td>5</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td class="textalignR">3</td>
										<td class="textalignR">600,000,000</td>
										<td class="textalignR">1,800,000,000</td>
										<td>CKM0014450026112323</td>
										<td>2020-01-01 ~ 2020-12-31</td>
									</tr>
									<tr>
										<td>6</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td class="textalignR">3</td>
										<td class="textalignR">600,000,000</td>
										<td class="textalignR">1,800,000,000</td>
										<td>CKM0014450026112323</td>
										<td>2020-01-01 ~ 2020-12-31</td>
									</tr>
									<tr>
										<td>7</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td class="textalignR">3</td>
										<td class="textalignR">600,000,000</td>
										<td class="textalignR">1,800,000,000</td>
										<td>CKM0014450026112323</td>
										<td>2020-01-01 ~ 2020-12-31</td>
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