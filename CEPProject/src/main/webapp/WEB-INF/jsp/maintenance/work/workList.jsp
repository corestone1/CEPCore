<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
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
			width: 120px;
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
			background-repeat: no-repeat;
			background-position: 95% 50%;
			font-size: 15px;
			margin-bottom: 3px;
		}
		.contentsWrap .contents .top input[class^="calendar"] {
			width: 120px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
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
		.middle table tbody tr td span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			margin-left: 15px;
			vertical-align: middle;
		}
		/* 리스트에 마우스 올려 놓았을 경우 해당 라인 색깔 변하게 하는것 */
		.middle table tbody tr:hover {
			background-color: #ddf0ec
		}
		/* .middle table tbody tr td:nth-child(4), */
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
				 /*console.log("selectIntegrateKey====>"+$(this).children().eq(11).text().trim());
				console.log("mtWorkKey====>"+$('#check'+$(this).children().eq(1).text()).val());*/
				
				$("input[name=selectIntegrateKey]").val($(this).children().eq(11).text().trim());
				$("input[name=selectWorkKey]").val($('#check'+$(this).children().eq(1).text()).val());
				

				document.listForm.action = "/maintenance/work/detail/basicInfo.do";
	           	document.listForm.submit(); 
				/* location.href = "/maintenance/work/detail/basicInfo.do"; */
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
			var url = '/maintenance/work/write/basicInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_addView2(){
			var url = '/maintenance/work/write/productInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_searchList(){
			
			document.listForm.action = "/maintenance/work/workList.do";
           	document.listForm.submit(); 
		}
		
		function fn_deleteBtn(){		
			if($('input[name="m_gubun"]').is(':checked')){
				if(confirm("선택한 유지보수작업 내용을 삭제하시겠습니까?")){
					var sendData = {
		           			"selectWorkKey":$('input[name="m_gubun"]:checked').val()
		           	}
					$.ajax({
		           		url: "/maintenance/work/deleteWork.do",
		           		dataType: 'text', 
		           		type:"post",  
		           		//data: JSON.parse(sendData),
		           		data: JSON.stringify(sendData),
		           		//data: sendData,
		           		contentType: "application/json; charset=UTF-8", 
		           		beforeSend: function(xhr) {
		           			xhr.setRequestHeader("AJAX", true);	        		
		           		},
		           		success:function(data){	
		           			var paramData = JSON.parse(data);
		           		
		           			//console.log("paramData===>"+paramData);
		           			//console.log("data.mtWorkKey==>"+paramData.mtWorkKey);
		           			if("Y" == paramData.successYN){
		           				alert("유지보수작업 삭제를 성공하였습니다.");
		           				
		           				document.listForm.action = "/maintenance/work/workList.do";
		        	           	document.listForm.submit();
		           				
		           			} else {
		           				alert("유지보수작업 삭제를 실패하였습니다.");
		           				
		           			}
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
				alert("삭제할 대상을 선택하세요 !!");				
				return false;
			}		
		}// end fn_deleteBtn()
		
		function fn_modifyBtn() {
			if($('input[name="m_gubun"]').is(':checked')){
				var url = '/maintenance/work/write/basicInfoView.do';
				var dialogId = 'program_layer';
				var varParam = {
						"mtWorkKey":$('input[name="m_gubun"]:checked').val()					
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			} else {
				alert("수정할 대상을 선택하세요 !!");
				
				return false;
			}			
		} // end fn_modifyBtn()
		
	</script>
</head>
<body>
	<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
		<input type="hidden" name="btnOption" />
		<input type="hidden" id="selectIntegrateKey" name="selectIntegrateKey"/>
		<input type="hidden" id="selectWorkKey" name="selectWorkKey"/>
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">유지보수 작업목록</label></div>
						<div class="addBtn floatL cursorP" onclick="fn_addView();"><img src="<c:url value='/images/btn_add.png'/>" /></div>	
						<%-- <div class="addBtn floatL cursorP" onclick="fn_addView2();"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>		
					</div>
					<div class="floatR">
						<!-- <input type="text" name="fromDate" placeholder="from" class="calendar" /> ~ <input type="text" name="toDate" placeholder="to" class="calendar" /> -->
						<form:input path="fromDate" type="text" placeholder="작업시작일자(from)" class="calendar fromDt" value="${searchParam.fromDate}"/> ~ <form:input path="toDate" type="text" placeholder="작업시작일자(to)" class="calendar toDt" value="${searchParam.toDate}"/>
						<!-- <select name="searchSaleEmpKey"> -->
						<form:input path="searchWorkEmpNm" type="text" placeholder="지원담당" style="width: 100px"/>
						<%-- <form:select path="searchWorkEmpKey">
							<form:option value="" label="지원담당" />
							<c:forEach var="emp" items="${empList}" varStatus="status">
								<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
								<form:option value="<c:out value="${emp.empKey}"/>" label="<c:out value="${emp.empNm}"/>" />
								<form:option value="${emp.empKey}" label="${emp.empNm}" />
							</c:forEach>							
						</form:select> --%>
						<form:select path="searchWorkResult">
							<!-- <option value=""/>영업담당</option> -->
							<form:option value="" label="조치결과" />
							<form:option value="준비" label="준비" />	
							<form:option value="진행중" label="진행중" />	
							<form:option value="완료" label="완료" />					
						</form:select>
						<form:select path="searchGubun">
							<form:option value="PJ" label="프로젝트명" />
							<form:option value="CU" label="고객사" />
						</form:select>
						<form:input path="searchWord" type="text" placeholder="검색어"/>
						<!-- <input type="text" name="searchMtName" placeholder="프로젝트 명"/> -->
						<span><button><img src="<c:url value='/images/icon_search.png'/>" onclick="fn_searchList();"/></button></span>
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
								<th style="max-width: 0px; display: none;"></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="result" items="${resultList}" varStatus="status">						
							<tr>
								<td onclick="event.cancelBubble = true;">
									<input type="radio" class="tRadio" name="m_gubun" id="check<c:out value="${status.count}"/>" value="<c:out value="${result.mtWorkKey}"/>" /><label for="check<c:out value="${status.count}"/>" class="cursorP"/>
								</td>
								<td><c:out value="${status.count}"/></td>
								<td><c:out value="${result.mtWorkKey}"/></td>
								<td align="left"><span title="${result.mtAcNm}"><c:out value="${result.mtAcNm}"/></span></td>
								<td align="left"><span title="${result.acDirectorInfo}"><c:out value="${result.acDirectorNm}"/> / <c:out value="${result.acDirectorInfo}"/></span></td>
								<td align="left"><span title="${result.mtNm}"><c:out value="${result.mtNm}"/></span></td>
								<td><c:out value="${result.viewWorkStartDt}"/></td>
								<td><c:out value="${result.viewWorkEndDt}"/></td>
								<td><c:out value="${result.mtWorkTypeCd}"/></td>
								<td><c:out value="${result.mtWorkResultCd}"/></td>
								<td><c:out value="${result.mtWorkEmpNm}"/></td>
								<td style="max-width: 0px; display: none;">
									<c:out value="${result.mtIntegrateKey}"/>
								</td>
								
							</tr>						
						</c:forEach>
							
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<div class="floatR">
						<button type="button" value="수정" onclick="fn_modifyBtn();"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
						<button type="button" value="삭제" onclick="fn_deleteBtn();"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
						<button type="button" value="엑셀 다운로드"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" onclick="fn_excelBtn();"/></button>
					</div>
				</div>
			</div>
		</div>	
    </form:form>
</body>
</html>