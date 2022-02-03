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
		.popContainer .contents > div {
			width: calc(100% - 80px);
			margin: 10px 40px 15px 40px;
		}
		.popContainer .contents > div:first-child {
			min-height: 519px;
		}
		.popContainer .contents > div table {
			width: 100%;
			border-collapse: separate;
	  		border-spacing: 0 3px;
	  		/* margin-top: 14px; */
	  		/* border-top: 2px solid #e5e5e5; */
	  		padding-top: 7px;
		}
		.popContainer .contents td.tdTitle {
		    margin-top: 11px;
		    font-size: 18px;
   			color: #535353;
		    padding: 0 10px;
		    width: 98px;
		    vertical-align: text-bottom;
		}
		.popContainer .contents td.tdContents {
		    width: 740px;
		    font-size: 14px;
		}
		.popContainer .contents td span.wds {
			display: inline-block;
			width: 83px;
			vertical-align: top;
		}
		.popContainer .contents td textarea {
			border: 1px solid #e6e6e6;
			width: 100%;
    		height: 219px;
    		resize : vertical;
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
		.move .moveSpan.right {
			left: 15px;
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
		.move .moveSpan.right::after {
			left: 18%;
		}
	</style>
	<script>
	
	
	$(document).ready(function(){
		
		
		/* if("${spKey}" != undefined && "${spKey}" != null && "${spKey}".length == 8)
		{
			$('#m_ipt_spKey').val("${spKey}");
			
			if("${forecast.remark}" != undefined && "${forecast.remark}" != null && "${forecast.remark}".length > 0)
			{
				$('#m_tta_remark').val('${forecast.remark}');
			}
			
			if("${forecast.pmDetail2}" != undefined && "${forecast.pmDetail2}" != null && "${forecast.pmDetail2}".length > 0)
			{
				$('#m_tta_pmDetail2').val('${forecast.pmDetail2}');
			}
		} */
		
		if($('#m_tta_pmDetail2').val().replace(" ", "").length != 0 || $('#m_tta_remark').val().replace(" ", "").length != 0) {
			$('.btnSave').children().eq(0).html('');
			$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />'); 
			$('#isUpdate').val("Y");
		}
		
		$('#remarkCnt1').html("("+$("#m_tta_pmDetail2").val().length+" / 500)");
		$('#remarkCnt2').html("("+$("#m_tta_remark").val().length+" / 500)");
		
		$('#m_tta_pmDetail2').on('keyup', function() {
			$('#remarkCnt1').html("("+$(this).val().length+" / 500)");
			
			if($(this).val().length > 500) {
				$(this).val($(this).val().substring(0, 500));
				$('#remarkCnt1').html("(500 / 500)");
			}
			
			$('#m_tta_remark').on('keyup', function() {
				$('#remarkCnt2').html("("+$(this).val().length+" / 500)");
				
				if($(this).val().length > 500) {
					$(this).val($(this).val().substring(0, 500));
					$('#remarkCnt2').html("(500 / 500)");
				}
			});
		});
		
		
		if("Y" == "${forecast.bdYn}"){
			$('#bidding_menu').show();
		} else {
			$('#bidding_menu').hide();
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
	    			$('#isUpdate').val("Y");
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
		/* if(pstTabName == 'basic' || pstTabName == 'fundInfo') {
			fn_addView(pstTabName, $('#m_ipt_spKey').val());
		} else {
			if($('#isUpdate').val() == "N") {
				alert("저장을 해주세요.");
			} else {
				fn_addView(pstTabName, $('#m_ipt_spKey').val());
			}
		} */
		
		fn_addView(pstTabName, $('#m_ipt_spKey').val());
	};
	
	
	</script>
</head>
<body>
<form:form commandNmae="forecastVO" id="m_fr_forecastProgress" name="forecastProgress" method="post">
	<input type="hidden" id="workClass" name="workClass" value="입찰_첨부파일"/>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">Forecast 등록</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
				<li class="colorWhite cursorP" onclick="javascript:fnMoveTab('basic')">기본 정보</li>
				<li class="colorWhite cursorP" onclick="javascript:fnMoveTab('fundInfo')">매출/입 정보</li>
				<li class="colorWhite cursorP on">제품 및 진행사항</li>
				<li class="colorWhite cursorP" id="bidding_menu" onclick="javascript:fnMoveTab('biddingInfo')" style="display:none">입찰 정보</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<!-- Forecast Key -->
				<input type="hidden" name="spKey" id="m_ipt_spKey" value="${spKey }"/>
				<input type="hidden" id="isUpdate" value="N" />
				<input type="hidden" value="${forecast.pmDetail2 }"/>
				<table>
					<tr>
						<td class="tdTitle">
							<span class="wds">제품 상세</span>
						</td>
						<td class="tdContents">
							<textarea id="m_tta_pmDetail2" name="pmDetail2" rows="5" cols="45"><c:out value="${forecast.pmDetail2}"></c:out></textarea>
							<div id="remarkCnt1" class="ftw200">(0 / 500)</div>
						</td>
					</tr>
					<tr>
						<td class="tdTitle">
							<span class="wds">진행사항</span>
						</td>
						<td class="tdContents">
							<textarea id="m_tta_remark" name="remark" rows="5" cols="45"><c:out value="${forecast.remark }"></c:out></textarea>
							<div id="remarkCnt2" class="ftw200">(0 / 500)</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="btnWrap floatL">
				<!-- Left -->
				<div class="floatL btnPrev">
					<button type="button" onclick="javascript:fnMoveTab('fundInfo')" class="move"><img src="<c:url value='/images/btn_prev.png'/>" />
						<span class="moveSpan right">저장/수정하지 않은 정보는 반영되지 않습니다.</span>
					</button>
				</div>
				
				<!-- middle -->
				<c:set var="systemName" value='<%=session.getAttribute("name") %>'/>
				<c:set var="mngName" value="${forecast.empNm }" />
				
				<%--<c:choose>
					<c:when test="${forecast.pmDetail2 eq null and forecast.remark eq null}">
						<div class="floatL btnSave">
							<button type="button" class="move" onclick="javascript:fnWriteProgress()" data-tooltip-text="저장/수정하지 않은 정보는 반영되지 않습니다."><img src="<c:url value='/images/btn_save.png'/>" /></button>	
						</div>
					</c:when>
					<c:otherwise> --%>
						<c:if test="${systemName eq mngName }">
							<div class="floatL btnSave">
								<button type="button" onclick="javascript:fnWriteProgress();"><img src="<c:url value='/images/btn_save.png'/>" /></button>	
							</div>
						</c:if>
					<%-- </c:otherwise>
				</c:choose> --%>
				
				<!-- right -->
				<c:if test="${forecast.bdYn eq 'Y'}">
					<div class="floatR" >
						<button type="button" onclick="javascript:fnMoveTab('biddingInfo');" class="move"><img src="<c:url value='/images/btn_next.png'/>" />
							<span class="moveSpan">저장/수정하지 않은 정보는 반영되지 않습니다.</span>
						</button>
					</div>	
				</c:if>
			</div>
		</div>
	</div>
</form:form>
</body>
</html>