<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
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
		}
		form .contents .bsc tr td {
			color: #0e8a67;
		}
		form .contents .bsc tr td:first-child {
			box-shadow: inset -7px 0 9px -4px #d0e2de;
		}
		form .contents ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		}
		form .contents ul li:last-child {
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
			color: #777777;
			background-color: #d3d3d3;
		}
		form .contents > .fxd .title ul li > label {
			display: inline-block;
    		width: 100%;
    		cursor: pointer;
		}
		form .contents > .fxd .title ul li:after {
		    border-color: #d3d3d3 #d3d3d3 #d3d3d3 #d3d3d3;
		    border-style: solid;
		    border-width: 23px 14px;
		    width: 0;
		    height: 0;
		    display: inline-block;
		    content: "";
		    position: absolute;
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
		}
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
		#detailForm .stitle ul {
			width: 100%;
		}
		#detailForm .stitle ul li {
			width: 33.3%;
		}
		#detailForm .stitle ul li a {
			color: #a3a3a4;
			padding-bottom: 11px;
			display: block;
    		border-bottom: 4px solid #c3c3c3;
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
		form .contents .dtl tr td:first-child {
			background-color: #e1dff5;
			border-right: 1px solid #ebe9ee;
			color: #535353;
		}
		form .contents .dtl tr td:last-child {
			width: 757px;
		}
	</style>
	<script>
		$(document).ready(function() {
			var index = $('form .contents > .fxd .title ul li.on').index() + 2;
			var length = $('form .contents > .fxd .title ul li').length;
			$('form .contents > .fxd .title ul li:nth-child(' + index + ')').toggleClass("liArrow");
		
			for(var i = 0; i < length; i++) {
				if(i < index) {
					$('form .contents > .fxd .title ul li:nth-child(' + i + ')').css("background-color","#4c3d92");
					$('form .contents > .fxd .title ul li:nth-child(' + i + ')').addClass('liAfterNone');
				}
			}
			
			$('li[id^=LI_TOPBar]').click(function(event){ location.href = this.title; event.preventDefault();});
			
			$('form .contents > .fxd .title ul li').mouseover(function(){ 
				var index2 = $('form .contents > .fxd .title ul li').index(this);
				for(var i = (index - 1); i <= index2; i++) {
					if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on') {
						$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').css('background-color','#b9b9b9');
					} 
					if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on' && (i + 1) <= index2) {
						$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').addClass('liAfter');
					}
				}
			});
			
			$('form .contents > .fxd .title ul li').mouseout(function(){ 
				var index2 = $('form .contents > .fxd .title ul li').index(this);
				for(var i = (index - 1); i <= index2; i++) {
					if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on') {
						$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').css('background-color','#d3d3d3');
					}
					if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on' && (i + 1) <= index2) {
					 	$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').removeClass('liAfter'); 
					}
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
	<form id="listForm" name="listForm" method="post">
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="floatL">
					<div class="title"><label class="ftw500">프로젝트 상세정보</label></div>
					<div>
						<div class="stitle cg">기본정보</div>
						<div id="basicForm">
							<table class="bsc">
								<tr>
									<td>프로젝트명</td>
									<td>VDI중요단말 환경구축 및 노후장비 교체</td>
								</tr>
								<tr>
									<td>고객사</td>
									<td>미래에셋생명 / 담당자: 홍길동</td>
								</tr>
								<tr>
									<td>영업담당자</td>
									<td>홍길동</td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td>홍길동</td>
								</tr>
								<tr>
									<td>사업기간</td>
									<td>2019.12.12 ~ 2020.12.12</td>
								</tr>
								<tr>
									<td>비고</td>
									<td>비고 내용</td>
								</tr>
							</table>
						</div>
						<div class="btnWrap lt">
							<div class="floatL">
								<a title="계산서 발행 요청" href="/project/requestBill.do"><img class="cursorP" src="<c:url value='/images/btn_req_bill.png'/>" /></a>
								<a title="매입금 지급 요청" href="/project/requestPurchase.do"><img class="cursorP" src="<c:url value='/images/btn_req_purchase.png'/>" /></a>
								<a title="판매 품의서" href="/project/viewApproval.do"><img class="cursorP" src="<c:url value='/images/btn_approval.png'/>" /></a>
							</div>
						</div>
					</div>
				</div>
				<div class="floatR dpBlock fxd">
					<div class="title">
						<ul>
							<li id="LI_TOPBar_BD" title="/project/detail/bidding.do"><label>입찰</label></li>
							<li id="LI_TOPBar_CT" title="/project/detail/contract.do"><label>계약</label></li>
							<li id="LI_TOPBar_OD" class="on" title="/project/detail/order.do"><label>발주</label></li>
							<li><label>수행</label></li>
							<li><label>완료</label></li>
							<li></li>
						</ul>
					</div>
					<div id="detailForm">
						<div class="stitle mgb0">
							<ul>
								<li><a>사전작업/납품</a></li>
								<li><a class="on">설치/구축</a></li>
								<li><a>수행 일지</a></li>
								<li></li>
							</ul>
						</div>
						<div class="floatC">
							<table class="dtl">
								<tr>
									<td>설치장소</td>
									<td>미래에셋 생명 데이터센터</td>
								</tr>
								<tr>
									<td>구분</td>
									<td>신규</td>
								</tr>
								<tr>
									<td>모델명</td>
									<td>VNX5400</td>
								</tr>
								<tr>
									<td>시리얼번호</td>
									<td>CKM00144500261</td>
								</tr>
								<tr>
									<td>납품일</td>
									<td>2019.12.12 ~ 2020.12.12</td>
								</tr>
								<tr>
									<td>버전</td>
									<td>05.33.006.5.102</td>
								</tr>
								<tr>
									<td>주요스펙</td>
									<td>Disk: 400GB Flash Drives x 25EA DA: max 40EA</td>
								</tr>
								<tr>
									<td>캐쉬메모리</td>
									<td>32GB</td>
								</tr>
								<tr>
									<td>포트정보</td>
									<td>FC Ports: 8Gbps FC x 4 Ports</td>
								</tr>
								<tr>
									<td>관리아이피</td>
									<td>192.168.1.162.50, 192.168.162.52, 192.168.162.53</td>
								</tr>
								<tr>
									<td>장비유형</td>
									<td>Block</td>
								</tr>
								<tr>
									<td>기타</td>
									<td>특이사항 없음</td>
								</tr>
							</table>
						</div>
						<div class="btnWrap rt">
							<div class="floatR">
								<button value="수행일지"><img class="cursorP" src="<c:url value='/images/btn_perform_record.png'/>" /></button>
								<button value="첨부파일"><img class="cursorP" src="<c:url value='/images/btn_file.png'/>" /></button>
								<button value="수정"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
								<button value="삭제"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
								<button type="button" value="실주등록"  onclick="javascript:fn_addView('writeLoseInfo')"><img class="cursorP" src="<c:url value='/images/btn_loss.png'/>" /></button>
								<button value="Excel"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
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