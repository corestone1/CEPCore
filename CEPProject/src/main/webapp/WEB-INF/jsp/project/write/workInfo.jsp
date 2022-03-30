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
			margin: 10px 40px 8px 40px;
		}
		.popContainer .contents > div:first-child {
			min-height: 511px;
		}
		.popContainer .contents > div:nth-child(2) {
			margin-top: 0;
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
			height: 84px;
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
      	#fileForm {
			position: absolute;
			right: 12px;
			z-index: 99;
			bottom: 4px;
			width: 359px;
		}
		
		#fileForm .exFileLabel {
			background-image: url('/images/btn_file_upload.png');
			background-repeat: no-repeat;
			width: 119px;
			height: 31px;
			cursor: pointer;
			float: left;
			margin-top: 1px;
			margin-right: 7px;
		}
		
		#fileForm .uploadName {
			font-size: 12px !important;
			font-weight: 200;
			font-family: inherit !important;
			line-height: normal;
			vertical-align: middle;
			border: 1px solid #ebebeb !important;
			width: 184px !Important;
			height: 31px !important;
		}
		
		#fileForm .exFile {
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip: rect(0, 0, 0, 0);
			border: 0;
		}
		
		#fileForm .upload-name {
			background: transparent;
			border: none;
			font-size: 13px;
			width: 160px;
			height: 17px;
			text-overflow: ellipsis;
		}
		
		#fileForm .upload-name:hover {
			text-decoration: underline;
		}
		
		#fileForm .close {
			vertical-align: middle;
		}
		
		#fileWrap {
			height: 35px;
			overflow-y: auto;
		}
		
		#fileWrap::-webkit-scrollbar-button {
			width: 0;
			height: 0;
		}
		
		#fileWrap::-webkit-scrollbar-thumb {
			border-radius: 3px;
			background-color: #7F7F7F;
			height: 3px;
		}
		
		#fileWrap::-webkit-scrollbar-track {
			background-color: transparent;
		}
		
		#fileWrap::-webkit-scrollbar {
			width: 6px;
			height: 31px;
		}

	</style>
	<script>
		$(document).ready(function() {
			$("input:radio[name='pjWorkClassCd']:radio[value='${resultList[0].pjWorkClassCd}']").prop('checked', true);	
		
			if($('input[id=selectKey]').val() != "" || $('input[id=selectKey]').val().length != 0) {
				$('.btnSave').children().eq(0).html('');
				$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />'); 
			}
			
			$("#projectConnect").click(function() {
				window.open('/project/popup/list.do?returnType=F&returnFunctionNm=pop_projectCall&pjFlag=P', 'PROJECT_LIST', 'width=750px,height=600px,left=600');
			});
			
			var fileTarget = $(".exFile");
			
			fileTarget.on('change', function() {
				var filename = $(this)[0].files[0].name;
				$(this).siblings('.uploadName').val(filename);
			});
			
			$('#remarkCnt1').html("("+$("#ct_remark").val().length+" / 2000)");
			$('#remarkCnt2').html("("+$("#rs_remark").val().length+" / 2000)");
			$('#remarkCnt3').html("("+$("#etc_remark").val().length+" / 2000)");
			
			$('#ct_remark').on('keyup', function() {
				$('#remarkCnt1').html("("+$(this).val().length+" / 2000)");
				
				if($(this).val().length > 2000) {
					$(this).val($(this).val().substring(0, 2000));
					$('#remarkCnt1').html("(2000 / 2000)");
				}
			});
			
			$('#rs_remark').on('keyup', function() {
				$('#remarkCnt2').html("("+$(this).val().length+" / 2000)");
				
				if($(this).val().length > 2000) {
					$(this).val($(this).val().substring(0, 2000));
					$('#remarkCnt2').html("(2000 / 2000)");
				}
			});
			
			$('#etc_remark').on('keyup', function() {
				$('#remarkCnt3').html("("+$(this).val().length+" / 2000)");
				
				if($(this).val().length > 2000) {
					$(this).val($(this).val().substring(0, 2000));
					$('#remarkCnt3').html("(2000 / 2000)");
				}
			});
		});
		
		function pop_projectCall(returnKey,returnNm) {
			$.ajax({
	        	url:"/project/selectProjectMappingInfo.do",
	            dataType: 'json',
	            type:"post",  
	            data: returnKey,
	     	   	contentType: "application/json; charset=UTF-8",
	     	  	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);
	        		//xhr.setRequestHeader(header, token);
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
			})
		}
		
		function fn_chkVali() {
            if ($("#infoForm")[0].checkValidity()){
               //필수값 모두 통과하여 저장 프로세스 호출.
               if($(".uploadName").val() != null && $(".uploadName").val().length != 0) {
            	   var maxSize = 20 * 1024 * 1024;
            	   var fileSize = $("#exFile")[0].files[0].size;
            	   
            	   if(fileSize > maxSize) {
            		   alert("첨부파일 사이즈는 20MB 이내로 등록 가능합니다.");
            		   return false;
            	   } else {
            		   fn_save();
            	   }
               } else {
            	   fn_save();
               }
            } else {
                $("#infoForm")[0].reportValidity();   
            }            
	            
		}
		
		var countSave = 0;
		
		function fn_save() {
			$(".timeInfo").each(function() {
				if($(this).val().length < 2) {
					$(this).val("0" + $(this).val());
				}
			});
			
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
				    		if($(".uploadName").val() != null && $('.uploadName').val().length != 0) {
				    			
				    			var formData = new FormData($("#fileForm")[0]);

				    			$.ajax({
				    				type:"POST",
				    				enctype:'multipart/form-data',
				    				url:'/file/upload.do',
				    				data:formData,
				    				processData:false,
				    				contentType:false,
				    				cache:false,
				    				success:function(data) {
				    					if(data.successYN == 'Y') {
				    						if($("#bdKey").val() == null || $("#bdKey").val() == "" || $("#bdKey").val().length == 0) {
				    							alert("프로젝트 수행일지 정보가 등록되었습니다.");
				    							//countSave++;
				    						} else {
				    							alert("프로젝트 수행일지 정보가 수정되었습니다.")
				    						}
				    					} else {
				    						alert("첨부파일 저장이 실패하였습니다.");
				    					}
						    			
						    			var workSeq = $("#selectKey").val();
						    			var varParam = {
											"pjKey":$("#m_pjKey").val(),
											"pjWorkSeq":workSeq,
											"workClass":$("#workClass").val()
						    			}
						    			
						    			fn_addView(varParam);
				    				}
				    			});  
				    		} else {
				    			if($("#selectKey").val() == null || $("#selectKey").val() == "" || $("#selectKey").val().length == 0) {
						    		alert("프로젝트 수행일지 정보가 등록되었습니다.");
						    		$("#selectKey").val(response.workSeq);
					    		} else {
					    			alert("프로젝트 수행일지 정보가 수정되었습니다.");
					    		}
				    			
				    			var workSeq = $("#selectKey").val();
				    			var varParam = {
									"pjKey":$("#m_pjKey").val(),
									"pjWorkSeq":workSeq,
									"workClass":$("#workClass").val()
				    			}
				    			
				    			fn_addView(varParam);
				    		}
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
	
		function fn_addView(varParam) {

			var url='/project/write/workInfo.do';
			var dialogId = 'program_layer';
			var button = new Array;
			button = [];
			
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
		}
		
		
		function fn_downFile(fileKey, fileOrgNm) {
			var form = document.fileViewForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm; 
			var data = $('#fileViewForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data);  
		}
		
		
		function fn_deleteFile(fileKey, fileNm) {
			var result = confirm("첨부파일 " + fileNm + " 을 삭제하시겠습니까?");
			if(result) {
				var form = document.fileViewForm;
				form.fileKey.value = fileKey;
				var data = JSON.stringify({"fileKey":fileKey});
				$.ajax({ 
	   				url: '/file/delete.do', 
	   				dataType:'json',
	   				type: "POST", 
	   				data: data, // 필수 
	   				contentType: "application/json; charset=UTF-8", 
	   				success: function (response) { 
		   				if(response.successYN=='Y') {
							alert('첨부파일이 삭제되었습니다.');
							$("#file"+fileKey).next().next().remove();
							$("#file"+fileKey).next().remove();
							$("#file"+fileKey).remove();
						} else {
							alert('첨부파일 삭제가 실패되었습니다.');
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
			<ul class="ftw400">
				<li class="colorWhite cursorP on">수행일지</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<form id="infoForm" name="infoForm" method="post">
					<input type="hidden" id="m_pjKey" name="pjKey" value="<c:out value="${pjKey}"/>" />
					<input type="hidden" id="resultList" value="<c:out value="${resultList}"/>" />
					<input type="hidden" id="selectKey" name="selectKey" value="<c:out value="${resultList[0].pjWorkSeq}"/>" />
					<input type="hidden" id="pjStatusCd" name="pjStatusCd" value="<c:out value="${resultList[0].pjStatusCd}"/>" />
					<input type="hidden" name="statusCd" value="PJST4000" />
					<input type="hidden" name="workClass" id="workClass" value="수행_첨부파일" />
 					<table>
						<tr>
							<td class="tdTitle">프로젝트</td>
							<td class="tdContents">
								<!-- <button type="button" onclick="javascript:fn_projectPop();"><img src="/images/project_icon.png" /></button> -->
								<input type="text" id="projectConnect" name="pjNm" value="${resultList[0].pjNm }" readOnly />
							</td>
						</tr>
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
							<td class="tdContents"><textarea name="pjWorkCont" id="ct_remark" required><c:out value="${resultList[0].pjWorkCont}"/></textarea><div id="remarkCnt1">(0 / 2000)</div></td>
						</tr>
						<tr>
							<td class="tdTitle veralignT"><label>*</label>처리결과</td>
							<td class="tdContents"><textarea name="pjWorkResult" id="rs_remark" required><c:out value="${resultList[0].pjWorkResult}"/></textarea><div id="remarkCnt2">(0 / 2000)</div></td>
						</tr>
						<tr>
							<td class="tdTitle veralignT">기타</td>
							<td class="tdContents"><textarea name="remark" id="etc_remark"><c:out value="${resultList[0].remark}"/></textarea><div id="remarkCnt3">(0 / 2000)</div></td>
						</tr>
						<%-- <tr>
							<td class="tdTitle">첨부파일</td>
							<td class="tdContents">
								<button><img src="<c:url value='/images/btn_file_upload.png'/>" /></button>
							</td>
						</tr>	 --%>		
					</table>
				</form>
				<form id="fileForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="docTypeNm" value="수행_첨부파일" />
					<input type="hidden" name="fileCtKey" id="fileCtKey" value="${pjKey } " />
					<input type="hidden" name="spBusiNm" id="fileSpBusiNm" value="${resultList[0].pjNm }"  />
					<input type="hidden" name="atchFileCnt" id="atchFileCnt" title="첨부된갯수" value="${fn:length(fileList) }" />
					<input type="hidden" name="maxFileCnt" id="maxFileCnt" title="첨부가능최대갯수" value="${maxFileCnt }" />
					<input type="hidden" name="maxFileSize" id="maxFileSize" title="파일사이즈" value="${maxFileSize }" />
					<div class="floatL uploadContainer">
						<input class="uploadName" placeholder="" disabled="disabled" /> 
						<label for="exFile" class="exFileLabel"></label> 
						<input type="file" id="exFile" class="exFile" multiple="multiple" name="file" />
					</div>
					<div style="width: 307px; clear: both;" id="fileWrap">
						<c:forEach var="result" items="${fileList }" varStatus="status">
							<input class="upload-name cursorP ftw200" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly />
							<a class="close cursorP" onclick="fn_deleteFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm }" />')">
								<img src="/images/btn_close.png" />
							</a>
							<c:if test="${status.last eq false}">
								<br />
							</c:if>
						</c:forEach>
					</div>
				</form>
				<form:form id="fileViewForm" name="fileViewForm" method="POST">
					<input type="hidden" name="fileKey" value="" />
					<input type="hidden" name="fileOrgNm" value="" />
				</form:form>
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