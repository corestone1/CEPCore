<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>발주추가</title>
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
			height: 566px;
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
			height: 566px;
			top: 107px;
			left: 201px;			
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto;
		}
		.popContainer .contents > div {
			margin: 10px 54px 0 45px;
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
			padding-bottom: 5px;
			
		} 
		.popContainer .contents td.subTitle {
			font-size: 18px;
			padding-right: 20px;
			width: 56px;
			padding-top: 20px;
			padding-bottom: 5px;
		}	
		.popContainer .contents textarea {
			/* width: calc(100% - 22px); */
			width: calc(100% - 41px);
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
	</style>
	<script>
		function fn_addBiddingView(){
			var url = '/project/writeAmountInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_addInfoTable() {
			
			var type = "prod";
			var originLength = $('#'+type+'Length').val()*1-1;
			
			var lastNum = $("input[name='lastNum']").get($("input[name='lastNum']").length-1).getAttribute('value')*1;
			
	    	$('#'+type+'Length').val($('#'+type+'Length').val()*1 + 1);
	    	
	    	/* var clones = $('.'+type+'Table table:last-child').clone(); */
	    	var clones = $('.'+type+'Table').clone();
	    	var clone = new jQuery.fn.init(clones[clones.length - 1]);
			
	    	var str = "";
	    	var nameArr = new Array();
	    	var idArr = new Array();
	    	/* 
	    	var forArr = new Array();
	    	 */
	    	var tr = $('.'+type+'Table tr');
	    	var td = tr.children().children();
	    	
	    	console.log("lastNum : " + lastNum);
	    	
	    	for(var i = 0; i < td.length; i++) {
	    		console.log("[" + i + "] :" + td[i].getAttribute('name') + ", " + td[i].getAttribute('id'));
	    		if(td[i].getAttribute('name') != null && td[i].getAttribute('name') != undefined && td[i].getAttribute('name') != "" && td[i].getAttribute('name').length != 0) {
	    			nameArr.push(td[i].getAttribute('name')); 	    			
	    		}
	    		if(td[i].getAttribute('id') != null && td[i].getAttribute('id') != undefined && td[i].getAttribute('id') != "" && td[i].getAttribute('id').length != 0) {
	    			idArr.push(td[i].getAttribute('id')); 	    			
	    		}
	    		/* 
	    		if(td[i].getAttribute('for') != null && td[i].getAttribute('for') != undefined && td[i].getAttribute('for') != "" && td[i].getAttribute('for').length != 0) {
	    			forArr.push(td[i].getAttribute('for')); 	    			
	    		}
	    		 */
	    	}
	    	
	    	var name = type + 'List_' + (lastNum+1) + '_';
	    	
	    	//prodList[1].mtOrderPmNm
	    	
	    	for(var i = 0; i < nameArr.length; i++) {
	    		var splitName = nameArr[i].split('.')[2];
	    		clone.find('input[name="lastNum"]').val(lastNum+1);
				clone.find('input[name="'   + type + 'List_' + lastNum + '_' + splitName+'"]').attr('name', name + splitName).val("");
				clone.find('textarea[name="'+ type + 'List_' + lastNum + '_' + splitName+'"]').attr('name', name + splitName).val(""); 
				clone.find('select[name="'  + type + 'List_' + lastNum + '_' + splitName+'"]').attr('name', name + splitName); 
				/* clone.find('input:radio[name="'+ type + 'List[' + originLength + '].' + splitName+'"]').attr('id', name + splitName); */	
				console.log("i" + name + splitName);
	    	} 
	    	
	    	for(var i = 0; i < idArr.length; i++) {
	    		var splitName = idArr[i].split('_')[2];
	    		clone.find('input[id="'   + type + 'List_' + lastNum + '_' + splitName+'"]').attr('id', name + splitName);
	    		clone.find('textarea[id="'+ type + 'List_' + lastNum + '_' + splitName+'"]').attr('id', name + splitName).val(""); 
				clone.find('select[id="'  + type + 'List_' + lastNum + '_' + splitName+'"]').attr('id', name + splitName); 
				
	    	} 
	    	
	    	/* 
	    	for(var i = 0; i < forArr.length; i++) {
	    		var splitName = forArr[i].split('_')[2];				
				clone.find('label[for="'+ type + 'List_' + lastNum + '_' + splitName+'"]').attr('for', name + splitName);				
	    	} 
	    	 */
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
			var table = obj.parentNode.parentNode.parentNode.parentNode.parentNode;
			var nextTable = $(obj.parentNode.parentNode.parentNode.parentNode.parentNode).nextAll();
			var tr = nextTable.children().children().children();
			var td = tr.children().children();

			var nameArr = new Array();
			var idArr   = new Array();
			
			for(var i = 0; i < td.length; i++) {
	    		if(td[i].getAttribute('name') != null && td[i].getAttribute('name') != undefined && td[i].getAttribute('name') != "" && td[i].getAttribute('name').length != 0) {
	    			nameArr.push(td[i].getAttribute('name')); 	   
	    		}
	    		
	    		if(td[i].getAttribute('id') != null && td[i].getAttribute('id') != undefined && td[i].getAttribute('id') != "" && td[i].getAttribute('id').length != 0) {
	    			idArr.push(td[i].getAttribute('id')); 	    			
	    		}
	    		
	    	}
			
			var originLength = $('#'+type+'Length').val()*1;
			if(originLength>1){
				table.remove();
				$('#'+type+'Length').val($('#'+type+'Length').val()*1 - 1);
				
				nextTable.each(function() {
					var num = $(this).find('input[name="lastNum"]').val()*1;
					$(this).find('input[name="lastNum"]').val(num-1);
					var newName = type + 'List_' + (num-1) + '_';
					//console.log("newName : " + newName);
					for(var i = 0; i < nameArr.length; i++) {
			    		var splitName = nameArr[i].split('_')[2];
			    		$(this).find('input[name="'   + type + 'List_' + (num) + '_' + splitName+'"]').attr('name', newName + splitName);
			    		$(this).find('textarea[name="'+ type + 'List_' + (num) + '_' + splitName+'"]').attr('name', newName + splitName); 
			    		$(this).find('select[name="'  + type + 'List_' + (num) + '_' + splitName+'"]').attr('name', newName + splitName); 
			    	}
					
					for(var i = 0; i < idArr.length; i++) {
			    		var splitName = idArr[i].split('_')[2];
			    		$(this).find('input[id="'+ type + 'List_' + (num) + '_' + splitName+'"]').attr('id', newName + splitName);
						
			    	}
				});
			} else {
				alert("제품정보는 한개 이상 존재해야 합니다.");
			}			   
		}
		
		
		function fnOpenPjPopup(){
			
			//프로젝트 목록 조회
			// window.open('/project/popup/list.do','PROJECT_LIST','width=1000px,height=713px,left=600');
			window.open('/project/popup/list.do?returnType=F&returnFunctionNm=pop_projectCall','PROJECT_LIST','width=1000px,height=713px,left=600');
		}
		
		function pop_projectCall(returnKey,returnNm) {
			//alert("====>"+returnKey+"/"+returnNm);
			$('#ipt_orderCtFkKey').val(returnKey);
			$('#ipt_pjNm').val(returnNm);
			if($('#ipt_orderCtFkKey').val() !='') {
				$('#pj_delete_project').show();
			}
			
		}
		
		function fn_deleteProject() {
			if(confirm("PROJECT 연계정보를 삭제하시겠습니까?")) {
				
				if($('#ipt_orderCtFkKey').val() !='') {
					$('#pj_linkDeleteKey').val($('#ipt_orderCtFkKey').val());
					$('#ipt_orderCtFkKey').val('');
					$('#ipt_pjNm').val('');
				}
				$('#pj_delete_project').hide();
			} else {
				return false;
			}			
		}
		
		function fnSetPjInfo(pstKey, pstNm){
			
			//alert("::"+pstKey+"::"+pstNm);
			$('#ipt_pjNm').val(pstNm);
			$('#ipt_orderCtFkKey').val(pstKey);
			
			
			
			//프로젝트
			var jsonData = {'pjKey' : pstKey};
			
			$.ajax({
	        	url         : "/project/detail/getProjectInfo.do",
	        	type        : "POST",  
	            data        : jsonData,
	     	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType    : 'json',
	            async       : false,
	        	success     :function(data){
	        		console.log(data.projectVO.acNm);
	        		
	        		$('#ipt_accountNm').val(data.projectVO.acNm);
	            	//alert(data.projectVO.pjkey);
	            },
	        	error       : function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        });
			
		}
		
		
		$(document).ready(function() {
			
			$("#ipt_orderAcNm").on("keyup", function(event){
				if(event.keyCode == 13)
				{
					//alert("검색 : " + this.value);
					fnSearchAccoutList(this, $(this).val());
				}
					
			});
			
			
			//수정일때 처리
			if('${orderKey}'  != null && '${orderKey}'  != '')
			{
				alert('${orderKey}' + ":" + '${orderInfo.orderAcDirectorKey}'+ ":" + '${orderInfo.regEmpKey}');
				//프로젝트/유지보수 선택
				
				//매입처 담당자 목록 조회 후 선택                                       ORDER_AC_DIRECTOR_KEY
				$('#slt_orderAcDirectorKey').val("${orderInfo.orderAcDirectorKey}");
				
				//등록자 선택
				$('#slt_regEmpKey').val("${orderInfo.regEmpKey}");
				
				//CMM_ORDER_PRODUCT_TB select
				var jsonData = {'orderKey' : '${orderKey}'};
			
				$.ajax({
			            url :"/mngProject/order/selectOrderProductList.do",
			        	type:"POST",  
			            data: jsonData,
			     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			     	    dataType: 'json',
			            async : false,
			        	success:function(data){		  
			        		console.log(data.productList);
			        		fnSetProductInfo(data.productList);
			            },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
				}); 
				  
			}
			  
		});
		
		function fnSetProductInfo(pjsProductList){
			
			var litIdx = pjsProductList.length;
			
			for(var k=1; k < litIdx; k++)
			{
				fn_addInfoTable();
			}
			
			
			for(var i = 0; i < litIdx; i++){
				
				$('#prodList_'+ i + '_orderPmNm').val(pjsProductList[i].pmNm);
				$('#prodList_'+ i + '_orderPmFkKey').val(pjsProductList[i].orderPmFkKey);
				$('#prodList_'+ i + '_totalAmount').val(addCommas(pjsProductList[i].totalAmount));
				$('#prodList_'+ i + '_orderQuantity').val(pjsProductList[i].orderQuantity);
				$('#prodList_'+ i + '_orderUprice').val(addCommas(pjsProductList[i].orderUprice));
				$('#prodList_'+ i + '_orderReceiptDt').val(addDateMinus(pjsProductList[i].orderReceiptDt));
				$('#prodList_'+ i + '_orderCategory').val(pjsProductList[i].orderCategory);
				$('#prodList_'+ i + '_remark').val(pjsProductList[i].remark);
				
				//ORDER_QUANTITY
				
				console.log('prodList_'+ i + '_orderPmNm     : ' + $('#prodList_'+ i + '_orderPmNm').val());
				console.log('prodList_'+ i + '_orderPmNm     : ' + $('#prodList_'+ i + '_orderPmNm').val());
				console.log('prodList_'+ i + '_totalAmount   : ' + $('#prodList_'+ i + '_totalAmount').val());
				console.log('prodList_'+ i + '_orderCategory : ' + $('#prodList_'+ i + '_orderCategory').val());
				console.log('prodList_'+ i + '_orderReceiptDt : ' + $('#prodList_'+ i + '_orderReceiptDt').val());
			}
				
			
		}
		
		var fnSearchAccoutList = function(pObject, pstAccountNm)
		{
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
		};
		
		var fnViewAccountList = function(pObject, pjAccountList){
			var html = '<div id="m_div_accountList" style="width:362px; padding-top: 15px; padding-bottom: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1); position: absolute;">'
			         + '<ul class="accountList">'
			       ;//+ '<div style="margin: 5px;">';
			       
			       for(var i=0; i < pjAccountList.length; i++)
			    	{
			    	   html += '<li id="m_li_account" title="'+ pjAccountList[i].acKey +'">' + pjAccountList[i].acNm + '</li>'
			    	        ;
			    	} 
			       
			       
			    html +=  '</ul>'
			          + '</div>'
			         ;//+ '</div>';
			//$('#m_td_account').after(html);
			$('#m_tr_account').after(html);
			
			
			$("[id^='m_li_account']").click(function(event)
			{
				//alert(this.innerText);
				
				//$('#m_ipt_acNm').val(this.title); 
				//$('#m_ipt_mfAcKey').val(this.innerText);
				
				$('#ipt_orderAcNm').val(this.innerText); 
				$('#ipt_orderAcKey').val(this.title);
				
				$('#m_div_accountList').remove();
				
				//매입처담당자 SelectBox 생성 - id : slt_orderAcDirectorKey
				fnSelectAcDirector(this.title);
			});
		};
		
		function fnSelectAcDirector(pstAcKey){
			
			var jsonData = {'acKey' : pstAcKey};
			
			$.ajax({
	        	url :"/mngProject/order/getAcDirectorList.do",
	        	type:"POST",  
	            data: jsonData,
	     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType: 'json',
	            async : false,
	        	success:function(data){		  
	        		//alert(data.codeList[0].cdNm);
	        		//select box 변경 function 
	        		//console.log(data);
	        		fnChangeAcDirectorOption(data.directorList)
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	    	}); 
			
		}
		
		function fnChangeAcDirectorOption(pDirectorList){
			console.log(pDirectorList);
			
			
			var objectSlt = $('#slt_orderAcDirectorKey');
			//매입처 담당자  Select Option 변경
			objectSlt.html("");
			
			for(var i=0; i < pDirectorList.length; i++)
			{
				objectSlt.append("<option value='" + pDirectorList[i].acDirectorKey + "'>" + pDirectorList[i].acDirectorNm + "</option>");	
			}
			
		}
		
		//function fnOpenPdPopup(pitIdx){
		function fnOpenPdPopup(pObj){
			
			//제품선택 팝업
			var litIdx = $(pObj).attr("id").replace('prodList_', '').replace('_orderPmNm', '');
			
			var lstProductKeyDomId = "prodList_" + litIdx + "_orderPmFkKey";
			var lstProductNmDomId  = "prodList_" + litIdx + "_orderPmNm";
			var lstParameter = encodeURI("?returnType=O"
							 + "&returnKey=" + lstProductKeyDomId
							 + "&returnNm="  + lstProductNmDomId)
							 ; 
			var lstUrl = "/mngCommon/product/popup/searchListPopup.do"
					   + lstParameter; 
			
			console.log("fnOpenPdPopup : " + lstUrl);
							
			
			window.open(lstUrl,'PRODUCT_LIST','width=1000px,height=713px,left=600');
			
		}
		
		
		//comma Event
		function insertComma(pObj){
			//class="price"
			$(pObj).val(addCommas($(pObj).val()));
			
			
		}
		
		function removeComma(pObj){
			$(pObj).val(removeCommas($(pObj).val()));
		}
		
		
		function fnSave(){
				
			//입력 정합성 체크 추가
			
			
			var object = {};
			
			var basicInfo    = $("#orderBasicForm").serializeArray();
			var productInfo  = $("#productListForm").serializeObject();
			
			
			console.log("------------------------------------------------------------");
			console.log('======= basicInfo   =======\n' + basicInfo)
			console.log('======= productInfo =======\n' + productInfo)
			
			
			for (var i = 0; i<basicInfo.length; i++){
                
                if("mtOrderDt" == basicInfo[i]['name']) {
                	//날짜 - 제거
                	object[basicInfo[i]['name']] = removeData(basicInfo[i]['value'],"-");
                } else {
                	object[basicInfo[i]['name']] = basicInfo[i]['value'];
                }           
            }
			
			
			//백계약 제품List를 담아준다.			
            object["mngOrderInsertVOList"] = productInfo;
			
			console.log(object);
			
			var sendData = JSON.stringify(object);
			
			$.ajax({
	        	url:"/mngProject/order/write/wirteProductInfo.do",
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
	            	alert('저장 되었습니다.');
	            	close();
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        });
		}
		
		
		jQuery.fn.serializeObject = function() {
			var obj = null; 
			var objArry = null;
				//try { 
					if(this[0].tagName.toUpperCase() == "FORM" ) { 
						var arr = this.serializeArray();
						
						console.log('arr : ' + arr);
						
						if(arr){ 
							obj = {};
							objArry = new Array();
							jQuery.each(arr, function() {
								console.log(this.name);
								
								if(this.name.indexOf("totalAmount") > 0 
								|| this.name.indexOf("orderUprice") > 0){
									//숫자에서 컴마를 제거한다.
									obj[this.name.split('_')[2]] = removeCommas(this.value); 
								} else if(this.name.indexOf("orderReceiptDt") > 0) {
									//이름에서 prodList-0-를 제거하고 날짜값에서 -를 제거한다.
									obj[this.name.split('_')[2]] =  removeData(this.value,"-"); 
								} else {
									obj[this.name.split('_')[2]] = this.value; 
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
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">발주 추가</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
				<li >발주 정보</li>
			</ul>
		</div>
		<!-- 
		<form action="/" id="uploadForm" method="post"> 
		 -->
			<input type="hidden" id="prodLength" name="prodLength" value="1" />
			<input type="hidden" id="pj_linkDeleteKey" name="linkDeleteKey"/>		
			<div class="contents">
				<!-- <div id="prodWrap"> -->
				<div>
					<div class="subjectContainer">
						<table class="subject">
							<tr>		
								<td class="subTitle" style="border-top: none;">
									<label class="ftw400">발주정보</label>
								</td>
								<!-- 발주 단건 조회 화면으로 발주처는 한 곳만 등록함. 
								<td class="subBtn" colspan="5"  style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable();"/></td>
								 -->
							</tr>
						</table>
					</div>
					
					<form action="/" id="orderBasicForm" name="orderBasicForm"  method="post">
						<table>
							<tr>
								<td class="tdTitle">프로젝트명</td>
								<td class="tdContents" colspan="3">
									<!-- 
									<select id="slt_orderCtClass" name="orderCtClass" style="width: 95px">
										<option value="P">프로젝트</option>
										<option value="M">유지보수</option>
									</select>
									 -->		
									<input type="text"   id="ipt_pjNm" onclick="javascript:fnOpenPjPopup();" value="${orderInfo.pjNm}" class="search" style="width: 315px;" readOnly/>
									<input type="hidden" id="ipt_orderCtFkKey" name="orderCtFkKey" value="${orderInfo.orderCtFkKey}"/>
									<img id="pj_delete_project" src="<c:url value='/images/btn_del_gray.png'/>" onclick="fn_deleteProject();" style="vertical-align: middle; display:none"/>
								</td>
								<td class="tdTitle">고객사</td>
								<td class="tdContents">
									<input type="text" id="ipt_accountNm" style="background-color: #d3d3d3;" value="${orderInfo.acNm}" readOnly/>
									
								</td>
							</tr>
							<tr id="m_tr_account">
								<td class="tdTitle">매입처</td>
								<td class="tdContents">
									<input type="text"   id="ipt_orderAcNm"  value="${orderInfo.orderAcNm}" class="search" autocomplete="off" style="background-color: #f0f8ff;"/>
									<input type="hidden" id="ipt_orderAcKey" name="orderAcKey" value="${orderInfo.orderAcKey}" />	
								</td>
								<td class="tdTitle">매입처담당자</td>
								<td class="tdContents">
									<select id="slt_orderAcDirectorKey" name="orderAcDirectorKey">
										<option value="">선택</option>
										<c:forEach var="result" items="${directorList}" varStatus="status">
											<option value='<c:out value="${result.acDirectorKey}"/>'><c:out value="${result.acDirectorNm}"/></option>
										</c:forEach>				
									</select>
								</td>
								<td class="tdTitle">등록자</td>
								<td class="tdContents">
									<select id="slt_regEmpKey" name="regEmpKey">
										<option value="">선택</option>
										<c:forEach var="result" items="${employeeList}" varStatus="status">
											<option value='<c:out value="${result.empKey}"/>'><c:out value="${result.empNm}"/></option>
										</c:forEach>								
									</select>
								</td>
							</tr>
							<tr>
								<td class="tdTitle">발주일자</td>
								<td class="tdContents">
									 
									<c:if test='${orderInfo == null}'> 
										<c:set var="orderDay" value="${today}"/>
									</c:if> 
									<c:if test='${orderInfo != null}'> 
										<c:set var="orderDay" value="${orderInfo.orderDt}"/>
									</c:if> 
									
									<input type="text" id="ipt_orderDt" name="orderDt" value="${displayUtil.displayDate(orderDay)}" class="calendar fromDt" />	
								</td>
								<td class="tdTitle">부가세 포함</td>
								<td class="tdContents">
									<input type="radio" class="tCheck" name="taxYn" value="Y" id="rdo_taxY" /><label for="rdo_taxY" class="cursorP"></label>&nbsp;&nbsp;Y&nbsp;&nbsp;
									<input type="radio" class="tCheck" name="taxYn" value="N" id="rdo_taxN" checked/><label for="rdo_taxN" class="cursorP"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
								</td>
								<td class="tdTitle">결제조건</td>
								<td class="tdContents">
									<input type="text" name="orderPayTerms" value="${orderInfo.orderPayTerms}" />	
								</td>
							</tr> 
						</table>
						<!-- 수정을 위한 orderKey -->
						<input type="hidden" id="mipt_orderKey" name="orderKey" value="${orderKey}" />
					</form>
					
					
					<div class="subjectContainer">
						<table class="subject">
							<tr>		
								<td class="subTitle" style="border-top: none;">
									<label class="ftw400">제품정보</label>
								</td>
								<td class="subBtn" colspan="5"  style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable();"/></td>
							</tr>
						</table>
					</div>
					
					<form action="/" id="productListForm" name="productListForm"  method="post">
						<div id="prodWrap">
							<div class="prodTable">
								<input type="hidden" name="lastNum" value="0" />
								<table>
									<tr>
										<td class="tdTitle firstTd">제품</td>
										<td class="tdContents firstTd">
											<input type="text"   id="prodList_0_orderPmNm"    name="prodList_0_orderPmNm" onclick="javascript:fnOpenPdPopup(this);" class="search" style="background-color: #d3d3d3;" readOnly/>	
											<input type="hidden" id="prodList_0_orderPmFkKey" name="prodList_0_orderPmFkKey"/>	
										</td>
										<td class="tdTitle firstTd">합계</td>
										<td class="tdContents firstTd">
											<input type="text" id="prodList_0_totalAmount" name="prodList_0_totalAmount" class="price" onblur="javascript:insertComma(this);" onfocus="javascript:removeComma(this);"/>	
										</td>
										<td class="tdTitle firstTd">수량</td>
										<td class="tdContents firstTd">
											<input type="text" id="prodList_0_orderQuantity" name="prodList_0_orderQuantity" style="width: 75px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
											<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
				                        	<img src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
										</td>
									</tr>
									<tr class="dpTbRow">
										<td class="tdTitle">단가</td>
										<td class="tdContents">
											<input type="text" id="prodList_0_orderUprice" name="prodList_0_orderUprice" class="price" onblur="javascript:insertComma(this);" onfocus="javascript:removeComma(this);"/>
										</td>	
										<td class="tdTitle">입고일자</td>
										<td class="tdContents">
											<input type="text" id="prodList_0_orderReceiptDt" name="prodList_0_orderReceiptDt" value="${displayUtil.displayDate(today)}" class="calendar toDt" />
										</td>
										<td class="tdTitle">매입구분</td>
										<td class="tdContents">
											<select id="prodList_0_orderCategory" name="prodList_0_orderCategory">
												<option>매입구분</option>
												<option value="HW">하드웨어</option>
												<option value="SW">소프트웨어</option>
											</select>		
										</td>
									</tr>
									<tr class="dpTbRow">
										<td class="tdTitle lastTd">제품상세</td>
										<td class="tdContents lastTd" colspan="5">
											<textarea id="prodList_0_remark" name="prodList_0_remark" class="list-end"></textarea>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</form>
					
				</div>
				
				<div class="btnWrap floatR">
					<div class="floatR" onclick="">
						<button type="button" onclick="javascript:fnSave();"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		<!-- 			
		</form>
		 -->
	</div>
</body>
</html>