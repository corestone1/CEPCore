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
			height: 600px;
			top: 107px;
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto; 
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
			width: 115px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class^="tdRate"] {
			width: 115px;
			height: 38px;
			background-repeat: no-repeat;
			background-position: 95% 50%;
			text-align: right;
		}
		.popContainer .contents input[class^="readOnly"] {
			background-color: #f6f7fc; 
			border-color: #f6f7fc;
		}
		.popContainer .contents input[class^="readOnlyDt"] {
			width: 87px;
			height: 38px;
			background-color: #f6f7fc; 
			border-color: #f6f7fc;
		}
		
		
		/* .popContainer .contents textarea {
			width: 433px;
			height: 48px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		} */
		.popContainer .contents td.tdContents {
			font-size: 14px;
			width : 301px
		} 
		
		.popContainer td.tdTitle {
			font-size: 14px;
			width : 140px;
		}
		
		.accountList li {
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
			font-size: 14px;
			color: #21a17e;
		}
		
		
		.popContainer .contents textarea {
			width: calc(100% - 13px);
			height: 106px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: vertical;
		}
		
		.popContainer td.tdTitle label {
			color: red;
		}

	/* 파일업로드 관련 */
		#fileForm {
			/* position: absolute; */
			bottom: 75px;;
			left: 41px;
			z-index: 99;
			width:130%;
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
			height: 30px;
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
		#fileForm .close {
			vertical-align: middle;
		} 
		
	</style>
	
	
	<script>
				
		$(document).ready(function() {
			
			//파일 업로드
			var fileTarget = $(".exFile");
			
			fileTarget.on('change', function() {
				var filename = $(this)[0].files[0].name;
				$(this).siblings('.uploadName').val(filename)
			});
			
		});	
		
		function fn_chkVali() {
			console.log("upFileName==========>"+$("#upFileName").val()+"<=======");
			if($("#upFileName").val() == null || $("#upFileName").val() == "" || $("#upFileName").val().length == 0) {
				// 첨부파일이 없는 경우 return 값 true;
				
				return true;
			} else {
				if ($("#m_frm_gb")[0].checkValidity()){
					//필수값 모두 통과하여 저장 프로세스 호출.
					if($("#fileForm")[0].checkValidity()) {
						return fileCheck();
					} else {
						$("#fileForm")[0].reportValidity()
					}
	            } else {
	                $("#m_frm_gb")[0].reportValidity();   
	                return false;
	            }   
			}
                     
		}
		
		function fileCheck() {
			var maxSize = 20 * 1024 * 1024;
        	var fileSize = $("#exFile")[0].files[0].size;
        	   
			if(fileSize > maxSize){
				alert("첨부파일 사이즈는 20MB 이내로 등록 가능합니다.");
				return false;
			} else {
				return true;
			}
		}
		
		/* function fnGbPublish() {
			
			
			
			if($("#upFileName").val() == null || $("#upFileName").val() == "" || $("#upFileName").val().length == 0) {
				//첨부파일이 없는 경우.
				if ($("#m_frm_gb")[0].checkValidity()){
					fnGbPublish2();
				} else {
					//Validate Form
		              $("#m_frm_gb")[0].reportValidity();   
				}
			} else {
				//첨부파일이 존재하는 경우 첨부파일 싸이즈 체크.
				if($("#fileForm")[0].checkValidity()) {
					var maxSize = 20 * 1024 * 1024;
		        	var fileSize = $("#exFile")[0].files[0].size;
		        	   
					if(fileSize > maxSize){
						alert("첨부파일 사이즈는 20MB 이내로 등록 가능합니다.");
						return false;
					} else {
						if ($("#m_frm_gb")[0].checkValidity()){
							fnGbPublish2();
						} else {
							//Validate Form
				              $("#m_frm_gb")[0].reportValidity();   
						}
					}
				} else {
					$("#fileForm")[0].reportValidity()
				}
			}
		} */
		
		
		/* 보증증권 발행요청 */
		function fnGbPublish() {
			if(fn_chkVali()) {
				if ($("#m_frm_gb")[0].checkValidity()){
					var formData = $("#m_frm_gb").serializeArray();
					
					for(var i = 0; i < formData.length; i++)
					{
						//보증기간, 발행일
						if('gbStartDt'   == formData[i]['name']
						|| 'gbEndDt'     == formData[i]['name']
						|| 'gbPublishDt' == formData[i]['name']){
							formData[i]['value'] = removeData(formData[i]['value'], '-');
						}
						 
						//금액
						if('gbAmount' == formData[i]['name'] || "gbContractAmount" == formData[i]['name']){
							formData[i]['value'] = removeCommas(formData[i]['value']);
						}
						
						console.log(i+" : " + formData[i]['name'] + " : " + formData[i]['value']);
					}
					
					$.ajax({
			        	url :"/maintenance/contract/detail/requestGuarantyBond.do",
			        	type:"POST",  
			            data: formData,
			     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			     	    dataType: 'json',
			            async : false,
			        	success:function(data){		  
			        		/* if(data.gbKey !='' && data.gbKey.length >0) {
			        			alert("보증증권 발행이 요청되었습니다.!");
			        			//발행요청이 성공한 경우 발행증권 리턴받은 key값을 해당 필드에 입력한다.
			        			$("#m_ipt_gbKey").val(data.gbKey);
			        		} else {
			        			alert("보증증권 발행요청이 실패하였습니다.!");
			        		} */
			        		console.log("data.gbKey=========>"+data.gbKey);
			        		var mailList = "";
					    	if(data.mailList == "undefined" || data.mailList == null || data.mailList == "") {
					    		mailList = "";
					    	} else {
					    		mailList = "\n메일 수신인: " + data.mailList.join("\n");
					    	}
					    	
			        		if(data!= null && data.successYN == 'Y' ) {
			        			if($("#upFileName").val() != null && $("#upFileName").val() != "" && $("#upFileName").val().length != 0) {
			        				console.log("UPLOAD FILE..............=========>"+data.gbKey);
				        			$("#fileCtKey").val(data.gbKey);
				        			fileFormData = new FormData($('#fileForm')[0]); 
				        			$.ajax({ 
					       				type: "POST", 
					       				enctype: 'multipart/form-data',  
					       				url: '/file/upload.do', 
					       				data: fileFormData, // 필수 
					       				processData: false, // 필수 
					       				contentType: false, // 필수 
					       				cache: false, 
					       				success: function (data2) {
					       					if(data2.successYN=='Y') {
					       						//alert("보증증권 정보가 수정 되었습니다.!");			    			    		
					       						if(data2 != null && data2.successYN == 'Y' && data.mailSuccessYN == 'Y') {
										    		alert("보증 증권 발행이 요청되었습니다." + mailList);
										    	} else if(data2!= null && data2.successYN == 'Y' && data.mailSuccessYN == 'N') {
									    			alert("메일 전송이 실패했습니다.(발행 요청 정보 저장은 완료)");
										    	} else {
									    			alert("파일저장을 실패하였습니다.(발행 요청 정보 저장은 완료)");
										    	}
					       					} else {
					       						alert("파일저장을 실패하였습니다.(발행 요청 정보 저장은 완료)");
					       					}
					       					//현재는 파일저장이 실패해도 기본정보는 저장되도록 화면 이동시킴.
					       					var url2 = '/maintenance/contract/detail/viewStockPublishCT.do';
				    		    			var dialogId2 = 'program_layer';
				    		    			//첨부파일 workClass정보 추가.
				    		    			var varParam = {'mtIntegrateKey' : $('#m1_mtIntegrateKey').val(), 'bdKey' :data.gbKey};			    		    			
				    		    			var button2 = new Array;
				    		    			button2 = [];
				    		    			showModalPop(dialogId2, url2, varParam, button2, '', 'width:648px;height:700px');
					       				}, 
					       				error: function(request, status, error) {
					       					if(request.status != '0') {
					       						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
					       					}
					       				}
					       			});
				        			
				        		} else {
				        			if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'Y') {
							    		alert("보증 증권 발행이 요청되었습니다." + mailList);
							    	} else if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'N') {
						    			alert("메일 전송이 실패했습니다.(발행 요청 정보 저장은 완료)");
							    	} else {
						    			alert("보증 증권 발행이 실패하였습니다.");
							    	}
				        		}
			        		} else {
			        			alert("보증 증권 발행이 실패하였습니다.");
			        		}
			        		
			        		
			        		
					    	
					    	//location.reload();
			            },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
			    	});
				} else {
					//Validate Form
		              $("#m_frm_gb")[0].reportValidity();   
				}
			}	
						
		}
		
		
		
		function fnGbModify() {
			if(fn_chkVali()) {
				if ($("#m_frm_gb")[0].checkValidity()){
					var formData = $("#m_frm_gb").serializeArray();
					
					var jsonDate = {}; 
						
					for(var i = 0; i < formData.length; i++)
					{
						console.log(i+" : " + formData[i]['name'] + " : " + formData[i]['value']);
						//보증기간, 발행일
						if('gbStartDt'   == formData[i]['name']
						|| 'gbEndDt'     == formData[i]['name']
						|| 'gbPublishDt' == formData[i]['name']){
							
							jsonDate[formData[i]['name']]  = removeData(formData[i]['value'], '-');
						}
						else if('gbAmount' == formData[i]['name'] || "gbContractAmount" == formData[i]['name']){ //금액
							if(formData[i]['value'] == '') {
								//제거
							}
							else {
								jsonDate[formData[i]['name']]  = removeCommas(formData[i]['value']);
							}
								
						}
						else {                     
							jsonDate[formData[i]['name']]  = formData[i]['value'];
						}
							
						//console.log(i+" : " + jsonDate[i]['name'] + " : " + jsonDate[i]['value']);
					}
					console.log(" ======= \n " + jsonDate);
					//return;
					
					$.ajax({
			        	url :"/maintenance/contract/detail/modifyGuarantyBond.do",
			        	type:"POST",  
			            data: jsonDate,
			     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			     	    dataType: 'json',
			            async : false,
			        	success:function(data){		  
			        		console.log("data.successYN1==>"+data.successYN);
			        		$("#fileCtKey").val($("#m_ipt_gbKey").val());
			        		if("Y" == data.successYN){
			        			if($("#upFileName").val() != null && $("#upFileName").val() != "" && $("#upFileName").val().length != 0) {
			        				//업로드 파일을 선택한 경우 파일 업로드 프로세스 수행
			            			fileFormData = new FormData($('#fileForm')[0]); 
					       			$.ajax({ 
					       				type: "POST", 
					       				enctype: 'multipart/form-data',  
					       				url: '/file/upload.do', 
					       				data: fileFormData, // 필수 
					       				processData: false, // 필수 
					       				contentType: false, // 필수 
					       				cache: false, 
					       				success: function (data) {
					       					if(data.successYN=='Y') {
					       						alert("보증증권 정보가 수정 되었습니다.!");			    			    		
					       						
					       					} else {
					       						alert("첨부파일 저장이 실패하였습니다.")
					       					}
					       					//현재는 파일저장이 실패해도 기본정보는 저장되도록 화면 이동시킴.
					       					var url2 = '/maintenance/contract/detail/viewStockPublishCT.do';
				    		    			var dialogId2 = 'program_layer';
				    		    			//첨부파일 workClass정보 추가.
				    		    			var varParam = {'mtIntegrateKey' : $('#m1_mtIntegrateKey').val(), 'bdKey' : $('#gbKey').val()};			    		    			
				    		    			var button2 = new Array;
				    		    			button2 = [];
				    		    			showModalPop(dialogId2, url2, varParam, button2, '', 'width:648px;height:700px');
					       				}, 
					       				error: function(request, status, error) {
					       					if(request.status != '0') {
					       						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
					       					}
					       				}
					       			});
			        			} else {
			        				alert("보증증권 정보가 수정 되었습니다.!");
			        			}
			        			
			        			
			        		} else {
			        			alert("보증증권 정보 수정을 실패하였습니다.!");
			        		}
			        		
			            },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
			    	});
				} else {
					//Validate Form
		              $("#m_frm_gb")[0].reportValidity();   
				}
			}			
		}
		
		
		
		function fnGbEnd() {
			if(fn_chkVali()) { //파일 검증
				
				if ($("#m_frm_gb")[0].checkValidity()){
					var formData = $("#m_frm_gb").serializeArray();
					
					for(var i = 0; i < formData.length; i++)
					{
						//보증기간, 발행일
						if('gbStartDt'   == formData[i]['name']
						|| 'gbEndDt'     == formData[i]['name']
						|| 'gbPublishDt' == formData[i]['name']){
							formData[i]['value'] = removeData(formData[i]['value'], '-');
						}
						 
						//금액
						if('gbAmount' == formData[i]['name'] || "gbContractAmount" == formData[i]['name']){
							formData[i]['value'] = removeCommas(formData[i]['value']);
						}
						
						console.log(i+" : " + formData[i]['name'] + " : " + formData[i]['value']);
					}
					
					$.ajax({
			        	url :"/maintenance/contract/detail/endGuarantyBond.do",
			        	type:"POST",  
			            data: formData,
			     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			     	    dataType: 'json',
			            async : false,
			        	success:function(data){		  
			        		/* console.log("data.successYN==>"+data.successYN);
			        		if("Y" == data.successYN){
			        			alert("발행이  완료 처리되었습니다.!");
			        		} else {
			        			alert("발행이  실패 하였습니다.!");
			        		} */
			        		var mailList = "";
					    	if(data.mailList == "undefined" || data.mailList == null || data.mailList == "") {
					    		mailList = "";
					    	} else {
					    		mailList = "\n메일 수신인: " + data.mailList.join("\n");
					    	}
					    	
					    	if("Y" == data.successYN){
					    		if($("#upFileName").val() != null && $("#upFileName").val() != "" && $("#upFileName").val().length != 0) {
						    		$("#fileCtKey").val($("#m_ipt_gbKey").val());
						    		
						    		//업로드 파일을 선택한 경우 파일 업로드 프로세스 수행
			            			fileFormData = new FormData($('#fileForm')[0]); 
					       			$.ajax({ 
					       				type: "POST", 
					       				enctype: 'multipart/form-data',  
					       				url: '/file/upload.do', 
					       				data: fileFormData, // 필수 
					       				processData: false, // 필수 
					       				contentType: false, // 필수 
					       				cache: false, 
					       				success: function (data2) {
					       					
					       					
					       					if(data2!= null && data2.successYN == 'Y' && data.mailSuccessYN == 'Y') {
					       						alert("보증 증권이 완료처리 되었습니다." + mailList);
									    	} else if(data2!= null && data2.successYN == 'Y' && data.mailSuccessYN == 'N') {
								    			alert("메일 전송이 실패했습니다.(발행완료 처리 정보 저장은 완료)");
									    	} else {
									    		alert("파일저장을 실패하였습니다.(발행완료 처리 정보 저장은 완료)");								    			
									    	}
					       					
					       					//현재는 파일저장이 실패해도 기본정보는 저장되도록 화면 이동시킴.
					       					var url2 = '/maintenance/contract/detail/viewStockPublishCT.do';
				    		    			var dialogId2 = 'program_layer';
				    		    			//첨부파일 workClass정보 추가.
				    		    			var varParam = {'mtIntegrateKey' : $('#m1_mtIntegrateKey').val(), 'bdKey' : $('#gbKey').val()};			    		    			
				    		    			var button2 = new Array;
				    		    			button2 = [];
				    		    			showModalPop(dialogId2, url2, varParam, button2, '', 'width:648px;height:700px');
					       				}, 
					       				error: function(request, status, error) {
					       					if(request.status != '0') {
					       						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
					       					}
					       				}
					       			});
						    	} else {
						    		if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'Y') {
							    		alert("보증 증권 발행이 완료처리 되었습니다." + mailList);
							    	} else if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'N') {
						    			alert("메일 전송이 실패했습니다.(발행완료 처리 정보 저장은 완료)");
							    	} else {
						    			alert("보증 증권 완료 처리가 실패하였습니다.");
							    	}
			        			}
				    		}
					    	
					    	
					    	
					    	
					    	
					    	/* if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'Y') {
					    		alert("보증 증권 발행이 완료처리 되었습니다." + mailList);
					    	} else if(data!= null && data.successYN == 'Y' && data.mailSuccessYN == 'N') {
				    			alert("메일 전송이 실패했습니다.(발행완료 처리 정보 저장은 완료)");
					    	} else {
				    			alert("보증 증권 완료 처리가 실패하였습니다.");
					    	} */
					    	
					    	//location.reload();
			            },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
			    	});
				} else {
					//Validate Form
		              $("#m_frm_gb")[0].reportValidity();
				}
				
			} // end fn_chkVali()
			
		}
		
		// 파일다운로드 관련
		
		// 파일업로드 관련
		function fn_downFilePopUp(fileKey, fileOrgNm) {
			var form = document.viewPopUpForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm; 
			var data = $('#viewPopUpForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data);  
		}
		
		function fn_deleteFile(fileKey, fileNm) {
			var result = confirm("첨부파일 " + fileNm + " 을 삭제하시겠습니까?");
			if(result) {
				var form = document.viewPopUpForm;
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
				<div class="floatL ftw500">계약이행 보증증권 발행 정보</div>
			</div>
		</div>
		<div class="contents">
			
			<div style="width: 433px;min-height: 408px;margin: 10px 40px 15px 40px;">
				<form id="m_frm_gb" name="gbForm" method="post">
					<input type="hidden" id="m_ipt_gbKey" name="gbKey" value="${gbInfo.gbKey}" />	
					<input type="hidden" id="m_ipt_mtIntegrateKey" name="mtIntegrateKey" value="${gbInfo.mtIntegrateKey}" />	
					<table  style="width: 551px;">
						<tr id="m_tr_account" >
							<td class="tdTitle">피보험자</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" class="readOnly" value="${gbInfo.mtAcNm}" disabled/> 
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">사업명</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" class="readOnly" value="${gbInfo.mtNm}" disabled/> 
								<input type="hidden" name="mtNm" value="${gbInfo.mtNm}" /> 
								<input type="hidden" name="contractRegEmpKey" value="${mtContractVO.regEmpKey}" />
								<input type="hidden" name="contractSalesEmpKey" value="${mtContractVO.mtSaleEmpKey}" />
							</td>
						</tr>
					
						
						<tr id="m_tr_account" >
							<td class="tdTitle"><label>*</label>계약금액</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="gbContractAmount" name="gbContractAmount" value="${displayUtil.commaStr(gbInfo.mtAmount)}" style="width: 115px; text-align: right;" amountonly required/> 
							</td>
						</tr>
						
						<tr>
							<td class="tdTitle">계약기간</td>
							<td class="tdContents">
								<input type="text" class="readOnlyDt" value="${displayUtil.displayDate(gbInfo.mtStartDt)}" disabled/>
								&nbsp~&nbsp
								<input type="text" class="readOnlyDt" value="${displayUtil.displayDate(gbInfo.mtEndDt)}" disabled/>
							</td>
						</tr>
					
						<tr>
							<td class="tdTitle"><label>*</label>보증기간</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_gbStartDt" name="gbStartDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbStartDt)}" required/>
								&nbsp~&nbsp
								<input type="text" id="m_ipt_gbEndDt" name="gbEndDt" class="calendar toDt" value="${displayUtil.displayDate(gbInfo.gbEndDt)}" required/>
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle">요율</td>
							<td id="m_td_account" class="tdContents">
								<input type="text"   id="m_ipt_gbRate"    name="gbRate" class="tdRate" value="${gbInfo.gbRate}"/>&nbsp% 
								
							</td>
						</tr>
					<%-- <c:choose>
						<c:when test='${gbInfo.gbIssueYn ne "N"}'>
							<tr id="m_tr_account" <c:if test='${gbInfo.gbIssueYn eq "N"}'>style="display: none;" </c:if>>
								<td class="tdTitle">발행일</td>
								<td id="m_td_account" class="tdContents">
									<input type="text" id="m_ipt_gbPublishDt" name="gbPublishDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbPublishDt)}" />
								</td>
							</tr>
							
							<tr id="m_tr_account" <c:if test='${gbInfo.gbIssueYn eq "N"}'>style="display: none;" </c:if>>
								<td class="tdTitle">증권금액</td>
								<td id="m_td_account" class="tdContents">
									<input type="text" id="m_ipt_gbAmount" name="gbAmount" value="${displayUtil.commaStr(gbInfo.gbAmount)}" amountOnly/>
								</td>
							</tr>
						</c:when>
					</c:choose> --%>
					<c:if test='${gbInfo.gbIssueYn ne "N" and sessionScope.empAuthCd == "EMAU1001"}'>
						<tr id="m_tr_account">
							<td class="tdTitle"><label>*</label>발행일</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" id="m_ipt_gbPublishDt" name="gbPublishDt" class="calendar fromDt" value="${displayUtil.displayDate(gbInfo.gbPublishDt)}" required/>
							</td>
						</tr>
						
						<tr id="m_tr_account">
							<td class="tdTitle"><label>*</label>증권금액</td>
							<td id="m_td_account" class="tdContents">
								<%-- <input type="text" id="m_ipt_gbAmount" name="gbAmount" value="${displayUtil.commaStr(gbInfo.gbAmount)}" amountOnly required style="width: 115px;text-align: right;"/> --%>
								<input type="text" id="m_ipt_gbAmount" name="gbAmount" <c:if test="${gbInfo.gbAmount eq 0}">value=""</c:if><c:if test="${gbInfo.gbAmount ne 0 }">value="${displayUtil.commaStr(gbInfo.gbAmount) }"</c:if> amountonly required style="width: 115px;text-align: right;"/>
							</td>
						</tr>
					</c:if>						
					<c:if test='${gbInfo.gbIssueYn == "Y" and sessionScope.empAuthCd ne "EMAU1001"}'>
						<tr id="m_tr_account">
							<td class="tdTitle"><label>*</label>발행일</td>
							<td id="m_td_account" class="tdContents">
								<input type="text" class="readOnlyDt" value="${displayUtil.displayDate(gbInfo.gbPublishDt)}" disabled/>
							</td>
						</tr>
						
						<tr id="m_tr_account">
							<td class="tdTitle"><label>*</label>보험료</td>
							<td id="m_td_account" class="tdContents">
								<%-- <c:out value="${displayUtil.commaStr(gbInfo.gbAmount)"/> --%>	
								<input type="text" class="readOnlyDt" value="${displayUtil.commaStr(gbInfo.gbAmount)}" disabled/>
							</td>
						</tr>
					</c:if>							
						<tr id="m_tr_account" >
							<td class="tdTitle">발급요청사항</td>
							<td id="m_td_account" class="tdContents">
								<textarea name="remark"><c:out value="${gbInfo.remark}"/></textarea>
							</td>
						</tr>
					</table>
					
				</form>
				<form id="fileForm" method="post" enctype="multipart/form-data"> 
					<input type="hidden" name="docTypeNm" value="mtBond" />
					<input type="hidden" name="fileCtKey" id="fileCtKey" value="${gbInfo.gbKey}" />
					<input type="hidden" name="pjNm" id="filePjNm" value="<c:out value="${mtBondFileList[0].pjNm}"/>"/> 
					<input type="hidden" name="atchFileCnt" id="atchFileCnt" title="첨부된갯수" value="${fn:length(fileList)}" />
					<input type="hidden" name="maxFileCnt" id="maxFileCnt" title="첨부가능최대갯수" value="<c:out value='${maxFileCnt}'/>" />
					<input type="hidden" name="maxFileSize" id="maxFileSize" title="파일사이즈" value="<c:out value='${maxFileSize}'/>" />
					<table>					
						<tr>		
							<td class="tdTitle veralignT">첨부파일</td>		
							<td class="tdContents">			
								<div class="uploadContainer">
									<input class="uploadName" id="upFileName" placeholder="파일선택" disabled="disabled" />
									<label for="exFile" class="exFileLabel"></label>
									<input type="file" id="exFile" class="exFile" multiple="multiple" name="file"/>
								</div>
								<div style="width: 416px; height: 25px; clear:both;">
									<c:forEach var="result" items="${mtBondFileList }" varStatus="status">
										<input class="upload-name cursorP" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFilePopUp('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/>
										<c:if test='${sessionScope.userInfo.empKey == mtContractVO.regEmpKey || sessionScope.empAuthCd == "EMAU1001"}'>
											<a class="close cursorP" onclick="fn_deleteFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm }" />')"><img src="/images/btn_close.png" /></a>
										</c:if>
										
										<c:if test="${status.last eq false}"><br /></c:if>
									</c:forEach>
								</div>
								
							
							<%-- <form:form id="viewForm" name="viewForm" method="POST">
								<input type="hidden" name="fileKey" value=""/>
								<input type="hidden" name="fileOrgNm" value=""/>
							</form:form> --%>
							</td>
						</tr>
					
					<%-- tr>
								<td class="tdTitle veralignT">첨부파일</td>
								<td class="tdContents"><button type="button"><img src="<c:url value='/images/btn_file.png'/>" /></button></td>
							</tr> --%>
					</table>
				</form>
				<form:form id="viewPopUpForm" name="viewPopUpForm" method="POST">
					<input type="hidden" name="fileKey" value=""/>
					<input type="hidden" name="fileOrgNm" value=""/>
				</form:form>		
				<div class="btnWrap floatR" style="margin-right: -128px">
						<div id="m_btn_save" class="floatR" style="">
							<c:choose>
								<c:when test='${gbInfo.gbIssueYn eq "N"}'>
									<button type="button" onclick="javascript:fnGbPublish();">
										<img src="<c:url value='/images/btn_stock_publish.png'/>" />
									</button>
								</c:when>
								<c:when test='${gbInfo.gbIssueYn eq "R"}'>
									<c:if test='${sessionScope.empAuthCd == "EMAU1001"}'>
										<button type="button" onclick="javascript:fnGbEnd();">
											<img src="<c:url value='/images/btn_stock_end.png'/>" />
										</button>
									</c:if>
									<c:if test='${sessionScope.userInfo.empKey == mtContractVO.regEmpKey || sessionScope.empAuthCd == "EMAU1001"}'>
										<button type="button" onclick="javascript:fnGbModify();">
											<img src="<c:url value='/images/btn_stock_mod.png'/>" />
										</button>
									</c:if>
									
								</c:when>
								<c:when test='${gbInfo.gbIssueYn eq "Y"}'>
									<c:if test='${sessionScope.empAuthCd == "EMAU1001"}'>
										<button type="button" onclick="javascript:fnGbEnd();">
											<img src="<c:url value='/images/btn_stock_end.png'/>" />
										</button>
									</c:if>									
								</c:when>
								<%-- <c:otherwise>
									<button type="button" onclick="javascript:fnGbModify();">
										<img src="<c:url value='/images/btn_stock_mod.png'/>" />
									</button>
								</c:otherwise> --%>
							</c:choose>
							
						</div>
						<div class="floatN floatC"></div>
					</div>		
			</div>				
		</div>
			
	</div>	
	
	
</body>
</html>