<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
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
		.popContainer .contents > div > table {
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
			margin-bottom: 3px;
			padding-right: 18px;
		}
		.popContainer .contents input:disabled {
		  	background-color: #ccc;
		  	background-image: none !important;
		}
		.popContainer .contents input:disabled + label {
		  	background-color: #ccc;
		}
		.popContainer .contents input[class="pname"] {
			width: 400px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 110px;
			height: 40px;
			background-image: url('/images/icon_calendar.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
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
		.popContainer .contents td:last-child  {
			padding-right: 0px !important;
		} 		
		.popContainer .contents tr.first td { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  		
			border-bottom:2px solid #e5e5e5;				
			padding-bottom: 15px;
			vertical-align: inherit;		
			padding-right: 18px;
			/* font-size: 18px; */
		}
		.popContainer .contents tr.after td {
			padding-top: 10px;
		}		
		.popContainer .contents tr > td {
			font-size: 14px;						
			padding-right: 10px;
		    padding-top: 5px;
		}
		.popContainer .contents tr > td .ttile {
			font-size: 18px;
			padding: 17px 0;
		}
		.popContainer .contents tr > td .indeWrap {
			font-size: 0;
		}
		.popContainer .contents tr > td .decreaseQuantity,
		.popContainer .contents tr > td .increaseQuantity {
			background-color: #e4e6f0;
		    padding: 0px 10px;
		    border: 1px solid #dcdde3;
		    font-size: 16px;
		}
		.popContainer .contents tr > td .numberUpDown {
			font-size: 16px;
		    display: inline-block;
		    width: 30px;
		    text-align: center;
		    border-top: 1px solid #dcdde3;
		    border-bottom: 1px solid #dcdde3;
		    line-height: 1.5;
    	}
		.popContainer .contents tr > td:nth-child(2) {
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
                if ($("#bdFileForm")[0].checkValidity()){
	            	fn_save();
                } else {
                	$("#bdFileForm")[0].reportValidity();   
                }
            } else {
                $("#bdInfoForm")[0].reportValidity();   
            }            
		}
		
		var countSave = 0;
		var turnNo = $("#turnNo").val();
		
		function fn_save() {
			var object = {};
			
			$("input[type='checkbox'][id*='Check']").each(function() {
				if($(this).is(":checked") == true) {
					$("#"+$(this).attr("id").replace("Check", "")).val('Y');
				} else {
					$("#"+$(this).attr("id").replace("Check", "")).val('N');
				}
			})
			
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
			$.ajax({
				url: "/project/insert/biddingInfo.do",
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
			    		if($("#bdKey").val() == null || $("#bdKey").val() == "" || $("#bdKey").val().length == 0) {
				    		alert("프로젝트 입찰 정보가 등록되었습니다.");
				    		countSave++;
			    		} else {
			    			alert("프로젝트 입찰 정보가 수정되었습니다.");
			    		}
			    		
			    		var url='/project/write/biddingInfo.do';
		    			var dialogId = 'program_layer';
		    			var varParam = {
							"pjKey":$("#pjKey").val()
		    			}
			   			var button = new Array;
		    			button = [];
		    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			    	} else {
			    		if($("#bdKey").val() == null || $("#bdKey").val() == "" || $("#bdKey").val().length == 0) {
			    			alert("프로젝트 계약 정보 등록이 실패하였습니다.");
			    		} else {
			    			alert("프로젝트 계약 정보 수정이 실패하였습니다.");
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
						"pjKey": $("#pjKey").val()/* ,
						"turnNo":$("#turnNo").val(),
						"ctKey":ctKeyList,
						"salesKey": salesKeyList */
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px');
			}
			else {
				if($('#bdKey').val() != "" || $('#bdKey').val().length != 0) {
					var url = '/project/write/'+link+'.do';
					var dialogId = 'program_layer';
					var varParam = {
							"pjKey": $("#pjKey").val()/* ,
							"turnNo":$("#turnNo").val(),
							"ctKey":ctKeyList,
							"salesKey": salesKeyList */
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px');
				} else {
					alert('저장을 해주세요.');
				}
			}
		}
		
		function fn_prevView(){
			var url = '/project/write/basicInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey" : $('#pjKey').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_checkDecCount(id) {
			/* e.preventDefault();  */
			var stat = $("."+id).val();
			var num = parseInt(stat,10);
			num--;
			
			if(num<=0){
				$("#"+id).prop("checked", false);	
			} else if(num<=-1) {
				alert('더 이상 줄일 수 없습니다.');
				num = 0;
			}
			
			if($("#"+id).is(":checked") ==false) {
				num = 0;
			}
			
			if(id == "bdGuarantyCheck7" && $("#"+id).is(":checked") == false) {
				$("#etcFileDocNm").attr('disabled', true);
				$("#etcFileDocNm").attr('required', false);
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
			 
			if(id == "bdGuarantyCheck7" && $("#"+id).is(":checked") == true) {
				$("#etcFileDocNm").attr('disabled', false);
				$("#etcFileDocNm").attr('required', true);
			} 

			$("."+id).val(num);
		}
		
		function fn_delEtcDoc(obj, seq) {
			$(obj).css('display','none');
			$(obj).prev().css('display','none');
			$(obj).next().css('display','none');
			
			var html = "";
			html += "<input type='hidden' name='bdGuarantyCheck' value='N' />";
			html += "<input type='hidden' name='bdFileKindCd' value='BDFL1199' />";
			html += "<input type='hidden' name='bdSeq' value="+seq+" />";
			html += "<input type='hidden' name='bdDocCnt' value='0' />";
			
			$("#etcIndeWrap").append(html);
		}
		
		$(document).ready(function() {
			
			if($('#bdGbYnCheck').is(':checked') == true) {
				$(".bdDt").attr('disabled',false);
				$(".bdDt").attr('required',true);
				$("#bdGbFinishYnCheck").attr('disabled',false);
			} else {
				$(".bdDt").attr('disabled',true);
				$(".bdDt").attr('required',false);
				$(".publish").attr('disabled',true);
				$(".publish").attr('required',false);
				$("#bdGbFinishYnCheck").attr('disabled',true);
				$("#bdGbFinishYnCheck").attr('checked',false);
			}
			
			if($('#bdGbFinishYnCheck').is(':checked') == true) {
				$(".publish").attr('disabled',false);
				$(".publish").attr('required',true);
			} else {
				$(".publish").attr('disabled',true);
				$(".publish").attr('required',false);
			}
			
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
			
			if($('#bdGuarantyCheck7').is(':checked') == true) {
				$("#etcFileDocNm").attr('disabled',false);
			} else {
				$("#etcFileDocNm").attr('disabled',true);
			}
			
			$('#bdGbYnCheck').click(function() {
				if($(this).is(':checked') == true) {
					$(".bdDt").attr('disabled',false);
					$(".bdDt").attr('required',true);
					$("#bdGbFinishYnCheck").attr('disabled',false);
				} else {
					$(".bdDt").attr('disabled',true);
					$(".bdDt").attr('required',false);
					$(".bdDt").val('');
					$(".publish").attr('disabled',true);
					$(".publish").attr('required',false);
					$(".publish").val('');
					$("#bdGbFinishYnCheck").attr('disabled',true);
					$("#bdGbFinishYnCheck").attr('checked',false);
				}
			});
			
			$('#bdGbFinishYnCheck').click(function() {
				if($(this).is(':checked') == true) {
					$(".publish").attr('disabled',false);
					$(".publish").attr('required',true);
				} else {
					$(".publish").attr('disabled',true);
					$(".publish").attr('required',false);
					$(".publish").val('');
				}
			});
			
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
			
			$('#bdGuarantyCheck7').click(function() {
				if($(this).is(':checked') == true) {
					$("#etcFileDocNm").attr('disabled',false);
				} else {
					$("#etcFileDocNm").attr('disabled',true);
				}
			});
			
			$("input[id*='bdGuarantyCheck']").click(function() {
				if($(this).is(":checked") == true) {
					fn_checkIncCount($(this).attr("id"));	
				} else {
					fn_checkDecCount($(this).attr("id"));	
				}
			});
			
			if($('input[id=bdKey]').val() != "" || $('input[id=bdKey]').val().length != 0) {
				$('.btnSave').children().eq(0).html('');
				$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />'); 
			}
		});
	</script>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">프로젝트 등록</div>
				<div class="subTitle">입찰</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
				<li class="colorWhite cursorP on">입찰 정보 및 제안</li>
			</ul>
		</div>
		<%-- <form:form commandName="bdInfoForm" id="bdInfoForm" name="bdInfoForm" method="post"> --%>
		<div class="contents">
			<div>
				<form id="bdInfoForm" name="bdInfoForm" method="post">
					<input type="hidden" id="pjKey" value="${pjKey }" name="pjKey" />
					<input type="hidden" id="bdKey" value="${biddingVO.bdKey }" name="bdKey" />
					<input type="hidden" id="bdGbYn" value="${biddingVO.bdGbYn }" name="bdGbYn" />
					<input type="hidden" id="bdGbFinishYn" value="${biddingVO.bdGbFinishYn }" name="bdGbFinishYn" />
					<input type="hidden" id="bdProposalYn" value="${biddingVO.bdProposalYn }" name="bdProposalYn" />
					<input type="hidden" id="bdProposalPresentYn" value="${biddingVO.bdProposalPresentYn }" name="bdProposalPresentYn" />
					<input type="hidden" id="pjStatusCd" value="PJST1000" name="pjStatusCd" />
					<div>
						<div id="infoTable">
							<table>
								<tr class='ftw200'>
									<td>
										<input type="checkbox" class="tCheck" id="bdGbYnCheck" <c:if test="${biddingVO.bdGbYn eq 'Y'}">checked="checked"</c:if>/>
										<label for="bdGbYnCheck" class="cursorP"></label>
									</td>
									<td>입찰 보증 증권</td>
									<td colspan="3">
										<input type='text' placeholder='from' class='calendar bdDt' name='bdGbStartDt' value='${displayUtil.displayDate(biddingVO.bdGbStartDt) }' disabled/> ~
										<input type='text' placeholder='to' class='calendar bdDt' name='bdGbEndDt' value='${displayUtil.displayDate(biddingVO.bdGbEndDt) }' disabled/>
									</td>
									<td>
										<input type="checkbox" class="tCheck" id="bdGbFinishYnCheck" disabled <c:if test="${biddingVO.bdGbFinishYn eq 'Y'}">checked="checked"</c:if>/>
										<label for="bdGbFinishYnCheck" class="cursorP"></label>
									</td>
									<td>완료</td>
									<td colspan="3">
									 	<input type='text' id='bdGbFinishDt' placeholder='발행 일자' class='calendar publish' name='bdGbFinishDt'  value='${displayUtil.displayDate(biddingVO.bdGbFinishDt) }' disabled/>
									 	<input type='text' id='bdGbAmount' placeholder='금액' amountOnly class='amount publish' width='177px' name='bdGbAmount' 
									 		<c:choose><c:when test="${biddingVO.bdGbAmount ne null && biddingVO.bdGbAmount ne 0}">value="${displayUtil.commaStr(biddingVO.bdGbAmount) }"</c:when><c:otherwise>value=""</c:otherwise></c:choose> disabled/>
									 </td>
							 	</tr>
							 	<tr class='ftw200 first'>
							 		<td></td>
							 		<td>입찰 기한</td>
							 		<td colspan="8">
									 	<input type='text' id='bdLimitDt' placeholder='입찰 기한' class='calendar' name='bdLimitDt' value="${displayUtil.displayDate(biddingVO.bdLimitDt) }" required/>
									 	<input type='time' id='bdLimitTm' placeholder='입찰 시간' name='bdLimitTm' value="${displayUtil.displayTime(biddingVO.bdLimitTm) }"/>
									 </td>
							 	</tr>
								<tr class='ftw200'>
									<td>
										<input type="checkbox" class="tCheck" id="bdProposalYnCheck" <c:if test="${biddingVO.bdProposalYn eq 'Y'}">checked="checked"</c:if>/>
										<label for="bdProposalYnCheck" class="cursorP"></label>
									</td>						
									<td>제안서</td>
									<td colspan="7">
										<input type='text' id='bdProposalDueDt' placeholder='접수 마감일' class='calendar proposal' name='bdProposalDueDt' value="${displayUtil.displayDate(biddingVO.bdProposalDueDt) }" disabled/>
										<input type='time' id='bdProposalDueTm' placeholder='접수 마감 시간' class="proposal" name='bdProposalDueTm' value="${displayUtil.displayTime(biddingVO.bdProposalDueTm) }" disabled/>
										<button type="button" class="veralignM" style="margin-left: 5px;"><img src="/images/btn_file_upload.png"/></button>
									</td>
								</tr>
								<tr class='ftw200 first'>
									<td>
										<input type="checkbox" class="tCheck" id="bdProposalPresentYnCheck" <c:if test="${biddingVO.bdProposalPresentYn eq 'Y'}">checked="checked"</c:if> disabled />
										<label for="bdProposalPresentYnCheck" class="cursorP"></label>
									</td>						
									<td>제안 발표</td>
									<td colspan="7">
										<input type='text' id='bdProposalPresentDt' placeholder='발표일' class='calendar present' name='bdProposalPresentDt' value="${displayUtil.displayDate(biddingVO.bdProposalPresentDt) }" disabled/>
										<input type='time' id='bdProposalPresentTm' placeholder='발표 시간' class="present" name='bdProposalPresentTm' value="${displayUtil.displayTime(biddingVO.bdProposalPresentTm) }" disabled/>
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
									<td colspan='2' style='min-width: 96px;'><div class="ttile">입찰 서류 정보</div></td>
								</tr>
								<tr class='ftw200'>
									<td>
										<c:set var="isExist" value="false"/>
										<c:set var="doneLoop" value="false"/>
										<c:set var="docCnt" value="0" />
										<c:set var="seq" value="" />
										<c:forEach var="result" items="${ biddingFileList}" varStatus="status">
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
												<input type="checkbox" class="tCheck" id="bdGuarantyCheck1" checked="checked"/> 
											</c:when>
											<c:otherwise>
												<input type="checkbox" class="tCheck" id="bdGuarantyCheck1" /> 
											</c:otherwise>
										</c:choose>
										<label for="bdGuarantyCheck1" class="cursorP"></label>
										<input type="hidden" name="bdGuarantyCheck" class="tCheck" id="bdGuaranty1" /> 
									</td>						
									<td>사업자 등록증</td>
									<td>
										<div class="indeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1110" />
											<input type="hidden" name="bdSeq" value="${seq }" />
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdGuarantyCheck1')"><img src="<c:url value='/images/ic_minus.png'/>" /></a>
											<label class="numberUpDown"><input type="text" class="bdGuarantyCheck1" name="bdDocCnt" value="<c:out value="${docCnt }" />" readOnly /></label>
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdGuarantyCheck1')"><img src="<c:url value='/images/ic_plus.png'/>"/></a>
										</div>
									</td>
									<td>
										<c:set var="isExist" value="false"/>
										<c:set var="doneLoop" value="false"/>
										<c:set var="docCnt" value="0" />
										<c:set var="seq" value="" />
										<c:forEach var="result" items="${ biddingFileList}" varStatus="status">
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
												<input type="checkbox" class="tCheck" id="bdGuarantyCheck2" checked="checked"/> 
											</c:when>
											<c:otherwise>
												<input type="checkbox" class="tCheck" id="bdGuarantyCheck2" /> 
											</c:otherwise>
										</c:choose>
										<label for="bdGuarantyCheck2" class="cursorP"></label>
										<input type="hidden" name="bdGuarantyCheck" class="tCheck" id="bdGuaranty2" /> 
									</td>						
									<td>법인등기부등본</td>
									<td>
										<div class="indeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1120" />
											<input type="hidden" name="bdSeq" value="${seq }" />
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdGuarantyCheck2')"><img src="<c:url value='/images/ic_minus.png'/>" /></a>
											<label class="numberUpDown"><input type="text" class="bdGuarantyCheck2" name="bdDocCnt" value="<c:out value="${docCnt }" />" readOnly /></label>
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdGuarantyCheck2')"><img src="<c:url value='/images/ic_plus.png'/>"/></a>
										</div>
									</td>
									<td>
										<c:set var="isExist" value="false"/>
										<c:set var="doneLoop" value="false"/>
										<c:set var="docCnt" value="0" />
										<c:set var="seq" value="" />
										<c:forEach var="result" items="${ biddingFileList}" varStatus="status">
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
												<input type="checkbox" class="tCheck" id="bdGuarantyCheck3" checked="checked"/> 
											</c:when>
											<c:otherwise>
												<input type="checkbox" class="tCheck" id="bdGuarantyCheck3" /> 
											</c:otherwise>
										</c:choose>
										<label for="bdGuarantyCheck3" class="cursorP"></label>
										<input type="hidden" name="bdGuarantyCheck" class="tCheck" id="bdGuaranty3" /> 
									</td>						
									<td>법인인감증명서</td>
									<td>
										<div class="indeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1130" />
											<input type="hidden" name="bdSeq" value="${seq }" />
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdGuarantyCheck3')"><img src="<c:url value='/images/ic_minus.png'/>" /></a>
											<label class="numberUpDown"><input type="text" class="bdGuarantyCheck3" name="bdDocCnt" value="<c:out value="${docCnt }" />" readOnly /></label>
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdGuarantyCheck3')"><img src="<c:url value='/images/ic_plus.png'/>"/></a>
										</div>
									</td>
								 </tr>
								 <tr class='ftw200'>
									<td>
										<c:set var="isExist" value="false"/>
										<c:set var="doneLoop" value="false"/>
										<c:set var="docCnt" value="0" />
										<c:set var="seq" value="" />
										<c:forEach var="result" items="${ biddingFileList}" varStatus="status">
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
												<input type="checkbox" class="tCheck" id="bdGuarantyCheck4" checked="checked"/> 
											</c:when>
											<c:otherwise>
												<input type="checkbox" class="tCheck" id="bdGuarantyCheck4" /> 
											</c:otherwise>
										</c:choose>
										<label for="bdGuarantyCheck4" class="cursorP"></label>
										<input type="hidden" name="bdGuarantyCheck" class="tCheck" id="bdGuaranty4" /> 
									</td>						
									<td>사용인감계</td>
									<td>
										<div class="indeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1140" />
											<input type="hidden" name="bdSeq" value="${seq }" />
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdGuarantyCheck4')"><img src="<c:url value='/images/ic_minus.png'/>" /></a>
											<label class="numberUpDown"><input type="text" class="bdGuarantyCheck4" name="bdDocCnt" value="<c:out value="${docCnt }" />" readOnly /></label>
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdGuarantyCheck4')"><img src="<c:url value='/images/ic_plus.png'/>"/></a>
										</div>
									</td>
									<td>
										<c:set var="isExist" value="false"/>
										<c:set var="doneLoop" value="false"/>
										<c:set var="docCnt" value="0" />
										<c:set var="seq" value="" />
										<c:forEach var="result" items="${ biddingFileList}" varStatus="status">
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
												<input type="checkbox" class="tCheck" id="bdGuarantyCheck5" checked="checked"/> 
											</c:when>
											<c:otherwise>
												<input type="checkbox" class="tCheck" id="bdGuarantyCheck5" /> 
											</c:otherwise>
										</c:choose>
										<label for="bdGuarantyCheck5" class="cursorP"></label>
										<input type="hidden" name="bdGuarantyCheck" class="tCheck" id="bdGuaranty5" /> 
									</td>						
									<td>위임장</td>
									<td>
										<div class="indeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1150" />
											<input type="hidden" name="bdSeq" value="${seq }" />
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdGuarantyCheck5')"><img src="<c:url value='/images/ic_minus.png'/>" /></a>
											<label class="numberUpDown"><input type="text" class="bdGuarantyCheck5" name="bdDocCnt" value="<c:out value="${docCnt }" />" readOnly /></label>
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdGuarantyCheck5')"><img src="<c:url value='/images/ic_plus.png'/>"/></a>
										</div>
									</td>
									<td>
										<c:set var="isExist" value="false"/>
										<c:set var="doneLoop" value="false"/>
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
												<input type="checkbox" class="tCheck" id="bdGuarantyCheck6" checked="checked"/> 
											</c:when>
											<c:otherwise>
												<input type="checkbox" class="tCheck" id="bdGuarantyCheck6" /> 
											</c:otherwise>
										</c:choose>
										<label for="bdGuarantyCheck6" class="cursorP"></label>
										<input type="hidden" name="bdGuarantyCheck" class="tCheck" id="bdGuaranty6" /> 
									</td>						
									<td>대리인명함</td>
									<td>
										<div class="indeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1160" />
											<input type="hidden" name="bdSeq" value="${seq }" />
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdGuarantyCheck6')"><img src="<c:url value='/images/ic_minus.png'/>" /></a>
											<label class="numberUpDown"><input type="text" class="bdGuarantyCheck6" name="bdDocCnt" value="<c:out value="${docCnt }" />" readOnly /></label>
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdGuarantyCheck6')"><img src="<c:url value='/images/ic_plus.png'/>"/></a>
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
										<%pageContext.setAttribute("pList", pList); %>
										<input type="checkbox" class="tCheck" id="bdGuarantyCheck7" /> 
										<label for="bdGuarantyCheck7" class="cursorP"></label>
										<input type="hidden" name="bdGuarantyCheck" class="tCheck" id="bdGuaranty7" /> 
									</td>						
									<td>기타서류</td>
									<td colspan="7">
										<div class="indeWrap" id="etcIndeWrap">
											<input type="hidden" name="bdFileKindCd" value="BDFL1199" />
											<input type="hidden" name="bdSeq" value="" />
											<input type="text" style="width: 97px; margin-right: 7px;" name="bdFileDocNm" id="etcFileDocNm" disabled/>
											<a class="decreaseQuantity" onclick="fn_checkDecCount('bdGuarantyCheck7')"><img src="<c:url value='/images/ic_minus.png'/>" /></a>
											<label class="numberUpDown"><input type="text" class="bdGuarantyCheck7" name="bdDocCnt" value="0" readOnly /></label>
											<a class="increaseQuantity" onclick="fn_checkIncCount('bdGuarantyCheck7')"><img src="<c:url value='/images/ic_plus.png'/>"/></a>
										</div>
									</td>
								</tr>
								<tr class='ftw200'>
									<td></td>						
									<td></td>
									<td colspan="7">
										<c:forEach var="entry" items="${pList }" varStatus="status">
											<label><c:out value="${entry[0] }" /> <c:out value="${entry[1] }" /></label>
											<button type="button" style="color: #e5e5e5;" onclick="fn_delEtcDoc(this, ${entry[2] });"><img src="/images/popup_close.png" style="width: 7px; height: 7px; margin-bottom: 1.5px;"/></button>
											<br>
										</c:forEach>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
			<div class="btnWrap floatR">
				<div class="floatL btnPrev">
					<button type="button" onclick="fn_prevView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
				</div>
				<div class="floatL btnSave">
					<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
				</div>
				<div class="floatR">
					<button type="button" onclick="javascript:fn_next('contractInfo')"><img src="<c:url value='/images/btn_next.png'/>" /></button>
				</div>
				<div class="floatN floatC"></div>
			</div>
		</div>
	</div>
</body>
</html>