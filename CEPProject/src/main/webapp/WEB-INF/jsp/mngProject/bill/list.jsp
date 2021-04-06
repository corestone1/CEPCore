<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>CEP 샘플 화면(forecast list)</title>
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
			margin: 5px;
			font-weight: 300;
		}
		.contentsWrap .contents .top select {
			height: 38px;
			width: 130px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('http://172.10.122.10:8888/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
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
		.middle table tbody tr td > span {
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
		.middle table thead th, .middle table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
			color: #535353;
		}
		.middle table thead th:first-child,
		.middle table tbody td:first-child,
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 50px;
			max-width: 50px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 48px;
			max-width: 48px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4),
		.middle table thead th:nth-child(13),
		.middle table tbody td:nth-child(13) {
			width: 100px;
			max-width: 100px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 130px;
			max-width: 130px;
		}
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6) {
			width: 170px;
			max-width: 170px;
		}
		.middle table thead th:nth-child(7),
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(7),
		.middle table tbody td:nth-child(8),
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9),
		.middle table thead th:nth-child(10),
		.middle table tbody td:nth-child(10) {
			width: 100px;
			max-width: 100px;
		}
		.middle table thead th:nth-child(11),
		.middle table tbody td:nth-child(11) {
			width: 220px;
			max-width: 220px;
		}
		.middle table thead th:nth-child(12),
		.middle table tbody td:nth-child(12),
		.middle table thead th:nth-child(14),
		.middle table tbody td:nth-child(14) {
			width: 80px;
			max-width: 80px;
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
			width: 1396px;
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
		    background-image: url('http://172.10.122.10:8888/images/calendar_icon.png');
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		input[class="search"] {
			width: 260px;
		}
	</style>
	<script>
		$(document).ready(function() {
			/* 
			var html = '';
			$('.middle table tbody tr').click(function() {
				if($(this).attr('class') != "viewOpen") {
					html = '<div style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>여신</li>'
					       + '<li title="계산서 발행 후 90일">계산서 발행 후 90일</li>'
					       + '<li>비고</li>'
					       + '<li title="ECS DR 장비운송 (의왕->안성) / HP Cooling Fan DL360p G8 / A15243621OUUAR">ECS DR 장비운송 (의왕->안성) / HP Cooling Fan DL360p G8 / A15243621OUUAR</li>'
					       + '</ul>'
					       + '</div>'
					       + '</div>';
					$(this).after(html);
					$(this).attr('class', 'viewOpen');
				} else {
					$(this).removeClass('viewOpen');
					$(this).next().remove();
				}
			});
			*/
			
			$('#fl tr').each(function(index, item) {
				if(index != 0) {
					$(this).children().eq(0).append('<input type="radio" name="gubun" value="'+ index +'"  class="tCheck" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
				}
			});
			
			$('#btnDelete').click(function() {
				
				//alert('btnDelete');
				
				if($('input[name="gubun"]').is(':checked')) {
					if(confirm("선택한 내용을 삭제하시겠습니까?")) {
						
						var litIdx = parseInt($('input[name="gubun"]:checked').val());
						
						//alert(litIdx + ":" + $('input[name="billNo"]').eq(litIdx).val());
						
						var jsonData = {'billNo' : $('input[name="billNo"]').eq(litIdx).val()};
						
						//alert($('input[name="orderKey"]').eq(litIdx).val() + "\n" + litIdx);
						
			           $.ajax({
				        	url :"/mngProject/bill/delete.do",
				        	type:"POST",  
				            data: jsonData,
				     	   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				     	   dataType: 'json',
				           async : false,
				        	success:function(data){		  
				            	alert("삭제되었습니다.!");
				            	//현재 화면 새로고침
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
					alert("삭제할 대상을 선택하세요 !!");
					
					return false;
				}				
			});
			
		});
		
		function fn_searchList()
		{                
			document.listForm.action = "/mngProject/bill/list.do";
           	document.listForm.submit(); 
		}

		/* function fn_addView(link){
			if(link == "forecastList") {
				location.href="<c:url value='/forecastList.do'/>";
			} else {
				var url = '/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
		
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:495px'); 
			}
		} */
		
		
		function fnViewDetail(pstBillNo){
			
			form = document.listForm;
			form.billNo.value = pstBillNo;
			form.action = "<c:url value='/mngProject/bill/detail/main.do'/>";
			form.submit(); 
			
		}

		function fnViewBillbatchInsertPop(){
			window.open('/mngProject/bill/popup/viewWritePcBillingExcel.do','BILLING_EXCEL','width=1600px,height=713px,left=600');
			
		}
		
		function fnViewBillXmlInsertPop(){
			var url = '/mngProject/bill/popup/viewWriteSdBilling.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			
			var button = new Array;
			button = [];
			
			/* showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:495px'); */ 
			showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:545px');
			
		}
		
		
	</script>
</head>
<body>
	<form:form modelAttribute="searchVO" id="listForm" name="listForm" method="post">
		<input type="hidden" name="billNo" value=""/>
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">계산서 목록</label></div>
						<%-- <div class="addBtn floatL cursorP" onclick="javascript:fn_addView('writeBasic')"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>
					</div>
					<div class="floatR">
						<form:select path="searchClassCd">
							<form:option value="">구분</form:option>
							<form:option value="PC">매입</form:option>
							<form:option value="SD">매출</form:option>
						</form:select>
						<form:input path="searchFromDate" type="text" class="calendar" placeholder="from"/>
						<label> ~ </label>
						<form:input path="searchToDate" type="text" class="calendar" placeholder="to"/>
						<form:input path="searchAcNm" type="text" class="search" placeholder="상호명" />
						<span onclick="javascript:fn_searchList();"><img src="<c:url value='/images/icon_search.png'/>" /></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">선택</th>
								<th scope="row">No</th>
								<th scope="row">구분</th>
								<th scope="row">작성일자</th>
								<th scope="row">사업자(주민)번호</th>
								<th scope="row">상호</th>
								<th scope="row">대표자명</th>
								<th scope="row">공급가액</th>
								<th scope="row">세액</th>
								<th scope="row">합계</th>
								<th scope="row">비고</th>
								<th scope="row">승인번호</th>
								<th scope="row">발급일자</th>
								<th scope="row">발급유형</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="result" items="${billList}" varStatus="status">
								<tr>
									<td></td>
									<td><c:out value="${status.count}"/></td>
									<td><c:out value="${result.billClassNm}"/></td>
									<td><c:out value="${displayUtil.displayDate(result.billIssueDt)}"/></td>
									<td><c:out value="${result.acKey}"/></td>
									<td onclick="javascript:fnViewDetail('${result.billNo}');"><span title="${result.acNm}"><c:out value="${result.acNm}"/></span></td>
									<td><c:out value="${result.acCeoNm}"/></td>
									<td><span><c:out value="${displayUtil.commaStr(result.billAmount)}"/></span></td>
									<td><span><c:out value="${displayUtil.commaStr(result.billTax)}"/></span></td>
									<td><span><c:out value="${displayUtil.commaStr(result.billTotalAmount)}"/></span></td>
									<td><span><c:out value="${result.remark}"/></span></td>
									<td><span><c:out value="${result.billNo}"/></span></td>
									<td><c:out value="${displayUtil.displayDate(result.billIssueDt)}"/></td>
									<td></td>
								</tr>
							</c:forEach>
							<!-- 
							<tr>
								<td></td>
								<td>2</td>
								<td>매입</td>
								<td>2018-12-12</td>
								<td>254-66-45879</td>
								<td><span title="에이제이파크 주식회사">에이제이파크 주식회사</span></td>
								<td>홍길동</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td><span title="디비손해보험(디비손해보험)">디비손해보험(디비손해보험)</span></td>
								<td><span title="202004512100009845600254">승인번호</span></td>
								<td>2018-12-12</td>
								<td></td>
							</tr>
							 -->
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<div class="floatR">
					<!-- 
						<button type="button" value="XML 파일 등록" onclick="javascript:fnViewBillXmlInsertPop();"><img class="cursorP" src="<c:url value='/images/btn_bill_xml.png'/>" /></button>
					 -->
						<button type="button" value="계산서 일괄 등록" onclick="javascript:fnViewBillbatchInsertPop();"><img class="cursorP" src="<c:url value='/images/btn_bill_batch.png'/>" /></button>
						<button type="button" value="수정"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
						<button type="button" id="btnDelete" value="삭제"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
						<button type="button" value="엑셀 다운로드"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>

</html>