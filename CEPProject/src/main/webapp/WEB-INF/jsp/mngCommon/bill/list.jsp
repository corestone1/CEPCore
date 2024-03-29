<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>계산서 목록</title>
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
			font-weight: 300;
		}
		.contentsWrap .contents .top select {
			height: 38px;
			width: 130px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
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
		.middle table tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 84%;
			margin: 0 auto;
			vertical-align: middle;
		}
		.middle table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle table thead th, .middle table tbody tr td {
			padding: 10px;
			border: 1px solid #edebef;
			color: #535353;
		}
		.middle table thead th:first-child,
		.middle table tbody td:first-child,
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 27px;
			max-width: 27px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 48px;
			max-width: 48px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 83px;
			max-width: 83px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 130px;
			max-width: 130px;
		}
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6) {
			width: 185px;
			max-width: 185px;
		}
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7) {
			width: 80px;
			max-width: 80px;
		}
		.middle table thead th:nth-child(8),
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
		.middle table tbody td:nth-child(12) {
			width: 82px;
			max-width: 82px;
		}
		.middle table thead th:nth-child(13),
		.middle table tbody td:nth-child(13) {
			width: 50px;
			max-width: 50px;
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
					$(this).children().eq(0).append('<input type="radio" name="gubun" value="'+ index +'"  class="tRadio" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
				}
			});
			
			$('#btnDelete').click(function() {
				
				//alert('btnDelete');
				
				if($('input[name="gubun"]').is(':checked')) {
					var litIdx = parseInt($('input[name="gubun"]:checked').val()) - 1;
					
					if($('input[name="billMappingYn"]').eq(litIdx).val() == 'Y') {
						alert("이미 매핑된 계산서는 삭제할 수 없습니다.");
					} else {
						if(confirm("선택한 내용을 삭제하시겠습니까?")) {
						
							var jsonData = {'billNo' : $('input[name="billNo"]').eq(litIdx).val()};
							var sendData = JSON.stringify(jsonData);
							
							//alert($('input[name="orderKey"]').eq(litIdx).val() + "\n" + litIdx);
							
				           $.ajax({
					        	url :"/mngCommon/bill/delete.do",
					        	type:"POST",  
					            data: sendData,
					     	   	contentType: "application/json; charset=UTF-8",
					     	   	dataType: 'json',
					           	async : false,
					        	success:function(data){		  
					        		if(data.successYN == 'Y') {
					            		alert("삭제되었습니다.");
					            		//현재 화면 새로고침
						            	location.reload();
					        		} else {
					        			alert("삭제가 실패되었습니다.");
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
					} 
					
				} else {
					alert("삭제할 대상을 선택하세요.");
					
					return false;
				}				
			});
			
		});
		
		function fn_searchList()
		{                
			document.listForm.action = "/mngCommon/bill/list.do";
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
		
		
		/* function fnViewDetail(pstBillNo, pjKey){
			
			form = document.listForm;
			form.billNo.value = pstBillNo;
			form.pjKey.value = pjKey;
			form.action = "<c:url value='/mngCommon/bill/detail/main.do'/>";
			form.submit(); 
			
		} */

		function fnViewBillbatchInsertPop(){
			window.open('/mngCommon/bill/popup/viewWritePcBillingExcel.do','BILLING_EXCEL','width=1400px,height=750px,left=600');
			
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
		<!-- <input type="hidden" name="billNo" value=""/> -->
		<input type="hidden" name="pjKey" value=""/>
		<!-- <div class="sfcnt"></div>
		<div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">계산서 목록</label></div>
						<%-- <div class="addBtn floatL cursorP" onclick="javascript:fn_addView('writeBasic')"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>
					</div>
					<div class="floatR">
						<%-- <form:select path="searchClassCd">
							<form:option value="">구분</form:option>
							<form:option value="PC">매입</form:option>
							<form:option value="SD">매출</form:option>
						</form:select> --%>
						<form:select path="searchCtClassCd">
							<form:option value="">유형</form:option>
							<form:option value="PJ">프로젝트</form:option>
							<form:option value="MT">유지보수</form:option>
						</form:select>
						<form:input path="searchFromDate" type="text" class="calendar" placeholder="등록일자(from)"/>
						<label><img class="veralignM" src="/images/icon_fromTo.png" /></label>
						<form:input path="searchToDate" type="text" class="calendar" placeholder="등록일자(to)"/>
						<form:input path="searchAcNm" type="text" class="search" placeholder="상호명" onKeyPress="if(event.keyCode==13){fn_searchList();}" />
						<span onclick="javascript:fn_searchList();"><img src="<c:url value='/images/icon_search.png'/>" /></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200 excelSheet" id="fl">
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
								<!-- <th scope="row">승인번호</th> -->
								<th scope="row">발급일자</th>
								<th scope="row">유형</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="result" items="${billList}" varStatus="status">
								<tr>
									<td><input type="hidden" name="billNo" value="${result.billNo }" /></td>
									<td><c:out value="${status.count}"/></td>
									<td>
										<c:if test="${result.classCd eq 'PC' }">매입</c:if>
										<c:if test="${result.classCd eq 'SD' }">매출</c:if> 
									</td>
									<td><span style="width:83px;"><c:out value="${displayUtil.displayDate(result.writeDt)}"/></span></td>
									<td><span title="${result.acKey}" style="width:124px;"><c:out value="${result.acKey}"/></span></td>
									<td align="left"><span title="${result.acNm}" style="width:160px;"><c:out value="${result.acNm}"/></span></td>
									<%-- onclick="javascript:fnViewDetail('${result.billNo}', '${result.billFkPjKey }');" --%>
									<td><span title="${result.acCeoNm}" style="width:95px;"><c:out value="${result.acCeoNm}"/></span></td>
									<td align="right"><span style="width:93px;"><c:out value="${displayUtil.commaStr(result.billAmount)}"/></span></td>
									<td align="right"><span style="width:93px;"><c:out value="${displayUtil.commaStr(result.billTaxAmount)}"/></span></td>
									<td align="right"><span style="width: 93px;"><c:out value="${displayUtil.commaStr(result.billTotalAmount)}"/></span></td>
									<td align="left"><span title="${result.remark}" style="width:200px;"><c:out value="${result.remark}"/></span></td>
									<%-- <td align="left"><span title="${result.billNo}" style="width: 103px;"><c:out value="${result.billNo}"/></span><input type="hidden" name="billNo" value="${result.billNo }" /></td> --%>
									<td><span style="width:83px;"><c:out value="${displayUtil.displayDate(result.billIssueDt)}"/></span></td>
									<td><span style="width:40px;"><c:out value="${result.billCtClassCd }" /><input type="hidden" name="billMappingYn" value=${result.billMappingYn } /></span></td>
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
						<!-- <button type="button" value="수정"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button> -->
						<button type="button" id="btnDelete" value="삭제"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
						<button type="button" id="excelExport" value="엑셀 다운로드"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>

</html>