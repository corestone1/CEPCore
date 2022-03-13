<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="<c:url value='/js/common.js'/>"></script>
	<title>유지보수계약 매입정보 등록</title>
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
			height: 447px;
			top: 261px;
			left: 201px;			
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto;
			overflow-x: hidden;
		}
		.popContainer .contents > div {
			margin: 10px 47px 0 37px;
			over-flow-y: auto;
			width: 863px
		}
		.popContainer .contents .subject {
			width: 863px;
			border-bottom: 2px solid #e5e5e5;
			padding-bottom: 9px;
		}
		.popContainer .contents select.wdts {
			width: 135px;
		}
		.popContainer .contents select,  .popContainer .contents1 select{
			width: 205px;
			height: 30px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
			margin-bottom: 3px;
		}
		.popContainer input {
			width: 120px;
			height: 30px;
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
		.popContainer .purchaseTable table {
			box-sizing: border-box;
			border-bottom: 2px solid #e5e5e5;
			padding-bottom: 5px;
			margin-top: 5px;
			table-layout: fixed;
			width: 100%;
		}
		.popContainer td.tdTitle {
			margin-top: 11px;
			font-size: 15px;
			color: #525252;
			padding-left: 0px;
			padding-right: 10px;
			width: 40px;
			text-align: right;
		}				
		.popContainer td.tdContents {
			max-width: 120px;
			font-size: 14px;
		}							
		.popContainer td.tdEtc {
			width: 141px;
			font-size: 14px;
		} 	
		.popContainer tr td.sum {
			padding-top: 15px;
		}		
		.popContainer tr td.sum label {
			color: #32bc94;
			font-size: 15px;
		}		
		.popContainer .contents tr:nth-child(1) td {
			padding-top: 10px;
		} 
		.popContainer .contents td.subTitle, .popContainer .contents1 td.subTitle {
			font-size: 18px;
			padding-right: 20px;
			width: 91px;
			padding-top: 20px;
			padding-bottom: 5px;
		}	
		.popContainer .contents textarea {
			width: calc(100% - 22px) !important;
			height: 55px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			/* resize: none; */
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
		.popContainer .contents1 {
			position: absolute;
			width: calc(100% - 201px);
			height: 161px;
			top: 107px;
			left : 201px;
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto;
			overflow-x: hidden;
		}		
		.popContainer .contents1 table {
			box-sizing: border-box;
			width: calc(100% - 72px);
			font-size: 15px;
			margin-top: 7px;
			margin-left: 38px;
			border-collapse: collapse;
			overflow: hidden;
		}
		.popContainer .contents1 table thead {
			background-color: #e1dff5;
			float: left;
			width: calc(100% - 8px);
			border-top: 3.5px solid #6a5bae;
		}
		.popContainer .contents1 table thead {
			display: table-header-group;
		}
		.popContainer .contents1 table tbody {
			width: calc(100% - 5px);
			/* height: 200px; */
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			font-size: 14px;
		}
		.popContainer .contents1 table tbody tr {
			display: table;
			width: calc(100% - 5px);
			/* cursor: pointer; */
		}
		.popContainer .contents1 table thead{			
			font-size: 15px;
		}
		.popContainer .contents1 table thead th {
			padding: 10px 0;
			border: 1px solid #edebef;
		}
		.popContainer .contents1 table tbody tr td {
			padding: 0px 0;
			border: 1px solid #edebef;
		}
		.popContainer .contents tr:nth-child(1) td {
			border: 0px;
		}
		/* 
		.popContainer .contents1 tr:first-child td { 
			border-bottom:2px solid #e5e5e5;	
		}	 */
		.contents1 table thead th:first-child,
		.contents1 table tbody td:first-child {
			width: 225px;
			max-width: 225px;
			border: 1px solid #edebef;
		}	
		.contents1 table thead th:nth-child(2),
		.contents1 table tbody td:nth-child(2) {
			width: 220px;
			max-width: 220px;
		}
		.contents1 table thead th:nth-child(3),
		.contents1 table tbody td:nth-child(3),
		.contents1 table thead th:nth-child(5),
		.contents1 table tbody td:nth-child(5) {
			width: 110px;
			max-width: 110px;
		}
		
		.contents1 table thead th:nth-child(4),
		.contents1 table tbody td:nth-child(4) {
			width: 190px;
			max-width: 190px;
		}
		.popContainer input[class="pname"] {
			width: 95px;
			border : none;
			outline: none;
			padding : 0px;
			background-color: #f6f7fc;
		}
		.calculate {
			text-align: right !important;
		}	
		.popContainer .contents .btnWrap {
			margin : 20px 36px 15px 38px;
		}
		.btnCenter {
			width : calc(100% - 46px);
			text-align: center;
		}
		/* .popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
      	} */
	</style>
	<script>

	
		$(document).ready(function() {			
			
			$('#mtStartDt').val(addDateMinus("${buyAmountRefer.mtStartDt}"));
			$('#mtEndDt').val(addDateMinus("${buyAmountRefer.mtEndDt}"));
			$('#mtOrderStartDt').val(addDateMinus("${buyAmountRefer.mtOrderStartDt}"));
			$('#mtOrderEndDt').val(addDateMinus("${buyAmountRefer.mtOrderEndDt}"));
			$('#mtOrderPayTerms').val("${buyAmountRefer.mtOrderPayTerms}");
			$('#mtOrderAmount').val(addCommas("${buyAmountRefer.mtOrderAmount}"));
			//$('#mtBuyTotalAmount').val(addCommas("${buyAmountRefer.mtBuyTotalAmount}"));
			
			$('#mtSaveOrderAcKey').val("${mtOrderKey}").attr("selected", "true");
			
			fn_calculate();
			
			//합계 이벤트를 호출해줌.
			$(".calculate").blur();
			
			/*
				처음 로딩시  저장된 리스트가 2개보다 많으면  모두 접는다.
				2개까지는 스크롤바가 생성되지 않음.
			*/
			'<c:if test="${purchaseInitCnt > 1 }">'
			fn_viewSummaryUpAll();
			'</c:if>'
				
		});
		/**
		*  화면을 이동시킨다.
		*  @param {string} varUrl 이동해야할 url
		*/
		function fn_changeView(varUrl) {
			var url;
			if($('#mtIntegrateKey').val() !="") {
				if(varUrl == "basicInfoView"){
					if(confirm("유지보수계약 기본정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/contract/write/'+varUrl+'.do';
					} else {
						return false;
					}					
				} else if(varUrl == "productInfoView"){
					if(confirm("유지보수계약 매출계약정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/contract/write/'+varUrl+'.do';
					} else {
						return false;
					}
					
				} else if(varUrl == "salesInfoView"){					

					if(confirm("유지보수계약 매출정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/contract/write/'+varUrl+'.do';
					} else {
						return false;
					}				
					
				} else if(varUrl == "writeSalesPlanView"){					
					if(confirm("유지보수계약 계산서계획정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/contract/write/'+varUrl+'.do';
					} else {
						return false;
					}				
					
				} else if(varUrl == "backOrderInfoView"){
					if(confirm("유지보수계약 백계약정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/contract/write/'+varUrl+'.do';
					} else {
						return false;
					}				
					
				} else if(varUrl == "purchaseAmountView"){				
					if(confirm("유지보수계약 매입정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/contract/write/'+varUrl+'.do';
					} else {
						return false;
					}
				} else if(varUrl == "writePaymentPlanView"){				
					if(confirm("유지보수계약 지급계획정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/contract/write/'+varUrl+'.do';
					} else {
						return false;
					}
				}
			} else {
				alert(" 유지보수계약 기본정보가 등록되지 않아 화면을 이동할 수 없습니다.");
				return false;
			}
			
			if(url != "") {
				
				var dialogId = 'program_layer';
				var varParam = {
					"mtIntegrateKey": $('#mtIntegrateKey').val(),
					"parmMtSbCtYn":"Y"
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			} else {

				return false;
			}			
		} //end fn_changeView()
		
		
		/* 리스트 데이타 만들기.*/
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
							//숫자에서 컴마를 제거한다.
							if('mtBuyYear' == this.name.split('-')[2]){
								obj[this.name.split('-')[2]] = this.value;
							}else{
								obj[this.name] = removeCommas(this.value); 
							}							
							
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('mtBuyDecAmount' == this.name){
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
		/* 년도 중복 체크.*/
		jQuery.fn.checkDuplicate = function() { 
			var obj = null; 
			var objArry = null;
			var dupYear = '';
				try { 
					if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
						var arr = this.serializeArray(); 
						if(arr){ 
							obj = {};
							objArry = new Array();
							jQuery.each(arr, function() {					
								//console.log("this.name1========>"+this.name);
								//console.log("this.name2========>"+this.name.split('-')[2]);
								if('mtBuyYear' == this.name.split('-')[2]){		
									if(Object.keys(obj).includes(this.value)){
										dupYear =  this.value+"년도 매출정보가 중복되었습니다. 확인 후 다시 등록하세요!!";
										$( "#"+this.name ).focus();
										return dupYear;
									} else if(''==this.value) {
										dupYear ="연도가 빈값이 존재합니다. 확인 후 다시 등록하세요!!";
										//console.log("check....this.name========>"+this.name);
										$( "#"+this.name ).focus();
										return dupYear; 
									} else if(4 != this.value.length) {
										dupYear =this.value+"은 년도가 아닙니다. 연도는 4자리로 입력하세요!!";
										$( "#"+this.name ).focus();
										return dupYear;
									} else {
										obj[this.value] = this.value; 
										//console.log("okYear========>"+this.value);
									}
								}
						}); 	              
					} 
				} 
			}catch(e) { 
				alert(e.message); 
			}finally {} 
			return dupYear; 
		}
		

		
		function fn_addInfoTable(type) {
			var lastYear = 0;
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
	    	//name 필드 값 변경
	    	for(var i = 0; i < nameArr.length; i++) {
	    		var splitName = nameArr[i].split('-')[2];
	    		if('mtBuyYear' == splitName){
	    			clone.find('input[name="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('name', name + splitName);	
	    		}				
	    	}
	    	//id값 변경
	    	for(var i = 0; i < idArr.length; i++) {
	    		var splitName = idArr[i].split('-')[2];
				clone.find('input[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);
				clone.find('select[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);
				clone.find('img[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);
				//console.log('select===>'+'select[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]');				
	    	}   	
	    	
	    	//for값 변경
	    	for(var i = 0; i < forArr.length; i++) {
	    		var splitName = forArr[i].split('-')[2];				
				clone.find('label[for="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('for', name + splitName);				
	    	} 
	    	
	    	//펼쳐서 보여주기
	    	clone.find('.dpNone').attr('class', 'dpTbRow');
	    	clone.find('.up').attr('class', 'down').attr('src', '/images/arrow_up.png');
	    	
	    	$('#'+type+'Wrap').append(clone);
	    	//합계금액 0원 셋팅
	    	$('#'+name+'yearTotalAmount').val(0);
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
		
/* 		function fn_viewSummaryUpAll(){
			$(".dpTbRow").attr('class','dpNone');
			$(".down").attr('class','up');
			$(".up").attr('src','<c:url value='/images/arrow_down.png'/>');
			//$(".up").src = "<c:url value='/images/arrow_down.png'/>";
		}
		
		function fn_viewSummaryDownAll(){
			$(".dpNone").attr('class','dpTbRow');
			$(".up").attr('class','down');
			$(".down").attr('src','<c:url value='/images/arrow_up.png'/>');
		} */
		
		/* 제품정보 삭제
		* 업데이트 시 제품정보 제품정보 삭제 목록에 대해 수집한다.  
		* deleteObj에 삭제 년도를 넣어준다.
		*/
		
		function fn_delete(obj, type) {
			var listNum;
			var deleteYear;
			var deleteKey;
			
			var table = obj.parentNode.parentNode.parentNode.parentNode.parentNode;			
			var selectNum = JSON.stringify($(obj.id).selector);			
			var originLength = $('#'+type+'Length').val()*1;			
			
			//한개이상 존재하는 경우 삭제
			if(originLength>1){				
				
				/*
				* 전체금액에서 삭제된 테이블 금액을 뺀다.
				* 삭제테이블의 연도를 수집한다.
				*/
				listNum = selectNum.split('-')[1];
				// 삭제년도 수집.
				deleteYear = $('#purchaseList-'+listNum+'-mtBuyYear').val();				
				
				//삭제 key
				deleteKey =  $('#purchaseList-'+listNum+'-mtBuyKey').val();
				//console.log("deleteKey====>"+deleteKey);
				//삭제확인
				if(confirm(deleteYear+"년도 매입정보를 삭제하시겠습니까?")) {
					//mtBuyKey값이 있는 경우 삭제key list를 만든다.
					if(deleteKey !=''){
						$('#deleteListKeys').val($('#deleteListKeys').val()+deleteKey+":");
					}
					//삭제된 금액을 뺀댜
					deleteAmount(selectNum.split('-')[1]);					
					//선택한  테이블을 삭제한다.
					table.remove();
					//테이블 개수에서 -1을 한다.
					$('#'+type+'Length').val($('#'+type+'Length').val()*1 - 1);
				}
				
				
				
			} else {
				alert("제품정보는 한개 이상 존재해야 합니다.");
			}			   
		}
		
		function deleteAmount(num) {
			var deleteYearAmount = 0;
			var totalAmount = removeCommas($('#mtBuyTotalAmount').val())*1;
			deleteYearAmount = removeCommas($('#purchaseList-'+num+'-yearTotalAmount').val())*1;
			//전체금액에서 삭제금액을 뺀다.
			$('#mtBuyTotalAmount').val(addCommas(totalAmount-deleteYearAmount));
		}
		
		//등록된 거래처 정보를 선택하면 해당 등록 내역을 가져온다.
		$('#mtSaveOrderAcKey').change(function(){
			var url = '/maintenance/contract/write/purchaseAmountView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":$('#mtIntegrateKey').val(),
					"mtOrderKey":$('#mtSaveOrderAcKey option:selected').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			
		});
		
		//이전화면으로 이동
		function fn_prevBtn(){
			if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수계약 매출정보 등록화면으로 이동하시겠습니까?")) {
				var url = '/maintenance/contract/write/backOrderInfoView.do';
				var dialogId = 'program_layer';
				var varParam = {
						"mtIntegrateKey":$('#mtIntegrateKey').val(),
						"parmMtSbCtYn":"Y"
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			} else {
				return false;
			}
			
		}
		function fn_nextBtn(){
			if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수계약 지급계획정보 등록화면으로 이동하시겠습니까?")) {
				var url = '/maintenance/contract/write/writePaymentPlanView.do';
				var dialogId = 'program_layer';
				var varParam = {
						"mtIntegrateKey":$('#mtIntegrateKey').val(),
						"parmMtSbCtYn":"Y"
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			} else {
				return false;
			}
			
		}
		
		function fn_saveBtn(){
			if(confirm("유지보수계약 매입정보를 저장하시겠습니까?")) {
				//필수값 체크를 완료하면 저장 프로세스 시작.
				if ($("#mtListForm")[0].checkValidity()){
					//필수값 모두 통과하여 저장 프로세스 호출.
					savePurchageAmount();
				} else {
					 $("#mtListForm")[0].reportValidity();	
				}	
			} else {
				return false;
			}
			
		}
		
		function savePurchageAmount(){
			//년도 중복을 체크한다.
			var checkYear = $("#mtListForm").checkDuplicate();
			//console.log("checkYear===>"+checkYear);

			if('' != checkYear) {
				alert(checkYear);
				//$( "#salesList-0-mtSalesYear").focus();
			} else {
				//매출정보를 저장한다.
				var object = {};
				var listObject = new Array();
				var obj = new Object();
	           	var formData = $("#mtBasicForm").serializeArray();
	           	var listData = $("#mtListForm").serializeObject();
	            
	           	for (var i = 0; i<formData.length; i++){
	                
	                object[formData[i]['name']] = formData[i]['value'];
	                            
	            }
	           	//List를 담아준다.			
	            object["mtBuyAmountVOList"]=listData;           	
				
				//object["mtWorkProductVoList" = listObject];
	           	var sendData = JSON.stringify(object);	           	
	           	$.ajax({
		        	url:"/maintenance/contract/write/purchaseAmount.do",
		            dataType: 'text', 
		            type:"post",  
					data: sendData,					
		            traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.		            
		     	   	contentType: "application/json; charset=UTF-8", 
		     	  	beforeSend: function(xhr) {
		        		xhr.setRequestHeader("AJAX", true);	        		
		        	},
		            success:function(data){	
		            	var paramData = JSON.parse(data);	
		            	
		            	if("Y" == paramData.successYN){
		            		if($('#purchaseInitCnt').val() !='0' && $('#purchaseInitCnt').val() !=''){
		            			alert("유지보수계약 매입정보 수정을 성공하였습니다.");
		            		} else {
		            			alert("유지보수계약 매입정보  등록을 성공하였습니다.");
		            			var varParam = {
		            					"mtIntegrateKey":$('#mtIntegrateKey').val(),
		            					"mtOrderKey":paramData.mtOrderKey
		            			}
		            			//유지보수계약 백계약 등록화면으로 이동
			            		var url='/maintenance/contract/write/purchaseAmountView.do';
			            		            			
				    			var dialogId = 'program_layer';
				    			//var varParam = paramData
				    			var button = new Array;
				    			button = [];
				    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		            		}		            		
			            	
		            	} else {
		            		if($('#purchaseInitCnt').val() !='0' && $('#purchaseInitCnt').val() !=''){
		            			alert("유지보수작업 매입정보 수정이 실패하였습니다.");
		            		} else {
		            			alert("유지보수작업 매입정보 등록이 실패하였습니다.");
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
			
		}
		
		
		function fn_calculate(){
			var beforeAmount=0;
			$(".calculate").unbind('blur');
			$(".calculate").blur(function() {
				var amount = removeCommas($(this).val())*1;
				//전체금액 계산
				var totalAmount = removeCommas($('#mtBuyTotalAmount').val())*1;
				$('#mtBuyTotalAmount').val(addCommas((amount-beforeAmount)+totalAmount));
				
				
				//년도별 계산
				var num = $(this).attr('id').split('-')[1];
				var yearTotalAmount = removeCommas($("#purchaseList-"+num+"-yearTotalAmount").val())*1;
				$("#purchaseList-"+num+"-yearTotalAmount").val(addCommas((amount-beforeAmount)+yearTotalAmount));
				//console.log("num=>"+num);
				//console.log("amount11====>"+ amount+"/"+totalAmount+"/"+beforeAmount);			
			});
			
			$(".calculate").focus(function() {
				beforeAmount = removeCommas($(this).val())*1;
			});
			/* $(document).on("focus", ".calculate", function() {
				beforeAmount = removeCommas($(this).val())*1;
				//console.log("beforeAmount====>"+ beforeAmount);
			}); */
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
				<li class="colorWhite cursorP" onclick="fn_changeView('basicInfoView');">기본정보</li>
				<li class="colorWhite cursorP" onclick="fn_changeView('productInfoView');">매출계약정보</li>
				<li class="colorWhite cursorP" onclick="fn_changeView('salesInfoView');">매출정보</li>
				<li class="colorWhite cursorP" onclick="fn_changeView('writeSalesPlanView');">계산서계획정보</li>
				<li class="colorWhite cursorP" onclick="fn_changeView('backOrderInfoView');">백계약정보</li>
				<li class="colorWhite cursorP on">매입정보</li>
				<li class="colorWhite cursorP" onclick="fn_changeView('writePaymentPlanView');">지급계획정보</li>
			</ul>
		</div>
		<form action="/" id="mtBasicForm" name="mtBasicForm" method="post"> 
			<input type="hidden" id="purchaseLength" name="purchaseLength" value="<c:out value="${listCount}"/>" />
			<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${mtIntegrateKey}"/>" />
			<input type="hidden" id="mtOrderKey" name="mtOrderKey" value="<c:out value="${mtOrderKey}"/>" />
			<input type="hidden" id="purchaseInitCnt" name="purchaseInitCnt" value="<c:out value="${purchaseInitCnt}"/>" />
			<input type="hidden" id="deleteListKeys" name="deleteListKeys"  />
			<%-- 			
			<input type="hidden" id="purchaseInitCnt2" name="purchaseInitCnt2" value="<c:out value="${purchaseAmountList.size()}"/>" />
			<c:choose>
				<c:when test="${null == purchaseAmountList.size()}">
					<input type="hidden" id="purchaseInitCnt" name="purchaseInitCnt" value="0" />
				</c:when>
				<c:otherwise>
					<input type="hidden" id="purchaseInitCnt" name="purchaseInitCnt" value="<c:out value="${purchaseAmountList.size()}"/>" />
				</c:otherwise>
			</c:choose> --%>			
			<div class="contents1">
				<div>
					<!-- <div class="subTitle"><label class="ftw400">유지보수 계약정보</label></div> -->
					<table class="subject">
						<tr>		
							<td class="subTitle" style="border-top: none;border: 0px;">
								<label class="ftw400">매입거래처 </label>
								<select id="mtSaveOrderAcKey" name="mtSaveOrderAcKey">																		
									<c:forEach var="order" items="${backOrderSelectBox}" varStatus="status">
											<option value="<c:out value="${order.mtOrderKey}"/>"><c:out value="${order.mtAcNm}"/></option>
									</c:forEach>									
								</select>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<table class="textalignC ftw200" >
						<thead class="ftw400">
							<tr>
								<th scope="row">계약 유지보수기간</th>
								<th scope="row">백계약 유지보수기간</th>
								<th scope="row">백계약 금액</th>
								<th scope="row">결제조건</th>
								<th scope="row">매입 예상금액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" id="mtStartDt" class="pname" style="width:83px;" readonly/> ~ <input type="text" id="mtEndDt" class="pname" style="width:83px;" readonly/></td>
								<td><input type="text" id="mtOrderStartDt" class="pname" style="width:83px;" readonly/> ~ <input type="text" id="mtOrderEndDt" class="pname" style="width:83px;" readonly/></td>
								<td ><input type="text" id="mtOrderAmount" class="pname" style="width:95px;text-align: right" readonly/></td>
								<td ><input type="text" id="mtOrderPayTerms" style="width:180px;text-align: center" class="pname" readonly/></td>
								<td ><input type="text" id="mtBuyTotalAmount" style="width:95px;text-align: right" class="pname" readonly/></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</form>
			<form action="/" id="mtListForm" name="mtListForm" method="post">
			<div class="contents">

				<div id="purchaseWrap">
					<div class="subjectContainer">
						<table class="subject">
							<tr>		
								<td class="subTitle" style="border-top: none;">
									<label class="ftw400">연도별 매입 예상금액</label>
								</td>
								<%-- <td class="subBtn" style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable('purchase');"/></td> --%>
							</tr>
						</table>
					</div>
					<c:choose>
					<c:when test="${purchaseInitCnt eq 0 }">
					<div class="purchaseTable">						
						<table>
							<tr>
								<td class="tdTitle firstTd"><label style="color: red;vertical-align: middle;">*</label> 연도</td>
								<td class="tdContents firstTd">
									<input type="text" id="purchaseList-0-mtBuyYear" name="purchaseList-0-mtBuyYear" style="text-align: center" numberOnly required readonly="readonly" maxlength="4"/>
									<input type="hidden" name="lastNum" value="0" />
									<input type="hidden" id="purchaseList-0-mtBuyKey" name="mtBuyKey"/>
								</td>
								<td class="tdTitle sum"><label>합계</label></td>								
								<td class="tdContents sum" >
									<input type="text" id="purchaseList-0-yearTotalAmount" name="yearTotalAmount" style="width:136px; text-align:right; color: #32bc94; font-size: 15px" class="pname" value="0" readonly/>
								</td>
								<td class="tdTitle"></td><td class="tdContents"></td>
								<td class="tdTitle"></td>	
								<td class="tdEtc" style="text-align:right;">
									<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/><!-- &nbsp;&nbsp;&nbsp; -->
		                        	<%-- <img id="purchaseList-0-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'purchase');" style="width: 11px"/> --%>
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">1월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-0-mtBuyJanAmount" name="mtBuyJanAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">2월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-0-mtBuyFebAmount" name="mtBuyFebAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">3월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-0-mtBuyMarAmount" name="mtBuyMarAmount" amountOnly class="calculate" />	
								</td>	
								<td class="tdTitle">4월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-0-mtBuyAprAmount" name="mtBuyAprAmount" amountOnly class="calculate" />	
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">5월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-0-mtBuyMayAmount" name="mtBuyMayAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">6월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-0-mtBuyJunAmount" name="mtBuyJunAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">7월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-0-mtBuyJulAmount" name="mtBuyJulAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">8월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-0-mtBuyAugAmount" name="mtBuyAugAmount" amountOnly class="calculate" />	
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">9월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-0-mtBuySepAmount" name="mtBuySepAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">10월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-0-mtBuyOctAmount" name="mtBuyOctAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">11월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-0-mtBuyNovAmount" name="mtBuyNovAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">12월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-0-mtBuyDecAmount" name="mtBuyDecAmount" amountOnly class="calculate" />	
								</td>
							</tr>
						</table>
					</div>
					</c:when>
						<c:otherwise>
							<c:forEach var="list" items="${purchaseAmountList}" varStatus="status">
					<div class="purchaseTable">						
						<table>
							<tr>
								<td class="tdTitle firstTd"><label style="color: red;vertical-align: middle;">*</label> 연도</td>
								<td class="tdContents firstTd">
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-mtBuyYear" name="purchaseList-<c:out value="${status.index}"/>-mtBuyYear" style="text-align: center" numberOnly required readonly="readonly" maxlength="4" value="<c:out value="${list.mtBuyYear}"/>"/>
									<input type="hidden" name="lastNum" value="<c:out value="${status.index}"/>" />
									<input type="hidden" id="purchaseList-<c:out value="${status.index}"/>-mtBuyKey" name="mtBuyKey" value="<c:out value="${list.mtBuyKey}"/>"/>
								</td>
								<td class="tdTitle sum"><label>합계</label></td>								
								<td class="tdContents sum" >
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-yearTotalAmount" name="yearTotalAmount" style="width:136px; text-align:right; color: #32bc94; font-size: 15px" class="pname" value="0" readonly/>
								</td>
								<td class="tdTitle"></td><td class="tdContents"></td>
								<td class="tdTitle"></td>								
								<td class="tdEtc" style="text-align:right;">
									<img id="upDown" src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/><!-- &nbsp;&nbsp;&nbsp; -->
		                        	<%-- <img id="purchaseList-<c:out value="${status.index}"/>-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'purchase');" style="width: 11px"/> --%>
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">1월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-mtBuyJanAmount" name="mtBuyJanAmount" amountOnly class="calculate" value="<c:out value="${list.mtBuyJanAmount}"/>"/>	
								</td>
								<td class="tdTitle">2월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-mtBuyFebAmount" name="mtBuyFebAmount" amountOnly class="calculate" value="<c:out value="${list.mtBuyFebAmount}"/>"/>	
								</td>
								<td class="tdTitle">3월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-mtBuyMarAmount" name="mtBuyMarAmount" amountOnly class="calculate" value="<c:out value="${list.mtBuyMarAmount}"/>"/>	
								</td>	
								<td class="tdTitle">4월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-mtBuyAprAmount" name="mtBuyAprAmount" amountOnly class="calculate" value="<c:out value="${list.mtBuyAprAmount}"/>"/>	
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">5월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-mtBuyMayAmount" name="mtBuyMayAmount" amountOnly class="calculate" value="<c:out value="${list.mtBuyMayAmount}"/>"/>	
								</td>
								<td class="tdTitle">6월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-mtBuyJunAmount" name="mtBuyJunAmount" amountOnly class="calculate" value="<c:out value="${list.mtBuyJunAmount}"/>"/>	
								</td>
								<td class="tdTitle">7월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-mtBuyJulAmount" name="mtBuyJulAmount" amountOnly class="calculate" value="<c:out value="${list.mtBuyJulAmount}"/>"/>	
								</td>
								<td class="tdTitle">8월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-mtBuyAugAmount" name="mtBuyAugAmount" amountOnly class="calculate" value="<c:out value="${list.mtBuyAugAmount}"/>"/>	
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">9월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-mtBuySepAmount" name="mtBuySepAmount" amountOnly class="calculate" value="<c:out value="${list.mtBuySepAmount}"/>"/>	
								</td>
								<td class="tdTitle">10월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-mtBuyOctAmount" name="mtBuyOctAmount" amountOnly class="calculate" value="<c:out value="${list.mtBuyOctAmount}"/>"/>	
								</td>
								<td class="tdTitle">11월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-mtBuyNovAmount" name="mtBuyNovAmount" amountOnly class="calculate" value="<c:out value="${list.mtBuyNovAmount}"/>"/>	
								</td>
								<td class="tdTitle">12월</td>
								<td class="tdContents">
									<input type="text" id="purchaseList-<c:out value="${status.index}"/>-mtBuyDecAmount" name="mtBuyDecAmount" amountOnly class="calculate" value="<c:out value="${list.mtBuyDecAmount}"/>"/>	
								</td>
							</tr>
						</table>
					</div>					
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
				</div>
				<div class="btnWrap floatL">
					<div class="floatL">
						<button type="button" onclick="fn_prevBtn();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					</div>
					<div class="floatL btnCenter">
						<button type="button" onclick="fn_saveBtn();"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>				
					<div class="floatR" >
						<button type="button" onclick="fn_nextBtn();"><img src="<c:url value='/images/btn_next.png'/>"/></button>
					</div>		
					<div class="floatN floatC"></div>
				</div>
			</div>		
		</form>
	</div>
</body>
</html>