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
			font-size: 15px;
		} 
		form .contents > div > div > div > table tr td {
			padding: 13px 20px;
		}
		 
		form .contents .dtl2 tr td {
			padding: 6px 20px;
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
		form .contents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
			background-color: #d3d3d3;
		}
		form .contents > .fxd .title ul li {
			width: 50%;
			line-height: 46px;
			color: #777777;
			background-color: #d3d3d3;
			border-radius: 35px;
		}
		form .contents > .fxd .title ul li:last-child,
		form .contents > .fxd .stitle ul li:last-child {
			clear: both;
			float: none;
			width: 0 !important;
		}
		/* form .contents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
		}
		form .contents > .fxd .title ul li {
			width: 50%;
			line-height: 46px;
			color: #777777;
			background-color: #d3d3d3;
		} */
/* 		form .contents > .fxd .title ul li > label {
			display: inline-block;
    		width: 100%;
    		cursor: pointer;
		}
		form .contents .title ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		} */
		/* form .contents > .fxd .title ul li:after {
		    border-color: #d3d3d3 #d3d3d3 #d3d3d3 #d3d3d3;
		    border-style: solid;
		    border-width: 23px 14px;
		    width: 0;
		    height: 0;
		    display: inline-block;
		    content: "";
		    position: absolute;
		    z-index: 0;
		} 
		form .contents > .fxd .title ul li:nth-child(5):after,
		form .contents > .fxd .title ul li:last-child:after {
			display: none;
		}
		form .contents > .fxd .title ul li.on:after {
			display: none;
		}
		form .contents > .fxd .title ul li:hover:after {
			border-color: #d3d3d3 #d3d3d3 #d3d3d3 #b9b9b9;
		} */
		.liAfter:after {
			border-color: #b9b9b9 #b9b9b9 #b9b9b9 #b9b9b9 !important;
		}
		.liAfterNone:after {
			display: none !important;
		}
		.liArrow {
			background-image: url('http://172.10.122.10:8888/images/step_arrow.png');
			background-repeat: no-repeat;
		}
/* 		form .contents > .fxd .title ul li:first-child {
			border-radius: 35px 0 0 35px;
		}
		form .contents > .fxd .title ul li:nth-last-child(2)  {
			border-radius: 0 35px 35px 0;
		} */
		
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
			width: 50%;
			line-height: 46px;
			color: #777777;
			background-color: #d3d3d3;
			border-radius: 35px;
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
		form .contents .dtl, form .contents .dtl2 {
			border-top: 4px solid #6a5baf;
			overflow: hidden;
		}
		form .contents .dtl tbody, form .contents .dtl2 tbody {
			overflow-y: auto;
			overflow-x: hidden;
			height: 577px;
			float: left;
		}
		form .contents .dtl tbody tr, form .contents .dtl2 tbody tr {
			border: 1px solid #ebe9ee;
		}
		form .contents .dtl td, form .contents .dtl2 td {
			color: #000;
		}
		form .contents .dtl tr td:first-child, form .contents .dtl2 tr td:first-child {
			background-color: #e1dff5;
			border-right: 1px solid #ebe9ee;
		}
		form .contents .dtl tr td:last-child, form .contents .dtl2 tr td:last-child {
			width: 784px;
		}
		input[type="text"] {
		 	width: 138px;
		    height: 34px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 4px;
		}
		input[class^="calendar"] {
		    background-image: url(/images/calendar_icon.png);
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		select {
			height: 35px;
		    width: 160px;
		    border: 1px solid #e9e9e9;
		    padding: 0 10px;
		    -webkit-appearance: none;
		    background: url(/images/arrow_down.png) no-repeat 91% 50%;
		    background-color: #fff;
		    color: #535353;
		    font-size: 15px;
		}
		textarea {
			border: 1px solid #e6e6e6;
			padding: 0 10px;
			width: 746px;		
			resize: none;
		}
		select.nrslct {
			width: 100px !important;
		}
		form .contents .dtl label.title {
			margin: 0 8px 0 20px;
		}
		form .contents .dtl span.cbspan {
			display: inline-block;
			vertical-align: top;
			line-height: 1.8;
			margin-left: 5px;
		}
		form .contents .dtl#modTable ul li {
			float: left;
			width: 261px;		
			line-height: 2;
		}
	</style>
	<script>
		$(document).ready(function() {
			/* var index = $('form .contents > .fxd .title ul li.on').index() + 2;
			var length = $('form .contents > .fxd .title ul li').length; */
			
			$('li[id^=LI_TOPBar]').click(function(event){ location.href = this.title; event.preventDefault();});
			
			
			if("Y"==$('#mtWorkOrderYn').val()){
				$("#orderLabel").css('cursor','pointer');
				/* $("#LI_TOPBar_WO"). */
				
			}
			
			$('#modInfo').click(function() {
				
				$('#modTable').show();
				$('#selectTable').hide();
				/* if(modCh % 2 == 1) {
					$("#selectTable").css('display','none');
					$('#modTable').css('display','block');
					$("#selectBasicTable").css('display','none');
					$("#modBasicTable").css('display','block');
				} else {
					alert('수정되었습니다.');
					location.reload();
				}
				modCh++; */
			});
			
		});
		
		function fn_addView(){
			/* if(link == "forecastList") {
				location.href="<c:url value='/forecastList.do'/>";
			} else { */
				var url = '/maintenance/work/write/basicInfo.do';
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
				<div class="floatL">
					<div class="title"><label class="ftw500">유지보수작업 상세정보</label></div>
					<div>
						<div class="stitle cg">기본정보</div>
						<div id="basicForm">
							<table class="bsc" id="selectBasicTable">
								<tr>
									<td>프로젝트명</td>
									<td>VDI중요단말 환경구축 및 노후장비 교체</td>
								</tr>
								<tr>
									<td>고객사</td>
									<td>미래에셋생명</td>
								</tr>
								<tr>
									<td>고객사담당자</td>
									<td>홍길동 / 차장 / 010-9999-8888 / asdfg@naver.com</td>
								</tr>
								<tr>
									<td>관리담당자</td>
									<td>홍길동</td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td>김규민</td>
								</tr>
								<tr>
									<td>영업담당자</td>
									<td>김규민</td>
								</tr>
								<tr>
									<td>유지보수 금액</td>
									<td>100,000,000</td>
								</tr>
								<tr>
									<td>결제조건</td>
									<td>당월 25일</td>
								</tr>
								<tr>
									<td>유지보수 기간</td>
									<td>2019-12-12 ~ 2020-12-12</td>
								</tr>
								<tr>
									<td>계약일자</td>
									<td>2020-12-02</td>
								</tr>
								<tr>
									<td>보증증권 유무</td>
									<td>Y <label class="file">보증증권.pdf</label></td>
								</tr>
								<tr>
									<td>비고</td>
									<td>비고 내용</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="floatR dpBlock fxd">
					<div class="title">
						<ul>
							<li id="LI_TOPBar_WB" class="on" title="/maintenance/work/detail/basicInfo.do"><label style="cursor: pointer;">작업정보</label></li>
							<li id="LI_TOPBar_WO" title="/maintenance/work/detail/orderInfo.do"><label id="orderLabel">발주정보</label></li>
							<li></li>
						</ul>
					</div>
					<div id="detailForm">
						<div class="stitle cg colorBlack">작업정보</div>
						<div class="floatC">
							<table class="dtl" id="selectTable">
								<tr>
									<td>고객담당자</td>
									<td>홍길동</td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td>김규민1</td>
								</tr>
								<tr>
									<td>작업기간</td>
									<td>2019.09.12 15:00 ~ 2019.09.12 20:00</td>
								</tr>
								<tr>
									<td>작업유형</td>
									<td>정기점검</td>
								</tr>
								<tr>
									<td>조치결과</td>
									<td>완료</td>
								</tr>
								<tr>
									<td>추가발주유무</td>
									<td>N</td>
								</tr>								
								<tr>
									<td>지원내용</td>
									<td>
									지원내용지원내용지원내용</p>
									지원내용지원내용지원내용</p>
									지원내용지원내용지원내용</p>
									지원내용지원내용지원내용</p>
									지원내용지원내용지원내용</p>
									</td>
								</tr>
								<tr>
									<td>비고</td>
									<td>
										비고비고비고</p>
										비고비고비고</p>
										비고비고비고</p>
										비고비고비고</p>
										비고비고비고</p>
									</td>
								</tr>
							</table>
							<table class="dtl2" id="modTable" style="display:none">
								<tr>
									<td>고객담당자</td>
									<td>
										<select id="acDirectorKey" name="acDirectorKey" >
										<option value="">선택</option>
										<%-- <c:forEach var="director" items="${acDirectorList}" varStatus="status">										
										<option value="<c:out value="${director.directorKey}"/>"><c:out value="${director.directorNm}"/></option>
										</c:forEach> --%>									
										</select>	
									</td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td>
										<select name="mtWorkEmpKey">
											<option value="">선택</option>
											<c:forEach var="emp" items="${empList}" varStatus="status">										
											<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
											</c:forEach>	
										</select>									
									</td>
								</tr>
								<tr>
									<td>작업기간</td>
									<td>										
										<input type="text" name="mtWorkStartDt" placeholder="from" class="calendar fromDt" />&nbsp;<input type="text" name="mtWorkStartTm" style="width: 50px" />&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp; 
										<input type="text" name="mtWorkEndDt" placeholder="to" class="calendar toDt" />&nbsp;<input type="text" name="mtWorkEndTm" style="width: 50px" />
									</td>
								</tr>
								<tr>
									<td>작업유형</td>
									<td>
										<select name="mtWorkTypeCd">
											<option value="정기점검">정기점검</option>
											<option value="장애처리">장애처리</option>
											<option value="기술지원">기술지원</option>
										</select>									
									</td>
								</tr>
								<tr>
									<td>조치결과</td>
									<td>
										<select name="mtWorkResultCd">
											<option value="준비">준비</option>
											<option value="진행">진행</option>
											<option value="완료">진행</option>
										</select>									
									</td>
								</tr>
								<tr>
									<td>추가발주유무</td>
									<td>
										<select id="mtWorkOrderYn" name="mtWorkOrderYn">
											<option value="N">N</option>
											<option value="Y">Y</option>
										</select>									
									</td>
								</tr>	
								<tr>
									<td>지원내용</td>
									<td>
										<textarea name="mtWorkCont" style="height: 122px"></textarea>
									</td>
								</tr>
								<tr>
									<td>비고</td>
									<td>
										<textarea name="remark" style="height: 121px"></textarea>
									</td>
								</tr>
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