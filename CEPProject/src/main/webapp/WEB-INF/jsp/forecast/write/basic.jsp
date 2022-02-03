<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		.popContainer .left ul li:hover,
		.popContainer .left ul li.on {
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
		.popContainer .contents > div:first-child {
		    min-height: 519px;
		}
		.popContainer .contents > div {
		    width: calc(100% - 80px);
    		margin: 10px 40px 15px 40px;
		}
		.popContainer .contents > div > table {
			width: 100%;
			border-collapse: separate;
	  		border-spacing: 0 3px;
		}
		.popContainer .contents td.tdTitle {
		    margin-top: 11px;
		    font-size: 14px;
		    color: #000;
		    padding-right: 20px;
		    width: 16%;
		    font-weight: 200;
		}
		.popContainer .contents td.tdTitle label {
		    color: red;
		    vertical-align: middle;
		}
		.popContainer .contents td.tdContents {
		    width: 87%;
		    font-size: 14px;
	        padding-bottom: 4px;
		}
		.popContainer .contents select {
			width: 200px;
			height: 40px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.popContainer .contents select.wdts {
			width: 135px;
		}
		.popContainer .contents input {
			width: calc(100% - 20px);
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="search"] {
			width: 177px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 179px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
		    width: calc(100% - 20px);
		    height: 113px;
		    border: 1px solid #e9e9e9;
		    padding: 0 10px;
		    background-color: #fff;
		    font-size: 14px;
		    margin-bottom: 0px;
		    resize: none;
		}
		#m_div_accountList {
			left: 178px;
    		margin-top: 38px;
		}
		.help {
			vertical-align: middle;
		    line-height: 1;
		    cursor: pointer;
		}
      	.help[data-tooltip-text]:hover {
			position: relative;
		}
		.help[data-tooltip-text]:hover:after {
			background-color: #000000;
			background-color: rgba(0, 0, 0, 0.8);
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			color: #FFFFFF;
			font-size: 13px;
			font-weight: 200;
			content: attr(data-tooltip-text);
		  	margin-bottom: 10px;
			top: 91%;
			left: -2px;    
			padding: 7px 12px;
			position: absolute;
			width: auto;
			min-width: 150px;
			max-width: 300px;
			word-wrap: break-word;
			z-index: 9999;
		}
		.move {
			display: inline-block;
		}
		.move:hover .moveSpan {
			 visibility: visible;
		}
		.move .moveSpan {
		    visibility: hidden;
		    width: 230px;
		    height: 42px;
		    background-color: #404040;
		    color: #ffffff;
		    text-align: center;
		    border-radius: 6px;
		    padding: 5px 0;
		    position: absolute;
		    z-index: 9999;
		    bottom: 57px;
		    right: 15px;
		    font-size: 14px;
		}
		.move .moveSpan::after {
		    content: "";
		    position: absolute;
		    top: 100%;
		    left: 82%;
		    margin-left: -5px;
		    border-width: 5px;
		    border-style: solid;
		    border-color: #404040 transparent transparent transparent;
		}
		
		
	</style>
	
	
	<script>
	
		$(document).ready(function(){
		
			//alert('ready : ${spKey}');
			
			
			
			$("#m_ipt_acMfAcNm").on("keyup", function(event){
				
				/* if(event.keyCode == 13)
				{ */
					fnSearchAccoutList(this, $(this).val());					
				/* } */
					
			}); 
			
			
			/* if("${spKey}" != undefined && "${spKey}" != null && "${spKey}".length == 8)
			{
				//alert("spBusiNm : ${forecast.spBusiNm}");
				$('#m_ipt_spKey').val("${spKey}");
				
				$('#m_ipt_acMfAcNm').val('${forecast.mfAcNm}');
				$('#m_ipt_acMfAcKey').val('${forecast.acKey}');
				$('#m_ipt_spBusiNm').val('${forecast.spBusiNm}');
				
				$('#m_slt_pmKey').val('${forecast.pmKey}');
				$('#m_ipt_pmDetail').val('${forecast.pmDetail}');
				
				$('#m_slt_salesCtClass').val('${forecast.salesCtClass}');
				$('#m_slt_spState').val('${forecast.spState}');
				$('#m_slt_fcSjConfQt').val('${forecast.fcSjConfQt}');
				
				
			}	 */
			
			if($("#m_slt_salesCtClass").val() == "M") {
				$("#fromto").css("display", "table-row");
				$("#fromto input").attr("disabled", false);
			} else {
				$("#fromto").css("display", "none");
				$("#fromto input").attr("disabled", true);
			}
			
			$("#m_slt_salesCtClass").on("change", function(event){
				if($(this).val() == "M") {
					$("#fromto").css("display", "table-row");
					$("#fromto input").attr("disabled", false);
				} else {
					$("#fromto").css("display", "none");
					$("#fromto input").attr("disabled", true);
				}
			});
			
			if($('#m_ipt_spKey').val().replace(" ", "").length != 0) {
				$('.btnSave').children().eq(0).html('');
				$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />'); 
			}
			
			if("Y" == "${forecast.bdYn}"){
				$('#bidding_menu').show();
			} else {
				$('#bidding_menu').hide();
			}		
		});
		
		function fnSearchAccoutList(pObject, pstAccountNm)
		{
			$('#m_div_accountList').remove();
		
			var jsonData = {'acNm' : pstAccountNm };
			
			 $.ajax({
		        	url :"/mngCommon/account/searchList.do",
		        	type:"POST",  
		            data: jsonData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		//alert(data.accountList[0].acNm);
		        		//선택 목록 생성
		        		fnViewAccountList(pObject, data.accountList);
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    }); 
		};
		
		
		function fnViewAccountList(pObject, pjAccountList){
			
			var html = '<div id="m_div_accountList">'
			         + '<ul class="accountList">'
			       ;
			       
	        for(var i=0; i < pjAccountList.length; i++)
	    	{
	    	   html += '<li id="m_li_account" title="'+ pjAccountList[i].acKey +'">' + pjAccountList[i].acNm + '</li>'
	    	        ;
	    	} 
			       
			       
			html +=  '</ul>'
			     + '</div>'
			     ;//+ '</div>';
			//$('#m_td_account').after(html);
			$('#m_tr_account').after(html);
			
			$("[id^='m_li_account']").click(function(event)
			{
				//alert(this.innerText);
				
				$('#m_ipt_acMfAcKey').val(this.title); 
				$('#m_ipt_acMfAcNm').val(this.innerText);
				
				$('#m_div_accountList').remove();
			});
			
		};
		
		function fn_chkVali() {
			if ($("#m_fr_forecastBasic")[0].checkValidity()){
	            if ($("#m_fr_forecastBasic")[0].checkValidity()){
	               //필수값 모두 통과하여 저장 프로세스 호출.
	               fn_writeBasic();
	            } else {
	                $("#m_fr_forecastBasic")[0].reportValidity();   
	            }            
	            
	         }  else {
	             //Validate Form
	              $("#m_fr_forecastBasic")[0].reportValidity();   
	         }
		}
		
		function fn_writeBasic() {
			
			if($("#m_ipt_acMfAcKey").val().length == 0) {
				alert("고객사는 기존에 등록된 정보 내에서만 선택이 가능합니다.");
				$("#m_ipt_acMfAcNm").focus();
			} else {
				
				var object = {};
				var formData = $("#m_fr_forecastBasic").serializeArray();
				
				for (var i = 0; i<formData.length; i++){
				    if("spStartDt" == formData[i]['name'] || "spEndDt" == formData[i]['name']) {
	                	//날짜 - 제거
	                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
	                } else {
	                	object[formData[i]['name']] = formData[i]['value'];
	                }
				 }
				
				
				var sendData = JSON.stringify(object);
				
				$.ajax({
			    	url :"/forecast/write/writeBasic.do",
			       	type:"POST",  
			        data: sendData,
			        contentType: "application/json; charset=UTF-8", 
			        dataType: 'json',
			    	success:function(data){		  
			    		if($('#m_ipt_spKey').val().replace(" ", "").length == 0) {
			    			$('#m_ipt_spKey').val(data.spKey);
			    			// fn_addAlarm(sendData);
			    			alert("Forecast 기본 정보가 저장되었습니다.");
			    		} else {
			    			alert("Forecast 기본 정보가 수정되었습니다.");	
			    		}
			           	fnMoveTab('basic');
			        } ,error: function(request, status, error) {
			        	if(request.status != '0') {
			        		alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        	}
			        } 
			    }); 
			}
		};
		
		function fn_bdYnClick(param) {
			if("Y" == param){
				$('#bidding_menu').show();
			} else {
				$('#bidding_menu').hide();
			}
		}
		
	
		// 페이지 이동
		var fnMoveTab = function(pstTabName){
		/* if(pstTabName == 'fundInfo') {
			if($("#m_ipt_spKey").val().length == 0) {
				alert("저장을 해주세요.");
			} else {
				fn_addView(pstTabName, $('#m_ipt_spKey').val());
			}
		} else if(pstTabName == 'progress') {
			if($("#m_ipt_spKey").val().length == 0) {
				alert("저장을 해주세요.");
			} else if($("#salesList").val().replace("[","").replace("]","").length == 0 &&
					$("#pcList").val().replace("[","").replace("]","").length == 0) {
				alert("매출/입 정보가 등록되지 않았습니다.\n매출/입 정보를 먼저 등록하세요.");
			} else {
				fn_addView(pstTabName, $('#m_ipt_spKey').val());
			}
		} else if(pstTabName == 'biddingInfo') {
			if($("#m_ipt_spKey").val().length == 0) {
				alert("저장을 해주세요.");
			} else if($("#salesList").val().replace("[","").replace("]","").length == 0 &&
					$("#pcList").val().replace("[","").replace("]","").length == 0) {
				alert("매출/입 정보가 등록되지 않았습니다.\n매출/입 정보를 먼저 등록하세요.");
			} else if($("#pmDetail2").length == 0 && $("#remark").length == 0) {
				alert("제품 및 진행사항 정보가 등록되지 않았습니다.\n제품 및 진행사항 정보를 먼저 등록하세요.");
			} else {
				fn_addView(pstTabName, $('#m_ipt_spKey').val());
			} 
		} else {
			fn_addView(pstTabName, $('#m_ipt_spKey').val());
		} */
		
		if($("#m_ipt_spKey").val().length == 0) {
			alert("기본 정보는 필수 입력입니다. 저장을 해주세요.");
		} else {
			fn_addView(pstTabName, $('#m_ipt_spKey').val());
		}
	};
	
	</script>
</head>
<body>
	<form:form commandNmae="forecastVO" id="m_fr_forecastBasic" name="forecastBasic" method="post">
		<input type="hidden" id="workClass" name="workClass" value="입찰_첨부파일"/>
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">Forecast 등록</div>
				</div>
			</div>
			<div class="left">
				<ul class="ftw400">
					<li class="colorWhite cursorP on">기본 정보</li>
					<li class="colorWhite cursorP" onclick="javascript:fnMoveTab('fundInfo')">매출/입 정보</li>
					<li class="colorWhite cursorP" onclick="javascript:fnMoveTab('progress')">제품 및 진행사항</li>
					<li class="colorWhite cursorP" id="bidding_menu" onclick="javascript:fnMoveTab('biddingInfo')" style="display:none">입찰 정보</li>
				</ul>
			</div>
			
			<div class="contents">
				<div>
					<!-- Forecast Key -->
					<input type="hidden" name="spKey" id="m_ipt_spKey" value="${spKey }"/>
					<input type="hidden" id="salesList" value="${salesList}" name="salesList" />
					<input type="hidden" id="pcList" value="${pcList}" name="pcList" />
					<input type="hidden" id="pmDetail2" value="${forecast.pmDetail2 }" />
					<input type="hidden" id="remark" value="${forecast.remark }" />
					<table>
						<tr>
							<td class="tdTitle"><label>*</label>구분/진행단계&nbsp;<span class="help" data-tooltip-text="A: 30% 미만/ B: 30%~80%미만 / C: 80%~ 100% 미만 / D: 수주 이후 계약 미체결 or 미발주 / 계약: 수주 이후 계약 체결"><img src="/images/icon_help.png"></span></td>
							<td class="tdContents">
								<select name="salesCtClass" id="m_slt_salesCtClass">
									<option value="P" <c:if test="${forecast.salesCtClass eq 'P'}">selected</c:if>>상품/서비스</option>
									<option value="M" <c:if test="${forecast.salesCtClass eq 'M'}">selected</c:if>>유지보수</option>
								</select>
								<select name="spState" id="m_slt_spState" class="wdts">
									<option value="A" <c:if test="${forecast.spState eq 'A'}">selected</c:if>>A</option>
									<option value="B" <c:if test="${forecast.spState eq 'B'}">selected</c:if>>B</option>
									<option value="C" <c:if test="${forecast.spState eq 'C'}">selected</c:if>>C</option>
									<option value="D" <c:if test="${forecast.spState eq 'D'}">selected</c:if>>D</option>
									<option value="Z" <c:if test="${forecast.spState eq 'Z'}">selected</c:if>>계약</option>
									<option value="F" <c:if test="${forecast.spState eq 'F'}">selected</c:if>>실주</option>
								</select>
							</td>
						</tr>
						<tr>	
							<td class="tdTitle"><label>*</label>사업명</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_spBusiNm" name="spBusiNm" placeholder="사업명" value="${forecast.spBusiNm}" required/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>고객사</td>						
							<td class="tdContents" id="m_tr_account">
								<!-- <input type="hidden" name="acKey" /> -->
								<input type="text"   id="m_ipt_acMfAcNm"  name="acNm"  placeholder="고객사" class="search" autocomplete="off" value="${forecast.mfAcNm}" required />
								<input type="hidden" id="m_ipt_acMfAcKey" name="acKey" value="${forecast.acKey}"/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>제품구분</td>
							<td class="tdContents">
								<select name="pmKey" id="m_slt_pmKey">
									<option value="ST" <c:if test="${forecast.pmKey eq 'ST'}">selected</c:if>>Storage</option>
									<option value="SV" <c:if test="${forecast.pmKey eq 'SV'}">selected</c:if>>Server</option>
									<option value="BK" <c:if test="${forecast.pmKey eq 'BK'}">selected</c:if>>Backup</option>
									<option value="SW" <c:if test="${forecast.pmKey eq 'SW'}">selected</c:if>>S/W</option>
									<option value="ET" <c:if test="${forecast.pmKey eq 'ET'}">selected</c:if>>기타</option>
								</select>
							</td>
						</tr>
						<%-- <tr>
							<td class="tdTitle"><label>*</label>수주확정Q</td>
							<td class="tdContents">
								<select name="fcSjConfQt" id="m_slt_fcSjConfQt">
									<option value="1" <c:if test="${forecast.fcSjConfQt eq '1'}">selected</c:if>>1분기</option>
									<option value="2" <c:if test="${forecast.fcSjConfQt eq '2'}">selected</c:if>>2분기</option>
									<option value="3" <c:if test="${forecast.fcSjConfQt eq '3'}">selected</c:if>>3분기</option>
									<option value="4" <c:if test="${forecast.fcSjConfQt eq '4'}">selected</c:if>>4분기</option>
								</select>
							</td>
						</tr>  --%>
						<tr>
							<td class="tdTitle"><label>*</label>입찰</td>
							<td class="tdContents">
								<input type="radio" class="tRadio" id="bdYnCheck1" name="bdYn" value="Y" <c:if test="${forecast.bdYn eq 'Y'}">checked="checked"</c:if> onclick="fn_bdYnClick('Y')" />
								<label for="bdYnCheck1" class="cursorP"></label>&nbsp;&nbsp;&nbsp;Y&nbsp;&nbsp;&nbsp;
								<input type="radio" class="tRadio" id="bdYnCheck2" name="bdYn" value="N" <c:if test="${forecast.bdYn eq 'N'}">checked="checked"</c:if> <c:if test="${forecast.bdYn eq null}">checked="checked"</c:if>onclick="fn_bdYnClick('N')" />
								<label for="bdYnCheck2" class="cursorP"></label>&nbsp;&nbsp;&nbsp;N
							</td>
						</tr>
						<tr id="fromto">
							<td class="tdTitle"><label>*</label>기간</td>
							<td class="tdContents">
								<input type="text" placeholder="From" class="calendar fromDt" name="spStartDt" value="<c:out value="${displayUtil.displayDate(forecast.spStartDt)}"/>" required /> 
								<img class="veralignM" src="/images/icon_fromTo.png" />
								<input type="text" placeholder="To" class="calendar toDt" name="spEndDt" value="<c:out value="${displayUtil.displayDate(forecast.spEndDt)}"/>" required />
							</td>
						</tr>
						<tr>
							<td class="tdTitle">제품설명</td>
							<td class="tdContents">
								<textarea id="m_ipt_pmDetail" name="pmDetail"><c:out value="${forecast.pmDetail}" /></textarea>
							</td>
						</tr>
						<!-- 
						<tr>
							<td>
								<select>
									<option value="">사업진행단계</option>
								</select>
							</td>
						</tr>
						 -->
					</table>
				</div>
				<div class="btnWrap floatL">
					<!-- Left -->
					<div class="floatL btnPrev">
						&nbsp;
					</div>
					<!-- middle -->
					<c:set var="systemName" value='<%=session.getAttribute("name") %>'/>
					<c:set var="mngName" value="${forecast.empNm }" />
					<c:choose>
						<c:when test="${spKey eq null}">
							<div class="floatL btnSave">
								<button type="button" class="move" onclick="javascript:fn_chkVali()" data-tooltip-text="저장/수정하지 않은 정보는 반영되지 않습니다."><img src="<c:url value='/images/btn_save.png'/>" /></button>	
							</div>
						</c:when>
						<c:otherwise>
							<c:if test="${systemName eq mngName }">
								<div class="floatL btnSave">
									<button type="button" class="move" onclick="javascript:fn_chkVali()" data-tooltip-text="저장/수정하지 않은 정보는 반영되지 않습니다."><img src="<c:url value='/images/btn_save.png'/>" /></button>	
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>
					<!-- right -->
					<div class="floatR">
						<button type="button" class="move" onclick="javascript:fnMoveTab('fundInfo');"><img src="<c:url value='/images/btn_next.png'/>" />
							<span class="moveSpan">저장/수정하지 않은 정보는 반영되지 않습니다.</span>
						</button>
					</div>	
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>