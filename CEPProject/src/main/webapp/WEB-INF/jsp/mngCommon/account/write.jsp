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
			width: 1122px;
			height: 634px;
			top: 107px;
			z-index: 3;
			background-color: #f6f7fc;
			z-index: 3;
			overflow-y: auto;
		}		
		.popContainer .contents td.tdTitle {
			margin-top: 11px;
			font-size: 14px;
			color: #525252;
			padding: 2px 20px 2px 34px;
			width: 99px;
		}					
		.popContainer .contents td.tdSubTitle {
		    margin-top: 11px;
		    font-size: 14px;
		    color: #525252;
		    padding-right: 9px;
		    padding-left: 19px;
		    width: 87px;
		}	
		.popContainer .contents td.tdContents {
			width: 720px;
			font-size: 14px;
    		color: #525252;
    		padding: 2px 0px 2px 0px
		} 
		.popContainer .contents > div {
			width: 1074px;
			margin: 20px 0;
		}
		.popContainer .contents > div:first-child {
			width: 433px;
			min-height: 408px;
			margin: 10px 40px 15px 40px;
		}
		
		/* .popContainer .contents > div:last-child {
			width: 433px;
			margin-right: 50px;
		} */
		.popContainer .contents > div > table {
			border-collapse: separate; 
	  		border-spacing: 0 3px;
		}
		.popContainer .contents input {
			width: 220px;
			height: 31px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		
		.popContainer .contents td label , .director_middle thead th label, .deposit_middle thead th label{
			color: red;
			vertical-align: middle;
      	}
      	.director_middle thead th span, .deposit_middle thead th span {
      		font-size: 13px;
    		font-weight: 200;
      	}
		.popContainer .contents select {
			width: 70px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		#pop_listForm {
			padding-left: 34px;
		}
		
		/* 소타이틀(기본정보, 발주정보, 제품정보) 관련 css*/
		.contents .stitle {
			font-size: 18px;
			font-weight: 500;
			margin-bottom: 10px;
			margin-top: 26px;
		}
		.director_middle table, .deposit_middle table {
			width: 900px;
			font-size: 15px;
			margin-top: 16px;
			border-collapse: collapse;
			overflow: hidden;
			border-top: 4px solid #6a5bae;
		}
		.director_middle table thead , .deposit_middle table thead{
			background-color: #e1dff5;
			float: left;
			width: 1040px;
		}
		.director_middle table thead tr , .deposit_middle table thead tr {
			display: table;
			width: 1040px;
		}
		.director_middle table tbody, .deposit_middle table tbody{
			width: 1040px;
			max-height: 138px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.director_middle table tbody tr , .deposit_middle table tbody tr{
			display: table;
			width: 1040px;
			cursor: pointer;
		}
		.director_middle table tbody tr:hover , .deposit_middle tbody tr:hover{
			background-color: #ddf0ec
		}
		.director_middle table thead th, .director_middle table tbody tr td , .deposit_middle table thead th, .deposit_middle table tbody tr td{
			padding: 10px 0;
			border: 1px solid #edebef;
		}	
		
		.director_middle table tbody tr td , .deposit_middle table tbody tr td{
			padding: 2px 2px 2px 2px;
		}
		
		.director_middle table tbody input {
			width: calc(100% - 24px) !important;
		}
		
		.director_middle table thead th:first-child,
		.director_middle table tbody td:first-child {
			width: 85px; 
		}
		.director_middle table thead th:nth-child(2),
		.director_middle table tbody td:nth-child(2) {
			width: 117px;
		}
		.director_middle table thead th:nth-child(3),
		.director_middle table tbody td:nth-child(3) {
			width: 77px;
		}
		.director_middle table thead th:nth-child(4),
		.director_middle table tbody td:nth-child(4),
		.director_middle table thead th:nth-child(5),
		.director_middle table tbody td:nth-child(5) {
			width: 143px;
		}
		.director_middle table thead th:nth-child(6),
		.director_middle table tbody td:nth-child(6) {
			width: 202px;
		}
		.director_middle table thead th:nth-child(7),
		.director_middle table tbody td:nth-child(7) {
			width: 248px;
		}
		.director_middle table thead th:nth-child(8),
		.director_middle table tbody td:nth-child(8) {
			width: 62px;
		}
		.director_middle table tbody td:nth-child(8) {
			text-align: center;
		}
		.deposit_middle table thead th:first-child,
		.deposit_middle table tbody td:first-child {
			width: 255px; 
		}
		.deposit_middle table thead th:nth-child(2),
		.deposit_middle table tbody td:nth-child(2) {
			width: 323px;
		}
		.deposit_middle table thead th:nth-child(3),
		.deposit_middle table tbody td:nth-child(3) {
			width: 235px;
		}
		.deposit_middle table thead th:nth-child(4),
		.deposit_middle table tbody td:nth-child(4) {
			width: 119px;
			max-width: 119px;
			text-align: center;
		}
		.deposit_middle table thead th:nth-child(5),
		.deposit_middle table tbody td:nth-child(5) {
			width: 90px;
		}
		.deposit_middle table tbody td:nth-child(5) {
			text-align: center;
		}
		.popContainer .contents .btnSave {
			width: auto;
		}
		.hgt35 {
			height: 35px;
		}
		#chkExist {
			vertical-align: top;
			margin-top: 1px;
		}
	</style>
	<script>
		$(document).ready(function() {
			if($("#selectKey").val() != null && $("#selectKey").val() != "" && $("#selectKey").val().length != 0) {
				$('.btnSave').children().eq(0).html('');
				$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />');
				$("#e_acKey").attr("readonly", true);
    			$("#chkExist img").attr("src", "/images/btn_green_mod.png");
    			$("#chkExist").attr("onclick", "clearExist(this);");
			}
		});
		
		$(document).on("keyup", ".phoneNumber", function() { 
			$(this).val($(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-")); 
		});
		
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
							
							if((this.name).includes("acRepBknoYn")) {
								this.name = this.name.replace(/[0-9]/g, "");
							}
							
							obj[this.name] = this.value;
							
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('acEnd' == this.name){
								objArry.push(obj);
								obj = {};
							}
						}); 	              
					} 
				} 
			} catch(e) { 
				alert(e.message); 
			} finally {} 
			return objArry; 
		}
		
		function isExist(obj) {
			obj.value = Number(obj.value) + 1;
			
			var object = {};
			var formData = $("#basicForm").serializeArray();
			
			for(var i = 0; i < formData.length; i++) {
				object[formData[i]['name']] = formData[i]['value'];
			}
			
			var sendData = JSON.stringify(object);
			
			if($("#e_acKey").val().replace(" ","").length == 0) {
				alert('사업자 번호를 입력해주세요.');
				$("#e_acKey").focus();
			} else {
				if(!fn_checkCorporateRegistrationNumber($("#e_acKey").val())){
				   alert("유효한 사업자번호를 입력하세요.");
				   $("#e_acKey").focus();
				   $("#e_acKey").val("");
				} else {
					$.ajax({
						url: "/mngCommon/account/isExist.do",
						dataType: "json",
						type: "POST",
						data: sendData,
					 	contentType: "application/json; charset=UTF-8", 
						beforeSend: function(xhr) {
							xhr.setRequestHeader("AJAX", true);
							//xhr.setRequestHeader(header, token);
							
						},
					    success:function(response){	
					    	if(response.successYN == 'Y') {
					    		if(response.acCount == 0) {
					    			alert('사용 가능한 사업자 번호 입니다.');
					    			$("#e_acKey").focus();
					    			$("#e_acKey").attr("readonly", true);
					    			$("#chkExist img").attr("src", "/images/btn_green_mod.png");
					    			$("#chkExist").attr("onclick", "clearExist(this);");
					    		} else {
					    			alert('이미 존재하는 거래처 입니다.');
					    			$("#e_acKey").val('');
					    			$("#chkExist").val(0);
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
		}
		
		function clearExist(obj) {
			$("#e_acKey").focus();
			$("#e_acKey").attr("readonly", false);
			$("#chkExist img").attr("src", "/images/dup_check.png");
			$("#chkExist").attr("onclick", "isExist(this);");
			$("#chkExist").val(0);
		}
		
		// 사업자 번호 정규식
		function fn_checkCorporateRegistrationNumber(value) {
			/* var valueMap = value.replace(/-/gi, '').split('').map(function(item) {
				return parseInt(item, 10);
			});
			
			if(valueMap.length == 10) {
				var multiply = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5);
				var checkSum = 0;
				
				for(var i = 0; i < multiply.length; i++) {
					checkSum += multiply[i] * valueMap[i];
				}
				
				checkSum += parseInt((multiply[8] * valueMap[8]) / 10, 10);
				return Math.floor(valueMap[9]) == (10 - (checkSum % 10));
			}
			
			return false; */
			
			return true;
		}
		
		// 이름 정규식
		function fn_checkName(value) {
			var regName = /^[가-힣]{2,4}$/;
			if(!regName.test(value)) {
				return false;
			}
			return true;
		}
		
		var directorIndex = Number($("#direcIndex").val()) + 1;
		
		// 담당자 정보 추가
		function fn_addDirector() {
			var directorRow = document.getElementById("director_tbody").insertRow();
			
			var acDirectorNmCell = directorRow.insertCell(0);
			acDirectorNmCell.innerHTML='<input type="text" id="acDirectorNm'+directorIndex+'" name="acDirectorNm" autocomplete="off" required/>';
			
			var acDirectorDeptNm = directorRow.insertCell(1);
			acDirectorDeptNm.innerHTML ='<input type="text" id="acDirectorDeptNm'+directorIndex+'" name="acDirectorDeptNm" autocomplete="off"/>';
			
			var acDirectorPositionNm = directorRow.insertCell(2);
			acDirectorPositionNm.innerHTML ='<input type="text" id="acDirectorPositionNm'+directorIndex+'" name="acDirectorPositionNm" autocomplete="off"/>';
			
			var acDirectorMbNum = directorRow.insertCell(3);
			acDirectorMbNum.innerHTML ='<input type="text" class="phoneNumber" id="acDirectorMbNum'+directorIndex+'" name="acDirectorMbNum" autocomplete="off" numberOnly/>';
			
			var acDirectorTelNum = directorRow.insertCell(4);
			acDirectorTelNum.innerHTML ='<input type="text" class="phoneNumber" id="acDirectorTelNum'+directorIndex+'" name="acDirectorTelNum" autocomplete="off" required numberOnly/>';
			
			var acDirectorEmail = directorRow.insertCell(5);
			acDirectorEmail.innerHTML ='<input type="text" id="acDirectorEmail'+directorIndex+'" name="acDirectorEmail" autocomplete="off"/>';
			
			var acDirectorDesc = directorRow.insertCell(6);
			acDirectorDesc.innerHTML ='<input type="text" id="acDirectorDesc'+directorIndex+'" name="acDirectorDesc" autocomplete="off"/><input type="hidden" name="acEnd" />';
			
			var deleteBtn = directorRow.insertCell(7);
			deleteBtn.innerHTML ='<img src="/images/icon_delete.png" onclick="fn_deleteDirector(this);"/>';
			
			directorIndex++;
		}
		
		//담당자 정보 삭제
		function fn_deleteDirector(obj) {
			if($('#director_tbody tr').length>1) {
				if($("#e_acKey").val() != null && $("#e_acKey").val() != "" && $("#e_acKey").val().length != 0) {
					if($("#deleteDirectorList").val().replace(" ","").length == 0) {
						$("#deleteDirectorList").val($(obj).parent().parent().find("input[name='acDirectorKey']").val());
					} else {
						$("#deleteDirectorList").val($("#deleteDirectorList").val() + ";" + $(obj).parent().parent().find("input[name='acDirectorKey']").val());	
					}
				}
				$(obj).closest('tr').remove();
			} else {
				alert("담당자 정보는 한개 이상 존재해야 합니다.");
			}
		}
		
		var depoIndex = Number($("#depoIndex").val()) + 1;
		
		//계좌정보 추가
		function fn_addDeposit() {
			var depositRow = document.getElementById("deposit_tbody").insertRow();
			
			var acBankNm = depositRow.insertCell(0);
			acBankNm.innerHTML='<input type="text" id="acBankNm'+depoIndex+'" name="acBankNm" style="width: 230px" autocomplete="off" required/><input type="hidden" id="acAdSeq" name="acAdSeq"/>';
			
			var acBkno = depositRow.insertCell(1);
			acBkno.innerHTML ='<input type="text" id="acBkno'+depoIndex+'" name="acBkno" style="width: 299px" autocomplete="off" required numberOnly/>';
			
			var acAcholder = depositRow.insertCell(2);
			acAcholder.innerHTML ='<input type="text" id="acAcholder'+depoIndex+'" name="acAcholder" style="width: 212px" autocomplete="off" required/>';
			
			var acRepBknoYn = depositRow.insertCell(3);
			acRepBknoYn.innerHTML ='<input type="checkbox" class="tCheck" id="acRepBknoYn'+depoIndex+'" /><label for="acRepBknoYn'+depoIndex+'" class="cursorP"></label><input type="hidden" name="acRepBknoYn'+depoIndex+'" /><input type="hidden" name="acEnd" />';
			
			var deleteBtn = depositRow.insertCell(4);
			deleteBtn.innerHTML ='<img src="/images/icon_delete.png" onclick="fn_deleteDeposit(this);"/>';
			
			depoIndex++;
		}
		
		// 계좌 정보 삭제
		function fn_deleteDeposit(obj) {
			
			if($("#e_acKey").val() != null && $("#e_acKey").val() != "" && $("#e_acKey").val().length != 0) {
				if($("#deleteDepositList").val().replace(" ","").length == 0) {
					$("#deleteDepositList").val($(obj).parent().parent().find("input[name='acAdSeq']").val());
				} else {
					$("#deleteDepositList").val($("#deleteDepositList").val() + ";" + $(obj).parent().parent().find("input[name='acAdSeq']").val());	
				}
			}
			$(obj).closest('tr').remove();
		}
				
		function fn_chkVali() {
            if ($("#basicForm")[0].checkValidity()){
               //필수값 모두 통과하여 저장 프로세스 호출.
               if($("#e_acKey").val() != null && $("#e_acKey").val() != "" && $("#e_acKey").val().length != 0 && $("#chkExist").val() == 0 
            		   && $("#selectKey").val().replace(" ","").length == 0) {
            	   alert("사업자 번호 중복체크를 해주세요.");
            	   $('.contents').scrollTop(0);
               } else if(!$('input[name="acKind"]:checked').val()) {
           		    alert('거래처 구분을 선택해주세요.');
           		    $('input[name="acKind"]').focus();
               } else {
            	   if($("#accountDirectorForm")[0].checkValidity()){
            	   		if($("#accountDepositForm")[0].checkValidity()) {
            	   			fn_save();  
            	   		} else {
            	   			$("#accountDepositForm")[0].reportValidity(); 
            	   		}
            	   } else {
            		   $("#accountDirectorForm")[0].reportValidity(); 
            	   }
               } 
            } else {
                $("#basicForm")[0].reportValidity();   
            }            
		}
		
		function fn_save() {
			$("input[type='checkbox']").each(function() {
				if($(this).is(":checked") == true) {
					$("input[name='"+$(this).attr("id")+"']").val('Y');
				} else {
					$("input[name='"+$(this).attr("id")+"']").val('N');
				}
			});
			
			$("input[name='acRepTel']").val($("#acRepTel1").val() + "-" + $("#acRepTel2").val() + "-" + $("#acRepTel3").val());
			if($("#acRepFax2").val().replace(" ","").length != 0 && $("#acRepFax3").val().replace(" ","").length != 0) {
				$("input[name='acRepFax']").val($("#acRepFax1").val() + "-" + $("#acRepFax2").val() + "-" + $("#acRepFax3").val());
			}
			
			var object = {};
			var formData = $("#basicForm").serializeArray();
			var directorData = $("#accountDirectorForm").serializeObject();
			var depositData = $("#accountDepositForm").serializeObject();
			
			for(var i = 0; i < formData.length; i++) {
				object[formData[i]['name']] = formData[i]['value'];
			}
			
			object["accountDirectorVO"] = directorData;
			object["accountDepositVO"] = depositData;
			
			var sendData = JSON.stringify(object);
			
			/* if($('#director_tbody tr').length<1) {
				alert('담당자 정보는 한 개 이상 존재해야 합니다.');
			} else { */
				//console.log(sendData);	 
			
			if($("#e_acKey").val().replace(" ", "").length == 0) {
				if(confirm("사업자 번호가 입력되지 않았습니다. 랜덤번호로 저장하시겠습니까?")) {
					$.ajax({
						url: "/mngCommon/account/insert/accountInfo.do",
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
						    		alert("거래처 정보가 등록되었습니다.");
					    		} else {
					    			alert("거래처 정보가 수정되었습니다.");
					    		}
					    		
					    		var url='/mngCommon/account/write.do';
				    			var dialogId = 'program_layer';
				    			var varParam = {
									//"acKey":$("#e_acKey").val()
									"acKey":response.acKey
				    			}
					   			var button = new Array;
				    			button = [];
				    			showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:741px');
					    	} else {
					    		if($("#selectKey").val() == null || $("#selectKey").val() == "" || $("#selectKey").val().length == 0) {
					    			alert("거래처 정보 등록이 실패하였습니다.");
					    		} else {
					    			alert("거래처 정보 수정이 실패하였습니다.");
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
			} else {
				$.ajax({
					url: "/mngCommon/account/insert/accountInfo.do",
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
					    		alert("거래처 정보가 등록되었습니다.");
				    		} else {
				    			alert("거래처 정보가 수정되었습니다.");
				    		}
				    		
				    		var url='/mngCommon/account/write.do';
			    			var dialogId = 'program_layer';
			    			var varParam = {
								//"acKey":$("#e_acKey").val()
								"acKey":response.acKey
			    			}
				   			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:741px');
				    	} else {
				    		if($("#selectKey").val() == null || $("#selectKey").val() == "" || $("#selectKey").val().length == 0) {
				    			alert("거래처 정보 등록이 실패하였습니다.");
				    		} else {
				    			alert("거래처 정보 수정이 실패하였습니다.");
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
			
				
			/* } */
		}
	</script>
</head>
<body>
	
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">거래처 정보</div>
			</div>
		</div>
		<div class="contents">
			<form action="/" id="basicForm" name="basicForm"  method="post">
				<input type="hidden" id="deleteDirectorList" name="deleteDirectorList" value="" />
				<input type="hidden" id="deleteDepositList" name="deleteDepositList" value="" />
				<input type="hidden" id="selectKey" value="${accountVO.acKey }" />
				<div id="basicWrap" style="padding-top: 20px;">			
					<table>
						<tr>
							<td class="tdTitle">사업자번호</td>
							<td class="tdContents">
								<input type="text" id="e_acKey" name="acKey" value="${accountVO.acKey }" numberOnly maxlength="10">
								<button type="button" onclick="isExist(this);" value="0" id="chkExist"><img src="<c:url value='/images/dup_check.png'/>" style="cursor: pointer;vertical-align: middle;"/></button>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 거래처명</td>
							<td class="tdContents">
								<input type="text" id="acNm" name="acNm" value="${accountVO.acNm }" required/>
							</td>
						</tr>	
						<tr>
							<td class="tdTitle">&nbsp;&nbsp;대표자명</td>
							<td class="tdContents">
								<input type="text" id="acCeoNm" name="acCeoNm" value="${accountVO.acCeoNm }" />
							</td>
						</tr>							
						<tr>
							<td class="tdTitle"><label>*</label> 거래처구분</td>
							<td class="tdContents">
								<input type="checkbox" class="tCheck" id="acSalesYn" name="acKind" <c:if test="${accountVO.acSalesYn eq 'Y'}">checked</c:if> /><label for="acSalesYn" class="cursorP"></label>&nbsp;&nbsp;매출거래처
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" class="tCheck" id="acBuyYn" name="acKind" <c:if test="${accountVO.acBuyYn eq 'Y'}">checked</c:if> /><label for="acBuyYn" class="cursorP"></label>&nbsp;&nbsp;매입거래처
								<input type="hidden" name="acSalesYn" />
								<input type="hidden" name="acBuyYn" />
							</td>
						</tr>							
						<tr>
							<td class="tdTitle"><label>*</label> 연락처</td>
							<td class="tdContents">
								<c:set var="tel" value="${fn:split(accountVO.acRepTel, '-')}" />
								<%-- <select id="acRepTel1" name="acRepTel1" required>
									<option value="02" <c:if test="${tel[0] eq '02'}">selected</c:if>>02</option>
									<option value="031" <c:if test="${tel[0] eq '031'}">selected</c:if>>031</option>
									<option value="010" <c:if test="${tel[0] eq '010'}">selected</c:if>>010</option>
								</select> - --%>
								<input type="text" id="acRepTel1" name="acRepTel1" style="width: 53px" value="${tel[0] }" required numberOnly/> -
								<input type="text" id="acRepTel2" name="acRepTel2" style="width: 53px" value="${tel[1] }" required numberOnly/> -
								<input type="text" id="acRepTel3" name="acRepTel3" style="width: 53px" value="${tel[2] }" required numberOnly/>
								<input type="hidden" name="acRepTel" />
							</td>
						</tr>							
						<tr>
							<td class="tdTitle">&nbsp;&nbsp;FAX</td>
							<td class="tdContents">
								<c:set var="fax" value="${fn:split(accountVO.acRepFax, '-')}" />
								<%-- <select id="acRepFax1" name="acRepFax1">
									<option value="02" <c:if test="${fax[0] eq '02'}">selected</c:if>>02</option>
									<option value="031" <c:if test="${fax[0] eq '031'}">selected</c:if>>031</option>
								</select> - --%>
								<input type="text" id="acRepFax1" name="acRepFax1" value="${tel[0] }" style="width: 53px" numberOnly/> -
								<input type="text" id="acRepFax2" name="acRepFax2" value="${fax[1] }" style="width: 53px" numberOnly/> -
								<input type="text" id="acRepFax3" name="acRepFax3" value="${fax[2] }" style="width: 53px" numberOnly/>
								<input type="hidden" name="acRepFax" />
							</td>
						</tr>													
						<tr>
							<td class="tdTitle"><label>*</label> 주소</td>
							<td class="tdContents">
								<input type="text" id="acAddr" name="acAddr" value="${accountVO.acAddr }" style="width: 46%" required/>
								<input type="text" id="acAddrDetail" name="acAddrDetail" value="${accountVO.acAddrDetail }" style="width: 46%"/>
							</td>
						</tr>																				
					</table>			
				</div>
			</form>
			<form action="/" id="accountDirectorForm" name="accountDirectorForm"  method="post">
				<div id="pop_listForm">
					<div class="stitle">
						담당자정보&nbsp;<img class="veralignT" src="<c:url value='/images/btn_add-pop.png'/>" style="cursor: pointer;vertical-align: middle;" onclick="fn_addDirector()"/>
					</div>
					<div class="floatC director_middle" style="border-bottom: 2px solid #c4c4c4; width:1040px;">
						<table class="dtl">
							<thead class="ftw400">
								<tr>
									<th scope="row"><label>*</label> 이름</th>
									<th scope="row">부서</th>
									<th scope="row">직급</th>
									<th scope="row">모바일연락처<span></span></th>
									<th scope="row"><label>*</label>연락처</th>
									<th scope="row">이메일</th>
									<th scope="row">비고</th>
									<th scope="row">삭제</th>
								</tr>
							</thead>
							<tbody id="director_tbody">							
								<c:forEach var="result" items="${acDirectorList }" varStatus="status">
									<tr>
										<td>
											<input type="text" id="acDirectorNm${status.count }" name="acDirectorNm" value="${result.acDirectorNm }" autocomplete="off" required/>
										</td>
										<td>
											<input type="text" id="acDirectorDeptNm${status.count }" name="acDirectorDeptNm" value="${result.acDirectorDeptNm }" autocomplete="off"/>
										</td>
										<td>
											<input type="text" id="acDirectorPositionNm${status.count }" name="acDirectorPositionNm"  value="${result.acDirectorPositionNm }" autocomplete="off"/>
										</td>
										<td>
											<input type="text" id="acDirectorMbNum${status.count }" class="phoneNumber" name="acDirectorMbNum" value="${result.acDirectorMbNum }" autocomplete="off" numberOnly/>
										</td>
										<td>
											<input type="text" id="acDirectorTelNum${status.count }" class="phoneNumber" name="acDirectorTelNum" value="${result.acDirectorTelNum }" autocomplete="off" required numberOnly/>
										</td>
										<td>
											<input type="text" id="acDirectorEmail${status.count }" name="acDirectorEmail" value="${result.acDirectorEmail }" autocomplete="off"/>
										</td>
										<td>
											<input type="text" id="acDirectorDesc${status.count }" name="acDirectorDesc" value="${result.acDirectorDesc }" autocomplete="off"/>
											<input type="hidden" name="acDirectorKey" value="${result.acDirectorKey }" />
											<input type="hidden" name="acEnd" />
										</td>
										<td class="textalignC">
											<img src="<c:url value='/images/icon_delete.png'/>" onclick="fn_deleteDirector(this);"/>
										</td>
									</tr>
									<c:if test="${status.last}"><c:set var="direcLastIndex" value="${status.last }" /></c:if>
								</c:forEach>
							</tbody>
						</table>
						<input type="hidden" id="direcIndex" <c:choose><c:when test="${direcLastIndex eq null }">value="0"</c:when><c:otherwise>value="${direcLastIndex }"</c:otherwise></c:choose> />
					</div>
				</div>
			</form>
			<form action="/" id="accountDepositForm" name="accountDepositForm"  method="post">
				<div id="pop_listForm">
					<div class="stitle">
						계좌 정보&nbsp;<img class="veralignT" src="<c:url value='/images/btn_add-pop.png'/>" style="cursor: pointer;vertical-align: middle;" onclick="fn_addDeposit()"/>
					</div>
					<div class="floatC deposit_middle" style="border-bottom: 2px solid #c4c4c4; width:1040px;">
						<table class="dtl">
							<thead class="ftw400">
								<tr>
									<th scope="row"><label>*</label> 은행명</th>
									<th scope="row"><label>*</label> 계좌번호<span>('-'없이 입력)</span></th>
									<th scope="row"><label>*</label> 예금주</th>
									<th scope="row">주거래 계좌</th>
									<th scope="row">삭제</th>
								</tr>
							</thead>
							<tbody id="deposit_tbody">	
								<c:forEach var="result" items="${acDepositList }" varStatus="status">						
									<tr>
										<td>
											<input type="text" id="acBankNm${status.count }" name="acBankNm" value="${result.acBankNm }" style="width: 230px" autocomplete="off" required/>
											<input type="hidden" id="acAdSeq${status.count }" name="acAdSeq" value="${result.acAdSeq }"/>
										</td>
										<td>
											<input type="text" id="acBkno${status.count }" name="acBkno" value="${result.acBkno }" style="width: 299px" autocomplete="off" required numberOnly/>
										</td>
										<td>
											<input type="text" id="acAcholder${status.count }" name="acAcholder" value="${result.acAcholder }" style="width: 212px" autocomplete="off" required/>
										</td>
										<td>
											<input type="checkbox" class="tCheck" <c:if test="${result.acRepBknoYn eq 'Y' }"> value="Y" checked</c:if> id="acRepBknoYn${status.count }" />
											<label for="acRepBknoYn${status.count }" class="cursorP"></label>
											<input type="hidden" name="acRepBknoYn${status.count }" />
											<input type="hidden" name="acEnd" />
										<td class="textalignC">
											<img src="/images/icon_delete.png" onclick="fn_deleteDeposit(this);"/>
										</td>
									</tr> 
									<c:if test="${status.last}"><c:set var="depoLastIndex" value="${status.count }" /></c:if>
								</c:forEach>
							</tbody>
						</table>
						<input type="hidden" id="depoIndex" <c:choose><c:when test="${depoLastIndex eq null }">value="0"</c:when><c:otherwise>value="${depoLastIndex }"</c:otherwise></c:choose> />
					</div>
				</div>
			</form>
			<div class="btnWrap">
				<div id="m_btn_save" class="floatR btnSave" onclick="fn_chkVali();">
					<button type="button"><img src="<c:url value='/images/btn_save.png'/>" /></button>
				</div>
				<div class="floatN floatC"></div>
			</div>
		</div>
	</div>	
	
</body>
</html>