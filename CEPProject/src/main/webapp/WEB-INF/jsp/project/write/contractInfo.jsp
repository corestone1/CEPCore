<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
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
		.popContainer .left {
			width: 201px;
			height: 601px;
			position: absolute;
			top: 107px;
			box-shadow: 3px -1px 8px 0px rgb(0,0,0,0.3);
			background-color: #32bc94;
			z-index: 4;
		}
		.popContainer .left ul li {
			height: 47px;
			padding-left: 28px;
			line-height: 47px;
		}
		.popContainer .left ul li.on,
		.popContainer .left ul li:hover {
			background-color: #fff;
			color: #32bc94;
		}
		.popContainer .contents {
			position: absolute;
			width: calc(100% - 201px);
			height: 601px;
			top: 107px;
			left: 201px;
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto;
		}
		.popContainer .contents > div {
			width: calc(100% - 80px);
			margin: 10px 40px 0 40px;
		}
		.popContainer .contents > div:first-child {
			min-height: 529px;
		}
		.popContainer .contents > div > form >table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
	  		width: 789px;
		}
		/* .popContainer .contents > div > table tr:first-child td {
			margin-bottom: 100px;
		} */
		.popContainer .contents td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer .contents td.tdTitle {
			margin-top: 11px;
			width: 96px;
		}				
		.popContainer .contents td.tdContents {
			width: 691px;
		} 	
		.popContainer .contents td:last-child {
			padding-right: 0px !important;
		} 				
		.popContainer .top div[class="subTitle"] {
			height: 36px;
			width: 124px;
			border-radius: 35px;
			color: #fff;
			background-color: #9284d1;
			margin-left: 150px;
			text-align: center;
			font-weight: 200;
		} 		
		.popContainer .contents td.firstRow { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  			
			font-size: 14px;				
		}
		.popContainer .contents select {
			width: 200px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 36px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;	
		}
		.popContainer .contents select option:first-child{
		 	color: #a4a4a4;
		}
		.popContainer .contents input {
			width: 179px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
		}
		.popContainer .contents .disc {
			font-size: 14px;
		    color: #afafaf;
		}
		.popContainer .contents input[class="rateInfo"] {
			width: 90px;
			height: 38px;
		}
		.popContainer .contents input[class="amount"] {
			text-align: right;
		}
	</style>
	<script>
		$(document).ready(function() {
			
			$('input[id^=selectKey]').each(function() {
				if($(this).val() != "" || $(this).val().length != 0) {
					$('.btnSave').children().eq(0).html('');
					$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />');
				}
			})
			
			$('input[id^=rate]').change(function(event) { 
				if($('#sum').val() == null || $('#sum').val() == "" || $('#sum').val() == 0) {
					alert('총 계약금액을 입력해주세요.');
					$('#sum').focus();
					$(this).val('');
				} else {
					$('#amount'+$(this).attr('id').substring(4)).val($('#sum').val().replace(/,/g, '') * $(this).val() / 100);	
				}
			});
		});
		
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
								
							if(this.name=="salesTurnAmount") {
								//숫자에서 컴마를 제거한다.
								obj[this.name] = removeCommas(this.value); 
							} else if(this.name=="salesChargeDt") {
								//날짜에서 -를 제거한다.
								obj[this.name] =  removeData(this.value,"-"); 
							} else {
								obj[this.name] = this.value; 
							}
							
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('salesChargeDt' == this.name){
								objArry.push(obj);
								obj = {};
							}
						}); 	              
					} 
				} 
			} catch(e) { 
				alert(e.message); 
			} finally {} 
			return objArry; 
		}
		
		function fn_chkVali() {
            if ($("#basicForm")[0].checkValidity()){ 
               //필수값 모두 통과하여 저장 프로세스 호출.
            	if ($("#salesListForm")[0].checkValidity()){ 
               		fn_save();
            	} else {
            		$("#salesListForm")[0].reportValidity();   
            	}
            } else {
                $("#basicForm")[0].reportValidity();   
            }            
		}
		
		function fn_turnChange(){
			var turnVal = document.getElementById("turnInfo");
			var beforeTurn = parseInt(document.getElementById("beforeTurn").value);
			
			var calcuTurn = turnVal.value - beforeTurn;
			
			if(calcuTurn>0) {
				for(i=0; i<calcuTurn; i++){
					var rowItem = "<tr class='ftw200'>";
					rowItem += "<td>"+(beforeTurn+i+1)+ "회차 :&nbsp;&nbsp;";
					/* <form id='form"+(beforeTurn+i)+"' name='form' display: block !important'>"+(beforeTurn+i+1)+ "회차 :&nbsp;&nbsp;"; */
					rowItem += "<input type='text' name='salesCollectRate' id='rate"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 비율' numberOnly class='rateInfo' required/>";
					rowItem += "&nbsp;&nbsp;%&nbsp;&nbsp;&nbsp;&nbsp;";
					rowItem += "<input type='text' name='salesTurnAmount' id='amount"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 금액' amountOnly class='amount' required />&nbsp;원";
					/* rowItem += "<input type='hidden' name='selectKey' value='"+($('#selectKey'+(beforeTurn+i+1)).val()).equals('')?$('#selectKey'+(beforeTurn+i+1)).val(): +"' />"; */
					/* rowItem += "<input type='hidden' name='salesCtClass' value='P' />"; */
					/* rowItem += "<input type='hidden' class='salesChargeDt' name='salesChargeDt' value='"+$('#salesChargeDt').val() +"' />"; */
			/* 		rowItem += "<input type='hidden' name='collectTurn' value='"+(beforeTurn+i+1)+"' />"; */
					rowItem += "<input type='hidden' name='salesTurn' value='"+(beforeTurn+i+1)+"' />";
					/* rowItem += "<input type='hidden' name='salesTurnAmount' id='sAmount"+(beforeTurn+i+1)+"' value='' />"; */
					rowItem += "<input type='hidden' name='salesKey' value='' />";
					rowItem += "<input type='hidden' name='isNew' value='Y' />";
					/* rowItem += "<input type='hidden' name='ctKey' value='' />"; */
					/* </form></td>"; */
					rowItem += "&nbsp;&nbsp;&nbsp;&nbsp;청구일자 :&nbsp;<input type='text' id='salesChargeDt"+(beforeTurn+i+1)+"' class='calendar' name='salesChargeDt' placeholder='청구일' value='' required/></td>";
					rowItem += "</tr>";
					
					$('#addRow').append(rowItem);
				}
			} else {
				var deleteRow = document.getElementById("addRow").rows.length -turnVal.value;
				for(i=0; i<deleteRow; i++){
					document.getElementById("addRow").deleteRow(document.getElementById("addRow").rows.length-1);
				}
			}
			document.getElementById("beforeTurn").value= turnVal.value;
			
			$('input[id^=rate]').change(function(event) { 
				if($('#sum').val() == null || $('#sum').val() == "" || $('#sum').val() == 0) {
					alert('총 계약금액을 입력해주세요.');
					$('#sum').focus();
					$(this).val('');
				} else {
					$('#amount'+$(this).attr('id').substring(4)).val($('#sum').val().replace(/,/g, '') * $(this).val() / 100);	
				}
			});
		}
		
		var countSave = 0;
		/* var ctKeyList = "";
		var salesKeyList = []; */
		
		function fn_save() {
			var sum = null;
			
			for(var i = 0; i < parseInt(document.getElementById("beforeTurn").value); i++) {
				sum += parseInt($('#amount'+(i+1)).val().replace(/,/g, ''));
			}
			
			if(sum == null) {
				alert('회차별 정보를 등록해주세요.');
			}else if(sum != $('#sum').val().replace(/,/g, '')) {
				alert('회차별 금액 합계와 총 계약 금액이 일치하지 않습니다.');
			} else {
				
				$("#collectTurn").val($("#beforeTurn").val());
				
				var object = {};
				
				/* $('.salesChargeDt').each(function() {
					$(this).val($('#salesChargeDt').val());	
				}); */
				
				/* for(var i = 1; i <= $('#beforeTurn').val(); i++) {
					$('#sAmount'+i).val($('#amount'+i).val());
				} */
				
				var formData = $("#basicForm").serializeArray();
				var listData = $("form[name=salesListForm]").serializeObject();
			 	
				for (var i = 0; i<formData.length; i++){
					if(formData[i]['name']=="ctAmount") {
						//숫자에서 컴마를 제거한다.
						object[formData[i]['name']] = removeData(formData[i]['value'], ",");
					} else if(formData[i]['name']=="ctDt") {
						//날짜에서 -를 제거한다.
						object[formData[i]['name']] = removeData(formData[i]['value'],"-");
					} else {
						object[formData[i]['name']] = formData[i]['value'];
					}
	            }
				
				object["projectContractSalesVOList"]=listData;
				
				var sendData = JSON.stringify(object);
			 	$.ajax({
					url:"/project/insert/contractInfo.do",
					dataType: 'json', 
				    type:"POST",  
				    data: sendData,
				    async:false, 
				 	contentType: "application/json; charset=UTF-8", 
					beforeSend: function(xhr) {
						xhr.setRequestHeader("AJAX", true);
						//xhr.setRequestHeader(header, token);
						
					},
				    success:function(response){	
				    	if(response!= null && response.successYN == 'Y') {
				    		countSave++; 
				    		/* for(var i = 0; i < response.ctKey.length; i++) {
				    			salesKeyList.push(response.saleKey[i]); 
				    		} 
				    		ctKeyList.push(response.ctKey); */
				    		
				    		if($("input[name=selectKey]").val() == null || $("input[name=selectKey]").val() == "" || $("input[name=selectKey]").val().length == 0) {
					    		alert("프로젝트 계약 정보가 등록되었습니다.");
					    		countSave++;
				    		} else {
				    			alert("프로젝트 계약 정보가 수정되었습니다.");
				    		}
				    		
				    		var url='/project/write/contractInfo.do';
			    			var dialogId = 'program_layer';
			    			var varParam = {
								"pjKey":$("#pjKey").val()
			    			}
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
				    	} else {
				    		if($("#selectKey").val() == null || $("#selectKey").val() == "" || $("#selectKey").val().length == 0) {
				    			alert("프로젝트 계약 정보 등록이 실패하였습니다.");
				    		} else {
				    			alert("프로젝트 계약 정보 수정이 실패하였습니다.");
				    		}
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
		
		function fn_next(link) {
			if(countSave > 0) {
				var url = '/project/write/'+link+'.do';
				var dialogId = 'program_layer';

				var varParam = {
						"pjKey": $("#pjKey").val()/* ,
						"turnNo": $("#beforeTurn").val(),
						"ctKey": ctKeyList,
						"salesKey": salesKeyList  */
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px');
			}
			else {
				if($('#selectKey').val() != "" || $('#selectKey').val().length != 0) {
					var ctKey = "";
					var salesKey = [];
					for(var i = 0; i < $('#beforeTurn').val(); i++) {
						salesKey.push($('#salesKey'+i).val());
					}
					ctKey = $('#ctKey').val();
					console.log(salesKey);
					var url = '/project/write/'+link+'.do';
					var dialogId = 'program_layer';
					var varParam = {
							"pjKey": $("#pjKey").val()/* ,
						 	"turnNo": $("#beforeTurn").val(),
							"ctKey":ctKey,
							"salesKey":salesKey  */
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px');
				} else {
					alert('저장을 해주세요.');
				}
			}
		}
		
		function fn_prevView(){
			var url = '/project/write/biddingInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey" : $('#pjKey').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  
		}
	</script>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">프로젝트 등록</div>
				<div class="subTitle">계약</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
				<li class="colorWhite cursorP on">금액</li>
				<li class="colorWhite cursorP">예상일정</li>
			</ul>
		</div>
		<c:set var = "total" value = "0" />
		<c:set var = "max" value = "0" />
		<c:forEach var="result" items="${salesList}" varStatus="status">     
			<c:set var= "total" value="${total + result.ctAmount}"/>
			<c:if test="${max < result.collectTurn }">
				<c:set var="max" value="${result.collectTurn }" />
			</c:if>
		</c:forEach>
		<fmt:formatNumber value="${total }" pattern="#,###" var="totalAmount"/>
		<div class="contents">
			<div>
				<form id="basicForm">
					<c:forEach var="result" items="${salesList}" varStatus="status">     
						<input type="hidden" id="selectKey${status.index }" name="selectKey" value="${result.salesKey }" />
						<input type="hidden" id="salesKey${status.index }" name="salesKey" value="${result.salesKey }" />
					</c:forEach> 
					<input type="hidden" id="selectKey" name="selectKey" value="${contractVO.ctKey }" />
					<input type="hidden" id="ctKey" name="ctKey" value="${contractVO.ctKey }" />
					<input type="hidden" id="pjKey" name="pjKey" value="${pjKey }" /> 
					<input type="hidden" id="collectTurn" name="collectTurn" value="${contractVO.collectTurn }" /> 
					<input type="hidden" name="pjStatusCd" value="PJST2000" />
					<table>
						<tr class="ftw200">
							<td class="firstRow">
								<input type="text" id="sum" name="ctAmount" placeholder="총 계약금액"  amountOnly class="amount"  value="${displayUtil.commaStr(contractVO.ctAmount) }" required/>&nbsp;원
								<%-- value="<c:out value="${total eq 0 ? null : totalAmount}"/>"/> &nbsp;원 --%>
							</td>
						</tr>
						<tr class="ftw200">
							<%-- <td>
								<input type="text" id="salesChargeDt" class="calendar" name="salesChargeDt" placeholder="청구일" value="<c:out value="${displayUtil.displayDate(contractVO.salesChargeDt)}"/>" required/> 
							</td> --%>
							<td>
								<input type="text" id="ctPayTerms" name="ctPayTerms" placeholder="결제조건" value="<c:out value="${contractVO.ctPayTerms}"/>" />
								<label class="disc">&nbsp;&nbsp;&nbsp;ex. 계산서 발행 후 30일</label>
							</td>
						</tr>
						<tr class="ftw200">
							<td>
								<input type="text" id="ctDt" class="calendar" name="ctDt" placeholder="계약 일자" value="<c:out value="${displayUtil.displayDate(contractVO.ctDt)}"/>" required/>
							</td>
						</tr>
						<tr class="ftw200">
							<td>
								<input type="hidden" id="beforeTurn" value="${contractVO.collectTurn eq null ? 0 : contractVO.collectTurn }">
								<c:set var="turnNo" value="${contractVO.collectTurn eq null ? 0 : contractVO.collectTurn }" />
								<select id="turnInfo" onchange="fn_turnChange()" placeholder="계약금액">
									<option value="0" <c:if test="${contractVO.collectTurn > 0 }">style='display: none;'</c:if>>지급회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 1}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 1 }">style='display: none;'</c:if> value="1">1회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 2}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 2 }">style='display: none;'</c:if> value="2">2회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 3}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 3 }">style='display: none;'</c:if> value="3">3회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 4}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 4 }">style='display: none;'</c:if> value="4">4회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 5}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 5 }">style='display: none;'</c:if> value="5">5회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 6}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 6 }">style='display: none;'</c:if> value="6">6회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 7}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 7 }">style='display: none;'</c:if> value="7">7회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 8}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 8 }">style='display: none;'</c:if> value="8">8회차</option>
									<option <c:if test="${!empty salesList && contractVO.collectTurn == 9}">selected</c:if> <c:if test="${turnNo !=0 && turnNo != 9 }">style='display: none;'</c:if> value="9">9회차</option>
								</select>
							</td>
						</tr>
					</table>
				</form>
				<form id="salesListForm" name="salesListForm">
					<table id="addRow">
							<c:forEach var="result" items="${salesList }" varStatus="status">
								<tr class='ftw200'>
									<td>
										${result.salesTurn }회차 :&nbsp;
										<input type='text' name='salesCollectRate' id='rate${result.salesTurn }' placeholder='${result.salesTurn }회차 비율' numberOnly class='rateInfo' value="${result.salesCollectRate }" required/>
										&nbsp;%&nbsp;&nbsp;&nbsp;
										<input type='text' name='salesTurnAmount' id='amount${result.salesTurn }' placeholder='${result.salesTurn }회차 금액' amountOnly class='amount' value="${displayUtil.commaStr(result.salesTurnAmount) }" required/>&nbsp;원
										<%-- <input type='hidden' name='ctKey' value="${result.ctKey }" id='ctKey${result.collectTurn }'/>  --%>
										<input type='hidden' name='salesKey' value="${result.salesKey }" id='salesKey${result.salesTurn }' />
										<!-- <input type='hidden' name='salesCtClass' value='P' /> -->
										<%-- <input type='hidden' class='salesChargeDt' name='salesChargeDt' value='${result.salesChargeDt }' /> --%>
										<%-- <input type='hidden' name='collectTurn' value='${result.collectTurn }' /> --%>
										<input type='hidden' name='salesTurn' value='${result.salesTurn }' />
										<%-- <input type='hidden' name='salesTurnAmount' id="sAmount${status.count }" value='${result.salesTurnAmount }' /> --%>
										<input type='hidden' name='isNew' value='N' />
										&nbsp;&nbsp;&nbsp;청구일자 :&nbsp;<input type="text" id="salesChargeDt${result.salesTurn }" class="calendar" name="salesChargeDt" placeholder="청구일" value="<c:out value="${displayUtil.displayDate(result.salesChargeDt)}"/>" required/>
									</td>
								</tr>
							</c:forEach>
					</table>
				</form>
			</div>
			<div class="btnWrap floatR">
				<div class="floatL btnPrev">
					<button type="button" onclick="fn_prevView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
				</div>
				<div class="floatL btnSave">
					<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
				</div>
				<div class="floatR">
					<button type="button" onclick="javascript:fn_next('guarantyInfo')"><img src="<c:url value='/images/btn_next.png'/>" /></button>
				</div>
				<div class="floatN floatC"></div>
			</div>
		</div>
		<%-- <form id="infoForm" name="infoForm">
			<c:choose>
				<c:when test="${resultList eq null || resultList eq '' || resultList eq 'null' || resultList eq '[]'}">
					<input type="hidden" id="selectKey" value="" />
				</c:when>
				<c:otherwise>
					<c:forEach var="result" items="${salesList}" varStatus="status">     
						<input type="hidden" id="selectKey${status.index }" name="selectKey" value="${result.saleKey }" />
						<c:if test="${status.last}">
							<c:set var="lastIndex" value="${status.last }" />
						</c:if>
					</c:forEach>
					<input type="hidden" id="selectKey${lastIndex }" name="selectKey" value="${contractVO.ctKey }" />
				</c:otherwise>
			</c:choose>
			<input type="hidden" id="pjKey" name="pjKey" value="${contractVO.pjKey }" /> 
		</form> --%>
	</div>
</body>
</html>