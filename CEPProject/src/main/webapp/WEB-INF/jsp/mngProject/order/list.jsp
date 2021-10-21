<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>발주 목록</title>
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
		.middle table tbody tr td:nth-child(4) {
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
		.middle table thead th:first-child,
		.middle table tbody td:first-child {
			width: 50px;
			max-width: 50px;
		}
		
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 48px;
			max-width: 48px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 195px;
			max-width: 195px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 350px;
			max-width: 350px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 110px;
			max-width: 110px;
		}
		
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6) {
			width: 110px;
			max-width: 110px;
		}
		
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7) {
			width: 190px;
			max-width: 190px;
		}
		
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(8) {
			width: 90px;
			max-width: 90px;
		}
		
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9) {
			width: 150px;
			max-width: 150px;
		}
		
		.middle table thead th:nth-child(10),
		.middle table tbody td:nth-child(10) {
			width: 110px;
			max-width: 110px;
		}
		
		.middle table thead th:nth-child(11),
		.middle table tbody td:nth-child(11) {
			width: 110px;
			max-width: 110px;
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
			/* 
			var html = '';
			$('.middle table tbody tr').click(function() {
				if($(this).attr('class') != "viewOpen") {
					html = '<div style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>여신</li>'
					       + '<li title="계산서 발행 후 90일">계산서 발행 후 90일</li>'
					       + '<li>제품명</li>'
					       + '<li title="VXRail">VXRail</li>'
					       + '<li>비고</li>'
					       + '<li title="ECS DR 장비운송 (의왕->안성) / HP Cooling Fan DL360p G8 / A15243621OUUAR">ECS DR 장비운송 (의왕->안성) / HP Cooling Fan DL360p G8 / A15243621OUUAR</li>'
					       + '<li>제품번호</li>'
					       + '<li title="29087564">29087564</li>' 
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
			
			
			
			$('#btnModify').click(function() {
				
				if($('input[name="gubun"]').is(':checked')) {
					/* var litIdx = parseInt($('input[name="gubun"]:checked').val());
					var jsonData = {'SP_KEY' : $('input[name="spKey"]').eq(litIdx).val()}; */
					
					fn_detailPop($('input[name="gubun"]:checked').parent().next().next().next().children().eq(0).val());
					
				} else {
					alert("수정할 대상을 선택하세요.");
					
					return false;
				}				
			});
			
			$('#btnDelete').click(function() {
				
				alert('btnDelete');
				
				if($('input[name="gubun"]').is(':checked')) {
					if(confirm("선택한 내용을 삭제하시겠습니까?")) {
						
						var litIdx = parseInt($('input[name="gubun"]:checked').val());
						
						var jsonData = {'ORDER_KEY' : $('input[name="orderKey"]').eq(litIdx).val()};
						
						//alert($('input[name="orderKey"]').eq(litIdx).val() + "\n" + litIdx);
						
			           $.ajax({
				        	url :"/mngProject/order/delete.do",
				        	type:"POST",  
				            data: jsonData,
				     	   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				     	   dataType: 'json',
				           async : false,
				        	success:function(data){		  
				            	alert("삭제되었습니다.!");
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

		function fn_addView(link){
			/* if(link == "forecastList") {
				location.href="<c:url value='/forecastList.do'/>";
			} else { */
				var url = '/mngProject/order/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
		
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:608px'); 
			/* } */
		}
		
		function fn_searchList()
		{                
			document.listForm.action = "/mngProject/order/list.do";
           	document.listForm.submit(); 
		}

		function fn_detailPop(pjKey) {
			
			//alert(pstOrderKey);
			
			/* var url = '/mngProject/order/addInfo.do?orderKey=' + pstOrderKey;
			//var url = '/mngProject/order/addInfo.do';
			var dialogId = 'program_layer';
			//var varParam = { 'orderKey' : pstOrderKey };
			var varParam = { };
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  */
			
			var url = '/project/write/orderInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
					"pjKey": pjKey
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
		}
		
		function fn_viewDetail(pjKey) {
			form = document.listForm;
			form.pjKey.value = pjKey;
			form.workClass.value = "입찰_첨부파일";
			form.action = "<c:url value='/project/detail/main.do?isOrderDetail=true'/>";
			
			form.submit(); 
		} 
	</script>
</head>
<body>
	<form:form modelAttribute="searchVO" id="listForm" name="listForm" method="post">
		<input type="hidden" id="workClass" name="workClass" />
		<input type="hidden" id="pjKey" name="pjKey" />
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">발주 목록</label></div>
						<%-- <div class="addBtn floatL cursorP" onclick="javascript:fn_addView('addInfo')"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>
					</div>
					<div class="floatR">
						<!-- 
						<form:select path="orderCtClass">
							<form:option value="">구분</form:option>
							<form:option value="P">프로젝트</form:option>
							<form:option value="M">유지보수</form:option>
						</form:select>
						 -->
						<form:input path="orderDtFrom"    type="text" class="calendar" placeholder="발주시작일(from)" value="${orderDtFrom }"/><label> ~ </label><form:input path="orderDtTo" type="text" class="calendar" placeholder="발주종료일(to)" value="${orderDtTo }"/>
						<form:input path="orderKeySearch" type="text" placeholder="발주번호" style="width: 80px;" onKeyPress="if(event.keyCode==13){fn_searchList();}"/>
						<form:input path="orderEmpNm"     type="text" placeholder="발주자" style="width: 80px;" onKeyPress="if(event.keyCode==13){fn_searchList();}"/>
						<form:input path="pjNm"           type="text" class="search" placeholder="프로젝트명" onKeyPress="if(event.keyCode==13){fn_searchList();}"/>
						<span><img onclick="javascript:fn_searchList();" src="<c:url value='/images/icon_search.png'/>" /></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">선택</th>
								<th scope="row">No</th>
								<th scope="row">고객사</th>
								<th scope="row">프로젝트명</th>
								<th scope="row">발주일</th>
								<th scope="row">발주번호</th>
								<th scope="row">매입처</th>
								<th scope="row">수량</th>
								<th scope="row">합계(VAT별도)</th>
								<th scope="row">발주자</th>
								<th scope="row">영업담당자</th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach var="result" items="${orderList}" varStatus="status">
								<tr>
									<td></td>
									<td><c:out value="${status.count}"/></td>
									<td><c:out value="${result.acNm}"/></td>
									<td><input type="hidden" value="${result.pjKey }" /><a href="javascript:fn_viewDetail('${result.pjKey}')"><c:out value="${result.pjNm}"/></a></td>
									<td><c:out value="${displayUtil.displayDate(result.orderDt)}"/></td>
									<td><c:out value="${result.orderKey}"/></td>
									<td><c:out value="${result.orderAcNm}"/></td>
									<td><c:out value="${result.orderCount}"/></td>
									<td><c:out value="${displayUtil.commaStr(result.orderAmount)}"/></td>
									<td><c:out value="${result.orderEmpNm}"/></td>
									<td><c:out value="${result.salesEmpNm}"/></td>
								</tr>
								<input type="hidden" name="orderKey" value="${result.orderKey}"/>
							</c:forEach>						
						
						<!-- 
							<tr>
								<td></td>
								<td>1</td>
								<td><span title="NH농협손해보험">NH농협손해보험</span></td>
								<td><span title="VDI 중요단말기 환경 구축 및 노후장비 교체dddddddddddddddddddddddddddddd">VDI 중요단말기 환경 구축 및 노후장비 교체dddddddddddddddddddddddddddddd</span></td>
								<td>2018-12-12</td>
								<td>78945612</td>
								<td><span title="DellTech">DellTech</span></td>
								<td>5</td>
								<td><span title="5,000,000">5,000,000</span></td>
								<td>김규민</td>
								<td>박영수</td>
							</tr>
						-->
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<div class="floatR">
						<button type="button" id="btnModify" value="수정"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
						<button type="button" id="btnDelete" value="삭제"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
						<button type="button" value="엑셀 다운로드"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>