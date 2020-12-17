<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>백계약정보</title>
	<style>
		.firstTd {			
			border-top: 2px solid #e5e5e5;	
			padding-top: 6px;
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
			margin: 10px 47px 0 45px;
		}
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
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
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer input[class="search"] {
			height: 38px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents2 input[class="numberTy"] {
			width: 27px;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 130px;
			height: 40px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
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
		
				
		/* .popContainer .contents tr:nth-child(1) td {
			padding-top: 10px;
			padding-bottom: 5px;
			
		}  */
		.popContainer .contents tr:nth-child(3) td {
			
			padding-bottom: 5px;
			
		} 
		/* .popContainer .contents tr:nth-child(4) td {
			padding-top: 20px;
			padding-bottom: 5px;
		}  */
		.popContainer .contents td.subTitle {
			font-size: 18px;
			padding-right: 20px;
			max-width: 16px;
			padding-top: 20px;
			padding-bottom: 5px;
		}	
		.popContainer .contents textarea {
			width: calc(100% - 22px);
			height: 55px;
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
		
		.popContainer .contents .subject {
			width: 811px;
			background-color: #f6f7fc;
			/* position: fixed; */
		} 
		.popContainer .contents .btnWrap {
			margin : 10px 48px 15px 3px;			
			width : calc(100% - 84px);
		}
	</style>
	<script>
		$(document).ready(function() {
			//매입처 담당자 셋팅
			$('#mtOrderAcDirectorKey').val("${mtBackOrderVO.mtOrderAcDirectorKey}").attr("selected", "true");
			
			//부가세 포함 라이오버튼 셋팅
			//$('#taxYn').val("${mtBackOrderVO.taxYn}").prop("checked", true);
			$("input:radio[name='taxYn']:radio[value='${mtBackOrderVO.taxYn}']").prop('checked', true);
			
			
			var boxSize = '${backOrderBoxList.size()}';
			console.log("boxSize================>"+typeof(boxSize));
			if(parseInt(boxSize) >0 ){
				console.log("boxSize================>"+(boxSize));
			}
			if(parseInt(boxSize) >0 ){
				console.log("boxSize================>${mtBackOrderVO.mtOrderKey}==>"+(boxSize));
				$('#mtSaveOrderAcKey').val("${mtBackOrderVO.mtOrderKey}").attr("selected", "true");
			}
			
			
			//console.log("backOrderBoxList.length======>${backOrderBoxList.size()}");
			
			fn_calculate();
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
								
							if(this.name=="mtOrderPmQuantity" || this.name=="mtOrderPmUprice" || this.name=="totalAmount"){
								//숫자에서 컴마를 제거한다.
								obj[this.name] = removeCommas(this.value); 
							} else if(this.name=="mtStartDt" || this.name=="mtEndDt") {
								//날짜에서 -를 제거한다.
								obj[this.name] =  removeData(this.value,"-"); 
							} else {
								obj[this.name] = this.value; 
							}
							
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('mtEndDt' == this.name){
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
	    	}
	    	
	    	var name = type + 'List-' + (lastNum+1) + '-';
	    	
	    	//복제하는 필드의 값제거.
	    	for(var i = 0; i < nameArr.length; i++) {
	    		clone.find('input[name="lastNum"]').val(lastNum+1);
				clone.find('input[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val("");
				clone.find('textarea[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 
				clone.find('select[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 					
	    	} 
	    	//id값 변경
	    	for(var i = 0; i < idArr.length; i++) {
	    		var splitName = idArr[i].split('-')[2];
				clone.find('input[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);		
				clone.find('img[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);
	    	} 
	    	//for값 변경
	    	for(var i = 0; i < forArr.length; i++) {
	    		var splitName = forArr[i].split('-')[2];			
				clone.find('label[for="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('for', name + splitName);				
	    	} 
	    	
	    	$('#'+type+'Wrap').append(clone);
	    	fn_calculate();
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
			var table = obj.parentNode.parentNode.parentNode.parentNode.parentNode;
			var selectNum = JSON.stringify($(obj.id).selector);
			var prodLength = $('#'+type+'Length').val()*1;
			if(prodLength>1){
				/*
				* 전체금액에서 삭제된 테이블 금액을 뺀다.
				* 삭제테이블의 연도를 수집한다.
				*/
				deleteAmount(selectNum.split('-')[1]);
				
				//선택한  테이블을 삭제한다.
				table.remove();
				
				$('#'+type+'Length').val($('#'+type+'Length').val()*1 - 1);
			} else {
				alert("제품정보는 한개 이상 존재해야 합니다.");
			}			
		}
		
		function deleteAmount(num) {
			var deleteUprice = 0;
			var deleteQuantity = 0;
			var totalAmount = removeCommas($('#orderTotalAmount').val())*1;
			deleteUprice = removeCommas($('#prodList-'+num+'-mtOrderPmUprice').val())*1;
			deleteQuantity = removeCommas($('#prodList-'+num+'-mtOrderPmQuantity').val())*1;
			
			console.log("mtOrderPmUprice * mtOrderPmQuantity =orderAmount ====>"+deleteUprice+" * "+deleteQuantity+" = "+(deleteQuantity*deleteUprice));
			//전체금액에서 삭제금액을 뺀다.
			$('#orderTotalAmount').val(addCommas(totalAmount-(deleteUprice*deleteQuantity)));
			
		}
		
		
		/* 고객사 선택하면 고객담당자 정보 가져오기. */
		$('#mtOrderAcKey').change(function(){
			
	        $.ajax({
	        	url:"/maintenance/contract/selectAcDirectorList.do",
	            dataType: 'json',
	            type:"post",  
	            data: $('#mtOrderAcKey').val(),
	     	   	contentType: "application/json; charset=UTF-8",
	     	  	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);
	        		//xhr.setRequestHeader(header, token);
	        	},
	            success:function(data){		            	
					if ( data.result.length > 0 ) {
						
						$ ('#mtOrderAcDirectorKey' ).find ( 'option' ).remove (); /* select box 의 ID 기존의  option항목을 삭제 */
						for ( var idx = 0 ; idx < data.result.length ; idx++ ) {
                    		$ ('#mtOrderAcDirectorKey' ).append ( "<option value='"+data.result[idx].acDirectorKey+"'>" + data.result[idx].acDirectorNm + '</option>' );
                  		}
	                }else{
	                	acDirectorList = null;
						$ ( '#mtOrderAcDirectorKey' ).find ( 'option' ).remove ();
	                 	$ ( '#mtOrderAcDirectorKey' ).append ( "<option value=''>담당자</option>" );
	                }
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        });
			
		}); 
		
		//단가 * 수량 계산
		function fn_calculate(){
			var beforeAmount=0;
			$(".calculate").unbind('focus');
			$(".calculate").unbind('blur');
			$(".calculate").focus(function() {
				var num = $(this).attr('id').split('-')[1];
				var quantity = removeCommas($("#prodList-"+num+"-mtOrderPmQuantity").val());
				//해당 라인의 단가.
				var pmUprice = removeCommas($("#prodList-"+num+"-mtOrderPmUprice").val());	
				
				beforeAmount = quantity *pmUprice;
				//console.log("beforeAmount====>"+beforeAmount);
			});
			
			$(".calculate").blur(function() {
				var num = $(this).attr('id').split('-')[1];
				//console.log("num====>"+num);
				//해당 라인의 수량
				var quantity = removeCommas($("#prodList-"+num+"-mtOrderPmQuantity").val());
				//해당 라인의 단가.
				var pmUprice = removeCommas($("#prodList-"+num+"-mtOrderPmUprice").val());				
				//발주합계 금액
				var orderTotalAmount = removeCommas($('#orderTotalAmount').val())*1;
				
				var orderAmount = quantity*pmUprice;
				
				//console.log("quantity * pmUprice =orderAmount ====>"+quantity+" * "+pmUprice+" = "+(quantity*pmUprice));
				
				//제품별 계산(단가*수량 = 합계)
				$("#prodList-"+num+"-totalAmount").val(addCommas(orderAmount));
				
				//발주합계 금액 계산
				$('#orderTotalAmount').val(addCommas(orderTotalAmount+(orderAmount-beforeAmount)));
				
				//console.log("num=>"+num);
				//console.log("amount11====>"+ amount+"/"+totalAmount+"/"+beforeAmount);			
			});
			
			/* $(".calculate").focus(function() {
				beforeAmount = removeCommas($(this).val())*1;
			}); */
			/* $(document).on("focus", ".calculate", function() {
				beforeAmount = removeCommas($(this).val())*1;
				//console.log("beforeAmount====>"+ beforeAmount);
			}); */
		}
		
		// 저장
		function fn_saveBtn(){
			//계속 저장버튼 기능 정의 
			$('#btnOption').val('ss');
			//백계약정보를 저장한다.
			var object = {};
			var listObject = new Array();
			var obj = new Object();
           	var formData = $("#mtBasicForm").serializeArray();
           	var listData = $("#mtListForm").serializeObject();
            
           	for (var i = 0; i<formData.length; i++){
                               
                if("mtOrderDt" == formData[i]['name']) {
                	//날짜 - 제거
                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
                } else if("mtOrderAmount" == formData[i]['name']){
                	//컴마제거
                	object[formData[i]['name']] = removeData(formData[i]['value'], ",");
                } else {
                	object[formData[i]['name']] = formData[i]['value'];
                }           
            }
           	//백계약 제품List를 담아준다.			
            object["mtBackOrderProductVoList"]=listData;
			
			//object["mtWorkProductVoList" = listObject];
           	var sendData = JSON.stringify(object);
           
           	$.ajax({
	        	url:"/maintenance/contract/write/backOrderInfo.do",
	            dataType: 'text', 
	            type:"post",  
	            //data: JSON.stringify({"mtWorkKey":"111111111", "mtWorkProductVoList" :sendData}),
				data: sendData,
				
	            traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.
	            
	     	   	contentType: "application/json; charset=UTF-8", 
	     	  	beforeSend: function(xhr) {
	     	  		
	        		xhr.setRequestHeader("AJAX", true);	        		
	        	},
	            success:function(data){	
	            	console.log("data==>"+data);
	            	var paramData = JSON.parse(data);
	            	
	            	
	            	if("Y" == paramData.successYN){
	            		if($('#updateYn').val()=='Y'){
	            			alert("유지보수계약 백계약정보 수정을 성공하였습니다.");
							//유지보수계약 매출정보 상세화면으로 이동
		            		//document.listForm.action = "/maintenance/contract/detail/backOrderInfo.do";
	        				//document.listForm.method="get";
	                   		//document.listForm.submit(); 
	            		} else {
	            			alert("유지보수계약 백계약정보  등록을 성공하였습니다.");
	            			//유지보수계약 백계약 등록화면으로 이동
		            		var url='/maintenance/contract/write/backOrderInfoView.do';
		            		            			
			    			var dialogId = 'program_layer';
			    			var varParam = paramData
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
	            		}		            		
		            	
	            	} else {
	            		if($('#updateYn').val()=='Y'){
	            			alert("유지보수작업 백계약정보 수정이 실패하였습니다.");
	            		} else {
	            			alert("유지보수작업 백계약정보 등록이 실패하였습니다.");
	            		}
	            		
	            	}
	            	
	            	
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        }
           	 
           	);
		}
		
		//저장하고 다음으로 이동
		/* function fn_saveNextBtn(){
			//매출정보를 저장한다.
			var object = {};
			var listObject = new Array();
			var obj = new Object();
           	var formData = $("#mtBasicForm").serializeArray();
           	var listData = $("#mtListForm").serializeObject();
            
           	for (var i = 0; i<formData.length; i++){
                               
                if("mtOrderDt" == formData[i]['name']) {
                	//날짜 - 제거
                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
                } else if("mtOrderAmount" == formData[i]['name']){
                	//컴마제거
                	object[formData[i]['name']] = removeData(formData[i]['value'], ",");
                } else {
                	object[formData[i]['name']] = formData[i]['value'];
                }
                
                            
            }
           	//백계약 제품List를 담아준다.			
            object["mtBackOrderProductVoList"]=listData;           	
			
			//object["mtWorkProductVoList" = listObject];
           	var sendData = JSON.stringify(object);
           	var sendUrl;
           	if($('#updateYn').val()=='Y'){
           		//업데이트 수행 URL
           		sendUrl = "#";
           	} else {
           		//등록 수행 URL
           		sendUrl = "/maintenance/contract/write/backOrderInfo.do";
           	} 
           	$.ajax({
	        	url:sendUrl,
	            dataType: 'text', 
	            type:"post",  
	            //data: JSON.stringify({"mtWorkKey":"111111111", "mtWorkProductVoList" :sendData}),
				data: sendData,
				
	            traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.
	            
	     	   	contentType: "application/json; charset=UTF-8", 
	     	  	beforeSend: function(xhr) {
	     	  		
	        		xhr.setRequestHeader("AJAX", true);	        		
	        	},
	            success:function(data){	
	            	console.log("data==>"+data);
	            	var paramData = JSON.parse(data);
	            	console.log("paramData.==>"+paramData);
	            	
	            	if("Y" == paramData.successYN){
	            		if($('#updateYn').val()=='Y'){
	            			alert("유지보수계약 백계약정보 수정을 성공하였습니다.");
							//유지보수계약 매출정보 상세화면으로 이동
		            		document.listForm.action = "/maintenance/contract/detail/backOrderInfo.do";
	        				document.listForm.method="get";
	                   		document.listForm.submit(); 
	            		} else {
	            			alert("유지보수계약 백계약정보  등록을 성공하였습니다.");
	            			//유지보수계약 백계약 등록화면으로 이동
		            		var url='/maintenance/contract/write/purchaseAmountView.do';
		            		            			
			    			var dialogId = 'program_layer';
			    			var varParam = paramData
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
	            		}		            		
		            	
	            	} else {
	            		if($('#updateYn').val()=='Y'){
	            			alert("유지보수작업 백계약정보 수정이 실패하였습니다.");
	            		} else {
	            			alert("유지보수작업 백계약정보 등록이 실패하였습니다.");
	            		}
	            		
	            	}
	            	
	            	
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        }
           	 
           	);
		} */
		
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
					<li class="colorWhite cursorP">기본정보</li>
					<li class="colorWhite cursorP">제품정보</li>
					<li class="colorWhite cursorP">매출정보</li>					
					<li class="colorWhite cursorP on">백계약정보</li>
					<li class="colorWhite cursorP">매입정보</li>
			</ul>
		</div>
		
			
			<div class="contents">
				<div>
					<table class="subject">						
						<tr>      
							<td class="subTitle" style="border-top: none;" colspan="6">
								<label class="ftw400">백계약등록</label>&nbsp;&nbsp;&nbsp;	
								<img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable2();" style="vertical-align: middle"/>
								
								<c:if test="${backOrderBoxList.size() >0 }">
									<select id="mtSaveOrderAcKey" name="mtSaveOrderAcKey" style="width: 200px">															
										<c:forEach var="order" items="${backOrderBoxList}" varStatus="status">
											<option value="<c:out value="${order.mtOrderKey}"/>"><c:out value="${order.mtAcNm}"/></option>
										</c:forEach>							
									</select>
								</c:if>
							</td>
						</tr>
					</table>
					<form action="/" id="mtBasicForm" name="mtBasicForm"  method="post">
						<%-- <c:choose>
							<c:when test="${mtBackOrderVO.selectKey eq '' ||  mtBackOrderVO.selectKey eq 'null'||  mtBackOrderVO.selectKey eq null}">
								<input type="hidden" id="prodLength" name="prodLength" value="1" />
							</c:when>
							<c:otherwise>
								<input type="hidden" id="prodLength" name="prodLength" value="<c:out value="${listCount}"/>" />
							</c:otherwise>
						</c:choose> --%>
						<input type="hidden" id="prodLength" name="prodLength" value="<c:out value="${listCount}"/>" />
						<input type="hidden" id="mtSaveCnt" name="mtSaveCnt" value="<c:out value="${mtBackOrderVO.mtSaveCnt}"/>" />
						<%-- <input type="hidden" id="mtOrderKey" name="mtOrderKey" value="<c:out value="${mtOrderKey}"/>" /> --%>
						<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${mtBackOrderVO.mtIntegrateKey}"/>" />
						<input type="hidden" id="deleteListKeys" name="deleteListKeys" />
						<input type="hidden" id="btnOption" name="btnOption" />
						<input type="hidden" id="updateYn" name="updateYn" value="<c:out value="${mtBackOrderVO.updateYn}"/>"/>
						<input type="hidden" id="selectKey" name="selectKey" value="<c:out value="${mtBackOrderVO.selectKey}"/>"/>
					<table>
						<tr>
							<td class="tdTitle">매입처</td>
							<td class="tdContents">
								<input type="text" id="mtOrderAcKeyNm" name="mtOrderAcKeyNm" class="search" value="<c:out value="${mtBackOrderVO.getMtOrderAcKeyNm()}"/>" />	
								<input type="hidden" id="mtOrderAcKey" name="mtOrderAcKey" value="<c:out value="${mtBackOrderVO.getMtOrderAcKey()}"/>"/>	
								<!-- <input type="text" id="mtOrderAcKey" name="mtOrderAcKey" class="search" /> -->	
							</td>
							<td class="tdTitle">매입처담당자</td>
							<td class="tdContents">
							<c:choose>
								<c:when test="${mtBackOrderVO.selectKey eq '' ||  mtBackOrderVO.selectKey eq 'null'||  mtBackOrderVO.selectKey eq null}">
									<select id="mtOrderAcDirectorKey" name="mtOrderAcDirectorKey">
										<option value="">선택</option>
									</select>
								</c:when>
								<c:otherwise>
									<select id="mtOrderAcDirectorKey" name="mtOrderAcDirectorKey">
										<c:forEach var="emp" items="${acDirectorList}" varStatus="status">												
											<option value="<c:out value="${emp.acDirectorKey}"/>"><c:out value="${emp.acDirectorNm}"/></option>
										</c:forEach>
										
									</select>
								</c:otherwise>
							</c:choose> 
								
							</td>
							<td class="tdTitle">발주일자</td>
							<td class="tdContents">
								<%-- <input type="text" name="mtOrderDt" value="<c:out value="${displayUtil.displayDate(mtBackOrderVO.mtOrderDt)}"/>" class="calendar fromDt" /> --%>	
								<input type="text" name="mtOrderDt" value="<c:out value="${displayUtil.displayDate(mtBackOrderVO.mtOrderDt)}"/>" class="calendar fromDt" />
							</td>
						</tr>
						<tr>
							<td class="tdTitle">부가세 포함</td>
							<td class="tdContents">
								<input type="radio" class="tCheck" name="taxYn" id="prodList-0-hasVAT1" value="Y" checked="checked"/><label for="prodList-0-hasVAT1" class="cursorP"></label>&nbsp;&nbsp;Y&nbsp;&nbsp;
								<input type="radio" class="tCheck" name="taxYn" id="prodList-0-hasVAT2" value="N" /><label for="prodList-0-hasVAT2" class="cursorP"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
							</td>
							<td class="tdTitle">발주합계</td>
							<td class="tdContents">
								<input type="text"  id="orderTotalAmount" name="mtOrderAmount" amountOnly value="<c:out value="${displayUtil.commaStr(mtBackOrderVO.mtOrderAmount)}"/>"/>	
							</td>
							<td class="tdTitle">결제조건</td>
							<td class="tdContents">
								<input type="text" name="mtOrderPayTerms" style="width: 154px" value="<c:out value="${mtBackOrderVO.mtOrderPayTerms}"/>" />	
							</td>
						</tr>
						<tr >
							<td class="tdTitle">비고</td>
							<td class="tdContents" colspan="5"><textarea id="prodList-0-remark" name="remark" ><c:out value="${mtBackOrderVO.remark}"/></textarea></td>
						</tr>
					</table>
					</form>
					<form action="/" id="mtListForm" name="mtListForm"  method="post">
					<div id="prodWrap">
						<table class="subject">
							<tr> 
								<td class="subTitle" style="border-top: none;"  colspan="6">
									<label class="ftw400">제품정보</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable();"  style="vertical-align: middle"/>
								</td>
								<%-- <td colspan="5" class="floatL">
									<img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable();"  style="vertical-align: middle"/>
								</td> --%>
								
								<!-- <td colspan="4" style="visibility:hidden;width: 200px" ></td> -->
							</tr>
						</table>
						<c:choose>
							<c:when test="${mtBackOrderVO.selectKey eq '' ||  mtBackOrderVO.selectKey eq 'null'||  mtBackOrderVO.selectKey eq null}">
							<div class="prodTable">
								<input type="hidden" name="lastNum" value="0" />
								<table>								
									<tr>
										<td class="tdTitle firstTd">제품</td>
										<td class="tdContents firstTd">
											<!-- <input type="text" name="prodList-0-mtPmKeyNm"class="search" />	
											<input type="hidden" name="prodList-0-mtPmKey"/> -->	
											<input type="text" id="prodList-0-mtPmKey" name="mtPmKey" class="search" />
											<input type="hidden" id="prodList-0-mtOrderPmKey"  name="mtOrderPmKey"/>
												
										</td>
										<td class="tdTitle firstTd">합계</td>
										<td class="tdContents firstTd">
											<input type="text" id="prodList-0-totalAmount" name="totalAmount" readonly="readonly"/>	
										</td>
										<td class="tdTitle firstTd">수량</td>
										<td class="tdContents firstTd">
											<input type="text" id="prodList-0-mtOrderPmQuantity" name="mtOrderPmQuantity" amountOnly class="calculate" style="width: 75px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
											<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
				                           	<img id="prodList-0-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
										</td>
									</tr>
									<tr class="dpTbRow">
										<td class="tdTitle">단가</td>
										<td class="tdContents">
											<input type="text" id="prodList-0-mtOrderPmUprice" name="mtOrderPmUprice" amountOnly class="calculate"/>
										</td>
										<td class="tdTitle">시리얼번호</td>
										<td class="tdContents" colspan="3">
											<input type="text" id="prodList-0-mtPmSerialNum" name="mtPmSerialNum" readonly="readonly"/>	
										</td>									
									</tr>
									<tr class="dpTbRow">
										<td class="tdTitle">계약기간</td>
										<td class="tdContents" colspan="5">
											<input type="text" id="prodList-0-mtStartDt" name="mtStartDt" placeholder="from" class="calendar fromDt" /> ~ 
											<input type="text" id="prodList-0-mtEndDt" name="mtEndDt" placeholder="to" class="calendar toDt" />
										</td>
									</tr>
								</table>
							</div>
							</c:when>
							<c:otherwise>
							<c:forEach var="list" items="${mtBackOrderVO.mtBackOrderProductVoList}" varStatus="status">
							<div class="prodTable">
								<input type="hidden" name="lastNum" value="<c:out value="${status.index}"/>" />
								<table>								
									<tr>
										<td class="tdTitle firstTd">제품</td>
										<td class="tdContents firstTd">
											<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmKeyNm" name="mtPmKeyNm" class="search" value="<c:out value="${list.mtPmKeyNm}"/>"/>	
											<input type="hidden" id="prodList-<c:out value="${status.index}"/>-mtPmKey" name="mtPmKey" value="<c:out value="${list.mtPmKey}"/>"/>	
												
										</td>
										<td class="tdTitle firstTd">합계</td>
										<td class="tdContents firstTd">
											<input type="text" id="prodList-<c:out value="${status.index}"/>-totalAmount" name="totalAmount" readonly="readonly" value="<c:out value="${displayUtil.makeMultiNumber(list.mtOrderPmQuantity, list.mtOrderPmUprice)}"/>"/>	
										</td>
										<td class="tdTitle firstTd">수량</td>
										<td class="tdContents firstTd">
											<input type="text" id="prodList-<c:out value="${status.index}"/>-mtOrderPmQuantity" name="mtOrderPmQuantity" amountOnly class="calculate" style="width: 75px;" value="<c:out value="${displayUtil.commaStr(list.mtOrderPmQuantity)}"/>"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
											<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
				                           	<img id="prodList-<c:out value="${status.index}"/>-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
										</td>
									</tr>
									<tr class="dpTbRow">
										<td class="tdTitle">단가</td>
										<td class="tdContents">
											<input type="text" id="prodList-<c:out value="${status.index}"/>-mtOrderPmUprice" name="mtOrderPmUprice" amountOnly class="calculate" value="<c:out value="${displayUtil.commaStr(list.mtOrderPmUprice)}"/>"/>
										</td>
										<td class="tdTitle">시리얼번호</td>
										<td class="tdContents" colspan="3">
											<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmSerialNum" name="mtPmSerialNum" readonly="readonly" value="<c:out value="${list.mtPmSerialNum}"/>"/>	
										</td>									
									</tr>
									<tr class="dpTbRow">
										<td class="tdTitle">계약기간</td>
										<td class="tdContents" colspan="5">
											<input type="text" id="prodList-<c:out value="${status.index}"/>-mtStartDt" name="mtStartDt" placeholder="from" class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(list.mtStartDt)}"/>" /> ~ 
											<input type="text" id="prodList-<c:out value="${status.index}"/>-mtEndDt" name="mtEndDt" placeholder="to" class="calendar toDt" value="<c:out value="${displayUtil.displayDate(list.mtEndDt)}"/>" />
										</td>
									</tr>
								</table>
							</div>
							</c:forEach>
							</c:otherwise>
						</c:choose>
						
					</div>
					</form>		
				</div>
				<div class="btnWrap floatR">
					<div class="floatL" onclick="fn_saveBtn();">
						<button type="button"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<c:if test="${updateYn eq 'N' }">					
					<div class="floatR" onclick="fn_saveNextBtn();">
						<button type="button"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div>
					</c:if>
					<div class="floatN floatC"></div>
				</div>
			</div>	
		
	</div>
</body>
</html>