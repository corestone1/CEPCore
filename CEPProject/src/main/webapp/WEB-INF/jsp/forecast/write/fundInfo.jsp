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
			background: url('./images/arrow_down.png') no-repeat 91% 50%;
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
			background-image: url('./images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents td span {
			display: inline-block;
			width: 165px;
			font-weight: 300;
		}
		.popContainer .contents .btnWrap {
			margin-top: 25px;
		}
	</style>
	<script>
	
	$(document).ready(function(){
		//alert("fundInfo : spKey : ${spKey}");
		$('#m_ipt_spKey').val("${spKey}");
		
		
		if("${spKey}" != undefined && "${spKey}" != null && "${spKey}".length == 8)
		{
			//alert("spBusiNm : ${forecast.spBusiNm}, ${forecast.fcSalesDtYr}");
			$('#m_ipt_spKey').val("${spKey}");
			
			if("${forecast.fcSalesDtYr}" != undefined && "${forecast.fcSalesDtYr}" != null && "${forecast.fcSalesDtYr}".length == 4)
			{
				$('#m_ipt_fcSalesAmount').val('${forecast.fcSalesAmount}');
				$('#m_ipt_fcBuyAmount').val('${forecast.fcBuyAmount}');
				
				$('#m_ipt_buyAcKey').val('${forecast.buyAcKey}');
				
				$('#m_slt_fcSalesDtYr').val('${forecast.fcSalesDtYr}');
				$('#m_slt_fcSalesDtMt').val('${forecast.fcSalesDtMt}');
				
				$('#m_slt_fcBuyPayDtYr').val('${forecast.fcBuyPayDtYr}');
				$('#m_slt_fcBuyPayDtMt').val('${forecast.fcBuyPayDtMt}');	
			}		
		}
		
		/* $('#m_ipt_fcSalesAmount').on('Change', function(event){
			alert('change');
		}); */
	});
	
	var fnWriteFundInfo = function(){
		
		//alert("fnWriteFundInfo");
		var ljsParam =  $("#m_fr_forecastFundInfo").serializeArray();
		
		//alert(ljsParam[3].value);
		//console.log(ljsParam);
		//return;
		
		$.ajax({
	    	url :"/forecast/write/writeFundInfo.do"
	       	,
	       	type:"POST"
	       	,  
	        data: ljsParam
	        ,
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8"
	        ,
	        dataType: 'json'
	        ,
	        async : false
	        ,
	    	success:function(data){		  
	           	alert("저장되었습니다.! [" + data.spKey + "]");
	        }
	       	,
	        error: function(request, status, error) {
	        	if(request.status != '0') {
	        		alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        	}
	        } 
	    }); 
	};
	
	/*
		function fn_addView(link){
			
			alert(3);
			
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
<form:form commandNmae="forecastVO" id="m_fr_forecastFundInfo" name="forecastFundInfo" method="post">
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">Forecast 등록</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw300">
				<li class="colorWhite cursorP" onclick="javascript:fnMoveTab('basic')">기본 정보</li>
				<li class="colorWhite cursorP on">매출/입 정보</li>
				<li class="colorWhite cursorP" onclick="javascript:fnMoveTab('progress')">제품 및 진행사항</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<!-- Forecast Key -->
				<input type="hidden" name="spKey" id="m_ipt_spKey"/>
				<table>
					<tr>
						<td><input type="text" name="fcSalesAmount" id="m_ipt_fcSalesAmount" placeholder="매출액" /></td>
					</tr>
					<tr>
						<td><input type="text" name="fcBuyAmount"  id="m_ipt_fcBuyAmount" placeholder="매입액" /></td>
					</tr>
					<tr>
						<td>
							<span>매출일정</span>
							<select id="m_slt_fcSalesDtYear" name="fcSalesDtYr" class="wdts">
									<option value="2021">2021년</option>
									<option value="2022">2022년</option>
							</select>
							<select id="m_slt_fcSalesDtMt" name="fcSalesDtMt" class="wdts">
								<option value="01"> 1월</option>
								<option value="02"> 2월</option>
								<option value="03"> 3월</option>
								<option value="04"> 4월</option>
								<option value="05"> 5월</option>
								<option value="06"> 6월</option>
								<option value="07"> 7월</option>
								<option value="08"> 8월</option>
								<option value="09"> 9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<span>수금일정</span>
							<select id="m_slt_fcCollectDtYr" name="fcCollectDtYr" class="wdts">
									<option value="2021">2021년</option>
									<option value="2022">2022년</option>
							</select>
							<select id="m_slt_fcCollectDtMt" name="fcCollectDtMt" class="wdts">
								<option value="01"> 1월</option>
								<option value="02"> 2월</option>
								<option value="03"> 3월</option>
								<option value="04"> 4월</option>
								<option value="05"> 5월</option>
								<option value="06"> 6월</option>
								<option value="07"> 7월</option>
								<option value="08"> 8월</option>
								<option value="09"> 9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><input type="text" name="buyAcKey" id="m_ipt_buyAcKey" placeholder="매입처" class="search" /></td>
					</tr>
					<!-- 
					<tr>
						<td>
							<span>매입일정</span>
							<select class="wdts">
									<option value="2021">2021년</option>
									<option value="2022">2022년</option>
							</select>
							<select class="wdts">
								<option value="01"> 1월</option>
								<option value="02"> 2월</option>
								<option value="03"> 3월</option>
								<option value="04"> 4월</option>
								<option value="05"> 5월</option>
								<option value="06"> 6월</option>
								<option value="07"> 7월</option>
								<option value="08"> 8월</option>
								<option value="09"> 9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</td>
					</tr>
					 -->
					<tr>
						<td>
							<span>매입결제일정</span>
							<select name="fcBuyPayDtYr" id="m_slt_fcBuyPayDtYr" class="wdts">
									<option value="2021">2021년</option>
									<option value="2022">2022년</option>
							</select>
							<select name="fcBuyPayDtMt" id="m_slt_fcBuyPayDtMt" class="wdts">
								<option value="01"> 1월</option>
								<option value="02"> 2월</option>
								<option value="03"> 3월</option>
								<option value="04"> 4월</option>
								<option value="05"> 5월</option>
								<option value="06"> 6월</option>
								<option value="07"> 7월</option>
								<option value="08"> 8월</option>
								<option value="09"> 9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<!-- 
			<div class="btnWrap">
				<button type="button" onclick="javascript:fnMoveTab('basic');"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
				<button type="button" onclick="javascript:fnWriteFundInfo();"><img src="<c:url value='/images/btn_save.png'/>" /></button>
				<button type="button" onclick="javascript:fnMoveTab('progress');"><img src="<c:url value='/images/btn_next.png'/>" /></button>
			</div>
			
			 -->
			<div class="floatL">
				<!-- Left -->
				<div class="floatL" style="width: 191px;">
					<button type="button" onclick="javascript:fnMoveTab('basic');"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
				</div>
				
				<!-- middle -->
				<div class="floatL btnCenter">
					<button type="button" onclick="javascript:fnWriteFundInfo();"><img src="<c:url value='/images/btn_save.png'/>" /></button>	
				</div>
				
				<!-- right -->
				<div class="floatR"  style="margin-right: 22px;">
					<button type="button" onclick="javascript:fnMoveTab('progress');"><img src="<c:url value='/images/btn_next.png'/>" /></button>
				</div>
			</div>
	</div>
</form:form>
</body>
</html>