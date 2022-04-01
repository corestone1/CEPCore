<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/popup.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/datepicker.min.css'/>"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value='/js/popup.js'/>"></script>
<script src="<c:url value='/js/common.js'/>"></script>
<style>
	body {
		overflow: hidden;
	}
	fieldset {
		border: none;
		marign: 0;
		padding: 0;
	}
	.btn_gray {
		border: 1px solid #d2d2d2;
		border-radius: 5px;
		background-color: #d2d2d2;
		padding: 2px 8px;
		font-size: 13px;
	}
	.popContainer .top {
		width: 100%;
		height: 83px;
		position: absolute;
		top: 0;
		left: 0;
	}
	.popContainer .top > div {
		font-size: 24px;
		padding-left: 34px;
		padding-top: 33px;
		margin-right: 34px;
	}
	.popContainer .contents {
		position: absolute;
		width: 100%;
		height: 601px;
		top: 107px;
		left: 0;			
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
	.ui-datepicker.ui-widget-content {
		z-index: 102 !important;
	 }
	.popContainer .middle table,
	.popContainer .middle table thead,
	.popContainer .middle table thead tr,
	.popContainer .middle table tbody,
	.popContainer .middle table tbody tr {
		width: 100%;
	}
	.popContainer .middle table {
		border: none;
		font-size: 15px;
		margin-top: 16px;
		border-collapse: collapse;
		overflow: hidden;
		border-bottom: 2px solid #6a5bae;
	}
	.popContainer .middle table thead {
		background-color: #e1dff5;
		float: left;
		border-bottom: 3.5px solid #6a5bae;
	}
	.popContainer .middle table thead tr {
		display: table;
	}
	.popContainer .middle table tbody {
		/* height: 504px; */
		height: 454px;
		overflow-y: auto;
		overflow-x: hidden;
		float: left;
	}
	.middle table tbody tr {
		display: table;
	}
	.popContainer .middle table thead th, 
	.middle table tbody td {
		padding: 10px 0;
    	border: 1px solid #edebef;
	}
	
	.popContainer .middle table thead th:first-child, 
	.popContainer .middle table tbody td:first-child {
		width: 44px;
	}
	
	.popContainer .middle table thead th:nth-child(2), 
	.popContainer .middle table tbody td:nth-child(2) {
		width: 61px;
	}
	
	.popContainer .middle table thead th:nth-child(3), 
	.popContainer .middle table tbody td:nth-child(3) {
		width: 61px;
	}
	
	.popContainer .middle table thead th:nth-child(4), 
	.popContainer .middle table tbody td:nth-child(4) {
		width: 87px;
	}
	
	.popContainer .middle table thead th:nth-child(5),
	.popContainer .middle table tbody td:nth-child(5) {
		width: 105px;
	}
	
	.popContainer .middle table thead th:nth-child(6),
	.popContainer .middle table tbody td:nth-child(6) {
		width: 163px;
	}
	
	.popContainer .middle table thead th:nth-child(7), 
	.popContainer .middle table tbody td:nth-child(7) {
		width: 79px;
	}
	
	.popContainer .middle table thead th:nth-child(8), 
	.popContainer .middle table tbody td:nth-child(8) {
		width: 115px;
	}
	
	.popContainer .middle table thead th:nth-child(9), 
	.popContainer .middle table tbody td:nth-child(9) {
		width: 113px;
	}
	
	.popContainer .middle table thead th:nth-child(10), 
	.popContainer .middle table tbody td:nth-child(10) {
		width: 120px;
	}
	
	.popContainer .middle table thead th:nth-child(11), 
	.popContainer .middle table tbody td:nth-child(11) {
		width: 86px;
	}
	
	.popContainer .middle table thead th:nth-child(12), 
	.popContainer .middle table tbody td:nth-child(12) {
		width: 201px;
	}
	
	.popContainer .middle table thead th:nth-child(13), 
	.popContainer .middle table tbody td:nth-child(13) {
	    width: 207px;
	}
	
	
	.popContainer .top .floatR select {
		height: 40px;
		width: 130px;
		border: 1px solid #e9e9e9;
		padding: 0 10px;
		-webkit-appearance: none;
		background: url('/images/arrow_down.png') no-repeat 91% 50%;
		background-color: #fff;
		color: #535353;
		font-size: 15px;
	}
	
	.popContainer .top .floatR input[type="text"] {
		width: 200px;
		height: 38px;
		border: 1px solid #e9e9e9;
		padding: 0 10px;
		background-color: #fff;
		background-image: url('/images/search_icon.png');
		background-repeat: no-repeat;
		background-position: 95% 50%;
		font-size: 15px;
		margin-bottom: 3px;
	}
		
</style>
<script type="text/javaScript">
	$(document).ready(function(){
	});
	
	function chk_file_type(obj) {

		var file_kind = obj.value.lastIndexOf('.');
		var file_name = obj.value.substring(file_kind+1,obj.length);
		var file_type = file_name.toLowerCase();
		var check_file_type=new Array();

		check_file_type=['xlsx'];

		if(check_file_type.indexOf(file_type)==-1) {
			alert('xlsx 형식의 파일만 지원합니다.');
			var parent_Obj=obj.parentNode;
			var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);

			document.getElementById("excelFile").value = "";    //초기화를 위한 추가 코드
			document.getElementById("excelFile").select();        //초기화를 위한 추가 코드

			return false;
		} else {
			return true;
		}
	}
	
	function fnChooseExcel(obj){
		
		if(chk_file_type(obj)) {
			var formData = new FormData();
			formData.append("excelFile", $("#excelFile")[0].files[0]);
			
			$.ajax({ 
				type: "POST", 
				enctype: 'multipart/form-data',  
				url: '/mngCommon/bill/excelFileUpload.do', 
				data: formData, // 필수 
				processData: false, // 필수 
				contentType: false, // 필수 
				cache: false, 
				success: function (response) { 
					//console.log(response.billingList);
					fnExcelDataSetting(response.billingList);
				}, 
				error: function(request, status, error) {
					if(request.status != '0') {
						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
					}
				}
			});	 
		}
	}
	
	function fnExcelDataSetting(pobjBillingList) {
		
		var html = '';
		
		for(var i=0; i < pobjBillingList.length; i++) {
			html += '<tr id="tr_' + i + '">'
			     + '<td><a href="#" onclick="javascript:fnDelete(' + i + ');" class="btn btn_gray">삭제</a></td>'
		         + '<td align="center" class="listtd"><input type="text" size="1"  id="bl_gubun_' + i + '"       name="bl_gubun_' + i + '"       style="text-align:center;" value="' + pobjBillingList[i].value0 + '" /></td>'
		         + '<td align="center" class="listtd"><input type="text" size="1"  id="bl_kind_' + i + '"        name="bl_kind_' + i + '"        style="text-align:center;" value="' + pobjBillingList[i].value1 + '" /></td>'
		         + '<td align="center" class="listtd"><input type="text" size="5"  id="bl_writeDt_' + i + '"     name="bl_writeDt_' + i + '"     style="text-align:center;" value="' + addDateMinus(pobjBillingList[i].value2) + '" /></td>'
		         + '<td align="center" class="listtd"><input type="text" size="8"  id="bl_acKey_' + i + '"       name="bl_acKey_' + i + '"       style="text-align:center;" value="' + pobjBillingList[i].value3 + '" /></td>'
		         + '<td align="center" class="listtd"><input type="text" size="15" id="bl_acNm_' + i + '"        name="bl_acNm_' + i + '"        style="text-align:left;"   value="' + pobjBillingList[i].value5 + '" /></td>'
		         + '<td align="center" class="listtd"><input type="text" size="4"  id="bl_ceoNm_' + i + '"       name="bl_ceoNm_' + i + '"       style="text-align:center;" value="' + pobjBillingList[i].value6 + '" /></td>'
		         + '<td align="center" class="listtd"><input type="text" size="9" id="bl_billAmount_' + i + '"  name="bl_billAmount_' + i + '"  style="text-align:right;"  value="' + addCommas(pobjBillingList[i].value7) + '" /></td>'
		         + '<td align="center" class="listtd"><input type="text" size="8" id="bl_billTaxAmount_' + i + '"     name="bl_billTaxAmount_' + i + '"     style="text-align:right;"  value="' + addCommas(pobjBillingList[i].value8) + '" /></td>'
		         + '<td align="center" class="listtd"><input type="text" size="9" id="bl_billTotalAmount_' + i + '" name="bl_billTotalAmount_' + i + '" style="text-align:right;"  value="' + addCommas(pobjBillingList[i].value9) + '" /></td>'
		         + '<td align="center" class="listtd"><input type="text" size="5"  id="bl_billIssueDt_' + i + '" name="bl_billIssueDt_' + i + '" style="text-align:center;" value="' + addDateMinus(pobjBillingList[i].value12) + '" /></td>'
		         //+ '<td align="center" class="listtd"><input type="text" size="21" id="bl_billNo_' + i + '"      name="bl_billNo_' + i + '"      style="text-align:left;"   value="' + pobjBillingList[i].value11 + '" /></td>'
		         + '<td align="center" class="listtd"><input type="text" size="21" id="bl_remark_' + i + '"      name="bl_remark_' + i + '"      style="text-align:left;"   value="' + pobjBillingList[i].value10 + '" /></td>'
		         + '</tr>'
		         ;
		}
		
		$('#tbodyExcel').append(html);
	}
	
	
	function fnDelete(pitIdx) {
		
		if(confirm("삭제 하시겠습니까?"))
			$('#tr_' + pitIdx).remove();
	}
	
	
	function fnBillingSave(){
		
		//입력 정합성 체크 추가
		var object = {};
		
		var billingInfo  = $("#billingForm").serializeObject();
		
		
		//console.log("------------------------------------------------------------");
		//console.log('======= billingInfo =======\n' + billingInfo)
		
			
        object["mngBillInsertVOList"] = billingInfo;
		
		//console.log(object);
		
		var sendData = JSON.stringify(object);
		
		console.log(sendData);
		if(fnCheckExist(sendData) == true) {
				//&& fnCheckListExist(billingInfo).length == 0) {
			$.ajax({
	        	url:"/mngCommon/bill/saveExcelBilling.do",
	            dataType: 'text', 
	            type:"post",  
				data: sendData,
				traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.
	            contentType: "application/json; charset=UTF-8", 
	     	  	beforeSend: function(xhr) {
	     	  		xhr.setRequestHeader("AJAX", true);	        		
	        	},
	            success:function(data){	
	            	//console.log("data==>"+data);
	            	var result = JSON.parse(data);
	            	if(result.successYN == 'Y') {
	            		alert('저장되었습니다.');
	            		opener.location.reload();
		            	close();
	            	} else {
	            		alert('저장이 실패하였습니다.');
	            	}
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		} 
	        	} 
	        });
		} else if(fnCheckExist(sendData) == false){
			alert("이미 등록된 계산서입니다.(계산서 승인번호 중복)");
		} /* else if(fnCheckListExist(billingInfo).length != 0){
			window.prompt("계산서 승인번호가 중복됩니다. \n중복되는 승인번호: ",  fnCheckListExist(billingInfo));
		}  */else {
			alert("계산서 중복 체크에 실패하였습니다.")
		}
		
		
	}
	
	
	function fnCheckExist(sendData) {
		var returnValue;
		$.ajax({
        	url:"/mngCommon/bill/isExistBill.do",
            dataType: 'text', 
            type:"post",  
			data: sendData,
			traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.
			async: false,
            contentType: "application/json; charset=UTF-8", 
     	  	beforeSend: function(xhr) {
     	  		xhr.setRequestHeader("AJAX", true);	        		
        	},
            success:function(data){	
            	if(data == 0) {
            		returnValue = true;
            	} else {
            		returnValue = false;
            	}
            },
        	error: function(request, status, error) {
        		returnValue = 'error';
        	} 
        });
		
		return returnValue;
		
	}
	
	function fnCheckListExist(billInfo) {
		var returnValue = "";
		for(var i = 0; i < billInfo.length; i++) {
			var current = billInfo[i].billNo;
			
			for(var j = i+1; j < billInfo.length; j++) {
				if(current == billInfo[j].billNo) {
					returnValue = current;
					break;
				}
			} 
			
			if(returnValue.length != 0) {
				break;
			}
		}
		
		return returnValue;
		
	}
	
	jQuery.fn.serializeObject = function() {
		var obj = null; 
		var objArry = null;
			//try { 
				if(this[0].tagName.toUpperCase() == "FORM" ) { 
					var arr = this.serializeArray();
					
					//console.log('arr : ' + arr);
					
					if(arr){ 
						obj = {};
						objArry = new Array();
						jQuery.each(arr, function() {
							//console.log(this.name);
							
							if(this.name.indexOf("billAmount") > 0 
							|| this.name.indexOf("billTaxAmount") > 0
							|| this.name.indexOf("billTotalAmount") > 0){
								//숫자에서 컴마를 제거한다.
								obj[this.name.split('_')[1]] = removeCommas(this.value); 
							} else if(this.name.indexOf("writeDt") > 0
							       || this.name.indexOf("billIssueDt") > 0
							       || this.name.indexOf("acKey") > 0) {
								//이름에서 prodList-0-를 제거하고 날짜값에서 -를 제거한다.
								obj[this.name.split('_')[1]] =  removeData(this.value,"-"); 
							} else {
								obj[this.name.split('_')[1]] = this.value; 
							}
							
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if(this.name.indexOf("remark") > 0){
								objArry.push(obj);
								obj = {};
							}
						}); 	              
					} 
				} 
			//}catch(e) { 
			//	alert(e.message); 
			//}finally {} 
		return objArry; 
	}
	
	
	
</script>	
<form id="billingForm" name="billingForm">
<fieldset>
	<div class="popContainer">
		<div class="top">
			<div class="floatL">
				<div class="floatL ftw500">계산서 일괄 등록(Excel)</div>
			</div>
			<div class="floatR">
				<form id="excelFileForm" name="excelFileForm" method="post" enctype="multipart/form-data">
					<input type="file" name="excelFile" id="excelFile" onchange="javascript:fnChooseExcel(this);"/>
				</form> 
			</div>
			<!-- <div class="floatC"></div>  -->
		</div>
		<div class="contents">
			<div class="middle">
				<table class="textalignC ftw200" id="pl">
					<thead class="ftw400">
						<tr>
							<th scope="row">삭제</th>
							<th scope="row">구분</th>
							<th scope="row">종류</th>
							<th scope="row">작성일자</th>
							<th scope="row">사업자번호</th>
							<th scope="row">상호</th>
							<th scope="row">대표자명</th>
							<th scope="row">공급가액</th>
							<th scope="row">세액</th>
							<th scope="row">합계</th>
							<th scope="row">발급일자</th>
							<!-- <th scope="row">승인번호</th> -->
							<th scope="row">비고</th>
						</tr>
					</thead>
					<tbody id="tbodyExcel">
					<!-- 
						<tr>
            				<td><a href="#" class="btn btn_gray">삭제</a></td>
            				<td align="center" class="listtd"></td>
            				<td align="left"   class="listtd"></td>
            				<td align="left"   class="listtd"></td>
            				<td align="left"   class="listtd"></td>
            				<td align="center" class="listtd"></td>
            				<td align="center" class="listtd"></td>
            				<td align="center" class="listtd"></td>
            				<td align="center" class="listtd"></td>
            				<td align="center" class="listtd"></td>
            				<td align="center" class="listtd"></td>
            				<td align="center" class="listtd"></td>
            			</tr>
            		 -->				
					</tbody>
				</table>
			</div>
			
			<div class="btnWrap floatR">
				<div id="m_btn_save" class="floatR" style="">
			
					<button type="button" onclick="javascript:fnBillingSave();">
						<img src="<c:url value='/images/btn_save.png'/>" />
					</button>
					
				</div>
				<div class="floatN floatC"></div>
			</div>
		</div>
	</div>
</fieldset>
</form>
            