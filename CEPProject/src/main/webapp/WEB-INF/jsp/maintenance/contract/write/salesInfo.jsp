<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="<c:url value='/js/common.js'/>"></script>
	<title>유지보수계약 매출정보 등록</title>
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
			/* height: 449px; */
			/* top: 259px; */
			height: 488px;
			top: 220px;
			left: 201px;			
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto;
		}
		.popContainer .contents > div {
			margin: 10px 47px 0 37px;
			overflow-y: auto;			
			width: 863px;
		}
		.popContainer .contents .subject {
			width: 863px;
			border-bottom: 2px solid #e5e5e5;
			padding-bottom: 9px;
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
			margin-bottom: 3px;
		}
		.popContainer .contents select.wdts {
			width: 135px;
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
		.popContainer .contents1 select{
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
		.popContainer .contents2 input[class="numberTy"] {
			width: 27px;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 130px;
		}
		.popContainer .contents td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer .salesTable table {
			box-sizing: border-box;
			border-bottom: 2px solid #e5e5e5;
			padding-bottom: 5px;
			margin-top: 5px;
			table-layout: fixed;
			width: 100%;
		}
		.popContainer td.tdTitle {
			/* box-sizing: border-box; */
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
		}
		.popContainer .contents1 table tbody tr {
			display: table;
			width: calc(100% - 5px);
			/* cursor: pointer; */
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
			margin-top: 9px;
			margin-left: 38px;
			border-collapse: collapse;
			overflow: hidden;
		}
		.popContainer .contents1 table thead{			
			font-size: 15px;
		}
		.popContainer .contents1 table tbody{			
			font-size: 14px;
		}
		/* .popContainer .contents1 table tbody {
			width: 1067px;
			//height: 200px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		} */
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
			width: 207px;
			border: 1px solid #edebef;
		}	
		.contents1 table thead th:nth-child(2),
		.contents1 table tbody td:nth-child(2) {
			width: 204px;
		}
		.contents1 table thead th:nth-child(3),
		.contents1 table tbody td:nth-child(3),
		.contents1 table thead th:nth-child(4),
		.contents1 table tbody td:nth-child(4),
		.contents1 table thead th:nth-child(5),
		.contents1 table tbody td:nth-child(5) {
			width: 149px;
		}
		
		.popContainer input[class="pname"] {
			width: 85px;
			border : none;
			outline: none;
			padding : 0px;
			background-color: #f6f7fc;
		}
		.calculate {
			text-align: right !important;
		}	
		.popContainer .contents .btnWrap {
			margin : 33px 36px 15px 38px;
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
			'<c:if test="${listCount > 2 }">'
			fn_viewSummaryUpAll();
			'</c:if>'
			//지원담당자정보 셋팅
			//$('#salesList-0-mtSalesYear').val("${nowYear}").attr("selected", "true");
			//console.log("${nowYear}");
	
			//$('#mtStartDt').val("${contractAmountInfo.mtStartDt}".replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3'));
			//$('#mtEndDt').val("${contractAmountInfo.mtEndDt}}".replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3'));
			//$('#mtPmStartDt').val("${contractAmountInfo.mtPmStartDt}".replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3'));
			//$('#mtPmEndDt').val("${contractAmountInfo.mtPmEndDt}".replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3'));
			$('#mtStartDt').val(addDateMinus("${contractAmountInfo.mtStartDt}"));
			$('#mtEndDt').val(addDateMinus("${contractAmountInfo.mtEndDt}"));
			$('#mtPmStartDt').val(addDateMinus("${contractAmountInfo.mtPmStartDt}"));
			$('#mtPmEndDt').val(addDateMinus("${contractAmountInfo.mtPmEndDt}"));
			$('#mtAmount').val(addCommas("${contractAmountInfo.mtAmount}"));
			$('#mtPmTotalAmount').val(addCommas("${contractAmountInfo.mtPmTotalAmount}"));			
		
			$('#mtSaveOrderAcKey').val("${mtSalesOrderKey}").attr("selected", "true");
			
			fn_calculate();
		});
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
							
							if('mtSalesYear' == this.name.split('-')[2]){
								//년도에서 alesList-0-mtSalesYear ==> mtSalesYear 로 넣어줌.
								obj[this.name.split('-')[2]] = this.value;
							}else if('yearTotalAmount' == this.name){
								
							} else {
								//숫자필드에서 컴마를 제거한다.
								obj[this.name] = removeCommas(this.value); 
							}
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('mtSalesDecAmount' == this.name){
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
								if('mtSalesYear' == this.name.split('-')[2]){	
									if(Object.keys(obj).includes(this.value)){
										dupYear =  this.value+"년도 매출정보가 중복되었습니다. 확인 후 다시 등록하세요!!";
										$( "#"+this.name ).focus();
										return dupYear;
									} else if(''==this.value) {
										dupYear ="연도가 빈값이 존재합니다. 확인 후 다시 등록하세요!!";
										$( "#"+this.name ).focus();
										return dupYear; 
									} else if(4 != this.value.length) {
										dupYear =this.value+"은 년도가 아닙니다. 연도는 4자리로 입력하세요!!";
										$( "#"+this.name ).focus();
										return dupYear;
									} else {
										obj[this.value] = this.value; 
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
					if(confirm("유지보수계약 제품정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/contract/write/'+varUrl+'.do';
					} else {
						return false;
					}
					
				} else if(varUrl == "salesInfoView"){					
					if("${mtContractCountInfo.mtProductCnt}" > 0){
						if(confirm("유지보수계약 매출정보 화면으로 이동하시겠습니까?")){
							url = '/maintenance/contract/write/'+varUrl+'.do';
						} else {
							return false;
						}
					} else {
						alert(" 유지보수계약 제품정보가 등록되지 않았습니다.\n 유지보수계약 제품정보를 먼저 등록하세요.");
						return false;
					}					
					
				} else if(varUrl == "writeSalesPlanView"){					
					if("${mtContractCountInfo.mtProductCnt}" > 0){
						if(confirm("유지보수계약 계산서계획정보 화면으로 이동하시겠습니까?")){
							url = '/maintenance/contract/write/'+varUrl+'.do';
						} else {
							return false;
						}
					} else {
						alert(" 유지보수계약 제품정보가 등록되지 않았습니다.\n 유지보수계약 제품정보를 먼저 등록하세요.");
						return false;
					}					
					
				} else if(varUrl == "backOrderInfoView"){
					if("${parmMtSbCtYn}" == "Y"){
						
						if("${mtContractCountInfo.mtSalesAmountCnt}" > 0){
							if(confirm("유지보수계약 백계약정보 화면으로 이동하시겠습니까?")){
								url = '/maintenance/contract/write/'+varUrl+'.do';
							} else {
								return false;
							}
						} else {
							alert(" 유지보수계약 매출정보가 등록되지 않았습니다.\n 유지보수계약 매출정보를 먼저 등록하세요.");
							return false;
						}						
					} else {
						alert(" 백계약 정보가 N으로 설정되었습니다.\n 기본정보에서 백계약정보를 Y로 변경 후 백계약정보를 등록하세요.");
						return false;
					}					
					
				} else if(varUrl == "purchaseAmountView"){					
					if("${parmMtSbCtYn}" == "Y"){
						if("${mtContractCountInfo.mtBackOrderCnt}" > 0){
							if(confirm("유지보수계약 매입정보 화면으로 이동하시겠습니까?")){
								url = '/maintenance/contract/write/'+varUrl+'.do';
							} else {
								return false;
							}
						} else {
							alert(" 유지보수계약 백계약정보가 등록되지 않았습니다.\n 유지보수계약 백계약정보를 먼저 등록하세요.");
							return false;
						}						
					} else {
						alert(" 백계약 정보가 N으로 설정되었습니다.\n 기본정보에서 백계약정보를 Y로 변경 후 백계약정보를 먼저 등록하세요.");
						return false;
					}
				} else if(varUrl == "writePaymentPlanView"){
					if("${parmMtSbCtYn}" == "Y"){
						if("${mtContractCountInfo.mtBackOrderCnt}" > 0){
							if(confirm("유지보수계약 지급계획정보 화면으로 이동하시겠습니까?")){
								url = '/maintenance/contract/write/'+varUrl+'.do';
							} else {
								return false;
							}
						} else {
							alert(" 유지보수계약 백계약정보가 등록되지 않았습니다.\n 유지보수계약 백계약정보를 먼저 등록하세요.");
							return false;
						}						
					} else {
						alert(" 백계약 정보가 N으로 설정되었습니다.\n 기본정보에서 백계약정보를 Y로 변경 후 백계약정보를 먼저 등록하세요.");
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
					"parmMtSbCtYn":$('#parmMtSbCtYn').val()
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			} else {

				return false;
			}			
		} //end fn_changeView()
		

		
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
	    		//mtSalesYear(년도)값만 해당 되어  조건을 넣음.
	    		var splitName = nameArr[i].split('-')[2];
	    		if('mtSalesYear' == splitName){
	    			clone.find('input[name="'+ type + 'List-' + lastNum + '-' + splitName+'"]').val("");
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
		
		/* 제품정보 삭제
		* 업데이트 시 제품정보 제품정보 삭제 목록에 대해 수집한다.  
		* deleteObj에 삭제 년도를 넣어준다.
		*/
		
		function fn_delete(obj, type) {
			var deleteKey;
			var deleteYear;
			var table = obj.parentNode.parentNode.parentNode.parentNode.parentNode;			
			var selectNum = JSON.stringify($(obj.id).selector);
			
			var originLength = $('#'+type+'Length').val()*1;
			if(originLength>1){
				deleteYear = $('#salesList-'+selectNum.split('-')[1]+'-mtSalesYear').val();
				
				if(confirm(deleteYear+" 년도 매출정보를 삭제하시겠습니까?")) {
					/*
					* 전체금액에서 삭제된 테이블 금액을 뺀다.
					* 삭제테이블의 연도를 수집한다.
					*/
					deleteAmount(selectNum.split('-')[1]);
					
					// 삭제한 년도를 수집한다.
					//삭제 key
					deleteKey = $('#salesList-'+selectNum.split('-')[1]+'-mtSalesKey').val();
					//삭제key list를 만든다.
					if(deleteKey !=''){
						$('#deleteListKeys').val($('#deleteListKeys').val()+deleteKey+":");
					}
									
					//선택한  테이블을 삭제한다.
					table.remove();
					$('#'+type+'Length').val($('#'+type+'Length').val()*1 - 1);
				}				
			} else {
				alert("제품정보는 한개 이상 존재해야 합니다.");
			}			   
		}
		
		//var deleteObj = [];
		function deleteAmount(num) {
			var deleteYearAmount = 0;
			var totalAmount = removeCommas($('#mtSaleTotalAmount').val())*1;
			//console.log("selector num=========>"+num);
			/* deleteYearAmount =  removeCommas($('#salesList-'+num+'-mtSalesJanAmount').val())*1 
			+  removeCommas($('#salesList-'+num+'-mtSalesFebAmount').val())*1
			+  removeCommas($('#salesList-'+num+'-mtSalesMarAmount').val())*1
			+  removeCommas($('#salesList-'+num+'-mtSalesAprAmount').val())*1
			+  removeCommas($('#salesList-'+num+'-mtSalesMayAmount').val())*1
			+  removeCommas($('#salesList-'+num+'-mtSalesJunAmount').val())*1
			+  removeCommas($('#salesList-'+num+'-mtSalesJulAmount').val())*1
			+  removeCommas($('#salesList-'+num+'-mtSalesAugAmount').val())*1
			+  removeCommas($('#salesList-'+num+'-mtSalesSepAmount').val())*1
			+  removeCommas($('#salesList-'+num+'-mtSalesOctAmount').val())*1
			+  removeCommas($('#salesList-'+num+'-mtSalesNovAmount').val())*1
			+  removeCommas($('#salesList-'+num+'-mtSalesDecAmount').val())*1; */
			
			/* console.log("deleteYearAmount1=====>"+($('#salesList-'+num+'-mtSalesJanAmount').val()) );
			console.log("deleteYearAmount2=====>"+$('#salesList-'+num+'-mtSalesFebAmount').val());
			console.log("deleteYearAmount3=====>"+$('#salesList-'+num+'-mtSalesMarAmount').val());
			console.log("deleteYearAmount4=====>"+$('#salesList-'+num+'-mtSalesAprAmount').val());
			console.log("deleteYearAmount5=====>"+$('#salesList-'+num+'-mtSalesMayAmount').val());
			console.log("deleteYearAmount6=====>"+$('#salesList-'+num+'-mtSalesJunAmount').val());
			console.log("deleteYearAmount7=====>"+$('#salesList-'+num+'-mtSalesJulAmount').val());
			console.log("deleteYearAmount8=====>"+$('#salesList-'+num+'-mtSalesAugAmount').val());
			console.log("deleteYearAmount9=====>"+$('#salesList-'+num+'-mtSalesSepAmount').val());
			console.log("deleteYearAmount10=====>"+$('#salesList-'+num+'-mtSalesOctAmount').val());
			console.log("deleteYearAmount11=====>"+$('#salesList-'+num+'-mtSalesNovAmount').val());
			console.log("deleteYearAmount12=====>"+$('#salesList-'+num+'-mtSalesDecAmount').val());
			*/
			//console.log("deleteYearAmount=====>"+deleteYearAmount); 
			//console.log("yearTotalAmount====>"+removeCommas($('#salesList-'+num+'-yearTotalAmount').val())*1)
			deleteYearAmount = removeCommas($('#salesList-'+num+'-yearTotalAmount').val())*1;
			//전체금액에서 삭제금액을 뺀다.
			$('#mtSaleTotalAmount').val(addCommas(totalAmount-deleteYearAmount));
		}
		
		//이전화면으로 이동
		function fn_prevBtn(){
			if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수계약 제품정보 등록화면으로 이동하시겠습니까?")) {
				var url = '/maintenance/contract/write/productInfoView.do';
				var dialogId = 'program_layer';
				var varParam = {
						"mtIntegrateKey":$('#mtIntegrateKey').val(),
						"parmMtSbCtYn":$('#parmMtSbCtYn').val()
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			} else {
				return false;
			}
			
		}
		//다음화면으로 이동
		function fn_nextBtn(){
			if("${parmMtSbCtYn}" == "Y"){
				if("${mtContractCountInfo.mtSalesAmountCnt}" > 0){
					if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수계약 계산서계획정보 등록화면으로 이동하시겠습니까?")) {
						var url = '/maintenance/contract/write/writeSalesPlanView.do';
						var dialogId = 'program_layer';
						var varParam = {
								"mtIntegrateKey":$('#mtIntegrateKey').val(),
								"parmMtSbCtYn":$('#parmMtSbCtYn').val()
						}
						var button = new Array;
						button = [];
						showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
					} else {
						return false;
					}
				} else {
					alert(" 유지보수계약 매출정보가 등록되지 않았습니다.\n 유지보수계약 매출정보를 먼저 등록하세요.");
					return false;
				}
			} else {
				alert(" 백계약 정보가 N으로 설정되었습니다.\n 기본정보에서 백계약정보를 Y로 변경 후 백계약정보를 등록하세요.");
				return false;
			}	
			
		}
		
		
		function fn_saveBtn(){
			//년도 중복을 체크한다.
			var checkYear = $("#mtListForm").checkDuplicate();
			var actionTitle;
			var confirmTitle;
			//console.log("checkYear===========>"+checkYear);
			if('' != checkYear) {
				alert(checkYear);
			} else {
				if($('#rowNum').val()*1 >0){
					actionTitle = "수정";					
				} else {
					actionTitle = "저장";
				}
				//매출금액과 총계약금액이 다른경우 경고 문구 추가.
				if($('#mtSaleTotalAmount').val() ==$('#mtAmount').val()){
					confirmTitle = "유지보수계약 매출정보를  "+actionTitle+"하시겠습니까?";
				} else {
					confirmTitle = "총계약금액("+$('#mtAmount').val()+")과 매출총금액("+$('#mtSaleTotalAmount').val()+")이 다릅니다. \n유지보수계약 매출정보를  "+actionTitle+"하시겠습니까?";
				}
				if(confirm(confirmTitle)) {
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
		            object["mtSalesAmountVOList"]=listData;           	
					
					//object["mtWorkProductVoList" = listObject];
		           	var sendData = JSON.stringify(object);
		           	        	
		           	$.ajax({
			        	url:"/maintenance/contract/write/salesInfo.do",
			            dataType: 'text', 
			            type:"post",  
						data: sendData,
						
			            traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.
			            
			     	   	contentType: "application/json; charset=UTF-8", 
			     	  	beforeSend: function(xhr) {
			     	  		//console.log("sendData=====>"+sendData);  
			        		xhr.setRequestHeader("AJAX", true);	        		
			        	},
			            success:function(data){	
			            	var paramData = JSON.parse(data);
			            	//console.log("paramData==>"+paramData);
			            	
			            	if("Y" == paramData.successYN){
			            		     		
			            		alert("유지보수계약 매출정보  "+actionTitle+"을 성공하였습니다.");
			            		//유지보수계약 백계약 등록화면으로 이동
			            		var url='/maintenance/contract/write/salesInfoView.do';
			            		            			
				    			var dialogId = 'program_layer';
				    			var varParam = paramData
				    			var button = new Array;
				    			button = [];
				    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
				            	
			            	} else {
			            		alert("유지보수작업 제품등록이 실패하였습니다.");
			            	}
			            	
			            	
			            },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
			        }
		           	 
		           	);
				} else {
					return false;
				}
				
			}
			
		}
		
		
		function fn_calculate(){
			var beforeAmount=0;
			$(".calculate").unbind('blur');
			$(".calculate").blur(function() {
				var amount = removeCommas($(this).val())*1;
				//전체금액 계산
				var totalAmount = removeCommas($('#mtSaleTotalAmount').val())*1;
				$('#mtSaleTotalAmount').val(addCommas((amount-beforeAmount)+totalAmount));
				
				
				//년도별 계산
				var num = $(this).attr('id').split('-')[1];
				var yearTotalAmount = removeCommas($("#salesList-"+num+"-yearTotalAmount").val())*1;
				$("#salesList-"+num+"-yearTotalAmount").val(addCommas((amount-beforeAmount)+yearTotalAmount));
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
		/* function fn_calculate(obj){
			var beforeAmount=0;
			var amount = removeCommas($(this).val())*1;
			//전체금액 계산
			var totalAmount = removeCommas($('#mtSaleTotalAmount').val())*1;
			$('#mtSaleTotalAmount').val(addCommas((amount-beforeAmount)+totalAmount));
			
			
			//년도별 계산
			var num = $(this).attr('id').split('-')[1];
			var yearTotalAmount = removeCommas($("#salesList-"+num+"-yearTotalAmount").val())*1;
			$("#salesList-"+num+"-yearTotalAmount").val(addCommas((amount-beforeAmount)+yearTotalAmount));
			
			$(".calculate").blur(function(){});
			
			var beforeAmount=0;
			$(".calculate").blur(function() {
				var amount = removeCommas($(this).val())*1;
				//전체금액 계산
				var totalAmount = removeCommas($('#mtSaleTotalAmount').val())*1;
				$('#mtSaleTotalAmount').val(addCommas((amount-beforeAmount)+totalAmount));
				
				
				//년도별 계산
				var num = $(this).attr('id').split('-')[1];
				var yearTotalAmount = removeCommas($("#salesList-"+num+"-yearTotalAmount").val())*1;
				$("#salesList-"+num+"-yearTotalAmount").val(addCommas((amount-beforeAmount)+yearTotalAmount));
				//console.log("num=>"+num);
				//console.log("amount11====>"+ amount+"/"+totalAmount+"/"+beforeAmount);			
			});
			
			$(document).on("focus", ".calculate", function() {
				beforeAmount = removeCommas($(this).val())*1;
				//console.log("beforeAmount====>"+ beforeAmount);
			});
		} */
		
		//등록된 거래처 정보를 선택하면 해당 등록 내역을 가져온다.
		$('#mtSaveOrderAcKey').change(function(){
			var url = '/maintenance/contract/write/salesInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":$('#mtIntegrateKey').val(),
					"mtSalesOrderKey":$('#mtSaveOrderAcKey option:selected').val(),
					"parmMtSbCtYn":$('#parmMtSbCtYn').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			
		});
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
					<li class="colorWhite cursorP" onclick="fn_changeView('productInfoView');">제품정보</li>
					<li class="colorWhite cursorP on">매출정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('writeSalesPlanView');">계산서계획정보</li>
					<c:if test="${parmMtSbCtYn eq 'Y' }">		
					<li class="colorWhite cursorP" onclick="fn_changeView('backOrderInfoView');">백계약정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('purchaseAmountView');">매입정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('writePaymentPlanView');">지급계획정보</li>
					</c:if>
			</ul>
		</div>
		<form action="/" id="mtBasicForm" name="mtBasicForm" method="post"> 
		<c:choose>
			<c:when test="${listCount > 0}">
			<input type="hidden" id="salesLength" name="salesLength" value="<c:out value="${listCount}"/>" />
			</c:when>
			<c:otherwise> 
			<input type="hidden" id="salesLength" name="salesLength" value="1" />
			</c:otherwise>
		</c:choose>
			<!-- <input type="hidden" id="salesLength" name="salesLength" value="1" />
			<input type="hidden" id="updateYn" name="updateYn" value="<c:out value="${updateYn}"/>" /> -->
			<input type="hidden" id="parmMtSbCtYn" name="parmMtSbCtYn" value="<c:out value="${parmMtSbCtYn}"/>" />
			<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${mtIntegrateKey}"/>" />
			<input type="hidden" id="mtSalesOrderKey" name="mtSalesOrderKey" value="<c:out value="${mtSalesOrderKey}"/>" />
			<input type="hidden" id="rowNum" name="rowNum" value="<c:out value="${listCount}"/>" />
			<input type="hidden" id="deleteListKeys" name="deleteListKeys"  />
			<div class="contents1">
				<div>
					<!-- <div class="subTitle"><label class="ftw400">유지보수 계약정보</label></div> -->
					<table class="subject">
						<tr>		
							<td class="subTitle" style="border-top: none;border: 0px;">
								<label class="ftw400">유지보수 계약정보</label>
								<select id="mtSaveOrderAcKey" name="mtSaveOrderAcKey">																		
									<c:forEach var="order" items="${salesOrderSelectBox}" varStatus="status">
											<option value="<c:out value="${order.mtSalesOrderKey}"/>"><c:out value="${order.mtAcNm}"/></option>
									</c:forEach>									
								</select>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<table class="textalignC ftw200" >
						<tr>
							<td>유지보수기간 : <input type="text" id="mtStartDt" class="pname" readonly/> ~ <input type="text" id="mtEndDt" class="pname" readonly/></td>
							<td>총계약금액 : <input type="text" id="mtAmount" class="pname" style="width:120px;text-align: right" readonly/></td>
						</tr>
						<%-- <thead class="ftw400">
							<tr>
								<th scope="row">계약 유지보수기간</th>
								<!-- <th scope="row">제품 유지보수기간</th> -->
								<th scope="row">계약 금액</th>
								<!-- <th scope="row">제품 금액</th> -->
								<!-- <th scope="row">매출 금액</th> -->
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" id="mtStartDt" class="pname" readonly/> ~ <input type="text" id="mtEndDt" class="pname" readonly/></td>
								<!-- <td><input type="text" id="mtPmStartDt" class="pname" readonly/> ~ <input type="text" id="mtPmEndDt" class="pname" readonly/></td> -->
								<td ><input type="text" id="mtAmount" class="pname" style="width:120px;text-align: right" readonly/></td>
								<!-- <td ><input type="text" id="mtPmTotalAmount" style="width:120px;text-align: right" class="pname" readonly/></td> -->
								<td ><input type="text" id="mtSaleTotalAmount" style="width:120px;text-align: right" class="pname" value="<c:out value="${displayUtil.commaStr(mtSalesTotalAmount)}"/>" readonly/></td>
							</tr>
						</tbody> --%>
					</table>
				</div>
			</div>
			</form>
			<form action="/" id="mtListForm" name="mtListForm" method="post">
			<div class="contents">
				<div id="salesWrap">
					<div class="subjectContainer">
						<table class="subject">
							<tr>		
								<td class="subTitle" style="border-top: none;">
									<label class="ftw400">연도별 매출</label>
								</td>
								<td style="width:136px; text-align:right; color: #32bc94; font-size: 15px">
									매출 총금액 : 
									<input type="text" id="mtSaleTotalAmount" style="width:120px;text-align: right" class="pname" value="<c:out value="${displayUtil.commaStr(mtSalesTotalAmount)}"/>" readonly/>
								</td>
								<%-- <td class="subBtn" style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable('sales');"/></td> --%>
							</tr>
						</table>
					</div>
					<c:choose>
						<c:when test="${listCount == 0}">
					<div class="salesTable">						
						<table>
							<tr>
								<td class="tdTitle firstTd"><label style="color: red;vertical-align: middle;">*</label>연도</td>
								<td class="tdContents firstTd">
									<input type="text" id="salesList-0-mtSalesYear" name="salesList-0-mtSalesYear" style="text-align: center" numberOnly maxlength="4" readonly="readonly"/>
									<input type="hidden" name="lastNum" value="0" />
									<input type="hidden" id="salesList-0-mtSalesKey" name="mtSalesKey"/>
								</td>
								<td class="tdTitle sum"><label>합계</label></td>								
								<td class="tdContents sum" >
									<input type="text" id="salesList-0-yearTotalAmount" name="yearTotalAmount" style="width:136px; text-align:right; color: #32bc94; font-size: 15px" class="pname" value="0" readonly/>
								</td>
								<td class="tdTitle"></td><td class="tdContents"></td>
								<td class="tdTitle"></td>	
								<td class="tdEtc" style="text-align:right;">
									<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/><!-- &nbsp;&nbsp;&nbsp; -->
		                        	<%-- <img id="salesList-0-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'sales');" style="width: 11px"/> --%>
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">1월</td>
								<td class="tdContents">
									<input type="text" id="salesList-0-mtSalesJanAmount" name="mtSalesJanAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">2월</td>
								<td class="tdContents">
									<input type="text" id="salesList-0-mtSalesFebAmount" name="mtSalesFebAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">3월</td>
								<td class="tdContents">
									<input type="text" id="salesList-0-mtSalesMarAmount" name="mtSalesMarAmount" amountOnly class="calculate" />	
								</td>	
								<td class="tdTitle">4월</td>
								<td class="tdContents">
									<input type="text" id="salesList-0-mtSalesAprAmount" name="mtSalesAprAmount" amountOnly class="calculate" />	
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">5월</td>
								<td class="tdContents">
									<input type="text" id="salesList-0-mtSalesMayAmount" name="mtSalesMayAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">6월</td>
								<td class="tdContents">
									<input type="text" id="salesList-0-mtSalesJunAmount" name="mtSalesJunAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">7월</td>
								<td class="tdContents">
									<input type="text" id="salesList-0-mtSalesJulAmount" name="mtSalesJulAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">8월</td>
								<td class="tdContents">
									<input type="text" id="salesList-0-mtSalesAugAmount" name="mtSalesAugAmount" amountOnly class="calculate" />	
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">9월</td>
								<td class="tdContents">
									<input type="text" id="salesList-0-mtSalesSepAmount" name="mtSalesSepAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">10월</td>
								<td class="tdContents">
									<input type="text" id="salesList-0-mtSalesOctAmount" name="mtSalesOctAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">11월</td>
								<td class="tdContents">
									<input type="text" id="salesList-0-mtSalesNovAmount" name="mtSalesNovAmount" amountOnly class="calculate" />	
								</td>
								<td class="tdTitle">12월</td>
								<td class="tdContents">
									<input type="text" id="salesList-0-mtSalesDecAmount" name="mtSalesDecAmount" amountOnly class="calculate" />	
								</td>
							</tr>
						</table>
					</div>	
						</c:when>
						<c:otherwise>
						<c:forEach var="list" items="${mtSalesAmountList}" varStatus="status">
					<div class="salesTable">						
						<table>
							<tr>
								<td class="tdTitle firstTd"><label style="color: red;vertical-align: middle;">*</label> 연도</td>
								<td class="tdContents firstTd">
									<input type="text" id="salesList-<c:out value="${status.index}"/>-mtSalesYear" name="salesList-<c:out value="${status.index}"/>-mtSalesYear" value="<c:out value="${list.mtSalesYear}"/>" style="text-align: center" numberOnly maxlength="4" readonly="readonly"/>
									<input type="hidden" name="lastNum" value="<c:out value="${status.index}"/>" />
									<input type="hidden" id="salesList-<c:out value="${status.index}"/>-mtSalesKey" name="mtSalesKey" value="<c:out value="${list.mtSalesKey}"/>" />
								</td>
								<td class="tdTitle sum"><label>합계</label></td>								
								<td class="tdContents sum" >
									<input type="text" id="salesList-<c:out value="${status.index}"/>-yearTotalAmount" name="yearTotalAmount" 
									style="width:136px; text-align:right; color: #32bc94; font-size: 15px" class="pname" 
									value="<c:out value="${displayUtil.makeAddNumber(list.mtSalesJanAmount, list.mtSalesFebAmount, list.mtSalesMarAmount, list.mtSalesAprAmount, list.mtSalesMayAmount, list.mtSalesJunAmount, list.mtSalesJulAmount, list.mtSalesAugAmount, list.mtSalesSepAmount, list.mtSalesOctAmount, list.mtSalesNovAmount, list.mtSalesDecAmount)}"/>" readonly/>
								</td>
								<td class="tdTitle"></td><td class="tdContents"></td>
								<td class="tdTitle"></td>								
								<td class="tdEtc" style="text-align:right;">
									<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/><!-- &nbsp;&nbsp;&nbsp; -->
		                        	<%-- <img id="salesList-<c:out value="${status.index}"/>-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'sales');" style="width: 11px"/> --%>
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">1월</td>
								<td class="tdContents">
									<input type="text" id="salesList-<c:out value="${status.index}"/>-mtSalesJanAmount" name="mtSalesJanAmount" value="<c:out value="${displayUtil.commaStr(list.mtSalesJanAmount)}"/>" amountOnly <c:if test="${list.mtSalesJanCallYn == 'N' }">class="calculate"</c:if>  <c:if test="${list.mtSalesJanCallYn != 'N' }">class="pname" style="width: 133px;text-align: right;" readOnly</c:if> />	
									<input type="hidden" id="salesList-<c:out value="${status.index}"/>-mtSalesJanCallYn" name="mtSalesJanCallYn" value="<c:out value="${list.mtSalesJanCallYn}"/>"  />
								</td>
								<td class="tdTitle">2월</td>
								<td class="tdContents">
									<input type="text" id="salesList-<c:out value="${status.index}"/>-mtSalesFebAmount" name="mtSalesFebAmount" value="<c:out value="${displayUtil.commaStr(list.mtSalesFebAmount)}"/>" amountOnly <c:if test="${list.mtSalesFebCallYn == 'N' }">class="calculate"</c:if>  <c:if test="${list.mtSalesFebCallYn != 'N' }">class="pname" style="width: 133px;text-align: right;" readOnly</c:if> />	
									<input type="hidden" id="salesList-<c:out value="${status.index}"/>-mtSalesFebCallYn" name="mtSalesFebCallYn" value="<c:out value="${list.mtSalesFebCallYn}"/>"  />
								</td>
								<td class="tdTitle">3월</td>
								<td class="tdContents">
									<input type="text" id="salesList-<c:out value="${status.index}"/>-mtSalesMarAmount" name="mtSalesMarAmount" value="<c:out value="${displayUtil.commaStr(list.mtSalesMarAmount)}"/>" amountOnly <c:if test="${list.mtSalesMarCallYn == 'N' }">class="calculate"</c:if>  <c:if test="${list.mtSalesMarCallYn != 'N' }">class="pname" style="width: 133px;text-align: right;" readOnly</c:if> />	
									<input type="hidden" id="salesList-<c:out value="${status.index}"/>-mtSalesMarCallYn" name="mtSalesMarCallYn" value="<c:out value="${list.mtSalesMarCallYn}"/>"  />
								</td>	
								<td class="tdTitle">4월</td>
								<td class="tdContents">
									<input type="text" id="salesList-<c:out value="${status.index}"/>-mtSalesAprAmount" name="mtSalesAprAmount" value="<c:out value="${displayUtil.commaStr(list.mtSalesAprAmount)}"/>" amountOnly <c:if test="${list.mtSalesAprCallYn == 'N' }">class="calculate"</c:if>  <c:if test="${list.mtSalesAprCallYn != 'N' }">class="pname" style="width: 133px;text-align: right;" readOnly</c:if> />	
									<input type="hidden" id="salesList-<c:out value="${status.index}"/>-mtSalesAprCallYn" name="mtSalesAprCallYn" value="<c:out value="${list.mtSalesAprCallYn}"/>"  />
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">5월</td>
								<td class="tdContents">
									<input type="text" id="salesList-<c:out value="${status.index}"/>-mtSalesMayAmount" name="mtSalesMayAmount" value="<c:out value="${displayUtil.commaStr(list.mtSalesMayAmount)}"/>" amountOnly <c:if test="${list.mtSalesMayCallYn == 'N' }">class="calculate"</c:if>  <c:if test="${list.mtSalesMayCallYn != 'N' }">class="pname" style="width: 133px;text-align: right;" readOnly</c:if> />	
									<input type="hidden" id="salesList-<c:out value="${status.index}"/>-mtSalesMayCallYn" name="mtSalesMayCallYn" value="<c:out value="${list.mtSalesMayCallYn}"/>"  />
								</td>
								<td class="tdTitle">6월</td>
								<td class="tdContents">
									<input type="text" id="salesList-<c:out value="${status.index}"/>-mtSalesJunAmount" name="mtSalesJunAmount" value="<c:out value="${displayUtil.commaStr(list.mtSalesJunAmount)}"/>" amountOnly <c:if test="${list.mtSalesJunCallYn == 'N' }">class="calculate"</c:if>  <c:if test="${list.mtSalesJunCallYn != 'N' }">class="pname" style="width: 133px;text-align: right;" readOnly</c:if> />	
									<input type="hidden" id="salesList-<c:out value="${status.index}"/>-mtSalesJunCallYn" name="mtSalesJunCallYn" value="<c:out value="${list.mtSalesJunCallYn }"/>"  />
								</td>
								<td class="tdTitle">7월</td>
								<td class="tdContents">
									<input type="text" id="salesList-<c:out value="${status.index}"/>-mtSalesJulAmount" name="mtSalesJulAmount" value="<c:out value="${displayUtil.commaStr(list.mtSalesJulAmount)}"/>" amountOnly <c:if test="${list.mtSalesJulCallYn == 'N' }">class="calculate"</c:if>  <c:if test="${list.mtSalesJulCallYn != 'N' }">class="pname" style="width: 133px;text-align: right;" readOnly</c:if> />	
									<input type="hidden" id="salesList-<c:out value="${status.index}"/>-mtSalesJulCallYn" name="mtSalesJulCallYn" value="<c:out value="${list.mtSalesJulCallYn }"/>"  />
								</td>
								<td class="tdTitle">8월</td>
								<td class="tdContents">
									<input type="text" id="salesList-<c:out value="${status.index}"/>-mtSalesAugAmount" name="mtSalesAugAmount" value="<c:out value="${displayUtil.commaStr(list.mtSalesAugAmount)}"/>" amountOnly <c:if test="${list.mtSalesAugCallYn == 'N' }">class="calculate"</c:if>  <c:if test="${list.mtSalesAugCallYn != 'N' }">class="pname" style="width: 133px;text-align: right;" readOnly</c:if> />	
									<input type="hidden" id="salesList-<c:out value="${status.index}"/>-mtSalesAugCallYn" name="mtSalesAugCallYn" value="<c:out value="${list.mtSalesAugCallYn }"/>"  />
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">9월</td>
								<td class="tdContents">
									<input type="text" id="salesList-<c:out value="${status.index}"/>-mtSalesSepAmount" name="mtSalesSepAmount" value="<c:out value="${displayUtil.commaStr(list.mtSalesSepAmount)}"/>" amountOnly <c:if test="${list.mtSalesSepCallYn == 'N' }">class="calculate"</c:if>  <c:if test="${list.mtSalesSepCallYn != 'N' }">class="pname" style="width: 133px;text-align: right;" readOnly</c:if> />	
									<input type="hidden" id="salesList-<c:out value="${status.index}"/>-mtSalesSepCallYn" name="mtSalesSepCallYn" value="<c:out value="${list.mtSalesSepCallYn }"/>"  />
								</td>
								<td class="tdTitle">10월</td>
								<td class="tdContents">
									<input type="text" id="salesList-<c:out value="${status.index}"/>-mtSalesOctAmount" name="mtSalesOctAmount" value="<c:out value="${displayUtil.commaStr(list.mtSalesOctAmount)}"/>" amountOnly <c:if test="${list.mtSalesOctCallYn == 'N' }">class="calculate"</c:if>  <c:if test="${list.mtSalesOctCallYn != 'N' }">class="pname" style="width: 133px;text-align: right;" readOnly</c:if> />	
									<input type="hidden" id="salesList-<c:out value="${status.index}"/>-mtSalesOctCallYn" name="mtSalesOctCallYn" value="<c:out value="${list.mtSalesOctCallYn }"/>"  />
								</td>
								<td class="tdTitle">11월</td>
								<td class="tdContents">
									<input type="text" id="salesList-<c:out value="${status.index}"/>-mtSalesNovAmount" name="mtSalesNovAmount" value="<c:out value="${displayUtil.commaStr(list.mtSalesNovAmount)}"/>" amountOnly <c:if test="${list.mtSalesNovCallYn == 'N' }">class="calculate"</c:if>  <c:if test="${list.mtSalesNovCallYn != 'N' }">class="pname" style="width: 133px;text-align: right;" readOnly</c:if> />	
									<input type="hidden" id="salesList-<c:out value="${status.index}"/>-mtSalesNovCallYn" name="mtSalesNovCallYn" value="<c:out value="${list.mtSalesNovCallYn }"/>"  />
								</td>
								<td class="tdTitle">12월</td>
								<td class="tdContents">
									<input type="text" id="salesList-<c:out value="${status.index}"/>-mtSalesDecAmount" name="mtSalesDecAmount" value="<c:out value="${displayUtil.commaStr(list.mtSalesDecAmount)}"/>" amountOnly <c:if test="${list.mtSalesDecCallYn == 'N' }">class="calculate"</c:if>  <c:if test="${list.mtSalesDecCallYn != 'N' }">class="pname" style="width: 133px;text-align: right;" readOnly</c:if> />	
									<input type="hidden" id="salesList-<c:out value="${status.index}"/>-mtSalesDecCallYn" name="mtSalesDecCallYn" value="<c:out value="${list.mtSalesDecCallYn }"/>"  />
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
					<%-- <c:choose>
						<c:when test="${parmMtSbCtYn eq 'Y' and mtContractCountInfo.mtSalesAmountCnt>0}">
					<div class="floatR" >
						<button type="button" onclick="fn_nextBtn();"><img src="<c:url value='/images/btn_next.png'/>"/></button>
					</div>
						</c:when>
						<c:otherwise>
					<div class="floatR" >
						<img src="<c:url value='/images/btn_non_next.png'/>"/>
					</div>						
						</c:otherwise>
					</c:choose> --%>
					<%-- <c:if test="${parmMtSbCtYn eq 'Y' and mtContractCountInfo.mtSalesAmountCnt>0}">	
					<div class="floatR" >
						<button type="button" onclick="fn_nextBtn();"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div>
					</c:if> --%>
				<%-- <c:choose>
					<c:when test="${parmMtSbCtYn eq 'Y' }">
						<div id="saveNextBtn" class="floatR" onclick="fn_saveBtn('sn');" >
							<button type="button"><img src="<c:url value='/images/btn_next.png'/>" /></button>
						</div>						
					</c:when>
					<c:otherwise>
						<div class="floatR" onclick="fn_saveBtn('ss');">
							<button type="button"><img src="<c:url value='/images/btn_save.png'/>" /></button>
						</div>				
					</c:otherwise>
				</c:choose>	 --%>	
					<div class="floatN floatC"></div>
				</div>
			</div>		
		</form>
	</div>
</body>
</html>