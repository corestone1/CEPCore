<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>백계약정보</title>
	<style>
		.firstTd {			
			/* border-top: 2px solid #e5e5e5; */	
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
			//height: 40px;
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
		
		.popContainer .contents .subject1, .popContainer .contents .subject2 {
			width: 846px;
			background-color: #f6f7fc;			
			/* position: fixed; */
		} 
		.popContainer .contents .subject2 {
			border-bottom: 2px solid #e5e5e5;
			padding-bottom: 9px;
		}
		.popContainer .contents .btnWrap {
			margin : 20px 0px 15px 49px;			
			width : 842px;
		}
		.calculate {
			text-align: right !important;
		}
		.popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
      	}
		.popContainer .prodTable table {
			border-bottom : 2px solid #e5e5e5;
			width : 844px;
			table-layout: fixed;
		}
		.btnCenter {
			width : calc(100% - 46px);
			text-align: center;
		}
      	.accountList li {
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
			font-size: 14px;
			color: #21a17e;
		}
	</style>
	<script>
		$(document).ready(function() {
			//매입처 담당자 셋팅
			$('#mtOrderAcDirectorKey').val("${mtBackOrderVO.mtOrderAcDirectorKey}").attr("selected", "true");
			
			//부가세 포함 라이오버튼 셋팅
			//$('#taxYn').val("${mtBackOrderVO.taxYn}").prop("checked", true);
			$("input:radio[name='taxYn']:radio[value='${mtBackOrderVO.taxYn}']").prop('checked', true);
			
			// 등록된 거래처 selectBox 맵핑.
			if(parseInt('${backOrderBoxList.size()}') >0 ){
				$('#mtSaveOrderAcKey').val("${mtBackOrderVO.mtOrderKey}").attr("selected", "true");
			}
			
			fn_calculate();
			
			/*
			처음 로딩시  저장된 리스트가 2개보다 많으면  모두 접는다.
			2개까지는 스크롤바가 생성되지 않음.
			*/
			'<c:if test="${listCount > 1 }">'
			fn_viewSummaryUpAll();
			'</c:if>'
			
			//거래처 검색
			$("#mtOrderAcKeyNm").on("keydown", function(event){
				
				if(event.keyCode == 13) {						
					fnSearchAccoutList(this, $(this).val());
				}
					
			});
		
		}); //end $(document).ready()
		
		//거래처 검색
		var fnSearchAccoutList = function(pObject, pstAccountNm) {
			$('#div_accountList').remove();
		
			var jsonData = {'acNm' : pstAccountNm, 'acBuyYN' : 'Y'};
			
			 $.ajax({
		        	url :"/mngCommon/account/searchList.do",
		        	type:"POST",  
		            data: jsonData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		
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
		//거래처 검색
		var fnViewAccountList = function(pObject, pjAccountList){
			var html = '<div id="div_accountList" style="width:179px; padding-top: 7px; margin-left: 112px; padding-bottom: 7px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1); position: absolute;">'
			         + '<ul class="accountList">'
			       ;//+ '<div style="margin: 5px;">';
			       
			       for(var i=0; i < pjAccountList.length; i++) {
			    	   html += '<li id="li_account" title="'+ pjAccountList[i].acKey +'">' + pjAccountList[i].acNm + '</li>'
			    	        ;
			    	}
			       
			       
			    html +=  '</ul>'
			          + '</div>'
			         ;//+ '</div>';
			//$('#td_account').after(html);
			$('#tr_account').after(html);
			
			
			$("[id^='li_account']").click(function(event) {
				
				$('#mtOrderAcKeyNm').val(this.innerText); 
				$('#mtOrderAcKey').val(this.title);
				$('#mtOrderAcKey').change();
				$('#div_accountList').remove();
			});
		};
		
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
							} else if(this.name.split('-')[2]=="mtStartDt" || this.name.split('-')[2]=="mtEndDt") {
								//이름에서 prodList-0-를 제거하고 날짜값에서 -를 제거한다.
								obj[this.name.split('-')[2]] =  removeData(this.value,"-"); 
							} else {
								obj[this.name] = this.value; 
							}
							
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('mtEndDt' == this.name.split('-')[2]){
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
		
		/* 백계약 제품 유지보수 기간과 기본정보 유지보수 기간을 체크한다.*/
		jQuery.fn.checkPmDate = function() {
			var checkDate = '';
			//var contractDate =addDateMinus($('#mtContFromDate').val())+" ~ "+addDateMinus($('#mtContEndDate').val());
			
			var checkStartDate;
			var checkEndDate;
			var startDate;
			try {
				//console.log("contractDate====>"+contractDate);
				if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
					var arr = this.serializeArray(); 
					if(arr){							
						jQuery.each(arr, function() {
							if(''==checkDate) {
								//console.log("this.name====>"+this.name);
								if('mtStartDt' == this.name.split('-')[2]){
									//console.log("mtPmStartDt====>"+this.name);
									
									checkStartDate = removeData($('#prodList-'+this.name.split('-')[1]+'-checkStartDt').val(),'-');
									checkEndDate = removeData($('#prodList-'+this.name.split('-')[1]+'-checkEndDt').val(),'-');
									//console.log("mtStartDt checkDate===>"+checkStartDate+" / "+checkEndDate+" / "+this.value);
									//console.log("mtPmStartDt00000====>"+$('#mtContFromDate').val()+" / "+removeData(this.value,'-')+" / "+this.value+" / "+$('#mtContEndDate').val()+"/"+($('#mtContEndDate').val()*1 < removeData(this.value,'-')*1));
									//console.log("====>"+(false || true) +"/"+(true || true)+"/"+(false || false)+"/"+(true || false))
									if(checkStartDate*1>removeData(this.value,'-')*1) {
										//백계약 제품 시작일자가 유지보수 제품계약 시작일자보다 이전이면 경고
										checkDate = this.value+"일자는 해당 유지보수 제품 계약시작일자("+addDateMinus(checkStartDate)+")보다 이전입니다.  \n확인 후 다시 등록하세요!!";
										fn_viewSummaryDownAll();
										$( "#"+this.name ).focus();
										
										return checkDate;
									} else if(checkEndDate*1 < removeData(this.value,'-')*1) {
										//백계약 제품 시작일자가 유지보수 제품계약 종료일자보다 이후이면 경고
										checkDate = this.value+"일자는 해당 유지보수 제품 계약종료일자("+addDateMinus(checkEndDate)+")보다 이후입니다.  \n확인 후 다시 등록하세요!!";
										fn_viewSummaryDownAll();
										$( "#"+this.name ).focus();
										
										return checkDate;
									} else {
										//console.log("mtPmStartDt11====>"+$('#mtContFromDate').val()+" / "+removeData(this.value,'-')+" / "+this.value+" / "+$('#mtContEndDate').val()+"/"+($('#mtContEndDate').val()*1 < removeData(this.value,'-')*1));
									}
								} else if('mtEndDt' == this.name.split('-')[2]) {

									checkStartDate = removeData($('#prodList-'+this.name.split('-')[1]+'-checkStartDt').val(),'-');
									checkEndDate = removeData($('#prodList-'+this.name.split('-')[1]+'-checkEndDt').val(),'-');
									startDate = removeData($('#prodList-'+this.name.split('-')[1]+'-mtStartDt').val(),'-');
									
									//console.log("mtEndDt checkDate===>"+checkStartDate+" / "+checkEndDate+" / "+startDate+" / "+this.value);
									if(checkStartDate*1>removeData(this.value,'-')*1) {
										//백계약 제품 시작일자가 유지보수 제품계약 시작일자보다 이전이면 경고
										checkDate = this.value+"일자는 해당 유지보수 제품 계약시작일자("+addDateMinus(checkStartDate)+")보다 이전입니다.  \n확인 후 다시 등록하세요!!";
										fn_viewSummaryDownAll();
										$( "#"+this.name ).focus();
										
										return checkDate;
									} else if(checkEndDate*1 < removeData(this.value,'-')*1) {
										//백계약 제품 시작일자가 유지보수 제품계약 종료일자보다 이후이면 경고
										checkDate = this.value+"일자는 해당 유지보수 제품 계약종료일자("+addDateMinus(checkEndDate)+")보다 이후입니다.  \n확인 후 다시 등록하세요!!";
										fn_viewSummaryDownAll();
										$( "#"+this.name ).focus();
										
										return checkDate;
									} else if(removeData(startDate,'-')*1 > removeData(this.value,'-')*1) {
										//백계약 제품 시작일자가 유지보수 제품계약 종료일자보다 이후이면 경고
										checkDate = this.value+"일자는 해당 유지보수 백계약 제품 계약시작일자("+addDateMinus(startDate)+")보다 이전입니다.  \n확인 후 다시 등록하세요!!";
										fn_viewSummaryDownAll();
										$( "#"+this.name ).focus();
										
										return checkDate;
									} else {
										//console.log("mtPmStartDt11====>"+$('#mtContFromDate').val()+" / "+removeData(this.value,'-')+" / "+this.value+" / "+$('#mtContEndDate').val()+"/"+($('#mtContEndDate').val()*1 < removeData(this.value,'-')*1));
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
	    		var splitName = nameArr[i].split('-')[2];  
	    		
	    		clone.find('input[name="lastNum"]').val(lastNum+1);
				clone.find('input[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val("");
				clone.find('textarea[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 
				clone.find('select[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 		
				clone.find('hidden[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 			
				
				//날짜필드값 변경
				clone.find('input[name="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('name', name + splitName).val("");
				
	    	} 
	    	clone.find('input[id="'+ type + 'List-' + lastNum + '-checkStartDt' +'"]').attr('id', name + 'checkStartDt').val("");
			clone.find('input[id="'+ type + 'List-' + lastNum + '-checkEndDt' +'"]').attr('id', name + 'checkEndDt').val("");
			
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
	    	
	    	//펼쳐서 보여주기
	    	clone.find('.dpNone').attr('class', 'dpTbRow');
	    	clone.find('.up').attr('class', 'down').attr('src', '/images/arrow_up.png');
	    	
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
			var serialNum;
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
				serialNum = $('#prodList-'+listNum+'-mtPmSerialNum').val();
				if(serialNum == ''){
					productName = $('#prodList-'+listNum+'-mtPmKeyNm').val();
				} else {
					productName = $('#prodList-'+listNum+'-mtPmKeyNm').val()+"("+serialNum+")";
				}
				
				//삭제 key
				deleteKey =  $('#prodList-'+listNum+'-mtOrderPmKey').val();
								
				if(confirm(productName+" 제품정보를 삭제하시겠습니까?")) {
					
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
				
				
			} else {
				alert("제품정보는 한개 이상 존재해야 합니다.");
			}			
		}
		// 리스트 삭제 누르면 발주합계에서 해당 금액 빼주는 function
		function deleteAmount(num) {
			var deleteUprice = 0;
			var deleteQuantity = 0;
			var totalAmount = removeCommas($('#orderTotalAmount').val())*1;
			deleteUprice = removeCommas($('#prodList-'+num+'-mtOrderPmUprice').val())*1;
			deleteQuantity = removeCommas($('#prodList-'+num+'-mtOrderPmQuantity').val())*1;
			
			//console.log("mtOrderPmUprice * mtOrderPmQuantity =orderAmount ====>"+deleteUprice+" * "+deleteQuantity+" = "+(deleteQuantity*deleteUprice));
			//전체금액에서 삭제금액을 뺀다.
			$('#orderTotalAmount').val(addCommas(totalAmount-(deleteUprice*deleteQuantity)));
			
		}
		
		
		/* 고객사 선택하면 고객담당자 정보 가져오기. */
		$('#mtOrderAcKey').change(function(){
			var checkOrder = false;
			var selectKey;
			$('#mtSaveOrderCheck option').each(function() { 
				if (this.value == $('#mtOrderAcKey').val()) { 
					checkOrder = true;
					selectKey = this.text;
					return false;
				}
			});
			//console.log("checkOrder==========="+checkOrder+" / "+ selectKey);
			if(checkOrder){
				//등록된 백계약 업체가 있는 경우 해당 거래처를 불러온다.
				if(confirm("등록된 거래처가 있습니다. 해당 거래처를 불러오시겠습니까?")){
					var url = '/maintenance/contract/write/backOrderInfoView.do';
					var dialogId = 'program_layer';
					var varParam = {
							"mtIntegrateKey":$('#mtIntegrateKey').val(),
							"selectKey":selectKey
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
				} else {
					//해당 거래처 정보를 지운다.
					$('#mtOrderAcKeyNm').val("");
					$('#mtOrderAcKey').val("");
				}
			} else {
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
						if ( data.acDirectorList.length > 0 ) {						
							$ ('#mtOrderAcDirectorKey' ).find ( 'option' ).remove (); // select box 의 ID 기존의  option항목을 삭제 
							for ( var idx = 0 ; idx < data.acDirectorList.length ; idx++ ) {
	                    		$ ('#mtOrderAcDirectorKey' ).append ( "<option value='"+data.acDirectorList[idx].acDirectorKey+"'>" + data.acDirectorList[idx].acDirectorNm + '</option>' );
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
			}
			
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
		
		//등록된 거래처 정보를 선택하면 해당 등록 내역을 가져온다.
		$('#mtSaveOrderAcKey').change(function(){
			
			/* if("Y" == $('#sbCtYn option:selected').val()){
				$('#back_order').show();
				$('#back_buy').show();
			} else {
				$('#back_order').hide();
				$('#back_buy').hide();
			} */
			
			//console.log("==================>"+$('#mtSaveOrderAcKey option:selected').val())
			var url = '/maintenance/contract/write/backOrderInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":$('#mtIntegrateKey').val(),
					"selectKey":$('#mtSaveOrderAcKey option:selected').val()
			}
			var button = new Array;
			button = [];
			// /* showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  */
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			
		});
		
		//신규업체 백계약 등록.
		function fn_addNewBackOrder(){
			var url = '/maintenance/contract/write/backOrderInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":$('#mtIntegrateKey').val(),
					"btnOption":"newOrder"
			}
			var button = new Array;
			button = [];
			// /* showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  */
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
		}
		
		//유지보수계약 제품 찾기 클릭
		function fn_findMtProduct(obj) {
			var num = $(obj).attr('id').split('-')[1];
			//console.log('/maintenance/contract/popup/mtProductList.do?whereNum='+num+'&selectIntegrateKey='+$('#mtIntegrateKey').val());
			
			window.open('/maintenance/contract/popup/mtProductList.do?searchGubun=backOrderPm&whereNum='+num+'&selectIntegrateKey='+$('#mtIntegrateKey').val()
					,'MT_PRODUCT_POPUP'
					,'width=1000px,height=400,left=600,status=no,title=no,toolbar=no,menubar=no,location=no');
			//window.open('/maintenance/contract/popup/mtProductList.do','','width=1000px,height=400,left=600');
		}
		
		//이전화면으로 이동
		function fn_prevBtn(){
			if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수계약 매출정보 등록화면으로 이동하시겠습니까?")) {
				var url = '/maintenance/contract/write/salesInfoView.do';
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
		
		//다음화면으로 이동
		function fn_nextBtn(){
			if("${mtContractCountInfo.mtBackOrderCnt}" > 0){
				if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수계약 매입정보 등록화면으로 이동하시겠습니까?")) {
					var url = '/maintenance/contract/write/purchaseAmountView.do';
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
			} else {
				alert(" 유지보수계약 백계약정보가 등록되지 않았습니다.\n 유지보수계약 백계약정보를 먼저 등록하세요.");
				return false;
			}						
			
			
		}
		
		
		function fn_saveBtn(){
			var actionTitle;
			var checkDate;
			//필수값 체크를 완료하면 저장 프로세스 시작.
			if ($("#mtBasicForm")[0].checkValidity()){
				
				if ($("#mtListForm")[0].checkValidity()){
					
					checkDate = $("#mtListForm").checkPmDate();
					
					if('' != checkDate) {
						alert(checkDate);
					} else {
						if($('#popSelectKey').val() !=''){
							//수정
							actionTitle = "수정";	
						} else {
							//등록
							actionTitle = "저장";
						}
						if(confirm("유지보수계약 백계약정보를  "+actionTitle+"하시겠습니까?")) {
							//필수값 모두 통과하여 저장 프로세스 호출.
							saveBackOrder();
						} else {
							return false;
						}
					}
					
					
				} else {
					 $("#mtListForm")[0].reportValidity();	
				}				
				
			}  else {
				 //Validate Form
		        $("#mtBasicForm")[0].reportValidity();	
			}
		}
		// 저장
		function saveBackOrder(){
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
			console.log("listData====>"+listData);
			//object["mtWorkProductVoList" = listObject];
           	var sendData = JSON.stringify(object);
           
           	$.ajax({
	        	url:"/maintenance/contract/write/backOrderInfo.do",
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
	            	var paramData = JSON.parse(data);
	            	
	            	
	            	if("Y" == paramData.successYN){
	            		if($('#popSelectKey').val() !=''){
	            			alert("유지보수계약 백계약정보 수정을 성공하였습니다.");
	            			var varParam = {
	            					"mtIntegrateKey":$('#mtIntegrateKey').val(),
	            					"selectKey":$('#mtOrderKey').val()
	            			}
	            			//유지보수계약 백계약 등록화면으로 이동
		            		var url='/maintenance/contract/write/backOrderInfoView.do';
		            		            			
			    			var dialogId = 'program_layer';
			    			//var varParam = paramData
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
	            		} else {
	            			alert("유지보수계약 백계약정보  등록을 성공하였습니다.");
	            			var varParam = {
	            					"mtIntegrateKey":$('#mtIntegrateKey').val(),
	            					"selectKey":paramData.mtOrderKey
	            			}
	            			//유지보수계약 백계약 등록화면으로 이동
		            		var url='/maintenance/contract/write/backOrderInfoView.do';
		            		            			
			    			var dialogId = 'program_layer';
			    			//var varParam = paramData
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
	            		}		            		
		            	
	            	} else {
	            		if($('#popSelectKey').val() !=''){
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
		
		//해당 거래처의 백계약 내용을 삭제한다.
		function fn_deleteBackOrderBtn() {
			var acKeyNm = $('#mtOrderAcKeyNm').val();
			//console.log("selectKey=========>"+$('#popSelectKey').val());
			//console.log("mtOrderAcKeyNm=========>"+$('#mtOrderAcKeyNm').val() );
			if($('#popSelectKey').val() !='') {
				/* if(confirm(acKeyNm+"의 백계약 정보를 삭제하시겠습니까?")){
					var url = '/maintenance/contract/delete/backOrderAll.do';
					var dialogId = 'program_layer';
					var varParam = {
							"mtIntegrateKey":$('#mtIntegrateKey').val(),
							"selectKey":$('#selectKey').val()
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
				} */
				var sendData = {
						"mtIntegrateKey":$('#mtIntegrateKey').val(),
						"selectKey":$('#popSelectKey').val()
				}				
				
				if(confirm(acKeyNm+"의 백계약 정보를 삭제하시겠습니까?")){
					$.ajax({
			        	url:"/maintenance/contract/delete/backOrderAll.do",
			            dataType: 'text', 
			            type:"post",  
						data: JSON.stringify(sendData),
						
			            traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.
			            
			     	   	contentType: "application/json; charset=UTF-8", 
			     	  	beforeSend: function(xhr) {
			     	  		
			        		xhr.setRequestHeader("AJAX", true);	        		
			        	},
			            success:function(data){	
			            	console.log("data==>"+data);
			            	var paramData = JSON.parse(data);
			            	
			            	
			            	if("Y" == paramData.successYN){
			            		alert("유지보수계약 백계약정보  삭제를 성공하였습니다.");
		            			//유지보수계약 백계약 등록화면으로 이동
			            		var url='/maintenance/contract/write/backOrderInfoView.do';
			            		            			
				    			var dialogId = 'program_layer';
				    			var varParam = paramData
				    			var button = new Array;
				    			button = [];
				    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
				            	
			            	} else {
			            		alert("유지보수작업 백계약정보 삭제를 실패하였습니다.");
			            		
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
				
				
			} else {
				alert("삭제할 거래처 정보를 선택하세요.");
			}
			
			
		}	


		function fnUpdateSaleAmount(param) {
			//alert(param);
			$('#updateYn').val(param);
		}
		
		/* function fn_viewSummaryUpAll(){
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
					<li class="colorWhite cursorP" onclick="fn_changeView('basicInfoView');">기본정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('productInfoView');">제품정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('salesInfoView');">매출정보</li>					
					<li class="colorWhite cursorP on">백계약정보</li>
					<li class="colorWhite cursorP" onclick="fn_changeView('purchaseAmountView');">매입정보</li>
			</ul>
		</div>
		
			
			<div class="contents">
				<div>
					<table class="subject1">						
						<tr>      
							<td class="subTitle" style="border-top: none;" colspan="5">
								<label class="ftw400">백계약등록</label>&nbsp;&nbsp;&nbsp;	
								<img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addNewBackOrder();" style="vertical-align: middle"/>
								
								<c:if test="${backOrderBoxList.size() >0 }">
									<select id="mtSaveOrderAcKey" name="mtSaveOrderAcKey" style="width: 200px; height: 30px;">															
										<c:forEach var="order" items="${backOrderBoxList}" varStatus="status">
											<option value="<c:out value="${order.mtOrderKey}"/>"><c:out value="${order.mtAcNm}"/></option>
										</c:forEach>							
									</select>
									<select id="mtSaveOrderCheck"  style="display:none">															
										<c:forEach var="order" items="${backOrderBoxList}" varStatus="status">
											<option value="<c:out value="${order.mtOrderAcKey}"/>"><c:out value="${order.mtOrderKey}"/></option>
										</c:forEach>							
									</select>
								</c:if>
							</td>
							<td style="width: 342px;">
							<c:if test="${mtBackOrderVO.mtOrderKey !=null }">
							유지보수 매입금액 업데이트여부 :
									<input type="radio" class="tCheck" name="checkUpdateYn" value="Y" id="updateYn1" onclick="fnUpdateSaleAmount('Y')"/><label for="updateYn1" class="cursorP" style="width: 22px;height: 22px;"></label>&nbsp;&nbsp;Y&nbsp;&nbsp;
									<input type="radio" class="tCheck" name="checkUpdateYn" value="N" id="updateYn2" onclick="fnUpdateSaleAmount('N')"checked="checked"/><label for="updateYn2" class="cursorP" style="width: 22px;height: 22px;"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
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
						<input type="hidden" id="updateYn" name="updateYn" value="N"/>
						<input type="hidden" id="popSelectKey" name="selectKey" value="<c:out value="${mtBackOrderVO.selectKey}"/>"/>
						<input type="hidden" id="mtOrderKey" name="mtOrderKey" value="<c:out value="${mtBackOrderVO.mtOrderKey}"/>"/>
						
					<table>
						<tr id="tr_account">
							<td class="tdTitle"><label>*</label>매입처</td>
							<td class="tdContents">
								<%-- <input type="text" id="mtOrderAcKeyNm" name="mtOrderAcKeyNm" class="search" value="<c:out value="${mtBackOrderVO.getMtOrderAcKeyNm()}"/>" />	
								<input type="hidden" id="mtOrderAcKey" name="mtOrderAcKey" value="<c:out value="${mtBackOrderVO.getMtOrderAcKey()}"/>"/> --%>	
								<input type="text" id="mtOrderAcKeyNm" name="mtOrderAcKeyNm" style="width: 152px" autocomplete="off" value="<c:out value="${mtBackOrderVO.getMtOrderAcKeyNm()}"/>" required/>
								<input type="hidden" id="mtOrderAcKey" name="mtOrderAcKey"  value="<c:out value="${mtBackOrderVO.getMtOrderAcKey()}"/>"/>
								
							</td>
							<td class="tdTitle"><label>*</label>매입처담당자</td>
							<td class="tdContents">
							<c:choose>
								<c:when test="${mtBackOrderVO.selectKey eq '' ||  mtBackOrderVO.selectKey eq 'null'||  mtBackOrderVO.selectKey eq null}">
									<select id="mtOrderAcDirectorKey" name="mtOrderAcDirectorKey" required>
										<option value="">선택</option>
									</select>
								</c:when>
								<c:otherwise>
									<select id="mtOrderAcDirectorKey" name="mtOrderAcDirectorKey" required>
										<c:forEach var="emp" items="${acDirectorList}" varStatus="status">												
											<option value="<c:out value="${emp.acDirectorKey}"/>"><c:out value="${emp.acDirectorNm}"/></option>
										</c:forEach>
										
									</select>
								</c:otherwise>
							</c:choose> 
								
							</td>
							<td class="tdTitle"><label>*</label>발주일자</td>
							<td class="tdContents">
								<%-- <input type="text" name="mtOrderDt" value="<c:out value="${displayUtil.displayDate(mtBackOrderVO.mtOrderDt)}"/>" class="calendar fromDt" /> --%>	
								<input type="text" name="mtOrderDt" value="<c:out value="${displayUtil.displayDate(mtBackOrderVO.mtOrderDt)}"/>" class="calendar fromDt" style="width: 153px" required/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>부가세 포함</td>
							<td class="tdContents">
								<input type="radio" class="tCheck" name="taxYn" id="prodList-0-hasVAT1" value="Y" checked="checked"/><label for="prodList-0-hasVAT1" class="cursorP"></label>&nbsp;&nbsp;Y&nbsp;&nbsp;
								<input type="radio" class="tCheck" name="taxYn" id="prodList-0-hasVAT2" value="N" /><label for="prodList-0-hasVAT2" class="cursorP"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
							</td>
							<td class="tdTitle"><label>*</label>발주합계</td>
							<td class="tdContents">
								<input type="text"  id="orderTotalAmount" name="mtOrderAmount" amountOnly required value="<c:out value="${displayUtil.commaStr(mtBackOrderVO.mtOrderAmount)}"/>" style="text-align: right;"/>	
							</td>
							<td class="tdTitle"><label>*</label>결제조건</td>
							<td class="tdContents">
								<input type="text" name="mtOrderPayTerms" style="width: 154px" required value="<c:out value="${mtBackOrderVO.mtOrderPayTerms}"/>" />	
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
						<table class="subject2">
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
										<td class="tdTitle firstTd"><label>*</label>제품</td>
										<td class="tdContents firstTd">
											<input type="text" id="prodList-0-mtPmKeyNm" name="mtPmKeyNm" class="search"  onclick="fn_findMtProduct(this)" onkeypress="return false;" required/>	
											<input type="hidden" id="prodList-0-mtPmKey" name="mtPmKey" />
											<input type="hidden" id="prodList-0-mtOrderPmKey" name="mtOrderPmKey"/>	
											<input type="hidden" id="prodList-0-checkStartDt" />
											<input type="hidden" id="prodList-0-checkEndDt" />
											<!-- <input type="text" id="prodList-0-mtPmKey" name="mtPmKey" class="search" />
											<input type="hidden" id="prodList-0-mtPmKeyNm"  name="mtPmKeyNm"/> -->
												
										</td>
										<td class="tdTitle firstTd">시리얼번호</td>
										<td class="tdContents firstTd">
											<input type="text" id="prodList-0-mtPmSerialNum" name="mtPmSerialNum" readonly="readonly"/>	
										</td>
										<td class="tdTitle firstTd"><label>*</label>수량</td>
										<td class="tdContents firstTd">
											<input type="text" id="prodList-0-mtOrderPmQuantity" name="mtOrderPmQuantity" amountOnly class="calculate" style="width: 75px;" required/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
											<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
				                           	<img id="prodList-0-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
										</td>
									</tr>
									<tr class="dpTbRow">
										<td class="tdTitle"><label>*</label>단가</td>
										<td class="tdContents">
											<input type="text" id="prodList-0-mtOrderPmUprice" name="mtOrderPmUprice" amountOnly required class="calculate"/>
										</td>
										<td class="tdTitle">합계</td>
										<td class="tdContents" colspan="3">
											<input type="text" id="prodList-0-totalAmount" name="totalAmount" readonly="readonly" style="text-align: right;"/>
										</td>									
									</tr>
									<tr class="dpTbRow">
										<td class="tdTitle"><label>*</label>계약기간</td>
										<td class="tdContents" colspan="5">
											<input type="text" id="prodList-0-mtStartDt" name="prodList-0-mtStartDt" placeholder="from" class="calendar fromDt" required/> ~ 
											<input type="text" id="prodList-0-mtEndDt" name="prodList-0-mtEndDt" placeholder="to" class="calendar toDt" required/>
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
										<td class="tdTitle firstTd"><label>*</label>제품</td>
										<td class="tdContents firstTd">
											<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmKeyNm" name="mtPmKeyNm" class="search" value="<c:out value="${list.mtPmKeyNm}"/>" required onclick="fn_findMtProduct(this)"/>	
											<input type="hidden" id="prodList-<c:out value="${status.index}"/>-mtPmKey" name="mtPmKey" value="<c:out value="${list.mtPmKey}"/>"/>	
											<input type="hidden" id="prodList-<c:out value="${status.index}"/>-mtOrderPmKey" name="mtOrderPmKey" value="<c:out value="${list.mtOrderPmKey}"/>"/>	
								
											<input type="hidden" id="prodList-<c:out value="${status.index}"/>-checkStartDt" value="<c:out value="${displayUtil.displayDate(list.mtPmStartDt)}"/>"  />
											<input type="hidden" id="prodList-<c:out value="${status.index}"/>-checkEndDt" value="<c:out value="${displayUtil.displayDate(list.mtPmEndDt)}"/>"  />
										</td>
										<td class="tdTitle firstTd">시리얼번호</td>
										<td class="tdContents firstTd">
											<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmSerialNum" name="mtPmSerialNum" readonly="readonly" value="<c:out value="${list.mtPmSerialNum}"/>"/>
										</td>
										<td class="tdTitle firstTd"><label>*</label>수량</td>
										<td class="tdContents firstTd">
											<input type="text" id="prodList-<c:out value="${status.index}"/>-mtOrderPmQuantity" name="mtOrderPmQuantity" amountOnly required class="calculate" style="width: 75px;" value="<c:out value="${displayUtil.commaStr(list.mtOrderPmQuantity)}"/>"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
											<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
				                           	<img id="prodList-<c:out value="${status.index}"/>-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
										</td>
									</tr>
									<tr class="dpTbRow">
										<td class="tdTitle"><label>*</label>단가</td>
										<td class="tdContents">
											<input type="text" id="prodList-<c:out value="${status.index}"/>-mtOrderPmUprice" name="mtOrderPmUprice" amountOnly required class="calculate" value="<c:out value="${displayUtil.commaStr(list.mtOrderPmUprice)}"/>"/>
										</td>
										<td class="tdTitle">합계</td>
										<td class="tdContents" colspan="3">
											<input type="text" id="prodList-<c:out value="${status.index}"/>-totalAmount" name="totalAmount" readonly="readonly" value="<c:out value="${displayUtil.makeMultiNumber(list.mtOrderPmQuantity, list.mtOrderPmUprice)}"/>" style="text-align: right;"/>	
										</td>									
									</tr>
									<tr class="dpTbRow">
										<td class="tdTitle"><label>*</label>계약기간</td>
										<td class="tdContents" colspan="5">
											<input type="text" id="prodList-<c:out value="${status.index}"/>-mtStartDt" name="prodList-<c:out value="${status.index}"/>-mtStartDt" placeholder="from" class="calendar fromDt" required value="<c:out value="${displayUtil.displayDate(list.mtStartDt)}"/>" /> ~ 
											<input type="text" id="prodList-<c:out value="${status.index}"/>-mtEndDt" name="prodList-<c:out value="${status.index}"/>-mtEndDt" placeholder="to" class="calendar toDt" required value="<c:out value="${displayUtil.displayDate(list.mtEndDt)}"/>" />
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
				<div class="btnWrap floatL">
					<div class="floatL">
						<button type="button" onclick="fn_prevBtn();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					</div>
					<div class="floatL btnCenter" >
						<button type="button" onclick="fn_saveBtn();"><img src="<c:url value='/images/btn_save.png'/>" /></button>
						
						<c:if test="${not empty mtBackOrderVO.selectKey}">						
						<button type="button" onclick="fn_deleteBackOrderBtn();"><img src="<c:url value='/images/btn_del.png'/>" /></button>						
						</c:if>
					</div>
					<c:choose>
						<c:when test="${mtContractCountInfo.mtBackOrderCnt>0}">
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
					<%-- <c:if test="${parmMtSbCtYn eq 'Y' and mtContractCountInfo.mtBackOrderCnt>0}">	
					<div class="floatR" >
						<button type="button"><img src="<c:url value='/images/btn_next.png'/>" onclick="fn_nextBtn();"/></button>
					</div>
					</c:if> --%>
					<%-- <c:if test="${updateYn eq 'N' }">					
					<div class="floatR" onclick="fn_saveNextBtn();">
						<button type="button"><img src="<c:url value='/images/btn_del.png'/>" /></button>
					</div>
					</c:if> --%>
					<div class="floatN floatC"></div>
				</div>
			</div>	
		
	</div>
</body>
</html>