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
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
	  		width: 100%;
		}
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
			height: 113px;
			border: 1px solid #e9e9e9;
			padding: 10px;
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
			width: 13%;
		}
		.popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
		}
		.popContainer .contents td.tdContents {
			width: 87%;
			font-size: 14px;
		} 
		.ui-datepicker.ui-widget-content {
			z-index: 102 !important;
		 }
		 .btnSave {
		 	width: calc(100% - 386px);
		 	float: left;
		 	text-align: right;
		 }
		#fileForm {
			position: absolute;
			left: 241px;
			z-index: 99;
			top: 625px;
			width: 330px;
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
			font-size: 12px; 
			font-weight: 200;
			font-family: inherit; 
			line-height: normal; 
			vertical-align: middle; 
			border: 1px solid #ebebeb; 
			width: 184px;
			height: 26px;
		}
		#fileForm .exFile {
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip: rect(0,0,0,0);
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
			height: 41px;
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
		#m_div_accountList {
			left: 152px;
    		margin-top: 38px;
		}
		#sp_delete_forecast {
			position: absolute;
		    right: 40px;
		    top: 20px;
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
			    if("pjStartDt" == formData[i]['name'] || "pjEndDt" == formData[i]['name']) {
                	//날짜 - 제거
                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
                } else {
                	object[formData[i]['name']] = formData[i]['value'];
                }     
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
			    		if($(".uploadName").val() != null && $(".uploadName").val() != "" && $(".uploadName").length != 0) {
			    			if($("#pjKey").val() == null || $("#pjKey").val() == "" || $("#pjKey").val().length == 0) {
				    			$("#fileCtKey").val(response.pjKey);
				    			$("#filePjNm").val($("#pjNm").val());
				    		}
			    			
			    			var formData = new FormData($('#fileForm')[0]); 
			       			
			    			$.ajax({ 
			       				type: "POST", 
			       				enctype: 'multipart/form-data',  
			       				url: '/file/upload.do', 
			       				data: formData, // 필수 
			       				processData: false, // 필수 
			       				contentType: false, // 필수 
			       				cache: false, 
			       				success: function (data) { 
			       					if(data.successYN=='Y') {
			       						if($("#pjKey").val() == null || $("#pjKey").val() == "" || $("#pjKey").val().length == 0) {
			    				    		alert('프로젝트 기본 정보가 저장되었습니다.');
			    				    		countSave++;
			    				    		
			    			    		} else {
			    			    			alert('프로젝트 기본 정보가 수정되었습니다.');
			    			    		}
			       					} else {
			       						alert("첨부파일 저장이 실패하였습니다.(프로젝트 기본 정보는 저장은 완료)");
			       					}
			       					
			       					$('#newKey').val(response.pjKey);
			       					var url='/project/write/basicInfo.do';
		    		    			var dialogId = 'program_layer';
		    		    			var varParam = {
		    							"pjKey":$("#newKey").val(),
		    							"workClass":$("#workClass").val()
		    		    			}
		    		    			var button = new Array;
		    		    			button = [];
		    		    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			       				}, 
			       				error: function(request, status, error) {
			       					if(request.status != '0') {
			       						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			       					}
			       				} 
			       			});
			    		} else {
			    			if($("#pjKey").val() == null || $("#pjKey").val() == "" || $("#pjKey").val().length == 0) {
				    			alert("프로젝트 기본 정보가 저장되었습니다.");
				    		} else {
				    			alert("프로젝트 기본 정보가 수정되었습니다.");
				    		}
			    			
			    			var url='/project/write/basicInfo.do';
    		    			var dialogId = 'program_layer';
    		    			var varParam = {
    							"pjKey":response.pjKey,
    							"workClass":$("#workClass").val()
    		    			}
    		    			var button = new Array;
    		    			button = [];
    		    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			    		}
			    		
			    		
			    	} else {
			    		if($("#pjKey").val() == null || $("#pjKey").val() == "" || $("#pjKey").val().length == 0) {
			    			alert("프로젝트 기본 정보 저장이 실패하였습니다.");
			    		} else {
			    			alert("프로젝트 기본 정보 수정이 실패하였습니다.");
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
	
		function fn_next(link) {
			if(countSave > 0) {
				var url = '/project/write/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
						"pjKey": $("#newKey").val(),
						"workClass":"입찰_첨부파일"
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:673px');
			}
			else {
				if($('#pjKey').val() != "" || $('#pjKey').val().length != 0) {
					var url = '/project/write/'+link+'.do';
					var dialogId = 'program_layer';
					var varParam = {
							"pjKey": $("#pjKey").val(),
							"workClass":"입찰_첨부파일"
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:673px');
				} else {
					alert('기본정보는 필수 입력값입니다. 정보 입력 후 저장을 해주세요.');
				}
			}
		}
		
		var acDirectorList;
		
		$(document).ready(function() {
			
			$('#remarkCnt').html("("+$("#remark").val().length+" / 500)");
			
			$('#remark').on('keyup', function() {
				$('#remarkCnt').html("("+$(this).val().length+" / 500)");
				
				if($(this).val().length > 500) {
					$(this).val($(this).val().substring(0, 500));
					$('#remarkCnt').html("(500 / 500)");
				}
			});
			
			$("#acNm, #salesAcNm").on("keyup", function(event){
				fn_searchAccoutList(this, $(this).val());				
			}); 
			
			if($('#pjKey').val() != "" || $('#pjKey').val().length != 0) {
				$('.btnSave').children().eq(0).html('');
				$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />'); 
			}
			
			var fileTarget = $(".exFile");
			
			fileTarget.on('change', function() {
				var filename = $(this)[0].files[0].name;
				$(this).siblings('.uploadName').val(filename)
			});
			
			
			$("input").on("input keydown", function() {
				if($("#spKey").val().length == 0) {
					fn_forecastPop();
					$(this).val('');
				}
			});
			
			$("#pjSaleEmpKey option").not(":selected").attr("disabled", "disabled");

		});
		
		$(function() {
			if(!($('#acKey').val() == "")) {
				fn_selectAc();
			}
			
			/* 고객사 선택하면 고객담당자 정보 가져오기. */
			/* $('#acKey').on("change", function(){		
				fn_selectAc();
			});  */
			
			/* 고객담당자 선택하면 고객담당자 정보 변경하기  */			
			$('#acDirectorKey').change(function(){
				var checkVal = $('#acDirectorKey option:selected').val();
				
				if(acDirectorList.length>0){
					for ( var idx = 0 ; idx < acDirectorList.length ; idx++ ) {
						if(checkVal == acDirectorList[idx].acDirectorKey ){
							$('#acDirectorInfo').val(acDirectorList[idx].acDirectorInfo);
							break;
						}
					}					
				}				
			});
		});
		
		function fn_searchAccoutList(pObject, pstAccountNm) {
			$('#m_div_accountList').remove();
		
			if(pObject.id.includes("sales")) {
				var jsonData = {'acNm' : pstAccountNm, 'acSalesYN' : 'Y' };
			} else {
				var jsonData = {'acNm' : pstAccountNm };
			}
			
			 $.ajax({
		        	url :"/mngCommon/account/searchList.do",
		        	type:"POST",  
		            data: jsonData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		//alert(data.accountList[0].acNm);
		        		//선택 목록 생성
		        		fnViewAccountList(pObject, data.accountList);
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    }); 
		}
	
		function fnViewAccountList(pObject, pjAccountList) {
			
			var html = '<div id="m_div_accountList">'
			         + '<ul class="accountList">'
			       ;
			       
	        for(var i=0; i < pjAccountList.length; i++)
	    	{
	    	   html += '<li id="m_li_account" title="'+ pjAccountList[i].acKey +'">' + pjAccountList[i].acNm + '</li>'
	    	        ;
	    	} 
			       
			       
			html +=  '</ul>'
			     + '</div>'
			     ;//+ '</div>';
			//$('#m_td_account').after(html);
			$(pObject).parent().after(html);
			
			$("[id^='m_li_account']").click(function(event)
			{
				//alert(this.title);
				
				$(pObject).next().val(this.title); 
				$(pObject).val(this.innerText);
				if(!pObject.id.includes("sales")) {
					fn_selectAc();
				}
				
				$('#m_div_accountList').remove();
			});
			
		}
			
			
		function fn_selectAc() {
			 $.ajax({
	        	url:"/cmm/selectAcDirectorList.do",
	            dataType: 'json',
	            type:"post",  
	            data: $('#acKey').val(),
	     	   	contentType: "application/json; charset=UTF-8",
	     	  	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);
	        		//xhr.setRequestHeader(header, token);
	        	},
	            success:function(data){		            	
					if ( data.result.length > 0 ) {
						acDirectorList = data.result;
						/* $('#acDirectorInfo').val(data.result[0].acDirectorInfo); *//* 첫번째 값을 셋팅해준다. */
						$ ('#acDirectorKey' ).find ( 'option' ).remove ();  
						for ( var idx = 0 ; idx < data.result.length ; idx++ ) {
							if(data.result[idx].acDirectorKey == "${resultList[0].acDirectorKey}") {
								$('#acDirectorKey').append("<option value='"+data.result[idx].acDirectorKey+"' selected>" + data.result[idx].acDirectorNm + '</option>');
								$('#acDirectorInfo').val(data.result[idx].acDirectorInfo);
							} else {
								$('#acDirectorKey').append("<option value='"+data.result[idx].acDirectorKey+"'>" + data.result[idx].acDirectorNm + '</option>');
								$('#acDirectorInfo').val(data.result[0].acDirectorInfo);
							}
						}
	                } else{
	                	acDirectorList = null;
						$ ( '#acDirectorKey' ).find('option').remove();
	                 	$ ( '#acDirectorKey' ).append ( "<option value=''>담당자</option>" );
	                }
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        });
		}
		
		function fn_downFile(fileKey, fileOrgNm) {
			var form = document.viewForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm; 
			var data = $('#viewForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data);  
		}
		
		function fn_deleteFile(fileKey, fileNm) {
			var result = confirm("첨부파일 " + fileNm + " 을 삭제하시겠습니까?");
			if(result) {
				var form = document.viewForm;
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
		
		//Forecast연계
		function fn_forecastPop() {
			//window.open('/forecast/popup/searchList.do?returnType=F&returnKey=mtLinkCtKey&returnNm=mtLinkCtKeyNm&pjFlag=M','FORECAST_LIST','width=1000px,height=713px,left=600');
			window.open('/forecast/popup/searchList.do?returnType=F&returnFunctionNm=pop_forecastCall&pjFlag=P&spState=S','FORECAST_LIST','width=1372px,height=713px,left=600');
		}
		
		function pop_forecastCall(returnKey,returnNm) {
	        $.ajax({
	        	url:"/project/selectForecastMappingInfo.do",
	            dataType: 'json',
	            type:"post",  
	            data: returnKey,
	     	   	contentType: "application/json; charset=UTF-8",
	     	  	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);
	        		//xhr.setRequestHeader(header, token);
	        	},
	            success:function(data){
	            	$("#spKey").val(data.forecastVO.spKey);
            		$('#pjNm').val(data.forecastVO.spBusiNm);
            		$('#acKey').val(data.forecastVO.acKey);
            		$('#acNm').val(data.forecastVO.mfAcNm);
            		$("#salesAcNm").val(data.forecastVO.salesAcNm);
            		$("#salesAcKey").val(data.forecastVO.salesAcKey);
            		$("#pjSaleEmpKey").val(data.forecastVO.regEmpKey);
            		
            		fn_selectAc();
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        });				
				
			$('#spKey').val(returnKey);
			$('#sp_delete_forecast').removeClass('dpNone');
			
		}
		
		function fn_deleteForecast() {
			if(confirm("FORECAST 연계정보를 삭제하시겠습니까?")) {
				$('#spKey').val('');
				$('#pjNm').val('');
        		$('#acKey').val('');
        		$('#acNm').val('');
        		$('#acDirectorKey').val('');
        		$('#acDirectorInfo').val('');
        		$("#salesAcKey").val('');
        		$("#salesAcNm").val('');
        		
        		$("#pjSaleEmpKey option:eq(0)").prop("selected", true);
        		
				$('#sp_delete_forecast').addClass('dpNone');
			} else {
				return false;
			}
			
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
				<!-- <input type="text" id="id" style="border: 1px solid #000; width: 200px;"/>
				<input type="text" id="no" style="border: 1px solid #000; width: 200px;"/> -->
				<input type="hidden" id="dialogId" />
				<input type="hidden" id="spKey" name="spKey" value="${resultList[0].spKey }"/>
				<input type="hidden" id="pjKey" name="pjKey" value="<c:out value="${pjKey}"/>"/>
				<input type="hidden" id="workClass" name="workClass" value="프로젝트"/>
				<input type="hidden" id="newKey" name="newKey" value="<c:out value=""/>"/>
				<img class="dpNone" id="sp_delete_forecast" src="<c:url value='/images/btn_del_gray.png'/>" onclick="fn_deleteForecast();" />
				<div style="min-height: 529px;">  
					<table>
						<tr>
							<c:choose>
								<c:when test="${pjKey eq null or pjKey eq ''}">
									<td class="btnFc" colspan="2"><button type="button" onclick="javascript:fn_forecastPop();"><img src="<c:url value='/images/forecast_icon.png'/>" /></button></td>
								</c:when>
								<c:otherwise>
									<td>
										<div style="width: 100px; line-height: 48px; font-size: 27px;"></div>
									</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>프로젝트명</td>
							<td class="tdContents"><input type="text" name="pjNm" id="pjNm" value="<c:out value="${resultList[0].pjNm}"/>" required/></td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>고객사</td>
							<td class="tdContents" id="m_tr_account">
								<input type="text" class="search" name="acNm" id="acNm" value="<c:out value="${resultList[0].acNm}"/>" required autocomplete="off" />	
								<input type="hidden" name="acKey" id="acKey" value="<c:out value="${resultList[0].acKey}"/>" />	
							</td>
						</tr>
						<tr>
							<td class="tdTitle">고객사담당자</td>
							<td class="tdContents">
								<select name="acDirectorKey" id="acDirectorKey">
									<%-- <c:forEach var="emp" items="${empList}" varStatus="status">
										<option <c:if test="${resultList[0].acDirectorKey == emp.empKey }">selected</c:if> value="${emp.empKey}">${emp.empNm}</option>
									</c:forEach>  --%>
								</select>				
								<input type="text" class="pname"  id="acDirectorInfo" value="<c:out value="${resultList[0].acDirectorInfo }" />" readonly/>
							</td>
						</tr>
						<%-- <tr>
							<td class="tdTitle"><label>*</label>매출처</td>
							<td class="tdContents" id="m_tr_account">
								<input type="text" class="search" name="salesAcNm" id="salesAcNm" value="<c:out value="${resultList[0].salesAcNm}"/>" required autocomplete="off" style="width: 178px" />	
								<input type="hidden" name="salesAcKey" id="salesAcKey" value="<c:out value="${resultList[0].salesAcKey}"/>" />	
							</td>
						</tr> --%>
						<tr>
							<td class="tdTitle"><label>*</label>영업담당자</td>
							<td class="tdContents">
								<select name="pjSaleEmpKey" id="pjSaleEmpKey">
									<c:forEach var="emp" items="${empList}" varStatus="status">										
										<option <c:choose><c:when test="${resultList[0].pjSaleEmpKey eq null }"><c:if test="${empKey == emp.empKey }">selected</c:if></c:when> <c:otherwise><c:if test="${resultList[0].pjSaleEmpKey == emp.empKey}">selected</c:if></c:otherwise></c:choose> value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
										<%-- <c:if test="${empKey == emp.empKey }">selected</c:if> --%>
									</c:forEach>	
								</select>  
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>지원담당자</td>
							<td class="tdContents">
								<select name="pjSupportEmpKey">
									<c:forEach var="emp" items="${empList}" varStatus="status">										
										<option <c:if test="${resultList[0].pjSupportEmpKey == emp.empKey }">selected</c:if> value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
									</c:forEach>	
								</select>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>사업기간</td>
							<td class="tdContents">
								<input type="text" placeholder="from" class="calendar fromDt" name="pjStartDt" value="<c:out value="${displayUtil.displayDate(resultList[0].pjStartDt)}"/>" required/> 
								&nbsp;<img class="veralignM" src="/images/icon_fromTo.png" />&nbsp;
								<input type="text" placeholder="to" class="calendar toDt" name="pjEndDt" value="<c:out value="${displayUtil.displayDate(resultList[0].pjEndDt)}"/>" required/>
							</td>
						</tr>
						<%-- <tr>
							<td class="tdTitle"><label>*</label>계약일자</td>
							<td class="tdContents">
								<c:set var="today" value="<%=new java.util.Date()%>" />
								<c:set var="now"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set> 
								<input type="text" class="calendar fromDt" name="ctDt" 
									value="<c:choose><c:when test="${resultList[0].ctDt eq null || resultList[0].ctDt eq '' }">${now }</c:when><c:otherwise>${displayUtil.displayDate(resultList[0].ctDt)}</c:otherwise></c:choose>" required/>
							</td>
						</tr> --%>
						<tr>
							<td class="tdTitle veralignT">비고</td>
							<td class="tdContents">
								<textarea name="remark" id="remark"><c:out value="${resultList[0].remark}" /></textarea>
								<div id="remarkCnt" class="ftw200">(0 / 500)</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="btnWrap floatR">
					<c:set var="systemName" value='<%=session.getAttribute("name") %>'/>
					<c:set var="mngName" value="${resultList[0].empNm }" />
					<c:choose>
						<c:when test="${pjKey eq null}">
							<div class="floatL btnSave">
								<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
							</div>
						</c:when>
						<c:otherwise>
							<c:if test="${systemName eq mngName }">
								<div class="floatL btnSave">
									<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>
					<div class="floatR">
						<button type="button" class="move" onclick="javascript:fn_next('contractInfo')" data-tooltip-text="저장/수정하지 않은 정보는<br>반영되지 않습니다.">
							<img src="<c:url value='/images/btn_next.png'/>" />
							<span class="moveSpan">저장/수정하지 않은 정보는<br>반영되지 않습니다.</span>
						</button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</div>
	</form:form>
	<form id="fileForm" method="post" enctype="multipart/form-data"> 
    	<!-- <button type="button" id="add" style="border: 1px solid #000; padding: 5px 10px; ">추가</button><br /> -->
		<input type="hidden" name="docTypeNm" value="프로젝트" />
		<input type="hidden" name="fileCtKey" id="fileCtKey" value="${projectVO.pjKey}" />
		<input type="hidden" name="pjNm" id="filePjNm" value="<c:out value="${resultList[0].pjNm}"/>"/> 
		<input type="hidden" name="atchFileCnt" id="atchFileCnt" title="첨부된갯수" value="${fn:length(fileList)}" />
		<input type="hidden" name="maxFileCnt" id="maxFileCnt" title="첨부가능최대갯수" value="<c:out value='${maxFileCnt}'/>" />
		<input type="hidden" name="maxFileSize" id="maxFileSize" title="파일사이즈" value="<c:out value='${maxFileSize}'/>" />
		<div class="floatL uploadContainer">
			<input class="uploadName" placeholder="파일선택" disabled="disabled" />
			<label for="exFile" class="exFileLabel"></label>
			<input type="file" id="exFile" class="exFile" multiple="multiple" name="file"/>
		</div>
		<div style="width: 307px; clear:both;" id="fileWrap">
			<c:forEach var="result" items="${fileList }" varStatus="status">
				<input class="upload-name cursorP ftw200" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/>
				<a class="close cursorP" onclick="fn_deleteFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm }" />')"><img src="/images/btn_close.png" /></a>
				<c:if test="${status.last eq false}"><br /></c:if>
			</c:forEach>
		</div>
		<!-- <button type="button" id="save" style="border: 1px solid #000; padding: 5px 10px;">저장</button> -->
	</form>
	<form:form id="viewForm" name="viewForm" method="POST">
		<input type="hidden" name="fileKey" value=""/>
		<input type="hidden" name="fileOrgNm" value=""/>
	</form:form>
</body>
</html>