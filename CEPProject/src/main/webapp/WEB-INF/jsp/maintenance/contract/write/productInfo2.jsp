<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>프로젝트 제품목록</title>
	<style>
		/* .firstTd {			
			border-top: 2px solid #e5e5e5;	
			padding-top: 6px;
		} */
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
			/* width: calc(100% - 201px); */
			width : 943px;
			height: 601px;
			top: 107px;
			left: 201px;			
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto;
		}
		.popContainer .contents > div {
			margin: 10px 54px 0 45px;
			width: 850px;
		}
		.popContainer .contents .subject {
			width: 844px;
			border-bottom: 2px solid #e5e5e5;
			padding-bottom: 9px;
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
			/* width: calc(100% - 22px); */
			/* height: 55px; */
			width : 717px;
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
			margin : 20px 0px 15px 45px;
		}
		.popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
      	}
		.calculate {
			text-align: right !important;
		}
		.btnCenter {
			width : calc(100% - 46px);
			text-align: center;
		}
		.popContainer .prodTable table {
			border-bottom : 2px solid #e5e5e5;
			width : 844px;
			table-layout: fixed;
		}
	</style>
	
	<script>
		$(document).ready(function() {
			/*
			처음 로딩시  저장된 리스트가 2개보다 많으면  모두 접는다.
			1개까지는 스크롤바가 생성되지 않음.
			*/
			'<c:if test="${listCount > 1 }">'
			fn_viewSummaryUpAll();
			'</c:if>'
			

			'<c:if test="${basicContractInfo.mtProjectLinkVo.mtLinkKey != null }">'
				$('#pj_delete_forecast').show();
			'</c:if>'

		});
		/**
		*  화면을 이동시킨다.
		*  @param {string} varUrl 이동해야할 url
		*/
		function fn_changeView(varUrl) {
			var url;
			/* var reqProductTotalAmount=0;
			//등록된 제품의 전체 total값을 구한다..
			$(".productTotalAmount").each(function(){
				reqProductTotalAmount = reqProductTotalAmount+removeData($(this).val(),",")*1;				
			}); */
			
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
					
					if($('#beforeProductAmount').val() != $('#mtAmount').val()) {
						alert("기본정보의 제품금액("+addCommas($('#mtAmount').val())+")과 저장된 제품금액("+addCommas($('#beforeProductAmount').val())+")이 달라 해당 메뉴로 이동할 수 없습니다.!!");
						return false;
					} else {
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
					}
					
				} else if(varUrl == "writeSalesPlanView"){				
					if($('#beforeProductAmount').val() != $('#mtAmount').val()) {
						alert("기본정보의 제품금액("+addCommas($('#mtAmount').val())+")과 저장된 제품금액("+addCommas($('#beforeProductAmount').val())+")이 달라 해당 메뉴로 이동할 수 없습니다.!!");
						return false;
					} else {
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
					}	
										
					
				} else if(varUrl == "backOrderInfoView"){
					if($('#beforeProductAmount').val() != $('#mtAmount').val()) {
						alert("기본정보의 제품금액("+addCommas($('#mtAmount').val())+")과 저장된 제품금액("+addCommas($('#beforeProductAmount').val())+")이 달라 해당 메뉴로 이동할 수 없습니다.!!");
						return false;
					} else {
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
					}
									
					
				} else if(varUrl == "purchaseAmountView"){			
					if($('#beforeProductAmount').val() != $('#mtAmount').val()) {
						alert("기본정보의 제품금액("+addCommas($('#mtAmount').val())+")과 저장된 제품금액("+addCommas($('#beforeProductAmount').val())+")이 달라 해당 메뉴로 이동할 수 없습니다.!!");
						return false;
					} else {
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
					}		
					
				}
			} else {
				alert(" 유지보수계약 기본정보가 등록되지 않아 화면을 이동할 수 없습니다.");
				return false;
			}
			//console.log("url===>"+url);
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
							} else if(this.name.split('-')[2]=="mtPmStartDt" || this.name.split('-')[2]=="mtPmEndDt") {
								//이름에서 prodList-0-를 제거하고 날짜값에서 -를 제거한다.
								obj[this.name.split('-')[2]] =  removeData(this.value,"-"); 
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
		/* 제품 유지보수 기간과 기본정보 유지보수 기간을 체크한다.*/
		jQuery.fn.checkPmDate = function() {
			var checkDate = '';
			var contractDate =addDateMinus($('#mtContFromDate').val())+" ~ "+addDateMinus($('#mtContEndDate').val());
			var startDate;
			try {
				//console.log("contractDate====>"+contractDate);
				if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
					var arr = this.serializeArray(); 
					if(arr){							
						jQuery.each(arr, function() {
							if(''==checkDate) {
								//console.log("this.name====>"+this.name);
								if('mtPmStartDt' == this.name.split('-')[2]){
									//console.log("mtPmStartDt====>"+this.name);
									//startDate = removeData(this.value,'-')*1;
									startDate = this.value;
									//console.log("mtPmStartDt00000====>"+$('#mtContFromDate').val()+" / "+removeData(this.value,'-')+" / "+this.value+" / "+$('#mtContEndDate').val()+"/"+($('#mtContEndDate').val()*1 < removeData(this.value,'-')*1));
									//console.log("====>"+(false || true) +"/"+(true || true)+"/"+(false || false)+"/"+(true || false))
									if(($('#mtContFromDate').val()*1 > removeData(this.value,'-')*1) | ($('#mtContEndDate').val()*1 < removeData(this.value,'-')*1)) {
										checkDate = this.value+"일자는 계약기간 범위("+contractDate+")에 있지 않습니다. \n확인 후 다시 등록하세요!!";
										//console.log("this.name1111======>"+this.name+" / "+this.value)
										//접혀있으면 포커스 이동이 안되므로 모두 펼친다.
										fn_viewSummaryDownAll();
										$( "#"+this.name ).focus();
										
										return checkDate;
										
									} else {
										//console.log("mtPmStartDt11====>"+$('#mtContFromDate').val()+" / "+removeData(this.value,'-')+" / "+this.value+" / "+$('#mtContEndDate').val()+"/"+($('#mtContEndDate').val()*1 < removeData(this.value,'-')*1));
									}
								} else if('mtPmEndDt' == this.name.split('-')[2]) {

									//console.log("mtPmEndDt====>"+this.name);
									if($('#mtContEndDate').val()*1 < removeData(this.value,'-')*1) {
										checkDate = this.value+"일자는 계약기간 범위("+contractDate+")에 있지 않습니다. \n확인 후 다시 등록하세요!!";
										//접혀있으면 포커스 이동이 안되므로 모두 펼친다.
										fn_viewSummaryDownAll();
										//console.log("this.name222======>"+this.name+" / "+this.value)
										$( "#"+this.name ).focus();
										return checkDate;
									} else if(removeData(startDate,'-')*1 > removeData(this.value,'-')*1) {
										checkDate = this.value+"일자는 시작일자("+startDate+")보다 이전날짜입니다.. \n확인 후 다시 등록하세요!!";
										//접혀있으면 포커스 이동이 안되므로 모두 펼친다.
										fn_viewSummaryDownAll();
										$( "#"+this.name ).focus();
										return checkDate;
									} else {
										//console.log("mtPmEndDt111====>"+$('#mtContEndDate').val()+" / "+removeData(this.value,'-')+" / "+this.value);
									}
								}
							} else {
								//break;
							}

						}); 	              
					} 
				} 
			}catch(e) { 
				alert(e.message); 
			}finally {} 
			return checkDate; 
		}
		
		/* 
			매출정보데이타 업데이트 여부를 확인한다.
			1. 제품별  전체금액이 달라진 경우
			2. 제품별 유지보수 월이 달라진 경우.
		*/
		jQuery.fn.salesUpadteYn = function() {
			var salesUpadteAmountYn = 'N';		
			var totalAmount;
			var startDate;
			var endDate;	
			var beforeTotalAmount;
			var beforeStartDate;
			var beforeEndDate;
			try {
				//console.log("contractDate====>"+contractDate);
				if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
					var arr = this.serializeArray(); 
					if(arr){							
						jQuery.each(arr, function() {
							if('N'==salesUpadteAmountYn) {
								//console.log("this.name====>"+this.name);
								//기존에 입력된 데이타(수정전 데이타.)
								if('beforeTotalAmount' == this.name){ 
									beforeTotalAmount = this.value;	
								} else if('beforeMtPmStartDt' == this.name){
									beforeStartDate = this.value;									
								} else if('beforeMtPmEndDt' == this.name) {
									beforeEndDate = this.value;
								}
								//현재 입력된 데이타(수정된 데이타.)
								if('totalAmount' == this.name){ 
									totalAmount = this.value;	
								} else if('mtPmStartDt' == this.name.split('-')[2]){
									startDate = this.value;									
								} else if('mtPmEndDt' == this.name.split('-')[2]) {
									endDate = this.value;
								}
								
								if('remark' == this.name){
									//console.log("===>"+beforeTotalAmount+"("+totalAmount+"), "+beforeStartDate+"("+startDate+"), "+beforeEndDate+"("+endDate+")");
									//console.log("===>"+beforeTotalAmount+"("+totalAmount+"), "+beforeStartDate.substr(0,7)+"("+startDate.substr(0,7)+"), "+beforeEndDate.substr(0,7)+"("+endDate.substr(0,7)+")");
									if(beforeTotalAmount !=totalAmount ) {
										//console.log("전체금액이 달라지면 매출정보 업데이트");
										//전체금액이 달라지면 매출정보 업데이트
										salesUpadteAmountYn = "Y";
									} else if(beforeStartDate.substr(0,7) != startDate.substr(0,7)) {
										//console.log("시작월이  달라지면 매출정보 업데이트");
										//시작월이  달라지면 매출정보 업데이트
										salesUpadteAmountYn = "Y";
									} else if(beforeEndDate.substr(0,7) != endDate.substr(0,7)) {
										//console.log("종료월이  달라지면 매출정보 업데이트");
										//종료월이  달라지면 매출정보 업데이트
										salesUpadteAmountYn = "Y";
									}
									beforeTotalAmount ='';
									beforeStartDate ='';
									beforeEndDate ='';
									totalAmount='';
									startDate ='';
									endDate ='';
									
								}
								
							} else {
								//break;
								return salesUpadteAmountYn;
							}

						}); 	              
					} 
				} 
			}catch(e) { 
				alert(e.message); 
			}finally {} 
			return salesUpadteAmountYn; 
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
	    	var classArr = new Array(); // 접기펴기
	    	
	    	var tr = $('.'+type+'Table tr');
	    	var td = tr.children().children();
	    	
	    	/* var cls = $('.'+type+'Table');
	    	var clscs = cls.children();
	    	console.log("clscs.length===>"+clscs.length);
	    	
	    	for(var i = 0; i < clscs.length; i++) {
	    		console.log("clscs.[i]===>"+JSON.stringify(clscs[i]));
	    	} */
	    	
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

	    		//if(td[i].getAttribute('class') != null && td[i].getAttribute('class') != undefined && td[i].getAttribute('class') != "" && td[i].getAttribute('class').length != 0) {
	    		//	classArr.push(td[i].getAttribute('class')); 	    			
	    		//}
	    	}
	    	
	    	var name = type + 'List-' + (lastNum+1) + '-';    	
	    	   	
	    	for(var i = 0; i < classArr.length; i++) {
	    		clone.find('input[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val("");
	    	}
	    	
	    	//name 필드 값 변경 및 값 초기화	    	
	    	for(var i = 0; i < nameArr.length; i++) {
	    		var splitName = nameArr[i].split('-')[2];   			
	    		
	    		//값 초기화
	    		clone.find('input[name="lastNum"]').val(lastNum+1);
				clone.find('input[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val("");
				clone.find('textarea[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 
				clone.find('select[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val("");		
				clone.find('hidden[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 
				
				//날짜필드값 변경
				clone.find('input[name="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('name', name + splitName).val("");
	    	} 
	    	
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
	    	
	    	//펼쳐서 보여주기
	    	clone.find('.dpNone').attr('class', 'dpTbRow');
	    	clone.find('.up').attr('class', 'down').attr('src', '/images/arrow_up.png');
	    	
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
		
		//이전화면으로 이동
		function fn_prevBtn(){
			if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수계약 기본정보 등록화면으로 이동하시겠습니까?")) {
				var url = '/maintenance/contract/write/basicInfoView.do';
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
			/* var reqProductTotalAmount=0;
			//등록된 제품의 전체 total값을 구한다..
			$(".productTotalAmount").each(function(){
				reqProductTotalAmount = reqProductTotalAmount+removeData($(this).val(),",")*1;				
			}); */
			
			if($('#beforeProductAmount').val() != $('#mtAmount').val()) {
				//alert("기본정보의 제품금액("+addCommas($('#mtAmount').val())+")과 저장된 제품금액("+addCommas(reqProductTotalAmount)+")이 달라 해당 메뉴로 이동할 수 없습니다.!!");
				alert("기본정보의 제품금액("+addCommas($('#mtAmount').val())+")과 저장된 제품금액("+addCommas($('#beforeProductAmount').val())+")이 달라 해당 메뉴로 이동할 수 없습니다.!!");
			} else {
				if("${mtContractCountInfo.mtProductCnt}" > 0){
					if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수계약 매출정보 등록화면으로 이동하시겠습니까?")) {
						var url = '/maintenance/contract/write/salesInfoView.do';
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
					alert(" 유지보수계약 제품정보가 등록되지 않았습니다.\n 유지보수계약 제품정보를 먼저 등록하세요.");
					return false;
				}	
			}
			
			
		}

		function fn_saveBtn(){
			var reqProductTotalAmount=0;
			var actionTitle;
			var checkDate;
			var salesUpadteYnGubun;
			//등록된 제품의 전체 total값을 구한다.
			$(".productTotalAmount").each(function(){
				reqProductTotalAmount = reqProductTotalAmount+removeData($(this).val(),",")*1;
				
			});
			//console.log(reqProductTotalAmount+'/'+$('#beforeProductAmount').val());
			
			//등록하려는 제품의 총금액이 계산서 발행 요청금액보다 작은 경우 경고 문구 후 진행할 수 없음
			/* if($('#callTotalAmount').val()*1>reqProductTotalAmount) {
				alert("계산서 발행 요청금액("+addCommas($('#callTotalAmount').val())+") 보다 등록하려는 제품총금액("+addCommas(reqProductTotalAmount)+")이 작아 등록할 수 없습니다.");
				return false;
			} */
			/*
				처음등록하는 경우는 무조건 매출정보를 등록하고
				수정인 경우 매출정보 업데이트(updateYn) 하는 기준
				1. 제품전체 금액이 달라진 경우
				2. 제품별  전체금액이 달라진 경우
				3. 제품별 유지보수 월이 달라진 경우.				
			*/
			
			
			
			//console.log("1111111111");
			
			//필수값 체크를 완료하면 저장 프로세스 시작.
			if ($("#mtListForm")[0].checkValidity()){
				checkDate = $("#mtListForm").checkPmDate();
				
				if('' != checkDate) {
					alert(checkDate);
				} else {
					if($('#rowNum').val()*1 >0){					
						actionTitle = "수정";
					} else {
						actionTitle = "저장";
					}
					
					if(confirm("유지보수계약 제품정보를 "+actionTitle+"하시겠습니까?")) {
						//등록된 갯수가 0보다 크면 수정.
						if($('#rowNum').val()*1 >0) {
							//1. 제품전체 총액이 달라지고 유지보수 기본정보의 금액과 같은 경우 업데이트
							//console.log("===>"+reqProductTotalAmount+"("+$('#beforeProductAmount').val()+"), "+reqProductTotalAmount+"("+$('#mtAmount').val()+")");
							if(reqProductTotalAmount != $('#beforeProductAmount').val() && reqProductTotalAmount==$('#mtAmount').val()) {
								$('#updateYn').val("Y");
							}else {
								//2. 유지보수 기본정보의 금액과 같고
								if(reqProductTotalAmount==$('#mtAmount').val()) {
									salesUpadteYnGubun = $("#mtListForm").salesUpadteYn();
									//3.  제품별 유지보수 월이 달라진 경우나 제품별  전체금액이 달라진 경우 업데이트
									if("Y"==salesUpadteYnGubun) {
										$('#updateYn').val("Y");
									}
								}													
							}				
						}
						//제품정보를 등록(수정) 한다.
						saveProductList(actionTitle);
					} else {
						return false;
					}
				
				}		
			}  else {
				 //Validate Form
		        $("#mtListForm")[0].reportValidity();	
			}
		}
	
		function saveProductList(actionTitle){

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
	            		if($('#updateYn').val()=="Y") {
	            			alert("유지보수계약 제품"+actionTitle+"을 성공하였습니다. \n제품정보 변경으로 매출정보가 변경되었습니다. \n매출정보를 확인하세요!!");
	            		} else {
	            			alert("유지보수계약 제품"+actionTitle+"을 성공하였습니다.");
	            		}
	            		
	            		//유지보수작업 발주 등록화면으로 이동
	            		var url='/maintenance/contract/write/productInfoView.do';
	            		            			
		    			var dialogId = 'program_layer';
		    			var varParam = paramData
		    			var button = new Array;
		    			button = [];
		    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
	            	} else {
	            		alert("유지보수계약 제품"+actionTitle+"을 실패하였습니다.");
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

		function fnUpdateSaleAmount(param) {
			//alert(param);
			$('#updateYn').val(param);
		}
		
		//유지보수계약 제품 찾기 클릭
		function fn_findMtProduct(obj) {
			var num = $(obj).attr('id').split('-')[1];
			//console.log('/maintenance/contract/popup/mtProductList.do?whereNum='+num+'&selectIntegrateKey='+$('#mtIntegrateKey').val());
			
			/* window.open('/maintenance/contract/popup/mtProductList.do?whereNum='+num+'&selectIntegrateKey='+$('#mtIntegrateKey').val()
					,'MT_PRODUCT_POPUP'
					,'width=1000px,height=400,left=600,status=no,title=no,toolbar=no,menubar=no,location=no'); */
			//window.open('/mngCommon/product/popup/searchListPopup.do?returnType=O&returnKey=prodList-'+num+'-mtPmFkKey&returnNm=prodList-'+num+'-pmNmCd','PRODUCT_LIST','width=1000px,height=713px,left=600');
			window.open('/mngCommon/product/popup/searchListPopup.do?pmNmDomId='+obj.id+'&pmKeyDomId='+obj.nextElementSibling.id+'&returnType=O','PRODUCT_LIST','width=1000px,height=713px,left=600');
		}
/* 		function fn_viewSummaryUpAll(){
			$(".dpTbRow").attr('class','dpNone');
			$(".down").attr('class','up');
			$(".up").attr('src','<c:url value='/images/arrow_down.png'/>');
			//$(".up").src = "<c:url value='/images/arrow_down.png'/>";
		} */
		//프로젝트 제품 찾기 클릭
		function fn_addProjectProduct(mtLinkCtKey){
			//var num = $(obj).attr('id').split('-')[1];
			//console.log('/maintenance/contract/popup/mtProductList.do?whereNum='+num+'&selectIntegrateKey='+$('#mtIntegrateKey').val());
			var num = 1;
			window.open('/maintenance/contract/popup/pjProductList.do?searchGubun=workPm&whereNum='+num+'&selectIntegrateKey='+mtLinkCtKey
					,'PJ_PRODUCT_POPUP'
					,'width=1000px,height=700,left=600,status=no,title=no,toolbar=no,menubar=no,location=no');
			
			
		}
		
		function addProjectProduct(mtPmKey,pmNmCd,mtPmQuantity,mtPmUprice, mtRate,enPmDetail) {

			var checkNum;
			var setMtPmUprice = mtPmUprice * (mtRate/100);
			var lastNum = $("input[name='lastNum']").get($("input[name='lastNum']").length-1).getAttribute('value')*1;
			//console.log("lastNum=======>"+lastNum);
			
			if($("#prodList-"+lastNum+"-mtPmFkKey").val()=='') {
				
				checkNum = lastNum;
			} else {
				fn_addInfoTable();
				checkNum = lastNum+1;
			}
			console.log("mtPmUprice=======>"+mtPmUprice);
			console.log("mtRate=======>"+mtRate);
			console.log("setMtPmUprice=======>"+setMtPmUprice);
			
			$("#prodList-"+checkNum+"-pmNmCd").val(pmNmCd);
			$("#prodList-"+checkNum+"-mtPmFkKey").val(mtPmKey);
			$("#prodList-"+checkNum+"-mtPmQuantity").val(addCommas(mtPmQuantity));
			$("#prodList-"+checkNum+"-mtPmUprice").val(addCommas(setMtPmUprice));
			$("#prodList-"+checkNum+"-totalAmount").val(addCommas(mtPmQuantity*setMtPmUprice));
			if(enPmDetail.length >0) {
				var parsedWordArray = CryptoJS.enc.Base64.parse(enPmDetail);
				var mtPmDetail = parsedWordArray.toString(CryptoJS.enc.Utf8);
			}
			$("#prodList-"+checkNum+"-mtPmDetail").val(mtPmDetail);
			/* prodList-3-pmNmCd
			prodList-3-mtPmFkKey
			prodList-3-mtPmQuantity
			prodList-3-mtPmDetail */
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
					<li class="colorWhite cursorP on">제품정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('salesInfoView');">매출정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('writeSalesPlanView');">계산서계획정보</li>
					<c:if test="${parmMtSbCtYn eq 'Y' }">		
					<li class="colorWhite cursorP" onclick="fn_changeView('backOrderInfoView');">백계약정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('purchaseAmountView');">매입정보</li>
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
			<input type="hidden" id="mtContFromDate" name="mtContFromDate" value="<c:out value="${mtContFromDate}"/>" />
			<input type="hidden" id="mtContEndDate" name="mtContEndDate" value="<c:out value="${mtContEndDate}"/>" />
			<input type="hidden" id="deleteListKeys" name="deleteListKeys" />
			<input type="hidden" id="updateYn" name="updateYn" value="N"/>
			<input type="hidden" id="mtAmount" name="mtAmount" value="<c:out value="${basicContractInfo.mtAmount}"/>"/>
			<%-- <input type="hidden" id="callTotalAmount" name="callTotalAmount" value="<c:out value="${basicContractInfo.callTotalAmount}"/>"/> --%>			
			
			<input type="hidden" id="beforeProductAmount" name="beforeProductAmount" value="<c:out value="${mtContractCountInfo.productTotalAmount}"/>"/>
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
								<td class="subBtn" style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable();" style="cursor: pointer;"/></td>
								<td class="subBtn" colspan="5"  style="border-top: none;text-align: center;vertical-align: middle;">
									<%-- <c:if test="${listCount>0}">
									유지보수 매출금액 업데이트여부 :
									<input type="radio" class="tRadio" name="checkUpdateYn" value="Y" id="updateYn1" onclick="fnUpdateSaleAmount('Y')"/><label for="updateYn1" class="cursorP" style="width: 22px;height: 22px;"></label>&nbsp;&nbsp;Y&nbsp;&nbsp;
									<input type="radio" class="tRadio" name="checkUpdateYn" value="N" id="updateYn2" onclick="fnUpdateSaleAmount('N')"checked="checked"/><label for="updateYn2" class="cursorP" style="width: 22px;height: 22px;"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
									</c:if> --%>
									<c:choose>
										<c:when test="${basicContractInfo.mtProjectLinkVo == null ||  basicContractInfo.mtProjectLinkVo.mtLinkCtKey == null}">
										<img id="project_product" class="floatR" src="<c:url value='/images/project_gray.png'/>"/>
										</c:when>
										<c:otherwise>
										<img id="project_product" class="floatR" src="<c:url value='/images/btn_project_get.png'/>" onclick="fn_addProjectProduct('<c:out value="${basicContractInfo.mtProjectLinkVo.mtLinkCtKey}"/>');" style="cursor: pointer;"/>										
										</c:otherwise>
									</c:choose>
									
								</td>
							</tr>
						</table>
					</div>
					<c:choose>
						<c:when test="${mtProductList == null ||  mtProductList.size() == 0}">
						<div class="prodTable">
							<input type="hidden" name="lastNum" value="0" />
							<table>
								<tr>
									<td class="tdTitle firstTd"><label>*</label>&nbsp;제품</td>
									<td class="tdContents firstTd">
										<!-- <input type="text" id="prodList-0-mtPmFkKey" name="mtPmFkKey" class="search" required/>	
										<input type="hidden" id="prodList-0-pmNmCd" name="pmNmCd" /> -->
										<input type="text" id="prodList-0-pmNmCd" name="pmNmCd" class="search" onclick="fn_findMtProduct(this)" onkeypress="return false;" required/>	
										<input type="hidden" id="prodList-0-mtPmFkKey" name="mtPmFkKey"/>	
										<input type="hidden" id="prodList-0-mtPmKey" name="mtPmKey" />	
									</td>
									<td class="tdTitle firstTd"><label>*</label>&nbsp;시리얼번호</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-0-mtPmSerialNum" name="mtPmSerialNum" required/>
									</td>
									<td class="tdTitle firstTd"><label>*</label>&nbsp;수량</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-0-mtPmQuantity" name="mtPmQuantity" amountOnly style="width: 75px;" class="calculate" required/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
										<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
			                        	<img id="prodList-0-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label>&nbsp;단가</td>
									<td class="tdContents">
										<input type="text" id="prodList-0-mtPmUprice" name="mtPmUprice" class="calculate" amountOnly required/>
									</td>	
									<td class="tdTitle"><label>*</label>&nbsp;합계</td>
									<td class="tdContents" colspan="3">
										<input type="text" id="prodList-0-totalAmount" name="totalAmount" style="text-align: right;" readonly="readonly"/>	
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label>&nbsp;계약기간</td>
									<td class="tdContents" colspan="3">
										<input type="text" id="prodList-0-mtPmStartDt" name="prodList-0-mtPmStartDt" class="calendar fromDt" required/>&nbsp;&nbsp;~&nbsp;&nbsp;<input type="text" id="prodList-0-mtPmEndDt" name="prodList-0-mtPmEndDt" class="calendar toDt" required/>
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
									<td class="tdTitle firstTd"><label>*</label>&nbsp;제품</td>
									<td class="tdContents firstTd">
										<%-- <input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmFkKey" name="mtPmFkKey" value="<c:out value="${list.mtPmFkKey}"/>" class="search" required/>	
										<input type="hidden" id="prodList-<c:out value="${status.index}"/>-pmNmCd" name="pmNmCd" value="<c:out value="${list.pmNmCd}"/>" /> --%>
										<input type="text" id="prodList-<c:out value="${status.index}"/>-pmNmCd" name="pmNmCd" value="<c:out value="${list.pmNmCd}"/>" class="search" onclick="fn_findMtProduct(this)" onkeypress="return false;" required/>	
										<input type="hidden" id="prodList-<c:out value="${status.index}"/>-mtPmFkKey" name="mtPmFkKey" value="<c:out value="${list.mtPmFkKey}"/>"/>	
										<input type="hidden" id="prodList-<c:out value="${status.index}"/>-mtPmKey" name="mtPmKey" value="<c:out value="${list.mtPmKey}"/>"/>	
									</td>
									<td class="tdTitle firstTd"><label>*</label>&nbsp;시리얼번호</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmSerialNum" name="mtPmSerialNum" value="<c:out value="${list.mtPmSerialNum}"/>" required/>
											
									</td>
									<td class="tdTitle firstTd"><label>*</label>&nbsp;수량</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmQuantity" name="mtPmQuantity" value="<c:out value="${displayUtil.commaStr(list.mtPmQuantity)}"/>" amountOnly style="width: 75px;" class="calculate" required/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
										<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
			                        	<img id="prodList-<c:out value="${status.index}"/>-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label>&nbsp;단가</td>
									<td class="tdContents">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmUprice" name="mtPmUprice" value="<c:out value="${displayUtil.commaStr(list.mtPmUprice)}"/>" class="calculate" amountOnly required/>
									</td>	
									<td class="tdTitle"><label>*</label>&nbsp;합계</td>
									<td class="tdContents" colspan="3">
										<input class="productTotalAmount"  type="text" id="prodList-<c:out value="${status.index}"/>-totalAmount" name="totalAmount" style="text-align: right;" value="<c:out value="${displayUtil.makeMultiNumber(list.mtPmQuantity, list.mtPmUprice)}"/>" readonly="readonly"/>
										<input type="hidden" name="beforeTotalAmount" value="<c:out value="${displayUtil.makeMultiNumber(list.mtPmQuantity, list.mtPmUprice)}"/>" readonly="readonly"/>
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label>&nbsp;계약기간</td>
									<td class="tdContents" colspan="3">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmStartDt" name="prodList-<c:out value="${status.index}"/>-mtPmStartDt" class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(list.mtPmStartDt)}"/>" required/>&nbsp;&nbsp;~&nbsp;&nbsp;<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmEndDt" name="prodList-<c:out value="${status.index}"/>-mtPmEndDt" class="calendar toDt" value="<c:out value="${displayUtil.displayDate(list.mtPmEndDt)}"/>" required/>
										<input type="hidden" name="beforeMtPmStartDt" value="<c:out value="${displayUtil.displayDate(list.mtPmStartDt)}"/>"/>
										<input type="hidden" name="beforeMtPmEndDt" value="<c:out value="${displayUtil.displayDate(list.mtPmEndDt)}"/>"/>
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
				<div class="btnWrap floatL">
					<div class="floatL">
						<button type="button"><img src="<c:url value='/images/btn_prev.png'/>" onclick="fn_prevBtn();"/></button>
					</div>
					<div class="floatL btnCenter">
						<button type="button" onclick="fn_saveBtn();"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<c:choose>
						<c:when test="${mtContractCountInfo.mtProductCnt>0}">
					<div class="floatR" >
						<button type="button" onclick="fn_nextBtn();"><img src="<c:url value='/images/btn_next.png'/>"/></button>
					</div>
						</c:when>
						<c:otherwise>
					<div class="floatR" >
						<img src="<c:url value='/images/btn_non_next.png'/>"/>
					</div>						
						</c:otherwise>
					</c:choose>
					<%-- <c:if test="${mtContractCountInfo.mtProductCnt>0}">
					<div class="floatR" >
						<button type="button"><img src="<c:url value='/images/btn_next.png'/>" onclick="fn_nextBtn();"/></button>
					</div>
					</c:if> --%>
					
					<div class="floatN floatC"></div>
				</div>
			</div>		
		</form>
		<%-- <form:form commandName="mtListVO" id="mtListForm" name="mtBasicForm" method="post">		
		</form:form >--%>
	</div>
</body>
</html>