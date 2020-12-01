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
			margin-bottom: 3px;
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
		.popContainer .salesTable table {
			border-bottom: 2px solid #e5e5e5;
			padding-bottom: 13px;
			margin-top: 5px;
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
		.popContainer tr.sum td {
			padding-top: 15px;
		}		
		.popContainer tr.sum td label {
			color: #32bc94;
		}		
		.popContainer .contents tr:nth-child(1) td {
			padding-top: 10px;
		} 
		.popContainer .contents td.subTitle {
			font-size: 18px;
			padding-right: 20px;
			width: 91px;
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
		function fn_addInfoTable(type) {
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
					<li class="colorWhite cursorP" onclick="fn_addView('writeMtProductInfo');">제품정보</li>
					<li class="colorWhite cursorP on">매출정보</li>					
					<li class="colorWhite cursorP">발주정보</li>
					<li class="colorWhite cursorP">매입정보</li>
			</ul>
		</div>
		<form action="/" id="uploadForm" method="post"> 
			<input type="hidden" id="salesLength" name="salesLength" value="1" />
			<input type="hidden" value='<c:out value="${resultList.id}"/>'>
			<div class="contents">
				<div id="salesWrap">
					<div class="subjectContainer">
						<table class="subject">
							<tr>		
								<td class="subTitle" style="border-top: none;">
									<label class="ftw400">연도별 매출</label>
								</td>
								<td class="subBtn" style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable('sales');"/></td>
							</tr>
						</table>
					</div>
					<div class="salesTable">
						<input type="hidden" name="lastNum" value="0" />
						<table>
							<tr>
								<td class="tdTitle firstTd">연도</td>
								<td class="tdContents firstTd" colspan="7">
									<select>
										<option></option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="tdTitle">1월</td>
								<td class="tdContents">
									<input type="text" name="salesList[0].Jan" />	
								</td>
								<td class="tdTitle">2월</td>
								<td class="tdContents">
									<input type="text" name="salesList[0].Feb" />	
								</td>
								<td class="tdTitle">3월</td>
								<td class="tdContents">
									<input type="text" name="salesList[0].Mar" />
								</td>	
								<td class="tdTitle">4월</td>
								<td class="tdContents">
									<input type="text" name="salesList[0].Apr" />
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">5월</td>
								<td class="tdContents">
									<input type="text" name="salesList[0].May" />
								</td>
								<td class="tdTitle">6월</td>
								<td class="tdContents">
									<input type="text" name="salesList[0].Jun" />
								</td>
								<td class="tdTitle">7월</td>
								<td class="tdContents">
									<input type="text" name="salesList[0].Jul" />
								</td>
								<td class="tdTitle">8월</td>
								<td class="tdContents">
									<input type="text" name="salesList[0].Aug" />
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle">9월</td>
								<td class="tdContents">
									<input type="text" name="salesList[0].Sep" />
								</td>
								<td class="tdTitle">10월</td>
								<td class="tdContents">
									<input type="text" name="salesList[0].Oct" />
								</td>
								<td class="tdTitle">11월</td>
								<td class="tdContents">
									<input type="text" name="salesList[0].Nov" />
								</td>
								<td class="tdTitle">12월</td>
								<td class="tdContents">
									<input type="text" name="salesList[0].Dec" />
								</td>
							</tr>
							<tr class="dpTbRow sum">
								<td class="tdTitle textalignR" colspan="7"><label>합계</label></td>
								<td class="tdContents textalignR">
									<label>123.456.789</label>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="btnWrap floatR">
					<div class="floatR" onclick="">
						<button type="button"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>		
		</form>
	</div>
</body>
</html>