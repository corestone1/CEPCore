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
			padding-right: 48px;
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
			width: 96%;
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
		.popContainer .contents1 table tbody {
			width: 1067px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.popContainer table tbody tr {
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
			width: 127px;
		}	
		.contents1 table thead th:nth-child(2),
		.contents1 table tbody td:nth-child(2) {
			width: 80px;
		}
		.contents1 table thead th:nth-child(3),
		.contents1 table tbody td:nth-child(3) {
			width: 240px;
			max-width: 240px;
		}
		.contents1 table thead th:nth-child(4),
		.contents1 table tbody td:nth-child(4) {
			width: 160px;
		}
		.contents1 table thead th:nth-child(5),
		.contents1 table tbody td:nth-child(5) {
			width: 164px;
			max-width: 164px;
		}
		.contents1 table thead th:nth-child(6),
		.contents1 table tbody td:nth-child(6) {
			width: 141px;
		}
		.contents1 table thead th:nth-child(7),
		.contents1 table tbody td:nth-child(7) {
			width: 91px;
			max-width: 91px;
		}
		.contents1 table thead th:nth-child(8),
		.contents1 table tbody td:nth-child(8) {
			width: 60px;
			max-width: 60px;
		}
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
		.contents2 table thead th:first-child,
		.contents2 table tbody td:first-child {
			width: 46px;
		}	
		.contents2 table thead th:nth-child(2),
		.contents2 table tbody td:nth-child(2) {
			width: 103px;
		}
		.contents2 table thead th:nth-child(3),
		.contents2 table tbody td:nth-child(3) {
			width: 68px;
		}
		.contents2 table thead th:nth-child(4),
		.contents2 table tbody td:nth-child(4) {
			width: 158px;
		}
		.contents2 table thead th:nth-child(5),
		.contents2 table tbody td:nth-child(5) {
			width: 140px;
		}
		.contents2 table thead th:nth-child(6),
		.contents2 table tbody td:nth-child(6) {
			width: 123px;
		}
		.contents2 table thead th:nth-child(7),
		.contents2 table tbody td:nth-child(7) {
			width: 157px;
		}
		.contents2 table thead th:nth-child(8), 
		.contents2 table tbody td:nth-child(8) {
		    width: 189px;
		}
		.contents2 table thead th:nth-child(9), 
		.contents2 table tbody td:nth-child(9) {
		    width: 73px;
		}
		.popContainer .bottomBtn {
			margin-top: 10px;
			margin-right: 48px;
		}	
		input:read-only {
			border: none;
			text-align: center;
			color: #535353;
			font-family: "Noto Sans KR", sans-serif !important;
			font-weight: 200;
			background: transparent;
			height: 21px;
			text-overflow: ellipsis;
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
            var url = '/mngProject/mapping/mappingBill.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjOrderKey":$("input[name='pjOrderKey']").val(),
				"billDtFrom":$("input[name='billDtFrom']").val(),
				"billDtTo":$("input[name='billDtTo']").val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  
		}
		
		function fn_cancelMappingBill(obj, billNo, paymentKey) {
			
			if(confirm("계산서 "+ $(obj).parent().prev().prev().children().val() + "을 매핑 취소 하시겠습니까?")) {
				var object =  { "pjOrderKey" : $("#pjOrderKey").val(), "billNo" : billNo };
				
				var sendData = JSON.stringify(object);
				
				
				$.ajax({
					url:"/mngProject/mapping/cancelMapping.do?paymentKey="+paymentKey,
					dataType:'json',
					type:"POST",
					data:sendData,
					contentType:"application/json; charset=UTF8",
					success:function(response) {
						if(response != null && response.successYN == 'Y') {
							
							alert($(obj).parent().prev().prev().children().val() +' 계산서와 매핑이 취소되었습니다.');
							
							var url = '/mngProject/mapping/mappingBill.do';
							var dialogId = 'program_layer';
							var varParam = {
								"pjOrderKey":$("input[name='pjOrderKey']").val(),
								"billDtFrom":$("input[name='billDtFrom']").val(),
								"billDtTo":$("input[name='billDtTo']").val()
							}
							var button = new Array;
							button = [];
							showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  
						} else {
							alert('계산서 매핑 취소에 실패하였습니다.');
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
			
			function fn_save() {
				
				if($("input:radio[name=isCheck]:checked").length == 0) {
					alert("매핑할 계산서를 선택해주세요.");
				} else {
					/* $("#billMappingNum").val(Number($("#billMappingNum").val()) + $("input:checkbox[name=isCheck]:checked").length); */
					var totalBillMappedAmount = 0;
					var originBillMappedAmount = $("#billMappedAmount").val();
					
					var object = {};
					var listData = $("#billListForm").serializeObject();
					
					var index = [];
					for(var list in listData) {
						if(listData[list].hasOwnProperty('isCheck') == false) {
							index.push(listData.indexOf(listData[list]));
						}
					}
					for(var i = index.length - 1; i >= 0; i--) {
						listData.splice(index[i], 1);
					}
					
					for(var i = 0; i < listData.length; i++) {
						totalBillMappedAmount += Number(listData[i].billAmount);
					}
					
					if(Number($("#orderAmount").val()) < Number(originBillMappedAmount) + Number(totalBillMappedAmount)) {
						alert("발주 금액과 계산서 금액이 맞지 않습니다. (현재 매핑된 금액: " + addCommas(originBillMappedAmount) + "원)");
					} else {
						if(confirm("계산서 "+ $("input:radio[name=isCheck]:checked").prev().attr("value") + "을 매핑하시겠습니까?")) {
							$("#billMappedAmount").val(totalBillMappedAmount);
							
							var formData = $("#orderInfoForm").serializeArray();
							for (var i = 0; i<formData.length; i++){
				                object[formData[i]['name']] = formData[i]['value'];
				            }
							
							object["billList"]=listData;
							
							var sendData = JSON.stringify(object);
							
							var sch = location.search
							var params = new URLSearchParams(sch);
							var sch_keyword = params.get('paymentKey');
							
							$.ajax({
								url:"/mngProject/mapping/compMapping.do?paymentKey="+sch_keyword,
								dataType:'json',
								type:"POST",
								data:sendData,
								contentType:"application/json; charset=UTF8",
								success:function(response) {
									if(response != null && response.successYN == 'Y') {
										
										alert($("input:radio[name=isCheck]:checked").prev().attr("value") +' 계산서와 매핑되었습니다.');
										
										 var url = '/mngProject/mapping/mappingBill.do';
										var dialogId = 'program_layer';
										var varParam = {
											"pjOrderKey":$("input[name='pjOrderKey']").val(),
											"billDtFrom":$("input[name='billDtFrom']").val(),
											"billDtTo":$("input[name='billDtTo']").val()
										}
										var button = new Array;
										button = [];
										showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  
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
					<div class="subTitle floatR"><a href="/project/request/purchase/main.do?mainKey=${orderVO.orderCtFkKey}&orderKey=${orderVO.pjOrderKey }">지급 정보 보러가기<label><img src="/images/arrow_down.png" /></label></a></div>
					<div class="floatC"></div>
				</div>
				<div>
					<table class="textalignC ftw200" >
						<thead class="ftw400">
							<tr>
								<th scope="row">발주일자</th>
								<th scope="row">매핑상태</th>
								<th scope="row">프로젝트명</th>
								<th scope="row">제품</th>
								<th scope="row">거래처 상호</th>
								<th scope="row">사업자번호</th>
								<th scope="row">제품 합계</th>
								<th scope="row">담당자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${displayUtil.displayDate(orderVO.orderDt) }</td>
								<td>
									<c:choose>
										<c:when test="${orderVO.orderAmount eq orderVO.billMappedAmount }">
											<label>Y</label>
										</c:when>
										<c:otherwise>
											<label>N</label>
										</c:otherwise>
									</c:choose>
								</td>
								<td><span title="${orderVO.pjNm }">${orderVO.pjNm }</span></td>
								<td>
									<c:forEach var="pResult" items="${orderVO.productList }" varStatus="pStatus">
										${pResult.pmNmCd }<c:if test="${pStatus.last eq false}">,</c:if>
									</c:forEach>
								</td>
								<td><span title="${orderVO.orderAcNm }">${orderVO.orderAcNm }</span></td>
								<td><span title="${orderVO.orderAcKey }">${orderVO.orderAcKey }</span></td>
								<td>
									<span title="${displayUtil.commaStr(orderVO.orderAmount) }">${displayUtil.commaStr(orderVO.orderAmount) }</span>
									<input type="hidden" id="orderAmount" value="${orderVO.orderAmount }"/>
								</td>
								<td><span>${orderVO.orderEmpNm }</span></td>
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
							<form:input path="billDtFrom" type="text" class="calendar" placeholder="from" />
							&nbsp; ~&nbsp; 
							<form:input path="billDtTo" type="text" class="calendar" placeholder="to"/>
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
									<th scope="row">합계금액</th>
									<th scope="row">계산서번호</th>
									<th scope="row">비고</th>
									<th scope="row">매핑 취소</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="result" items="${billList }" varStatus="status">
									<tr>
										<td>
											<input type="hidden" value="<c:out value="${result.billNo }" />" />
											<c:choose>
												<c:when test="${result.billMappingYn eq 'N' }">
													<input type="radio" class="tRadio" name="isCheck" id="popCheck${status.count }"/>
													<label for="popCheck${status.count }" class="cursorP"></label>
												</c:when>
												<c:otherwise>
													<p>완료</p>
												</c:otherwise>
											</c:choose>
										</td>
										<td>${displayUtil.displayDate(result.billIssueDt) }</td>
										<td><input type="text" name="billMappingYn" value="${result.billMappingYn }" title="${result.billMappingYn }" readOnly style="width: 30px;"/></td>
										<td><input type="text" name="acNm" value="${result.acNm }" title="${result.acNm }" readOnly style="width: 138px;"/></td>
										<td><input type="text" name="billAcKey" value="${result.billAcKey }" title="${result.billAcKey }" readOnly style="width: 108px;"/></td>
										<td><input type="text" name="billAmount" value="${displayUtil.commaStr(result.billAmount) }" title="${displayUtil.commaStr(result.billAmount) }" readOnly style="width: 103px;"/></td>
										<td><input type="text" name="billNo"  value="${result.billNo }" title="${result.billNo }" readOnly style="width: 120px;" /></td>
										<td><input type="text" name="remark"  value="${result.remark }" title="${result.remark }" readOnly  /></td>
										<td style="font-size: 13px;">
											<c:if test="${result.billMappingYn eq 'Y' and (result.paymentStatusCd eq 'PYST1000')}">
												<button type="button" value="매핑취소" onclick="fn_cancelMappingBill(this, '${result.billNo}', '${result.paymentKey }');">매핑취소</button>
											</c:if>
											<c:if test="${result.billMappingYn eq 'N'}">
												<label>미매핑</label>
											</c:if>
											<c:if test="${result.paymentStatusCd eq 'PYST2000' or result.paymentStatusCd eq 'PYST3000' or result.paymentStatusCd eq 'PYST4000'}">
												<label>지급진행중</label>
											</c:if>
										</td>
									</tr>
									<input type="hidden" value="${orderVO.buyKey }" name="billCtFkKey"/>
									<input type="hidden" value="${orderVO.orderCtFkKey }" name="billFkPjKey"/>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form:form>	
			</div>		
			<div class="bottomBtn">		
				<div class="btnWrap">
					<div class="floatR">
						<c:choose>
							<c:when test="${orderVO.orderAmount eq orderVO.billMappedAmount }">
							</c:when>
							<c:otherwise>
								<button type="button" onclick="fn_save();"><img src="<c:url value='/images/btn_bill_mapping.png'/>" /></button>
							</c:otherwise>
						</c:choose>
					</div>			
					<div class="floatC"></div>	
				</div>
			</div>
		</div>
	</div>
	<form id="orderInfoForm">
		<input id="pjOrderKey" name="pjOrderKey" type="hidden" value="${orderVO.pjOrderKey }"/>
		<input type="hidden" name="billMappingNum" id="billMappingNum" value="${orderVO.billMappingNum}"/>
		<input type="hidden" name="billMappedAmount" id="billMappedAmount" value="${orderVO.billMappedAmount }" />
	</form>
</body>
</html>