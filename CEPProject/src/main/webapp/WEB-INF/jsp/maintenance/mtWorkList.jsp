<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../cmm/inc.jsp" %>
<%@include file="../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수 작업목록</title>
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
		.contentsWrap .contents .top div:nth-child(2) > * {
			vertical-align: top;
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
			background-repeat: no-repeat;
			background-position: 95% 50%;
			font-size: 15px;
			margin-bottom: 3px;
		}
		.contentsWrap .contents .top input[class="calendar"] {
			width: 177px;
			height: 40px;
			background-image: url('./images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
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
		.middle table tbody tr td:nth-child(6) {
			font-weight: 400;
		}
		.middle table thead th, .middle table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
		}
		.middle table thead th:first-child,
		.middle table tbody td:first-child {
			width: 50px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 48px;
			max-width: 48px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 100px;
			max-width: 100px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 160px;
			max-width: 160px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 200px;
			max-width: 200px;
		}
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6) {
			width: 380px;
			max-width: 380px;
		}
		.middle table thead th:nth-child(7),
		.middle table thead th:nth-child(8),
		.middle table thead th:nth-child(9),
		.middle table thead th:nth-child(10),
		.middle table thead th:nth-child(11),
		.middle table tbody td:nth-child(7),
		.middle table tbody td:nth-child(8),
		.middle table tbody td:nth-child(9),
		.middle table tbody td:nth-child(10),
		.middle table tbody td:nth-child(11) {
			width: 100px;
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

			$('#pl tr').click(function() {
				/* location.href = "/mtDetail.do"; */
				location.href = "#";
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
			var url = '/maintenance/writeMtWorkInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_editBtn(){
			var url = '/maintenance/editMtWorkInfo.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_searchList(){
			
			document.listForm.action = "/maintenance/mtWorkList.do";
           	document.listForm.submit(); 
		}
		
		function fn_deleteBtn(){
			if($('input[name="gubun"]').is(':checked')){
				if(confirm("선택한 내용을 삭제하시겠습니까?")){
					document.listForm.btnOption.value='delete';
					document.listForm.selectKey.value=$('input[name="gubun"]:checked').val();

					document.listForm.action = "/maintenance/deleteMtWork.do";
		           	document.listForm.submit(); 
				} else {
					return false;
				}
				
				
			} else {
				alert("삭제할 대상을 선택하세요 !!");
				
				return false;
			}
			
			
			/* document.listForm.action = "<c:url value='/mtContractList.do'/>";
           	document.listForm.submit(); */ 
		
		}
		

        	
		
	</script>
</head>
<body>
	<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
		<input type="hidden" name="btnOption" />
		<input type="hidden" name="selectKey" />
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">유지보수 작업목록</label></div>
						<div class="addBtn floatL cursorP" onclick="fn_addView();"><img src="<c:url value='/images/btn_add.png'/>" /></div>	
					</div>
					<div class="floatR">
						<!-- <input type="text" name="fromDate" placeholder="from" class="calendar" /> ~ <input type="text" name="toDate" placeholder="to" class="calendar" /> -->
						<form:input path="fromDate" type="text" placeholder="작업시작일자(from)" class="calendar" /> ~ <form:input path="toDate" type="text" placeholder="작업시작일자(to)" class="calendar" />
						<!-- <select name="searchSaleEmpKey"> -->
						<form:select path="searchWorkEmpKey">
							<!-- <option value=""/>영업담당</option> -->
							<form:option value="" label="지원담당" />
							<c:forEach var="emp" items="${empList}" varStatus="status">
								<%-- <option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option> --%>
								<%-- <form:option value="<c:out value="${emp.empKey}"/>" label="<c:out value="${emp.empNm}"/>" /> --%>
								<form:option value="${emp.empKey}" label="${emp.empNm}" />
							</c:forEach>							
						</form:select>
						<form:select path="searchWorkResult">
							<!-- <option value=""/>영업담당</option> -->
							<form:option value="" label="조치결과" />
							<form:option value="준비" label="준비" />	
							<form:option value="진행중" label="진행중" />	
							<form:option value="완료" label="완료" />					
						</form:select>
						<form:input path="searchMtName" type="text" placeholder="프로젝트 명"/>
						<!-- <input type="text" name="searchMtName" placeholder="프로젝트 명"/> -->
						<span><img src="<c:url value='/images/icon_search.png'/>" onclick="fn_searchList();"/></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200" id="pl">
						<thead class="ftw400">
							<tr>
								<th scope="row">선택</th>
								<th scope="row">No</th>
								<th scope="row">작업번호</th>
								<th scope="row">고객사</th>
								<th scope="row">고객담당자</th>
								<th scope="row">프로젝트명</th>
								<th scope="row">작업시작일</th>
								<th scope="row">작업종료일</th>
								<th scope="row">작업유형</th>
								<th scope="row">조치결과</th>
								<th scope="row">지원담당자</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="result" items="${resultList}" varStatus="status">						
							<tr>
								<td onclick="event.cancelBubble = true;">
									<input type="radio" class="tCheck" name="gubun" id="check<c:out value="${result.rowNum}"/>" value="<c:out value="${result.mtWorkKey}"/>" /><label for="check<c:out value="${result.rowNum}"/>" class="cursorP"/>
								</td>
								<td><c:out value="${status.count}"/></td>
								<td><c:out value="${result.mtWorkKey}"/></td>
								<td><c:out value="${result.acNm}"/></td>
								<td><c:out value="${result.acDirectorNm}"/> / <c:out value="${result.acDirectorInfo}"/></td>
								<td><c:out value="${result.mtNm}"/></td>
								<td><c:out value="${result.mtWorkStartDt}"/></td>
								<td><c:out value="${result.mtWorkEndDt}"/></td>
								<td><c:out value="${result.mtWorkTypeCd}"/></td>
								<td><c:out value="${result.mtWorkResultCd}"/></td>
								<td><c:out value="${result.mtWorkEmpNm}"/></td>
							</tr>						
						</c:forEach>
							
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<div class="floatR">
						<button type="button" value="수정"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" onclick="fn_editBtn();"/></button>
						<button type="button" value="삭제"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" onclick="fn_deleteBtn();"/></button>
						<button type="button" value="엑셀 다운로드"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" onclick="fn_excelBtn();"/></button>
					</div>
				</div>
			</div>
		</div>	
    </form:form>
</body>
</html>