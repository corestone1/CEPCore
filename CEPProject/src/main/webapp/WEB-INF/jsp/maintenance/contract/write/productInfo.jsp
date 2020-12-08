<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>제품정보 등록</title>
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
	</style>
	<script>
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
	    		if(td[i].getAttribute('for') != null && td[i].getAttribute('for') != undefined && td[i].getAttribute('for') != "" && td[i].getAttribute('for').length != 0 && td[i].getAttribute('class').includes('calendar')) {
	    			$(this).attr('id','');
	    		} 
	    	}
	    	
	    	var name = type + 'List[' + (lastNum+1) + '].';
	    	
	    	for(var i = 0; i < nameArr.length; i++) {
	    		var splitName = nameArr[i].split('.')[1];
	    		clone.find('input[name="lastNum"]').val(lastNum+1);
				clone.find('input[name="'+ type + 'List[' + lastNum + '].' + splitName+'"]').attr('name', name + splitName).val("");
				clone.find('textarea[name="'+ type + 'List[' + lastNum + '].' + splitName+'"]').attr('name', name + splitName).val(""); 
				clone.find('select[name="'+ type + 'List[' + lastNum + '].' + splitName+'"]').attr('name', name + splitName); 
				/* clone.find('input:radio[name="'+ type + 'List[' + originLength + '].' + splitName+'"]').attr('id', name + splitName); */	
					
	    	} 
	    	
	    	for(var i = 0; i < idArr.length; i++) {
	    		var splitName = idArr[i].split('.')[1];
				clone.find('input[id="'+ type + 'List[' + lastNum + '].' + splitName+'"]').attr('id', name + splitName);				
	    	} 
	    	
	    	for(var i = 0; i < forArr.length; i++) {
	    		var splitName = forArr[i].split('.')[1];				
				clone.find('label[for="'+ type + 'List[' + lastNum + '].' + splitName+'"]').attr('for', name + splitName);				
	    	} 
	    	
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
			
			for(var i = 0; i < td.length; i++) {
	    		if(td[i].getAttribute('name') != null && td[i].getAttribute('name') != undefined && td[i].getAttribute('name') != "" && td[i].getAttribute('name').length != 0) {
	    			nameArr.push(td[i].getAttribute('name')); 	   
	    		}
	    	}
			
			var originLength = $('#'+type+'Length').val()*1;
			if(originLength>1){
				table.remove();
				$('#'+type+'Length').val($('#'+type+'Length').val()*1 - 1);
				
				nextTable.each(function() {
					var num = $(this).find('input[name="lastNum"]').val()*1;
					$(this).find('input[name="lastNum"]').val(num-1);
					var newName = type + 'List[' + (num-1) + '].';
					
					for(var i = 0; i < nameArr.length; i++) {
			    		var splitName = nameArr[i].split('.')[1];
			    		$(this).find('input[name="'+ type + 'List[' + (num) + '].' + splitName+'"]').attr('name', newName + splitName);
			    		$(this).find('textarea[name="'+ type + 'List[' + (num) + '].' + splitName+'"]').attr('name', newName + splitName); 
			    		$(this).find('select[name="'+ type + 'List[' + (num) + '].' + splitName+'"]').attr('name', newName + splitName); 
			    	} 
				});
			} else {
				alert("제품정보는 한개 이상 존재해야 합니다.");
			}			   
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
					<li class="colorWhite cursorP" onclick="fn_addView('writeMtBasicInfoView');">기본정보</li>
					<li class="colorWhite cursorP on">제품정보</li>
					<li class="colorWhite cursorP">매출정보</li>					
					<li class="colorWhite cursorP">발주정보</li>
					<li class="colorWhite cursorP">매입정보</li>
			</ul>
		</div>
		<form action="/" id="uploadForm" method="post"> 
			<input type="hidden" id="prodLength" name="prodLength" value="1" />
			<input type="hidden" value='<c:out value="${resultList.id}"/>'>
			<div class="contents">
				<div id="prodWrap">
					<div class="subjectContainer">
						<table class="subject">
							<tr>		
								<td class="subTitle" style="border-top: none;">
									<label class="ftw400">제품정보</label>
								</td>
								<td class="subBtn" style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable();"/></td>
								<td class="subBtn" colspan="5"  style="border-top: none;"><img class="floatR" src="<c:url value='/images/icon_project.png'/>" onclick="fn_addInfoTable();"/></td>
							</tr>
						</table>
					</div>
					<div class="prodTable">
						<input type="hidden" name="lastNum" value="0" />
						<table>
							<tr>
								<td class="tdTitle firstTd">제품</td>
								<td class="tdContents firstTd">
									<input type="text" name="prodList[0].mtOrderPmNm"class="search" />	
									<input type="hidden" name="prodList[0].mtOrderPmKey"/>	
								</td>
								<td class="tdTitle firstTd">합계</td>
								<td class="tdContents firstTd">
									<input type="text" name="prodList[0].totalAmount" />	
								</td>
								<td class="tdTitle firstTd">수량</td>
								<td class="tdContents firstTd">
									<input type="text" name="prodList[0].mtOrderPmQuantity" style="width: 75px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
									<img src="<c:url value='/images/arrow_up.png'/>" class="down" onclick="fn_viewSummary(this);" style="width: 13px"/>&nbsp;&nbsp;&nbsp;
		                        	<img src="<c:url value='/images/popup_close.png'/>" onclick="fn_delete(this, 'prod');" style="width: 11px"/>
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">단가</td>
								<td class="tdContents">
									<input type="text" name="prodList[0].mtOrderPmUprice"/>
								</td>	
								<td class="tdTitle">부가세 포함</td>
								<td class="tdContents">
									<input type="radio" class="tCheck" name="prodList[0].taxYn" id="prodList[0].hasVAT1" /><label for="prodList[0].hasVAT1" class="cursorP"></label>&nbsp;&nbsp;Y&nbsp;&nbsp;
									<input type="radio" class="tCheck" name="prodList[0].taxYn" id="prodList[0].hasVAT2" /><label for="prodList[0].hasVAT2" class="cursorP"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
								</td>
								<td class="tdTitle">시리얼번호</td>
								<td class="tdContents">
									<input type="text" name="prodList[0].mtSerialNo" />	
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">계약기간</td>
								<td class="tdContents" colspan="3">
									<input type="text" value="2020-12-12" class="calendar fromDt" />&nbsp;&nbsp;~&nbsp;&nbsp;<input type="text" value="2020-12-12" class="calendar toDt" />
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">상세정보</td>
								<td class="tdContents" colspan="5"><textarea name="prodList[0].mtPmDetail" readonly="readonly"></textarea></td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle lastTd">비고</td>
								<td class="tdContents lastTd" colspan="5"><textarea name="prodList[0].mtRemark" readonly="readonly"></textarea></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="btnWrap floatR">
					<div class="floatR" onclick="fn_addView('writeMtSalesInfo');">
						<button type="button"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>		
		</form>
	</div>
</body>
</html>