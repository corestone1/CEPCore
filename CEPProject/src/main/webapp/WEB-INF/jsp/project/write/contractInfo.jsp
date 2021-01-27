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
		.popContainer .contents > div > table {
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
			$('#taxYn').on('click', function() {
				 if($('input[name=taxYnCheck]').is(":checked") == true) {
					 $('input[name=taxYn').val('Y');
				 } else {
					 $('input[name=taxYn').val('N');
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
								
							/* if(this.name=="mtPmQuantity" || this.name=="mtPmUprice" || this.name=="totalAmount"){
								//숫자에서 컴마를 제거한다.
								obj[this.name] = removeCommas(this.value); 
							} else  */
							if(this.name=="salesChargeDt") {
								//날짜에서 -를 제거한다.
								obj[this.name] =  removeData(this.value,"-"); 
							} else {
								obj[this.name] = this.value; 
							}
							
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('taxYn' == this.name){
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
			if ($("#infoForm")[0].checkValidity()){
	            if ($("#infoForm")[0].checkValidity()){
	               //필수값 모두 통과하여 저장 프로세스 호출.
	               fn_save();
	            } else {
	                $("#infoForm")[0].reportValidity();   
	            }            
	            
	         }  else {
	             //Validate Form
	              $("#infoForm")[0].reportValidity();   
	         }
		}
		
		function fn_turnChange(){
			var turnVal = document.getElementById("turnInfo");
			var beforeTurn = parseInt(document.getElementById("beforeTurn").value);
			
			var calcuTurn = turnVal.value - beforeTurn;
			
			if(calcuTurn>0) {
				for(i=0; i<calcuTurn; i++){
					var rowItem = "<tr class='ftw200'>";
					rowItem += "<td><form id='form"+i+"' name='form' display: block !important'>"+(beforeTurn+i+1)+ "회차 :&nbsp;&nbsp;";
					rowItem += "<input type='text' name='salesCollectRate' id='rate"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 비율' numberOnly class='rateInfo' required/>";
					rowItem += "&nbsp;&nbsp;%&nbsp;&nbsp;&nbsp;&nbsp;";
					rowItem += "<input type='text' name='ctAmount' id='amount"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 금액' numberOnly class='amount' required />&nbsp;원";
					rowItem += "<input type='hidden' name='pjKey' value='"+$('#pjKey').val() +"' />";
					rowItem += "<input type='hidden' name='salesCtClass' value='P' />";
					rowItem += "<input type='hidden' class='salesChargeDt' name='salesChargeDt' value='"+$('#salesChargeDt').val() +"' />";
					rowItem += "<input type='hidden' name='ctTurnNo' value='"+(i+1)+"' />";
					rowItem += "<input type='hidden' name='salesTurn' value='"+(i+1)+"' />";
					rowItem += "<input type='hidden' name='salesTurnAmount' id='sAmount"+(beforeTurn+i+1)+"' value='' />";
					rowItem += "<input type='hidden' name='taxYn' value='N' /></form></td>";
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
					$('#amount'+$(this).attr('id').substring(4)).val($('#sum').val() * $(this).val() / 100);	
				}
			});
		}
		
		var countSave = 0;
		var ctKeyList = [];
		var salesKeyList = [];
		var successYn = 'N';
		
		function fn_save() {
			var sum = 0;
			
			for(var i = 0; i < parseInt(document.getElementById("beforeTurn").value); i++) {
				sum += parseInt($('#amount'+(i+1)).val());
			}
			
			if(sum != $('#sum').val()) {
				alert('회차별 금액 합계와 총 계약 금액이 일치하지 않습니다.');
			} else {
				var object = {};
				
				$('.salesChargeDt').each(function() {
					$(this).val($('#salesChargeDt').val());	
				});
				
				for(var i = 1; i <= $('#beforeTurn').val(); i++) {
					$('#sAmount'+i).val($('#amount'+i).val());
				}
				
				var formData = $("#basicForm").serializeArray();
				var listData = $("form[name=form]").serializeObject();
				
			 	for (var i = 0; i<formData.length; i++){
	                object[formData[i]['name']] = formData[i]['value'];
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
				    		$('#newKey').val(response.pjKey);
				    		countSave++; 
				    		for(var i = 0; i < response.ctKey.length; i++) {
				    			ctKeyList.push(response.ctKey[i]);
				    		} 
				    		salesKeyList.push(response.saleKey);
				    		
				    		alert('저장되었습니다.');
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
						"pjKey": $("#newKey").val(),
						"turnNo": $("#beforeTurn").val(),
						"ctKey": ctKeyList,
						"salesKey": salesKeyList
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px');
			}
			else {
				if($('#pjKey').val() != "" || $('#pjKey').val().length != 0) {
					var ctKey = [];
					var salesKey = [];
					for(var i = 1; i <= $('#beforeTurn').val(); i++) {
						ctKey.push($('#ctKey'+i).val());
						salesKey.push($('#salesKey'+i).val());
					}

					var url = '/project/write/'+link+'.do';
					var dialogId = 'program_layer';
					var varParam = {
							"pjKey": $("#pjKey").val(),
							"turnNo": $("#beforeTurn").val(),
							"ctKey":ctKey,
							"salesKey":salesKey
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
			var url = '/project/write/basicInfo.do';
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
		<form:form commandName="infoForm" id="infoForm" name="infoForm" method="post">
			<input type="hidden" id="newKey" name="newKey" value="" />
			<c:set var = "total" value = "0" />
			<c:set var = "max" value = "0" />
			<c:forEach var="result" items="${resultList}" varStatus="status">     
				<c:set var= "total" value="${total + result.ctAmount}"/>
				<c:if test="${max < result.ctTurnNo }">
					<c:set var="max" value="${result.ctTurnNo }" />
				</c:if>
			</c:forEach>
			<div class="contents">
				<div>
					<table>
						<tr class="ftw200">
							<td class="firstRow">
								<input type="text" id="sum" name="sum" placeholder="총 계약금액"  numberOnly class="amount" value="<c:out value="${total }"/> "/> &nbsp;원
								<label>(부가세포함 </label>
								<input type='checkbox' class='tCheck' id='taxYn' value='N' name='taxYnCheck' <c:if test="${resultList[0].taxYn eq 'Y'}">checked="checked"</c:if>/><label for='taxYn' class='cursorP veralignM'></label>
								<label>)</label>
							</td>
						</tr>
						<tr class="ftw200">
							<td>
								<input type="text" id="salesChargeDt" class="calendar" name="salesChargeDt" placeholder="청구일" value="<c:out value="${displayUtil.displayDate(resultList[0].salesChargeDt)}"/>" required/> 
							</td>
						</tr>
						<tr class="ftw200">
							<td>
								<input type="hidden" id="beforeTurn" value="${max eq null ? 0 : max }">
								<select id="turnInfo" onchange="fn_turnChange()" placeholder="계약금액">
									<option value="0">지급회차</option>
									<option <c:if test="${!empty resultList && max == 1}">selected</c:if> value="1">1회차</option>
									<option <c:if test="${!empty resultList && max == 2}">selected</c:if> value="2">2회차</option>
									<option <c:if test="${!empty resultList && max == 3}">selected</c:if> value="3">3회차</option>
									<option <c:if test="${!empty resultList && max == 4}">selected</c:if> value="4">4회차</option>
									<option <c:if test="${!empty resultList && max == 5}">selected</c:if> value="5">5회차</option>
									<option <c:if test="${!empty resultList && max == 6}">selected</c:if> value="6">6회차</option>
									<option <c:if test="${!empty resultList && max == 7}">selected</c:if> value="7">7회차</option>
									<option <c:if test="${!empty resultList && max == 8}">selected</c:if> value="8">8회차</option>
									<option <c:if test="${!empty resultList && max == 9}">selected</c:if> value="9">9회차</option>
								</select>
							</td>
						</tr>
					</table>
					<table id="addRow">
						<c:choose>
							<c:when test="${ !empty resultList }">
								<c:forEach var="result" items="${resultList }" varStatus="status">
									<tr class='ftw200'>
										<td>
											${result.ctTurnNo }회차 :&nbsp;
											<fmt:formatNumber  var="rateValue" value="${result.ctAmount / total * 100 }" type="number" />
											<input type='text' name='ctTurnNo' id='rate${result.ctTurnNo }' placeholder='${result.ctTurnNo }회차 비율' numberOnly class='rateInfo' value="${rateValue }"/>
											&nbsp;%&nbsp;&nbsp;&nbsp;
											<input type='text' name='ctAmount' id='amount${result.ctTurnNo }' placeholder='${result.ctTurnNo }회차 금액' numberOnly class='amount' value="${result.ctAmount }"/>&nbsp;원
											<input type='hidden' name='ctKey' value="${result.ctKey }" id='ctKey${result.ctTurnNo }'/>
											<input type='hidden' name='salesKey' value="${result.salesKey }" id='salesKey${result.salesTurn }' />
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose> 
					</table>
				</div>
				<div class="btnWrap floatR">
					<div class="floatL btnPrev">
						<button type="button" onclick="fn_prevView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					</div>
					<div class="floatL btnSave">
						<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<div class="floatR">
						<button type="button" onclick="javascript:fn_next('biddingInfo')"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</form:form>
		<form id="basicForm">
			<input type="hidden" name="pjKey" id="pjKey" value="<c:out value="${pjKey}"/>" />
			<input type="hidden" name="statusCd" value="PJST2000" />
		</form>
	</div>
</body>
</html>