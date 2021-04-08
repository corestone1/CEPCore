<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%-- <script src="<c:url value='/js/jquery.serializeObject.js'/>"></script> --%>
	<title>제품정보 등록</title>
	<style>
		.prodTable table {
			border-bottom : 2px solid #e5e5e5;
			width : 844px;
			table-layout: fixed;
		}
		.firstTd {			
			/* border-top: 2px solid #e5e5e5; */	
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
		}
		.popContainer .contents select.wdts {
			width: 135px;
		}
		.popContainer input {
			width: 180px;
			height: 36px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer input[class="search"] {
			height: 36px;
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
			/* width: 174px; */
			font-size: 14px;
		} 				
		.popContainer .contents tr:nth-child(1) td {
			padding-top: 10px;
		} 
		.popContainer .contents td.subTitle {
			font-size: 18px;
			padding-right: 20px;
			width: 70px;
			padding-top: 20px;
			padding-bottom: 5px;
		}	
		.popContainer .contents textarea {
			width: calc(100% - 20px);
			height: 90px;
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
			width: 845px;
		}
		.popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
      	}
		.btnCenter {
			width : calc(100% - 46px);
			text-align: center;
		}
	</style>
	<script>
		$(document).ready(function() {
			/*
			처음 로딩시  저장된 리스트가 3개보다 많으면  모두 접는다.
			1개까지는 스크롤바가 생성되지 않음.
			*/
			'<c:if test="${listCount > 3 }">'
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
							obj[this.name] = this.value; 
							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('mtPmWorkCont' == this.name){
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
	    	/* var forArr = new Array(); */
	    	
	    	var tr = $('.'+type+'Table tr');
	    	var td = tr.children().children();
	    	
	    	
	    	for(var i = 0; i < td.length; i++) {
	    		if(td[i].getAttribute('name') != null && td[i].getAttribute('name') != undefined && td[i].getAttribute('name') != "" && td[i].getAttribute('name').length != 0) {
	    			nameArr.push(td[i].getAttribute('name')); 	    			
	    		}
	    		if(td[i].getAttribute('id') != null && td[i].getAttribute('id') != undefined && td[i].getAttribute('id') != "" && td[i].getAttribute('id').length != 0) {
	    			idArr.push(td[i].getAttribute('id')); 	    			
	    		}
	    		/* if(td[i].getAttribute('for') != null && td[i].getAttribute('for') != undefined && td[i].getAttribute('for') != "" && td[i].getAttribute('for').length != 0) {
	    			forArr.push(td[i].getAttribute('for')); 	    			
	    		} */
	    	}
	    	
	    	var name = type + 'List-' + (lastNum+1) + '-';    
	    	
	    	for(var i = 0; i < nameArr.length; i++) {
	    		
	    		clone.find('input[name="lastNum"]').val(lastNum+1);
				clone.find('input[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val("");
				clone.find('textarea[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 
				clone.find('select[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 
				clone.find('hidden[name="' + nameArr[i]+'"]').attr('name', nameArr[i]).val(""); 
				/* clone.find('input:radio[name="'+ type + 'List[' + originLength + '].' + splitName+'"]').attr('id', name + splitName); */	
					
	    	} 
	    	
	    	for(var i = 0; i < idArr.length; i++) {
	    		var splitName = idArr[i].split('-')[2];
				clone.find('input[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);	
				clone.find('textarea[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);
				clone.find('img[id="'+ type + 'List-' + lastNum + '-' + splitName+'"]').attr('id', name + splitName);	
	    	} 
	    	
	    	/* for(var i = 0; i < forArr.length; i++) {
	    		var splitName = forArr[i].split('.')[1];				
				clone.find('label[for="'+ type + 'List[' + lastNum + '].' + splitName+'"]').attr('for', name + splitName);				
	    	}  */
	    	
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
			var productName;
			var serialNum;
			var deleteKey;
			
			var table = obj.parentNode.parentNode.parentNode.parentNode.parentNode;
			var selectNum = JSON.stringify($(obj.id).selector);
			var originLength = $('#'+type+'Length').val()*1;
			
			if(originLength>1){
				listNum = selectNum.split('-')[1];
				serialNum = $('#prodList-'+listNum+'-mtPmSerialNum').val();
				if(serialNum == ''){
					productName = $('#prodList-'+listNum+'-mtPmKeyNm').val();
				} else {
					productName = $('#prodList-'+listNum+'-mtPmKeyNm').val()+"("+serialNum+")";
				}
				//삭제 key
				deleteKey =  $('#prodList-'+listNum+'-mtWorkSeq').val();
				if(confirm(productName+" 제품정보를 삭제하시겠습니까?")) {
					//삭제key list를 만든다.
					if(deleteKey !=''){
						$('#deleteListKeys').val($('#deleteListKeys').val()+deleteKey+":");
					}
					
					table.remove();
					$('#'+type+'Length').val($('#'+type+'Length').val()*1 - 1);
				}
				
				
				/*
				nextTable.each(function() {
					var num = $(this).find('input[name="lastNum"]').val()*1;
					$(this).find('input[name="lastNum"]').val(num-1);
					 var newName = 'mtWorkProductVoListList[' + (num-1) + '].';
					
					for(var i = 0; i < nameArr.length; i++) {
			    		var splitName = nameArr[i].split('.')[1];
			    		$(this).find('input[name="mtWorkProductVoList[' + (num) + '].' + splitName+'"]').attr('name', newName + splitName);
			    		$(this).find('textarea[name="mtWorkProductVoList[' + (num) + '].' + splitName+'"]').attr('name', newName + splitName); 
			    		$(this).find('select[name="mtWorkProductVoList[' + (num) + '].' + splitName+'"]').attr('name', newName + splitName); 
			    	}  
				});*/
			} else {
				alert("제품정보는 한개 이상 존재해야 합니다.");
			}			   
		}
		
		function fn_saveBtn(){
			var actionTitle;
			if ($("#mtListForm")[0].checkValidity()){
				if($('#rowNum').val()*1 >0){					
					actionTitle = "수정";
				} else {
					actionTitle = "저장";
				}
				
				if(confirm("유지보수작업 제품정보를 "+actionTitle+"하시겠습니까?")) {
					saveProductList(actionTitle);
				} else {
					return false;
				}
			}  else {
				 //Validate Form
		        $("#mtListForm")[0].reportValidity();	
			}
		}
		function saveProductList(actionTitle){
			//var saveUrl;
			var object = {};
			var listObject = new Array();
			var obj = new Object();
           	var formData = $("#mtBasicForm").serializeArray();
           	var listData = $("#mtListForm").serializeObject();
            
           	for (var i = 0; i<formData.length; i++){
                
                object[formData[i]['name']] = formData[i]['value'];
                            
            }
           	//List를 담아준다.			
            object["mtWorkProductVoList"]=listData;           	
			
			//object["mtWorkProductVoList" = listObject];
           	var sendData = JSON.stringify(object);
           	
           	 $.ajax({
	        	url:"/maintenance/work/write/productInfo.do",
	            dataType: 'text', 
	            type:"post",  
	            //data: JSON.stringify({"mtWorkKey":"111111111", "mtWorkProductVoList" :sendData}),
				data: sendData,
				
	            traditional : true, //배열 및 리스트로 값을 넘기기 이해서 꼭 선언해야함.
	            
	     	   	contentType: "application/json; charset=UTF-8", 
	     	  	beforeSend: function(xhr) {
	     	  		//console.log("sendData11=====>"+sendData);
	        		xhr.setRequestHeader("AJAX", true);	        		
	        	},
	            success:function(data){	
	            	var paramData = JSON.parse(data);
	            	//console.log("data.mtWorkKey==>"+paramData.mtWorkKey);
	            	
	            	if("Y" == paramData.successYN){
	            		alert("유지보수작업 제품"+actionTitle+"을 성공하였습니다.");
	            		//유지보수작업 발주 등록화면으로 이동
	            		var url='/maintenance/work/write/productInfoView.do';
	            		            			
		    			var dialogId = 'program_layer';
		    			var varParam = paramData
		    			var button = new Array;
		    			button = [];
		    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		            	/* if('sn'==param){
		            		//유지보수작업 발주 등록화면으로 이동
		            		var url='/maintenance/work/write/orderInfoView.do';
		            		            			
			    			var dialogId = 'program_layer';
			    			var varParam = paramData
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		            	} else {
		            		
		            		document.listForm.action = "/maintenance/work/workList.do";
	        				document.listForm.method="get";
	                   		document.listForm.submit(); 
		            	} */
	            	} else {
	            		alert("유지보수작업 제품"+actionTitle+"을 실패하였습니다.");
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
				} else if(varUrl == "orderInfoView"){
					if(confirm("유지보수작업 발주정보 화면으로 이동하시겠습니까?")){
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
					"mtWorkKey":$('#mtWorkKey').val(),
					"orderCtFkKey":$('#mtWorkKey').val()
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
			if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수작업 기본정보 등록화면으로 이동하시겠습니까?")) {
				var url = '/maintenance/work/write/basicInfoView.do';
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

		//다음화면으로 이동
		function fn_nextBtn(){
			if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수작업 발주정보 등록화면으로 이동하시겠습니까?")) {
				//saveBasicInfo();
				var url = "/maintenance/work/write/orderInfoView.do";
				var dialogId = 'program_layer';
				var varParam = {
						"mtIntegrateKey":$('#mtIntegrateKey').val(),
						"mtWorkKey":$('#mtWorkKey').val(),
						"orderCtFkKey":$('#mtWorkKey').val()
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			} else {
				return false;
			}
		}
		
		//유지보수계약 제품 찾기 클릭
		function fn_findMtProduct(obj) {
			var num = $(obj).attr('id').split('-')[1];
			//console.log('/maintenance/contract/popup/mtProductList.do?whereNum='+num+'&selectIntegrateKey='+$('#mtIntegrateKey').val());
			
			window.open('/maintenance/contract/popup/mtProductList.do?searchGubun=workPm&whereNum='+num+'&selectIntegrateKey='+$('#mtIntegrateKey').val()
					,'MT_PRODUCT_POPUP'
					,'width=1000px,height=410,left=600,status=no,title=no,toolbar=no,menubar=no,location=no');
			//window.open('/maintenance/contract/popup/mtProductList.do','','width=1000px,height=400,left=600');
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
					<li id="work_product" class="colorWhite cursorP on">제품정보</li>
					<c:if test="${mtWorkOrderYn eq 'Y' }">
					<li id="work_order" class="colorWhite cursorP" onclick="fn_changeView('orderInfoView');">발주정보</li>
					</c:if>
					
			</ul>
		</div>
		<form action="/" id="mtBasicForm" name="mtBasicForm"  method="post">
		<c:choose>
			<c:when test="${listCount > 0}">
			<input type="hidden" id="prodLength" name="prodLength" value="<c:out value="${listCount}"/>" />
			</c:when>
			<c:otherwise> 
			<input type="hidden" id="prodLength" name="prodLength" value="1" />
			</c:otherwise>
		</c:choose>
			<input type="hidden" id="mtWorkKey" name="mtWorkKey" value="<c:out value="${mtWorkKey}"/>" />
			<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${mtIntegrateKey}"/>" />
			<input type="hidden" id="rowNum" name="rowNum" value="<c:out value="${listCount}"/>" />
			<input type="hidden" id="deleteListKeys" name="deleteListKeys" />
			<!-- <input type="hidden" id="mtWorkKey" name="mtWorkKey" value="MW200040" />
			<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="MA200006" /> -->
		</form>
		<form action="/" id="mtListForm" name="mtListForm"  method="post">
			<div class="contents">
				<div id="prodWrap">
					<div class="subjectContainer">
						<table class="subject">
							<tr>		
								<td class="subTitle" style="border-top: none;">
									<label class="ftw400">제품정보</label>
								</td>
								<td class="subBtn" style="border-top: none;cursor: pointer;"><img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable();"/></td>
								
							</tr>
						</table>
					</div>
					<c:choose>
						<c:when test="${listCount == 0}">
						<div class="prodTable">
							<input type="hidden" name="lastNum" value="0" />
							<table>
								<tr>
									<td class="tdTitle firstTd">제품</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-0-mtPmKeyNm" name="mtPmKeyNm" class="search" onclick="fn_findMtProduct(this)" autocomplete="off" onkeypress="return false;" required/>	
										<input type="hidden" id="prodList-0-mtPmKey" name="mtPmKey" />
										<input type="hidden" id="prodList-0-mtWorkSeq" name="mtWorkSeq" />
									</td>
									<td class="tdTitle firstTd" style="padding-left:50px">시리얼번호</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-0-mtPmSerialNum"  name="mtPmSerialNum"  style="width: 164px" readonly="readonly"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
										<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
			                        	<img id="prodList-0-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>	
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle">작업내용</td>
									<td class="tdContents" colspan="3"><textarea id="prodList-0-mtPmWorkCont" name="mtPmWorkCont" required></textarea></td>
								</tr>
							</table>
						</div>
						</c:when>
						<c:otherwise>
						<c:forEach var="list" items="${mtWorkProductList}" varStatus="status">
						<div class="prodTable">
							<input type="hidden" name="lastNum" value="<c:out value="${status.index}"/>"/>
							<table>
								<tr>
									<td class="tdTitle firstTd">제품</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmKeyNm" name="mtPmKeyNm" value="<c:out value="${list.mtPmKeyNm}"/>" class="search" onclick="fn_findMtProduct(this)" autocomplete="off" onkeypress="return false;" required/>	
										<input type="hidden" id="prodList-<c:out value="${status.index}"/>-mtPmKey" name="mtPmKey" value="<c:out value="${list.mtPmKey}"/>" />
										
										<input type="hidden" id="prodList-<c:out value="${status.index}"/>-mtWorkSeq" name="mtWorkSeq" value="<c:out value="${list.mtWorkSeq}"/>"/>
									</td>
									<td class="tdTitle firstTd" style="padding-left:50px">시리얼번호</td>
									<td class="tdContents firstTd">
										<input type="text" id="prodList-<c:out value="${status.index}"/>-mtPmSerialNum"  name="mtPmSerialNum" value="<c:out value="${list.mtPmSerialNum}"/>"  style="width: 164px" readonly="readonly"/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
										<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
			                        	<img id="prodList-<c:out value="${status.index}"/>-delete" src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>	
									</td>
								</tr>
								<tr class="dpTbRow">
									<td class="tdTitle">작업내용</td>
									<td class="tdContents" colspan="3"><textarea id="prodList-<c:out value="${status.index}"/>-mtPmWorkCont" name="mtPmWorkCont" required><c:out value="${list.mtPmWorkCont}"/></textarea></td>
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
				<c:if test="${mtWorkOrderYn eq 'Y' }">	
					<div class="floatR" >
						<button type="button" onclick="fn_nextBtn();"><img src="<c:url value='/images/btn_next.png'/>"/></button>
					</div>
				</c:if>
					<div class="floatN floatC"></div>
				</div>
			</div>		
		</form>
	</div>
</body>
</html>