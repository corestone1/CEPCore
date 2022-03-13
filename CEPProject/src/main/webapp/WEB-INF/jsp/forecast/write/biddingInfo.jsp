<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp"%>
<%@page import="java.util.*"%>
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

.popContainer .top>div {
	font-size: 24px;
	padding-left: 34px;
	padding-top: 43px;
}

.popContainer .left {
	width: 201px;
	height: 601px;
	position: absolute;
	top: 107px;
	box-shadow: 3px -1px 8px 0px rgb(0, 0, 0, 0.3);
	background-color: #32bc94;
	z-index: 4;
}

.popContainer .left ul li {
	height: 47px;
	padding-left: 28px;
	line-height: 47px;
}

.popContainer .left ul li.on, .popContainer .left ul li:hover {
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

.popContainer .contents>div {
	width: calc(100% - 80px);
	margin: 10px 40px 15px 40px;
}

.popContainer .contents>div:first-child {
	min-height: 519px;
}

.popContainer .contents>div>table {
	border-collapse: separate;
	border-spacing: 0 3px;
	width: 100%;
}
/* .popContainer .contents > div > table tr:first-child td {
			margin-bottom: 100px;
		} */
.popContainer .contents input {
	width: 110px;
	height: 40px;
	border: 1px solid #e9e9e9;
	padding: 0 10px;
	background-color: #fff;
	font-size: 14px;
	padding-right: 18px;
}

.popContainer .contents input:disabled {
	background-color: #ccc;
	background-image: none !important;
	width: 118px !important;
	height: 40px !important;
	font-size: 14px !important;
	border: 1px solid #e9e9e9 !important;
	padding: 0 10px !important;
}

.popContainer .contents input:disabled+label {
	background-color: #ccc;
}

.popContainer .contents input[class="pname"] {
	width: 400px;
	border: none;
	outline: none;
	background-color: #f6f7fc;
}

.popContainer .contents input[class^="calendar"] {
	width: 110px;
	height: 40px;
	background-image: url('/images/icon_calendar.png');
	background-repeat: no-repeat;
	background-position: 92% 50%;
}

.popContainer .contents input[type="time"] {
	padding-right: 10px;
	width: 118px;
}

.popContainer .contents input[type="time"]::-webkit-calendar-picker-indicator
{
	background-size: 23px;
	background-position: 50%;
}

.popContainer .contents td.btnFc {
	padding-bottom: 12px;
}

.popContainer .contents td.tdTitle {
	margin-top: 11px;
	width: 96px;
}

.popContainer .contents td.tdContents {
	width: 691px;
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

.popContainer .contents td:last-child {
	padding-right: 0px !important;
}

.popContainer .contents tr.first td {
	border-collapse: collapse;
	border-spacing: 0 3px;
	border-bottom: 2px solid #e5e5e5;
	padding-bottom: 15px;
	vertical-align: inherit;
	padding-right: 18px;
	/* font-size: 18px; */
}

.popContainer .contents tr.after td {
	padding-top: 10px;
}

.popContainer .contents tr>td {
	font-size: 14px;
	padding-right: 10px;
	padding-top: 5px;
	height: 31px;
	color: #000;
}

.popContainer .contents tr>td .ttile {
	font-size: 18px;
	padding: 17px 0;
	font-weight: 400;
	color: #535353;
}

.popContainer .contents tr>td .ttile.fst {
	width: 153px;
	display: inline-block;
	padding: 0 !important;
}

.popContainer .contents tr>td .torigin {
	padding: 17px 0px;
    font-weight: 300;
    color: #535353;
    margin: 0;
    margin-right: 17px;
}

.popContainer .contents tr>td .indeWrap {
	font-size: 0;
}

.popContainer .contents .gtlabel {
	font-size: 13px;
	display: block;
	margin-bottom: 4px;
	color: #f59348;
}

#addDocEtcBtn img {
	margin: 3px 0 0 10px;
	vertical-align: bottom;
}

.popContainer .contents tr>td .decreaseQuantity, .popContainer .contents tr>td .increaseQuantity
	{
	background-color: #e4e6f0;
	padding: 0px 10px;
	border: 1px solid #dcdde3;
	font-size: 16px;
}

.popContainer .contents tr>td .numberUpDown {
	font-size: 16px;
	display: inline-block;
	width: 30px;
	text-align: center;
	border-top: 1px solid #dcdde3;
	border-bottom: 1px solid #dcdde3;
	line-height: 1.5;
}

.popContainer .contents tr>td:nth-child(2) {
	/* min-width: 145px; */
	
}

.popContainer .contents input[class^="amount"] {
	text-align: right;
}

.popContainer table {
	width: 100%;
}

.popContainer .contents input:read-only {
	background-color: transparent;
	width: 10px;
	padding: 0;
	margin: 0;
	border: none;
	height: 13px;
	font-size: 16px;
	vertical-align: middle;
	padding-bottom: 6px;
	font-family: "Noto Sans KR", sans-serif !important;
	font-weight: 200;
}

.popContainer .contents .btnReq {
	margin: 1px 0 0 7px;
	filter: grayscale(1);
	cursor: default;
}

#fileForm {
	position: absolute;
	right: 16px;
	z-index: 99;
	top: 472px;
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

#fileForm .close {
	vertical-align: middle;
}

#fileWrap {
	height: 62px;
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
	left: 15px;
	font-size: 14px;
}

.move .moveSpan::after {
	content: "";
	position: absolute;
	top: 100%;
	left: 18%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: #404040 transparent transparent transparent;
}
</style>
<script>
		
		jQuery.fn.serializeObject = function() { 
			var obj = null; 
			var objArry = null;
			try { 
				if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
					var arr = this.serializeArray(); 
					if(arr){ 
						obj = {};
						objArry = new Array();
						jQuery.each(arr, function() {
							obj[this.name] = this.value; 

							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('bdDocCnt' == this.name){
								objArry.push(obj);
								obj = {};
							}
						}); 	         
						
						/* for(var i = objArry.length - 1; i >= 0; i--) {
							if(!(objArry[i].bdGuarantyCheck === "on")) {
								objArry.splice(i, 1);
							}
						} */
					} 
				} 
			}catch(e) { 
				alert(e.message); 
			}finally {} 
			return objArry; 
		}
		
		function fn_chkVali() {
            if ($("#bdInfoForm")[0].checkValidity()){
               //필수값 모두 통과하여 저장 프로세스 호출.
                if ($("#bdFileForm")[0].checkValidity()) {
                	if($(".uploadName").val() != null && $('.uploadName').val().length != 0) {
	                	var maxSize = 20 * 1024 * 1024;
	                	var fileSize = $("#exFile")[0].files[0].size;
	                	   
	        			if(fileSize > maxSize){
	        				alert("첨부파일 사이즈는 20MB 이내로 등록 가능합니다.");
	        				return false;
	        			} else {
	        				fn_save();
	        			}
                	} else {
                		fn_save();
                	}
                } else {
                	$("#bdFileForm")[0].reportValidity();   
                }
            } else {
                $("#bdInfoForm")[0].reportValidity();   
            }            
		}
		
		/* var countSave = 0; */
		var turnNo = $("#turnNo").val();
		
		function fn_save() {
			var object = {};
			
			$("input[type='checkbox'][id*='Check']").each(function() {
				if($(this).is(":checked") == true) {
					$("#"+$(this).attr("id").replace("Check", "")).val('Y');
				} else {
					$("#"+$(this).attr("id").replace("Check", "")).val('N');
				}
			});
			
			var formData = $("#bdInfoForm").serializeArray();
			var listData = $("#bdFileForm").serializeObject();
			
			for (var i = 0; i<formData.length; i++){
				if(formData[i]['name']=="bdGbStartDt" || formData[i]['name']=="bdGbEndDt" || formData[i]['name']=="bdGbFinishDt" || 
						formData[i]['name']=="bdLimitDt" || formData[i]['name']=="bdProposalDueDt" || formData[i]['name']=="bdProposalPresentDt") {
					//날짜에서 -를 제거한다.					
					object[formData[i]['name']] = removeData(formData[i]['value'],"-");
				} else if(formData[i]['name']=="bdGbAmount") {
					//숫자에서 컴마를 제거한다.
					object[formData[i]['name']] = removeData(formData[i]['value'], ",");
				} else if(formData[i]['name']=="bdLimitTm" || formData[i]['name']=="bdProposalDueTm" || formData[i]['name']=="bdProposalPresentTm") {
					//숫자에서 콜론을 제거한다.
					object[formData[i]['name']] = removeData(formData[i]['value'], ":");
				} else {
					object[formData[i]['name']] = formData[i]['value'];
				}
            }
			
			object["biddingFileVOList"]=listData;
			
			var sendData = JSON.stringify(object);
			console.log(sendData);
			$.ajax({
				url: "/forecast/write/writeBiddingInfo.do",
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
			    			/* if($("#m_ipt_spKey").val() == null || $("#m_ipt_spKey").val() == "" || $("#m_ipt_spKey").val().length == 0) {
				    			$("#fileCtKey").val(response.spKey);
				    			$("#fileSpBusiNm").val($("#spBusiNm").val());
				    		} */
			    			
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
			    							alert("입찰 정보가 저장되었습니다.");
			    							//countSave++;
			    						} else {
			    							alert("입찰 정보가 수정되었습니다.")
			    						}
			    					} else {
			    						alert("첨부파일 저장이 실패하였습니다.");
			    					}
			    					
			    					fnMoveTab("biddingInfo");
			    				}
			    			});  
			    		} else {
			    			if($("#bdKey").val() == null || $("#bdKey").val() == "" || $("#bdKey").val().length == 0) {
    							alert("입찰 정보가 저장되었습니다.");
    							//countSave++;
    						} else {
    							alert("입찰 정보가 수정되었습니다.")
    						}
			    			
			    			fnMoveTab("biddingInfo");
			    		}
			    		
			    	} else {
			    		if($("#bdKey").val() == null || $("#bdKey").val() == "" || $("#bdKey").val().length == 0) {
			    			alert("입찰 정보 등록이 실패하였습니다.");
			    		} else {
			    			alert("입찰 정보 수정이 실패하였습니다.");
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

		function fn_addDocEtc(obj) {
			
	    	var clones = $(obj).parent().parent().clone();
	    	var clone = new jQuery.fn.init(clones[clones.length - 1]);
	    	
	    	clone.addClass('atc');
	    	
	    	var bdFileCheckNum = 0;
	    	$("input[id^='bdFileCheck']").each(function() {
	    	    var idValue = $(this).attr("id");
	    	    var idNum = idValue.replace(/[^0-9]/g,'');
	    	   
	    	    if(Number(idNum) > bdFileCheckNum) {
	    	    	bdFileCheckNum = idNum;
	    	    }
	    	});
	    	
	    	bdFileCheckNum = Number(bdFileCheckNum) + 1;
	    	
	    	clone.find("button").attr("onclick","fn_removeEtcDoc(this);");
	    	clone.find("button img").attr("src","/images/popup_close.png");
	    	clone.find("button img").css("width", "11px");
	    	clone.find("input[type='checkbox']").css("display", "none");
	    	clone.find("input[type='checkbox']").prop("checked", "true");
	    	clone.find("input[type='text']").attr("disabled", false);
	    	clone.find("input[type='text']").attr("onclick", false);
	    	clone.find("input[type='text']").val("");
	    	clone.find('input[id^="bdFileCheck"]').attr('id', "bdFileCheck"+bdFileCheckNum);
	    	clone.find("label[for^='bdFileCheck']").attr('for', "bdFileCheck"+bdFileCheckNum);
	    	clone.find("label[for^='bdFileCheck']").css("display", "none");
	    	clone.find("label input").attr("class", "bdFileCheck"+bdFileCheckNum);
	    	clone.find("label input").val(1);
	    	clone.find("input[type='hidden']").attr("id", "bdFile"+bdFileCheckNum);
	    	
	    	clone.find("a.decreaseQuantity").attr('onclick',"fn_checkDecCount('bdFileCheck"+bdFileCheckNum+"')");
	    	clone.find("a.increaseQuantity").attr('onclick',"fn_checkIncCount('bdFileCheck"+bdFileCheckNum+"')");
	    	
	    	$(obj).parent().parent().parent().children().last().after(clone);
		}
		
		function fn_reqDoc() {
			var docType = "";
			
			$("input[id*='bdFileCheck']").each(function() {
				if($(this).is(":checked") == true && Number($(this).attr("id").replace(/[^0-9]/g,'')) < 7) {
					docType += $(this).parent().next().html() + " " + $("."+$(this).attr("id")).val() + "부\n";
				}
			});
			
			$("input[name=bdFileDocNm]").each(function() {
				if($(this).val() != null && $(this).val() != "" && $(this).val().length != 0) {
					docType += $(this).val() + " " + $(this).next().next().children().eq(0).val() + "부\n";			
				}
			});
			
			$(".entryList").each(function() {
				docType += $(this).html() + "\n";
			});
			
			if(isUpdate()) {
				if(confirm(docType + "\n을(를) 요청하시겠습니까? 해당 작업 수행 시 관리자에게 요청 알림이 전송됩니다.")) {
					var object = {};
					
		            var formData = $("#bdInfoForm").serializeArray();
					
		            for (var i = 0; i<formData.length; i++) {
		            	object[formData[i]['name']] = formData[i]['value'];
		            }
		            
					var sendData = JSON.stringify(object);
					$.ajax({
						url: "/forecast/requestBiddingDoc.do",
					    dataType: 'json', 
					    type:"POST",  
					    data: sendData,
					 	contentType: "application/json; charset=UTF-8", 
					 	beforeSend:function(){
					        $('.wrap-loading').removeClass('dpNone');
					    }

					   	,complete:function(){
					        $('.wrap-loading').addClass('dpNone');
					    },
					    success:function(response){	
					    	if(response!= null && response.mailSuccessYN == 'Y') {
					    		var mailList = "";
						    	if(response.mailList == "undefined" || response.mailList == null || response.mailList == "") {
						    		mailList = "";
						    	} else {
						    		mailList = "\n메일 수신인: " + response.mailList.join("\n");
						    		alert("입찰 서류 정보가 요청되었습니다." + mailList);
						    	}
					    	} else {
					    		alert("입찰 서류 정보 요청이 실패하였습니다.");
					    	}
					    	
					    	fnMoveTab("biddingInfo");
					    },
						error: function(request, status, error) {
							if(request.status != '0') {
								alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
							}
						} 
					});      
				}
			} else {
				alert("서류를 요청하기 전 저장/수정을 먼저 해주세요.");
			}
			
			
			
		}
		
		function isUpdate() {
			var returnVal = true;
			$(".beforeUpdate").each(function() {
				if($(this).children().find("input[id='postCnt']").val() == $(this).children().find("input[id='afterCnt']").val()) {
				} else {
					returnVal = false;
				}
			});
			
			if($("#bdFileCheck7").is(":checked") == true) {
				returnVal = false;
			}
			
			return returnVal;
		}
		
		function fn_bdOriginFileYnClick(value) {
			$("#bdOriginFileYn").val(value);
		}
		
		function fn_checkDecCount(id) {
			/* e.preventDefault();  */
			var stat = $("."+id).val();
			var num = parseInt(stat,10);
			num--;
			
			if(num<=0){
				$("#"+id).prop("checked", false);	
				if(Number(id.replace(/[^0-9]/g,'')) > 7) {
					$("#"+id).parent().parent().remove();
				}
			} else if(num<=-1) {
				alert('더 이상 줄일 수 없습니다.');
				num = 0;
			}
			
			if($("#"+id).is(":checked") ==false) {
				num = 0;
			}
			
			if(id == "bdFileCheck7" && $("#"+id).is(":checked") == false) {
				$("#etcFileDocNm").attr('disabled', true);
				$("#etcFileDocNm").attr('required', false);
				$("#addDocEtcBtn").addClass("dpNone");
				$(".atc").remove();
			} 
			
			$("."+id).val(num);
		}
		
		function fn_checkIncCount(id) {
			
			/* e.preventDefault(); */
			var stat = $("."+id).val();
			var num = parseInt(stat,10);
			num++;
			
			if($("#"+id).is(":checked") == false) {
				$("#"+id).prop("checked", true);	
			}
			 
			if(id == "bdFileCheck7" && $("#"+id).is(":checked") == true) {
				$("#etcFileDocNm").attr('disabled', false);
				$("#etcFileDocNm").attr('required', true);
				$("#addDocEtcBtn").removeClass("dpNone");
			} 
			
			$("#addDocEtcBtn").css("display", "block");

			$("."+id).val(num);
			
		}
		
		function fn_delEtcDoc(obj, seq) {
			$(obj).css('display','none');
			$(obj).prev().css('display','none');
			$(obj).next().css('display','none');
			
			var html = "";
			html += "<input type='hidden' name='bdFileCheck' value='N' />";
			html += "<input type='hidden' name='bdFileKindCd' value='BDFL1199' />";
			html += "<input type='hidden' name='bdSeq' value="+seq+" />";
			html += "<input type='hidden' name='bdDocCnt' value='0' />";
			
			$("#etcIndeWrap").append(html);
		}
		
		function fn_removeEtcDoc(obj) {
			$(obj).parent().parent().remove();
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
		
		$(document).ready(function() {
			if($('#bdProposalYnCheck').is(':checked') == true) {
				$(".proposal").attr('disabled',false);
				$(".proposal").attr('required',true);
				$("#bdProposalPresentYnCheck").attr('disabled',false);
			} else {
				$(".proposal").attr('disabled',true);
				$(".proposal").attr('required',false);
				$(".present").attr('disabled',true);
				$(".present").attr('required',false);
				$("#bdProposalPresentYnCheck").attr('disabled',true);
				$("#bdProposalPresentYnCheck").attr('checked',false);
			}
			
			if($('#bdProposalPresentYnCheck').is(':checked') == true) {
				$(".present").attr('disabled',false);
				$(".present").attr('required',true);
			} else {
				$(".present").attr('disabled',true);
				$(".present").attr('required',false);
			}
			
			if($('#bdFileCheck7').is(':checked') == true) {
				$("#etcFileDocNm").attr('disabled',false);
			} else {
				$("#etcFileDocNm").attr('disabled',true);
			}
			
			$('#bdProposalYnCheck').click(function() {
				if($(this).is(':checked') == true) {
					$(".proposal").attr('disabled',false);
					$(".proposal").attr('required',true);
					$("#bdProposalPresentYnCheck").attr('disabled',false);
				} else {
					$(".proposal").attr('disabled',true);
					$(".proposal").attr('required',false);
					$(".proposal").val('');
					$(".present").attr('disabled',true);
					$(".present").attr('required',false);
					$(".present").val('');
					$("#bdProposalPresentYnCheck").attr('disabled',true);
					$("#bdProposalPresentYnCheck").attr('checked',false);
				}
			});
			
			$('#bdProposalPresentYnCheck').click(function() {
				if($(this).is(':checked') == true) {
					$(".present").attr('disabled',false);
					$(".present").attr('required',true);
				} else {
					$(".present").attr('disabled',true);
					$(".present").attr('required',false);
					$(".present").val('');
				}
			});
			
			$('#bdFileCheck7').click(function() {
				if($(this).is(':checked') == true) {
					$("#etcFileDocNm").attr('disabled',false);
				} else {
					$("#etcFileDocNm").attr('disabled',true);
				}
			});
			
			$("input[id*='bdFileCheck']").click(function() {
				var chkCnt = 0;
				
				if($(this).is(":checked") == true) {
					$(".btnReq").css("filter", "none");
					$(".btnReq").css("cursor", "pointer");
					$(".btnReq").attr("onclick", "javascript:fn_reqDoc()");
					
					fn_checkIncCount($(this).attr("id"));	
				} else {
					$("input[id*='bdFileCheck']").each(function() {
						if($(this).is(":checked") == true) {
							chkCnt++;
						}
					});
					if(chkCnt == 0) {
						$(".btnReq").css("filter", "grayscale(1)");
						$(".btnReq").css("cursor", "default");
						$(".btnReq").attr("onclick", "");
					}
					fn_checkDecCount($(this).attr("id"));	
				}
			});
			
			$("input[id*='bdFileCheck']").each(function() {
				if($(this).is(":checked") == true) {
					$(".btnReq").css("filter", "none");
					$(".btnReq").css("cursor", "pointer");
					$(".btnReq").attr("onclick", "javascript:fn_reqDoc()");
				}
			});
			
			if($('input[id=bdKey]').val() != "" || $('input[id=bdKey]').val().length != 0) {
				$('.btnSave').children().eq(0).html('');
				$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />'); 
			} /* else {
				$('.btnReq').remove(); 
			} */
			
			var fileTarget = $(".exFile");
			
			fileTarget.on('change', function() {
				var filename = $(this)[0].files[0].name;
				$(this).siblings('.uploadName').val(filename);
			});
			
			if("${biddingVO.bdGbFinishYn}"== "Y" || "${biddingVO.bdGbFinishYn}" == "R") {
				$("#bdGbYnCheck").attr("disabled",true);
			}
			
			$("#bdGbYnCheck").click(function() {
				
				if(("${biddingVO.bdGbYn}" ==  "N" || "${biddingVO.bdGbYn}" ==  "") && $("#bdGbYnCheck").is(":checked")) {
					$(".gtlabel").removeClass("dpNone");
				} else if(("${biddingVO.bdGbYn}" ==  "N" || "${biddingVO.bdGbYn}" ==  "") && !$("#bdGbYnCheck").is(":checked")) {
					$(".gtlabel").addClass("dpNone");
				} else if("${biddingVO.bdGbYn}" == "Y" && $("#bdGbYnCheck").is(":checked")) {
					$(".gtspan").removeClass("dpNone");
				}else if("${biddingVO.bdGbYn}" == "Y" && !$("#bdGbYnCheck").is(":checked")) {
					$(".gtspan").addClass("dpNone");
				}
			});
			
			
		});
		
		var fnMoveTab = function(pstTabName){
			fn_addView(pstTabName, $('#m_ipt_spKey').val());
		};
		
		function fnShowStock(obj) {
			var pstUrl = "/forecast/viewStockPublishBD.do";
			var varParam = "";
			if(obj == 'view') {
				varParam = 'spKey='+$('#m_ipt_spKey').val()+'&bdKey='+$('#bdKey').val()+"&workClass=입찰_공고문&view=true";
			} else {
				varParam = 'spKey='+$('#m_ipt_spKey').val()+'&bdKey='+$('#bdKey').val()+"&workClass=입찰_공고문&view=false";
			}
			
			var nWidth = "654";
			var nHeight = "600";
			  
			var curWidth = document.body.clientWidth;
			var curHeight = document.body.clientHeight;

			var strOption = "";
			strOption += "width=" + nWidth + "px,";
			strOption += "height=" + nHeight + "px,";
			strOption += "toolbar=no,menubar=no,location=no,";
			strOption += "resizable=yes,status=yes";    
			
			window.open(pstUrl + "?"+ varParam,'BD_GUARANTY_INFO', strOption);
		}
	</script>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">Forecast 등록</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
				<li class="colorWhite cursorP"
					onclick="javascript:fnMoveTab('basic')">기본 정보</li>
				<li class="colorWhite cursorP"
					onclick="javascript:fnMoveTab('fundInfo')">매출/입 정보</li>
				<li class="colorWhite cursorP"
					onclick="javascript:fnMoveTab('progress')">제품 및 진행사항</li>
				<li class="colorWhite cursorP on">입찰 정보</li>
			</ul>
		</div>
		<%-- <form:form commandName="bdInfoForm" id="bdInfoForm" name="bdInfoForm" method="post"> --%>
		<div class="contents">
			<div>
				<form id="bdInfoForm" name="bdInfoForm" method="post">
					<input type="hidden" name="spKey" id="m_ipt_spKey"
						value="${spKey }" /> <input type="hidden" id="bdKey"
						value="${biddingVO.bdKey }" name="bdKey" /> <input type="hidden"
						id="bdGbYn" value="${biddingVO.bdGbYn }" name="bdGbYn" />
					<%-- <input type="hidden" id="bdGbFinishYn" value="${biddingVO.bdGbFinishYn }" name="bdGbFinishYn" /> --%>
					<input type="hidden" id="bdProposalYn" value="${biddingVO.bdProposalYn }" name="bdProposalYn" /> 
					<input type="hidden" id="bdProposalPresentYn" value="${biddingVO.bdProposalPresentYn }" name="bdProposalPresentYn" /> 
					<input type="hidden" id="workClass" name="workClass" value="입찰_첨부파일" /> 
					<input type="hidden" name="spBusiNm" value="<c:out value="${biddingVO.spBusiNm}"/>" />
					<div>
						<div id="infoTable">
							<table>
								<tr class='ftw200 first'>
									<td colspan="8" style="padding-top: 0;">
										<label class="ttile fst">입찰 기한&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
										<input type='text' id='bdLimitDt' placeholder='입찰 기한' class='calendar' name='bdLimitDt' value="${displayUtil.displayDate(biddingVO.bdLimitDt) }" required /> 
										<input type='time' id='bdLimitTm' placeholder='입찰 시간' name='bdLimitTm' value="${displayUtil.displayTime(biddingVO.bdLimitTm) }" />
									</td>
								</tr>
								<tr style="line-height: 2.5;">
									<td><label class="ttile">입찰 보증 증권</label></td>
								</tr>
								<tr class='ftw200'>
									<td style="width: 146px;">
										<input type="checkbox" class="tCheck" id="bdGbYnCheck"
										<c:if test="${biddingVO.bdGbYn eq 'Y'}">checked="checked"</c:if> />
										<label for="bdGbYnCheck" class="cursorP"></label>
										&nbsp;&nbsp;&nbsp;&nbsp;입찰 보증 증권
									</td>
									<td colspan="7">
										<label class="dpNone gtlabel">※ 입찰보증 증권 선택 후 저장을 하면 발행을 신청할 수 있습니다.</label> 
										<c:if test='${biddingVO.bdGbYn eq "Y"}'>
											<span class="gtspan">( 진행상태&nbsp;:&nbsp; 
												<c:choose>
													<c:when test='${biddingVO.bdGbFinishYn eq "N"}'>
														신청 전 ) &nbsp;&nbsp;
														<%
															if (!session.getAttribute("empAuthCd").equals("EMAU1001")) {
														%>
														<c:set var="systemName" value='<%=session.getAttribute("name")%>' />
														<c:set var="mngName" value="${forecast.empNm }" />
														<c:if test="${systemName eq mngName }">
															<span class="cursorP"> 
																<img src="/images/btn_stock_publish.png" onclick="javascript:fnShowStock('act');" style="vertical-align: middle;" />
															</span>
														</c:if>
														<%
															} else {
														%>
														<!-- <span class="cursorP"> 
															<img src="/images/btn_view_blue.png" onclick="javascript:fnShowStock('view');" style="vertical-align: middle;" />
														</span> -->
														<%
															}
														%>
													</c:when>
													<c:when test='${biddingVO.bdGbFinishYn eq "R"}'>
														승인 중 ) &nbsp;&nbsp;
														<%
															if (session.getAttribute("empAuthCd").equals("EMAU1001")) {
														%>
														<span class="cursorP"> 
															<img src="/images/btn_blue_reqInfo.png" onclick="javascript:fnShowStock('act');" style="vertical-align: middle;" />
														</span>
														<%
															} else {
														%>
														<span class="cursorP"> 
															<img src="/images/btn_blue_reqInfo.png" onclick="javascript:fnShowStock('view');" style="vertical-align: middle;" />
														</span>
														<%
															}
														%>
													</c:when>
													<c:when test='${biddingVO.bdGbFinishYn eq "Y"}'>
														발행 완료 ) &nbsp;&nbsp;
														<span class="cursorP"> 
															<img src="/images/btn_stock_detail.png" onclick="javascript:fnShowStock('act');" style="vertical-align: middle;" />
														</span>
													</c:when>
												</c:choose>
											</span>
										</c:if>
									</td>
								</tr>
								<tr class='ftw200'>
									<td><input type="checkbox" class="tCheck"
										id="bdProposalYnCheck"
										<c:if test="${biddingVO.bdProposalYn eq 'Y'}">checked="checked"</c:if> />
										<label for="bdProposalYnCheck" class="cursorP"></label>
										&nbsp;&nbsp;&nbsp;&nbsp;제안서</td>
									<td colspan="7">
										<input type='text' id='bdProposalDueDt' placeholder='접수 마감일' class='calendar proposal' name='bdProposalDueDt' value="${displayUtil.displayDate(biddingVO.bdProposalDueDt) }" disabled /> 
										<input type='time' id='bdProposalDueTm' placeholder='접수 마감 시간' class="proposal" name='bdProposalDueTm' value="${displayUtil.displayTime(biddingVO.bdProposalDueTm) }" disabled /> 
										<!-- <button type="button" class="veralignM" style="margin-left: 5px;"><img src="/images/btn_file_upload.png"/></button> -->
									</td>
								</tr>
								<tr class='ftw200 first'>
									<td>
										<input type="checkbox" class="tCheck" id="bdProposalPresentYnCheck"
											<c:if test="${biddingVO.bdProposalPresentYn eq 'Y'}">checked="checked"</c:if> disabled /> 
										<label for="bdProposalPresentYnCheck" class="cursorP"></label> 
										&nbsp;&nbsp;&nbsp;&nbsp;제안 발표
									</td>
									<td colspan="7">
										<input type='text' id='bdProposalPresentDt' placeholder='발표일' class='calendar present' name='bdProposalPresentDt' value="${displayUtil.displayDate(biddingVO.bdProposalPresentDt) }" disabled /> 
										<input type='time' id='bdProposalPresentTm' placeholder='발표 시간' class="present" name='bdProposalPresentTm' value="${displayUtil.displayTime(biddingVO.bdProposalPresentTm) }" disabled />
										<input type="hidden" name="bdOriginFileYn" id="bdOriginFileYn" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
				<form id="bdFileForm">
					<div>
						<div class="infoTable">
							<table>
								<tr>
									<td colspan='9' style='min-width: 96px; padding-top: 0;'>
										<div class="ttile floatL">
											입찰 서류 정보
											<c:set var="systemName" value='<%=session.getAttribute("name")%>' />
											<c:set var="mngName" value="${forecast.empNm }" />
											<c:if test="${systemName eq mngName }">
												<button class="veralignM btnReq" type="button">
													<img src="/images/btn_req.png" />
												</button>
											</c:if>
										</div>
										<div class="torigin floatR">
											<input type="radio" class="tRadio"  id="bdOriginYn1" name="bdOriginFileYnCheck" value="Y" 
												<c:if test="${biddingVO.bdOriginFileYn eq 'Y'}">checked="checked"</c:if> 
												<c:if test="${biddingVO.bdOriginFileYn eq null or biddingVO.bdOriginFileYn eq ''}">checked="checked"</c:if> onclick="fn_bdOriginFileYnClick('Y')" />
											<label for="bdOriginYn1" class="cursorP"></label> 원본&nbsp;&nbsp;&nbsp;
											<input type="radio" class="tRadio"  id="bdOriginYn2" name="bdOriginFileYnCheck" value="N" 
												<c:if test="${biddingVO.bdOriginFileYn eq 'N'}">checked="checked"</c:if> onclick="fn_bdOriginFileYnClick('N')" />
											<label for="bdOriginYn2" class="cursorP"></label> 스캔본
										</div>
										<div class="floatC"></div>
									</td>
								</tr>
								<tr class='ftw200'>
									<td><c:set var="isExist" value="false" /> <c:set
											var="doneLoop" value="false" /> <c:set var="docCnt" value="0" />
										<c:set var="seq" value="" /> <c:forEach var="result"
											items="${ biddingFileList}" varStatus="status">
											<c:if test="${not doneLoop}">
												<c:choose>
													<c:when test="${result.bdFileKindCd eq 'BDFL1110'}">
														<c:set var="isExist" value="true" />
														<c:set var="doneLoop" value="true" />
														<c:set var="docCnt" value="${result.bdDocCnt }" />
														<c:set var="seq" value="${result.bdSeq }" />
													</c:when>
													<c:otherwise>
														<c:set var="isExist" value="false" />
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach> 
										<c:choose>
											<c:when test="${isExist eq true}">
												<input type="checkbox" class="tCheck" id="bdFileCheck1" checked="checked" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" class="tCheck" id="bdFileCheck1" />
											</c:otherwise>
										</c:choose> 
										<label for="bdFileCheck1" class="cursorP"></label> 
										<input type="hidden" name="bdFileCheck" class="tCheck" id="bdFile1" />
									</td>
									<td>사업자 등록증</td>
									<td class="beforeUpdate">
										<div class="indeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1110" />
											<input type="hidden" name="bdSeq" value="${seq }" /> 
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdFileCheck1')">
												<img src="<c:url value='/images/ic_minus.png'/>" />
											</a> 
											<label class="numberUpDown">
												<input id="afterCnt" type="text" class="bdFileCheck1" name="bdDocCnt" value="<c:out value="${docCnt }" />" readOnly />
											</label> 
											<input type="hidden" id="postCnt" value="${docCnt }" /> 
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdFileCheck1')">
												<img src="<c:url value='/images/ic_plus.png'/>" />
											</a>
										</div>
									</td>
									<td><c:set var="isExist" value="false" /> <c:set
											var="doneLoop" value="false" /> <c:set var="docCnt" value="0" />
										<c:set var="seq" value="" /> <c:forEach var="result"
											items="${ biddingFileList}" varStatus="status">
											<c:if test="${not doneLoop}">
												<c:choose>
													<c:when test="${result.bdFileKindCd eq 'BDFL1120'}">
														<c:set var="isExist" value="true" />
														<c:set var="doneLoop" value="true" />
														<c:set var="docCnt" value="${result.bdDocCnt }" />
														<c:set var="seq" value="${result.bdSeq }" />
													</c:when>
													<c:otherwise>
														<c:set var="isExist" value="false" />
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach> 
										<c:choose>
											<c:when test="${isExist eq true}">
												<input type="checkbox" class="tCheck" id="bdFileCheck2" checked="checked" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" class="tCheck" id="bdFileCheck2" />
											</c:otherwise>
										</c:choose> 
										<label for="bdFileCheck2" class="cursorP"></label> 
										<input type="hidden" name="bdFileCheck" class="tCheck" id="bdFile2" />
									</td>
									<td>법인등기부등본</td>
									<td class="beforeUpdate">
										<div class="indeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1120" />
											<input type="hidden" name="bdSeq" value="${seq }" /> 
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdFileCheck2')">
												<img src="<c:url value='/images/ic_minus.png'/>" />
											</a> 
											<label class="numberUpDown">
												<input type="text" class="bdFileCheck2" id="afterCnt" name="bdDocCnt" value="<c:out value="${docCnt }" />" readOnly />
											</label> 
											<input type="hidden" id="postCnt" value="${docCnt }" /> 
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdFileCheck2')">
												<img src="<c:url value='/images/ic_plus.png'/>" />
											</a>
										</div>
									</td>
									<td><c:set var="isExist" value="false" /> <c:set
											var="doneLoop" value="false" /> <c:set var="docCnt" value="0" />
										<c:set var="seq" value="" /> <c:forEach var="result"
											items="${ biddingFileList}" varStatus="status">
											<c:if test="${not doneLoop}">
												<c:choose>
													<c:when test="${result.bdFileKindCd eq 'BDFL1130'}">
														<c:set var="isExist" value="true" />
														<c:set var="doneLoop" value="true" />
														<c:set var="docCnt" value="${result.bdDocCnt }" />
														<c:set var="seq" value="${result.bdSeq }" />
													</c:when>
													<c:otherwise>
														<c:set var="isExist" value="false" />
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach> 
										<c:choose>
											<c:when test="${isExist eq true}">
												<input type="checkbox" class="tCheck" id="bdFileCheck3" checked="checked" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" class="tCheck" id="bdFileCheck3" />
											</c:otherwise>
										</c:choose> 
										<label for="bdFileCheck3" class="cursorP"></label> 
										<input type="hidden" name="bdFileCheck" class="tCheck" id="bdFile3" />
									</td>
									<td>법인인감증명서</td>
									<td class="beforeUpdate">
										<div class="indeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1130" />
											<input type="hidden" name="bdSeq" value="${seq }" /> 
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdFileCheck3')">
												<img src="<c:url value='/images/ic_minus.png'/>" />
											</a> 
											<label class="numberUpDown">
												<input type="text" class="bdFileCheck3" name="bdDocCnt" id="afterCnt" value="<c:out value="${docCnt }" />" readOnly />
											</label> 
											<input type="hidden" id="postCnt" value="${docCnt }" /> 
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdFileCheck3')">
												<img src="<c:url value='/images/ic_plus.png'/>" />
											</a>
										</div>
									</td>
								</tr>
								<tr class='ftw200'>
									<td><c:set var="isExist" value="false" /> <c:set
											var="doneLoop" value="false" /> <c:set var="docCnt" value="0" />
										<c:set var="seq" value="" /> <c:forEach var="result"
											items="${ biddingFileList}" varStatus="status">
											<c:if test="${not doneLoop}">
												<c:choose>
													<c:when test="${result.bdFileKindCd eq 'BDFL1140'}">
														<c:set var="isExist" value="true" />
														<c:set var="doneLoop" value="true" />
														<c:set var="docCnt" value="${result.bdDocCnt }" />
														<c:set var="seq" value="${result.bdSeq }" />
													</c:when>
													<c:otherwise>
														<c:set var="isExist" value="false" />
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${isExist eq true}">
												<input type="checkbox" class="tCheck" id="bdFileCheck4" checked="checked" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" class="tCheck" id="bdFileCheck4" />
											</c:otherwise>
										</c:choose> 
										<label for="bdFileCheck4" class="cursorP"></label> 
										<input type="hidden" name="bdFileCheck" class="tCheck" id="bdFile4" />
									</td>
									<td>사용인감계</td>
									<td class="beforeUpdate">
										<div class="indeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1140" />
											<input type="hidden" name="bdSeq" value="${seq }" /> 
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdFileCheck4')">
												<img src="<c:url value='/images/ic_minus.png'/>" />
											</a> 
											<label class="numberUpDown">
												<input type="text" class="bdFileCheck4" name="bdDocCnt" id="afterCnt" value="<c:out value="${docCnt }" />" readOnly />
											</label> 
											<input type="hidden" id="postCnt" value="${docCnt }" /> 
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdFileCheck4')">
												<img src="<c:url value='/images/ic_plus.png'/>" />
											</a>
										</div>
									</td>
									<td><c:set var="isExist" value="false" /> <c:set
											var="doneLoop" value="false" /> <c:set var="docCnt" value="0" />
										<c:set var="seq" value="" /> <c:forEach var="result"
											items="${ biddingFileList}" varStatus="status">
											<c:if test="${not doneLoop}">
												<c:choose>
													<c:when test="${result.bdFileKindCd eq 'BDFL1150'}">
														<c:set var="isExist" value="true" />
														<c:set var="doneLoop" value="true" />
														<c:set var="docCnt" value="${result.bdDocCnt }" />
														<c:set var="seq" value="${result.bdSeq }" />
													</c:when>
													<c:otherwise>
														<c:set var="isExist" value="false" />
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach> 
										<c:choose>
											<c:when test="${isExist eq true}">
												<input type="checkbox" class="tCheck" id="bdFileCheck5" checked="checked" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" class="tCheck" id="bdFileCheck5" />
											</c:otherwise>
										</c:choose> 
										<label for="bdFileCheck5" class="cursorP"></label> 
										<input type="hidden" name="bdFileCheck" class="tCheck" id="bdFile5" />
									</td>
									<td>국세완납증명서</td>
									<td class="beforeUpdate">
										<div class="indeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1150" />
											<input type="hidden" name="bdSeq" value="${seq }" /> 
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdFileCheck5')">
												<img src="<c:url value='/images/ic_minus.png'/>" />
											</a> 
											<label class="numberUpDown">
												<input type="text" class="bdFileCheck5" name="bdDocCnt" id="afterCnt" value="<c:out value="${docCnt }" />" readOnly />
											</label> 
											<input type="hidden" id="postCnt" value="${docCnt }" /> 
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdFileCheck5')">
												<img src="<c:url value='/images/ic_plus.png'/>" />
											</a>
										</div>
									</td>
									<td>
										<c:set var="isExist" value="false" /> 
										<c:set var="doneLoop" value="false" /> 
										<c:set var="docCnt" value="0" />
										<c:set var="seq" value="" /> 
										<c:forEach var="result" items="${ biddingFileList}" varStatus="status">
											<c:if test="${not doneLoop}">
												<c:choose>
													<c:when test="${result.bdFileKindCd eq 'BDFL1160'}">
														<c:set var="isExist" value="true" />
														<c:set var="doneLoop" value="true" />
														<c:set var="docCnt" value="${result.bdDocCnt }" />
														<c:set var="seq" value="${result.bdSeq }" />
													</c:when>
													<c:otherwise>
														<c:set var="isExist" value="false" />
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach> 
										<c:choose>
											<c:when test="${isExist eq true}">
												<input type="checkbox" class="tCheck" id="bdFileCheck6" checked="checked" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" class="tCheck" id="bdFileCheck6" />
											</c:otherwise>
										</c:choose> 
										<label for="bdFileCheck6" class="cursorP"></label> 
										<input type="hidden" name="bdFileCheck" class="tCheck" id="bdFile6" />
									</td>
									<td>지방세완납증명원</td>
									<td class="beforeUpdate">
										<div class="indeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1160" />
											<input type="hidden" name="bdSeq" value="${seq }" /> 
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdFileCheck6')">
												<img src="<c:url value='/images/ic_minus.png'/>" />
											</a> 
											<label class="numberUpDown">
												<input type="text" class="bdFileCheck6" name="bdDocCnt" id="afterCnt" value="<c:out value="${docCnt }" />" readOnly />
											</label> 
											<input type="hidden" id="postCnt" value="${docCnt }" /> 
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdFileCheck6')">
												<img src="<c:url value='/images/ic_plus.png'/>" />
											</a>
										</div>
									</td>
								</tr>
								<tr class='ftw200'>
									<td>
									<c:set var="etcdocCnt" value="0" /> 
									<c:set var="etcdocNm" value="" /> 
									<c:set var="etcdocSeq" value="0" />
										<%
											ArrayList pList = new ArrayList();
											ArrayList list = new ArrayList();
										%> 
										<c:forEach var="result" items="${ biddingFileList}" varStatus="status">
											<c:choose>
												<c:when test="${result.bdFileKindCd eq 'BDFL1199'}">
													<c:set var="etcdocCnt" value="${result.bdDocCnt }" />
													<c:set var="etcdocNm" value="${result.bdFileDocNm }" />
													<c:set var="etcdocSeq" value="${result.bdSeq }" />
													<%
														list.add((String) pageContext.getAttribute("etcdocNm"));
														list.add(pageContext.getAttribute("etcdocCnt"));
														list.add(pageContext.getAttribute("etcdocSeq"));
														pList.add(list);
														list = new ArrayList();
													%>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</c:forEach> 
										<%
									 		pageContext.setAttribute("pList", pList);
										 %> 
										 <input type="checkbox" class="tCheck" id="bdFileCheck7" /> 
										 <label for="bdFileCheck7" class="cursorP"></label> 
										 <input type="hidden" name="bdFileCheck" class="tCheck" id="bdFile7" />
									</td>
									<td>기타서류</td>
									<td colspan="7">
										<div class="indeWrap floatL" id="etcIndeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1199" />
											<input type="hidden" name="bdSeq" value="" /> 
											<input type="text" style="margin-right: 7px;" name="bdFileDocNm" id="etcFileDocNm" disabled /> 
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdFileCheck7')">
												<img src="<c:url value='/images/ic_minus.png'/>" />
											</a> 
											<label class="numberUpDown">
												<input type="text" class="bdFileCheck7" name="bdDocCnt" value="0" readOnly />
											</label> 
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdFileCheck7')">
												<img src="<c:url value='/images/ic_plus.png'/>" />
											</a>
										</div>
										<button type="button" onclick="fn_addDocEtc(this);" id="addDocEtcBtn" class="dpNone">
											<img src="/images/add_circle_outline.png">
										</button>
										<div class="floatC"></div>
									</td>
								</tr>
								<tr class="ftw200">
									<td></td>
									<td></td>
									<td colspan="7">
										<c:forEach var="entry" items="${pList }" varStatus="status">
											<label class="entryList"><c:out value="${entry[0] }" /> <c:out value="${entry[1] }" />부</label>
											<button type="button" style="color: #e5e5e5; margin-right: 5px;" onclick="fn_delEtcDoc(this, ${entry[2] });">
												<img src="/images/popup_close.png" style="width: 7px; height: 7px; margin-bottom: 1.5px;" />
											</button>
										</c:forEach>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
				<form id="fileForm" method="post" enctype="multipart/form-data">
					<!-- <button type="button" id="add" style="border: 1px solid #000; padding: 5px 10px; ">추가</button><br /> -->
					<input type="hidden" name="docTypeNm" value="입찰_첨부파일" /> 
					<input type="hidden" name="fileCtKey" id="fileCtKey" value="${spKey}" />
					<input type="hidden" name="spBusiNm" id="fileSpBusiNm" value="<c:out value="${biddingVO.spBusiNm}"/>" /> 
					<input type="hidden" name="atchFileCnt" id="atchFileCnt" title="첨부된갯수" value="${fn:length(fileList)}" /> 
					<input type="hidden" name="maxFileCnt" id="maxFileCnt" title="첨부가능최대갯수" value="<c:out value='${maxFileCnt}'/>" /> 
					<input type="hidden" name="maxFileSize" id="maxFileSize" title="파일사이즈" value="<c:out value='${maxFileSize}'/>" />
					<div class="floatL uploadContainer">
						<input class="uploadName" placeholder="" disabled="disabled" /> 
						<label for="exFile" class="exFileLabel"></label> 
						<input type="file" id="exFile" class="exFile" multiple="multiple" name="file" />
					</div>
					<div style="width: 307px; clear: both;" id="fileWrap">
						<c:forEach var="result" items="${fileList }" varStatus="status">
							<input class="upload-name cursorP" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly />
							<a class="close cursorP" onclick="fn_deleteFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm }" />')">
								<img src="/images/btn_close.png" />
							</a>
							<c:if test="${status.last eq false}">
								<br />
							</c:if>
						</c:forEach>
					</div>
					<!-- <button type="button" id="save" style="border: 1px solid #000; padding: 5px 10px;">저장</button> -->
				</form>
				<form:form id="fileViewForm" name="fileViewForm" method="POST">
					<input type="hidden" name="fileKey" value="" />
					<input type="hidden" name="fileOrgNm" value="" />
				</form:form>
			</div>
			<div class="btnWrap floatL">
				<div class="floatL btnPrev">
					<button type="button" onclick="javascript:fnMoveTab('progress');" class="move">
						<img src="<c:url value='/images/btn_prev.png'/>" /> <span
							class="moveSpan right">저장/수정하지 않은 정보는<br>반영되지 않습니다.</span>
					</button>
				</div>
				<c:set var="systemName" value='<%=session.getAttribute("name")%>' />
				<c:set var="mngName" value="${forecast.empNm }" />
				<c:set var="empAuth" value='<%=session.getAttribute("empAuthCd").equals("EMAU1001") %>' />
				<c:if test="${(systemName eq mngName or empAuth eq true) and forecast.spState ne 'S' }">
					<div class="floatL btnSave">
						<button type="button" onclick="javascript:fn_chkVali()">
							<img src="<c:url value='/images/btn_save.png'/>" />
						</button>
					</div>
				</c:if>
				<div class="floatN floatC"></div>
			</div>
		</div>
	</div>
	<div class="wrap-loading dpNone">
		<div>
			<img src="<c:url value='/images/ajax_loader.gif'/>" />
		</div>
	</div>
</body>
</html>