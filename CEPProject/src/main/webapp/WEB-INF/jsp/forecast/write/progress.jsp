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
		.popContainer .contents td span.wds {
			display: inline-block;
			width: 68px;
			font-weight: 300;
			vertical-align: top;
		}
		.popContainer .contents td textarea {
			border: 1px solid #e6e6e6;
		}
		.popContainer .contents .btnWrap {
			margin-top: 25px;
		}
	</style>
	<script>
	
	
	$(document).ready(function(){
		
		//alert("Progress : spKey : ${spKey}");
		
		if("${spKey}" != undefined && "${spKey}" != null && "${spKey}".length == 8)
		{
			//alert("spBusiNm : ${forecast.spBusiNm}, ${forecast.remark} , ${forecast.pmDetail2}");
			//alert("spBusiNm : ${forecast.spBusiNm}");
			$('#m_ipt_spKey').val("${spKey}");
			
			if("${forecast.remark}" != undefined && "${forecast.remark}" != null && "${forecast.remark}".length > 0)
			{
				//$('#m_tta_remark').attr('innerHTML','${forecast.remark}');
				$('#m_tta_remark').val('${forecast.remark}');
			}
			
			if("${forecast.pmDetail2}" != undefined && "${forecast.pmDetail2}" != null && "${forecast.pmDetail2}".length > 0)
			{
				//$('#m_tta_pmDetail2').attr('innerHTML','${forecast.pmDetail2}');
				$('#m_tta_pmDetail2').val('${forecast.pmDetail2}');
			}
		}
		
		if($('#m_tta_pmDetail2').val().replace(" ", "").length != 0 || $('#m_tta_remark').val().replace(" ", "").length != 0) {
			$('.btnCenter').children().eq(0).html('');
			$('.btnCenter').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />'); 
			$('#isUpdate').val("Y");
		}
		
	});
	
	
	var fnWriteProgress = function(){
		
		//alert("fnWriteProgress");
		var ljsParam =  $("#m_fr_forecastProgress").serializeArray();
		
		//alert(ljsParam[3].value);
		//console.log(ljsParam);
		//return;
		
		var object = {};
		for (var i = 0; i<ljsParam.length; i++){
			object[ljsParam[i]['name']] = ljsParam[i]['value'];
        }
		
		var sendData = JSON.stringify(object);
		
		$.ajax({
	    	url :"/forecast/write/writeProgress.do",
	       	type:"POST",  
	        data: sendData,
	        contentType: "application/json; charset=UTF-8", 
	        dataType: 'json', 
	    	success:function(data){		  
	           	if($('#isUpdate').val().replace(" ", "") == ("N") || $('#isUpdate').val().replace(" ", "").length == 0) {
	    			alert("제품 및 진행사항 정보가 저장되었습니다.");	
	    		} else {
	    			alert("제품 및 진행사항 정보가 수정되었습니다.");	
	    		}
	           	
	           	fnMoveTab('progress');
	        } , error: function(request, status, error) {
	        	if(request.status != '0') {
	        		alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        	}
	        } 
	    }); 
	};
	
	
	/*
		function fn_addView(link){
			
			alert(4);
			
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
<form:form commandNmae="forecastVO" id="m_fr_forecastProgress" name="forecastProgress" method="post">
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">Forecast 등록</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw300">
				<li class="colorWhite cursorP" onclick="javascript:fnMoveTab('basic')">기본 정보</li>
				<li class="colorWhite cursorP" onclick="javascript:fnMoveTab('fundInfo')">매출/입 정보</li>
				<li class="colorWhite cursorP on">제품 및 진행사항</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<!-- Forecast Key -->
				<input type="hidden" name="spKey" id="m_ipt_spKey"/>
				<input type="hidden" id="isUpdate" />
				<input type="hidden" value="${forecast.pmDetail2 }"/>
				<table>
					<tr>
						<td>
							<span class="wds">제품 상세</span>
							<textarea id="m_tta_pmDetail2" name="pmDetail2" rows="5" cols="45"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<span class="wds">진행사항</span>
							<textarea id="m_tta_remark" name="remark" rows="5" cols="45"></textarea>
						</td>
					</tr>
				</table>
			</div>
			<!-- 
			<div class="btnWrap">
				<button type="button" onclick="javascript:fnMoveTab('fundInfo')"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
				<button type="button" onclick="javascript:fnWriteProgress();"><img src="<c:url value='/images/btn_save.png'/>" /></button>
				<button type="button" onclick="javascript:fnMoveTab('forecastList')"><img src="<c:url value='/images/btn_next.png'/>" /></button>
			
			</div>
			 -->
			 
			<div class="floatL">
					<!-- Left -->
					<div class="floatL" style="width: 191px;">
						<button type="button" onclick="javascript:fnMoveTab('fundInfo')"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					</div>
					
					<!-- middle -->
					<div class="floatL btnCenter">
						<button type="button" onclick="javascript:fnWriteProgress();"><img src="<c:url value='/images/btn_save.png'/>" /></button>	
					</div>
					
					<!-- right -->
					<div class="floatR"  style="margin-right: 22px;">
						&nbsp;
					</div>	
				</div>
		</div>
	</div>
</form:form>
</body>
</html>