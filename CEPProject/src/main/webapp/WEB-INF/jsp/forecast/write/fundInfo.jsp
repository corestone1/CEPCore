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
		}
		.popContainer .left ul li:hover,
		.popContainer .left ul li.on {
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
		.popContainer .contents > div table {
			width: 100%;
			border-collapse: separate;
	  		margin-top: 14px;
	  		border-top: 2px solid #e5e5e5;
	  		padding-top: 7px;
		}
		.popContainer .contents td.tdTitle {
		    margin-top: 11px;
		    font-size: 14px;
		    color: #000;
		    padding: 0 10px;
		    width: 98px;
		    font-weight: 200;
		}
		.pcTable td.tdTitle {
			width: 101px !important;
		}
		.pcTable td.tdContents.d2 {
			width: 331px !important;
		}
		.pcTable td.tdTitle.d3 {
			width: 108px !important;
		}
		.pcTable td.tdContents.d4 {
			width: 317px !important;
		}
		.popContainer .contents td.tdTitle label {
		    color: red;
		    vertical-align: middle;
		}
		.popContainer .contents td.tdContents {
		    width: 37%;
		    font-size: 14px;
		}
		.pcTable td.tdContents {
		    width: 378px !important;
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
			width: 144px;
		}
		.popContainer .contents input {
			width: 269px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
			margin: 3px 0 6px 0;
		}
		.popContainer .contents input[class="search"] {
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents td span {
			display: inline-block;
			width: 165px;
			font-weight: 300;
		}
		.popContainer .tableWrap {
			font-size: 18px;
			color: #535353;
		}
		#pcForm {
			margin-top: 18px;
		}
		#m_div_accountList {
			margin-left: 112px;
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
		.move .moveSpan.right {
			left: 15px;
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
		.move .moveSpan.right::after {
			left: 18%;
		}
	</style>
	<script>
	
	$(document).ready(function(){
		$('#m_ipt_spKey').val("${spKey}");
		
		/* $(".search").on("keyup", function(event){
			
			/* if(event.keyCode == 13)
			{ */
				/*fnSearchAccoutList(this);					
			/* } */
				
		/*}); */
		/* $('#m_ipt_fcSalesAmount').on('Change', function(event){
			alert('change');
		}); */
		
		
		$('#m_ipt_fcSalesAmount').focus(function(){
			$(this).val(removeCommas($(this).val()));
		});
		
		$('#m_ipt_fcSalesAmount').blur(function(){
			$(this).val(addCommas($(this).val()));
		});
		
		$('#m_ipt_fcBuyAmount').focus(function(){
			$(this).val(removeCommas($(this).val()));
		});
		
		$('#m_ipt_fcBuyAmount').blur(function(){
			$(this).val(addCommas($(this).val()));
		});
		
		if($('#isUpdate').val() == "Y") {
			$('.btnSave').children().eq(0).html('');
			$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />'); 
		} 
		
		if("Y" == "${forecast.bdYn}"){
			$('#bidding_menu').show();
		} else {
			$('#bidding_menu').hide();
		}	
		
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
						if("P" == "${forecast.salesCtClass}") {
							jQuery.each(arr, function() {
							
								if((this.name == "salesAcNm" && this.value.length == 0) || (this.name == "buyAcNm" && this.value.length == 0)) {
									obj = {};
									return false; 
								}
								
								if(this.name=="fcSalesAmount" || this.name=="fcBuyAmount") {
									obj[this.name] = removeCommas(this.value); 
								} else {
									obj[this.name] = this.value; 
								}
								
								/*
								* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
								* 반복되는 필드값에서 아래부분만 변경사항 있음.
								*/
								if('fcCollectDtMt' == this.name || 'fcBuyPayDtMt' == this.name){
									objArry.push(obj);
									obj = {};
								}
							}); 	            
						} else {
							jQuery.each(arr, function() {
								
								if((this.name == "salesAcNm" && this.value.length == 0) || (this.name == "buyAcNm" && this.value.length == 0)) {
									obj = {};
									return false; 
								}
								
								if(this.name=="fcSalesAmount" || this.name=="fcBuyAmount") {
									obj[this.name] = removeCommas(this.value); 
								} else {
									obj[this.name] = this.value; 
								}
								
								if('fcSalesAmount' == this.name || 'fcBuyAmount' == this.name){
									objArry.push(obj);
									obj = {};
								}
							});
						}
				} 
			} 
		}catch(e) { 
			alert(e.message); 
		}finally {} 
		return objArry; 
	}
	
	function fnSearchAccoutList(pObject)
	{
		var pstAccountNm = $(pObject).val();
		var kind = $(pObject).attr("name");
		var jsonData = {};
		
		$('#m_div_accountList').remove();
		
		if(kind.includes("sales")) {
			jsonData =  {'acNm' : pstAccountNm, 'acSalesYN' : 'Y'};
		} else {
			jsonData = {'acNm' : pstAccountNm, 'acBuyYN' : 'Y'};
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
	
	//
	function fnViewAccountList(pObject, pjAccountList){
		
		var id = "#"+$(pObject).attr("id");
		
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
		$(pObject).parent().parent().eq(0).after(html);
		
		$("[id^='m_li_account']").click(function(event)
		{
			var acKey = this.title;
			var isExist = false;
    		$("input[name="+$(pObject).attr("name")+"]").each(function() {
   				if($(this).next().val().replace(" ","") == acKey) {
   					isExist = true;
   				} else {
   					
   				}
    		});
    		if(isExist) {
    			alert("해당 거래처에 대한 정보가 이미 존재합니다.");
    		} else {
			//alert(this.innerText);
			
				$(pObject).next().val(this.title); 
				$(pObject).val(this.innerText);
				
				$('#m_div_accountList').remove();
    		}
		});
			
	}
	
	function fn_chkVali() {
		if ($("#salesForm")[0].checkValidity()){
            if ($("#pcForm")[0].checkValidity()){
               //필수값 모두 통과하여 저장 프로세스 호출.
               fnWriteFundInfo();
            } else {
                $("#pcForm")[0].reportValidity();   
            }            
            
         }  else {
             //Validate Form
              $("#salesForm")[0].reportValidity();   
         }
	}
	
	var fnWriteFundInfo = function() {
		
		//alert("fnWriteFundInfo");
		var object = {};
		var keyData = $("#keyForm").serializeArray();
		var salesData = $("#salesForm").serializeObject();
		var pcData = $("#pcForm").serializeObject();

		var salesAmount = 0;
		var pcAmount = 0;
		
		$("input[name='fcSalesAmount']").each(function() {
			salesAmount += removeCommas($(this).val()) * 1; 
		});
		$("input[name='fcBuyAmount']").each(function() {
			pcAmount += removeCommas($(this).val()) * 1; 
		});
		
		/* if(salesAmount < pcAmount) {
			if(confirm("매입 금액이 매출 금액보다 큽니다. 그대로 진행하겠습니까?")) {
				
				for (var i = 0; i<keyData.length; i++){
					object[keyData[i]['name']] = keyData[i]['value'];
				}           
				
				if($("input[name='salesAcNm']").val() == null || $("input[name='salesAcNm']").val() == "" || $("input[name='salesAcNm']").val().length == 0) {
					object["forecastSalesVOList"] = new Array();
				} else {
					object["forecastSalesVOList"] = salesData;
				}
				
				object["forecastPcVOList"] = pcData;
				
				var sendData = JSON.stringify(object);
				
				fn_insertFundInfo(sendData);
			}
		} else { */
			
		for (var i = 0; i<keyData.length; i++){
			object[keyData[i]['name']] = keyData[i]['value'];
		}           
		
		object["forecastSalesVOList"] = salesData;
		object["forecastPcVOList"] = pcData;
		
		var sendData = JSON.stringify(object);
		
		fn_insertFundInfo(sendData);
		/* } */
	};
	
	function fn_insertFundInfo(sendData) {
		$.ajax({
	    	url :"/forecast/write/writeFundInfo.do",
	       	type:"POST",  
	        data: sendData,
	        contentType: "application/json; charset=UTF-8", 
	        dataType: 'json',
	    	success:function(data){		  
	           	if($('#isUpdate').val().replace(" ", "") == ("N") || $('#isUpdate').val().replace(" ", "").length == 0) {
	    			alert("Forecast 매출/입 정보가 저장되었습니다.");	
	    			$('#isUpdate').val("Y");
	    		} else {
	    			alert("Forecast 매출/입 정보가 수정되었습니다.");	
	    		}
	           	
	           	fnMoveTab('fundInfo');
	        },
	        error: function(request, status, error) {
	        	if(request.status != '0') {
	        		alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        	}
	        } 
	    });    
	}
	
	function fn_addInfoTable(tableType) {
		
		var type = tableType;
		
		var lastNum = $("input[name='"+type+"lastNum']").get($("input[name='"+type+"lastNum']").length-1).getAttribute('value')*1;
		
    	var clones = $('.'+type+'Table').clone();
    	var clone = new jQuery.fn.init(clones[clones.length - 1]);
    	
    	if(clone.find("input[name='buyAcNm']").val().length == 0) {
    		alert("매입 정보를 입력한 후 추가해주세요.");
    		$("input[name='buyAcNm']").focus();
    	} else {
			
	    	var str = "";
	    	var nameArr = new Array();
	    	var idArr = new Array();
	    	var forArr = new Array();
	    	
	    	var tr = $('.'+type+'Table tr');
	    	var td = tr.children().children();
	    	
	    	var salesAmount = 0;
			var pcAmount = 0;
			
			$("input[name='fcSalesAmount']").each(function() {
				salesAmount += removeCommas($(this).val()) * 1; 
			});
			$("input[name='fcBuyAmount']").each(function() {
				pcAmount += removeCommas($(this).val()) * 1; 
			});
			
	    	$('#'+type+'Length').val($('#'+type+'Length').val()*1 + 1);
	    	
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
	    		$("input[name='"+type+"lastNum']").val(lastNum+1);
	    		//clone.find('input[name="'+type+'lastNum"]').val(lastNum+1);
				clone.find('input[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val("");
				clone.find('input[name="' + nameArr[i]+'"]').attr('required', true);
				clone.find('input[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).attr('value', '');
				clone.find('select[name="' + nameArr[i]+'"] option:eq(0)').prop("selected", true);
				//clone.find('select[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 		
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
	    	
	    	$('#'+type+'Form').append(clone);
    	}
	}
	
	function fn_delete(obj, type) {

		/* var listNum;
		var acName;
		var deleteKey;
		var table = obj.parentNode.parentNode.parentNode.parentNode;
		var selectNum = JSON.stringify($(obj.id).selector);
		var length = $('#'+type+'Length').val()*1;
		var id = '#'+type;
		var originType = type;
		
		if(length>1) {
			
			/*
			* 전체금액에서 삭제된 테이블 금액을 뺀다.
			* 삭제테이블의 제품정보를 수집한다.
			*/
		/*	listNum = selectNum.split('-')[1];
			
			if(type == 'pc') {
				type = 'buy';
			}
			
			deleteKey =  $(id+'List-'+listNum+'-'+type+'Key').val();
			acName = $(id+'List-'+listNum+'-'+type+'AcNm').val();
			
			var salesAmount = 0;
			var pcAmount = 0;
			
			$("input[name='fcSalesAmount']").each(function() {
				salesAmount += removeCommas($(this).val()) * 1; 
			});
			$("input[name='fcBuyAmount']").each(function() {
				pcAmount += removeCommas($(this).val()) * 1; 
			});
			
			if(acName == null || acName == "" || acName.length == 0) {
				//선택한  테이블을 삭제한다.
				table.remove();
				
				$(id+'Length').val($(id+'Length').val()*1 - 1);
				$('input[name='+originType+'lastNum]').val($('input[name='+originType+'lastNum]').val()*1 - 1);
			} else if(confirm(acName+" 정보를 삭제하시겠습니까?")) {
				//삭제key list를 만든다.
				if(deleteKey !='') {
					if(type == 'sales') {
						$('#salesDeleteListKeys').val($('#salesDeleteListKeys').val()+deleteKey+":");
					} else {
						$('#pcDeleteListKeys').val($('#pcDeleteListKeys').val()+deleteKey+":");
					}
				}					
				
				//선택한  테이블을 삭제한다.
				table.remove();
				
				$(id+'Length').val($(id+'Length').val()*1 - 1);
				$('input[name='+originType+'lastNum]').val($('input[name='+originType+'lastNum]').val()*1 - 1);
			}
		} else {
			alert("매출/입 정보는 한 개 이상 존재해야 합니다.");
		}			
		
		
		
		 */
		

		/*
		* 전체금액에서 삭제된 테이블 금액을 뺀다.
		* 삭제테이블의 제품정보를 수집한다.
		*/
		var listNum;
		var acName;
		var deleteKey;
		var table = obj.parentNode.parentNode.parentNode.parentNode;
		var selectNum = JSON.stringify($(obj.id).selector);
		var length = $('#'+type+'Length').val()*1;
		var id = '#'+type;
		var originType = type;
		
		listNum = selectNum.split('-')[1];
		
		if(type == 'pc') {
			type = 'buy';
		}
		
		deleteKey =  $(id+'List-'+listNum+'-'+type+'Key').val();
		acName = $(id+'List-'+listNum+'-'+type+'AcNm').val();
		
		var salesAmount = 0;
		var pcAmount = 0;
		
		$("input[name='fcSalesAmount']").each(function() {
			salesAmount += removeCommas($(this).val()) * 1; 
		});
		$("input[name='fcBuyAmount']").each(function() {
			pcAmount += removeCommas($(this).val()) * 1; 
		});
		
		if(acName == null || acName == "" || acName.length == 0) {
			//선택한  테이블을 삭제한다.
			if(length>1) {
				table.remove();
			} else {
				$("input[name='buyAcNm'").val('');
				$("input[name='fcBuyAmount").val('');
				$(".pcTable select").each(function() {
					$(this).find("option:eq(0)").prop("selected", true);
				})
			}
			
			$(id+'Length').val($(id+'Length').val()*1 - 1);
			$('input[name='+originType+'lastNum]').val($('input[name='+originType+'lastNum]').val()*1 - 1);
		} else if(confirm(acName+" 정보를 삭제하시겠습니까?")) {
			//삭제key list를 만든다.
			if(deleteKey !='') {
				if(type == 'sales') {
					$('#salesDeleteListKeys').val($('#salesDeleteListKeys').val()+deleteKey+":");
				} else {
					$('#pcDeleteListKeys').val($('#pcDeleteListKeys').val()+deleteKey+":");
				}
			}			
			
			//선택한  테이블을 삭제한다.
			if(length>1) {
				table.remove();
			} else {
				$("input[name='buyAcNm'").val('');
				$("input[name='fcBuyAmount").val('');
				$(".pcTable select").each(function() {
					$(this).find("option:eq(0)").prop("selected", true);
				})
			}
			
			$(id+'Length').val($(id+'Length').val()*1 - 1);
			$('input[name='+originType+'lastNum]').val($('input[name='+originType+'lastNum]').val()*1 - 1);
		}
		
	}
	
	var fnMoveTab = function(pstTabName){
		/* if(pstTabName == 'basic') {
			fn_addView(pstTabName, $('#m_ipt_spKey').val());
		} else if(pstTabName == 'progress') {
			if($('#isUpdate').val() == "N") {
				alert("저장을 해주세요.");
			} else {
				fn_addView(pstTabName, $('#m_ipt_spKey').val());
			}
		} else if(pstTabName == 'biddingInfo') {
			if($('#isUpdate').val() == "N") {
				alert("저장을 해주세요.");
			} else if($("#pmDetail2").length == 0 && $("#remark").length == 0) {
				alert("제품 및 진행사항 정보가 등록되지 않았습니다.\n제품 및 진행사항 정보를 먼저 등록하세요.");
			} else {
				fn_addView(pstTabName, $('#m_ipt_spKey').val());
			}
		} else {
			fn_addView(pstTabName, $('#m_ipt_spKey').val());
		} */
		
		fn_addView(pstTabName, $('#m_ipt_spKey').val());
	};
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
				<li class="colorWhite cursorP" onclick="javascript:fnMoveTab('basic')">기본 정보</li>
				<li class="colorWhite cursorP on">매출/입 정보</li>
				<li class="colorWhite cursorP" onclick="javascript:fnMoveTab('progress')">제품 및 진행사항</li>
				<li class="colorWhite cursorP" id="bidding_menu" onclick="javascript:fnMoveTab('biddingInfo')" style="display:none">입찰 정보</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<!-- Forecast Key -->
				<form id="keyForm" name="keyForm" method="post">
					<input type="hidden" id="workClass" name="workClass" value="입찰_첨부파일"/>
					<input type="hidden" name="spKey" id="m_ipt_spKey"/>
					<input type="hidden" id="isUpdate" 
						<c:choose>
							<c:when test="${fn:length(salesList) eq 0 and fn:length(pcList) eq 0 }">
								value="N"
							</c:when>
							<c:otherwise>
								value="Y"
							</c:otherwise>
						</c:choose>
					/>
					<input type="hidden" id="salesDeleteListKeys" name="salesDeleteListKeys" />
					<input type="hidden" id="pcDeleteListKeys" name="pcDeleteListKeys" />
					<input type="hidden" id="pmDetail2" value="${forecast.pmDetail2 }" />
					<input type="hidden" id="remark" value="${forecast.remark }" />
					<c:choose>
						<c:when test="${fn:length(salesList) eq 0}">
							<input type="hidden" id="salesLength" name="salesLength" value="1" />
						</c:when>
						<c:otherwise>
							<input type="hidden" id="salesLength" name="salesLength" value="<c:out value="${fn:length(salesList)}"/>" />
						</c:otherwise>
					</c:choose> 
					<c:choose>
						<c:when test="${fn:length(pcList) eq 0}">
							<input type="hidden" id="pcLength" name="pcLength" value="1" />
						</c:when>
						<c:otherwise>
							<input type="hidden" id="pcLength" name="pcLength" value="<c:out value="${fn:length(pcList)}"/>" />
						</c:otherwise>
					</c:choose> 
				</form>
				<form id="salesForm" name="salesForm" method="post">
					<div class="tableWrap">매출정보</div>
					<c:choose>
						<c:when test="${fn:length(salesList) eq 0 }">
							<input type="hidden" name="saleslastNum" id="saleslastNum" value="0" />
							<table class="salesTable">
								<tr>
									<td class="tdTitle">
										매출처
										<input type="hidden" id="salesList-0-salesKey" name="salesKey" value="" />
									</td>
									<td class="tdContents">
										<input type="text" name="salesAcNm" id="m_ipt_salesAcNm"  placeholder="매출처" class="search"  onkeyup="fnSearchAccoutList(this);" autocomplete="off" value="" />
										<input type="hidden" name="salesAcKey" id="m_ipt_salesAcKey" value="" />
									</td>
									<td class="tdTitle">매출액</td>
									<td class="tdContents">
										<input type="text" name="fcSalesAmount" id="m_ipt_fcSalesAmount" placeholder="매출액" value=""  amountonly/>
									</td>
									<td></td>
								</tr>
								<c:if test="${forecast.salesCtClass == 'P' }">
								<tr>
									<td class="tdTitle">매출계산서일정</td>
									<td class="tdContents">
										<select id="m_slt_fcSalesDtYear" name="fcSalesDtYr" class="wdts">
											<c:set var="now" value="<%=new java.util.Date() %>" />
											<c:set var="sysYear"><fmt:formatDate value="${now }" pattern="yyyy" /></c:set>
											<option value="${sysYear }"><c:out value="${sysYear }" />년</option>
											<option value="${sysYear + 1}"><c:out value="${sysYear + 1}" />년</option>
										</select>
										<select id="m_slt_fcSalesDtMt" name="fcSalesDtMt" class="wdts">
											<option value="01"> 1월</option>
											<option value="02"> 2월</option>
											<option value="03"> 3월</option>
											<option value="04"> 4월</option>
											<option value="05"> 5월</option>
											<option value="06"> 6월</option>
											<option value="07"> 7월</option>
											<option value="08"> 8월</option>
											<option value="09"> 9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option>
										</select>
									</td>
									<td class="tdTitle">수금일정</td>
									<td class="tdContents">
										<select id="m_slt_fcCollectDtYr" name="fcCollectDtYr" class="wdts">
											<c:set var="now" value="<%=new java.util.Date() %>" />
											<c:set var="sysYear"><fmt:formatDate value="${now }" pattern="yyyy" /></c:set>
											<option value="${sysYear }"><c:out value="${sysYear }" />년</option>
											<option value="${sysYear + 1}"><c:out value="${sysYear + 1}" />년</option>
										</select>
										<select id="m_slt_fcCollectDtMt" name="fcCollectDtMt" class="wdts">
											<option value="01"> 1월</option>
											<option value="02"> 2월</option>
											<option value="03"> 3월</option>
											<option value="04"> 4월</option>
											<option value="05"> 5월</option>
											<option value="06"> 6월</option>
											<option value="07"> 7월</option>
											<option value="08"> 8월</option>
											<option value="09"> 9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option>
										</select>
									</td>
								</tr>
								</c:if>
							</table>
						</c:when>
						<c:otherwise>
							<c:forEach var="result" items="${salesList}" varStatus="status">
								<input type="hidden" name="saleslastNum" id="saleslastNum" value="<c:out value="${status.index}"/>" />
								<table class="salesTable">
									<tr>
										<td class="tdTitle">
											매출처
											<input type="hidden" id="salesList-<c:out value="${status.index}"/>-salesKey" name="salesKey" value="<c:out value="${result.salesKey}"/>" />
										</td>
										<td class="tdContents">
											<input type="text" name="salesAcNm" id="salesList-<c:out value="${status.index}"/>-salesAcNm" placeholder="매출처" class="search"  onkeyup="fnSearchAccoutList(this);" autocomplete="off" value="${result.salesAcNm }"/>
											<input type="hidden" name="salesAcKey" id="salesList-<c:out value="${status.index}"/>-salesAcKey" value="${result.salesAcKey }" />
										</td>
										<td class="tdTitle">매출액</td>
										<td class="tdContents">
											<input type="text" name="fcSalesAmount" id="salesList-<c:out value="${status.index}"/>-fcSalesAmount" placeholder="매출액" 
												<c:if test="${result.fcSalesAmount eq 0 and result.fcSalesAmount eq null}"></c:if>
												<c:if test="${result.fcSalesAmount ne 0 }">value="${displayUtil.commaStr(result.fcSalesAmount) }" </c:if> 
												amountonly
											/>
										</td>
										<td></td>
									</tr>
									<c:if test="${forecast.salesCtClass == 'P' }">
									<tr>
										<td class="tdTitle">매출계산서일정</td>
										<td class="tdContents">
											<select id="salesList-<c:out value="${status.index}"/>-fcSalesDtYear" name="fcSalesDtYr" class="wdts">
												<c:set var="now" value="<%=new java.util.Date() %>" />
												<c:set var="sysYear"><fmt:formatDate value="${now }" pattern="yyyy" /></c:set>
												<option value="${sysYear }" ${fn:substring(result.fcSalesDt, 0, 4) == sysYear ? 'selected' : ''}><c:out value="${sysYear }" />년</option>
												<option value="${sysYear + 1}" ${fn:substring(result.fcSalesDt, 0, 4) == (sysYear + 1) ? 'selected' : ''}><c:out value="${sysYear + 1}" />년</option>												
											</select>
											<select id="salesList-<c:out value="${status.index}"/>-fcSalesDtMt" name="fcSalesDtMt" class="wdts">
												<option value="01" ${fn:substring(result.fcSalesDt, 4, fn:length(result.fcSalesDt)) == '01' ? 'selected' : ''}> 1월</option>
												<option value="02" ${fn:substring(result.fcSalesDt, 4, fn:length(result.fcSalesDt)) == '02' ? 'selected' : ''}> 2월</option>
												<option value="03" ${fn:substring(result.fcSalesDt, 4, fn:length(result.fcSalesDt)) == '03' ? 'selected' : ''}> 3월</option>
												<option value="04" ${fn:substring(result.fcSalesDt, 4, fn:length(result.fcSalesDt)) == '04' ? 'selected' : ''}> 4월</option>
												<option value="05" ${fn:substring(result.fcSalesDt, 4, fn:length(result.fcSalesDt)) == '05' ? 'selected' : ''}> 5월</option>
												<option value="06" ${fn:substring(result.fcSalesDt, 4, fn:length(result.fcSalesDt)) == '06' ? 'selected' : ''}> 6월</option>
												<option value="07" ${fn:substring(result.fcSalesDt, 4, fn:length(result.fcSalesDt)) == '07' ? 'selected' : ''}> 7월</option>
												<option value="08" ${fn:substring(result.fcSalesDt, 4, fn:length(result.fcSalesDt)) == '08' ? 'selected' : ''}> 8월</option>
												<option value="09" ${fn:substring(result.fcSalesDt, 4, fn:length(result.fcSalesDt)) == '09' ? 'selected' : ''}> 9월</option>
												<option value="10" ${fn:substring(result.fcSalesDt, 4, fn:length(result.fcSalesDt)) == '10' ? 'selected' : ''}>10월</option>
												<option value="11" ${fn:substring(result.fcSalesDt, 4, fn:length(result.fcSalesDt)) == '11' ? 'selected' : ''}>11월</option>
												<option value="12" ${fn:substring(result.fcSalesDt, 4, fn:length(result.fcSalesDt)) == '12' ? 'selected' : ''}>12월</option>
											</select>
										</td>
										<td class="tdTitle">수금일정</td>
										<td class="tdContents">
											<select id="salesList-<c:out value="${status.index}"/>-fcCollectDtYr" name="fcCollectDtYr" class="wdts">
												<c:set var="now" value="<%=new java.util.Date() %>" />
												<c:set var="sysYear"><fmt:formatDate value="${now }" pattern="yyyy" /></c:set>
												<option value="${sysYear }" ${fn:substring(result.fcCollectDt, 0, 4) == sysYear ? 'selected' : ''}><c:out value="${sysYear }" />년</option>
												<option value="${sysYear + 1}" ${fn:substring(result.fcCollectDt, 0, 4) == (sysYear + 1) ? 'selected' : ''}><c:out value="${sysYear + 1}" />년</option>
											</select>
											<select id="salesList-<c:out value="${status.index}"/>-fcCollectDtMt" name="fcCollectDtMt" class="wdts">
												<option value="01" ${fn:substring(result.fcCollectDt, 4, fn:length(result.fcCollectDt)) == '01' ? 'selected' : ''}> 1월</option>
												<option value="02" ${fn:substring(result.fcCollectDt, 4, fn:length(result.fcCollectDt)) == '02' ? 'selected' : ''}> 2월</option>
												<option value="03" ${fn:substring(result.fcCollectDt, 4, fn:length(result.fcCollectDt)) == '03' ? 'selected' : ''}> 3월</option>
												<option value="04" ${fn:substring(result.fcCollectDt, 4, fn:length(result.fcCollectDt)) == '04' ? 'selected' : ''}> 4월</option>
												<option value="05" ${fn:substring(result.fcCollectDt, 4, fn:length(result.fcCollectDt)) == '05' ? 'selected' : ''}> 5월</option>
												<option value="06" ${fn:substring(result.fcCollectDt, 4, fn:length(result.fcCollectDt)) == '06' ? 'selected' : ''}> 6월</option>
												<option value="07" ${fn:substring(result.fcCollectDt, 4, fn:length(result.fcCollectDt)) == '07' ? 'selected' : ''}> 7월</option>
												<option value="08" ${fn:substring(result.fcCollectDt, 4, fn:length(result.fcCollectDt)) == '08' ? 'selected' : ''}> 8월</option>
												<option value="09" ${fn:substring(result.fcCollectDt, 4, fn:length(result.fcCollectDt)) == '09' ? 'selected' : ''}> 9월</option>
												<option value="10" ${fn:substring(result.fcCollectDt, 4, fn:length(result.fcCollectDt)) == '10' ? 'selected' : ''}>10월</option>
												<option value="11" ${fn:substring(result.fcCollectDt, 4, fn:length(result.fcCollectDt)) == '11' ? 'selected' : ''}>11월</option>
												<option value="12" ${fn:substring(result.fcCollectDt, 4, fn:length(result.fcCollectDt)) == '12' ? 'selected' : ''}>12월</option>
											</select>
										</td>
									</tr>
									</c:if>
								</table>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</form>
				<form id="pcForm" name="pcForm" method="post">
					<div class="tableWrap">매입정보 <button type="button" onclick="fn_addInfoTable('pc');"><img class="veralignM" src="/images/btn_add-pop.png" /></button></div>
					<c:choose>
						<c:when test="${fn:length(pcList) eq 0 }">
							<input type="hidden" name="pclastNum" id="pclastNum" value="0" />
							<table class="pcTable">
								<tr id="m_tr_account">
									<td class="tdTitle">
										매입처
										<input type="hidden" name="buyKey" id="pcList-0-buyKey" value="" />
									</td>
									<td class="tdContents d2">
										<input type="text"   name="buyAcNm"  id="pcList-0-buyAcNm"  placeholder="매입처" class="search"  onkeyup="fnSearchAccoutList(this);" autocomplete="off" value="" />
										<input type="hidden" name="buyAcKey" id="pcList-0-buyAcKey" value=""/>
									</td>
									<td class="tdTitle d3">매입액</td>
									<td class="tdContents d4">
										<input type="text" name="fcBuyAmount"  id="pcList-0-fcBuyAmount" placeholder="매입액" value=""  amountonly/>
									</td>
									<td><img class="cursorP" id="pcList-0-delete" src="/images/popup_close.png" onclick="fn_delete(this, 'pc');" style="width: 11px;vertical-align: top;"></td>
								</tr>
								<c:if test="${forecast.salesCtClass == 'P' }">
								<tr>
									<td class="tdTitle">매입계산서일정</td>
									<td class="tdContents d2">
										<select name="fcBuyDtYr" id="pcList-0-fcBuyDtYr" class="wdts">
											<c:set var="now" value="<%=new java.util.Date() %>" />
											<c:set var="sysYear"><fmt:formatDate value="${now }" pattern="yyyy" /></c:set>
											<option value="${sysYear }"><c:out value="${sysYear }" />년</option>
											<option value="${sysYear + 1}"><c:out value="${sysYear + 1}" />년</option>
										</select>
										<select name="fcBuyDtMt" id="pcList-0-fcBuyDtMt" class="wdts">
											<option value="01"> 1월</option>
											<option value="02"> 2월</option>
											<option value="03"> 3월</option>
											<option value="04"> 4월</option>
											<option value="05"> 5월</option>
											<option value="06"> 6월</option>
											<option value="07"> 7월</option>
											<option value="08"> 8월</option>
											<option value="09"> 9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option>
										</select>
									</td>
									<td class="tdTitle d3">지급일정</td>
									<td class="tdContents d4">
										<select name="fcBuyPayDtYr" id="pcList-0-fcBuyPayDtYr" class="wdts">
											<c:set var="now" value="<%=new java.util.Date() %>" />
											<c:set var="sysYear"><fmt:formatDate value="${now }" pattern="yyyy" /></c:set>
											<option value="${sysYear }"><c:out value="${sysYear }" />년</option>
											<option value="${sysYear + 1}"><c:out value="${sysYear + 1}" />년</option>
										</select>
										<select name="fcBuyPayDtMt" id="pcList-0-fcBuyPayDtMt" class="wdts">
											<option value="01"> 1월</option>
											<option value="02"> 2월</option>
											<option value="03"> 3월</option>
											<option value="04"> 4월</option>
											<option value="05"> 5월</option>
											<option value="06"> 6월</option>
											<option value="07"> 7월</option>
											<option value="08"> 8월</option>
											<option value="09"> 9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option>
										</select>
									</td>
								</tr>
								</c:if>
							</table>
						</c:when>
						<c:otherwise>
							<c:forEach var="result" items="${pcList}" varStatus="status">
								<input type="hidden" name="pclastNum" id="pclastNum" value="<c:out value="${status.index}"/>" />
								<input type="hidden" name="buySpFkKey" value="<c:out value="${result.buySpFkKey}"/>" />
								<table class="pcTable">
									<tr id="m_tr_account">
										<td class="tdTitle">
											매입처
											<input type="hidden" name="buyKey" id="pcList-<c:out value="${status.index}"/>-buyKey" value="<c:out value="${result.buyKey}"/>" />
										</td>
										<td class="tdContents d2">
											<input type="text"   name="buyAcNm"  id="pcList-<c:out value="${status.index}"/>-buyAcNm"  placeholder="매입처" class="search"  onkeyup="fnSearchAccoutList(this);" autocomplete="off" value="${result.buyAcNm }" />
											<input type="hidden" name="buyAcKey" id="pcList-<c:out value="${status.index}"/>-buyAcKey" value="${result.buyAcKey }"/>
										</td>
										<td class="tdTitle d3">매입액</td>
										<td class="tdContents d4">
											<input type="text" name="fcBuyAmount"  id="pcList-<c:out value="${status.index}"/>-fcBuyAmount" placeholder="매입액" value="${displayUtil.commaStr(result.fcBuyAmount)}" amountonly/>
										</td>
										<td><img class="cursorP" id="pcList-<c:out value="${status.index}"/>-delete" src="/images/popup_close.png" onclick="fn_delete(this, 'pc');" style="width: 11px;vertical-align: top;"></td>
									</tr>
									<c:if test="${forecast.salesCtClass == 'P' }">
									<tr>
										<td class="tdTitle">매입계산서일정</td>
										<td class="tdContents d2">
											<select name="fcBuyDtYr" id="pcList-<c:out value="${status.index}"/>-fcBuyDtYr" class="wdts">
												<c:set var="now" value="<%=new java.util.Date() %>" />
												<c:set var="sysYear"><fmt:formatDate value="${now }" pattern="yyyy" /></c:set>
												<option value="${sysYear }" ${fn:substring(result.fcBuyDt, 0, 4) == sysYear ? 'selected' : ''}><c:out value="${sysYear }" />년</option>
												<option value="${sysYear + 1}" ${fn:substring(result.fcBuyDt, 0, 4) == (sysYear + 1) ? 'selected' : ''}><c:out value="${sysYear + 1}" />년</option>
											</select>
											<select name="fcBuyDtMt" id="pcList-<c:out value="${status.index}"/>-fcBuyDtMt" class="wdts">
												<option value="01" ${fn:substring(result.fcBuyDt, 4, fn:length(result.fcBuyDt)) == '01' ? 'selected' : ''}> 1월</option>
												<option value="02" ${fn:substring(result.fcBuyDt, 4, fn:length(result.fcBuyDt)) == '02' ? 'selected' : ''}> 2월</option>
												<option value="03" ${fn:substring(result.fcBuyDt, 4, fn:length(result.fcBuyDt)) == '03' ? 'selected' : ''}> 3월</option>
												<option value="04" ${fn:substring(result.fcBuyDt, 4, fn:length(result.fcBuyDt)) == '04' ? 'selected' : ''}> 4월</option>
												<option value="05" ${fn:substring(result.fcBuyDt, 4, fn:length(result.fcBuyDt)) == '05' ? 'selected' : ''}> 5월</option>
												<option value="06" ${fn:substring(result.fcBuyDt, 4, fn:length(result.fcBuyDt)) == '06' ? 'selected' : ''}> 6월</option>
												<option value="07" ${fn:substring(result.fcBuyDt, 4, fn:length(result.fcBuyDt)) == '07' ? 'selected' : ''}> 7월</option>
												<option value="08" ${fn:substring(result.fcBuyDt, 4, fn:length(result.fcBuyDt)) == '08' ? 'selected' : ''}> 8월</option>
												<option value="09" ${fn:substring(result.fcBuyDt, 4, fn:length(result.fcBuyDt)) == '09' ? 'selected' : ''}> 9월</option>
												<option value="10" ${fn:substring(result.fcBuyDt, 4, fn:length(result.fcBuyDt)) == '10' ? 'selected' : ''}>10월</option>
												<option value="11" ${fn:substring(result.fcBuyDt, 4, fn:length(result.fcBuyDt)) == '11' ? 'selected' : ''}>11월</option>
												<option value="12" ${fn:substring(result.fcBuyDt, 4, fn:length(result.fcBuyDt)) == '12' ? 'selected' : ''}>12월</option>
											</select>
										</td>
										<td class="tdTitle d3">지급일정</td>
										<td class="tdContents d4">
											<select name="fcBuyPayDtYr" id="pcList-<c:out value="${status.index}"/>-fcBuyPayDtYr" class="wdts">
												<c:set var="now" value="<%=new java.util.Date() %>" />
												<c:set var="sysYear"><fmt:formatDate value="${now }" pattern="yyyy" /></c:set>
												<option value="${sysYear }" ${fn:substring(result.fcBuyPayDt, 0, 4) == sysYear ? 'selected' : ''}><c:out value="${sysYear }" />년</option>
												<option value="${sysYear + 1}" ${fn:substring(result.fcBuyPayDt, 0, 4) == (sysYear + 1) ? 'selected' : ''}><c:out value="${sysYear + 1}" />년</option>
											</select>
											<select name="fcBuyPayDtMt" id="pcList-<c:out value="${status.index}"/>-fcBuyPayDtMt" class="wdts">
												<option value="01" ${fn:substring(result.fcBuyPayDt, 4, fn:length(result.fcBuyPayDt)) == '01' ? 'selected' : ''}> 1월</option>
												<option value="02" ${fn:substring(result.fcBuyPayDt, 4, fn:length(result.fcBuyPayDt)) == '02' ? 'selected' : ''}> 2월</option>
												<option value="03" ${fn:substring(result.fcBuyPayDt, 4, fn:length(result.fcBuyPayDt)) == '03' ? 'selected' : ''}> 3월</option>
												<option value="04" ${fn:substring(result.fcBuyPayDt, 4, fn:length(result.fcBuyPayDt)) == '04' ? 'selected' : ''}> 4월</option>
												<option value="05" ${fn:substring(result.fcBuyPayDt, 4, fn:length(result.fcBuyPayDt)) == '05' ? 'selected' : ''}> 5월</option>
												<option value="06" ${fn:substring(result.fcBuyPayDt, 4, fn:length(result.fcBuyPayDt)) == '06' ? 'selected' : ''}> 6월</option>
												<option value="07" ${fn:substring(result.fcBuyPayDt, 4, fn:length(result.fcBuyPayDt)) == '07' ? 'selected' : ''}> 7월</option>
												<option value="08" ${fn:substring(result.fcBuyPayDt, 4, fn:length(result.fcBuyPayDt)) == '08' ? 'selected' : ''}> 8월</option>
												<option value="09" ${fn:substring(result.fcBuyPayDt, 4, fn:length(result.fcBuyPayDt)) == '09' ? 'selected' : ''}> 9월</option>
												<option value="10" ${fn:substring(result.fcBuyPayDt, 4, fn:length(result.fcBuyPayDt)) == '10' ? 'selected' : ''}>10월</option>
												<option value="11" ${fn:substring(result.fcBuyPayDt, 4, fn:length(result.fcBuyPayDt)) == '11' ? 'selected' : ''}>11월</option>
												<option value="12" ${fn:substring(result.fcBuyPayDt, 4, fn:length(result.fcBuyPayDt)) == '12' ? 'selected' : ''}>12월</option>
											</select>
										</td>
									</tr>
									</c:if>
								</table>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</form>
			</div>
			<div class="btnWrap floatL">
				<!-- Left -->
				<div class="floatL btnPrev">
					<button type="button" onclick="javascript:fnMoveTab('basic');" class="move"><img src="<c:url value='/images/btn_prev.png'/>" />
						<span class="moveSpan right">저장/수정하지 않은 정보는 반영되지 않습니다.</span>
					</button>
				</div>
				
				<!-- middle -->
				<c:set var="systemName" value='<%=session.getAttribute("name") %>'/>
				<c:set var="mngName" value="${forecast.empNm }" />
				
				<c:if test="${systemName eq mngName }">
					<div class="floatL btnSave">
						<button type="button" onclick="javascript:fn_chkVali();"><img src="<c:url value='/images/btn_save.png'/>" /></button>	
					</div>
				</c:if>
				
				<!-- right -->
				<div class="floatR">
					<button type="button" onclick="javascript:fnMoveTab('progress');" class="move"><img src="<c:url value='/images/btn_next.png'/>" />
						<span class="moveSpan">저장/수정하지 않은 정보는 반영되지 않습니다.</span>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>