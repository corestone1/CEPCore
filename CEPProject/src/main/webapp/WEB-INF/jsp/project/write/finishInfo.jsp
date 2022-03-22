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
			height: 222px;
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
      	
      	#fileForm {
			position: absolute;
			left: 128px;
			z-index: 99;
			bottom: 93px;
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
			height: 51px;
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
		.move .moveSpan.right {
		    left: 15px;
		}
		.move .moveSpan.right::after {
			left: 18%;
		}
	</style>
	<script>	
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
			    						if($("#pjInspectDt").val() == null || $("#pjInspectDt").val() == "" || $("#pjInspectDt").val().length == 0) {
			    							alert("프로젝트 완료 정보가 등록되었습니다.");
			    							//countSave++;
			    						} else {
			    							alert("프로젝트 완료 정보가 수정되었습니다.")
			    						}
			    					} else {
			    						alert("첨부파일 저장이 실패하였습니다.");
			    					}
					    			
					    			var varParam = {
										"pjKey":$("#ipt_pjKey").val(),
										"workClass":$("#workClass").val()
					    			}
					    			
					    			fn_addView(varParam);

			    				}
			    			});  
			    		} else {
			    			if($("#pjInspectDt").val() == null || $("#pjInspectDt").val() == "" || $("#pjInspectDt").val().length == 0) {
					    		alert("프로젝트 완료 정보가 등록되었습니다.");
				    		} else {
				    			alert("프로젝트 완료 정보가 수정되었습니다.");
				    		}
			    			
			    			var varParam = {
								"pjKey":$("#ipt_pjKey").val(),
								"workClass":$("#workClass").val()
			    			}
			    			
			    			fn_addView(varParam);
			    		}
			    	} else {
			    		if($("#pjInspectDt").val() == null || $("#pjInspectDt").val() == "" || $("#pjInspectDt").val().length == 0) {
			    			alert("프로젝트 완료 정보 등록이 실패하였습니다.");
			    		} else {
			    			alert("프로젝트 완료 정보 수정이 실패하였습니다.");
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
		
		
		function fn_addView(varParam) {

			var url='/project/write/finishInfo.do';
			var dialogId = 'program_layer';
			var button = new Array;
			button = [];
			
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
		}
		
		
		function fn_prevView(){
			var url = '/project/write/orderInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey" : $('#ipt_pjKey').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
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
		
		function fn_downFile(fileKey, fileOrgNm) {
			var form = document.fileViewForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm; 
			var data = $('#fileViewForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data);  
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
			
			if($('input[name="pjInspectDt"]').val() != "" || $('input[name="pjInspectDt"]').val().length != 0) {
				$('.btnSave').children().eq(0).html('');
				$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />'); 
			}
			
			var fileTarget = $(".exFile");
			
			fileTarget.on('change', function() {
				var filename = $(this)[0].files[0].name;
				$(this).siblings('.uploadName').val(filename);
			});
		});
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
					<input type="hidden" id="ipt_pjKey" name="pjKey" value="<c:out value="${pjKey}"/>"/>
					<input type="hidden" id="pjStatusCd" name="pjStatusCd" value="PJST5000" />
					<input type="hidden" id="workClass" name="workClass" value="완료_첨부파일" />
					<input type="hidden" id="pjInspectDt" value="${resultList[0].pjInspectDt}" />
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
						<%-- <tr>
							<td class="tdTitle">검수확인서</td>
							<td>
								<button><img src="<c:url value='/images/btn_file_upload.png'/>" /></button>							
							</td>
							<td>
								<!-- <input type="text" class="pname" value="EDMS이미지 암호화 검수확인서.pdf" readonly> -->
							</td>
						</tr> --%>
						<tr>
							<td class="tdTitle veralignT">비고</td>
							<td class="tdContents"  colspan="2">
								<textarea name="finishRemark" id="remark"><c:out value="${resultList[0].finishRemark}"/></textarea>
								<div id="remarkCnt">(0 / 500)</div>
							</td>
						</tr>
					</table>
				</form>
				<form id="fileForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="docTypeNm" value="완료_첨부파일" />
					<input type="hidden" name="fileCtKey" id="fileCtKey" value="${pjKey }" />
					<input type="hidden" name="spBusiNm" id="fileSpBusiNm" value="${resultList[0].pjNm }" />
					<input type="hidden" name="archFileCnt" id="archFileCnt" title="첨부된갯수" value="${fn:length(fileList) }" />
					<input type="hidden" name="maxFileCnt" id="maxFile" title="첨부가능최대갯수" value="${maxFileCnt }" />
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
				<div class="floatL btnPrev">
					<button type="button" class="move" onclick="fn_prevView();">
						<img src="<c:url value='/images/btn_prev.png'/>" />
						<span class="moveSpan right">저장/수정하지 않은 정보는<br>반영되지 않습니다.</span>
					</button>
				</div>
				<c:set var="systemName" value='<%=session.getAttribute("name") %>'/>
				<c:set var="mngName" value="${resultList[0].empNm }" />
				<c:if test="${systemName eq mngName }">
					<div class="floatL btnSave">
						<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
				</c:if>
				<div class="floatN floatC"></div>
			</div>
		</div>
	</div>
</body>
</html>