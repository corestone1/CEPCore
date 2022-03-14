<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>수행 일지 목록</title>
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
		.contentsWrap .contents .top div:nth-child(2) > label {
			line-height: 34px;
			margin-left: 3px;
			font-weight: 300;
		}
		.contentsWrap .contents .top select {
			height: 38px;
			width: 240px;
			border: none;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down_18dp.png') no-repeat 96% 50%;
			background-size: 30px;
			font-size: 26px;
			font-weight: 500;
		}
		.contentsWrap .contents .top select option {
			font-size: 15px;
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
		.middle table tbody tr td span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 84%;
			margin: 0 auto;
		}
		.middle table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle table tbody tr td:nth-child(3) {
			font-weight: 400;
		}
		
		.middle table tbody tr td a{
			color: #535353;
		}
		
		.middle table thead th
		, .middle table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
			color: #535353;
		}
		.middle .work thead th:first-child,
		.middle .work tbody td:first-child {
			width: 38px;
			max-width: 38px;
		}
		.middle .work thead th:nth-child(2),
		.middle .work tbody td:nth-child(2) {
			width: 48px;
			max-width: 48px;
		}
		.middle .work thead th:nth-child(3),
		.middle .work tbody td:nth-child(3) {
			width: 253px;
			max-width: 253px;
		}
		.middle .work thead th:nth-child(4),
		.middle .work tbody td:nth-child(4) {
			width: 128px;
			max-width: 128px;
		}
		.middle .work thead th:nth-child(5),
		.middle .work tbody td:nth-child(5) {
			width: 89px;
			max-width: 89px;
		}
		.middle .work thead th:nth-child(6),
		.middle .work tbody td:nth-child(6) {
			width: 57px;
			max-width: 57px;
		}
		.middle .work thead th:nth-child(7),
		.middle .work tbody td:nth-child(7) {
			width: 132px;
			max-width: 132px;
		}
		.middle .work thead th:nth-child(8),
		.middle .work tbody td:nth-child(8) {
			width: 150px;
			max-width: 150px;
		}
		.middle .work thead th:nth-child(9),
		.middle .work tbody td:nth-child(9) {
			width: 150px;
			max-width: 150px;
		}
		.middle .work thead th:nth-child(10),
		.middle .work tbody td:nth-child(10) {
			width: 150px;
			max-width: 150px;
		}
		.middle .work thead th:nth-child(11), 
		.middle .work tbody td:nth-child(11) {
		    width: 53px;
		    max-width: 53px;
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
			width: 654px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
		.bottom > div {
			margin-top: 22px;
		}
		input[type="text"] {
		    height: 36px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
			color: #000;
		}
		input[type="text"]::placeholder {
			color: #535353;
		}
		input[class="calendar"] {
			width: 150px;
		    background-image: url('/images/calendar_icon.png');
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		input[class="search"] {
			width: 260px;
		}
	</style>
	<script>
		$(document).ready(function() {

			$('#fl tr').each(function(index, item) {
				if(index != 0) {
					$(this).children().eq(0).append('<input type="radio" name="m_gubun" value="'+ index +'"  class="tRadio" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
				}
			});
			
			
			$('#btnModify').click(function() {
				
				if($('input[name="m_gubun"]').is(':checked')) {
					/* var litIdx = parseInt($('input[name="gubun"]:checked').val());
					var jsonData = {'SP_KEY' : $('input[name="spKey"]').eq(litIdx).val()}; */
					var param1 = $('input[name="m_gubun"]:checked').parent().next().next().children().eq(0).val();
					var param2 = $('input[name="m_gubun"]:checked').parent().next().next().children().eq(1).val()

					fn_detailPop(param1, param2);
					
				} else {
					alert("수정할 대상을 선택하세요.");
					
					return false;
				}				
			});
			
			$('#btnDelete').click(function() {
				var pjKey = $('input[name="m_gubun"]:checked').parent().next().next().children().eq(0).val();
				var pjWorkSeq = $('input[name="m_gubun"]:checked').parent().next().next().children().eq(1).val();
				
				if($('input[name="m_gubun"]').is(':checked')) {
					if(confirm("선택한 내용을 삭제하시겠습니까?")) {
						
						var litIdx = parseInt($('input[name="m_gubun"]:checked').val());
						
						var jsonData = {'pjKey' : pjKey, 'pjWorkSeq' : pjWorkSeq};
						
						$.ajax({
				        	url :"/project/detail/workDelete.do",
				        	type:"POST",  
				            data: jsonData,
				     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				     	    dataType: 'json',
				            async : false,
				        	success:function(data){		  
				        		//alert(data.accountList[0].acNm);
				        		//선택 목록 생성
				        		alert("삭제 되었습니다.");
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
			
			
			$("#perform_kind").on("change", function() {
				/* $("."+$(this).val()).removeClass("dpNone");
				$("."+$("#perform_kind option:not(option:selected)").val()).addClass("dpNone"); */
				location.href="/mngProject/perform/"+$(this).val()+"/list.do";
			});
			
		});

		function fn_addView(link){
			
			var dialogId = 'program_layer';
			
			//var varParam = {'pjKey' : $('#ipt_pjKey').val(), "inbSeq" :  $('input[name="inbSeq"]').eq(litIdx).val()};
			var varParam = { 'workClass': $("#workClass").val() };
			
			var button = new Array;
			button = [];
			
			parent.showModalPop(dialogId, "/project/write/workInfo.do", varParam, button, '', 'width:1144px;height:708px;ifram:true;iframid:ipt_pjKey');
		}
		
		function fn_searchList()
		{                
			document.listForm.action = "/mngProject/perform/list.do";
           	document.listForm.submit(); 
		}

		function fn_detailPop(pjKey, pjWorkSeq) {
			
			var url = '/project/write/workInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
					"pjKey": pjKey,
					"pjWorkSeq":pjWorkSeq,
					"workClass": $("#workClass").val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
		}
		
		/* function fn_viewDetail(pjKey) {
			form = document.listForm;
			form.pjKey.value = pjKey;
			form.workClass.value = "수행_첨부파일";
			form.action = "<c:url value='/project/detail/main.do?isOrderDetail=true'/>";
			
			form.submit(); 
		}  */
	</script>
</head>
<body>
	<form:form modelAttribute="searchVO" id="listForm" name="listForm" method="post">
		<input type="hidden" id="workClass" name="workClass" value="수행_첨부파일"/>
		<input type="hidden" id="pjKey" name="pjKey" />
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL">
							<select id="perform_kind">
								<option value="installbase">Installbase 목록</option>
								<option value="work" selected>수행 일지 목록</option>
							</select>
						</div>
						<!-- <div class="title floatL"><label class="ftw500">작업 목록</label></div>
						<div class="title floatL dpNone"><label class="ftw500">Install Base 목록</label></div> -->
						<div class="addBtn floatL cursorP" onclick="javascript:fn_addView()"><img src="<c:url value='/images/btn_add.png'/>" /></div>
					</div>
					<div class="floatR">
						<form:input path="performDtFrom"    type="text" class="calendar" placeholder="from" value="${performDtFrom }"/><label><img class="veralignM" src="/images/icon_fromTo.png" /></label>
						<form:input path="performDtTo" type="text" class="calendar" placeholder="to" value="${performDtTo }"/>
						<form:input path="pjNm" type="text" placeholder="프로젝트명" style="width: 80px;" onKeyPress="if(event.keyCode==13){fn_searchList();}"/>
						<form:input path="regEmpKey"     type="text" placeholder="작성자" style="width: 80px;" onKeyPress="if(event.keyCode==13){fn_searchList();}"/>
						<span><img onclick="javascript:fn_searchList();" src="<c:url value='/images/icon_search.png'/>" /></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200 work excelSheet" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">선택</th>
								<th scope="row">No</th>
								<th scope="row">프로젝트</th>
								<th scope="row">작업 일시</th>
								<th scope="row">작업 소요시간</th>
								<th scope="row">작업 순번</th>
								<th scope="row">작업명</th>
								<th scope="row">작업 내용</th>
								<th scope="row">작업 처리 결과</th>
								<th scope="row">비고</th>
								<th scope="row">작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="result" items="${workList}" varStatus="status">
								<tr onclick="javascript:fn_detailPop('${result.pjKey}', '${result.pjWorkSeq }')">
									<td></td>
									<td><c:out value="${status.count}"/></td>
									<td>
										<input type="hidden" value="${result.pjKey }" />
										<input type="hidden" value="${result.pjWorkSeq }" />
										<a href="javascript:fn_viewDetail('${result.pjKey}')">
											<span title="${result.pjNm}"><c:out value="${result.pjNm}"/></span>
										</a>
									</td>
									<td><c:out value="${displayUtil.displayDate(result.pjWorkDt)}"/> / <c:out value="${fn:substring(result.pjWorkTm, 0, 2)}"/> : <c:out value="${fn:substring(result.pjWorkTm, 2, 5)}" /></td>
									<td><c:out value="${fn:substring(result.pjWorkTakeTm, 0, 2)}"/>시간 <c:out value="${fn:substring(result.pjWorkTakeTm, 2, 5)}"/>분</td>
									<td><c:out value="${result.pjWorkSeq}"/></td>
									<td><span title="${result.pjWorkNm}"><c:out value="${result.pjWorkNm}"/></span></td>
									<td><span title="${result.pjWorkCont}"><c:out value="${result.pjWorkCont}"/></span></td>
									<td><span title="${result.pjWorkResult}"><c:out value="${result.pjWorkResult}"/></span></td>
									<td><span title="${result.remark}"><c:out value="${result.remark}"/></span></td>
									<td><c:out value="${result.pjWorkEmpNm}"/></td>
								</tr>
							</c:forEach>						
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<div class="floatR">
						<button type="button" id="btnModify" value="수정"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
						<button type="button" id="btnDelete" value="삭제"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
						<button type="button" value="엑셀 다운로드" id="excelExport"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>