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
			width: 178px;
			height: 388px;
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
			width: 100%;
			height: 388px;
			top: 107px;
			right: 0;
			z-index: 3;
		}
		.popContainer .contents > div {
			margin: 30px 0 0 244px;
			width: calc(100% - 244px);
		}
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
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
			width: 420px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="search"] {
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents .btnWrap {
			margin-top: 25px;
		}
		
		
		.btnCenter {
			width : calc(100% - 210px);
			text-align: center;
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
			
			
			if("${spKey}" != undefined && "${spKey}" != null && "${spKey}".length == 8)
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
				
			}	
		});
		
		function fnSearchAccoutList(pObject, pstAccountNm)
		{
			$('#m_div_accountList').remove();
		
			var jsonData = {'acNm' : pstAccountNm, 'acBuyYN' : 'Y'};
			
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
				//필수값 모두 통과하여 저장 프로세스 호출.
				if($("#m_ipt_acMfAcKey").val() == null || $("#m_ipt_acMfAcKey").val().length == 0) {
					alert("고객사를 선택해주세요.")
				} else {
					fn_writeBasic();	
				}
			} else {
				// Validate Form
				$("#m_fr_forecastBasic")[0].reportValidity();   
			}
		}
		
		function fn_writeBasic(){
			
			//입력값 정합성 Check
			//alert("fn_writeBasic");
			var ljsParam =  $("#m_fr_forecastBasic").serializeArray();
			
			//alert(ljsParam[3].value);
			//console.log(ljsParam);
			//return;
			
			$.ajax({
		    	url :"/forecast/write/writeBasic.do",
		       	type:"POST",  
		        data: ljsParam,
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        dataType: 'json',
		        async : false,
		    	success:function(data){		  
		           	alert("저장되었습니다.! [" + data.spKey + "]");
		           	$('#m_ipt_spKey').val(data.spKey);
		        } ,error: function(request, status, error) {
		        	if(request.status != '0') {
		        		alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        	}
		        } 
		    }); 
		};
		
	/*
		function fn_addView(link){
			
			alert(2);
			
			if(link == "forecastList") {
				location.href="<c:url value='/forecast/list.do'/>";
			} else {
				var url = '/forecast/write/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
		
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:495px'); 
			}
		}
	*/
	
	var fnMoveTab = function(pstTabName){
		fn_addView(pstTabName, $('#m_ipt_spKey').val());
	};
	
	</script>
</head>
<body>
	<form:form commandNmae="forecastVO" id="m_fr_forecastBasic" name="forecastBasic" method="post">
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">Forecast 등록</div>
				</div>
			</div>
			<div class="left">
				<ul class="ftw300">
					<li class="colorWhite cursorP on">기본 정보</li>
					<li class="colorWhite cursorP" onclick="javascript:fnMoveTab('fundInfo')">매출/입 정보</li>
					<li class="colorWhite cursorP" onclick="javascript:fnMoveTab('progress')">제품 및 진행사항</li>
				</ul>
			</div>
			
			<div class="contents">
				<div>
					<!-- Forecast Key -->
					<input type="hidden" name="spKey" id="m_ipt_spKey"/>
					<table>
						<tr>
							<td>
								<select name="salesCtClass" id="m_slt_salesCtClass" required>
									<option value="">구분</option>
									<option value="P">프로젝트</option>
									<option value="M">유지보수</option>
								</select>
								<select name="spState" id="m_slt_spState" class="wdts" required>
									<option value="">사업진행단계</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>
							</td>
						</tr>
						<tr id="m_tr_account">
							<td>
								<!-- <input type="hidden" name="acKey" /> -->
								<input type="text"   id="m_ipt_acMfAcNm"  name="acNm"  placeholder="고객사" class="search" autocomplete="off" required />
								<input type="hidden" id="m_ipt_acMfAcKey" name="acKey" />
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="m_ipt_spBusiNm" name="spBusiNm" placeholder="사업명" required/>
							</td>
						</tr>
						<tr>
							<td>
								<select name="pmKey" id="m_slt_pmKey">
									<option value="">제품구분</option>
									<option value="ST">Storage</option>
									<option value="SV">Server</option>
									<option value="BK">Backup</option>
									<option value="SW">S/W</option>
									<option value="ET">기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><input type="text" id="m_ipt_pmDetail" name="pmDetail" placeholder="제품설명" /></td>
						</tr>
						<tr>
							<td>
								<select name="fcSjConfQt" id="m_slt_fcSjConfQt" class="wdts">
									<option>수주확정Q</option>
									<option value="1">1분기</option>
									<option value="2">2분기</option>
									<option value="3">3분기</option>
									<option value="4">4분기</option>
								</select>
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
				<!-- 
				<div class="btnWrap">
					<button type="button"><img src="<c:url value='/images/btn_blank.png'/>" /></button>
					<button type="button" onclick="javascript:fn_writeBasic()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					<button type="button" onclick="javascript:fnMoveTab('progress');"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					
				</div>
				 -->
				<div class="floatL">
					<!-- Left -->
					<div class="floatL" style="width: 91px;">
						&nbsp;
					</div>
					
					<!-- middle -->
					<div class="floatL btnCenter">
						<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>	
					</div>
					
					<!-- right -->
					<div class="floatR"  style="margin-right: 22px;">
						<button type="button" onclick="javascript:fnMoveTab('fundInfo');"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div>	
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>