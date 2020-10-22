<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../cmm/inc.jsp" %>
<%@include file="../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>CEP 샘플 화면(프로젝트 상세보기)</title>
	<style>
		.fl {
			float: left;
		}
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
		form .contents > .fxd .title ul li,
		form .contents > .fxd .stitle ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		}
		form .contents > .fxd .title ul li:last-child,
		form .contents > .fxd .stitle ul li:last-child {
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
			/* color: #b1a5ec; */
			color: #777777;
			background-color: #d3d3d3;
		}
		.liArrow {
			background-image: url('./images/step_arrow.png');
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
			width: 915px;
		}
		#detailForm .stitle ul li {
			width: 150px;
		}
		#detailForm .stitle ul li a {
			color: #a3a3a4;
			padding-bottom: 10px;
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
			border-top: 4px solid #c3c3c3;;
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
		}
		form .contents .dtl tr td:last-child {
			width: 784px;
		}
		input[type="text"] {
		 	width: 177px;
		    height: 34px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 4px;
		}
		input[class="calendar"] {
		    background-image: url(./images/calendar_icon.png);
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		select {
			height: 37px;
		    width: 130px;
		    border: 1px solid #e9e9e9;
		    padding: 0 10px;
		    -webkit-appearance: none;
		    background: url(./images/arrow_down.png) no-repeat 91% 50%;
		    background-color: #fff;
		    color: #535353;
		    font-size: 15px;
		}
		textarea {
			border: 1px solid #e6e6e6;
			padding: 0 10px;
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
		label.radio {
		   overflow: hidden;
		   position: relative;
		   height: 26px;
		   box-sizing: border-box;
		   cursor: pointer;
		   margin-right: 17px;
		}
		label.radio input[type='radio'] {
			-webkit-appearance: none;
			width: 26px;
			height: 26px;
			border: 1px solid #e6e6e6;
			border-radius: 50%;
			outline: none;
			background: #e6e6e6;
			margin: 0 15px 0 0;
		}
		label.radio input[type='radio']:before {
			content:'';
			display: block;
			width: 60%;
			height: 60%;
			margin: 20% auto;  
			border-radius: 50%;  
		}
		label.radio input[type='radio']:checked {
			background: #7764cb;
		}
		label.radio input[type='radio']:checked:before {
		  	content: "\2713";
			color: #fff;
			line-height: 1.2;
			text-align: center;
		}
		form .contents .dtl#modTable ul li {
			float: left;
			width: 261px;		
			line-height: 2;
		}
		form .contents .dtl#modTable ul li:last-child {
			width: 465px;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(1) {
			width: 152px;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(2) {
			display: inline-block;
			font-size: 0;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(2) a {
			background-color: #e4e6f0;
			padding: 0px 10px;
			border: 1px solid #dcdde3;
			font-size: 16px;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(2) label {
			font-size: 16px;
			display: inline-block;
			width: 30px;
			text-align: center;
			border-top: 1px solid #dcdde3;
			border-bottom: 1px solid #dcdde3;
			line-height: 1.5;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(2) input[type="text"] {
			margin-right: 7px;
		}
		form .contents .dtl#modTable .fileName {
			display: table-cell;
			line-height: 32px;
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
			width: 190px;
		   color: #0e8a67;
		}
		#modBasicTable label {
			margin-left: 15px;
		}
		#modBasicTable input[class="calendar"] {
			width: 168px;
		}
	</style>
	<script>
		$(document).ready(function() {
			var index = $('form .contents > .fxd .title ul li.on').index() + 2;
			$('form .contents > .fxd .title ul li:nth-child(' + index + ')').toggleClass("liArrow");
		
			$('li[id^=LI_TOPBar]').click(function(event){ location.href = this.title; event.preventDefault();});
			
			var modCh = 1;
			$('#modInfo').click(function() {
				if(modCh % 2 == 1) {
					$("#selectTable").css('display','none');
					$('#modTable').css('display','block');
					$("#selectBasicTable").css('display','none');
					$("#modBasicTable").css('display','block');
				} else {
					alert('수정되었습니다.');
					location.reload();
				}
				modCh++;
			});
		
			$('.decreaseQuantity').click(function(e){
				e.preventDefault();
				var stat = $(this).next().text();
				var num = parseInt(stat,10);
				num--;
				if(num<=0){
					$(this).parent().parent().children().eq(0).children().eq(0).prop('checked', false);
				}
				if(num<=-1) {
					alert('더 이상 줄일 수 없습니다.');
					num =0;
				}
				$(this).next().text(num);
			});
			$('.increaseQuantity').click(function(e){
				e.preventDefault();
				var stat = $(this).prev().text();
				var num = parseInt(stat,10);
				num++;
	
				$(this).prev().text(num);
				$(this).parent().parent().children().eq(0).children().eq(0).prop('checked', true);
				
			});
			
			/* $('input[type="radio"]').click(function() {
				var classNm = $(this).attr('name');
				if($(this).val() == 'Y') {
					$('.'+classNm).css('display','inline-block');
				} else {
					$('.'+classNm).css('display','none');
				}	 
			}); */
			
		});
		
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
							<table class="bsc" id="selectBasicTable">
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
									<td>영업담당자</td>
									<td>
										<select>
											<option>길동이</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td>
										<select>
											<option>김규민</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>사업기간</td>
									<td>
										<input class="calendar" type="text" />&nbsp;&nbsp;~&nbsp;&nbsp;<input class="calendar" type="text" />
									</td>
								</tr>
								<tr>
									<td>비고</td>
									<td>
										<textarea rows="8" cols="45">
											비고 내용
										</textarea>
									</td>
								</tr>
							</table>
						</div>
						<div class="btnWrap lt">
							<div class="floatL">
								<a title="계산서 발행 요청" href="/requestBill.do"><img class="cursorP" src="<c:url value='/images/btn_req_bill.png'/>" /></a>
								<a title="매입금 지급 요청" href="/requestPurchase.do"><img class="cursorP" src="<c:url value='/images/btn_req_purchase.png'/>" /></a>
							</div>
						</div>
					</div>
				</div>
				<div class="floatR dpBlock fxd">
					<div class="title">
						<ul>
							<li id="LI_TOPBar_BD" class="on" title="/projectDetailBd.do">입찰</li>
							<li id="LI_TOPBar_CT" title="/projectDetailCt.do">계약</li>
							<li>발주</li>
							<li>수행</li>
							<li>완료</li>
							<li></li>
						</ul>
					</div>
					<div id="detailForm">
						<div class="stitle">
							입찰정보
						</div>
						<div class="floatC">
							<table class="dtl" id="selectTable">
								<tr>
									<td>입찰보증증권</td>
									<td>Y / 보증기간 2019.09.12 ~ 2020.09.12</td>
								</tr>
								<tr>
									<td>입찰서류</td>	
									<td>
										<ul>
											<li>사업자등록증 1</li>
											<li>법인등기부등본 2</li>
											<li>법인인감증명서 1</li>
											<li>사용인감계 2</li>
											<li>위임장 1</li>
											<li>대리인 명함 1</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td>입찰기한</td>
									<td>2019.09.12 15:00</td>
								</tr>
								<tr>
									<td>제안서</td>
									<td>Y / 접수마감 2019.09.12 15:00</td>
								</tr>
								<tr>
									<td>제안발표</td>
									<td>Y / 접수마감 2019.09.12 15:00</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td>첨부파일.txt</td>
								</tr>
							</table>
							<table class="dtl dpNone" id="modTable">
								<tr>
									<td>입찰보증증권</td>
									<td>
										<label class="radio"><input type="radio" name="bond" value="Y" checked/><span class="ico"></span><span class="text">Y</span></label>
										<label class="radio"><input type="radio" name="bond" value="N"/><span class="ico"></span><span class="text">N</span></label>
										<span class="bond">
											<label class="title">보증기간</label>
											<input class="calendar" type="text" /> ~ <input class="calendar" type="text" />
										</span>
									</td>
								</tr>
								<tr>
									<td>입찰서류</td>	
									<td>
										<ul>
											<li>
												<div class="fl">
													<input class="tCheck" type="checkbox" id ="bdKind1" name=""  value=""/>
													<label for="bdKind1" class="cursorP" ></label>
													<span class="cbspan">사업자등록증</span>
												</div>
												<div>
													<a href="#"  class="decreaseQuantity"><img src="./images/ic_minus.png" /></a>
													<label id="numberUpDown">0</label>
													<a href="#"  class="increaseQuantity"><img src="./images/ic_plus.png" /></a>
												</div>
											</li>
											<li>
												<div class="fl">
													<input class="tCheck" type="checkbox" id ="bdKind2" name=""  value=""/>
													<label for="bdKind2" class="cursorP" ></label>
													<span class="cbspan">법인등기부등본</span>
												</div>
												<div>
													<a href="#"  class="decreaseQuantity"><img src="./images/ic_minus.png" /></a>
													<label id="numberUpDown">0</label>
													<a href="#"  class="increaseQuantity"><img src="./images/ic_plus.png" /></a>
												</div>
											</li>
											<li>
												<div class="fl">
													<input class="tCheck" type="checkbox" id ="bdKind3" name=""  value=""/>
													<label for="bdKind3" class="cursorP" ></label>
													<span class="cbspan">법인인감증명서</span>
												</div>
												<div>
													<a href="#"  class="decreaseQuantity"><img src="./images/ic_minus.png" /></a>
													<label id="numberUpDown">0</label>
													<a href="#"  class="increaseQuantity"><img src="./images/ic_plus.png" /></a>
												</div>
											</li>
											<li>
												<div class="fl">
													<input class="tCheck" type="checkbox" id ="bdKind4" name=""  value=""/>
													<label for="bdKind4" class="cursorP" ></label>
													<span class="cbspan">사용인감계</span>
												</div>
												<div>
													<a href="#"  class="decreaseQuantity"><img src="./images/ic_minus.png" /></a>
													<label id="numberUpDown">0</label>
													<a href="#"  class="increaseQuantity"><img src="./images/ic_plus.png" /></a>
												</div>
											</li>
											<li>
												<div class="fl">
													<input class="tCheck" type="checkbox" id ="bdKind5" name=""  value=""/>
													<label for="bdKind5" class="cursorP" ></label>
													<span class="cbspan">위임장</span>
												</div>
												<div>
													<a href="#"  class="decreaseQuantity"><img src="./images/ic_minus.png" /></a>
													<label id="numberUpDown">0</label>
													<a href="#"  class="increaseQuantity"><img src="./images/ic_plus.png" /></a>
												</div>
											</li>
											<li>
												<div class="fl">
													<input class="tCheck" type="checkbox" id ="bdKind6" name=""  value=""/>
													<label for="bdKind6" class="cursorP" ></label>
													<span class="cbspan">대리인 명함</span>
												</div>
												<div>
													<a href="#"  class="decreaseQuantity"><img src="./images/ic_minus.png" /></a>
													<label id="numberUpDown">0</label>
													<a href="#"  class="increaseQuantity"><img src="./images/ic_plus.png" /></a>
												</div>
											</li>
											<li>
												<div class="fl">
													<input class="tCheck" type="checkbox" id ="bdKind7" name=""  value=""/>
													<label for="bdKind7" class="cursorP" ></label>
													<span class="cbspan">기타 서류</span>
												</div>
												<div>
													<input type="text" />
													<a href="#"  class="decreaseQuantity"><img src="./images/ic_minus.png" /></a>
													<label id="numberUpDown">0</label>
													<a href="#"  class="increaseQuantity"><img src="./images/ic_plus.png" /></a>
												</div>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td>입찰기한</td>
									<td>
										<input class="calendar" type="text" />
										<select>
											<option>09:00</option>
											<option>10:00</option>
											<option>11:00</option>
											<option>12:00</option>
											<option>13:00</option>
											<option>14:00</option>
											<option>15:00</option>
											<option>16:00</option>
											<option>17:00</option>
											<option>18:00</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>제안서</td>
									<td>
										<label class="radio"><input type="radio" name="bizPlan" value="Y" /><span class="ico"></span><span class="text">Y</span></label>
										<label class="radio"><input type="radio" name="bizPlan" value="N"/><span class="ico"></span><span class="text">N</span></label>
										<span class="bizPlan">
											<label class="title">접수마감</label>
											<input class="calendar" type="text" />
											<select>
												<option>09:00</option>
												<option>10:00</option>
												<option>11:00</option>
												<option>12:00</option>
												<option>13:00</option>
												<option>14:00</option>
												<option>15:00</option>
												<option>16:00</option>
												<option>17:00</option>
												<option>18:00</option>
											</select>
										</span>
									</td>
								</tr>
								<tr>
									<td>제안발표</td>
									<td>
										<label class="radio"><input type="radio" name="announce" value="Y" /><span class="ico"></span><span class="text">Y</span></label>
										<label class="radio"><input type="radio" name="announce" value="N"/><span class="ico"></span><span class="text">N</span></label>
										<span class="announce">
											<label class="title">접수마감</label>
											<input class="calendar" type="text" />
											<select>
												<option>09:00</option>
												<option>10:00</option>
												<option>11:00</option>
												<option>12:00</option>
												<option>13:00</option>
												<option>14:00</option>
												<option>15:00</option>
												<option>16:00</option>
												<option>17:00</option>
												<option>18:00</option>
											</select>
										</span>
									</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td>
										<button class="fl"><img src="./images/btn_file_upload.png" /></button>
										<label class="fileName">기존첨부파일.txt</label>
									</td>
								</tr>
							</table>
						</div>
						<div class="btnWrap rt">
							<div class="floatR">
								<button type="button" value="수행일지"><img class="cursorP" src="<c:url value='/images/btn_perform_record.png'/>" /></button>
								<button type="button" value="첨부파일"><img class="cursorP" src="<c:url value='/images/btn_file.png'/>" /></button>
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