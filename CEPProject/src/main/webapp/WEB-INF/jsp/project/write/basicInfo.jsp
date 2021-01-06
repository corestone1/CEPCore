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
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
		}
		/* .popContainer .contents > div > table tr:first-child td {
			margin-bottom: 100px;
		} */
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
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="search"] {
			width: 177px;
			height: 38px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class="pname"] {
			width: 400px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 177px;
			height: 40px;
			background-image: url('/images/icon_calendar.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: calc(100% - 20px);
			height: 160px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}
		.popContainer .contents td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer .contents td.tdTitle {
			margin-top: 11px;
			font-size: 14px;
			color: #525252;
			padding-right: 20px;
			width: 99px;
		}				
		.popContainer .contents td.tdContents {
			width: 100%;
			font-size: 14px;
		} 
		.ui-datepicker.ui-widget-content {
			z-index: 102 !important;
		 }
	</style>
	<script>
		function fn_saveNext(){
	       	var object = {};
	       	var formData = $("#infoForm").serializeArray();
	       	for (var i = 0; i<formData.length; i++){
	            object[formData[i]['name']] = formData[i]['value'];
	         }
	       	var sendData = JSON.stringify(object);
	       	
	       	 $.ajax({
	        	url:"/project/insert/basicInfo.do",
	            dataType: 'json', 
	            type:"POST",  
	            data: sendData,
	     	   	contentType: "application/json; charset=UTF-8", 
	     	  	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);
	        		//xhr.setRequestHeader(header, token);
	        		
	        	},
	            success:function(response){	
	            	if(response!= null && response.successYN == 'Y') {
	            		console.log(response.pjKey);
	            	}
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        });  
		}
	
		function fn_addBiddingView(){
			var url = '/project/write/amountInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_SamplePopup(){
		    window.open('/project/popup/list.do','project_list','width=1000px,height=400,left=600');
		}
	</script>
</head>
<body>
	<form:form commandName="infoForm" id="infoForm" name="infoForm" method="post">
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">프로젝트 등록</div>
				</div>
			</div>
			<div class="left">
				<ul class="ftw400">
					<li >기본정보</li>
				</ul>
			</div>
			<div class="contents">
				<input type="text" id="id" style="border: 1px solid #000; width: 200px;"/>
				<input type="text" id="no" style="border: 1px solid #000; width: 200px;"/>
				<input type="hidden" id="dialogId" />
				<div>
					<table>
						<tr>
							<td class="btnFc" colspan="2"><button onclick="fn_SamplePopup();"><img src="<c:url value='/images/forecast_icon.png'/>" /></button></td>
						</tr>
						<tr>
							<td class="tdTitle">프로젝트명</td>
							<td class="tdContents"><input type="text" name="pjNm"/></td>
						</tr>
						<tr>
							<td class="tdTitle">고객사</td>
							<td class="tdContents">
								<input type="text" class="search" name="acKey"/>	
							</td>
						</tr>
						<tr>
							<td class="tdTitle">고객사담당자</td>
							<td class="tdContents">
								<select name="acDirectorKey">
									<option value="">홍길동</option>
								</select>					
								<input type="text" class="pname"  value="차장/ 010-1234-5678 / hong@naver.com" readonly/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">영업담당자</td>
							<td class="tdContents">
								<select name="pjSaleEmpKey">
									<option value="">최재용</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">지원담당자</td>
							<td class="tdContents">
								<select name="pjSupportEmpKey">
									<option value="">김규민</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">사업기간</td>
							<td class="tdContents">
								<input type="text" placeholder="from" class="calendar fromDt" name="pjStartDt"/> ~ 
								<input type="text" placeholder="to" class="calendar toDt" name="pjEndDt" />
							</td>
						</tr>
						<tr>
							<td class="tdTitle veralignT">비고</td>
							<td class="tdContents"><textarea name="remark"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="btnWrap floatR">
					<div class="floatL">
						<button ><img src="<c:url value='/images/btn_file.png'/>" /></button>
					</div>
					<div class="floatR">
						<button type="button" onclick="fn_saveNext();"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>