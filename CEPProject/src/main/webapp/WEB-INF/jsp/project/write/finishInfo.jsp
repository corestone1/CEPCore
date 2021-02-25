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
			width: 700px;
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
			width: 130px;
			height: 40px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: calc(100% - 20px);
			height: 277px;
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
			width: 100%;
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
		/* .popContainer .contents tr:first-child td { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  			
			padding-top: 20px;
		} */
		.popContainer .contents input[class="pname"] {
			width: 400px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
			padding-left: 0px;
		}
		.popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
      	}	
	</style>
	<script>	
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
			    object[formData[i]['name']] = formData[i]['value'];
			    if("pjInspectDt" == formData[i]['name']) {
                	//날짜 - 제거
                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
                } else {
                	object[formData[i]['name']] = formData[i]['value'];
                }     
			 }
			
			var sendData = JSON.stringify(object);
			
			$.ajax({
				url:"/project/update/basicInfo.do",
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
			    		alert('저장되었습니다.');
			    		countSave++;
			    		
			    		var url = '/project/write/finishInfo.do';
						var dialogId = 'program_layer';
						var varParam = {
							"pjKey" : $('#pjKey').val(),
							"turnNo":$("#turnNo").val(),
							"ctKey":ctKeyList,
							"salesKey":salesKeyList
						}
						var button = new Array;
						button = [];
						showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			    	} else {
			    		alert('프로젝트 완료 정보 등록이 실패했습니다.');
			    	}
			    },
				error: function(request, status, error) {
					if(request.status != '0') {
						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
					}
				} 
			});   
		}
		
		var ctKeyList = new Array();
		var salesKeyList = new Array();
		
		<c:forEach items="${ctKey}" var="item">
			ctKeyList.push("${item}");
		</c:forEach>
		
		<c:forEach items="${salesKey}" var="item">
			salesKeyList.push("${item}");
		</c:forEach>
		
		function fn_prevView(){
			var url = '/project/write/orderInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey" : $('#pjKey').val(),
				"turnNo":$("#turnNo").val(),
				"ctKey":ctKeyList,
				"salesKey":salesKeyList
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
				<div class="subTitle">완료</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw300">
				<li >완료정보</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<form id="infoForm" name="infoForm" method="post">
					<input type="hidden" id="pjKey" name="pjKey" value="<c:out value="${pjKey[0]}"/>"/>
					<input type="hidden" id="turnNo" name="turnNo"  value="<c:out value="${turnNo[0]}"/>"/>
					<input type="hidden" id="pjStatusCd" name="pjStatusCd" value="PJST5000" />
					<table>
						<tr>
							<td class="tdTitle">고객사</td>
							<td class="tdContents" colspan="2">
								<input type="text" class="pname"  value="<c:out value="${resultList[0].acNm}"/>" readonly/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">프로젝트명</td>
							<td class="tdContents" colspan="2">
								<input type="text" class="pname"  value="<c:out value="${resultList[0].pjNm}"/>" readonly/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>검수일</td>
							<td class="tdContents" colspan="2">
								<input type="text" class="calendar" name="pjInspectDt" value="<c:out value="${displayUtil.displayDate(resultList[0].pjInspectDt)}"/>" required/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">검수확인서</td>
							<td >
								<button><img src="<c:url value='/images/btn_file_upload.png'/>" /></button>							
							</td>
							<td>
								<input type="text" class="pname" value="EDMS이미지 암호화 검수확인서.pdf" readonly>
							</td>
						</tr>
						<tr>
							<td class="tdTitle veralignT">비고</td>
							<td class="tdContents"  colspan="2"><textarea name="finishRemark"><c:out value="${resultList[0].finishRemark}"/></textarea></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="btnWrap floatR">
				<div class="floatL btnPrev">
					<button type="button" onclick="fn_prevView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
				</div>
				<div class="floatL btnSave">
					<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
				</div>
				<div class="floatN floatC"></div>
			</div>
		</div>
	</div>
</body>
</html>