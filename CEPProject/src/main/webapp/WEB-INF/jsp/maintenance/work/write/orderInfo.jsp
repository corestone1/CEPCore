<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>유지보수 작업 발주추가</title>
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
		.popContainer .contents > div {
			margin: 10px 47px 0 45px;
		}
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
		}
		.popContainer .contents select {
			width: 128px;
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
			height: 34px;		
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents2 input[class="numberTy"] {
			width: 27px;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 130px;
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
			width: calc(100% - 22px) !important;
			height: 53px;
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
		
		.popContainer .contents .subject1, .popContainer .contents .subject2 {
			width: 846px;
			background-color: #f6f7fc;			
			/* position: fixed; */
		} 
		.popContainer .contents .subject2 {
			border-bottom: 2px solid #e5e5e5;
			padding-bottom: 0px;
		}
		.popContainer .contents .btnWrap {
			margin: 20px 0px 14px 49px;			
			width : 842px;
			height : 32px;
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
			width : calc(100% - 34px);
			text-align: center;
		}
		#m_div_accountList {
			left: 149px;
    		margin-top: 36px;
		}
		input[type="text"] {
		    width: 138px;
		    height: 31px;
		    border: 1px solid #e9e9e9;    
		    background-color: #fff;
		    font-size: 14px;
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
			overflow-x: hidden;
			
		}
		#prodWrap {
			/* height: 307px; */
			width: 870px;
			overflow-y: auto;
			margin: 0px 47px 0 45px;
		}
		.btnWrap {
			/* margin : 20px 0px -14px 49px;			
			width : 842px;
			height : 50px;
			background-color: #f6f7fc;
			width: calc(100% - 246px);
			margin-top: 613px;
			margin-left: 200px;
			padding-top:20px;
			padding-left: 45px;
			top:25px;
			 */
		}
      	/* .accountList li {
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
			font-size: 14px;
			color: #21a17e;
		} */
		.popContainer .contents #secondTitle {
			margin: -15px 47px 0 45px;
		}
	</style>
	<script>
		$(document).ready(function() {
			
			//매입처 담당자 셋팅
			$('#orderAcDirectorKey').val("${mtWorkOrderVO.orderAcDirectorKey}").attr("selected", "true");
			
			//부가세 포함 라이오버튼 셋팅
			//$('#taxYn').val("${mtBackOrderVO.taxYn}").prop("checked", true);
			//$("input:radio[name='taxYn']:radio[value='${mtWorkOrderVO.taxYn}']").prop('checked', true);
			
			// 등록된 거래처 selectBox 맵핑.
			if(parseInt('${workOrderSelectBox.size()}') >0 ){
				$('#mtSaveOrderAcKey').val("${mtWorkOrderVO.mtOrderKey}").attr("selected", "true");
			}
			
			fn_calculate();
			
			/*
			처음 로딩시  저장된 리스트가 2개보다 많으면  모두 접는다.
			2개까지는 스크롤바가 생성되지 않음.
			*/
			'<c:if test="${listCount > 2 }">'
			fn_viewSummaryUpAll();
			'</c:if>'
			
			//거래처 검색
			/* $("#orderAcKeyNm").on("keydown", function(event){
				
				if(event.keyCode == 13) {						
					fnSearchAccoutList(this, $(this).val());
				}
					
			}); */
			$("#orderAcKeyNm").on("keyup", function(event){
				
				fnSearchAccoutList(this, $(this).val());
					
			});
		}); //end $(document).ready()
		

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
							} else if(this.name =="orderReceiptDt") {
								// 날짜값에서 -를 제거한다.
								obj[this.name] =  removeData(this.value,"-"); 
								//console.log("orderReceiptDt===>"+removeData(this.value,"-"));
							} else {
								obj[this.name] = this.value; 
							}
							
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('orderPmDetail' == this.name){
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
		
		
		//거래처 검색
		var fnSearchAccoutList = function(pObject, pstAccountNm) {
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
			var html = '<div id="m_div_accountList">'
		         + '<ul class="m_accountList">'
		       ;//+ '<div style="margin: 5px;">';
/* 			var html = '<div id="div_accountList" style="width:179px; padding-top: 7px; margin-left: 112px; padding-bottom: 7px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1); position: absolute;">'
			         + '<ul class="accountList">'
			       ;//+ '<div style="margin: 5px;">'; */
			       
			       for(var i=0; i < pjAccountList.length; i++) {
			    	   html += '<li id="m_li_account" title="'+ pjAccountList[i].acKey +'">' + pjAccountList[i].acNm + '</li>'
			    	        ;
			    	}
			       
			       
			    html +=  '</ul>'
			          + '</div>'
			         ;//+ '</div>';
			//$('#td_account').after(html);
			$('#tr_account').after(html);
			
			
			$("[id^='m_li_account']").click(function(event) {
				
				$('#orderAcKeyNm').val(this.innerText); 
				$('#orderAcKey').val(this.title);
				$('#orderAcKey').change();
				$('#m_div_accountList').remove();
			});
		};
	
		/* 고객사 선택하면 고객담당자 정보 가져오기. */
		$('#orderAcKey').change(function(){
			var checkOrder = false;
			var selectKey;
			$('#mtSaveOrderCheck option').each(function() { 
				if (this.value == $('#orderAcKey').val()) { 
					checkOrder = true;
					selectKey = this.text;
					return false;
				}
			});
			//console.log("checkOrder==========="+checkOrder+" / "+ selectKey);
			if(checkOrder){
				//등록된 백계약 업체가 있는 경우 해당 거래처를 불러온다.
				if(confirm("등록된 거래처가 있습니다. 해당 거래처를 불러오시겠습니까?")){
					var url = '/maintenance/work/write/orderInfoView.do';
					var dialogId = 'program_layer';
					var varParam = {
							"mtIntegrateKey":$('#mtIntegrateKey').val(),
							"orderCtFkKey":$('#orderCtFkKey').val(),
							"selectKey":selectKey
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
				} else {
					//해당 거래처 정보를 지운다.
					$('#orderAcKeyNm').val("");
					$('#orderAcKey').val("");
				}
			} else {
				$.ajax({
		        	url:"/maintenance/contract/selectAcDirectorList.do",
		            dataType: 'json',
		            type:"post",  
		            data: $('#orderAcKey').val(),
		     	   	contentType: "application/json; charset=UTF-8",
		     	  	beforeSend: function(xhr) {
		        		xhr.setRequestHeader("AJAX", true);
		        		//xhr.setRequestHeader(header, token);
		        	},
		            success:function(data){		            	
						if ( data.acDirectorList.length > 0 ) {						
							$ ('#orderAcDirectorKey' ).find ( 'option' ).remove (); // select box 의 ID 기존의  option항목을 삭제 
							for ( var idx = 0 ; idx < data.acDirectorList.length ; idx++ ) {
	                    		$ ('#orderAcDirectorKey' ).append ( "<option value='"+data.acDirectorList[idx].acDirectorKey+"'>" + data.acDirectorList[idx].acDirectorNm + '</option>' );
	                  		}
		                }else{
		                	acDirectorList = null;
							$ ( '#orderAcDirectorKey' ).find ( 'option' ).remove ();
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
			
		}); 
		
		
		
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
				
				productName = $('#prodList-'+listNum+'-orderPmFkNm').val();
				
				//삭제 key
				deleteKey =  $('#prodList-'+listNum+'-orderSeq').val();
								
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

			var yetPaymentAmount =($('#yetPaymentAmount').val())*1; 
			var oldMtOrderAmount =($('#oldMtOrderAmount').val())*1; 
			
			
			deleteUprice = removeCommas($('#prodList-'+num+'-orderUprice').val())*1;
			deleteQuantity = removeCommas($('#prodList-'+num+'-orderQuantity').val())*1;
			
			//console.log("mtOrderPmUprice * mtOrderPmQuantity =orderAmount ====>"+deleteUprice+" * "+deleteQuantity+" = "+(deleteQuantity*deleteUprice));
			//전체금액에서 삭제금액을 뺀다.
			$('#orderTotalAmount').val(addCommas(totalAmount-(deleteUprice*deleteQuantity)));
			
			//yetPaymentAmount금액을 계산한다. (yetPaymentAmount+변경된 금액)
			$('#yetPaymentAmount').val( yetPaymentAmount+ ( (totalAmount-(deleteUprice*deleteQuantity))-oldMtOrderAmount) );
			//이전금액셋팅.
			$('#oldMtOrderAmount').val(totalAmount-(deleteUprice*deleteQuantity));
			
			//발주금액이 지급요청금액보다 작으면 경고문구
			if(removeCommas($('#orderTotalAmount').val())*1 <$('#callTotalAmount').val()*1) {
				alert("발주금액("+$('#orderTotalAmount').val()+")이 지급요청금액 ("+addCommas($('#callTotalAmount').val())+") 보다  작아서 해당내용을 수정할 수 없습니다.");
			}
		}
		
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
				//console.log("beforeAmount====>"+beforeAmount);
			});
			
			$(".calculate").blur(function() {
				var num = $(this).attr('id').split('-')[1];
				//console.log("num====>"+num);
				//해당 라인의 수량
				var quantity = removeCommas($("#prodList-"+num+"-orderQuantity").val());
				//해당 라인의 단가.
				var pmUprice = removeCommas($("#prodList-"+num+"-orderUprice").val());				
				//발주합계 금액
				var orderTotalAmount = removeCommas($('#orderTotalAmount').val())*1;
				
				var orderAmount = quantity*pmUprice;
				
				//미지급금액 계산 추가 2021-10-15
				var yetPaymentAmount =($('#yetPaymentAmount').val())*1; 
				var oldMtOrderAmount =($('#oldMtOrderAmount').val())*1; 
				
				//console.log("quantity * pmUprice =orderAmount ====>"+quantity+" * "+pmUprice+" = "+(quantity*pmUprice));
				
				//제품별 계산(단가*수량 = 합계)
				$("#prodList-"+num+"-totalAmount").val(addCommas(orderAmount));
				
				//발주합계 금액 계산
				$('#orderTotalAmount').val(addCommas(orderTotalAmount+(orderAmount-beforeAmount)));
				
				//yetPaymentAmount금액을 계산한다. (yetPaymentAmount+변경된 금액)
				$('#yetPaymentAmount').val( yetPaymentAmount+ ( (orderTotalAmount+(orderAmount-beforeAmount))-oldMtOrderAmount) );
				//이전금액셋팅.
				$('#oldMtOrderAmount').val(orderTotalAmount+(orderAmount-beforeAmount));
				//console.log("num=>"+num);
				//console.log("amount11====>"+ amount+"/"+totalAmount+"/"+beforeAmount);			
				//발주금액이 지급요청금액보다 작으면 경고문구
				if(removeCommas($('#orderTotalAmount').val())*1 <$('#callTotalAmount').val()*1) {
					alert("발주금액("+$('#orderTotalAmount').val()+")이 지급요청금액 ("+addCommas($('#callTotalAmount').val())+") 보다  작아서 해당내용을 수정할 수 없습니다.");
				}
			});
			
		}
		//selectbox에서 등록된 거래처 정보를 선택하면 해당 등록 내역을 가져온다.
		$('#mtSaveOrderAcKey').change(function(){

			var url = '/maintenance/work/write/orderInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":$('#mtIntegrateKey').val(),
					"orderCtFkKey":$('#orderCtFkKey').val(),
					"selectKey":$('#mtSaveOrderAcKey option:selected').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			
		});
		
		/**
		*  화면을 이동시킨다.
		*  @param {string} varUrl 이동해야할 url
		*/
		function fn_changeView(varUrl) {
			var url;
			if($('#mtWorkKey').val() !="") {
				if(varUrl == "basicInfoView"){
					if(confirm("유지보수작업 기본정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/work/write/'+varUrl+'.do';
					} else {
						return false;
					}
				} else if(varUrl == "productInfoView"){
					if(confirm("유지보수작업 장비별작업정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/work/write/'+varUrl+'.do';
					} else {
						return false;
					}
				}
			} else {
				alert("유지보수작업 기본정보가 등록되지 않아 화면을 이동할 수 없습니다.");
				return false;				
			}
			
			if(url != "") {
				
				var dialogId = 'program_layer';
				var varParam = {
					"mtIntegrateKey": $('#mtIntegrateKey').val(),
					"mtWorkKey":$('#mtWorkKey').val()
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			} else {

				return false;
			}	
		}
		
		//이전화면으로 이동
		function fn_prevBtn(){
			var whereMsg;
			var whereUrl;
			if("Y" == $('#sv_mtWorkPmYn').val()){
				whereMsg = "장비별작업정보";
				whereUrl = "/maintenance/work/write/productInfoView.do";
			} else {
				whereMsg = "기본정보";
				whereUrl = "/maintenance/work/write/basicInfoView.do";
			}
			if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수작업 "+whereMsg+" 등록화면으로 이동하시겠습니까?")) {
				var url = whereUrl;
				var dialogId = 'program_layer';
				var varParam = {
						"mtIntegrateKey":$('#mtIntegrateKey').val(),
						"mtWorkKey":$('#mtWorkKey').val()
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			} else {
				return false;
			}
			
		}		


		//신규업체  발주 등록.
		function fn_addNewOrder(){
			var url = '/maintenance/work/write/orderInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":$('#mtIntegrateKey').val(),
					"orderCtFkKey":$('#orderCtFkKey').val(),
					"btnOption":"newOrder"
			}
			var button = new Array;
			button = [];
			// /* showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  */
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
		}
		
		
		function fn_saveBtn(){
			var actionTitle;
			var checkDate;
			
			if(removeCommas($('#orderTotalAmount').val())*1 >= $('#callTotalAmount').val()*1) {
				//필수값 체크를 완료하면 저장 프로세스 시작.
				if ($("#mtBasicForm")[0].checkValidity()){
					
					if ($("#mtListForm")[0].checkValidity()){
						
						if($('#popSelectKey').val() !=''){
							//수정
							actionTitle = "수정";	
						} else {
							//등록
							actionTitle = "저장";
						}
						if(confirm("유지보수작업 발주정보를  "+actionTitle+"하시겠습니까?")) {
							//필수값 모두 통과하여 저장 프로세스 호출.
							saveWorkOrder();
							//var listData = $("#mtListForm").serializeObject();
						} else {
							return false;
						}
						
						
					} else {
						 $("#mtListForm")[0].reportValidity();	
					}				
					
				}  else {
					if($('#billPurchaseCd').val()=='') {
						alert("매입 구분을 먼저 선택하세요!!")
					} else if($('#billMfCd').val()=='') {
						alert("제조사 구분을 먼저 선택하세요!!")
					} else {
						 //Validate Form
				        $("#mtBasicForm")[0].reportValidity();	
					}
					 //Validate Form
			       // $("#mtBasicForm")[0].reportValidity();	
				}
			} else {
				//발주금액이 지급요청금액보다 작으면 경고문구
				alert("발주금액("+$('#orderTotalAmount').val()+")이 지급요청금액 ("+addCommas($('#callTotalAmount').val())+") 보다  작아서 해당내용을 수정할 수 없습니다.");
			}
			
		}
		// 저장
		function saveWorkOrder(){
			//계속 저장버튼 기능 정의 
			$('#btnOption').val('ss');
			//백계약정보를 저장한다.
			var object = {};
			var listObject = new Array();
			var obj = new Object();
           	var formData = $("#mtBasicForm").serializeArray();
           	var listData = $("#mtListForm").serializeObject();
            
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
           	//백계약 제품List를 담아준다.			
            object["mtOrderProductVoList"]=listData;
			console.log("listData====>"+listData);
			//object["mtWorkProductVoList" = listObject];
           	var sendData = JSON.stringify(object);
           
           	$.ajax({
	        	url:"/maintenance/work/write/orderInfo.do",
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
	            			alert("유지보수작업 발주정보 수정을 성공하였습니다.");
	            			var varParam = {
	            					"mtIntegrateKey":$('#mtIntegrateKey').val(),
	            					"orderCtFkKey":$('#orderCtFkKey').val(),
	            					"selectKey":$('#mtOrderKey').val()
	            			}
	            			//유지보수작업 발주 등록화면으로 이동
		            		var url='/maintenance/work/write/orderInfoView.do';
		            		            			
			    			var dialogId = 'program_layer';
			    			//var varParam = paramData
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
	            		} else {
	            			alert("유지보수작업 발주정보  등록을 성공하였습니다.");
	            			var varParam = {
	            					"mtIntegrateKey":$('#mtIntegrateKey').val(),
	            					"orderCtFkKey":$('#orderCtFkKey').val(),
	            					"selectKey":paramData.mtOrderKey
	            			}
	            			//유지보수계약 백계약 등록화면으로 이동
		            		var url='/maintenance/work/write/orderInfoView.do';
		            		            			
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
		
		//해당 거래처의 발주 내용을 삭제한다.
		function fn_deleteWorkOrderBtn() {
			var acKeyNm = $('#orderAcKeyNm').val();
			//console.log("selectKey=========>"+$('#popSelectKey').val());
			//console.log("mtOrderAcKeyNm=========>"+$('#mtOrderAcKeyNm').val() );
			if($('#callTotalAmount').val()*1 > 0) {
				//지급요청금액이 존재하면 삭제할 수 없다.
				alert("지급요청금액 ("+addCommas($('#callTotalAmount').val())+")이 존재하여 삭제할 수 없습니다.");
			} else {
				if($('#popSelectKey').val() !='') {
					var sendData = {
							"mtIntegrateKey":$('#mtIntegrateKey').val(),
	    					"orderCtFkKey":$('#orderCtFkKey').val(),
							"selectKey":$('#popSelectKey').val()
					}				
					
					if(confirm(acKeyNm+"의 발주 정보를 삭제하시겠습니까?")){
						$.ajax({
				        	url:"/maintenance/work/delete/workOrder.do",
				            dataType: 'text', 
				            type:"post",  
							data: JSON.stringify(sendData),
							
				            traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.
				            
				     	   	contentType: "application/json; charset=UTF-8", 
				     	  	beforeSend: function(xhr) {
				     	  		
				        		xhr.setRequestHeader("AJAX", true);	        		
				        	},
				            success:function(data){	
				            	//console.log("data==>"+data);
				            	var paramData = JSON.parse(data);
				            	
				            	
				            	if("Y" == paramData.successYN){
				            		alert("유지보수작업 발주정보  삭제를 성공하였습니다.");
			            			//유지보수계약 백계약 등록화면으로 이동
				            		var url='/maintenance/work/write/orderInfoView.do';
				            		            			
					    			var dialogId = 'program_layer';
					    			var varParam = paramData
					    			var button = new Array;
					    			button = [];
					    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
					            	
				            	} else {
				            		alert("유지보수작업 발주정보 삭제를 실패하였습니다.");
				            		
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
			
			
			
		}	
		
		//유지보수작업 발주 제품 찾기 클릭
		function fn_findOrderProduct(obj) {
			var num = $(obj).attr('id').split('-')[1];
			//console.log('/maintenance/contract/popup/mtProductList.do?whereNum='+num+'&selectIntegrateKey='+$('#mtIntegrateKey').val());
			
			/* window.open('/maintenance/contract/popup/mtProductList.do?whereNum='+num+'&selectIntegrateKey='+$('#mtIntegrateKey').val()
					,'MT_PRODUCT_POPUP'
					,'width=1000px,height=400,left=600,status=no,title=no,toolbar=no,menubar=no,location=no'); */
			//window.open('/mngCommon/product/popup/searchListPopup.do?returnType=O&returnKey=prodList-'+num+'-orderPmFkKey&returnNm=prodList-'+num+'-orderPmFkNm','PRODUCT_LIST','width=1000px,height=713px,left=600');	
			window.open('/mngCommon/product/popup/searchListPopup.do?pmNmDomId='+obj.id+'&pmKeyDomId='+obj.nextElementSibling.id+'&returnType=O','PRODUCT_LIST','width=1000px,height=713px,left=600');
		}


		function fnUpdateSaleAmount(param) {
			//alert(param);
			$('#updateYn').val(param);
		}
		
		//발주합계금액 readOnly해제.
		function fn_editTotalAmount() {
			//console.log('--1111111111111111');
			document.getElementById('orderTotalAmount').readOnly = false;
			$('#orderTotalAmount').css('background-color',"#fff");
			alert("발주합계 금액 읽기전용을 해제하여 금액수정이 가능합니다.!!");
			//console.log('11222222222222');
			
		}
	</script>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">유지보수작업 등록</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
				<li class="colorWhite cursorP" onclick="fn_changeView('basicInfoView');">기본정보</li>
				<c:if test="${mtWorkPmYn eq 'Y' }">
				<li class="colorWhite cursorP" onclick="fn_changeView('productInfoView');">장비별작업정보</li>
				</c:if>
				<li class="colorWhite cursorP on">발주정보</li>
			</ul>
		</div>
		
		<div class="contents">
			<div>
				<table class="subject1">
					<tr>		
						<td class="subTitle" style="border-top: none;" >
							<label class="ftw500">발주등록</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- </td>
						<td class="subTitle" colspan="5"  style="border-top: none;"> -->
						<img src="<c:url value='/images/btn_add-pop.png'/>" onclick="fn_addNewOrder();"  style="vertical-align: middle;cursor: pointer;"/>				
							
						<c:if test="${workOrderSelectBox.size() >0 }">
							<select id="mtSaveOrderAcKey" name="mtSaveOrderAcKey" style="width: 200px; height: 30px;">															
								<c:forEach var="order" items="${workOrderSelectBox}" varStatus="status">
									<option value="<c:out value="${order.mtOrderKey}"/>"><c:out value="${order.mtAcNm}"/></option>
								</c:forEach>							
							</select>
							<select id="mtSaveOrderCheck"  style="display:none">															
								<c:forEach var="order" items="${workOrderSelectBox}" varStatus="status">
									<option value="<c:out value="${order.orderAcKey}"/>"><c:out value="${order.mtOrderKey}"/></option>
								</c:forEach>							
							</select>
						</c:if>
						</td>
					</tr>
				</table>	
				<form action="/" id="mtBasicForm" name="mtBasicForm" method="post"> 
					<input type="hidden" id="prodLength" name="prodLength" value="<c:out value="${listCount}"/>" />
					<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${mtIntegrateKey}"/>" />
					<input type="hidden" id="mtWorkKey" name="mtWorkKey" value="<c:out value="${mtWorkOrderVO.orderCtFkKey}"/>" />
					<input type="hidden" id="orderCtFkKey" name="orderCtFkKey" value="<c:out value="${orderCtFkKey}"/>" />
					<input type="hidden" id="sv_mtWorkPmYn" name="sv_mtWorkPmYn" value="<c:out value="${mtWorkPmYn}"/>"/>
					<input type="hidden" id="btnOption" name="btnOption" />
					<input type="hidden" id="popSelectKey" name="selectKey" value="<c:out value="${mtWorkOrderVO.selectKey}"/>"/>
					<input type="hidden" id="mtOrderKey" name="mtOrderKey" value="<c:out value="${mtWorkOrderVO.mtOrderKey}"/>"/>
					
					<input type="hidden" id="oldMtOrderAmount" name="oldMtOrderAmount" value="<c:out value="${mtWorkOrderVO.orderAmount}"/>"/>
					<input type="hidden" id="yetPaymentAmount" name="yetPaymentAmount" value="<c:out value="${mtWorkOrderVO.yetPaymentAmount}"/>"/>						
					<input type="hidden" id="callTotalAmount" name="callTotalAmount" value="<c:out value="${mtWorkOrderVO.callTotalAmount}"/>"/>
					<table style="width:860px;">
						<tr>
							<td class="tdTitle" style="width:138px;"><label>*</label> 매입처</td>
							<td class="tdContents">
								<input type="text" id="orderAcKeyNm" name="orderAcKeyNm"  class="search"  style="width: 163px" autocomplete="off" value="<c:out value="${mtWorkOrderVO.orderAcKeyNm}"/>" required/>
								<input type="hidden" id="orderAcKey" name="orderAcKey"  value="<c:out value="${mtWorkOrderVO.orderAcKey}"/>"/>	
							</td>
							<td class="tdTitle"><label>*</label> 매입담당자 </td>
							<td class="tdContents">
							<c:choose>
								<c:when test="${acDirectorList eq '' ||  acDirectorList.size() eq ''||  acDirectorList.size() eq '0'}">
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
							<td class="tdTitle" style="width:50px; max-width:50px;"><label>*</label> 매입구분</td>
							<td class="tdContents" id="tr_account" style="width:239px;">
								<select id="billPurchaseCd" name="billPurchaseCd" style="width:115px;" required>
									<option value="" style="color:#bec3c9;">매입구분</option>
									<c:forEach var="billPurchaseCode" items="${purchaseCodeList}" varStatus="status1">			
									<c:choose>
										<c:when test='${mtWorkOrderVO.billPurchaseCd == billPurchaseCode.cdKey}'>
										<option value="<c:out value="${billPurchaseCode.cdKey}"/>" selected="selected"><c:out value="${billPurchaseCode.cdNm}"/></option>
										</c:when>
										<c:otherwise>
										<option value="<c:out value="${billPurchaseCode.cdKey}"/>"><c:out value="${billPurchaseCode.cdNm}"/></option>
										</c:otherwise>
									
									</c:choose>										
									</c:forEach>	
								</select>
								<select id="billMfCd" name="billMfCd" style="width:120px;" required>
									<option value="" style="color:#bec3c9;">제조사</option>
									
									<c:forEach var="billMfCd" items="${manufacturerList}" varStatus="status2">										
									<c:choose>
										<c:when test='${mtWorkOrderVO.billMfCd == billMfCd.codeKey}'>
										<option value="<c:out value="${billMfCd.codeKey}"/>" selected="selected"><c:out value="${billMfCd.codeNm}"/></option>
										</c:when>
										<c:otherwise>
										<option value="<c:out value="${billMfCd.codeKey}"/>"><c:out value="${billMfCd.codeNm}"/></option>
										</c:otherwise>
									</c:choose>
									</c:forEach>	
								</select>	
							</td>
						</tr>
						<tr>
							<!-- <td class="tdTitle"><label>*</label> 부가세 포함</td>
							<td class="tdContents">
								<input type="radio" class="tRadio" name="taxYn" id="prodList-0-hasVAT1" value="Y" /><label for="prodList-0-hasVAT1" class="cursorP"></label>&nbsp;&nbsp;Y&nbsp;&nbsp;
								<input type="radio" class="tRadio" name="taxYn" id="prodList-0-hasVAT2" value="N" checked="checked"/><label for="prodList-0-hasVAT2" class="cursorP"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
							</td> -->
							<td class="tdTitle"><label>*</label> 발주합계<button type="button" onclick="fn_editTotalAmount();"><img src="<c:url value='/images/edit_icon.png'/>" style="width: 19px;vertical-align: middle;margin-bottom: 1px;margin-left: 4px;"/></button></td>
							<td class="tdContents">
								<input type="text"  id="orderTotalAmount" name="orderAmount" readOnly amountOnly required value="<c:out value="${displayUtil.commaStr(mtWorkOrderVO.orderAmount)}"/>" style="width: 163px;text-align: right;background-color: #e9e9e9;"/>	
							</td>
							<td class="tdTitle"><label>*</label> 발주일자</td>
							<td class="tdContents">
								<%-- <input type="text" name="mtOrderDt" value="<c:out value="${displayUtil.displayDate(mtBackOrderVO.mtOrderDt)}"/>" class="calendar fromDt" /> --%>	
								<input type="text" name="orderDt" value="<c:out value="${displayUtil.displayDate(mtWorkOrderVO.orderDt)}"/>" class="calendar fromDt" style="width: 105px" required/>
							</td>
							<td class="tdTitle"><label>*</label> 결제조건</td>
							<td class="tdContents" colspan="3">
								<input type="text" name="orderPayTerms" style="width: 217px" required value="<c:out value="${mtWorkOrderVO.orderPayTerms}"/>" />	
							</td>
						</tr>
					</table>
				</form>
			</div>	
			<form action="/" id="mtListForm" name="mtListForm"  method="post">			
				<div id="secondTitle">	
					<table class="subject2">
						<tr>		
							<td class="subTitle" style="border-top: none;"  colspan="5">
								<label class="ftw500">제품정보</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- </td>
							<td class="subTitle" colspan="5"  style="border-top: none;"> -->
								<img src="<c:url value='/images/btn_add-pop.png'/>" onclick="fn_addInfoTable();" style="vertical-align: middle;cursor: pointer;"/>
							</td>
						</tr>
					</table>
				</div>
				<div id="prodWrap">
					<c:choose>
						<c:when test="${mtWorkOrderVO.mtOrderProductVoList eq null ||  mtWorkOrderVO.mtOrderProductVoList == ''||  mtWorkOrderVO.mtOrderProductVoList.size()== 0}">
						<div class="prodTable">
							<input type="hidden" name="lastNum" value="0" />
							<table>
								<tr>
									<td class="tdTitle firstTd"><label>*</label> 제품</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-0-orderPmFkNm" name="orderPmFkNm" class="search" onclick="fn_findOrderProduct(this)" onkeypress="return false;" required/>	
										<input type="hidden" id="prodList-0-orderPmFkKey" name="orderPmFkKey"/>	
										<input type="hidden" id="prodList-0-orderSeq" name="orderSeq"/>	
									</td>
									<td class="tdTitle firstTd">&nbsp;&nbsp;합계</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-0-totalAmount" name="totalAmount" readonly="readonly" style="text-align: right;" />	
									</td>
									<td class="tdTitle firstTd"><label>*</label> 수량</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-0-orderQuantity" name="orderQuantity" amountOnly class="calculate" style="width: 75px;" required/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
										<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
			                        	<img id="prodList-0-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>	
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label> 단가</td>
									<td class="tdContents">
										<input type="text" id="prodList-0-orderUprice" name="orderUprice" amountOnly class="calculate" required/>
									</td>	
									<td class="tdTitle"><label>*</label> 입고일자</td>
									<td class="tdContents" colspan="3">
										<input type="text" id="prodList-0-orderReceiptDt" name="orderReceiptDt"  class="calendar toDt" required/>
									</td>
									<%-- <td class="tdTitle"><label>*</label> 매입구분</td>
									<td class="tdContents">
										<select id="prodList-0-orderKind" name="orderKind" required>
										<c:forEach var="code" items="${orderKindCodeList}" varStatus="status">												
											<option value="<c:out value="${code.cdKey}"/>"><c:out value="${code.cdNm}"/></option>
										</c:forEach>	
										</select>		
									</td> --%>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle lastTd">제품상세</td>
									<td class="tdContents lastTd" colspan="5"><textarea id="prodList-0-orderPmDetail" name="orderPmDetail"></textarea></td>
								</tr>
									
							</table>
						</div>
						</c:when>
						<c:otherwise>
						<c:forEach var="list" items="${mtWorkOrderVO.mtOrderProductVoList}" varStatus="status">
						<div class="prodTable">
							<input type="hidden" name="lastNum" value="<c:out value="${status.index}"/>" />
							<table>
								<tr>
									<td class="tdTitle firstTd"><label>*</label> 제품</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-orderPmFkNm" name="orderPmFkNm" value="<c:out value="${list.orderPmFkNm}"/>" class="search" onclick="fn_findOrderProduct(this)" onkeypress="return false;" required/>	
										<input type="hidden" id="prodList-<c:out value="${status.index}"/>-orderPmFkKey" name="orderPmFkKey" value="<c:out value="${list.orderPmFkKey}"/>"/>	
										<input type="hidden" id="prodList-<c:out value="${status.index}"/>-orderSeq" name="orderSeq" value="<c:out value="${list.orderSeq}"/>"/>	
									</td>
									<td class="tdTitle firstTd">&nbsp;&nbsp;합계</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-totalAmount" name="totalAmount" readonly="readonly" value="<c:out value="${displayUtil.makeMultiNumber(list.orderQuantity, list.orderUprice)}"/>" style="text-align: right;" />	
									</td>
									<td class="tdTitle firstTd"><label>*</label> 수량</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-orderQuantity" name="orderQuantity" amountOnly class="calculate" style="width: 75px;" value="<c:out value="${displayUtil.commaStr(list.orderQuantity)}"/>" required/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
										<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
			                        	<img id="prodList-<c:out value="${status.index}"/>-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>	
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle"><label>*</label> 단가</td>
									<td class="tdContents">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-orderUprice" name="orderUprice" amountOnly class="calculate" value="<c:out value="${displayUtil.commaStr(list.orderUprice)}"/>" required/>
									</td>	
									<td class="tdTitle"><label>*</label> 입고일자</td>
									<td class="tdContents" colspan="3">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-orderReceiptDt" name="orderReceiptDt"  class="calendar toDt" value="<c:out value="${displayUtil.displayDate(list.orderReceiptDt)}"/>"  required/>
									</td>
									<%-- <td class="tdTitle"><label>*</label> 매입구분</td>
									<td class="tdContents">
										<select id="prodList-<c:out value="${status.index}"/>-orderKind" name="orderKind" value="<c:out value="${list.orderKind}"/>" required>	
										<c:forEach var="code2" items="${orderKindCodeList}" >												
											<option value="<c:out value="${code2.cdKey}"/>" <c:if test='${list.orderKind == code2.cdKey}'>selected</c:if>><c:out value="${code2.cdNm}"/></option>
										</c:forEach>											
											<option value="HW" <c:if test='${list.orderKind== "HW"}'>selected</c:if>>하드웨어</option>
											<option value="SW" <c:if test='${list.orderKind== "SW"}'>selected</c:if>>소프트웨어</option>
											<option value="SV" <c:if test='${list.orderKind== "SV"}'>selected</c:if>>서비스</option>
											<option value="ET" <c:if test='${list.orderKind== "ET"}'>selected</c:if>>기타</option>
										</select>		
									</td> --%>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle lastTd">제품상세</td>
									<td class="tdContents lastTd" colspan="5">
										<textarea id="prodList-<c:out value="${status.index}"/>-orderPmDetail" name="orderPmDetail"><c:out value="${list.orderPmDetail}"/></textarea>
									</td>
								</tr>
									
							</table>
						</div>
						</c:forEach>
						</c:otherwise>
					</c:choose>
					</div>
			</form>
			
			
			<div class="btnWrap floatL">
				<div class="floatL">
					<button type="button" onclick="fn_prevBtn();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
				</div>
				<div class="floatL btnCenter">
					<button type="button" onclick="fn_saveBtn();"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					<c:if test="${not empty mtWorkOrderVO.selectKey}">						
					<button type="button" onclick="fn_deleteWorkOrderBtn();"><img src="<c:url value='/images/btn_del.png'/>" /></button>						
					</c:if>
				</div>
				<div class="floatN floatC"></div>
			</div>
		</div>
	</div>
</body>
</html>