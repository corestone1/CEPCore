<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>발주추가</title>
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
			background-color: #fff;
			color: #32bc94;
		}
		.popContainer .contents {
			position: absolute;
			width: calc(100% - 201px);
			height: 131px;
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
			width: 200px;
			height: 40px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('./images/arrow_down.png') no-repeat 91% 50%;
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
			background-image: url('http://172.10.122.10:8888/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer input[class="pname"] {
			width: 170px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
		}
		.popContainer .contents2 input[class="numberTy"] {
			width: 27px;
		}
		.popContainer input[class="calendar"] {
			width: 130px;
			height: 40px;
			background-image: url('http://172.10.122.10:8888/images/calendar_icon.png');
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
			width: 166px;
			font-size: 14px;
		} 				
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
		}
		.popContainer .contents2 textarea {
			width: calc(100% - 22px);
			height: 70px;
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
		<div class="contents">
			<div>
				<table>
					<tr>
						<td class="tdTitle">프로젝트명</td>
						<td class="tdContents" colspan="3"><input type="text" class="search" style="width: 404px;"/></td>
						<td class="tdTitle">고객사</td>
						<td class="tdContents"><input type="text"  /></td>
					</tr>
					<tr>
						<td class="tdTitle">발주일자</td>
						<td class="tdContents">
							<input type="text" value="2020-12-12" class="calendar" />	
						</td>
						<td class="tdTitle">입고일자</td>
						<td class="tdContents">
							<input type="text" value="2020-12-12" class="calendar" />	
						</td>
						<td class="tdTitle">담당자</td>
						<td class="tdContents">
							<input type="text" width="100px" />	
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="contents2">
			<div>
				<table>
					<tr>		
						<td class="subTitle" style="border-top: none;">
							<label class="ftw400">제품정보</label>
						</td>
						<td class="subBtn" colspan="5"  style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" /></td>
					</tr>
				</table>
				<table>
					<tr>
						<td class="tdTitle">제품</td>
						<td class="tdContents">
							<input type="text" class="search" />	
						</td>
						<td class="tdTitle">합계</td>
						<td class="tdContents">
							<input type="text" />	
						</td>
						<td class="tdTitle">수량</td>
						<td class="tdContents">
							<input type="text" style="width: 75px;"/>	
						</td>
					</tr>
					<tr>
						<td class="tdTitle">단가</td>
						<td class="tdContents">
							<input type="text" />
						</td>	
						<td class="tdTitle">부가세 포함</td>
						<td class="tdContents">
							<input type="radio" class="tCheck" name="hasVAT" id="hasVAT1" /><label for="hasVAT1" class="cursorP"></label>&nbsp;&nbsp;Y&nbsp;&nbsp;
							<input type="radio" class="tCheck" name="hasVAT" id="hasVAT2" /><label for="hasVAT2" class="cursorP"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
						</td>	
						<td class="tdTitle">계산서 발행 후</td>
						<td class="tdContents">
							<input type="text" style="width: 27px;"/>&nbsp;&nbsp;일 결제
						</td>
					</tr>
					<tr>
						<td class="tdTitle">매입처</td>
						<td class="tdContents">
							<input type="text" class="search" />	
						</td>
						<td class="tdTitle floatR">매입구분</td>
						<td class="tdContents" colspan="3">
							<input type="text"  value="H/S" readonly="readonly"/>	
						</td>
					</tr>
					<tr>
						<td class="tdTitle">제품상세</td>
						<td class="tdContents" colspan="5"><textarea></textarea></td>
					</tr>
				</table>
				<table>
					<tr>
						<td class="tdTitle">제품</td>
						<td class="tdContents">
							<input type="text" class="search" />	
						</td>
						<td class="tdTitle">합계</td>
						<td class="tdContents">
							<input type="text" />	
						</td>
						<td class="tdTitle">수량</td>
						<td class="tdContents">
							<input type="text" style="width: 75px;"/>	
						</td>
					</tr>
					<tr>
						<td class="tdTitle">단가</td>
						<td class="tdContents">
							<input type="text" />
						</td>	
						<td class="tdTitle">부가세 포함</td>
						<td class="tdContents">
							<input type="radio" class="tCheck" name="hasVAT" id="hasVAT1" /><label for="hasVAT1" class="cursorP"></label>&nbsp;&nbsp;Y&nbsp;&nbsp;
							<input type="radio" class="tCheck" name="hasVAT" id="hasVAT2" /><label for="hasVAT2" class="cursorP"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
						</td>	
						<td class="tdTitle">계산서 발행 후</td>
						<td class="tdContents">
							<input type="text" style="width: 27px;"/>&nbsp;&nbsp;일 결제
						</td>
					</tr>
					<tr>
						<td class="tdTitle">매입처</td>
						<td class="tdContents">
							<input type="text" class="search" />	
						</td>
						<td class="tdTitle floatR">매입구분</td>
						<td class="tdContents" colspan="3">
							<input type="text"  value="H/S" readonly="readonly"/>	
						</td>
					</tr>
					<tr>
						<td class="tdTitle">제품상세</td>
						<td class="tdContents" colspan="5"><textarea></textarea></td>
					</tr>
				</table>
			</div>
			<div class="btnWrap floatR">
				<div class="floatR" onclick="fn_preBiddingView();">
					<button ><img src="<c:url value='/images/btn_bill_mapping.png'/>" /></button>
				</div>
				<div class="floatN floatC"></div>
			</div>
		</div>	
	</div>
</body>
</html>