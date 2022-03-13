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
			margin: 10px 40px 15px 40px;
		}
		.popContainer .contents > div:first-child {
			min-height: 519px;
		}
		.popContainer .contents > div > form > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
		}
		.popContainer .contents input {
			width: 250px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="search"] {
			width: 250px;
			height: 38px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class="portInfo"] {
			width: calc(100% - 20px);
		}
		.popContainer .contents input[class^="calendar"] {
			width: 250px;
			height: 40px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: calc(100% - 20px);
			height: 130px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}
		.popContainer .contents select {
			width: 153px;
			/* height: 40px; */
			height: 35px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.popContainer .contents td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer .contents td.tdTitle {
			margin-top: 11px;
			font-size: 14px;
			color: #535353;
			padding-right: 20px;
			width: 99px;
		}				
		.popContainer .contents td.tdContents {
			width: 87%;
			font-size: 14px;
			font-weight: 200;
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
		.popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
      	}	
      	.btnWrap {
      		position: relative !important;
      		bottom: 0 !important;
      	}
	</style>
	<script>
		$(document).ready(function() {
			$("input:radio[name='inbClass']:radio[value='${resultList[0].inbClass}']").prop('checked', true);	
			
			if($('input[id=selectKey]').val() != "" || $('input[id=selectKey]').val().length != 0) {
				$('.btnSave').children().eq(0).html('');
				$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />'); 
			}
			
			$("#projectConnect").click(function() {
				window.open('/project/popup/list.do?returnType=F&returnFunctionNm=pop_projectCall&pjFlag=P', 'PROJECT_LIST', 'width=972px,height=713px,left=600');
			});
		});
		
		function pop_projectCall(returnKey, returnNm) {
			$.ajax({
				url:"/project/selectProjectMappingInfo.do",
				dataType:"json",
				type:"post",
				data:returnKey,
				contentType:"application/json; charset=UTF-8",
				beforeSend: function(xhr) {
					xhr.setRequestHeader("AJAX", true);
				},
				success:function(data) {
					$("#projectConnect").val(data.projectVO[0].pjNm);
					$("#m_pjKey").val(data.projectVO[0].pjKey);
				},
				error: function(request, status, error) {
					if(request.status != '0') {
						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
					}
				}
			});
		}
		
		//제품 찾기 클릭
		function fn_findProduct(obj) {
			if($("#projectConnect").val().replace(" ","").length == 0) {
				alert("프로젝트를 먼저 선택해 주세요.");
				$("#projectConnect").trigger("click");
			} else {
				window.open('/mngCommon/product/popup/orderSearchListPopup.do?pmNmDomId='+obj.id+'&pmKeyDomId='+obj.nextElementSibling.id+'&returnType=O&searchKey='+$("#m_pjKey").val()+'','PRODUCT_LIST','width=1000px,height=713px,left=600');				
			}
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
		
		var countSave = 0;
		
		function fn_save() {
			var object = {};
			var formData = $("#infoForm").serializeArray();
			var form = document.infoForm;
			
			for (var i = 0; i<formData.length; i++){
			    if("inbDeliveryDt" == formData[i]['name']) {
                	//날짜 - 제거
                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
                } else {
                	object[formData[i]['name']] = formData[i]['value'];
                }     
			 }
			
			var sendData = JSON.stringify(object);
			$.ajax({
				url:"/project/insert/buildInfo.do",
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
			    		if($("#selectKey").val() == null || $("#selectKey").val() == "" || $("#selectKey").val().length == 0) {
				    		alert("프로젝트 installbase 정보가 등록되었습니다.");
				    		$("#selectKey").val(response.inbSeq);
				    		countSave++;
			    		} else {
			    			alert("프로젝트 installbase 정보가 수정되었습니다.");
			    		}
			    		
			    		var inbSeq = $("#selectKey").val();
			    		var url='/project/write/buildInfo.do';
		    			var dialogId = 'program_layer';
		    			var varParam = {
							"pjKey":$("#m_pjKey").val(),
							"inbSeq":inbSeq
		    			}
		    			var button = new Array;
		    			button = [];
		    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			    	} else {
			    		if($("#selectKey").val() == null || $("#selectKey").val() == "" || $("#selectKey").val().length == 0) {
			    			alert("프로젝트 installbase 정보 등록이 실패하였습니다.");
			    		} else {
			    			alert("프로젝트 installbase 정보 수정이 실패하였습니다.");
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
	
		/* function fn_next(link) {
			if(countSave > 0) {
				var url = '/project/write/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
						"pjKey": $("#pjKey").val()
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:673px');
			}
			else {
				if($('#selectKey').val() != "" || $('#selectKey').val().length != 0) {
					var url = '/project/write/'+link+'.do';
					var dialogId = 'program_layer';
					var varParam = {
							"pjKey": $("#pjKey").val()
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:673px');
				} else {
					alert('저장을 해주세요.');
				}
			}
		}
		
		function fn_prevView(){
			var url = '/project/write/orderInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey" : $('#pjKey').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		} */
	</script>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">Installbase 등록</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
				<li class="colorWhite cursorP on">설치 및 구축</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<form id="infoForm" name="infoForm" method="post">
					<input type="hidden" id="m_pjKey" name="pjKey" value="<c:out value="${pjKey}"/>" />
					<input type="hidden" id="resultList" value="<c:out value="${resultList}"/>" />
					<input type="hidden" id="selectKey" name="selectKey" value="<c:out value="${resultList[0].inbSeq}"/>" />
					<%-- <input type="hidden" id="pjStatusCd" name="pjStatusCd" value="<c:out value="${resultList[0].pjStatusCd}"/>" /> --%>
					<input type="hidden" name="statusCd" value="PJST4000" />
					<table>
						<tr>
							<td class="tdTitle">프로젝트</td>
							<td class="tdContents"><input type="text" name="pjNm" id="projectConnect" value="<c:out value="${resultList[0].pjNm}"/>" readOnly/></td>
						</tr>
						<tr>
							<td class="tdTitle">설치 장소</td>
							<td class="tdContents"><input type="text" name="inbPlace" id="inbPlace" value="<c:out value="${resultList[0].inbPlace}"/>"/></td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>구&nbsp;&nbsp;분</td>
							<td class="tdContents">
								<input type="radio" class="tCheck" name="inbClass" id="inbClass1" value="신규" checked="checked"/><label for="inbClass1" class="cursorP"></label>
								&nbsp;&nbsp;&nbsp;신규&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" class="tCheck" name="inbClass" id="inbClass2" value="증설"/><label for="inbClass2" class="cursorP"></label> 
								&nbsp;&nbsp;&nbsp;증설&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" class="tCheck" name="inbClass" id="inbClass3" value="기타"/><label for="inbClass3" class="cursorP"></label> 
								&nbsp;&nbsp;&nbsp;기타
							</td>
						</tr>
						<%-- <tr>
							<td class="tdTitle"><label>*</label>제품유형</td>
							<td class="tdContents">
								<input type="text" name="inbPmType" value="<c:out value="${resultList[0].inbPmType}"/>" required/>
							</td>
						</tr> --%>
						<tr>
							<td class="tdTitle"><label>*</label>모델명</td>
							<td class="tdContents">
								<input type="text" class="search" id="pmNmDomId" onclick="fn_findProduct(this)" onkeypress="return false;" value="<c:out value="${resultList[0].inbPmNm}"/>" required/>
								<input type="hidden" name="inbPmKey" id="pmKeyDomId" value="<c:out value="${resultList[0].inbPmKey}"/>" required/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>시리얼번호</td>
							<td class="tdContents">
								<input type="text" name="inbPmSerialNo" value="<c:out value="${resultList[0].inbPmSerialNo}"/>" required/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>작업일자</td>
							<td class="tdContents">
								<input type="text" class="calendar" name="inbDeliveryDt" value="<c:out value="${displayUtil.displayDate(resultList[0].inbDeliveryDt)}"/>" required/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">버전</td>
							<td class="tdContents">
								<input type="text" name="inbPmVer" value="<c:out value="${resultList[0].inbPmVer}"/>" />
							</td>
						</tr>
						<tr>
							<td class="tdTitle veralignT">주요 스펙</td>
							<td class="tdContents"><textarea name="inbSpecInfo"><c:out value="${resultList[0].inbSpecInfo}"/></textarea></td>
						</tr>
						<tr>
							<td class="tdTitle">캐쉬메모리</td>
							<td class="tdContents">
								<input type="text" name="inbCacheMem" value="<c:out value="${resultList[0].inbCacheMem}"/>" numberOnly />&nbsp;&nbsp;GB
							</td>
						</tr>
						<tr>
							<td class="tdTitle wdt100">포트 정보</td>
							<td class="tdContents">
								<input type="text" class="portInfo" name="inbPortInfo" value="<c:out value="${resultList[0].inbPortInfo}"/>" />
							</td>
						</tr>
						<tr>
							<td class="tdTitle veralignT">관리 IP</td>
							<td class="tdContents"><textarea name="inbMngIp"><c:out value="${resultList[0].inbMngIp}"/></textarea></td>
						</tr>
						<tr>
							<td class="tdTitle veralignT">비고</td>
							<td class="tdContents"><textarea name="remark"><c:out value="${resultList[0].remark}"/></textarea></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="btnWrap floatR">
				<%-- <div class="floatL btnPrev">
					<button type="button" onclick="fn_prevView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
				</div> --%>
				<div class="btnSave" style="width: 100%;">
					<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
				</div>
				<%-- <div class="floatR">
					<button type="button" onclick="javascript:fn_next('finishInfo')"><img src="<c:url value='/images/btn_next.png'/>" /></button>
				</div> --%>
				<div class="floatN floatC"></div>
			</div>
		</div>
	</div>
</body>
</html>