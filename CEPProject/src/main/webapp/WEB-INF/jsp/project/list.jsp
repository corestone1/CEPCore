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
					$(this).children().eq(0).append('<input type="radio" class="tCheck" name="index" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
					$(this).children().eq(0).children().eq(0).val($(this).children().eq(1).children().eq(0).val());
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
											+ '<td onclick="event.cancelBubble = true;"><input type="checkbox" class="tCheck" name="index" id="check' + (i+1) + '" value="' + response.resultList[i].pjKey + '"/><label for="check' + (i+1) + '" class="cursorP"/></td>'
					        				+ '<td align="center" class="listtd">'+ response.resultList[i].pjKey +'</td>'
				        					+ '<td align="left" class="listtd"><span>'+ response.resultList[i].acKey +'</span></td>'
				            				+ '<td align="left" class="listtd"><span><a href="javascript:fn_detail('+ response.resultList[i].pjKey + ')">'+ response.resultList[i].pjNm +'</a></span></td>'
				            				+ '<td align="center" class="listtd">'+ addDateMinus(response.resultList[i].pjStartDt) +'</td>'
				            				+ '<td align="center" class="listtd">'+ addDateMinus(response.resultList[i].pjEndDt) +'</td>'
				            				+ '<td align="center" class="listtd">'+ (Number(calDateRange(addDateMinus(response.resultList[i].pjStartDt),  addDateMinus(response.resultList[i].pjEndDt))) + 1) +'일</td>'
				            				+ '<td align="center" class="listtd">'+ calDateRange(getToday(), addDateMinus(response.resultList[i].pjEndDt)) +'일</td>'
				            				+ '<td align="center" class="listtd">'+ response.resultList[i].pjStatusCd +'</td>'
				            				+ '<td align="center" class="listtd">'+ response.resultList[i].pjSaleEmpKey +'</td>'
			            				+ '</tr>';
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
		
		function fn_delete(){
			if($('input[name="index"]').is(':checked')){
				if(confirm("선택한 내용을 삭제하시겠습니까?")){
					form = document.listForm;
					form.pjKey.value = $('input[name="index"]:checked').val();
					form.action = "<c:url value='/project/deleteProject.do'/>";
					form.submit(); 
				} else {
					return false;
				}
			} else {
				alert("삭제할 대상을 선택하세요.");
				
				return false;
			}
		}
		
		function calDateRange(val1, val2) {
		    var FORMAT = "-";
		
		    if (val1.length != 10 || val2.length != 10)
		        return null;
		
		    if (val1.indexOf(FORMAT) < 0 || val2.indexOf(FORMAT) < 0)
		        return null;
		
		    var start_dt = val1.split(FORMAT);
		    var end_dt = val2.split(FORMAT);
		
		    start_dt[1] = (Number(start_dt[1]) - 1) + "";
		    end_dt[1] = (Number(end_dt[1]) - 1) + "";
		
		    var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
		    var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);
		
		    if(((to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24) > 0) {
		    	return (to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24;
		    } else {
		    	return 0;
		    }
		}
		
		function getToday() {
		    var date = new Date();
		    var year = date.getFullYear();
		    var month = ("0" + (1 + date.getMonth())).slice(-2);
		    var day = ("0" + date.getDate()).slice(-2);

		    return year + "-" + month + "-" + day;
		}
		
		function tmp() {
			var url = '/project/write/orderInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey":"PJ210065"
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
		}
		
		function tmp1() {
			var url = '/project/write/contractInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey":"PJ210065"
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
		}
		
		function tmp2() {
			var url = '/project/write/buildInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey":"PJ210064"
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
		}
		
		function tmp3() {
			var url = '/project/write/workInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey":"PJ210064"
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
		}
		
		function tmp4() {
			var url = '/project/write/biddingInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey":"PJ210065",
				"turnNo":"2",
				"ctKey":["CT210110", "CT210111"],
				"salesKey":["SD210050", "SD210051"]
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
		}
	</script>
</head>
<body>
	<form:form commandName="searchVO"  id="listForm" name="listForm" method="post" onsubmit="return false">
		<input type="hidden" value="<c:out value="${resultCode}"/>"/>
		<input type="hidden" name="pjKey" value=""/>
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">프로젝트 list</label></div>
						<div class="addBtn floatL cursorP" onclick="fn_addView();"><img src="<c:url value='/images/btn_add.png'/>" /></div>
						<div class="addBtn floatL cursorP" onclick="tmp1();" style="width: 79px; border-radius: 0; height: 35px;"><label style="font-size: 16px; margin: 0 5px; color: #fff; line-height: 31px;">계약화면1</label></div>
						<div class="addBtn floatL cursorP" onclick="tmp4();"style="width: 79px; border-radius: 0; height: 35px;"><label style="font-size: 16px; margin: 0 5px; color: #fff; line-height: 31px;">계약화면2</label></div>
						<div class="addBtn floatL cursorP" onclick="tmp();" style="width: 79px; border-radius: 0; height: 35px;"><label style="font-size: 16px; margin: 0 5px; color: #fff; line-height: 31px;">발주화면</label></div>
						<div class="addBtn floatL cursorP" onclick="tmp2();" style="width: 79px; border-radius: 0; height: 35px;"><label style="font-size: 16px; margin: 0 5px; color: #fff; line-height: 31px;">수행화면</label></div>
						<div class="addBtn floatL cursorP" onclick="tmp3();" style="width: 79px; border-radius: 0; height: 35px;"><label style="font-size: 16px; margin: 0 5px; color: #fff; line-height: 31px;">수행일지</label></div>
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
		            					<input type="hidden" value="<c:out value="${result.pjKey}"/>" />
		            				</td>
		            				<td align="left" class="listtd"><span><c:out value="${result.acKey}"/></span></td>
		            				<td align="left" class="listtd"><span><a href="javascript:fn_detail('${result.pjKey}')" ><c:out value="${result.pjNm}"/></a></span></td>
		            				<td align="center" class="listtd"><c:out value="${displayUtil.displayDate(result.pjStartDt)}"/></td>
		            				<td align="center" class="listtd"><c:out value="${displayUtil.displayDate(result.pjEndDt)}"/></td>
		            				<fmt:parseDate value="${displayUtil.displayDate(result.pjStartDt)}" var="startPlanDate" pattern="yyyy-MM-dd"/>
									<fmt:parseNumber value="${startPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="startDate"></fmt:parseNumber>
									<fmt:parseDate value="${displayUtil.displayDate(result.pjEndDt)}" var="endPlanDate" pattern="yyyy-MM-dd"/>
									<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowDate"></fmt:parseNumber>
									<td align="center" class="listtd"><c:out value="${endDate - startDate + 1}"/>일</td>
		            				<td align="center" class="listtd"><c:out value="${endDate - nowDate + 1 > 0? endDate - nowDate + 1 : 0}"/>일</td>
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
						<button value="삭제" type="button" onclick="fn_delete();"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
						<button value="엑셀 다운로드"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>