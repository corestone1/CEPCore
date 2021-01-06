<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>유지보수 등록(제품정보)</title>
	<style>
		.firstTd {			
			border-top: 2px solid #e5e5e5;	
			padding-top: 6px;
		}
		.lastTd {			
			padding-bottom: 5px;
		}
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
			margin: 10px 54px 0 45px;
		}
		.popContainer .contents .subject {
			width: 844px;
		}
		.popContainer input[class="search"] {
			height: 36px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents select {
			width: 153px;
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
		.popContainer input {
			width: 130px;
			/* height: 38px; */
			height: 35px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents2 input[class="numberTy"] {
			width: 27px;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 130px;
		}
		.popContainer .contents td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer td.tdTitle {
			margin-top: 11px;
			font-size: 15px;
			color: #525252;
			padding-left: 5px;
			padding-right: 5px;
			width: 96px;
		}				
		.popContainer td.tdContents {
			width: 174px;
			font-size: 14px;
		} 				
		.popContainer .contents tr:nth-child(1) td {
			padding-top: 10px;
		} 
		.popContainer .contents td.subTitle {
			font-size: 18px;
			padding-right: 20px;
			width: 56px;
			padding-top: 20px;
			padding-bottom: 5px;
		}	
		.popContainer .contents textarea {
			width: calc(100% - 22px);
			/* height: 55px; */
			height: 54px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}
		.popContainer .bottomBtn {
			position: absolute;
			width: 1083px;
			height: 52px;
			top: 638px;
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: hidden;
			overflow-x: hidden;
			padding-top: 18px;
			padding-right: 52px;
		}	
		.popContainer .contents .btnWrap {
			margin : 10px 48px 15px 45px;
		}
		.popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
      	}
		.calculate {
			text-align: right !important;
		}
	</style>
	<script>
		$(document).ready(function() {
			/*
			처음 로딩시  저장된 리스트가 2개보다 많으면  모두 접는다.
			2개까지는 스크롤바가 생성되지 않음.
			*/
			'<c:if test="${listCount > 2 }">'
			fn_viewSummaryUpAll();
			'</c:if>'
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
								
							if(this.name=="mtPmQuantity" || this.name=="mtPmUprice" || this.name=="totalAmount"){
								//숫자에서 컴마를 제거한다.
								obj[this.name] = removeCommas(this.value); 
							} else if(this.name=="mtPmStartDt" || this.name=="mtPmEndDt") {
								//날짜에서 -를 제거한다.
								obj[this.name] =  removeData(this.value,"-"); 
							} else {
								obj[this.name] = this.value; 
							}
							
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('remark' == this.name){
								objArry.push(obj);
								obj = {};
							}
						}); 	              
					} 
				} 
			}catch(e) { 
				alert(e.message); 
			}finally {} 
			return objArry; 
		}
		function fn_addInfoTable() {
			
			var type = "prod";
			var originLength = $('#'+type+'Length').val()*1-1;
			
			var lastNum = $("input[name='lastNum']").get($("input[name='lastNum']").length-1).getAttribute('value')*1;
			
	    	$('#'+type+'Length').val($('#'+type+'Length').val()*1 + 1);
	    	
	    	var clones = $('.'+type+'Table').clone();
	    	var clone = new jQuery.fn.init(clones[clones.length - 1]);
			
	    	var str = "";
	    	var nameArr = new Array();
	    	var idArr = new Array();
	    	var forArr = new Array();
	    	
	    	var tr = $('.'+type+'Table tr');
	    	var td = tr.children().children();
	    	
	    	
	    	for(var i = 0; i < td.length; i++) {
	    		if(td[i].getAttribute('name') != null && td[i].getAttribute('name') != undefined && td[i].getAttribute('name') != "" && td[i].getAttribute('name').length != 0) {
	    			nameArr.push(td[i].getAttribute('name')); 	    			
	    		}
	    		if(td[i].getAttribute('id') != null && td[i].getAttribute('id') != undefined && td[i].getAttribute('id') != "" && td[i].getAttribute('id').length != 0) {
	    			idArr.push(td[i].getAttribute('id')); 	    			
	    		}
	    		if(td[i].getAttribute('for') != null && td[i].getAttribute('for') != undefined && td[i].getAttribute('for') != "" && td[i].getAttribute('for').length != 0) {
	    			forArr.push(td[i].getAttribute('for')); 	    			
	    		}
	    		if(td[i].getAttribute('for') != null && td[i].getAttribute('for') != undefined && td[i].getAttribute('for') != "" && td[i].getAttribute('for').length != 0 && td[i].getAttribute('class').includes('calendar')) {
	    			$(this).attr('id','');
	    		} 
	    	}
	    	
	    	var name = type + 'List[' + (lastNum+1) + '].';	    	
	    	   	
	    		    	
	    	for(var i = 0; i < nameArr.length; i++) {
	    		
	    		clone.find('input[name="lastNum"]').val(lastNum+1);
				clone.find('input[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val("");
				clone.find('textarea[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 
				clone.find('select[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val("");		
				clone.find('hidden[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 
	    	} 
	    	var name = type + 'List-' + (lastNum+1) + '-';
	    	for(var i = 0; i < idArr.length; i++) {
	    		var splitName = idArr[i].split('-')[2];
				clone.find('input[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);	
				clone.find('textarea[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);	
				clone.find('img[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);	
	    	} 
	    	
	    	for(var i = 0; i < forArr.length; i++) {
	    		var splitName = forArr[i].split('-')[2];				
				clone.find('label[for="'+ type + 'List[' + lastNum + ']-' + splitName+'"]').attr('for', name + splitName);				
	    	} 
	    	
	    	$('#'+type+'Wrap').append(clone);
		}
		
		/* 제품정보 접기/펴기*/
		function fn_viewSummary(obj) {
	         var tbody = obj.parentNode.parentNode.parentNode;
	         var jtbody = $(tbody);
	         var className = obj.getAttribute('class');
	         
	         if(className === "down") {
	            jtbody.find(".dpTbRow").attr('class','dpNone');
	            obj.src = "<c:url value='/images/arrow_down.png'/>";
	            obj.className = "up";
	         } else {
	            jtbody.find(".dpNone").attr('class','dpTbRow');
	            obj.src = "<c:url value='/images/arrow_up.png'/>";
	            obj.className = "down";
	         }
		}
		
		/* 제품정보 삭제*/
		function fn_delete(obj, type) {
/* 			var table = obj.parentNode.parentNode.parentNode.parentNode.parentNode;
			var nextTable = $(obj.parentNode.parentNode.parentNode.parentNode.parentNode).nextAll();
			var tr = nextTable.children().children().children();
			var td = tr.children().children();
	
			var nameArr = new Array();
			
			for(var i = 0; i < td.length; i++) {
	    		if(td[i].getAttribute('name') != null && td[i].getAttribute('name') != undefined && td[i].getAttribute('name') != "" && td[i].getAttribute('name').length != 0) {
	    			nameArr.push(td[i].getAttribute('name')); 	   
	    		}
	    	} */
	    	var listNum;
			var productName;
			var serialNum;
			var deleteKey;
	    	var table = obj.parentNode.parentNode.parentNode.parentNode.parentNode;
			var selectNum = JSON.stringify($(obj.id).selector);
			var originLength = $('#'+type+'Length').val()*1;
			if(originLength>1){
				/*
				* 전체금액에서 삭제된 테이블 금액을 뺀다.
				* 삭제테이블의 제품정보를 수집한다.
				*/
				listNum = selectNum.split('-')[1];
				serialNum = $('#prodList-'+listNum+'-mtPmSerialNum').val();
				if(serialNum == ''){
					productName = $('#prodList-'+listNum+'-pmNmCd').val();
				} else {
					productName = $('#prodList-'+listNum+'-pmNmCd').val()+"("+serialNum+")";
				}
				//삭제 key
				deleteKey =  $('#prodList-'+listNum+'-mtPmKey').val();
				if(confirm(productName+" 제품정보를 삭제하시겠습니까?")) {
					//삭제key list를 만든다.
					if(deleteKey !=''){
						$('#deleteListKeys').val($('#deleteListKeys').val()+deleteKey+":");
					}
					
					table.remove();
					$('#'+type+'Length').val($('#'+type+'Length').val()*1 - 1);
				}
				
				 
				/* nextTable.each(function() {
					var num = $(this).find('input[name="lastNum"]').val()*1;
					$(this).find('input[name="lastNum"]').val(num-1);
					var newName = type + 'List[' + (num-1) + '].';
					
					for(var i = 0; i < nameArr.length; i++) {
			    		var splitName = nameArr[i].split('.')[1];
			    		$(this).find('input[name="'+ type + 'List[' + (num) + '].' + splitName+'"]').attr('name', newName + splitName);
			    		$(this).find('textarea[name="'+ type + 'List[' + (num) + '].' + splitName+'"]').attr('name', newName + splitName); 
			    		$(this).find('select[name="'+ type + 'List[' + (num) + '].' + splitName+'"]').attr('name', newName + splitName); 
			    	}  
				}); */
			} else {
				alert("제품정보는 한개 이상 존재해야 합니다.");
			}			   
		}
		function fn_prevBtn(){
			var url = '/maintenance/contract/write/basicInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":$('#mtIntegrateKey').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}

		function fn_saveBtn(){
			//필수값 체크를 완료하면 저장 프로세스 시작.
			var msg;
			if ($("#mtListForm")[0].checkValidity()){
				if($('#rowNum').val()*1 >0){
					msg = "유지보수계약 제품정보를 수정하시겠습니까?"
					
				} else {
					msg = "유지보수계약 제품정보를 저장하시겠습니까?"
				}
				
				if(confirm(msg)) {
					saveProductList();
				}
				
			}  else {
				 //Validate Form
		        $("#mtListForm")[0].reportValidity();	
			}
		}
	
		function saveProductList(){

			var object = {};
			var listObject = new Array();
			var obj = new Object();
           	var formData = $("#mtBasicForm").serializeArray();
           	var listData = $("#mtListForm").serializeObject();
            
           	for (var i = 0; i<formData.length; i++){
                
                object[formData[i]['name']] = formData[i]['value'];
                            
            }
           	//List를 담아준다.			
            object["mtContractProductVoList"]=listData;           	
			
			var sendData = JSON.stringify(object);
           	//console.log("sendData==>"+sendData);
           	$.ajax({
	        	url:"/maintenance/contract/write/productInfo.do",
	            dataType: 'text', 
	            type:"post",  
	            data: sendData,
				
	            traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.
	            
	     	   	contentType: "application/json; charset=UTF-8", 
	     	  	beforeSend: function(xhr) {
	     	  		//console.log("sendData11=====>"+sendData);
	        		xhr.setRequestHeader("AJAX", true);	        		
	        	},
	            success:function(data){	
	            	var paramData = JSON.parse(data);
	            	//console.log("data.mtIntegrateKey==>"+paramData.mtIntegrateKey);
	            	
	            	if("Y" == paramData.successYN){
	            		alert("유지보수계약 제품등록을 성공하였습니다.");
	            		//유지보수작업 발주 등록화면으로 이동
	            		var url='/maintenance/contract/write/salesInfoView.do';
	            		            			
		    			var dialogId = 'program_layer';
		    			var varParam = paramData
		    			var button = new Array;
		    			button = [];
		    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
	            	} else {
	            		alert("유지보수계약 제품등록이 실패하였습니다.");
	            	}
	            	
	            	
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        });			           	
		}
		
		//수량 X 단가 = 합계에 값 넣기
		$(document).on("focusout", ".calculate", function() {
			var num = $(this).attr('id').split('-')[1];
			var quantity = removeCommas($("#prodList-"+num+"-mtPmQuantity").val());
			var pmUprice = removeCommas($("#prodList-"+num+"-mtPmUprice").val());
			$("#prodList-"+num+"-totalAmount").val(addCommas(quantity*pmUprice))
		});

		function fn_viewSummaryUpAll(){
			$(".dpTbRow").attr('class','dpNone');
			$(".down").attr('class','up');
			$(".up").attr('src','<c:url value='/images/arrow_down.png'/>');
			//$(".up").src = "<c:url value='/images/arrow_down.png'/>";
		}
	</script>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">유지보수 등록</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
					<li class="colorWhite cursorP" onclick="fn_addView('writeMtBasicInfoView');">기본정보</li>
					<li class="colorWhite cursorP on">제품정보</li>
					<li class="colorWhite cursorP">매출정보</li>
					<c:if test="${parmMtSbCtYn eq 'Y' }">		
					<li class="colorWhite cursorP">백계약정보</li>
					<li class="colorWhite cursorP">매입정보</li>
					</c:if>
			</ul>
		</div>
		<form action="/" id="mtBasicForm" name="mtBasicForm" method="post">
		<c:choose>
			<c:when test="${listCount > 0}">
			<input type="hidden" id="prodLength" name="prodLength" value="<c:out value="${listCount}"/>" />
			</c:when>
			<c:otherwise> 
			<input type="hidden" id="prodLength" name="prodLength" value="1" />
			</c:otherwise>
		</c:choose>
			<%-- <input type="hidden" id="prodLength" name="prodLength" value="<c:out value="${listCount}"/>" />
			<input type="hidden" id="prodLength" name="prodLength" value="1" /> --%>
			<input type="hidden" id="parmMtSbCtYn" name="parmMtSbCtYn" value="<c:out value="${parmMtSbCtYn}"/>" />
			<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${mtIntegrateKey}"/>" />
			<input type="hidden" id="rowNum" name="rowNum" value="<c:out value="${listCount}"/>" />
			<input type="hidden" id="deleteListKeys" name="deleteListKeys" />
		</form>
		<form action="/" id="mtListForm" name="mtListForm" method="post">
			<div class="contents">
				<div id="prodWrap">
					<div class="subjectContainer">
						<table class="subject">
							<tr>		
								<td class="subTitle" style="border-top: none;">
									<label class="ftw400">제품정보</label>
								</td>
								<td class="subBtn" style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable();"/></td>
								<td class="subBtn" colspan="5"  style="border-top: none;"><img class="floatR" src="<c:url value='/images/icon_project.png'/>" onclick="fn_addInfoTable();"/></td>
							</tr>
						</table>
					</div>
					<c:choose>
						<c:when test="${mtProductList == null ||  mtProductList.size() == 0}">
						<div class="prodTable">
							<input type="hidden" name="lastNum" value="0" />
							<table>
								<tr>
									<td class="tdTitle firstTd"><label>*</label>제품</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-0-mtPmFkKey" name="mtPmFkKey" class="search" required/>	
										<input type="hidden" id="prodList-0-pmNmCd" name="pmNmCd" />
										<!-- <input type="text" id="prodList-0-pmNmCd" name="pmNmCd" class="search" required/>	
										<input type="hidden" id="prodList-0-mtPmFkKey" name="mtPmFkKey"/>	 -->
										<input type="hidden" id="prodList-0-mtPmKey" name="mtPmKey" />	
									</td>
									<td class="tdTitle firstTd">시리얼번호</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-0-mtPmSerialNum" name="mtPmSerialNum" required/>
									</td>
									<td class="tdTitle firstTd"><label>*</label>수량</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-0-mtPmQuantity" name="mtPmQuantity" amountOnly style="width: 75px;" class="calculate" required/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
										<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
			                        	<img id="prodList-0-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label>단가</td>
									<td class="tdContents">
										<input type="text" id="prodList-0-mtPmUprice" name="mtPmUprice" class="calculate" amountOnly required/>
									</td>	
									<td class="tdTitle"><label>*</label>합계</td>
									<td class="tdContents" colspan="3">
										<input type="text" id="prodList-0-totalAmount" name="totalAmount" style="text-align: right;" readonly="readonly"/>	
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label>계약기간</td>
									<td class="tdContents" colspan="3">
										<input type="text" id="prodList-0-mtPmStartDt" name="mtPmStartDt" class="calendar fromDt" required/>&nbsp;&nbsp;~&nbsp;&nbsp;<input type="text" id="prodList-0-mtPmEndDt" name="mtPmEndDt" class="calendar toDt" required/>
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle">상세정보</td>
									<td class="tdContents" colspan="5"><textarea id="prodList-0-mtPmDetail" name="mtPmDetail"></textarea></td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle lastTd">비고</td>
									<td class="tdContents lastTd" colspan="5"><textarea id="prodList-0-remark" name="remark"></textarea></td>
								</tr>
							</table>
						</div>
						</c:when>
						<c:otherwise>
						<c:forEach var="list" items="${mtProductList}" varStatus="status">
						<div class="prodTable">
							<input type="hidden" name="lastNum" value="<c:out value="${status.index}"/>"/>
							<table>
								<tr>
									<td class="tdTitle firstTd"><label>*</label>제품</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmFkKey" name="mtPmFkKey" value="<c:out value="${list.mtPmFkKey}"/>" class="search" required/>	
										<input type="hidden" id="prodList-<c:out value="${status.index}"/>-pmNmCd" name="pmNmCd" value="<c:out value="${list.pmNmCd}"/>" />
										<!-- <input type="text" id="prodList-<c:out value="${status.index}"/>-pmNmCd" name="pmNmCd" value="<c:out value="${list.pmNmCd}"/>" class="search" required/>	
										<input type="hidden" id="prodList-<c:out value="${status.index}"/>-mtPmFkKey" name="mtPmFkKey" value="<c:out value="${list.mtPmFkKey}"/>"/>	 -->
										<input type="hidden" id="prodList-<c:out value="${status.index}"/>-mtPmKey" name="mtPmKey" value="<c:out value="${list.mtPmKey}"/>"/>	
									</td>
									<td class="tdTitle firstTd">시리얼번호</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmSerialNum" name="mtPmSerialNum" value="<c:out value="${list.mtPmSerialNum}"/>" required/>
											
									</td>
									<td class="tdTitle firstTd"><label>*</label>수량</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmQuantity" name="mtPmQuantity" value="<c:out value="${displayUtil.commaStr(list.mtPmQuantity)}"/>" amountOnly style="width: 75px;" class="calculate" required/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
										<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
			                        	<img id="prodList-<c:out value="${status.index}"/>-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label>단가</td>
									<td class="tdContents">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmUprice" name="mtPmUprice" value="<c:out value="${displayUtil.commaStr(list.mtPmUprice)}"/>" class="calculate" amountOnly required/>
									</td>	
									<td class="tdTitle"><label>*</label>합계</td>
									<td class="tdContents" colspan="3">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-totalAmount" name="totalAmount" style="text-align: right;" value="<c:out value="${displayUtil.makeMultiNumber(list.mtPmQuantity, list.mtPmUprice)}"/>" readonly="readonly"/>
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label>계약기간</td>
									<td class="tdContents" colspan="3">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmStartDt" name="mtPmStartDt" class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(list.mtPmStartDt)}"/>" required/>&nbsp;&nbsp;~&nbsp;&nbsp;<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmEndDt" name="mtPmEndDt" class="calendar toDt" value="<c:out value="${displayUtil.displayDate(list.mtPmEndDt)}"/>" required/>
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle">상세정보</td>
									<td class="tdContents" colspan="5"><textarea id="prodList-<c:out value="${status.index}"/>-mtPmDetail" name="mtPmDetail"><c:out value="${list.mtPmDetail}"/></textarea></td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle lastTd">비고</td>
									<td class="tdContents lastTd" colspan="5"><textarea id="prodList-<c:out value="${status.index}"/>-remark" name="remark"><c:out value="${list.remark}"/></textarea></td>
								</tr>
							</table>
						</div>
						</c:forEach>
						</c:otherwise>
					</c:choose>					
					
				</div>
				<div class="btnWrap">
					<div class="floatL">
						<button type="button"><img src="<c:url value='/images/btn_prev_icon.png'/>" onclick="fn_prevBtn();"/></button>
					</div>
					<div class="floatR" >
						<button type="button"><img src="<c:url value='/images/btn_next_icon.png'/>" onclick="fn_saveBtn();"/></button>
					</div>
					
					<div class="floatN floatC"></div>
				</div>
			</div>		
		</form>
		<%-- <form:form commandName="mtListVO" id="mtListForm" name="mtBasicForm" method="post">		
		</form:form >--%>
	</div>
</body>
</html>