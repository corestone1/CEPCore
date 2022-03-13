<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<%@include file="/WEB-INF/jsp/cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>거래처 목록(Account list)</title>
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
			/* box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1); */
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
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
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
			height: 600px;
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
		.middle table thead th, .middle table tbody tr td {
			padding: 10px;
			border: 1px solid #edebef;
		}
		.middle table thead th:first-child,
		.middle table tbody td:first-child {
			width: 50px; 
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 40px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 237px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 90px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 120px;
		}
		.middle table thead th:nth-child(6),
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(6),
		.middle table tbody td:nth-child(7) {
			width: 69px;
		}
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(8),
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9) {
			width: 125px;
		}
		.middle table thead th:nth-child(10),
		.middle table tbody td:nth-child(10) {
			max-width: 762px;
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
			width: 305px;
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
		.middle tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 95%;
			margin: 2px 5px 0px 10px;
		}
		.middle tbody tr td a {
			color: #000;
			font-weight: 300;
		}			
	</style>
	<script>
	
		function fn_search() {
			document.listForm.action = "/mngCommon/account/list.do";
	       	document.listForm.submit(); 
		}
		
		function fn_detail(acKey) {
			var form = document.listForm;
			form.acKey.value = acKey;
			form.action = "/mngCommon/account/detail.do";	
			form.submit();
		}
	
		$(document).ready(function() {
			$("input:radio[id*='check']").each(function() {
				$(this).click(function() {
					$("#acKey").val($(this).val());
				});
			});
			
			$('#btn_delete').click(function() {
				
				if($('input[name="gubun"]').is(':checked')) {
					if(confirm("선택한 내용을 삭제하시겠습니까?")) {
						
						var litIdx = $('input[name="gubun"]:checked').val();
						
						var jsonData = {'acKey' : litIdx};
						
			            $.ajax({
				        	url :"/mngCommon/account/delete.do",
				        	type:"POST",  
				            data: jsonData,
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				     	   	dataType: 'json',
				           	async : false,
				        	success:function(data){		  
				            	alert("삭제되었습니다.");
				            	location.reload();
				            },
				        	error: function(request, status, error) {
				        		if(request.status != '0') {
				        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
				        		}
				        	} 
				        });  
			           	
			           	
			           	
					} else {
						return false;
					}
					
				} else {
					alert("삭제할 대상을 선택하세요.");
					
					return false;
				}				
			});
		});

		function fn_addView(type){
			if(type == "mod") {
				if($('input[name="gubun"]').is(':checked')) {
					var url = '/mngCommon/account/write.do';
					var dialogId = 'program_layer';
					var varParam = {};
					if(type == "write") {
						varParam = {
							acKey:""
						};
					} else {
						varParam = {
							acKey: $("#acKey").val()
						}; 
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:741px;'); 
				} else {
					alert("수정할 대상을 선택하세요.");
				}
			} else {
				var url = '/mngCommon/account/write.do';
				var dialogId = 'program_layer';
				var varParam = {};
				if(type == "write") {
					varParam = {
						acKey:""
					};
				} else {
					varParam = {
						acKey: $("#acKey").val()
					}; 
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:741px'); 
			}
			
		}

		
	</script>
</head>
<body>
	<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
		<input type="hidden" name="acKey" id="acKey" />
		<!-- <div class="sfcnt"></div> -->
		<!-- <div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">거래처 목록</label></div>
						<div class="addBtn floatL cursorP" onclick="javascript:fn_addView('write')"><img src="<c:url value='/images/btn_add.png'/>" /></div>
					</div>
					<div class="floatR">		
						<form:select path="searchCondition">
							<form:option value="NM">거래처명</form:option>
							<form:option value="KY">사업자번호</form:option>
						</form:select>				
						<form:input path="searchKeyword" type="text" class="search" placeholder="검색어" onKeyPress="if(event.keyCode==13){fn_search();}"/>
						<span id="span_search" class="veralignT cursorP" onclick="javascript:fn_search()"><img src="/images/icon_search.png" /></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200 excelSheet" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">선택</th>
								<th scope="row">No</th>
								<th scope="row">거래처명</th>
								<th scope="row">대표자명</th>
								<th scope="row">사업자번호</th>
								<th scope="row">매출거래처</th>
								<th scope="row">매입거래처</th>
								<th scope="row">대표번호</th>
								<th scope="row">대표FAX</th>
								<th scope="row">주소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="result" items="${accountList }" varStatus="status">
								<tr>
									<td onclick="event.cancelBubble = true;">
										<input type="radio" class="tRadio" name="gubun" id="check${status.count }" value="${result.acKey }"/>
										<label for="check${status.count }" class="cursorP"/>
									</td>
									<td>${status.count }</td>
									<td class="textalignL"><span style="max-width:145px;" title="${result.acNm}"><a href="javascript:fn_detail('${result.acKey}')" ><c:out value="${result.acNm}"/></a></span></td>
									<td><span title="${result.acCeoNm}" style="max-width: 74px;">${result.acCeoNm }</span></td>
									<td>${displayUtil.makeActypeForm(result.acBusiNum)}</td>
									<td>${result.acSalesYn }</td>
									<td>${result.acBuyYn }</td>
									<td>${result.acRepTel }</td>
									<td>${result.acRepFax }</td>
									<td class="textalignL"><span style="max-width:512px;" title="${result.acAddr } ${result.acAddrDetail }">${result.acAddr } ${result.acAddrDetail }</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<div class="floatR">
						<button type="button" value="수정" onclick="javascript:fn_addView('mod')"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
						<button type="button" id='btn_delete' value="삭제"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
						<button type="button" id="excelExport"value="엑셀 다운로드"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>