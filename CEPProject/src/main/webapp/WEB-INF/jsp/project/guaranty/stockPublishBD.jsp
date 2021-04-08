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
		.popContainer .contents {
			position: absolute;
			width: 648px;
			height: 472px;
			top: 107px;
			z-index: 3;
			background-color: #f6f7fc;
			/* overflow-y: auto; */
		}
		.popContainer .contents > div {
			width: 100%;
		}
		.popContainer .contents > div:first-child {
			width: 433px;
			min-height: 408px;
			margin: 10px 40px 15px 40px;
		}
		
		.popContainer .contents > div:last-child {
			width: 583px;
			margin-right: 50px;
		}
		.popContainer .contents > div > table {
			border-collapse: separate; 
	  		border-spacing: 0 3px;
		}
		.popContainer .contents select {
			width: 248px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.popContainer .contents input {
			width: 385px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="search"] {
			width: calc(100% - 20px);
			height: 38px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class="pname"] {
			width: 300px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 146px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class^="tdRate"] {
			width: 56px;
			height: 38px;
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class^="readOnly"] {
			background-color: #f6f7fc; 
			border-color: #f6f7fc;
		}
		.popContainer .contents input[class^="readOnlyDt"] {
			width: 146px;
			height: 38px;
			background-color: #f6f7fc; 
			border-color: #f6f7fc;
		}
		
		
		.popContainer .contents textarea {
			width: 433px;
			height: 48px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}
		.popContainer .contents td.tdContents {
			font-size: 14px;
			width : 301px
		} 
		
		.popContainer td.tdTitle {
			font-size: 14px;
			width : 160px;
		}
		
		.accountList li {
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
			font-size: 14px;
			color: #21a17e;
		}
		
	</style>
	
	
	<script>
				
		$(document).ready(function() {
			
			
			
		});	
		
		
		function fnGbPublish() {
			
			var formData = $("#m_frm_gb").serializeArray();
			
			for(var i = 0; i < formData.length; i++)
			{
				//보증기간, 발행일
				if('bdGbFinishDt'   == formData[i]['name']
				|| 'bdGbFinishDt'   == formData[i]['name']){
					formData[i]['value'] = removeData(formData[i]['value'], '-');
				}
				 
				//금액
				if('bdGbBdAmount' == formData[i]['name']
				|| 'bdGbAmount'   == formData[i]['name']){
					formData[i]['value'] = removeCommas(formData[i]['value']);
				}
				
				console.log(i+" : " + formData[i]['name'] + " : " + formData[i]['value']);
			}
			
			$.ajax({
	        	url :"/project/detail/requestBiddingGb.do",
	        	type:"POST",  
	            data: formData,
	     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType: 'json',
	            async : false,
	        	success:function(data){		  
	        		alert("발행 요청되었습니다.!");
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	    	});
			
		}
		
		function fnGbModify() {
			
			var formData = $("#m_frm_gb").serializeArray();
			
			var jsonDate = {}; 
			
			for(var i = 0; i < formData.length; i++)
			{
				//보증기간, 발행일
				if('bdGbFinishDt'   == formData[i]['name']
				|| 'bdGbFinishDt'   == formData[i]['name']){
					jsonDate[formData[i]['name']]  = removeData(formData[i]['value'], '-');
				} else if('bdGbBdAmount' == formData[i]['name']
				|| 'bdGbAmount'   == formData[i]['name']){
					if(formData[i]['value'] == '') { 
						//제거
					}
					else {
						jsonDate[formData[i]['name']]  = removeCommas(formData[i]['value']);
					}
				} else {                     
					jsonDate[formData[i]['name']]  = formData[i]['value'];
				}
				console.log(i+" : " + formData[i]['name'] + " : " + formData[i]['value']);
			}
			
			console.log(" ======= \n " + jsonDate);
			//return;
			
			$.ajax({
	        	url :"/project/detail/modifyBiddingGb.do",
	        	type:"POST",  
	            data: jsonDate,
	     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType: 'json',
	            async : false,
	        	success:function(data){		  
	        		alert("보증증권 정보가 수정 되었습니다.!");
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	    	});
			
		}
		
		
		function fnGbEnd() {
			
			var formData = $("#m_frm_gb").serializeArray();
			
			for(var i = 0; i < formData.length; i++)
			{
				//보증기간, 발행일
				if('bdGbFinishDt'   == formData[i]['name']
				|| 'bdGbFinishDt'   == formData[i]['name']){
					formData[i]['value'] = removeData(formData[i]['value'], '-');
				}
				 
				//금액
				if('bdGbBdAmount' == formData[i]['name']
				|| 'bdGbAmount'   == formData[i]['name']){
					formData[i]['value'] = removeCommas(formData[i]['value']);
				}
				
				console.log(i+" : " + formData[i]['name'] + " : " + formData[i]['value']);
			}
			
			$.ajax({
	        	url :"/project/detail/endBiddingGb.do",
	        	type:"POST",  
	            data: formData,
	     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType: 'json',
	            async : false,
	        	success:function(data){		  
	        		alert("발행이  완료 처리되었습니다.!");
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	    	});
		}
		
	</script>
</head>
<body>
	<form id="m_frm_gb" name="gbForm" method="post">
		<input type="hidden" id="m_ipt_bdKey" name="bdKey" value="${gbInfo.bdKey}" />		
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">입찰이행 보증증권 발행 정보</div>
				</div>
			</div>
			<div class="contents">
				<div>
					<table  style="width: 551px;">
						<tr id="m_tr_account" >
							<td class="tdTitle">고객사</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" class="readOnly" value="${gbInfo.acNm}" disabled/> 
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">사업명</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" class="readOnly" value="${gbInfo.pjNm}" disabled/> 
							</td>
						</tr>
					
						<tr>
							<td class="tdTitle">입찰마감일</td>
							<td class="tdContents">
								<input type="text" class="readOnlyDt" value="${displayUtil.displayDate(gbInfo.bdLimitDt)}" disabled/>
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">임찰금액(VAT포함)</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="ipt_bdGbBdAmount" name="bdGbBdAmount" value="${displayUtil.commaStr(gbInfo.bdGbBdAmount)}"/> 
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">요율</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"   id="m_ipt_bdGbRate"    name="bdGbRate" class="tdRate" value="${gbInfo.bdGbRate}"/>&nbsp;% 
								
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">보증기간</td>
							<td id="m_td_account" class="tdContents">
								입찰일로부터&nbsp;
								<input type="text"   id="m_ipt_bdGbDay"    name="bdGbDay" class="tdRate" value="${gbInfo.bdGbDay}"/> 
								&nbsp;일 이상
							</td>
						</tr>
					<c:choose>
						<c:when test='${gbInfo.bdGbFinishYn ne "N"}'>
							<tr id="m_tr_account" <c:if test='${gbInfo.bdGbFinishYn eq "N"}'>style="display: none;" </c:if>>
								<td class="tdTitle">발행일</td>
								<td id="m_td_account" class="tdContents">
									<input type="text" id="m_ipt_bdGbFinishDt" name="bdGbFinishDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.bdGbFinishDt)}" />
								</td>
							</tr>
							
							<tr id="m_tr_account" <c:if test='${gbInfo.bdGbFinishYn eq "N"}'>style="display: none;" </c:if>>
								<td class="tdTitle">증권금액</td>
								<td id="m_td_account" class="tdContents">
									<input type="text" id="m_ipt_bdGbAmount" name="bdGbAmount" value="${displayUtil.commaStr(gbInfo.bdGbAmount)}"/>
								</td>
							</tr>
						</c:when>
					</c:choose>
					</table>
				</div>
				<div class="btnWrap floatR">
					<div id="m_btn_save" class="floatR" style="">
						<c:choose>
							<c:when test='${gbInfo.bdGbFinishYn eq "N"}'>
								<button type="button" onclick="javascript:fnGbPublish();">
									<img src="<c:url value='/images/btn_stock_publish.png'/>" />
								</button>
							</c:when>
							<c:when test='${gbInfo.bdGbFinishYn eq "R"}'>
								<button type="button" onclick="javascript:fnGbEnd();">
									<img src="<c:url value='/images/btn_stock_end.png'/>" />
								</button>
								<button type="button" onclick="javascript:fnGbModify();">
									<img src="<c:url value='/images/btn_stock_mod.png'/>" />
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" onclick="javascript:fnGbModify();">
									<img src="<c:url value='/images/btn_stock_mod.png'/>" />
								</button>
							</c:otherwise>
						</c:choose>
						
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</div>	
	</form>
	
</body>
</html>