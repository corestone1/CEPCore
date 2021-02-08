<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<%@include file="/WEB-INF/jsp/cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>CEP 샘플 화면(프로젝트 list)</title>
	<style>
		.middle tbody a {
			color: #000;
		}
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
		.middle table tbody tr td span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			margin-left: 15px;
			vertical-align: middle;
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
		input[class^="calendar"] {
			width: 150px;
		    background-image: url('/images/calendar_icon.png');
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
			cursor: pointer;
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
		});
		
		function fn_addView(){
			var url = '/project/write/basicInfo.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_search() {
			var html = '';
	        var page = '';
	        $.ajax({
	        	url: "/project/searchList.do",
	        	type: "POST",
	        	data: JSON.stringify({searchKeyword:$('#searchKeyword').val(), searchFromDt: $("#searchFromDt").val(), searchToDt: $("#searchToDt").val()}),
	        	dataType: "json",
	        	contentType: "application/json; charset=UTF-8",
	        
	        	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);
	        		//xhr.setRequestHeader(header, token);
	        	},
	        	success: function(response) {
	        		if(response != null && response.successYN == 'Y') {
	        			for(i = 0; i < response.resultList.length; i++) {
							html += '<tr>'
											+ '<td onclick="event.cancelBubble = true;"><input type="checkbox" class="tCheck" id="check' + (i+1) + '"/><label for="check' + (i+1) + '" class="cursorP"/></td>'
					        				+ '<td align="center" class="listtd">'+ response.resultList[i].pjKey +'</td>'
				        					+ '<td align="left" class="listtd"><span>'+ response.resultList[i].acKey +'</span></td>'
				            				+ '<td align="left" class="listtd"><span><a href="javascript:fn_detail('+ response.resultList[i].pjKey + ')">'+ response.resultList[i].pjNm +'</a></span></td>'
				            				+ '<td align="center" class="listtd">'+ response.resultList[i].pjStartDt +'</td>'
				            				+ '<td align="center" class="listtd">'+ response.resultList[i].pjEndDt +'</td>'
				            				+ '<td align="center" class="listtd">'+ response.resultList[i].pjEndDt +'</td>'
				            				+ '<td align="center" class="listtd">'+ response.resultList[i].pjEndDt +'</td>'
				            				+ '<td align="center" class="listtd">'+ response.resultList[i].pjStatusCd +'</td>'
				            				+ '<td align="center" class="listtd">'+ response.resultList[i].pjSaleEmpKey +'</td>'
			            				+ '</tr>'
						}
						$('.middle table tbody').html('');
						$('.middle table tbody').append(html);
	        		}	
	        	},
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	}
	        });
		}
		
		function fn_detail(pjKey) {
			form = document.listForm;
			form.pjKey.value = pjKey;
			//form.action = "/project/detail/bidding.do";
			form.action = "/project/detail/main.do";
			form.submit(); 
		}
		
	</script>
</head>
<body>
	<form:form commandName="searchVO"  id="listForm" name="listForm" method="post" onsubmit="return false">
		<input type="hidden" value="<c:out value="${resultCode}"/>"/>
		<input type="hidden" name="pjKey" value="" />
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">프로젝트 list</label></div>
						<div class="addBtn floatL cursorP" onclick="fn_addView();"><img src="<c:url value='/images/btn_add.png'/>" /></div>						
					</div>
					<div class="floatR">
						<input type="text" class="calendar fromDt" placeholder="from" id="searchFromDt" name="searchFromDt" value=""/>
						<%-- <c:out value="${searchVO.searchFromDt}"/> --%>
						<label> ~ </label>
						<input type="text" class="calendar toDt" placeholder="to" id="searchToDt" name="searchToDt" value="<c:out value="${searchVO.searchToDt}"/>"/>
						<input type="text" name="searchKeyword" id="searchKeyword" class="search" onKeyPress="if(event.keyCode==13){fn_search();}"placeholder="프로젝트명"  value="<c:out value="${searchVO.searchKeyword}"/>" />
						<a href="javascript:fn_search();" class="veralignT"><img src="<c:url value='/images/icon_search.png'/> " /></a>
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
							<c:forEach var="result" items="${resultList}" varStatus="status">
		            			<tr>
		            				<td onclick="event.cancelBubble = true;"></td>
		            				<td align="center" class="listtd">
		            					<c:out value="${result.pjKey}"/>
		            				</td>
		            				<td align="left" class="listtd"><span><c:out value="${result.acKey}"/></span></td>
		            				<td align="left" class="listtd"><span><a href="javascript:fn_detail('${result.pjKey}')" ><c:out value="${result.pjNm}"/></a></span></td>
		            				<td align="center" class="listtd"><c:out value="${result.pjStartDt}"/></td>
		            				<td align="center" class="listtd"><c:out value="${result.pjEndDt}"/></td>
		            				<td align="center" class="listtd"><c:out value="${result.pjEndDt}"/></td>
		            				<td align="center" class="listtd"><c:out value="${result.pjEndDt}"/></td>
		            				<td align="center" class="listtd"><c:out value="${result.pjStatusCd}"/></td>
		            				<td align="center" class="listtd"><c:out value="${result.pjSaleEmpKey}"/></td>
		            			</tr>
		        			</c:forEach>
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
	</form:form>
</body>
</html>