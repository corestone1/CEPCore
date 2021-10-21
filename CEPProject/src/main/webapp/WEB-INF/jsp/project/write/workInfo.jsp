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
		.popContainer .contents > div > form > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
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
		.popContainer .contents input[class="timeInfo"] {
			width: 30px;
			height: 38px;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 150px;
			height: 40px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: calc(100% - 20px);
			height: 100px;
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
			color: #535353;
			padding-right: 20px;
			width: 99px;
			
		}				
		.popContainer .contents td.tdContents {
			width: 90%;
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
		.popContainer .contents tr:first-child td { 
			padding-top: 8px;
		}		
		.popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
      	}	
	</style>
	<script>
		$(document).ready(function() {
			$("input:radio[name='pjWorkClassCd']:radio[value='${resultList[0].pjWorkClassCd}']").prop('checked', true);	
		
			if($('input[id=selectKey]').val() != "" || $('input[id=selectKey]').val().length != 0) {
				$('.btnSave').children().eq(0).html('');
				$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />'); 
			}
		});
		
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
			$("#pjWorkTakeTm").val($("#pjWorkTakeTm1").val() + $("#pjWorkTakeTm2").val());
			$("#pjWorkTm").val($("#pjWorkTm1").val()+"00");
			
			if($("#pjWorkTakeTm").val() == null || !($("#pjWorkTakeTm").val().length > 0)) {
				alert('소요시간을 입력해주세요.');
				$(this).focus();
			} else if($("#pjWorkTm").val() == null || !($("#pjWorkTm").val().length > 0)) {
				alert('수행 시간을 입력해주세요.');
				$(this).focus();
			} else {
				var object = {};
				var formData = $("#infoForm").serializeArray();
				var form = document.infoForm;
				
				for (var i = 0; i<formData.length; i++){
				    object[formData[i]['name']] = formData[i]['value'];
				    if("pjWorkDt" == formData[i]['name']) {
	                	//날짜 - 제거
	                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
	                } else {
	                	object[formData[i]['name']] = formData[i]['value'];
	                }     
				 }
				
				var sendData = JSON.stringify(object);
				
				$.ajax({
					url:"/project/insert/workInfo.do",
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
					    		alert("프로젝트 수행일지 정보가 등록되었습니다.");
					    		$("#selectKey").val(response.workSeq);
				    		} else {
				    			alert("프로젝트 수행일지 정보가 수정되었습니다.");
				    		}
				    		
				    		var workSeq = $("#selectKey").val();
				    		var url='/project/write/workInfo.do';
			    			var dialogId = 'program_layer';
			    			var varParam = {
								"pjKey":$("#pjKey").val(),
								"pjWorkSeq":workSeq
			    			}
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
				    	} else {
				    		if($("#selectKey").val() == null || $("#selectKey").val() == "" || $("#selectKey").val().length == 0) {
				    			alert("프로젝트 수행일지 정보 등록이 실패하였습니다.");
				    		} else {
				    			alert("프로젝트 수행일지 정보 수정이 실패하였습니다.");
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
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			}
			else {
				if($('#resultList').val() != "" || $('#resultList').val().length != 0) {
					var url = '/project/write/'+link+'.do';
					var dialogId = 'program_layer';
					var varParam = {
							"pjKey": $("#pjKey").val()
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
				} else {
					alert('저장을 해주세요.');
				}
			}
		}
		
		function fn_prevView(){
			var url = '/project/write/buildInfo.do';
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
				<div class="floatL ftw500">수행일지 등록</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw300">
				<li class="colorWhite cursorP on">수행일지</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<form id="infoForm" name="infoForm" method="post">
					<input type="hidden" id="pjKey" name="pjKey" value="<c:out value="${pjKey}"/>" />
					<input type="hidden" id="resultList" value="<c:out value="${resultList}"/>" />
					<input type="hidden" id="selectKey" name="selectKey" value="<c:out value="${resultList[0].pjWorkSeq}"/>" />
					<input type="hidden" id="pjStatusCd" name="pjStatusCd" value="<c:out value="${resultList[0].pjStatusCd}"/>" />
					<table>
						<tr>
							<td class="tdTitle">구분</td>
							<td class="tdContents">
								<input type="radio" class="tCheck" name="pjWorkClassCd" id="pjWorkClassCd1" checked="checked" value="작업"/><label for="pjWorkClassCd1" class="cursorP"></label>
								&nbsp;&nbsp;작업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" class="tCheck" name="pjWorkClassCd" id="pjWorkClassCd2" value="이슈"/><label for="pjWorkClassCd2" class="cursorP"></label> 
								&nbsp;&nbsp;이슈&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" class="tCheck" name="pjWorkClassCd" id="pjWorkClassCd3" value="장애"/><label for="pjWorkClassCd3" class="cursorP"></label> 
								&nbsp;&nbsp;장애&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" class="tCheck" name="pjWorkClassCd" id="pjWorkClassCd4" value="기타"/><label for="pjWorkClassCd4" class="cursorP"></label> 
								&nbsp;&nbsp;기타
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>일시</td>
							<td class="tdContents">
								<input type="text" class="calendar" name="pjWorkDt" value="<c:out value="${displayUtil.displayDate(resultList[0].pjWorkDt)}"/>" required />&nbsp;&nbsp;
								<c:set var="tm" value="${resultList[0].pjWorkTm}"/>
								<input type="text" numberOnly class="timeInfo" id="pjWorkTm1" value="${fn:substring(tm,0,2) }"/> :00&nbsp;&nbsp;&nbsp;
								<input type="hidden" name="pjWorkTm" id="pjWorkTm"/> 
								<c:set var="takeTm" value="${resultList[0].pjWorkTakeTm}"/>
								<c:set var="length" value="${fn:length(takeTm)}"/>
								소요시간 <input type="text" numberOnly class="timeInfo" id="pjWorkTakeTm1" value="${fn:substring(takeTm,0,2) }"/> : <input type="text" numberOnly class="timeInfo" id="pjWorkTakeTm2" value="${fn:substring(takeTm,length-2,length) }">
								<input type="hidden" name="pjWorkTakeTm" id="pjWorkTakeTm" /> 
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>제목</td>
							<td class="tdContents"><input type="text" name="pjWorkNm" value="<c:out value="${resultList[0].pjWorkNm}"/>" required/></td>
						</tr>
						<tr>
							<td class="tdTitle veralignT"><label>*</label>내용</td>
							<td class="tdContents"><textarea name="pjWorkCont" required><c:out value="${resultList[0].pjWorkCont}"/></textarea></td>
						</tr>
						<tr>
							<td class="tdTitle veralignT"><label>*</label>처리결과</td>
							<td class="tdContents"><textarea name="pjWorkResult" required><c:out value="${resultList[0].pjWorkResult}"/></textarea></td>
						</tr>
						<tr>
							<td class="tdTitle veralignT">기타</td>
							<td class="tdContents"><textarea name="remark"><c:out value="${resultList[0].remark}"/></textarea></td>
						</tr>
						<tr>
							<td class="tdTitle">첨부파일</td>
							<td class="tdContents">
								<button><img src="<c:url value='/images/btn_file_upload.png'/>" /></button>
							</td>
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