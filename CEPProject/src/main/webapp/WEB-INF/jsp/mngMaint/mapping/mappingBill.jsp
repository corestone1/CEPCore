<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		.popContainer .top {
			width: 100%;
			height: 103px;
			border-bottom: 4px solid #4b3a93;
			position: absolute;
			top: 0;
		}
		.popContainer .top > div {
			font-size: 24px;
			padding-left: 34px;
			padding-top: 43px;
		}
		.popContainer .contents1 input[class="calendar"] {
			width: 150px;
			height: 31px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
			font-size: 15px;
			padding-left: 13px;
			border: 1px solid #e9e9e9;
		}
		.popContainer .subCalendar { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  					
			padding-top: 17px;	  					
			padding-bottom: 8px;
			margin-left: 38px;
			padding-right: 30px;
		}
		.popContainer .contents {
			width: 100%;
		    max-height: 562px;
		    overflow-y: hidden;
		    overflow-x: hidden;
		    top: 109px;
		    z-index: 3;
		    background-color: #fff;
		    position: absolute;
		}
		.popContainer .contents1 {
			width: 97%;
		}		
		.popContainer .subTitle { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  					
			padding-top: 24px;	  					
			padding-bottom: 8px;
			font-size: 18px;
			margin-left: 33px;
		}
		.popContainer .subTitle a {
			font-size: 14px;
			font-weight: 300;
		}
		.popContainer .subTitle a:hover {
			text-decoration: underline;
		}
		.popContainer .subTitle a label {
			display: inline-block;
		    width: 17px;
		    height: 17px;
		    border-radius: 50%;
		    vertical-align: middle;
		    text-align: center;
		    margin-left: 4px;
		    box-shadow: 2px 4px 4px -2px grey;
		    margin-bottom: 2px;
		}
		.popContainer .subTitle a label img {
			transform: rotate(270deg);
		    width: 7px;
		    vertical-align: top;
		    margin-top: 6px;
		}
		.popContainer .contents1 table {
			width: calc(100% - 201px);
			font-size: 15px;
			margin-left: 29px;
			border-collapse: collapse;
			overflow: hidden;
		}
		.popContainer table thead {
			background-color: #e1dff5;
			float: left;
			width: 1067px;
			border-top: 3.5px solid #6a5bae;
		}
		.popContainer table thead {
			display: table-header-group;
		}
		.popContainer .contents table tbody {
			width: 1067px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.popContainer .contents1 table thead tr, .popContainer .contents1 table tbody tr {
			display: table;
			width: 1066px;
		}
		.popContainer table thead th, .popContainer table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
		}
		.popContainer table tbody tr td span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			vertical-align: middle;
			width: 90%;
		}
		.popContainer .contents1 tr:first-child td { 
			border-bottom:2px solid #e5e5e5;	
		}	
		.contents1 table thead th:first-child,
		.contents1 table tbody td:first-child {
			width: 85px;
			max-width: 85px;
		}	
		.contents1 table thead th:nth-child(2),
		.contents1 table tbody td:nth-child(2) {
			width: 65px;
			max-width: 65px;
		}
		.contents1 table thead th:nth-child(3),
		.contents1 table tbody td:nth-child(3) {
			width: 212px;
			max-width: 212px;
		}
		.contents1 table thead th:nth-child(4),
		.contents1 table tbody td:nth-child(4) {
			width: 155px;			
			max-width: 155px;
		}
		.contents1 table thead th:nth-child(5),
		.contents1 table tbody td:nth-child(5) {
			width: 140px;
			max-width: 140px;
		}
		.contents1 table thead th:nth-child(6),
		.contents1 table tbody td:nth-child(6) {
			width: 101px;
			max-width: 101px;
		}
		.contents1 table thead th:nth-child(7),
		.contents1 table tbody td:nth-child(7),
		.contents1 table thead th:nth-child(8),
		.contents1 table tbody td:nth-child(8) {
			width: 111px;
			max-width: 111px;
		}
		/* .contents1 table thead th:nth-child(8),
		.contents1 table tbody td:nth-child(8) {
			width: 60px;
			max-width: 60px;
		} */
		.popContainer .contents2 {
			width: 100%;
		}
		.popContainer .contents2 select {
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
		.popContainer .contents2 table {
			width: 1068px;
			font-size: 15px;
			margin-top: 16px;
			margin-left: 29px;
			border-collapse: collapse;
			overflow: hidden;
		}
		.popContainer .contents2 table tbody {
			width: 1067px;
			height: 255px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.popContainer .contents2 table tbody tr:hover {
			background-color: #ddf0ec
		}
		.popContainer .contents2 table thead th, .popContainer .contents1 table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
		}
		.popContainer .contents2 table { 
			border-bottom:2px solid #e5e5e5;	
		}	
		.popContainer .contents2 table thead tr, .popContainer .contents2 table tbody tr {
			display: table;
			width: 1066px;
		}
		.contents2 table thead th:first-child,
		.contents2 table tbody td:first-child {
			width: 46px;
			max-width: 46px;
		}	
		.contents2 table thead th:nth-child(2),
		.contents2 table tbody td:nth-child(2) {
			width: 80px;
			max-width: 80px;
		}
		.contents2 table thead th:nth-child(3),
		.contents2 table tbody td:nth-child(3) {
			width: 60px;
			max-width: 60px;
		}
		.contents2 table thead th:nth-child(4),
		.contents2 table tbody td:nth-child(4) {
			width: 110px;
			max-width: 110px;
		}
		.contents2 table thead th:nth-child(5),
		.contents2 table tbody td:nth-child(5) {
			width: 80px;
			max-width: 80px;
		}
		.contents2 table thead th:nth-child(6),
		.contents2 table tbody td:nth-child(6) {
			width: 90px;
			max-width: 90px;
		}
		.contents2 table thead th:nth-child(7),
		.contents2 table tbody td:nth-child(7) {
			width: 180px;
			max-width: 180px;
		}
		.contents2 table thead th:nth-child(8), 
		.contents2 table tbody td:nth-child(8) {
		    width: 200px;
			max-width: 200px;
		}
		.popContainer .bottomBtn {
			margin-top: 10px;
			margin-right: 28px;
		}	
		input:read-only {
			border: none;
			text-align: center;
			color: #535353;
			font-family: "Noto Sans KR", sans-serif !important;
			font-weight: 200;
			background: transparent;
			height: 15px;
		}
		input[class="calendar"] {
			height: 31px;
		}
	</style>
	<script>
	
		jQuery.fn.serializeObject = function() { 
			var obj = null; 
			var objArry = null;
				try { 
					if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) {
						var arr = this.serializeArray(); 
						if(arr){ 
							obj = {};
							objArry = new Array();
							jQuery.each(arr, function() {
							
							if(this.name=="billAmount"){
								//숫자에서 컴마를 제거한다.
								obj[this.name] = removeCommas(this.value); 
							} else {
								obj[this.name] = this.value; 
							}
							
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('billFkPjKey' == this.name){
								objArry.push(obj);
								obj = {};
							}
						}); 	              
					} 
				} 
			}catch(e) { 
				alert(e.message); 
			}finally {} 
			return objArry; 
		}
		
		function fn_popSearch() {
			
            var url = '/mngMaint/mapping/mappingBill.do';
			var dialogId = 'program_layer';
			var varParam = {
				"mtOrderKey":$('#pop_mtOrderKey').val(),
				"mtOrderAcKey":$('#pop_mtOrderAcKey').val(),
				"billDtFrom":$('#billDtFrom').val(),
				"billDtTo":$('#billDtTo').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px');  
		}
		
		function fn_save() {
			
			//alert($('input[name="isCheck"]:checked').val());
			
			if($("input:radio[name=isCheck]:checked").length == 0) {
				alert("매핑할 계산서를 선택해주세요.");
			} else {
				/* $("#billMappingNum").val(Number($("#billMappingNum").val()) + $("input:checkbox[name=isCheck]:checked").length); */
				var checkNum = $('input[name="isCheck"]:checked').val();
				
				var currentBillMappedAmount = $("#pop_billMappedAmount").val(); //현재 매핑된 금액
				var selectBillMappedAmount = $("#"+checkNum+"-billAmount").val(); //선택한 매핑금액
				
				var totalBillMappedAmount = Number(currentBillMappedAmount)+Number(selectBillMappedAmount);
				
				//console.log("totalBillMappedAmount="+totalBillMappedAmount);
				
				//console.log("mtOrderAmount="+$("#pop_mtOrderAmount").val()+", currentBillMappedAmount="+currentBillMappedAmount+", selectBillMappedAmount="+selectBillMappedAmount);
				
				if(Number($("#pop_mtOrderAmount").val()) < Number(totalBillMappedAmount)) {
					alert("총 매핑 금액이 발주금액을 초과하여 매핑을 수행할 수 없습니다.\n - 발주금액       : "+addCommas($("#pop_mtOrderAmount").val())+" \n - 현재매핑금액 : "+addCommas(currentBillMappedAmount)+" \n - 선택매핑금액 : "+addCommas(selectBillMappedAmount));
				} else {
					if(confirm("계산서 '"+$("#"+checkNum+"-billNo").val() + "' 를(을) 매핑하시겠습니까?")) {
						var mappingBillInfo = {
								'mtIntegrateKey':$("#pop_mtIntegrateKey").val()
								, 'paymentBuyFkKey':$("#pop_mtOrderKey").val()
								, 'mtOrderType':$("#pop_mtOrderType").val()
								, 'paymentStatusCd':'M'
								, 'callAmount':$("#"+checkNum+"-billAmount").val()
								, 'paymentAcFkKey':$("#pop_mtOrderAcKey").val()
								, 'billFkKey':$("#"+checkNum+"-billNo").val()
						}
						console.log("mappingBillInfo====>"+JSON.stringify(mappingBillInfo));
						$.ajax({
							url:"/mngMaint/mapping/writePaymentBillMapping.do",
							dataType:'json',
							type:"POST",
							data:mappingBillInfo,
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				            async : false,
							success:function(response) {
								if(response != null && response.successYN == 'Y') {
									
									alert($("#"+checkNum+"-billNo").val() +' 계산서와 매핑되었습니다.');
									
									var url = '/mngMaint/mapping/mappingBill.do';
									var dialogId = 'program_layer';
									var varParam = {
										"mtOrderKey":$('#pop_mtOrderKey').val(),
										"mtOrderAcKey":$('#pop_mtOrderAcKey').val(),
										"billDtFrom":$('#billDtFrom').val(),
										"billDtTo":$('#billDtTo').val()
									}
									var button = new Array;
									button = [];
									showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px');  
									
								} else {
									alert('계산서 매핑이 실패하였습니다.');
								}
							},
							error: function(request, status, error) {
								if(request.status != '0') {
									alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
								}
							}
						});
					}
				}
			}
		}
		
		function openPaymentDetail(mtIntegrateKey, mtOrderType, mtWorkKey, mtOrderKey) {
			window.open("/mngMaint/payment/detail/main.do?mtIntegrateKey="+mtIntegrateKey+"&mtOrderType="+mtOrderType+"&mtWorkKey="+mtWorkKey+"&mtOrderKey="+mtOrderKey+"&iframGubun=list");
		}
	</script>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">계산서 - 발주 매핑</div>
			</div>
		</div>
		<div class="contents">
			<div class="contents1">
				<div>
					<div class="subTitle floatL">발주 정보</div>
					<div class="subTitle floatR"><a href="javascript:openPaymentDetail('${orderBillDetail.mtIntegrateKey}','${orderBillDetail.mtOrderType}','${orderBillDetail.mtWorkKey}','${orderBillDetail.mtOrderKey}')">지급 정보 보러가기<label><img src="/images/arrow_down.png" /></label></a></div>
					<div class="floatC"></div>
				</div>
				<div>
					<table class="textalignC ftw200" >
						<thead class="ftw400">
							<tr>
								<th scope="row">발주일자</th>
								<th scope="row">매핑상태</th>
								<th scope="row">유지보수명</th>
								<th scope="row">제품</th>
								<th scope="row">매입처명</th>
								<th scope="row">사업자번호</th>
								<th scope="row">매핑합계</th>
								<th scope="row">발주 합계</th>
								<th scope="row">담당자</th>
								<th style="max-width: 0px; display: none;">hiddenVal</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${displayUtil.displayDate(orderBillDetail.mtOrderDt) }</td>
								<td>${orderBillDetail.mappingCompleteYn}</td>
								<td class="textalignL"><span title="${orderBillDetail.mtNm }">${orderBillDetail.mtNm }</span></td>
								<td class="textalignL"><span title="${orderBillDetail.mtPmNm }">${orderBillDetail.mtPmNm }</span></td>								
								<td class="textalignL"><span title="${orderBillDetail.mtOrderAcKeyNm }">${orderBillDetail.mtOrderAcKeyNm }</span></td>
								<td><span title="${displayUtil.makeActypeForm(orderBillDetail.mtOrderAcKey) }">${displayUtil.makeActypeForm(orderBillDetail.mtOrderAcKey) }</span></td>
								<td class="textalignR"><span title="${displayUtil.commaStr(orderBillDetail.billMappedAmount) }">${displayUtil.commaStr(orderBillDetail.billMappedAmount) }</span></td>
								<td class="textalignR">
									<span title="${displayUtil.commaStr(orderBillDetail.mtOrderAmount) }">${displayUtil.commaStr(orderBillDetail.mtOrderAmount) }</span>			
								</td>
								<td>
									<span>${orderBillDetail.orderEmpNm }</span>
								</td>
								<td style="max-width: 0px; display: none;">			
									<input type="hidden" id="pop_mtIntegrateKey" value="${orderBillDetail.mtIntegrateKey}"/>					
									<input type="hidden" id="pop_mtOrderKey" value="${orderBillDetail.mtOrderKey }"/>
									<input type="hidden" id="pop_mtOrderType" value="${orderBillDetail.mtOrderType }"/>
									<input type="hidden" id="pop_mtOrderAcKey" value="${orderBillDetail.mtOrderAcKey }"/>
									<input type="hidden" id="pop_mtOrderAmount" value="${orderBillDetail.mtOrderAmount }"/>
									<input type="hidden" id="pop_billMappedAmount" value="${orderBillDetail.billMappedAmount }"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="contents2">	
				<form:form commandName="searchVO" id="billListForm" name="billListForm" method="post">
					<div>
						<div class="subTitle floatL">계산서 정보</div>
						<div class="subCalendar floatR">
							<form:input path="billDtFrom" type="text" class="calendar" placeholder="from" value="${searchParam.billDtFrom}"/>
							&nbsp; ~&nbsp; 
							<form:input path="billDtTo" type="text" class="calendar" placeholder="to" value="${searchParam.billDtTo}"/>
							<span onclick="fn_popSearch();"><img class="veralignM" style="width: 33px; height: 33px;" src="<c:url value='/images/icon_search.png'/>" /></span>
						</div>
					</div>	
					<div>
						<table class="textalignC ftw200" id="popMappingTable">
							<thead class="ftw400">
								<tr>
									<th scope="row">선택</th>
									<th scope="row">발급일자</th>
									<th scope="row">매핑상태</th>
									<th scope="row">매입처</th>
									<th scope="row">사업자번호</th>
									<th scope="row">계산서금액</th>
									<th scope="row">계산서번호</th>
									<th scope="row">비고</th>
									<th style="max-width: 0px; display: none;">hiddenVal</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="result" items="${mappingBillList }" varStatus="status">
									<tr>
										<td>
											
											<c:choose>
												<c:when test="${result.billMappingYn eq 'N' }">
													<input type="radio" class="tRadio" name="isCheck" id="popCheck${status.count }" value="${status.count}"/>
													<label for="popCheck${status.count }" class="cursorP"></label>
												</c:when>
												<c:otherwise>
													<p>완료</p>
												</c:otherwise>
											</c:choose>
										</td>
										<td>${displayUtil.displayDate(result.billIssueDt) }</td>
										<td>${result.billMappingYn }</td>
										<td class="textalignL"><span title="${orderBillDetail.mtOrderAcKeyNm }">${orderBillDetail.mtOrderAcKeyNm }</span></td>
										<td>${displayUtil.makeActypeForm(result.billAcKey)}</td>
										<td class="textalignR"><span title="${displayUtil.commaStr(result.billAmount)}">${displayUtil.commaStr(result.billAmount)}</span>&nbsp;</td>
										<td><span title="${result.billNo }">${result.billNo}</span></td>
										<td class="textalignL"><span title="${result.remark}">${result.remark}</span></td>
										<td style="max-width: 0px; display: none;">
											<input type="hidden" id="<c:out value="${status.count}"/>-billNo" value="<c:out value="${result.billNo }" />"/>
											<input type="hidden" id="<c:out value="${status.count}"/>-billAmount" value="<c:out value="${result.billAmount }" />"/>
										</td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form:form>	
			</div>		
			<div class="bottomBtn">		
				<div class="btnWrap">
					<div class="floatR">
						<c:if test="${orderBillDetail.mappingCompleteYn eq 'N'}">	
							<button type="button" onclick="fn_save();"><img src="<c:url value='/images/btn_bill_mapping.png'/>" /></button>
						</c:if>
						<%-- <c:choose>
							<c:when test="${orderBillDetail.mtOrderAmount eq orderBillDetail.billMappedAmount}">
							</c:when>
							<c:otherwise>
								<button type="button" onclick="fn_save();"><img src="<c:url value='/images/btn_bill_mapping.png'/>" /></button>
							</c:otherwise>
						</c:choose> --%>
					</div>			
					<div class="floatC"></div>	
				</div>
			</div>
		</div>
	</div>
	<form id="orderInfoForm">
		<input id="mtOrderKey" name="mtOrderKey" type="hidden" value="${orderBillDetail.mtOrderKey }"/>
		<input type="hidden" name="billMappedAmount" id="billMappedAmount" value="${orderBillDetail.billMappedAmount }" />
	</form>
</body>
</html>