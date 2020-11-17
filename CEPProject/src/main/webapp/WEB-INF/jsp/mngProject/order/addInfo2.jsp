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
			height: 40px;
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
		
				
		.popContainer .contents tr:nth-child(1) td {
			padding-top: 10px;
			padding-bottom: 5px;
			
		} 
		/* .popContainer .contents tr:nth-child(3) td {
			
			padding-bottom: 5px;
			
		}  */
		/* .popContainer .contents tr:nth-child(4) td {
			padding-top: 20px;
			padding-bottom: 5px;
		}  */
		.popContainer .contents td.subTitle {
			font-size: 18px;
			padding-right: 20px;
			width: 56px;
			padding-top: 20px;
			padding-bottom: 5px;
		}	
		/* 
		.popContainer .contents2 > div:first-child {
			margin: 0 54px 0 45px;
		}
		.popContainer .contents2 > div:first-child table:first-child {
			width: 811px;
			background-color: #f6f7fc;
			position: fixed;
		}
		.popContainer .contents2 > div:first-child table:nth-child(2) {
			padding-top: 64px;
		}
		.popContainer .contents2 > div.btnWrap {
			margin: 0px 54px 15px 0px;
		}
		.popContainer .contents2 td.subTitle {
			font-size: 18px;
			padding-right: 20px;
			width: 56px;
			padding-top: 40px;
		}					
		.popContainer .contents2 td.subBtn {
			padding-top: 40px;
		}		
		.popContainer .contents2 tr:nth-child(1) td {
			border-top: 2px solid #e5e5e5;	
			padding-top: 8px;
		} 		
		.popContainer .contents2 tr:nth-child(2) td {		
			padding-top: 6px;
		} 	
		.popContainer .contents2 tr:last-child td{
			padding-bottom: 10px;
		}
		.popContainer .contents2 {
			position: absolute;
			width: calc(100% - 201px);
			height: 435px;
			top: 238px;
			left: 201px;			
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto;
		} */
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
			var type = "prod";
			var originLength = $('#'+type+'Length').val()*1;
			if(originLength>1){
				table.remove();
				
				$('#'+type+'Length').val($('#'+type+'Length').val()*1 - 1);
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
				<div class="floatL ftw500">발주 추가</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
				<li >발주 정보</li>
			</ul>
		</div>
		<form action="/" id="uploadForm" method="post"> 
			<input type="hidden" id="prodLength" name="prodLength" value="1" />
			<div class="contents">
				<div id="prodWrap">
					<table>
						<tr>		
							<td class="subTitle" style="border-top: none;">
								<label class="ftw500">발주등록</label>
							</td>
							<td class="subBtn" colspan="5"  style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" /></td>
						</tr>
						<tr>
							<td class="tdTitle">프로젝트명</td>
							<td class="tdContents" colspan="3">
								<select name="orderCtClass" style="width: 95px">
									<option value="P">프로젝트</option>
									<option value="M">유지보수</option>
								</select>		
								<input type="text" class="search" style="width: 315px;"/>
								<input type="hidden" name="orderCtFkKey"/>
							</td>
							<td class="tdTitle">고객사</td>
							<td class="tdContents"><input type="text"  /></td>
						</tr>
						<tr>
							<td class="tdTitle">매입처</td>
							<td class="tdContents">
								<input type="text" class="search" />	
							</td>
							<td class="tdTitle">매입처담당자</td>
							<td class="tdContents">
								<select id="sbCtYn" name="sbCtYn">
									<option value="홍길동">홍길동</option>
									<option value="홍길동1">홍길동1</option>
								</select>
							</td>
							<td class="tdTitle">등록자</td>
							<td class="tdContents">
								<select id="sbCtYn" name="sbCtYn">
									<option value="홍길동">홍길동</option>
									<option value="홍길동1">홍길동1</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">발주일자</td>
							<td class="tdContents">
								<input type="text" value="2020-12-12" class="calendar fromDt" />	
							</td>
							<td class="tdTitle">입고일자</td>
							<td class="tdContents">
								<input type="text" value="2020-12-12" class="calendar toDt" />
							</td>
							<td class="tdTitle">결재조건</td>
							<td class="tdContents">
								<input type="text"  />	
							</td>
						</tr>
						<tr>		
							<td class="subTitle" style="border-top: none;">
								<label class="ftw500">제품정보</label>
							</td>
							<td class="subTitle" colspan="5"  style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" onclick="fn_addInfoTable();"/></td>
						</tr>
					</table>
					<div class="prodTable">
						<table>
							<input type="hidden" name="lastNum" value="0" />
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
								<td class="tdTitle">매입구분</td>
								<td class="tdContents">
									<select name="prodList[0].orderCategory">
										<option>매입구분</option>
										<option value="HW">하드웨어</option>
										<option value="SW">소프트웨어</option>
									</select>		
								</td>
							</tr>
							<tr class="dpTbRow">
								<td class="tdTitle lastTd">제품상세</td>
								<td class="tdContents lastTd" colspan="5"><textarea name="prodList[0].mtPmDetail" readonly="readonly"></textarea></td>
							</tr>
							
						</table>
					</div>
				</div>
				<div class="btnWrap floatR">
					<div class="floatR" onclick="writeMtPurchaseAmount();">
						<button ><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>		
		</form>
	</div>
</body>
</html>