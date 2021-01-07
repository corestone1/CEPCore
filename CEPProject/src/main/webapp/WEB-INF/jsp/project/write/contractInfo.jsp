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
			background: url('./images/arrow_down.png') no-repeat 91% 50%;
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
			 $('input:checkbox[name="taxYn"]').each(function() {
			      if(this.checked) {
			            $(this).val('Y');
			      } else {
			    	  $(this).val('N');
			      }
			 });	
		});
		
		function fn_chkVali() {
			if ($("#infoForm")[0].checkValidity()){
	            if ($("#infoForm")[0].checkValidity()){
	               //필수값 모두 통과하여 저장 프로세스 호출.
	               fn_saveNext('biddingInfo');
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
			
			//alert(calcuTurn);
			if(calcuTurn>0) {
				for(i=0; i<calcuTurn; i++){
					var rowItem = "<tr class='ftw200'>";
					rowItem += "<td>"+(beforeTurn+i+1)+ "회차 :&nbsp;";
					rowItem += "<input type='text' name='ctTurnNo' id='rate"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 비율' numberOnly class='rateInfo'/>";
					rowItem += "&nbsp;%&nbsp;&nbsp;&nbsp;";
					rowItem += "<input type='text' name='ctAmount' id='amount"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 금액' numberOnly class='amount' />&nbsp;원</td>";
					rowItem += "</tr>"
					
					$('#addRow').append(rowItem);
				}
			} else {
				//alert("===>"+calcuTurn*-1)
				var deleteRow = document.getElementById("addRow").rows.length -turnVal.value;
				for(i=0; i<deleteRow; i++){
					document.getElementById("addRow").deleteRow(document.getElementById("addRow").rows.length-1);
				}
			}
			document.getElementById("beforeTurn").value= turnVal.value;
			
			$('input[id^=rate]').change(function(event) { 
				if($('#sum').val() == null || $('#sum').val() == "") {
					alert('총 계약금액을 입력해주세요.');
					$('#sum').focus();
					$(this).val('');
				} else {
					$('#amount'+$(this).attr('id').substring(4)).val($('#sum').val() * $(this).val() / 100);	
				}
			});
		}
		
		function fn_saveNext(link) {
			var object = {};
			var formData = $("#infoForm").serializeArray();
			var form = document.infoForm;
			
			for (var i = 0; i<formData.length; i++){
			    object[formData[i]['name']] = formData[i]['value'];
			    if("pjStartDt" == formData[i]['name'] || "pjEndDt" == formData[i]['name']) {
                	//날짜 - 제거
                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
                } else {
                	object[formData[i]['name']] = formData[i]['value'];
                }     
			 }
			
			var sendData = JSON.stringify(object);
			
			if($('#pjKey').val() != "" || $('#pjKey').val().length != 0) {
				var url = '/project/write/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
						"pjKey" : $('#pjKey').val()
				};
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px'); 
			} else {
				for(var i = 0; i < parseInt(document.getElementById("beforeTurn").value); i++) {
					$.ajax({
						url:"/project/insert/contractInfo.do",
					    dataType: 'json', 
					    type:"POST",  
					    data: {"pjKey":$('#pjKey').val(), "ctAmount":$('#amount'+(i+1)), "ctTurnNo":(i+1), "ctPayTerms":$('#ctPayTerms').val(), "taxYn":$('#taxYn').val()},
					 	contentType: "application/json; charset=UTF-8", 
						beforeSend: function(xhr) {
							xhr.setRequestHeader("AJAX", true);
							//xhr.setRequestHeader(header, token);
							
						},
					    success:function(response){	
					    	if(response!= null && response.successYN == 'Y') {
					    		var url = '/project/write/'+link+'.do';
								var dialogId = 'program_layer';
								var varParam = JSON.parse(JSON.stringify(response));
								var button = new Array;
								button = [];
								showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px'); 
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
		
		function fn_addBiddingView(){
			var url = '/project/write/biddingInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_preBaicView(){
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
			<input type="hidden" id="pjKey" value="<c:out value="${pjKey}"/>" />
			<div class="contents">
				<div>
					<table>
						<tr class="ftw200">
							<td class="firstRow">
								<input type="text" id="sum" name="sum" placeholder="총 계약금액"  numberOnly class="amount"/> &nbsp;원
								<label>(부가세포함 </label>
								<input type='checkbox' class='tCheck' id='taxYn' value='Y' name='taxYn'/><label for='pCheck' class='cursorP veralignM'></label>
								<label>)</label>
							</td>
						</tr>
						<tr class="ftw200">
							<td>
								<input type="text" id="ctPayTerms" name="ctPayTerms" placeholder="청구일로 부터" numberOnly /> &nbsp;이내
							</td>
						</tr>
						<tr class="ftw200">
							<td>
								<input type="hidden" id="beforeTurn" value="0">
								<select id="turnInfo" onchange="fn_turnChange()" placeholder="계약금액">
									<option value="0">지급회차</option>
									<option value="1">1회차</option>
									<option value="2">2회차</option>
									<option value="3">3회차</option>
									<option value="4">4회차</option>
									<option value="5">5회차</option>
									<option value="6">6회차</option>
									<option value="7">7회차</option>
									<option value="8">8회차</option>
									<option value="9">9회차</option>
								</select>
							</td>
						</tr>
						<tr>						 
							<table id="addRow">
								<!-- <tr>
									<td>1회차 <input type="text" id="rate0" placeholder="1회차 비율" class="rateInfo" />&nbsp;%&nbsp;&nbsp; <input type="text" id="amount0" placeholder="1회차 금액" />&nbsp;원</td>
								</tr> -->
							</table>
						</tr>
					</table>
				</div>
				<div class="btnWrap floatR">
					<div class="floatL btnPrev">
						<button type="button" onclick="fn_preBaicView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					</div>
					<div class="floatL btnSave">
						<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<div class="floatR">
						<button type="button" onclick="javascript:fn_next('contractInfo')"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>