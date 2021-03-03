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
		.popContainer .contents textarea {
			width: calc(100% - 20px);
			height: 410px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
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
		.popContainer .contents select {
			width: 160px;
			height: 40px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('./images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
	</style>
	<script>		
		function fn_save(){
			var object = {};
			var formData = $("#infoForm").serializeArray();
			
			for (var i = 0; i<formData.length; i++){
               	object[formData[i]['name']] = formData[i]['value'];
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
			    		
			    		var url = '/project/write/loseInfo.do';
						var dialogId = 'program_layer';
						var varParam = {
							"pjKey" : $('#pjKey').val()
						}
						var button = new Array;
						button = [];
						showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			    	} else {
			    		alert('프로젝트 실주 정보 등록이 실패했습니다.');
			    	}
			    },
				error: function(request, status, error) {
					if(request.status != '0') {
						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
					}
				} 
			});    
		}
		
		$(document).ready(function() {
			$('#remarkCnt').html("("+$("#remark").val().length+" / 500)");
			
			$('#remark').on('keyup', function() {
				$('#remarkCnt').html("("+$(this).val().length+" / 500)");
				
				if($(this).val().length > 500) {
					$(this).val($(this).val().substring(0, 500));
					$('#remarkCnt').html("(500 / 500)");
				}
			});
		});
	</script>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">실주 등록</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw300">
				<li>실주 정보</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<form id="infoForm" name='infoForm'>
					<input type="hidden" name="pjKey" id="pjKey" value="<c:out value="${pjKey}"/>"/>
					<input type="hidden" name="pjSjYn" id="pjSjYn" value="N" />
					<input type="hidden" name="pjStatusCd" id="pjStatusCd" value="PJST6000" />
					<table>
						<tr>
							<td class="tdTitle">프로젝트명</td>
							<td class="tdContents">
								<input type="text" class="pname"  value="<c:out value="${resultList[0].pjNm}"/>" readonly/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">작성자</td>
							<td class="tdContents">
								<input type="text" class="pname"  value="<c:out value="${resultList[0].empNm}"/>" readonly/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle veralignT">사유분석</td>
							<td class="tdContents">
								<textarea name="pjLoseCause" id="remark"><c:out value="${resultList[0].pjLoseCause}"/></textarea>
								<div id="remarkCnt">(0 / 500)</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="btnWrap">
				<div class="floatR">
					<button onclick="fn_save();"><img src="<c:url value='/images/btn_save.png'/>" /></button>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>