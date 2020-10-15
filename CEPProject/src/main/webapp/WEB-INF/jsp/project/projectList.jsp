<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../cmm/inc.jsp" %>
<%@include file="../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>CEP 샘플 화면(프로젝트 list)</title>
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
		.middle table tbody tr td:nth-child(4),
		.middle table tbody tr td:nth-child(9) {
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
			width: 178px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 413px;
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
			width: 102px;
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
			width: 126px;
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
			
			$('#pl tr').each(function(index, item) {
				if(index != 0) {
					$(this).children().eq(0).append('<input type="checkbox" class="tCheck" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
				}
				switch($(this).children().eq(8).children().eq(0).val()) {
					case 'PF': $(this).children().eq(8).css('color','#32bc94');break;
					case 'CT': $(this).children().eq(8).css('color','#4f4f4f');break;
					case 'BD': $(this).children().eq(8).css('color','#915be2');break;
					case 'CP': $(this).children().eq(8).css('color','#8093f2');break;
					case 'OD': $(this).children().eq(8).css('color','#e1cb15');break;
					default: $(this).children().eq(8).css('color','#000');break;
				} 
			});
			
			$('#pl tr').click(function() {
				/* $.ajax({
					url: '/example.projectDetail.do',
					param: $('#listFrom').serialize(),
					cache : false,
					async : false,
					dataType : "json",
					
					success: function(response) {
						$('#listForm').submit();
					},
					
					error: function(request, status, error) {
						if(request.status != '0') {
							alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
						}
					}
				}); */
				location.href = "/projectDetailBd.do";
				/* if(event.target.nodeName=="TD"){
					location.href = "/projectDetailBd.do";
				} */ 
				
				
				
				/* if($(this).children().eq(0)){
					alert("==>"+$(this).children().eq(0).children().eq(0).val()+"<==");
				} else{
					alert("bbbb");
				} */
				
			});
		});

		/* function fn_addView(){
			var url = '/writeProject.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:495px'); 
		} */
		
		function fn_addView(){
			var url = '/writeBasicInfo.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}

		function fn_addView1(){
			var url = '/writeLoseInfo.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}

		function fn_addView2(){
			var url = '/mappingBill.do';
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
	<form id="listForm" name="listForm" method="post">
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">프로젝트 list</label></div>
						<div class="addBtn floatL cursorP" onclick="fn_addView();"><img src="<c:url value='/images/btn_add.png'/>" /></div>						
						<div class="addBtn floatL cursorP" onclick="fn_addView1();"><img src="<c:url value='/images/btn_add.png'/>" /></div>				
						<div class="addBtn floatL cursorP" onclick="fn_addView2();"><img src="<c:url value='/images/btn_add.png'/>" /></div>
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
					<table class="textalignC ftw200" id="pl">
						<thead class="ftw400">
							<tr>
								<th scope="row">선택</th>
								<th scope="row">계약번호</th>
								<th scope="row">고객사</th>
								<th scope="row">프로젝트명</th>
								<th scope="row">시작일</th>
								<th scope="row">종료일</th>
								<th scope="row">프로젝트기간</th>
								<th scope="row">남은기간</th>
								<th scope="row">상태</th>
								<th scope="row">영업담당자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td onclick="event.cancelBubble = true;"></td>
								<td>002-2018-1220</td>
								<td>미래에셋생명</td>
								<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>71일</td>
								<td>71일</td>
								<td><input type="hidden" value="PF" />수행</td>
								<td>홍길동차장</td>
							</tr>
							<tr>
								<td onclick="event.cancelBubble = true;"></td>
								<td>002-2018-1220</td>
								<td>미래에셋생명</td>
								<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>71일</td>
								<td>71일</td>
								<td><input type="hidden" value="CT" />계약</td>
								<td>홍길동차장</td>
							</tr>
							<tr>
								<td onclick="event.cancelBubble = true;"></td>
								<td>002-2018-1220</td>
								<td>미래에셋생명</td>
								<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>71일</td>
								<td>71일</td>
								<td><input type="hidden" value="BD" />입찰</td>
								<td>홍길동차장</td>
							</tr>
							<tr>
								<td onclick="event.cancelBubble = true;"></td>
								<td>002-2018-1220</td>
								<td>미래에셋생명</td>
								<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>71일</td>
								<td>71일</td>
								<td><input type="hidden" value="CP" />완료</td>
								<td>홍길동차장</td>
							</tr>
							<tr>
								<td onclick="event.cancelBubble = true;"></td>
								<td>002-2018-1220</td>
								<td>미래에셋생명</td>
								<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>71일</td>
								<td>71일</td>
								<td><input type="hidden" value="OD" />발주</td>
								<td>홍길동차장</td>
							</tr>
							<tr>
								<td onclick="event.cancelBubble = true;"></td>
								<td>002-2018-1220</td>
								<td>미래에셋생명</td>
								<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>71일</td>
								<td>71일</td>
								<td><input type="hidden" value="PF" />수행</td>
								<td>홍길동차장</td>
							</tr>
							<tr>
								<td onclick="event.cancelBubble = true;"></td>
								<td>002-2018-1220</td>
								<td>미래에셋생명</td>
								<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>71일</td>
								<td>71일</td>
								<td><input type="hidden" value="CT" />계약</td>
								<td>홍길동차장</td>
							</tr>
							<tr>
								<td onclick="event.cancelBubble = true;"></td>
								<td>002-2018-1220</td>
								<td>미래에셋생명</td>
								<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>71일</td>
								<td>71일</td>
								<td><input type="hidden" value="BD" />입찰</td>
								<td>홍길동차장</td>
							</tr>
							<tr>
								<td onclick="event.cancelBubble = true;"></td>
								<td>002-2018-1220</td>
								<td>미래에셋생명</td>
								<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>71일</td>
								<td>71일</td>
								<td><input type="hidden" value="CP" />완료</td>
								<td>홍길동차장</td>
							</tr>
							<tr>
								<td onclick="event.cancelBubble = true;"></td>
								<td>002-2018-1220</td>
								<td>미래에셋생명</td>
								<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>71일</td>
								<td>71일</td>
								<td><input type="hidden" value="OD" />발주</td>
								<td>홍길동차장</td>
							</tr>
							<tr>
								<td onclick="event.cancelBubble = true;"></td>
								<td>002-2018-1220</td>
								<td>미래에셋생명</td>
								<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>71일</td>
								<td>71일</td>
								<td><input type="hidden" value="CT" />계약</td>
								<td>홍길동차장</td>
							</tr>
							<tr>
								<td onclick="event.cancelBubble = true;"></td>
								<td>002-2018-1220</td>
								<td>미래에셋생명</td>
								<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>71일</td>
								<td>71일</td>
								<td><input type="hidden" value="BD" />입찰</td>
								<td>홍길동차장</td>
							</tr>
							<tr>
								<td onclick="event.cancelBubble = true;"></td>
								<td>002-2018-1220</td>
								<td>미래에셋생명</td>
								<td>VDI 중요단말기 환경 구축 및 노후장비교체</td>
								<td>2018-12-12</td>
								<td>2018-12-12</td>
								<td>71일</td>
								<td>71일</td>
								<td><input type="hidden" value="PF" />수행</td>
								<td>홍길동차장</td>
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