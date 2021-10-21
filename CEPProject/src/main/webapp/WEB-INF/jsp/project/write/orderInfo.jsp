<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>발주정보</title>
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
			/* height: 40px; */
			height: 35px;
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
			height: 30px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer input[class="search"] {
			/* height: 38px; */
			height: 32px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents2 input[class="numberTy"] {
			width: 27px;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 130px;
			/* height: 40px; */
			height: 33px;
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
			position: relative;
			bottom: 0;
		}
		.calculate {
			text-align: right !important;
		}
		.popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
      	}
      	.help {
      		vertical-align: middle;
		    line-height: 1;
		    margin-left: 3px;
      	}
      	.help[data-tooltip-text]:hover {
			position: relative;
		}
		.help[data-tooltip-text]:hover:after {
			background-color: #000000;
			background-color: rgba(0, 0, 0, 0.8);
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			color: #FFFFFF;
			font-size: 13px;
			font-weight: 200;
			content: attr(data-tooltip-text);
		  	margin-bottom: 10px;
			top: 130%;
			left: 0;    
			padding: 7px 12px;
			position: absolute;
			width: auto;
			min-width: 150px;
			max-width: 300px;
			word-wrap: break-word;
			z-index: 9999;
		}
		#m_div_accountList {
		    left: 146px;
    		margin-top: -4px;
		}
		.btnSave {
			width: auto;
		}
	</style>
	<script>
		var turnNo = $("#turnNo").val();
		
		var ctKeyList = new Array();
		var salesKeyList = new Array();
		
		<c:forEach items="${ctKey}" var="item">
			ctKeyList.push("${item}");
		</c:forEach>
		
		<c:forEach items="${salesKey}" var="item">
			salesKeyList.push("${item}");
		</c:forEach>
		
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
								
							if(this.name=="orderQuantity" || this.name=="orderUprice" || this.name=="totalAmount"){
								//숫자에서 컴마를 제거한다.
								obj[this.name] = removeCommas(this.value); 
							} else if(this.name=="freeMtStartDt" || this.name=="freeMtEndDt" || this.name=="orderReceiptDt") {
								//날짜에서 -를 제거한다.
								obj[this.name] =  removeData(this.value,"-"); 
							} else {
								obj[this.name] = this.value; 
							}
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							
							if('freeMtEndDt' == this.name){
								obj["yetPaymentAmount"] = Number($("#yetPaymentAmount").val());
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
				clone.find('hidden[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 					
	    	} 
	    	//id값 변경
	    	for(var i = 0; i < idArr.length; i++) {
	    		var splitName = idArr[i].split('-')[2];
	    		clone.find('input[id="'+ type + 'List-' + lastNum + '-totalAmount"]').attr('class', 'newAmount');
				clone.find('input[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);		
				clone.find('img[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);
	    	} 
	    	//for값 변경
	    	for(var i = 0; i < forArr.length; i++) {
	    		var splitName = forArr[i].split('-')[2];			
				clone.find('label[for="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('for', name + splitName);				
	    	} 
	    	
	    	//복제하는 필드에 값 추가(신규 생성 제품인지 판별)
	    	clone.find('input[name="orderSeq"]').after("<input type='hidden' name='isNew' value='' />")
	    	
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

			var listNum;
			var productName;
			var deleteKey;
			var table = obj.parentNode.parentNode.parentNode.parentNode.parentNode;
			var selectNum = JSON.stringify($(obj.id).selector);
			var prodLength = $('#'+type+'Length').val()*1;
			
			
			if(prodLength>1){
				
				/*
				* 전체금액에서 삭제된 테이블 금액을 뺀다.
				* 삭제테이블의 제품정보를 수집한다.
				*/
				listNum = selectNum.split('-')[1];
				productName = $('#prodList-'+listNum+'-pmNmCd').val();
				deleteKey =  $('#prodList-'+listNum+'-orderSeq').val();

				var deleteUprice = removeCommas($('#prodList-'+ listNum +'-orderUprice').val())*1;
				var deleteQuantity = removeCommas($('#prodList-'+ listNum +'-orderQuantity').val())*1;
				var totalProductAmount = deleteUprice*deleteQuantity;
				
				if(confirm(productName+" 제품정보를 삭제하시겠습니까?")) {
					if(totalProductAmount > (removeCommas($("#yetPaymentAmount").val()) * 1)) {
						alert("해당 발주의 미 지급 금액보다 삭제하고자 하는 발주 제품 금액이 더 큽니다.");
					} else {
						//삭제key list를 만든다.
						if(deleteKey !=''){
							$('#deleteListKeys').val($('#deleteListKeys').val()+deleteKey+":");
						}					
						
						//삭제된 금액을 뺀다.
						deleteAmount(listNum);
						
						//선택한  테이블을 삭제한다.
						table.remove();
						
						$('#'+type+'Length').val($('#'+type+'Length').val()*1 - 1);
					}
				}
			} else {
				alert("제품정보는 한개 이상 존재해야 합니다.");
			}			
		}
		
		function deleteAmount(num) {
			var deleteUprice = 0;
			var deleteQuantity = 0;
			var totalAmount = removeCommas($('#orderTotalAmount').val())*1;
			deleteUprice = removeCommas($('#prodList-'+num+'-orderUprice').val())*1;
			deleteQuantity = removeCommas($('#prodList-'+num+'-orderQuantity').val())*1;
			
			//전체금액에서 삭제금액을 뺀다.
			$('#orderTotalAmount').val(addCommas(totalAmount-(deleteUprice*deleteQuantity)));
			
			// 미 지급금액에서 삭제 금액을 뺀다.
			$("#yetPaymentAmount").val(Number($("#yetPaymentAmount").val().replaceAll(",","")) - (deleteUprice*deleteQuantity));
			
		}
		
		/* 고객사 선택하면 고객담당자 정보 가져오기. */
		$('#orderAcKey').change(function(){
			var checkOrder = false;
			var selectKey;
			$('#saveOrderCheck option').each(function() { 
				if (this.value == $('#orderAcKey').val()) { 
					checkOrder = true;
					selectKey = this.text;
					return false;
				}
			});

			if(checkOrder){
				//등록된 발주 업체가 있는 경우 해당 거래처를 불러온다.
				if(confirm("등록된 거래처가 있습니다. 해당 거래처를 불러오시겠습니까?")){
					var url = '/project/write/orderInfo.do';
					var dialogId = 'program_layer';
					var varParam = {
							"pjKey":$('#pjKey').val(),
							"selectKey":selectKey
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
				} else {
					//해당 거래처 정보를 지운다.
					$('#orderAcNm').val("");
					$('#orderAcKey').val("");
				}
			} else {
				$.ajax({
		        	url:"/project/selectAcDirectorList.do",
		            dataType: 'json',
		            type:"post",  
		            data: $('#orderAcKey').val(),
		     	   	contentType: "application/json; charset=UTF-8",
		     	  	beforeSend: function(xhr) {
		        		xhr.setRequestHeader("AJAX", true);
		        		//xhr.setRequestHeader(header, token);
		        	},
		            success:function(response){	
		            	if (response.acDirectorList.length > 0) {						
							$ ('#orderAcDirectorKey' ).find('option').remove (); // select box 의 ID 기존의  option항목을 삭제 
							for ( var idx = 0 ; idx < response.acDirectorList.length ; idx++ ) {
	                    		$ ('#orderAcDirectorKey' ).append ("<option value='"+response.acDirectorList[idx].acDirectorKey+"'>" + response.acDirectorList[idx].acDirectorNm + '</option>' );
	                  		}
		                } else {
		                	acDirectorList = null;
							$ ('#orderAcDirectorKey').find ('option').remove ();
		                 	$ ('#orderAcDirectorKey').append ("<option value=''>담당자</option>");
		                } 
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		        });
			}
		}); 
		
		//단가 * 수량 계산
		function fn_calculate(){
			var beforeAmount=0;
			$(".calculate").unbind('focus');
			$(".calculate").unbind('blur');
			$(".calculate").focus(function() {
				var num = $(this).attr('id').split('-')[1];
				var quantity = removeCommas($("#prodList-"+num+"-orderQuantity").val());
				//해당 라인의 단가.
				var pmUprice = removeCommas($("#prodList-"+num+"-orderUprice").val());	
				
				beforeAmount = quantity *pmUprice;
			});
			
			$(".calculate").blur(function() {
				var num = $(this).attr('id').split('-')[1];
				//해당 라인의 수량
				var quantity = removeCommas($("#prodList-"+num+"-orderQuantity").val());
				//해당 라인의 단가.
				var pmUprice = removeCommas($("#prodList-"+num+"-orderUprice").val());				
				//발주합계 금액
				var orderTotalAmount = removeCommas($('#orderTotalAmount').val())*1;
				var orderAmount = quantity*pmUprice;
				
				//제품별 계산(단가*수량 = 합계)
				$("#prodList-"+num+"-totalAmount").val(addCommas(orderAmount));
				
				//발주합계 금액 계산
				$('#orderTotalAmount').val(addCommas(orderTotalAmount+(orderAmount-beforeAmount)));
			});
			
			/* $(".calculate").focus(function() {
				beforeAmount = removeCommas($(this).val())*1;
			}); */
			/* $(document).on("focus", ".calculate", function() {
				beforeAmount = removeCommas($(this).val())*1;
				//console.log("beforeAmount====>"+ beforeAmount);
			}); */
		}
		
		//등록된 거래처 정보를 선택하면 해당 등록 내역을 가져온다.
		$('#saveOrderAcKey').change(function(){
			var url = '/project/write/orderInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
					"pjKey":$('#pjKey').val(),
					"selectKey":$('#saveOrderAcKey option:selected').val()
			}
			var button = new Array;
			button = [];
			// /* showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  */
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			
		});
		
		function fn_addNewOrder(){
			var url = '/project/write/orderInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
					"pjKey":$('#pjKey').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
		}
		
		//제품 찾기 클릭
		function fn_findProduct(obj) {
			window.open('/mngCommon/product/popup/searchListPopup.do?pmNmDomId='+obj.id+'&pmKeyDomId='+obj.nextElementSibling.id+'&returnType=O','PRODUCT_LIST','width=1000px,height=713px,left=600'); 
		}
		
		
		function fn_saveBtn(){
			if ($("#orderBasicForm")[0].checkValidity()){
				if ($("#orderProductForm")[0].checkValidity()){
					saveOrder();
				} else {
					 $("#orderProductForm")[0].reportValidity();	
				}				
			}  else {
		        $("#orderBasicForm")[0].reportValidity();	
			}
		}

		var countSave = 0;
		
		function saveOrder(){
			//계속 저장버튼 기능 정의 
			$('#btnOption').val('ss');
			
			var total = 0;
			$(".newAmount").each(function() {
				total += Number($(this).val().replaceAll(",",""));
			});
			
			$("#yetPaymentAmount").val(Number($("#yetPaymentAmount").val()) + total);
			
			var object = {};
			var listObject = new Array();
			var obj = new Object();
           	var formData = $("#orderBasicForm").serializeArray();
           	var listData = $("#orderProductForm").serializeObject();
            
           	for (var i = 0; i<formData.length; i++){
                if("orderDt" == formData[i]['name']) {
                	//날짜 - 제거
                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
                } else if("orderAmount" == formData[i]['name']){
                	//컴마제거
                	object[formData[i]['name']] = removeData(formData[i]['value'], ",");
                } else {
                	object[formData[i]['name']] = formData[i]['value'];
                }           
            }
           		
            object["orderProductVOList"]=listData;
           	var sendData = JSON.stringify(object);
            $.ajax({
	        	url:"/project/insert/orderInfo.do",
	            dataType: 'json', 
	            type:"post",  
				data: sendData,
	            traditional : true, 
	     	   	contentType: "application/json; charset=UTF-8", 
	     	  	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);	        		
	        	},
	            success:function(response){	
	            	
	            	if(response.successYN == "Y") {
	            		var countSave = 0;
	            		
	            		if($('#popSelectKey').val().length != 0){
	            			alert("발주 정보를 수정하였습니다.");
	            		} else {
	            			alert("발주 정보를 등록하였습니다.");
	            		}
	            			var varParam = {
	            					"pjKey":$('#pjKey').val(),
	            					"selectKey":$('#saveOrderAcKey option:selected').val()
	            			}
	            			
		            		var url='/project/write/orderInfo.do';
		            		            			
			    			var dialogId = 'program_layer';
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		            	
	            	} else {
	            		if($('#popSelectKey').val().length != 0){
	            			alert("발주 정보 수정이 실패하였습니다.");
	            		} else {
	            			alert("발주 정보 등록이 실패하였습니다.");
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
		
		//해당 거래처의 발주 내용을 삭제한다.
		function fn_deleteOrderBtn() {
			var acNm = $('#orderAcNm').val();
			if($('#popSelectKey').val().length != 0) {
				var sendData = {
						"pjOrderKey":$('#pjOrderKey').val(),
						"selectKey":$('#popSelectKey').val(),
						"buyKey":$("#buyKey").val()
				}				
				
				if(confirm(acNm+"의 발주 정보를 삭제하시겠습니까?")){
					$.ajax({
			        	url:"/project/delete/orderInfo.do",
			            dataType: 'text', 
			            type:"post",  
						data: JSON.stringify(sendData),
			            traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.
			     	   	contentType: "application/json; charset=UTF-8", 
			     	  	beforeSend: function(xhr) {
			        		xhr.setRequestHeader("AJAX", true);	        		
			        	},
			            success:function(response){	
			            	var paramData = JSON.parse(response);
			            	if("Y" == paramData.successYN){
			            		alert("발주 정보를 삭제했습니다.");
		            			
			            		var url='/project/write/orderInfo.do';
			            		            			
				    			var dialogId = 'program_layer';
				    			var varParam = {
		            					"pjKey":$('#pjKey').val(),
										"selectKey":$('#saveOrderAcKey option:selected').val()
		            			}
				    			var button = new Array;
				    			button = [];
				    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
				            	
			            	} else {
			            		alert("발주 정보 삭제를 실패하였습니다.");
			            		
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
				alert("삭제할 거래처 정보를 선택하세요.");
			}
		}
		
		function fn_viewSummaryUpAll(){
			$(".dpTbRow").attr('class','dpNone');
			$(".down").attr('class','up');
			$(".up").attr('src','<c:url value='/images/arrow_down.png'/>');
			//$(".up").src = "<c:url value='/images/arrow_down.png'/>";
		}
		
		function fn_viewSummaryDownAll(){
			$(".dpNone").attr('class','dpTbRow');
			$(".up").attr('class','down');
			$(".down").attr('src','<c:url value='/images/arrow_up.png'/>');
		}
		
		$(document).ready(function() {
			
			$("#orderAcNm").on("keyup", function(event){
				fn_searchAccoutList(this, $(this).val());					
			}); 
			
			//매입처 담당자 셋팅
			$('#orderAcDirectorKey').val("${orderVO.orderAcDirectorKey}").attr("selected", "true");
			
			
			// 등록된 거래처 selectBox 맵핑.
			if(parseInt('${orderSelectBoxList.size()}') >0 ){
				$('#saveOrderAcKey').val("${orderVO.pjOrderKey}").attr("selected", "true");
			}
			
			fn_calculate();
			
			/*
			처음 로딩시  저장된 리스트가 2개보다 많으면  모두 접는다.
			2개까지는 스크롤바가 생성되지 않음.
			*/
			'<c:if test="${listCount > 2 }">'
			fn_viewSummaryUpAll();
			'</c:if>'
			
			if($('#popSelectKey').val().length != 0) {
				$('.btnSave').children().eq(0).html('');
				$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />'); 
			} 
		
		});
		
		function fn_searchAccoutList(pObject, pstAccountNm) {
			$('#m_div_accountList').remove();
		
			var jsonData = {'acNm' : pstAccountNm, 'acBuyYN' : 'Y'};
			
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
			$('#orderAcKey').after(html);
			
			$("[id^='m_li_account']").click(function(event)
			{
				//alert(this.title);
				
				$('#orderAcKey').val(this.title); 
				$('#orderAcNm').val(this.innerText);
				fn_selectAc();
				
				$('#m_div_accountList').remove();
			});
			
		}
		
		var acDirectorList;
		
		function fn_selectAc() {
			 $.ajax({
	        	url:"/cmm/selectAcDirectorList.do",
	            dataType: 'json',
	            type:"post",  
	            data: $('#orderAcKey').val(),
	     	   	contentType: "application/json; charset=UTF-8",
	     	  	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);
	        		//xhr.setRequestHeader(header, token);
	        	},
	            success:function(data){		            	
					if ( data.result.length > 0 ) {
						acDirectorList = data.result;
						/* $('#acDirectorInfo').val(data.result[0].acDirectorInfo); *//* 첫번째 값을 셋팅해준다. */
						$ ('#orderAcDirectorKey' ).find ( 'option' ).remove ();  
						for ( var idx = 0 ; idx < data.result.length ; idx++ ) {
							if(data.result[idx].acDirectorKey == "${resultList[0].acDirectorKey}") {
								$('#orderAcDirectorKey').append("<option value='"+data.result[idx].acDirectorKey+"' selected>" + data.result[idx].acDirectorNm + '</option>');
								// $('#acDirectorInfo').val(data.result[idx].acDirectorInfo);
							} else {
								$('#orderAcDirectorKey').append("<option value='"+data.result[idx].acDirectorKey+"'>" + data.result[idx].acDirectorNm + '</option>');
								// $('#acDirectorInfo').val(data.result[0].acDirectorInfo);
							}
						}
	                } else{
	                	acDirectorList = null;
						$ ( '#orderAcDirectorKey' ).find('option').remove();
	                 	$ ( '#orderAcDirectorKey' ).append ( "<option value=''>담당자</option>" );
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
						"pjKey": $("#pjKey").val()
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			}
			else {
				if($('#popSelectKey').val() != "" || $('#popSelectKey').val().length != 0) {
					var url = '/project/write/'+link+'.do';
					var dialogId = 'program_layer';
					var varParam = {
							"pjKey": $("#pjKey").val()
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
				} else {
					alert('저장을 해주세요.');
				}
			}
		}
		
		function fn_prevView() {
			var url = '/project/write/guarantyInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey" : $('#pjKey').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  
		}
	</script>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">프로젝트 등록</div>
				<div class="subTitle">발주</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
					<li class="colorWhite cursorP on">발주정보</li>
			</ul>
		</div>
			<div class="contents">
				<div>
					<table class="subject">						
						<tr>      
							<td class="subTitle" style="border-top: none;" colspan="6">
								<label class="ftw400">발주등록</label>&nbsp;&nbsp;&nbsp;	
								<img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addNewOrder();" style="vertical-align: middle"/>
								<c:if test="${orderSelectBoxList.size() >0 }">
									<select id="saveOrderAcKey" name="saveOrderAcKey" style="width: 127px; height: 34px;">															
										<c:forEach var="order" items="${orderSelectBoxList}" varStatus="status">
											<option value="<c:out value="${order.pjOrderKey}"/>"><c:out value="${order.acNm}"/></option>
										</c:forEach>							
									</select>
									<select id="saveOrderCheck"  style="display:none">															
										<c:forEach var="order" items="${orderSelectBoxList}" varStatus="status">
											<option value="<c:out value="${order.orderAcKey}"/>"><c:out value="${order.pjOrderKey}"/></option>
										</c:forEach>							
									</select>
								</c:if> 
							</td>
						</tr>
					</table>
					<form:form commandName="orderBasicForm" id="orderBasicForm" name="orderBasicForm"  method="post">
						<c:choose>
							<c:when test="${orderVO.selectKey eq '' ||  orderVO.selectKey eq 'null'||  orderVO.selectKey eq null}">
								<input type="hidden" id="prodLength" name="prodLength" value="1" />
							</c:when>
							<c:otherwise>
								<input type="hidden" id="prodLength" name="prodLength" value="<c:out value="${listCount}"/>" />
							</c:otherwise>
						</c:choose> 
						<input type="hidden" id="pjOrderKey" name="pjOrderKey" value="<c:out value="${orderVO.pjOrderKey}"/>" />
						<input type="hidden" id="buyKey" name="buyKey" value="<c:out value="${purchaseVO.buyKey }"/>" />
						<input type="hidden" id="pjKey" name="pjKey" value="<c:out value="${pjKey}"/>"/>
						<input type="hidden" id="orderCtFkKey" name="orderCtFkKey" value="<c:out value="${pjKey}"/>"/>
						<input type="hidden" name="orderCtClass" value="P"/>
						<input type="hidden" id="deleteListKeys" name="deleteListKeys" />
						<input type="hidden" name="statusCd" value="PJST3000" />
						<input type="hidden" id="popSelectKey" name="selectKey" value="<c:out value="${orderVO.selectKey}"/>"/> 
						<input type="hidden" id="yetPaymentAmount" name="yetPaymentAmount" value="<c:out value="${purchaseVO.yetPaymentAmount }"/>" />
					<table>
						<tr>
							<td class="tdTitle"><label>*</label>매입처</td>
							<td class="tdContents" id="m_tr_account">
								<input type="text" id="orderAcNm" name="orderAcNm" class="search" required autocomplete="off" value="<c:out value="${orderVO.orderAcNm}"/>"/>
								<input type="hidden" id="orderAcKey" name="orderAcKey" class="search" value="<c:out value="${orderVO.orderAcKey}"/>" />
							</td>
							<td class="tdTitle"><label>*</label>매입처담당자</td>
							<td class="tdContents">
							<c:choose>
								<c:when test="${orderVO.selectKey eq '' ||  orderVO.selectKey eq 'null'||  orderVO.selectKey eq null}">
									<select id="orderAcDirectorKey" name="orderAcDirectorKey" required>
										<option value="">선택</option>
									</select>
								</c:when>
								<c:otherwise>
									<select id="orderAcDirectorKey" name="orderAcDirectorKey" required>
										<c:forEach var="emp" items="${acDirectorList}" varStatus="status">												
											<option value="<c:out value="${emp.acDirectorKey}"/>"><c:out value="${emp.acDirectorNm}"/></option>
										</c:forEach>
										
									</select>
								</c:otherwise>
							</c:choose> 
								
							</td>
							<td class="tdTitle"><label>*</label>발주일자</td>
							<td class="tdContents">
								<input type="text" name="orderDt" value="<c:out value="${displayUtil.displayDate(orderVO.orderDt)}"/>" class="calendar fromDt" required/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>발주합계</td>
							<td class="tdContents">
								<input type="text"  id="orderTotalAmount" name="orderAmount" amountOnly required value="<c:choose><c:when test="${orderVO.orderAmount == 0 }"></c:when><c:otherwise>${displayUtil.commaStr(orderVO.orderAmount)}</c:otherwise></c:choose>" style="text-align: right;"/>	
							</td>
							<td class="tdTitle"><label>*</label>결제조건<span class="help" data-tooltip-text="예) 계산서 발행 후 30일"><img src="/images/icon_help.png" /></span></td>
							<td class="tdContents">
								<input type="text" name="orderPayTerms" required value="<c:out value="${orderVO.orderPayTerms}"/>" /> 	
							</td>
						</tr>
					</table>
					</form:form>
					<form action="/" id="orderProductForm" name="orderProductForm"  method="post">
						<div id="prodWrap">
							<table class="subject">
								<tr> 
									<td class="subTitle" style="border-top: none;"  colspan="6">
										<label class="ftw400">제품정보</label>&nbsp;&nbsp;&nbsp;
										<img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable();"  style="vertical-align: middle"/>
									</td>
									<%-- <td colspan="5" class="floatL">
										<img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable();"  style="vertical-align: middle"/>
									</td> --%>
									
									<!-- <td colspan="4" style="visibility:hidden;width: 200px" ></td> -->
								</tr>
							</table>
							<c:choose>
								<c:when test="${orderVO.selectKey eq '' ||  orderVO.selectKey eq 'null'||  orderVO.selectKey eq null}">
								<div class="prodTable">
									<input type="hidden" name="lastNum" value="0" />
									<table>								
										<tr>
											<td class="tdTitle firstTd"><label>*</label>제품</td>
											<td class="tdContents firstTd">
												<input type="text" id="prodList-0-pmNmCd" name="pmNmCd" class="search"  onclick="fn_findProduct(this)" onkeypress="return false;" required/>	
												<input type="hidden" id="prodList-0-orderPmFkKey" name="orderPmFkKey" />
												<input type="hidden" id="prodList-0-isNew" name="isNew" value=""/>
											</td>
											<td class="tdTitle firstTd">합계</td>
											<td class="tdContents firstTd">
												<input type="text" id="prodList-0-totalAmount" name="totalAmount" style="text-align: right;" readonly />	
											</td>
											<td class="tdTitle firstTd"><label>*</label>수량</td>
											<td class="tdContents firstTd">
												<input type="text" id="prodList-0-orderQuantity" name="orderQuantity" amountOnly class="calculate" style="width: 75px;" required/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
												<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
					                           	<img id="prodList-0-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
											</td>
										</tr>
										<tr class="dpTbRow">
											<td class="tdTitle"><label>*</label>단가</td>
											<td class="tdContents">
												<input type="text" id="prodList-0-orderUprice" name="orderUprice" amountOnly required class="calculate"/>
											</td>
											<td class="tdTitle"><label>*</label>입고일자</td>
											<td class="tdContents">
												<input type="text" id="prodList-0-orderReceiptDt" name="orderReceiptDt" class="calendar fromDt" required/>
											</td>
											<td class="tdTitle">유지보수 요율</td>
											<td class="tdContents">
												<input type="text" id="prodList-0-mtRate" name="mtRate" style="width:75px;"/>&nbsp;&nbsp;%
											</td>
										</tr>
										<tr class="dpTbRow">
											<td class="tdTitle">무상유지보수</td>
											<td class="tdContents" colspan="5">
												<input type="text" id="prodList-0-freeMtStartDt" name="freeMtStartDt" placeholder="from" class="calendar fromDt" /> ~ 
												<input type="text" id="prodList-0-freeMtEndDt" name="freeMtEndDt" placeholder="to" class="calendar toDt" />
											</td>		
										</tr>
									</table>
								</div>
								</c:when>
								<c:otherwise>
								<c:forEach var="list" items="${orderVO.orderProductVOList}" varStatus="status">
								<div class="prodTable">
									<input type="hidden" name="lastNum" value="<c:out value="${status.index}"/>" />
									<input type="hidden" name="pjOrderKey" value="<c:out value="${list.pjOrderKey}"/>" />
									<table>								
										<tr>
											<td class="tdTitle firstTd"><label>*</label>제품</td>
											<td class="tdContents firstTd">
												<input type="text" id="prodList-<c:out value="${status.index}"/>-pmNmCd" name="pmNmCd" class="search" value="<c:out value="${list.pmNmCd}"/>" required onclick="fn_findProduct(this)"/>	
												<input type="hidden" id="prodList-<c:out value="${status.index}"/>-orderPmFkKey" name="orderPmFkKey" value="<c:out value="${list.orderPmFkKey}"/>"/>	
												<input type="hidden" id="prodList-<c:out value="${status.index}"/>-orderSeq" name="orderSeq" value="<c:out value="${list.orderSeq}"/>"/>	
												<input type="hidden" id="prodList-0-isNew" name="isNew" value="N"/>
											</td>
											<td class="tdTitle firstTd">합계</td>
											<td class="tdContents firstTd">
												<input type="text" id="prodList-<c:out value="${status.index}"/>-totalAmount" name="totalAmount" readonly="readonly" value="<c:out value="${displayUtil.makeMultiNumber(list.orderQuantity, list.orderUprice)}"/>" style="text-align: right;"/>	
											</td>
											<td class="tdTitle firstTd"><label>*</label>수량</td>
											<td class="tdContents firstTd">
												<input type="text" id="prodList-<c:out value="${status.index}"/>-orderQuantity" name="orderQuantity" amountOnly required class="calculate" style="width: 75px;" value="<c:out value="${displayUtil.commaStr(list.orderQuantity)}"/>"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
												<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
					                           	<img id="prodList-<c:out value="${status.index}"/>-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
											</td>
										</tr>
										<tr class="dpTbRow">
											<td class="tdTitle"><label>*</label>단가</td>
											<td class="tdContents">
												<input type="text" id="prodList-<c:out value="${status.index}"/>-orderUprice" name="orderUprice" amountOnly required class="calculate" value="<c:out value="${displayUtil.commaStr(list.orderUprice)}"/>"/>
											</td>
											<td class="tdTitle"><label>*</label>입고일자</td>
											<td class="tdContents">
												<input type="text" id="prodList-<c:out value="${status.index}"/>-orderReceiptDt" name="orderReceiptDt" class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(list.orderReceiptDt)}"/>" required/>
											</td>
											<td class="tdTitle">유지보수 요율</td>
											<td class="tdContents">
												<input type="text" id="prodList-0-mtRate" name="mtRate"  style="width:75px;" value="<c:out value="${ list.mtRate}"/>"/>&nbsp;&nbsp;%
											</td>
										</tr>
										<tr class="dpTbRow">
											<td class="tdTitle">무상유지보수</td>
											<td class="tdContents" colspan="5">
												<input type="text" id="prodList-<c:out value="${status.index}"/>-freeMtStartDt" name="freeMtStartDt" placeholder="from" class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(list.freeMtStartDt)}"/>" /> ~ 
												<input type="text" id="prodList-<c:out value="${status.index}"/>-freeMtEndDt" name="freeMtEndDt" placeholder="to" class="calendar toDt" value="<c:out value="${displayUtil.displayDate(list.freeMtEndDt)}"/>" />
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
					<div class="floatL btnSave" onclick="fn_saveBtn();">
						<button type="button"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<%-- <c:if test="${not empty orderVO.selectKey}"> --%>
					<div class="floatR" onclick="fn_deleteOrderBtn();">
						<button type="button"><img src="<c:url value='/images/btn_del.png'/>" /></button>
					</div>
					<%-- </c:if> --%>
					<%-- <c:if test="${updateYn eq 'N' }">					
					<div class="floatR" onclick="fn_saveNextBtn();">
						<button type="button"><img src="<c:url value='/images/btn_del.png'/>" /></button>
					</div>
					</c:if> --%>
					<div class="floatN floatC"></div>
				</div>
				<div class="btnWrap floatR">
					<div class="floatL btnPrev">
						<button type="button" onclick="fn_prevView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					</div>
					<div class="floatR">
						<button type="button" onclick="javascript:fn_next('finishInfo')"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>	
		
	</div>
</body>
</html>